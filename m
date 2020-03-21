Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7159B18E179
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2020 14:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgCUNLs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Mar 2020 09:11:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47918 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgCUNLs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Mar 2020 09:11:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9C8F5296F9D
Message-ID: <0b34cecce4f7bed7d502e4d4cde35941ae99263c.camel@collabora.com>
Subject: Re: [RFC PATCH v4l-utils 1/1] Introduce support for meson building
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Sat, 21 Mar 2020 10:11:37 -0300
In-Reply-To: <e7edde336329f8765e3801281bb91e07c754b2b8.camel@ndufresne.ca>
References: <20200315205421.28797-1-ezequiel@collabora.com>
         <20200315205421.28797-2-ezequiel@collabora.com>
         <e7edde336329f8765e3801281bb91e07c754b2b8.camel@ndufresne.ca>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Nicolas!

Thanks for the review.

On Mon, 2020-03-16 at 14:07 -0400, Nicolas Dufresne wrote:
> Le dimanche 15 mars 2020 à 17:54 -0300, Ezequiel Garcia a écrit :
> > Currently supports:
> > 
> > * libdvbv5
> > * libv4l2
> > * libv4lconvert
> > * cec-ctl
> > * cec-compliance
> > * cec-follower
> > * ir-ctl
> > * media-ctl
> > * v4l2-ctl
> > * v4l2-compliance
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  gen-version.sh                      |  36 ++++++++++
> >  lib/libdvbv5/meson.build            |  87 ++++++++++++++++++++++
> >  lib/libv4l2/meson.build             |  43 +++++++++++
> >  lib/libv4lconvert/meson.build       |  79 ++++++++++++++++++++
> >  lib/meson.build                     |   6 ++
> >  meson.build                         | 108 ++++++++++++++++++++++++++++
> >  meson_options.txt                   |  19 +++++
> >  utils/cec-compliance/meson.build    |  39 ++++++++++
> >  utils/cec-ctl/meson.build           |  33 +++++++++
> >  utils/cec-follower/meson.build      |  35 +++++++++
> >  utils/gen_media_bus_format_codes.sh |   7 ++
> >  utils/gen_media_bus_format_names.sh |   7 ++
> >  utils/ir-ctl/meson.build            |  30 ++++++++
> >  utils/libcecutil/meson.build        |  46 ++++++++++++
> >  utils/media-ctl/meson.build         |  35 +++++++++
> >  utils/meson.build                   |  32 +++++++++
> >  utils/v4l2-compliance/meson.build   |  52 ++++++++++++++
> >  utils/v4l2-ctl/meson.build          |  65 +++++++++++++++++
> >  version.h.in                        |   1 +
> >  19 files changed, 760 insertions(+)
> >  create mode 100755 gen-version.sh
> >  create mode 100644 lib/libdvbv5/meson.build
> >  create mode 100644 lib/libv4l2/meson.build
> >  create mode 100644 lib/libv4lconvert/meson.build
> >  create mode 100644 lib/meson.build
> >  create mode 100644 meson.build
> >  create mode 100644 meson_options.txt
> >  create mode 100644 utils/cec-compliance/meson.build
> >  create mode 100644 utils/cec-ctl/meson.build
> >  create mode 100644 utils/cec-follower/meson.build
> >  create mode 100644 utils/gen_media_bus_format_codes.sh
> >  create mode 100644 utils/gen_media_bus_format_names.sh
> >  create mode 100644 utils/ir-ctl/meson.build
> >  create mode 100644 utils/libcecutil/meson.build
> >  create mode 100644 utils/media-ctl/meson.build
> >  create mode 100644 utils/meson.build
> >  create mode 100644 utils/v4l2-compliance/meson.build
> >  create mode 100644 utils/v4l2-ctl/meson.build
> >  create mode 100644 version.h.in
> > 
> > diff --git a/gen-version.sh b/gen-version.sh
> > new file mode 100755
> > index 000000000000..9223ab7d0a32
> > --- /dev/null
> > +++ b/gen-version.sh
> > @@ -0,0 +1,36 @@
> > +#!/bin/sh
> > +# gen-version.sh script taken from the libcamera project.
> > +# Generate a version string using git describe.
> > +#
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +build_dir="$1"
> > +
> > +# Bail out if the directory isn't under git control
> > +src_dir=$(git rev-parse --git-dir 2>&1) || exit 1
> > +src_dir=$(readlink -f "$src_dir/..")
> > +
> > +# Get a short description from the tree.
> > +version=$(git describe --abbrev=8 --match "v[0-9]*" 2>/dev/null)
> > +
> > +if [ -z "$version" ]
> > +then
> > +	# Handle an un-tagged repository
> > +	sha=$(git describe --abbrev=8 --always 2>/dev/null)
> > +	commits=$(git log --oneline | wc -l 2>/dev/null)
> > +	version="v4l-utils-0.0.0-$commits-g$sha"
> > +fi
> > +
> > +# Append a '-dirty' suffix if the working tree is dirty. Prevent false
> > +# positives due to changed timestamps by running git update-index.
> > +if [ -z "$build_dir" ] || (echo "$build_dir" | grep -q "$src_dir")
> > +then
> > +	git update-index --refresh > /dev/null 2>&1
> > +fi
> > +git diff-index --quiet HEAD || version="$version-dirty"
> > +
> > +# Replace first '-' with a '+' to denote build metadata, strip the 'g' in from
> > +# of the git SHA1 and remove the initial 'v'.
> > +version=$(echo "$version" | sed -e 's/-/+/' | sed -e 's/-g/-/' | cut -c 11-)
> > +
> > +echo "$version"
> > diff --git a/lib/libdvbv5/meson.build b/lib/libdvbv5/meson.build
> > new file mode 100644
> > index 000000000000..35eda2da4692
> > --- /dev/null
> > +++ b/lib/libdvbv5/meson.build
> > @@ -0,0 +1,87 @@
> > +libdvbv5_sources = files(
> > +    'compat-soname.c',
> > +    'crc32.c',
> > +    'countries.c',
> > +    'dvb-legacy-channel-format.c',
> > +    'dvb-zap-format.c',
> > +    'dvb-vdr-format.c',
> > +    'dvb-v5.c',
> > +    'dvb-v5.h',
> > +    'parse_string.c',
> > +    'parse_string.h',
> > +    'dvb-demux.c',
> > +    'dvb-dev.c',
> > +    'dvb-dev-local.c',
> > +    'dvb-dev-priv.h',
> > +    'dvb-dev-remote.c',
> > +    'dvb-fe.c',
> > +    'dvb-fe-priv.h',
> > +    'dvb-log.c',
> > +    'dvb-file.c',
> > +    'dvb-v5-std.c',
> > +    'dvb-sat.c',
> > +    'dvb-scan.c',
> > +    'descriptors.c',
> > +    'tables/header.c',
> > +    'tables/pat.c',
> > +    'tables/pmt.c',
> > +    'tables/nit.c',
> > +    'tables/sdt.c',
> > +    'tables/vct.c',
> > +    'tables/mgt.c',
> > +    'tables/eit.c',
> > +    'tables/cat.c',
> > +    'tables/atsc_eit.c',
> > +    'tables/mpeg_ts.c',
> > +    'tables/mpeg_pes.c',
> > +    'tables/mpeg_es.c',
> > +    'descriptors/desc_language.c',
> > +    'descriptors/desc_network_name.c',
> > +    'descriptors/desc_cable_delivery.c',
> > +    'descriptors/desc_sat.c',
> > +    'descriptors/desc_terrestrial_delivery.c',
> > +    'descriptors/desc_t2_delivery.c',
> > +    'descriptors/desc_service.c',
> > +    'descriptors/desc_frequency_list.c',
> > +    'descriptors/desc_event_short.c',
> > +    'descriptors/desc_event_extended.c',
> > +    'descriptors/desc_atsc_service_location.c',
> > +    'descriptors/desc_hierarchy.c',
> > +    'descriptors/desc_extension.c',
> > +    'descriptors/desc_isdbt_delivery.c',
> > +    'descriptors/desc_logical_channel.c',
> > +    'descriptors/desc_ts_info.c',
> > +    'descriptors/desc_partial_reception.c',
> > +    'descriptors/desc_ca.c',
> > +    'descriptors/desc_ca_identifier.c',
> > +)
> > +
> > +libdvbv5_deps = [
> > +    dep_libm,
> > +    dep_threads,
> > +    dep_udev,
> > +]
> > +
> > +libdvbv5_incdir = [
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +libdvbv5_c_args = [
> > +    '-DHAVE_DVBV5_REMOTE',
> > +]
> > +
> > +libdvbv5 = shared_library('dvbv5',
> > +                         libdvbv5_sources,
> > +                         install : true,
> > +			 dependencies : libdvbv5_deps,
> > +                         c_args : libdvbv5_c_args,
> > +                         include_directories : libdvbv5_incdir)
> > +
> > +dep_libdvbv5 = declare_dependency(link_with : libdvbv5)
> > +
> > +pkg.generate(
> > +    name : 'libdvbv5',
> > +    libraries : libdvbv5,
> > +    version : meson.project_version(),
> > +    requires_private : 'libudev',
> > +    description : 'DVBv5 utility library')
> > diff --git a/lib/libv4l2/meson.build b/lib/libv4l2/meson.build
> > new file mode 100644
> > index 000000000000..eefe680620c5
> > --- /dev/null
> > +++ b/lib/libv4l2/meson.build
> > @@ -0,0 +1,43 @@
> > +libv4l2_sources = files(
> > +    'libv4l2.c',
> > +    'log.c',
> > +    'libv4l2-priv.h',
> > +)
> > +
> > +libv4l2_deps = [
> > +    dep_libv4lconvert,
> > +    dep_libdl,
> > +    dep_threads,
> > +]
> > +
> > +libv4l2_incdir = [
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +libv4l2_c_args = []
> > +
> > +if with_v4l_plugins
> > +    libv4l2_sources += files('v4l2-plugin.c')
> > +    libv4l2_plugins_dir = join_paths(get_option('prefix'), get_option('libdir'), 'libv4l/plugins')
> 
> Meson now have the / operator, that allow you do write the same line
> as:
> 
> +    libv4l2_plugins_dir = get_option('prefix') / get_option('libdir') / 'libv4l' / 'plugins'
> 
> Specially that in this case you use the portable join_paths, and then
> have a "libv4l2/plugins" later, which is not very consitent (but this
> is Linux library, so not problematic.
> 

Yup, my bad.

> I'm stopping there, as I'm sure you get the idea how to improve this.

Yup, thanks!

> Nice work.
> 
> > +    libv4l2_c_args += [
> > +        '-DHAVE_V4L_PLUGINS',
> > +        '-DLIBV4L2_PLUGIN_DIR="@0@"'.format(libv4l2_plugins_dir)
> > +    ]
> > +endif
> > +
> > +libv4l2 = shared_library('v4l2',
> > +                         libv4l2_sources,
> > +                         install : true,
> > +                         dependencies : libv4l2_deps,
> > +                         c_args : libv4l2_c_args,
> > +                         include_directories : libv4l2_incdir)
> > +
> > +dep_libv4l2 = declare_dependency(link_with : libv4l2)
> > +
> > +pkg.generate(
> > +    name : 'libv4l2',
> > +    libraries : libv4l2,
> > +    libraries_private : '-lpthread',
> > +    version : meson.project_version(),
> > +    requires_private : 'libv4lconvert',
> > +    description : 'v4l2 device access library')
> > diff --git a/lib/libv4lconvert/meson.build b/lib/libv4lconvert/meson.build
> > new file mode 100644
> > index 000000000000..cd6c4b4574f2
> > --- /dev/null
> > +++ b/lib/libv4lconvert/meson.build
> > @@ -0,0 +1,79 @@
> > +libv4lconvert_sources = files(
> > +    'libv4lconvert.c',
> > +    'tinyjpeg.c',
> > +    'sn9c10x.c',
> > +    'sn9c20x.c',
> > +    'pac207.c',
> > +    'mr97310a.c',
> > +    'flip.c',
> > +    'crop.c',
> > +    'jidctflt.c',
> > +    'spca561-decompress.c',
> > +    'rgbyuv.c',
> > +    'sn9c2028-decomp.c',
> > +    'spca501.c',
> > +    'sq905c.c',
> > +    'bayer.c',
> > +    'hm12.c',
> > +    'stv0680.c',
> > +    'cpia1.c',
> > +    'se401.c',
> > +    'jpgl.c',
> > +    'jpeg.c',
> > +    'jl2005bcd.c',
> > +    'control/libv4lcontrol.c',
> > +    'control/libv4lcontrol.h',
> > +    'control/libv4lcontrol-priv.h',
> > +    'processing/libv4lprocessing.c',
> > +    'processing/whitebalance.c',
> > +    'processing/autogain.c',
> > +    'processing/gamma.c',
> > +    'processing/libv4lprocessing.h',
> > +    'processing/libv4lprocessing-priv.h',
> > +    'helper-funcs.h',
> > +    'libv4lconvert-priv.h',
> > +    'libv4lsyscall-priv.h',
> > +    'tinyjpeg.h',
> > +    'tinyjpeg-internal.h',
> > +)
> > +
> > +libv4lconvert_deps = [
> > +    dep_libm,
> > +    dep_librt,
> > +]
> > +
> > +libv4lconvert_priv_libs = [
> > +    '-lrt',
> > +    '-lm',
> > +]
> > +
> > +libv4lconvert_incdir = [
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +libv4lconvert_c_args = []
> > +
> > +if with_jpeg
> > +    libv4lconvert_deps += dep_jpeg
> > +    libv4lconvert_priv_libs += dep_jpeg_priv_libs
> > +    libv4lconvert_sources += files('jpeg_memsrcdest.c', 'jpeg_memsrcdest.h')
> > +    libv4lconvert_c_args += [
> > +        '-DHAVE_JPEG',
> > +    ]
> > +endif
> > +
> > +libv4lconvert = shared_library('v4lconvert',
> > +                         libv4lconvert_sources,
> > +                         install : true,
> > +			 dependencies : libv4lconvert_deps,
> > +                         c_args : libv4lconvert_c_args,
> > +                         include_directories : libv4lconvert_incdir)
> > +
> > +dep_libv4lconvert = declare_dependency(link_with : libv4lconvert)
> > +
> > +pkg.generate(
> > +    name : 'libv4lconvert',
> > +    libraries : libv4lconvert,
> > +    libraries_private : libv4lconvert_priv_libs,
> > +    version : meson.project_version(),
> > +    description : 'v4l format conversion library')
> > diff --git a/lib/meson.build b/lib/meson.build
> > new file mode 100644
> > index 000000000000..a9c064b2b2dd
> > --- /dev/null
> > +++ b/lib/meson.build
> > @@ -0,0 +1,6 @@
> > +if with_libdvbv5
> > +    subdir('libdvbv5')
> > +endif
> > +
> > +subdir('libv4lconvert')
> > +subdir('libv4l2')
> > diff --git a/meson.build b/meson.build
> > new file mode 100644
> > index 000000000000..8dfa3b7252a5
> > --- /dev/null
> > +++ b/meson.build
> > @@ -0,0 +1,108 @@
> > +project('v4l-utils', 'c', 'cpp',
> > +    version: '1.19.0',
> > +    default_options : [
> > +        'warning_level=1',
> > +    ],
> > +    license : 'LGPL 2.1+')
> > +
> > +cc = meson.get_compiler('c')
> > +pkg = import('pkgconfig')
> > +
> > +conf = configuration_data()
> > +conf.set_quoted('V4L_UTILS_VERSION', meson.project_version())
> > +conf.set('PACKAGE_VERSION', meson.project_version())
> > +
> > +common_arguments = [
> > +    '-Wpointer-arith',
> > +    '-D_GNU_SOURCE',
> > +    '-I.', # Needed for config.h
> > +    '-DPROMOTED_MODE_T=int'
> > +]
> > +
> > +v4l2_utils_incdir = include_directories('include', 'lib/include/')
> 
> You can remove the / at the end.
> 

OK.

> > +
> > +prog_bash = find_program('bash')
> > +prog_perl = find_program('perl')
> > +
> > +dep_libdl = cc.find_library('dl')
> > +dep_libm = cc.find_library('m')
> > +dep_librt = cc.find_library('rt')
> > +dep_threads = dependency('threads')
> > +
> > +have_iconv = false
> > +if cc.has_function('iconv_open')
> > +    dep_iconv = dependency('', required : false)
> > +    have_iconv = true
> > +else
> > +    dep_iconv = cc.find_library('iconv', required : false)
> > +    have_iconv = dep_iconv.found()
> > +endif
> 
> I think iconv should be a feature, this way we could explicitly decide
> to have it or now with -Diconv=disable/disable/auto.
> 
> Feature are important for packagers, as they want to decide which deps
> are included and have the build fail wanted deps is missing. This is
> something usually very badly implemented in custom autotools scripts.
> 

Got it.

> > +
> > +if have_iconv
> > +    conf.set('HAVE_ICONV', 1)
> > +    iconv_const_test = '''#include <iconv.h>
> > +size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
> > +'''
> > +    if cc.compiles(iconv_const_test, dependencies : dep_iconv)
> > +        conf.set('ICONV_CONST', '')
> > +    else
> > +        conf.set('ICONV_CONST', 'const')
> > +    endif
> > +endif
> > +
> > +
> > +# Optional dependencies
> > +dep_jpeg = dependency('libjpeg', required : false)
> 
> Should be a feature.
> 

Got it.

> > +if dep_jpeg.found()
> > +    with_jpeg = true
> > +    dep_jpeg_priv_libs = '-ljpeg'
> 
> Probably imported from autotools, but I don't think you need that,
> meson generate the .pc files properly, and know the private libs.
> with_jpeg should go away, if you use a feature, and pass
> get_option("jpeg") to the required: in dependency() call, then the dep
> object is sufficient.
> 

I was aware of it, however, without this the .pc
lacks -ljpeg:

$ cat build/meson-private/libv4lconvert.pc 
prefix=/usr/local
libdir=${prefix}/lib/x86_64-linux-gnu
includedir=${prefix}/include

Name: libv4lconvert
Description: v4l format conversion library
Version: 1.19.0
Libs: -L${libdir} -lv4lconvert
Libs.private: -lrt -lm
Cflags: -I${includedir}

As I said to Laurent, perhaps we need to report
this upstream but for the time being, it seems needed.

> > +endif
> > +
> > +dep_udev = dependency('libudev', required : false)
> 
> Should also be a feature.
> 

OK.

> > +if dep_udev.found()
> > +    with_udev = true
> > +    with_libdvbv5 = true
> > +else
> > +    with_udev = false
> > +    with_libdvbv5 = false
> > +    warning('udev library not available')
> > +endif
> 
> And all those with_ variable should go away.
> 
> > +
> > +# Found options
> > +with_v4l_plugins = get_option('v4l-plugins')
> 
> You shouldn't hide options, just call get_option when needed.
> 

OK.

> > +
> > +c_arguments = []
> > +cpp_arguments = []
> > +
> > +c_arguments += common_arguments
> > +cpp_arguments += common_arguments
> > +
> > +add_project_arguments(c_arguments, language : 'c')
> > +add_project_arguments(cpp_arguments, language : 'cpp')
> > +add_project_link_arguments(cpp_arguments, language : 'cpp')
> > +
> > +version_h = vcs_tag(command : ['gen-version.sh', meson.build_root()],
> > +                    input : 'version.h.in',
> > +                    output : 'version.h',
> > +                    fallback : meson.project_version())
> > +
> > +subdir('lib')
> > +
> > +if get_option('v4l-utils')
> > +    subdir('utils')
> > +endif
> > +
> > +configure_file(output : 'config.h', configuration : conf)
> > +
> > +message('')
> > +message('  jpeg                       @0@'.format(with_jpeg ? 'yes' : 'no' ))
> > +message('  udev                       @0@'.format(with_udev ? 'yes' : 'no' ))
> > +message('  libdvbv5                   @0@'.format(with_libdvbv5 ? 'yes' : 'no' ))
> > +message('  v4l plugins                @0@'.format(with_v4l_plugins ? 'yes' : 'no' ))
> > +message('  v4l-utils                  @0@'.format(get_option('v4l-utils') ? 'yes' : 'no' ))
> > +if get_option('v4l-utils')
> > +message('  v4l2-compliance-libv4l2    @0@'.format(get_option('v4l2-compliance-libv4l') ? 'yes' : 'no' ))
> > +message('  v4l2-ctl-libv4l            @0@'.format(get_option('v4l2-ctl-libv4l') ? 'yes' : 'no' ))
> > +message('  v4l2-ctl-stream-to         @0@'.format(get_option('v4l2-ctl-stream-to') ? 'yes' : 'no' ))
> > +endif
> 
> Custom reporting is no longer recommended, meson have a option driven
> report (summary). The plus side is that it will be printed at the end
> properly even if this project is used as subproject.
> 

OK.

Thanks,
Ezequiel

> > +message('')
> > diff --git a/meson_options.txt b/meson_options.txt
> > new file mode 100644
> > index 000000000000..93cc71f1592d
> > --- /dev/null
> > +++ b/meson_options.txt
> > @@ -0,0 +1,19 @@
> > +option('v4l-utils',
> > +        type : 'boolean',
> > +        description : 'Enable v4l-utils')
> > +
> > +option('v4l2-compliance-libv4l',
> > +        type : 'boolean',
> > +        description : 'Enable use of libv4l in v4l2-compliance')
> > +
> > +option('v4l2-ctl-libv4l',
> > +        type : 'boolean',
> > +        description : 'Enable use of libv4l in v4l2-ctl')
> > +
> > +option('v4l2-ctl-stream-to',
> > +        type : 'boolean',
> > +        description : 'Enable use of --stream-to in v4l2-ctl')
> > +
> > +option('v4l-plugins',
> > +        type : 'boolean',
> > +        description : 'V4L plugin support')
> > diff --git a/utils/cec-compliance/meson.build b/utils/cec-compliance/meson.build
> > new file mode 100644
> > index 000000000000..fd165586fc0d
> > --- /dev/null
> > +++ b/utils/cec-compliance/meson.build
> > @@ -0,0 +1,39 @@
> > +name = 'cec-compliance'
> > +
> > +cec_compliance_sources = files(
> > +    'cec-compliance.cpp',
> > +    'cec-compliance.h',
> > +    'cec-test.cpp',
> > +    'cec-test-adapter.cpp',
> > +    'cec-test-audio.cpp',
> > +    'cec-test-power.cpp',
> > +    'cec-test-fuzzing.cpp',
> > +)
> > +
> > +cec_compliance_sources += version_h
> > +cec_compliance_deps = [
> > +    dep_libcecutil,
> > +    dep_librt,
> > +]
> > +
> > +cec_compliance_cpp_args = []
> > +
> > +libcecutil_incdir = include_directories('../libcecutil/')
> > +
> > +cec_compliance_incdir = [
> > +    v4l2_utils_incdir,
> > +    libcecutil_incdir,
> > +]
> > +
> > +cec_compliance = executable(name,
> > +                      cec_compliance_sources,
> > +                      install : true,
> > +                      dependencies : cec_compliance_deps,
> > +                      cpp_args : cec_compliance_cpp_args,
> > +                      include_directories : cec_compliance_incdir)
> > +
> > +manpage = configure_file(
> > +    input : name + '.1.in',
> > +    output : name + '.1',
> > +    install_dir : join_paths(get_option('mandir'), 'man1'),
> > +    configuration : conf)
> > diff --git a/utils/cec-ctl/meson.build b/utils/cec-ctl/meson.build
> > new file mode 100644
> > index 000000000000..5030cfd16de9
> > --- /dev/null
> > +++ b/utils/cec-ctl/meson.build
> > @@ -0,0 +1,33 @@
> > +name = 'cec-ctl'
> > +
> > +cec_ctl_sources = files(
> > +    'cec-ctl.cpp',
> > +    'cec-pin.cpp',
> > +    'cec-ctl.h',
> > +)
> > +
> > +cec_ctl_deps = [
> > +    dep_libcecutil,
> > +    dep_librt,
> > +]
> > +cec_ctl_cpp_args = []
> > +
> > +libcecutil_incdir = include_directories('../libcecutil/')
> > +
> > +cec_ctl_incdir = [
> > +    v4l2_utils_incdir,
> > +    libcecutil_incdir,
> > +]
> > +
> > +cec_ctl = executable(name,
> > +                     cec_ctl_sources,
> > +                     install : true,
> > +                     dependencies : cec_ctl_deps,
> > +                     cpp_args : cec_ctl_cpp_args,
> > +		     include_directories : cec_ctl_incdir)
> > +
> > +manpage = configure_file(
> > +    input : name + '.1.in',
> > +    output : name + '.1',
> > +    install_dir : join_paths(get_option('mandir'), 'man1'),
> > +    configuration : conf)
> > diff --git a/utils/cec-follower/meson.build b/utils/cec-follower/meson.build
> > new file mode 100644
> > index 000000000000..bfa707b5d62a
> > --- /dev/null
> > +++ b/utils/cec-follower/meson.build
> > @@ -0,0 +1,35 @@
> > +name = 'cec-follower'
> > +
> > +cec_follower_sources = files(
> > +    'cec-follower.cpp',
> > +    'cec-follower.h',
> > +    'cec-processing.cpp',
> > +    'cec-tuner.cpp',
> > +)
> > +
> > +cec_follower_sources += version_h
> > +cec_follower_deps = [
> > +    dep_libcecutil,
> > +    dep_librt,
> > +]
> > +cec_follower_cpp_args = []
> > +
> > +libcecutil_incdir = include_directories('../libcecutil/')
> > +
> > +cec_follower_incdir = [
> > +    v4l2_utils_incdir,
> > +    libcecutil_incdir,
> > +]
> > +
> > +cec_follower = executable(name,
> > +                      cec_follower_sources,
> > +                      install : true,
> > +                      dependencies : cec_follower_deps,
> > +                      cpp_args : cec_follower_cpp_args,
> > +		      include_directories : cec_follower_incdir)
> > +
> > +manpage = configure_file(
> > +    input : name + '.1.in',
> > +    output : name + '.1',
> > +    install_dir : join_paths(get_option('mandir'), 'man1'),
> > +    configuration : conf)
> > diff --git a/utils/gen_media_bus_format_codes.sh b/utils/gen_media_bus_format_codes.sh
> > new file mode 100644
> > index 000000000000..18d1e9f3f317
> > --- /dev/null
> > +++ b/utils/gen_media_bus_format_codes.sh
> > @@ -0,0 +1,7 @@
> > +#!/bin/sh
> > +
> > +src="$1"
> > +
> > +sed -e \
> > +'/#define MEDIA_BUS_FMT/ ! d; s/.*#define //; /FIXED/ d; s/\t.*//; s/.*/ &,/;' \
> > +${src}
> > diff --git a/utils/gen_media_bus_format_names.sh b/utils/gen_media_bus_format_names.sh
> > new file mode 100644
> > index 000000000000..79cb16756bc3
> > --- /dev/null
> > +++ b/utils/gen_media_bus_format_names.sh
> > @@ -0,0 +1,7 @@
> > +#!/bin/sh
> > +
> > +src="$1"
> > +
> > +sed -e \
> > +'/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
> > +${src}
> > diff --git a/utils/ir-ctl/meson.build b/utils/ir-ctl/meson.build
> > new file mode 100644
> > index 000000000000..3c0db8aa769a
> > --- /dev/null
> > +++ b/utils/ir-ctl/meson.build
> > @@ -0,0 +1,30 @@
> > +name = 'ir-ctl'
> > +
> > +ir_ctl_sources = files(
> > +    'ir-ctl.c',
> > +    'ir-encode.c',
> > +    'ir-encode.h',
> > +    'toml.c',
> > +    'toml.h',
> > +    'keymap.c',
> > +    'keymap.h',
> > +    'bpf_encoder.c',
> > +    'bpf_encoder.h'
> > +)
> > +
> > +ir_ctl_deps = []
> > +ir_ctl_cpp_args = []
> > +ir_ctl_incdir = []
> > +
> > +ir_ctl = executable(name,
> > +                    ir_ctl_sources,
> > +                    install : true,
> > +                    dependencies : ir_ctl_deps,
> > +                    cpp_args : ir_ctl_cpp_args,
> > +		    include_directories : ir_ctl_incdir)
> > +
> > +manpage = configure_file(
> > +    input : name + '.1.in',
> > +    output : name + '.1',
> > +    install_dir : join_paths(get_option('mandir'), 'man1'),
> > +    configuration : conf)
> > diff --git a/utils/libcecutil/meson.build b/utils/libcecutil/meson.build
> > new file mode 100644
> > index 000000000000..097cb274cfa3
> > --- /dev/null
> > +++ b/utils/libcecutil/meson.build
> > @@ -0,0 +1,46 @@
> > +libcecutil_sources = files(
> > +    'cec-info.cpp',
> > +    'cec-log.cpp',
> > +    'cec-parse.cpp',
> > +    'cec-info.h',
> > +    'cec-log.h',
> > +    'cec-parse.h',
> > +    'cec-htng.h',
> > +    'cec-htng-funcs.h',
> > +)
> > +
> > +libcecutil_deps = [
> > +    dep_libv4lconvert,
> > +    dep_libdl,
> > +    dep_threads,
> > +]
> > +
> > +libcecutil_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +libcecutil_c_args = []
> > +
> > +cec_gen_sources = files(
> > +    '../../include/linux/cec.h',
> > +    'cec-htng.h',
> > +    '../../include/linux/cec-funcs.h',
> > +    'cec-htng-funcs.h',
> > +)
> > +
> > +configure_file(
> > +    input : 'cec-gen.pl',
> > +    output : 'cec-gen-dummy.stamp',
> > +    command: [
> > +        prog_perl, '@INPUT@', cec_gen_sources, 'utils/libcecutil'
> > +    ]
> > +)
> > +
> > +libcecutil = static_library('cecutil',
> > +                         libcecutil_sources,
> > +                         install : true,
> > +                         dependencies : libcecutil_deps,
> > +                         c_args : libcecutil_c_args,
> > +                         include_directories : libcecutil_incdir)
> > +dep_libcecutil = declare_dependency(link_with : libcecutil)
> > diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> > new file mode 100644
> > index 000000000000..258aea7bea3f
> > --- /dev/null
> > +++ b/utils/media-ctl/meson.build
> > @@ -0,0 +1,35 @@
> > +libmediactl_sources = files(
> > +    'libmediactl.c',
> > +    'mediactl-priv.h',
> > +)
> > +
> > +libmediactl_deps = []
> > +
> > +libmediactl = static_library('mediactl',
> > +                             libmediactl_sources,
> > +                             dependencies : libmediactl_deps)
> > +
> > +pkg.generate(
> > +    name : 'libmediactl',
> > +    libraries : libmediactl,
> > +    version : meson.project_version(),
> > +    description : 'Media controller library')
> > +
> > +libv4l2subdev_sources = files('libv4l2subdev.c')
> > +libv4l2subdev_sources += media_bus_format_names_h
> > +libv4l2subdev_sources += media_bus_format_codes_h
> > +
> > +libv4l2subdev = static_library('v4l2subdev',
> > +                               libv4l2subdev_sources)
> > +
> > +media_ctl_sources = files(
> > +    'media-ctl.c',
> > +    'options.c',
> > +    'options.h',
> > +    'tools.h',
> > +)
> > +
> > +media_ctl = executable('media-ctl',
> > +                       media_ctl_sources,
> > +                       install : true,
> > +		       link_with : [libmediactl, libv4l2subdev])
> > diff --git a/utils/meson.build b/utils/meson.build
> > new file mode 100644
> > index 000000000000..d4bb4b50142d
> > --- /dev/null
> > +++ b/utils/meson.build
> > @@ -0,0 +1,32 @@
> > +utils_common_incdir = include_directories('common')
> > +
> > +# Generate targets for media-bus-format-{names,codes}.h
> > +foreach x: [ 'names', 'codes' ]
> > +    output_file = 'media-bus-format-@0@.h'.format(x)
> > +    input_file = 'gen_media_bus_format_@0@.sh'.format(x)
> > +
> > +    target = custom_target(
> > +        output_file,
> > +        output : output_file,
> > +        input : input_file,
> > +	command : [
> > +            prog_bash, '@INPUT@', files('../include/linux/media-bus-format.h'),
> > +        ],
> > +        capture : true,
> > +    )
> > +    set_variable(output_file.underscorify(), target)
> > +endforeach
> > +
> > +# Libraries
> > +subdir('libcecutil')
> > +
> > +# Utils
> > +subdir('cec-ctl')
> > +subdir('cec-follower')
> > +subdir('ir-ctl')
> > +subdir('media-ctl')
> > +subdir('v4l2-ctl')
> > +
> > +# Compliance tools
> > +subdir('cec-compliance')
> > +subdir('v4l2-compliance')
> > diff --git a/utils/v4l2-compliance/meson.build b/utils/v4l2-compliance/meson.build
> > new file mode 100644
> > index 000000000000..534b7bf4cb4e
> > --- /dev/null
> > +++ b/utils/v4l2-compliance/meson.build
> > @@ -0,0 +1,52 @@
> > +name = 'v4l2-compliance'
> > +
> > +v4l2_compliance_sources = files(
> > +    'v4l2-compliance.cpp',
> > +    'v4l2-compliance.h',
> > +    'v4l2-test-debug.cpp',
> > +    'v4l2-test-input-output.cpp',
> > +    'v4l2-test-controls.cpp',
> > +    'v4l2-test-io-config.cpp',
> > +    'v4l2-test-formats.cpp',
> > +    'v4l2-test-buffers.cpp',
> > +    'v4l2-test-codecs.cpp',
> > +    'v4l2-test-subdevs.cpp',
> > +    'v4l2-test-media.cpp',
> > +    'v4l2-test-colors.cpp',
> > +    'media-info.cpp',
> > +    'v4l2-info.cpp',
> > +)
> > +
> > +v4l2_compliance_sources += version_h
> > +v4l2_compliance_deps = [
> > +    dep_librt,
> > +    dep_threads,
> > +]
> > +v4l2_compliance_cpp_args = []
> > +
> > +if get_option('v4l2-compliance-libv4l')
> > +    v4l2_compliance_deps += dep_libv4lconvert
> > +    v4l2_compliance_deps += dep_libv4l2
> > +else
> > +    v4l2_compliance_cpp_args += '-DNO_LIBV4L2'
> > +endif
> > +
> > +common_incdir = include_directories('../common')
> > +
> > +v4l2_compliance_incdir = [
> > +    common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +v4l2_compliance = executable(name,
> > +                      v4l2_compliance_sources,
> > +                      install : true,
> > +                      dependencies : v4l2_compliance_deps,
> > +                      cpp_args : v4l2_compliance_cpp_args,
> > +                      include_directories : v4l2_compliance_incdir)
> > +
> > +manpage = configure_file(
> > +    input : name + '.1.in',
> > +    output : name + '.1',
> > +    install_dir : join_paths(get_option('mandir'), 'man1'),
> > +    configuration : conf)
> > diff --git a/utils/v4l2-ctl/meson.build b/utils/v4l2-ctl/meson.build
> > new file mode 100644
> > index 000000000000..1bbc7fe44313
> > --- /dev/null
> > +++ b/utils/v4l2-ctl/meson.build
> > @@ -0,0 +1,65 @@
> > +name = 'v4l2-ctl'
> > +
> > +v4l2_ctl_sources = files(
> > +    'v4l2-ctl.cpp',
> > +    'v4l2-ctl.h',
> > +    'v4l2-ctl-common.cpp',
> > +    'v4l2-ctl-tuner.cpp',
> > +    'v4l2-ctl-io.cpp',
> > +    'v4l2-ctl-stds.cpp',
> > +    'v4l2-ctl-vidcap.cpp',
> > +    'v4l2-ctl-vidout.cpp',
> > +    'v4l2-ctl-overlay.cpp',
> > +    'v4l2-ctl-vbi.cpp',
> > +    'v4l2-ctl-selection.cpp',
> > +    'v4l2-ctl-misc.cpp',
> > +    'v4l2-ctl-streaming.cpp',
> > +    'v4l2-ctl-sdr.cpp',
> > +    'v4l2-ctl-edid.cpp',
> > +    'v4l2-ctl-modes.cpp',
> > +    'v4l2-ctl-subdev.cpp',
> > +    'v4l2-tpg-colors.c',
> > +    'v4l2-tpg-core.c',
> > +    'v4l-stream.c',
> > +    'v4l2-ctl-meta.cpp',
> > +    'media-info.cpp',
> > +    'v4l2-info.cpp',
> > +    'codec-fwht.c',
> > +    'codec-v4l2-fwht.c',
> > +)
> > +v4l2_ctl_sources += media_bus_format_names_h
> > +
> > +v4l2_ctl_deps = [
> > +    dep_librt,
> > +    dep_threads,
> > +]
> > +v4l2_ctl_cpp_args = []
> > +
> > +if get_option('v4l2-ctl-libv4l')
> > +    v4l2_ctl_deps += dep_libv4lconvert
> > +    v4l2_ctl_deps += dep_libv4l2
> > +else
> > +    v4l2_ctl_cpp_args += '-DNO_LIBV4L2'
> > +endif
> > +
> > +if not get_option('v4l2-ctl-stream-to')
> > +    v4l2_ctl_cpp_args += '-DNO_STREAM_TO'
> > +endif
> > +
> > +v4l2_ctl_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +v4l2_ctl = executable(name,
> > +                      v4l2_ctl_sources,
> > +                      install : true,
> > +                      dependencies : v4l2_ctl_deps,
> > +                      cpp_args : v4l2_ctl_cpp_args,
> > +		      include_directories : v4l2_ctl_incdir)
> > +
> > +manpage = configure_file(
> > +    input : name + '.1.in',
> > +    output : name + '.1',
> > +    install_dir : join_paths(get_option('mandir'), 'man1'),
> > +    configuration : conf)
> > diff --git a/version.h.in b/version.h.in
> > new file mode 100644
> > index 000000000000..2506ed9bc6cc
> > --- /dev/null
> > +++ b/version.h.in
> > @@ -0,0 +1 @@
> > +#define SHA @VCS_TAG@


