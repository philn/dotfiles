project('librice',
        'rust',
        'c',
        version: '0.2.1',
        meson_version : '>= 1.1')

cargo = find_program('cargo', version:'>=1.40')
cargo_wrapper = find_program('cargo_wrapper.py')
cargo_c = find_program('cargo-cbuild', version:'>=0.9.21', required: false)

rustc = meson.get_compiler('rust')

if not cargo_c.found()
  error('cargo-c missing, install it with: \'cargo install cargo-c\'')
endif

install_dirs = [get_option('libdir')]
depends = []
extra_env = {}

packages = ['rice-proto', 'rice-io']
features = []
feature_args = []
extra_args = []

if get_option('debug')
  target = 'debug'
else
  target = 'release'
endif

output = ['librice-proto.so', 'librice-io.so']
target_dir = meson.current_build_dir() / 'target'
rice_target = custom_target('librice',
                           build_by_default: true,
                           output: output,
                           console: true,
                           install: true,
                           install_dir: install_dirs,
                           depends: depends,
                           depfile: 'librice.dep',
                           env: extra_env,
                           command: [cargo_wrapper,
                                     'build',
                                     meson.current_build_dir(),
                                     meson.current_source_dir(),
                                     meson.global_build_root(),
                                     target,
                                     get_option('prefix'),
                                     get_option('libdir'),
                                     '--packages', packages,
                                     '--depfile', '@DEPFILE@',
                                     '--target-dir', target_dir,
                                    ] + feature_args + extra_args)
artifacts_dir = target_dir / 'x86_64-unknown-linux-gnu' / target
meson.add_devenv({'PKG_CONFIG_PATH': artifacts_dir, 'LD_LIBRARY_PATH': artifacts_dir}, method: 'prepend')
