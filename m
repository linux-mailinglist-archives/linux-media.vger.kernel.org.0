Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325B5693A19
	for <lists+linux-media@lfdr.de>; Sun, 12 Feb 2023 22:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjBLVAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Feb 2023 16:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjBLVAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Feb 2023 16:00:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCB6EB7E
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 13:00:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BEFA4DD;
        Sun, 12 Feb 2023 22:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676235631;
        bh=5AUXKSNwpcwCAsNzho81VrfTeRojKxwAeriW3aLmxbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z91BCb9NScOSzEVVSIciUmJMgnqhdRabU69xOus0U7BHh4+lmJw03mP9QKUM3jUuL
         Y8RLaKDuUhls8o8YQ2hBXaZ7LaCti7t4Pkjy0nsVG+TZcdwa2W4PHho4W3iGpeC3ft
         BRdctqZkgo4kegXMUb/C5bBIgwzxT4Qne2Xr4yRw=
Date:   Sun, 12 Feb 2023 23:00:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Deborah Brouwer <deborah.brouwer@collabora.com>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
Subject: Re: [v4l-utils] [PATCH v8 3/6] Add support for meson building
Message-ID: <Y+lTbtKa+95R+a0n@pendragon.ideasonboard.com>
References: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
 <20230212005137.12025-4-laurent.pinchart@ideasonboard.com>
 <Y+icmJg1gCUG0q6n@xps>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+icmJg1gCUG0q6n@xps>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deborah,

On Sun, Feb 12, 2023 at 12:23:39PM -0800, Deborah Brouwer wrote:
> Hi Laurent,
> Thank you for your work to move the v4l2-tracer into the meson build.
> I noticed a problem below but I think it is easy to fix.
> 
> On Sun, Feb 12, 2023 at 02:51:34AM +0200, Laurent Pinchart wrote:
> > From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > 
> > Supports building libraries and tools found in contrib/, lib/ and
> > utils/ directories, along with the implemented gettext translations.
> > 
> > Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Acked-by: Gregor Jasny <gjasny@googlemail.com>
> > [Gregor: Control symbol visibility]
> > Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
> > Tested-by: Gregor Jasny <gjasny@googlemail.com>
> > Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v7:
> > 
> > - Make v4l2gl conditional on dep_gl and dep_libudev
> > - Fix udev dependency handling
> > - Add comment about switching to install_emptydir()
> > - Use meson's native dependency('iconv') when possible
> > - Properly test for visibility support
> > - Add v4l2-tracer
> > - Add v4l-wrappers option
> > - Simplify check for libdvbv5 option
> > - Drop unused variables dep_v4l1compat and dep_v4l2convert
> > - Push handling of have_qt5_opengl and have_fork in subdirs
> > - Add summary
> > - White space fixes
> > 
> > Changes since v6:
> > 
> > - Generate v4l-utils.spec
> > 
> > Changes since v5:
> > 
> > - Drop unneeded bpf option check
> > - Avoid double-quoting strings
> > - Use external_program object directly without calling path()
> > - Specify check kwarg to run_command()
> > - Replace deprecated get_cross_property() with get_external_property()
> > - Fix SDL dependency fallback check
> > - Set the default build type to debugoptimized
> > ---
> >  .gitignore                                    |   1 +
> >  INSTALL.meson.md                              | 142 +++++++
> >  README.md                                     |  83 +++-
> >  contrib/cobalt-ctl/meson.build                |   8 +
> >  contrib/decode_tm6000/meson.build             |  14 +
> >  contrib/gconv/meson.build                     |  44 ++
> >  contrib/meson.build                           |  13 +
> >  contrib/rds-saa6588/meson.build               |   7 +
> >  contrib/test/meson.build                      | 143 +++++++
> >  contrib/xc3028-firmware/meson.build           |  11 +
> >  lib/libdvbv5/meson.build                      | 156 +++++++
> >  lib/libv4l-mplane/meson.build                 |  23 +
> >  lib/libv4l1/meson.build                       |  64 +++
> >  lib/libv4l2/meson.build                       |  73 ++++
> >  lib/libv4l2rds/meson.build                    |  37 ++
> >  lib/libv4lconvert/meson.build                 | 117 ++++++
> >  lib/meson.build                               |  11 +
> >  libdvbv5-po/meson.build                       |   3 +
> >  meson.build                                   | 396 ++++++++++++++++++
> >  meson_options.txt                             |  46 ++
> >  utils/cec-compliance/meson.build              |  23 +
> >  utils/cec-ctl/meson.build                     |  18 +
> >  utils/cec-follower/meson.build                |  19 +
> >  utils/cx18-ctl/meson.build                    |   8 +
> >  utils/dvb/meson.build                         |  70 ++++
> >  utils/gen_media_bus_format_codes.sh           |   7 +
> >  utils/gen_media_bus_format_names.sh           |   7 +
> >  utils/ir-ctl/meson.build                      |  23 +
> >  utils/ivtv-ctl/meson.build                    |  13 +
> >  .../bpf_protocols/clang_sys_includes.sh       |   9 +
> >  utils/keytable/bpf_protocols/meson.build      |  31 ++
> >  utils/keytable/meson.build                    |  85 ++++
> >  utils/keytable/rc_keymaps/meson.build         | 150 +++++++
> >  utils/libcecutil/meson.build                  |  45 ++
> >  utils/libmedia_dev/meson.build                |  14 +
> >  utils/libv4l2util/meson.build                 |  16 +
> >  utils/media-ctl/meson.build                   |  43 ++
> >  utils/meson.build                             |  43 ++
> >  utils/qv4l2/meson.build                       |  79 ++++
> >  utils/qvidcap/meson.build                     |  87 ++++
> >  utils/rds-ctl/meson.build                     |  17 +
> >  utils/v4l2-compliance/meson.build             |  63 +++
> >  utils/v4l2-ctl/meson.build                    |  75 ++++
> >  utils/v4l2-dbg/meson.build                    |  20 +
> >  utils/v4l2-sysfs-path/meson.build             |  14 +
> >  utils/v4l2-tracer/media-info.cpp              |   1 +
> >  utils/v4l2-tracer/meson.build                 | 133 ++++++
> >  utils/v4l2-tracer/v4l2-info.cpp               |   1 +
> >  v4l-utils-po/meson.build                      |   3 +
> >  49 files changed, 2493 insertions(+), 16 deletions(-)
> >  create mode 100644 INSTALL.meson.md
> >  create mode 100644 contrib/cobalt-ctl/meson.build
> >  create mode 100644 contrib/decode_tm6000/meson.build
> >  create mode 100644 contrib/gconv/meson.build
> >  create mode 100644 contrib/meson.build
> >  create mode 100644 contrib/rds-saa6588/meson.build
> >  create mode 100644 contrib/test/meson.build
> >  create mode 100644 contrib/xc3028-firmware/meson.build
> >  create mode 100644 lib/libdvbv5/meson.build
> >  create mode 100644 lib/libv4l-mplane/meson.build
> >  create mode 100644 lib/libv4l1/meson.build
> >  create mode 100644 lib/libv4l2/meson.build
> >  create mode 100644 lib/libv4l2rds/meson.build
> >  create mode 100644 lib/libv4lconvert/meson.build
> >  create mode 100644 lib/meson.build
> >  create mode 100644 libdvbv5-po/meson.build
> >  create mode 100644 meson.build
> >  create mode 100644 meson_options.txt
> >  create mode 100644 utils/cec-compliance/meson.build
> >  create mode 100644 utils/cec-ctl/meson.build
> >  create mode 100644 utils/cec-follower/meson.build
> >  create mode 100644 utils/cx18-ctl/meson.build
> >  create mode 100644 utils/dvb/meson.build
> >  create mode 100755 utils/gen_media_bus_format_codes.sh
> >  create mode 100755 utils/gen_media_bus_format_names.sh
> >  create mode 100644 utils/ir-ctl/meson.build
> >  create mode 100644 utils/ivtv-ctl/meson.build
> >  create mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
> >  create mode 100644 utils/keytable/bpf_protocols/meson.build
> >  create mode 100644 utils/keytable/meson.build
> >  create mode 100644 utils/keytable/rc_keymaps/meson.build
> >  create mode 100644 utils/libcecutil/meson.build
> >  create mode 100644 utils/libmedia_dev/meson.build
> >  create mode 100644 utils/libv4l2util/meson.build
> >  create mode 100644 utils/media-ctl/meson.build
> >  create mode 100644 utils/meson.build
> >  create mode 100644 utils/qv4l2/meson.build
> >  create mode 100644 utils/qvidcap/meson.build
> >  create mode 100644 utils/rds-ctl/meson.build
> >  create mode 100644 utils/v4l2-compliance/meson.build
> >  create mode 100644 utils/v4l2-ctl/meson.build
> >  create mode 100644 utils/v4l2-dbg/meson.build
> >  create mode 100644 utils/v4l2-sysfs-path/meson.build
> >  create mode 120000 utils/v4l2-tracer/media-info.cpp
> >  create mode 100644 utils/v4l2-tracer/meson.build
> >  create mode 120000 utils/v4l2-tracer/v4l2-info.cpp
> >  create mode 100644 v4l-utils-po/meson.build
> > 
> 
> <snip>
> 
> > diff --git a/utils/v4l2-tracer/media-info.cpp b/utils/v4l2-tracer/media-info.cpp
> > new file mode 120000
> > index 000000000000..89676ff50494
> > --- /dev/null
> > +++ b/utils/v4l2-tracer/media-info.cpp
> > @@ -0,0 +1 @@
> > +../common/media-info.cpp
> > \ No newline at end of file
> > diff --git a/utils/v4l2-tracer/meson.build b/utils/v4l2-tracer/meson.build
> > new file mode 100644
> > index 000000000000..dc16526220ca
> > --- /dev/null
> > +++ b/utils/v4l2-tracer/meson.build
> > @@ -0,0 +1,133 @@
> > +if not dep_jsonc.found()
> > +    subdir_done()
> > +endif
> > +
> > +# Generated sources
> > +
> > +v4l2_tracer_gen = files('v4l2-tracer-gen.pl')
> > +
> > +# Don't reorder the inputs The order of the input headers matters
> > +v4l2_tracer_gen_inputs = files(
> > +    '..' / '..' / 'include' / 'linux' / 'v4l2-controls.h',
> > +    '..' / '..' / 'include' / 'linux' / 'videodev2.h',
> > +    '..' / '..' / 'include' / 'linux' / 'media.h',
> > +    '..' / '..' / 'include' / 'linux' / 'v4l2-common.h',
> > +)
> > +
> > +v4l2_tracer_gen_common_sources = custom_target('v4l2-tracer-gen-common-sources',
> > +                                               input : v4l2_tracer_gen_inputs,
> > +                                               output : ['v4l2-tracer-info-gen.h'],
> > +                                               command : [
> > +                                                   v4l2_tracer_gen,
> > +                                                  '-o', meson.current_build_dir(),
> > +                                                    '-t', 'common',
> > +                                                   '@INPUT@',
> > +                                               ])
> > +
> > +v4l2_tracer_gen_retrace_sources = custom_target('v4l2-tracer-gen-retrace-sources',
> > +                                                input : v4l2_tracer_gen_inputs,
> > +                                                output : ['retrace-gen.cpp', 'retrace-gen.h'],
> > +                                                command : [
> > +                                                    v4l2_tracer_gen,
> > +                                                    '-o', meson.current_build_dir(),
> > +                                                    '-t', 'retrace',
> > +                                                    '@INPUT@',
> > +                                                ])
> > +
> > +v4l2_tracer_gen_trace_sources = custom_target('v4l2-tracer-gen-trace-sources',
> > +                                              input : v4l2_tracer_gen_inputs,
> > +                                              output : ['trace-gen.cpp', 'trace-gen.h'],
> > +                                              command : [
> > +                                                  v4l2_tracer_gen,
> > +                                                  '-o', meson.current_build_dir(),
> > +                                                  '-t', 'trace',
> > +                                                  '@INPUT@',
> > +                                              ])
> > +
> > +# V4L2 tracer library
> > +
> > +libv4l2tracer_sources = files(
> > +    'libv4l2tracer.cpp',
> > +    'media-info.cpp',
> > +    'trace-helper.cpp',
> > +    'trace.cpp',
> > +    'v4l2-info.cpp',
> > +    'v4l2-tracer-common.cpp',
> > +)
> > +
> > +libv4l2tracer_sources += [
> > +    v4l2_tracer_gen_common_sources,
> > +    v4l2_tracer_gen_trace_sources,
> > +]
> > +
> > +libv4l2tracer_deps = [
> > +    dep_jsonc,
> > +    dep_libdl,
> > +]
> > +
> > +libv4l2_tracer_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +libv4l2_tracer_cpp_args = [
> > +    # Meson enables large file support unconditionally, which redirects file
> > +    # operations to 64-bit versions. This results in some symbols being
> > +    # renamed, for instance open() being renamed to open64(). As the library
> > +    # needs to provide both 32-bit and 64-bit versions of file operations,
> > +    # disable transparent large file support.
> > +    '-U_FILE_OFFSET_BITS',
> > +    '-D_FILE_OFFSET_BITS=32',
> > +    '-D_LARGEFILE64_SOURCE',
> > +]
> > +
> > +libv4l2tracer = shared_module('v4l2tracer',
> > +                              libv4l2tracer_sources,
> > +                              install : true,
> > +                              cpp_args : libv4l2_tracer_cpp_args,
> > +                              dependencies : libv4l2tracer_deps,
> > +                              include_directories : libv4l2_tracer_incdir)
> > +
> > +# Command line tool
> > +
> > +v4l2_tracer_sources = files(
> > +    'media-info.cpp',
> > +    'retrace-helper.cpp',
> > +    'retrace.cpp',
> > +    'v4l2-info.cpp',
> > +    'v4l2-tracer-common.cpp',
> > +    'v4l2-tracer.cpp',
> > +)
> > +
> > +v4l2_tracer_sources += [
> > +    v4l2_tracer_gen_common_sources,
> > +    v4l2_tracer_gen_retrace_sources,
> > +]
> > +
> > +v4l2_tracer_deps = [
> > +    dep_jsonc,
> > +    dep_librt,
> > +    dep_threads,
> > +]
> > +
> > +v4l2_tracer_cpp_args = [
> > +    '-DLIBTRACER_PATH="@0@"'.format(get_option('libdir')),
> > +]
> 
> After the meson build the v4l2-tracer can't find its library to preload,
> so no tracing happens. But if you change this line like this it will work again:
> 
> '-DLIBTRACER_PATH=@0@'.format(get_option('prefix')/get_option('libdir')),

Good point. I'll do this in v9.

> > +
> > +if have_visibility
> > +    v4l2_tracer_cpp_args += ['-fvisibility=hidden']
> > +endif
> > +
> > +v4l2_tracer_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +v4l2_tracer = executable('v4l2-tracer',
> > +                         v4l2_tracer_sources,
> > +                         install : true,
> > +                         dependencies : v4l2_tracer_deps,
> > +                         cpp_args : v4l2_tracer_cpp_args,
> > +                         include_directories : v4l2_tracer_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'v4l2-tracer', 1 ]]
> > diff --git a/utils/v4l2-tracer/v4l2-info.cpp b/utils/v4l2-tracer/v4l2-info.cpp
> > new file mode 120000
> > index 000000000000..c87caf75bbfd
> > --- /dev/null
> > +++ b/utils/v4l2-tracer/v4l2-info.cpp
> > @@ -0,0 +1 @@
> > +../common/v4l2-info.cpp
> > \ No newline at end of file
> > diff --git a/v4l-utils-po/meson.build b/v4l-utils-po/meson.build
> > new file mode 100644
> > index 000000000000..4fad42eb0b4a
> > --- /dev/null
> > +++ b/v4l-utils-po/meson.build
> > @@ -0,0 +1,3 @@
> > +i18n.gettext('v4l-utils',
> > +    args : i18n_gettext_arguments,
> > +)

-- 
Regards,

Laurent Pinchart
