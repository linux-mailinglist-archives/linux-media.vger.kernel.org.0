Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485EF343218
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 12:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhCULRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 07:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCULRI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 07:17:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03840C061574
        for <linux-media@vger.kernel.org>; Sun, 21 Mar 2021 04:17:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AE7F6EF;
        Sun, 21 Mar 2021 12:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616325424;
        bh=6kj8VLcPIuiL3h5g3MLVQ6IKmEClsMs0k67qVSorf/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZHFQcUuLHYu4c/QvdCG39iMITa5a/NvWpDeFmRqyleTuMBL8ekX0ytM5IU1iczHxQ
         uCb1s4i28ErpApuM9QHWpwb1hiduQCsa77BkAjT7K/D48Fo2K6idsjCwvOHaSpOrbi
         II6KTOIIIau6lkRomSfAL6+cm21Ceq/H+k0RZe0I=
Date:   Sun, 21 Mar 2021 13:16:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi
Subject: Re: [v4l-utils v4 2/5] Add support for meson building
Message-ID: <YFcrCADb5+CfkTDB@pendragon.ideasonboard.com>
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
 <20210317172227.620584-3-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210317172227.620584-3-ariel.dalessandro@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ariel,

Thank you for the patch.

On Wed, Mar 17, 2021 at 02:22:24PM -0300, Ariel D'Alessandro wrote:
> Supports building libraries and tools found in contrib/, lib/ and
> utils/ directories, along with the implemented gettext translations.
> 
> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Acked-by: Gregor Jasny <gjasny@googlemail.com>
> [Gregor: Control symbol visibility]
> Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .gitignore                                    |   1 +
>  INSTALL.meson.md                              | 118 +++++++
>  README.md                                     |  83 ++++-
>  contrib/cobalt-ctl/meson.build                |   8 +
>  contrib/decode_tm6000/meson.build             |  14 +
>  contrib/gconv/meson.build                     |  44 +++
>  contrib/meson.build                           |  13 +
>  contrib/rds-saa6588/meson.build               |   7 +
>  contrib/test/meson.build                      | 143 ++++++++
>  contrib/xc3028-firmware/meson.build           |  11 +
>  lib/libdvbv5/meson.build                      | 158 +++++++++
>  lib/libv4l-mplane/meson.build                 |  23 ++
>  lib/libv4l1/meson.build                       |  61 ++++
>  lib/libv4l2/meson.build                       |  70 ++++
>  lib/libv4l2rds/meson.build                    |  36 ++
>  lib/libv4lconvert/meson.build                 | 117 +++++++
>  lib/meson.build                               |  11 +
>  libdvbv5-po/meson.build                       |   3 +
>  meson.build                                   | 315 ++++++++++++++++++
>  meson_options.txt                             |  42 +++
>  utils/cec-compliance/meson.build              |  22 ++
>  utils/cec-ctl/meson.build                     |  18 +
>  utils/cec-follower/meson.build                |  19 ++
>  utils/cx18-ctl/meson.build                    |   8 +
>  utils/dvb/meson.build                         |  70 ++++
>  utils/gen_media_bus_format_codes.sh           |   7 +
>  utils/gen_media_bus_format_names.sh           |   7 +
>  utils/ir-ctl/meson.build                      |  23 ++
>  utils/ivtv-ctl/meson.build                    |  13 +
>  .../bpf_protocols/clang_sys_includes.sh       |   9 +
>  utils/keytable/bpf_protocols/meson.build      |  39 +++
>  .../user_dir_protocols/README.md              |   1 +
>  utils/keytable/meson.build                    |  76 +++++
>  utils/keytable/rc_keymaps/meson.build         | 151 +++++++++
>  utils/libcecutil/meson.build                  |  45 +++
>  utils/libmedia_dev/meson.build                |  14 +
>  utils/libv4l2util/meson.build                 |  16 +
>  utils/media-ctl/meson.build                   |  43 +++
>  utils/meson.build                             |  46 +++
>  utils/qv4l2/meson.build                       |  80 +++++
>  utils/qvidcap/meson.build                     |  82 +++++
>  utils/rds-ctl/meson.build                     |  13 +
>  utils/v4l2-compliance/meson.build             |  58 ++++
>  utils/v4l2-ctl/meson.build                    |  75 +++++
>  utils/v4l2-dbg/meson.build                    |  16 +
>  utils/v4l2-sysfs-path/meson.build             |  14 +
>  v4l-utils-po/meson.build                      |   3 +
>  47 files changed, 2230 insertions(+), 16 deletions(-)
>  create mode 100644 INSTALL.meson.md
>  create mode 100644 contrib/cobalt-ctl/meson.build
>  create mode 100644 contrib/decode_tm6000/meson.build
>  create mode 100644 contrib/gconv/meson.build
>  create mode 100644 contrib/meson.build
>  create mode 100644 contrib/rds-saa6588/meson.build
>  create mode 100644 contrib/test/meson.build
>  create mode 100644 contrib/xc3028-firmware/meson.build
>  create mode 100644 lib/libdvbv5/meson.build
>  create mode 100644 lib/libv4l-mplane/meson.build
>  create mode 100644 lib/libv4l1/meson.build
>  create mode 100644 lib/libv4l2/meson.build
>  create mode 100644 lib/libv4l2rds/meson.build
>  create mode 100644 lib/libv4lconvert/meson.build
>  create mode 100644 lib/meson.build
>  create mode 100644 libdvbv5-po/meson.build
>  create mode 100644 meson.build
>  create mode 100644 meson_options.txt
>  create mode 100644 utils/cec-compliance/meson.build
>  create mode 100644 utils/cec-ctl/meson.build
>  create mode 100644 utils/cec-follower/meson.build
>  create mode 100644 utils/cx18-ctl/meson.build
>  create mode 100644 utils/dvb/meson.build
>  create mode 100755 utils/gen_media_bus_format_codes.sh
>  create mode 100755 utils/gen_media_bus_format_names.sh
>  create mode 100644 utils/ir-ctl/meson.build
>  create mode 100644 utils/ivtv-ctl/meson.build
>  create mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
>  create mode 100644 utils/keytable/bpf_protocols/meson.build
>  create mode 100644 utils/keytable/bpf_protocols/user_dir_protocols/README.md
>  create mode 100644 utils/keytable/meson.build
>  create mode 100644 utils/keytable/rc_keymaps/meson.build
>  create mode 100644 utils/libcecutil/meson.build
>  create mode 100644 utils/libmedia_dev/meson.build
>  create mode 100644 utils/libv4l2util/meson.build
>  create mode 100644 utils/media-ctl/meson.build
>  create mode 100644 utils/meson.build
>  create mode 100644 utils/qv4l2/meson.build
>  create mode 100644 utils/qvidcap/meson.build
>  create mode 100644 utils/rds-ctl/meson.build
>  create mode 100644 utils/v4l2-compliance/meson.build
>  create mode 100644 utils/v4l2-ctl/meson.build
>  create mode 100644 utils/v4l2-dbg/meson.build
>  create mode 100644 utils/v4l2-sysfs-path/meson.build
>  create mode 100644 v4l-utils-po/meson.build

[snip]

> diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> new file mode 100644
> index 00000000..ed2ff120
> --- /dev/null
> +++ b/utils/keytable/meson.build
> @@ -0,0 +1,76 @@
> +ir_keytable_sources = files(
> +    'ir-encode.c',
> +    'ir-encode.h',
> +    'keymap.c',
> +    'keymap.h',
> +    'keytable.c',
> +    'parse.h',
> +    'toml.c',
> +    'toml.h',
> +)
> +
> +ir_keytable_deps = [
> +    dep_argp,
> +]
> +
> +ir_keytable_system_dir = udevdir
> +ir_keytable_user_dir = get_option('sysconfdir') / 'rc_keymaps'
> +
> +ir_keytable_c_args = [
> +    '-DIR_KEYTABLE_SYSTEM_DIR="@0@"'.format(ir_keytable_system_dir),
> +    '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
> +]
> +
> +if not get_option('bpf').disabled() and prog_clang.found() and dep_libelf.found()

This should be

if dep_libbpf.found() and dep_libelf.found() and prog_clang.found()

otherwise compilation will fail if libbpf isn't found and the bpf option
is set to auto.

> +    ir_keytable_sources += files(
> +        'bpf_load.c',
> +        'bpf_load.h',
> +    )
> +    ir_keytable_deps += [
> +        dep_libbpf,
> +        dep_libelf,
> +    ]
> +    ir_keytable_c_args += [
> +	'-DHAVE_BPF',
> +    ]
> +    subdir('bpf_protocols')
> +endif
> +
> +ir_keytable_incdir = [
> +    utils_common_incdir,
> +    v4l2_utils_incdir,
> +]
> +
> +ir_keytable = executable('ir-keytable',
> +                         sources : ir_keytable_sources,
> +                         install : true,
> +                         dependencies : ir_keytable_deps,
> +                         c_args : ir_keytable_c_args,
> +                         include_directories : ir_keytable_incdir)
> +
> +man_pages += [[ meson.current_source_dir(), 'ir-keytable', 1 ]]
> +man_pages += [[ meson.current_source_dir(), 'rc_keymap', 5 ]]
> +
> +ir_keytable_sysconf_files = files(
> +    'rc_maps.cfg',
> +)
> +install_data(ir_keytable_sysconf_files,
> +             install_dir : get_option('sysconfdir'))
> +
> +subdir('rc_keymaps')
> +install_data(ir_keytable_rc_keymaps,
> +             install_dir : ir_keytable_system_dir / 'rc_keymaps')
> +
> +ir_keytable_udev_rules = files(
> +    '70-infrared.rules',
> +)
> +install_data(ir_keytable_udev_rules,
> +             install_dir : ir_keytable_system_dir / 'rules.d')
> +
> +if have_udevdsyscallfilter
> +    ir_keytable_systemd_files = files(
> +        '50-rc_keymap.conf',
> +    )
> +    install_data(ir_keytable_systemd_files,
> +                 install_dir : systemd_systemdir / 'systemd-udevd.service.d')
> +endif

[snip]

-- 
Regards,

Laurent Pinchart
