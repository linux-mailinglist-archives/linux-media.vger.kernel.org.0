Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2541AB440
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 01:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389685AbgDOXeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 19:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389463AbgDOXeV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 19:34:21 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED080C061A0C
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 16:34:20 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id t199so11696340oif.7
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 16:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DHlbWfCRECYOvxHqm857EEOYUd5VDKMfUFrf3DIgLlM=;
        b=KRux6x5p5oYml6Z06u3KH3Nj7Pij007iu3Cc58KNieONZ2RlznIZ6PqBWbrX+e8B5W
         X/W8AQJ1OPYjxjo/MY/KYKiXxTXM6g57TfYQgeUn0e8kizYLZA9/huYnr3KcGfXDY3CK
         L2dVCBX3B3VFqW9tQWmECfzQxDTqDamVQqbOY2hMTv8kt6n/YFGWurMlttDBZ99U5Hl5
         6qCkKvMExz+U3zfTw10ppvJtr6AY4A5XvWwhbIc8mBz+velzOsIfjmGL8a7JenRzckiw
         BeR4UE4rG1H4ie+FyBsTlik+o6qb+5fLE4HadChYVyZoRuTeJbgI57vIbsiX/dP5coZJ
         c9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHlbWfCRECYOvxHqm857EEOYUd5VDKMfUFrf3DIgLlM=;
        b=LacTLaQzla0Kg+9ipiwR8RH2imk9ti5r44gBfg2jHDEgaCPNvblzx3Z8EyegLTwBqQ
         X7B4vP9yDOO3hw+5h6y7T6KjtXy9+C7RNqfbHOQcWHM+ypYVRX4lgTGFUzqIlbXJMJfd
         j3I1OeU793lqK1WRc4ULx8vottv+lAKHUXIV9iQjC96G6Qyw5aCEqkaNSyoXuuTbNIWZ
         kkcB8pr6DPRb2ZAdxhqERTE8yMpcDRilma8VeDx1tayodPRxTVQlFATYhao2hCV9EmUR
         DD/wtKuC5YA6vFhA7ceTJFdroPjYkQSStCtppHPwb73Am0nogobezsRwLZWRnK752wSS
         9ftQ==
X-Gm-Message-State: AGi0PuauvJ27C4ch2LwT/k7FuWScbX0Zru0vCUk+SNIvkYKVSx3tuPUb
        9u1AZ6fVhKQv/47O51bHvFjNJ862gbWR8fm9c/o=
X-Google-Smtp-Source: APiQypKAeump8vf5KHSMaw0TiqvRVP8I01Jj3QGHpYoK4NkWnorZ59wHj89ZwN2/itlLhIvXQWCkQ805RdEGjSEO1jE=
X-Received: by 2002:aca:d68a:: with SMTP id n132mr1317088oig.40.1586993659830;
 Wed, 15 Apr 2020 16:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195611.55421-1-ariel@vanguardiasur.com.ar>
 <20200408195611.55421-2-ariel@vanguardiasur.com.ar> <CAKxU2N9CN6N3p5kfpzhkpX0PWD=5ogr14qcPQ_p5qprm0z98=A@mail.gmail.com>
In-Reply-To: <CAKxU2N9CN6N3p5kfpzhkpX0PWD=5ogr14qcPQ_p5qprm0z98=A@mail.gmail.com>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Wed, 15 Apr 2020 16:34:08 -0700
Message-ID: <CAKxU2N_fTJ7gzLov3AsTPrCVB3xbXoJa6fuSqRvPxVa60V_+zQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] Add support for meson building
To:     "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        Sean Young <sean@mess.org>, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 10, 2020 at 5:28 PM Rosen Penev <rosenp@gmail.com> wrote:
>
> On Wed, Apr 8, 2020 at 1:42 PM Ariel D'Alessandro
> <ariel@vanguardiasur.com.ar> wrote:
> >
> > Currently supports building libraries and tools found in lib/ and
> > utils/ directories.
> Excellent. This will make it easier to run the code against static
> code analyzers.
This is worse than I thought. v4l-utils fails to compile with clang
(and by extension clang-tidy as it uses nested functions.
> >
> > Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> > ---
> >  .gitignore                                    |   1 +
> >  gen-version.sh                                |  36 +++++
> >  lib/libdvbv5/meson.build                      | 142 +++++++++++++++++
> >  lib/libv4l-mplane/meson.build                 |  16 ++
> >  lib/libv4l1/meson.build                       |  53 +++++++
> >  lib/libv4l2/meson.build                       |  65 ++++++++
> >  lib/libv4l2rds/meson.build                    |  28 ++++
> >  lib/libv4lconvert/meson.build                 | 105 +++++++++++++
> >  lib/meson.build                               |  14 ++
> >  meson.build                                   | 132 ++++++++++++++++
> >  meson_options.txt                             |  39 +++++
> >  utils/cec-compliance/meson.build              |  24 +++
> >  utils/cec-ctl/meson.build                     |  18 +++
> >  utils/cec-follower/meson.build                |  21 +++
> >  utils/cx18-ctl/meson.build                    |   7 +
> >  utils/dvb/meson.build                         |  69 ++++++++
> >  utils/gen_media_bus_format_codes.sh           |   7 +
> >  utils/gen_media_bus_format_names.sh           |   7 +
> >  utils/ir-ctl/meson.build                      |  17 ++
> >  utils/ivtv-ctl/meson.build                    |  13 ++
> >  .../bpf_protocols/clang_sys_includes.sh       |   9 ++
> >  utils/keytable/bpf_protocols/meson.build      |  31 ++++
> >  utils/keytable/meson.build                    |  70 +++++++++
> >  utils/keytable/rc_keymaps/meson.build         | 147 ++++++++++++++++++
> >  utils/libcecutil/meson.build                  |  45 ++++++
> >  utils/libmedia_dev/meson.build                |  14 ++
> >  utils/libv4l2util/meson.build                 |  16 ++
> >  utils/media-ctl/meson.build                   |  46 ++++++
> >  utils/meson.build                             |  50 ++++++
> >  utils/qv4l2/meson.build                       |  75 +++++++++
> >  utils/qvidcap/meson.build                     |  75 +++++++++
> >  utils/rds-ctl/meson.build                     |  13 ++
> >  utils/v4l2-compliance/meson.build             |  60 +++++++
> >  utils/v4l2-ctl/meson.build                    |  75 +++++++++
> >  utils/v4l2-dbg/meson.build                    |  16 ++
> >  utils/v4l2-sysfs-path/meson.build             |  13 ++
> >  version.h.in                                  |   1 +
> >  37 files changed, 1570 insertions(+)
> >  create mode 100755 gen-version.sh
> >  create mode 100644 lib/libdvbv5/meson.build
> >  create mode 100644 lib/libv4l-mplane/meson.build
> >  create mode 100644 lib/libv4l1/meson.build
> >  create mode 100644 lib/libv4l2/meson.build
> >  create mode 100644 lib/libv4l2rds/meson.build
> >  create mode 100644 lib/libv4lconvert/meson.build
> >  create mode 100644 lib/meson.build
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
> >  create mode 100644 version.h.in
> >
> > diff --git a/.gitignore b/.gitignore
> > index f899ecfc..7c900fe5 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -61,3 +61,4 @@ v4l-utils-po/en@quot.header
> >  v4l-utils-po/insert-header.sin
> >  v4l-utils-po/quot.sed
> >  v4l-utils-po/remove-potcdate.sin
> > +build/
> > diff --git a/gen-version.sh b/gen-version.sh
> > new file mode 100755
> > index 00000000..9223ab7d
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
> > +       # Handle an un-tagged repository
> > +       sha=$(git describe --abbrev=8 --always 2>/dev/null)
> > +       commits=$(git log --oneline | wc -l 2>/dev/null)
> > +       version="v4l-utils-0.0.0-$commits-g$sha"
> > +fi
> > +
> > +# Append a '-dirty' suffix if the working tree is dirty. Prevent false
> > +# positives due to changed timestamps by running git update-index.
> > +if [ -z "$build_dir" ] || (echo "$build_dir" | grep -q "$src_dir")
> > +then
> > +       git update-index --refresh > /dev/null 2>&1
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
> > index 00000000..fe1852e2
> > --- /dev/null
> > +++ b/lib/libdvbv5/meson.build
> > @@ -0,0 +1,142 @@
> > +libdvbv5_sources = files(
> > +    'compat-soname.c',
> > +    'countries.c',
> > +    'crc32.c',
> > +    'descriptors.c',
> > +    'descriptors/desc_atsc_service_location.c',
> > +    'descriptors/desc_ca.c',
> > +    'descriptors/desc_ca_identifier.c',
> > +    'descriptors/desc_cable_delivery.c',
> > +    'descriptors/desc_event_extended.c',
> > +    'descriptors/desc_event_short.c',
> > +    'descriptors/desc_extension.c',
> > +    'descriptors/desc_frequency_list.c',
> > +    'descriptors/desc_hierarchy.c',
> > +    'descriptors/desc_isdbt_delivery.c',
> > +    'descriptors/desc_language.c',
> > +    'descriptors/desc_logical_channel.c',
> > +    'descriptors/desc_network_name.c',
> > +    'descriptors/desc_partial_reception.c',
> > +    'descriptors/desc_sat.c',
> > +    'descriptors/desc_service.c',
> > +    'descriptors/desc_t2_delivery.c',
> > +    'descriptors/desc_terrestrial_delivery.c',
> > +    'descriptors/desc_ts_info.c',
> > +    'dvb-demux.c',
> > +    'dvb-dev-local.c',
> > +    'dvb-dev-priv.h',
> > +    'dvb-dev-remote.c',
> > +    'dvb-dev.c',
> > +    'dvb-fe-priv.h',
> > +    'dvb-fe.c',
> > +    'dvb-file.c',
> > +    'dvb-legacy-channel-format.c',
> > +    'dvb-log.c',
> > +    'dvb-sat.c',
> > +    'dvb-scan.c',
> > +    'dvb-v5-std.c',
> > +    'dvb-v5.c',
> > +    'dvb-v5.h',
> > +    'dvb-vdr-format.c',
> > +    'dvb-zap-format.c',
> > +    'parse_string.c',
> > +    'parse_string.h',
> > +    'tables/atsc_eit.c',
> > +    'tables/cat.c',
> > +    'tables/eit.c',
> > +    'tables/header.c',
> > +    'tables/mgt.c',
> > +    'tables/mpeg_es.c',
> > +    'tables/mpeg_pes.c',
> > +    'tables/mpeg_ts.c',
> > +    'tables/nit.c',
> > +    'tables/pat.c',
> > +    'tables/pmt.c',
> > +    'tables/sdt.c',
> > +    'tables/vct.c',
> > +)
> > +
> > +configure_file(
> > +    output : 'libdvb-version.h',
> > +    input : '../include/libdvbv5/libdvb-version.h.in',
> > +    configuration : conf,
> > +    install: true,
> > +    install_dir: 'include/libdvbv5',
> > +)
> > +
> > +libdvbv5_api = files(
> > +    '../include/libdvbv5/atsc_eit.h',
> > +    '../include/libdvbv5/atsc_header.h',
> > +    '../include/libdvbv5/cat.h',
> > +    '../include/libdvbv5/countries.h',
> > +    '../include/libdvbv5/crc32.h',
> > +    '../include/libdvbv5/desc_atsc_service_location.h',
> > +    '../include/libdvbv5/desc_ca.h',
> > +    '../include/libdvbv5/desc_ca_identifier.h',
> > +    '../include/libdvbv5/desc_cable_delivery.h',
> > +    '../include/libdvbv5/desc_event_extended.h',
> > +    '../include/libdvbv5/desc_event_short.h',
> > +    '../include/libdvbv5/desc_extension.h',
> > +    '../include/libdvbv5/desc_frequency_list.h',
> > +    '../include/libdvbv5/desc_hierarchy.h',
> > +    '../include/libdvbv5/desc_isdbt_delivery.h',
> > +    '../include/libdvbv5/desc_language.h',
> > +    '../include/libdvbv5/desc_logical_channel.h',
> > +    '../include/libdvbv5/desc_network_name.h',
> > +    '../include/libdvbv5/desc_partial_reception.h',
> > +    '../include/libdvbv5/desc_sat.h',
> > +    '../include/libdvbv5/desc_service.h',
> > +    '../include/libdvbv5/desc_t2_delivery.h',
> > +    '../include/libdvbv5/desc_terrestrial_delivery.h',
> > +    '../include/libdvbv5/desc_ts_info.h',
> > +    '../include/libdvbv5/descriptors.h',
> > +    '../include/libdvbv5/dvb-demux.h',
> > +    '../include/libdvbv5/dvb-dev.h',
> > +    '../include/libdvbv5/dvb-fe.h',
> > +    '../include/libdvbv5/dvb-file.h',
> > +    '../include/libdvbv5/dvb-frontend.h',
> > +    '../include/libdvbv5/dvb-log.h',
> > +    '../include/libdvbv5/dvb-sat.h',
> > +    '../include/libdvbv5/dvb-scan.h',
> > +    '../include/libdvbv5/dvb-v5-std.h',
> > +    '../include/libdvbv5/eit.h',
> > +    '../include/libdvbv5/header.h',
> > +    '../include/libdvbv5/mgt.h',
> > +    '../include/libdvbv5/mpeg_es.h',
> > +    '../include/libdvbv5/mpeg_pes.h',
> > +    '../include/libdvbv5/mpeg_ts.h',
> > +    '../include/libdvbv5/nit.h',
> > +    '../include/libdvbv5/pat.h',
> > +    '../include/libdvbv5/pmt.h',
> > +    '../include/libdvbv5/sdt.h',
> > +    '../include/libdvbv5/vct.h',
> > +)
> > +
> > +install_headers(libdvbv5_api, subdir: 'libdvbv5')
> > +
> > +libdvbv5_deps = [
> > +    dep_libm,
> > +    dep_librt,
> > +    dep_threads,
> > +    dep_udev,
> > +]
> > +
> > +libdvbv5_c_args = [
> > +    '-DHAVE_DVBV5_REMOTE',
> > +]
> > +
> > +libdvbv5 = shared_library('dvbv5',
> > +                          libdvbv5_sources,
> > +                          install : true,
> > +                          dependencies : libdvbv5_deps,
> > +                          c_args : libdvbv5_c_args,
> > +                          include_directories : v4l2_utils_incdir)
> > +
> > +dep_libdvbv5 = declare_dependency(link_with : libdvbv5)
> > +
> > +pkg.generate(
> > +    name : 'libdvbv5',
> > +    libraries : libdvbv5,
> > +    version : meson.project_version(),
> > +    requires_private : 'libudev',
> > +    description : 'DVBv5 utility library')
> > diff --git a/lib/libv4l-mplane/meson.build b/lib/libv4l-mplane/meson.build
> > new file mode 100644
> > index 00000000..9e55dfb8
> > --- /dev/null
> > +++ b/lib/libv4l-mplane/meson.build
> > @@ -0,0 +1,16 @@
> > +libv4l_mplane_sources = files(
> > +    'libv4l-mplane.c',
> > +)
> > +
> > +libv4l_mplane_deps = [
> > +    dep_threads,
> > +]
> > +
> > +libv4l_mplane = shared_module('v4l-mplane',
> > +                              libv4l_mplane_sources,
> > +                              install : true,
> > +                              install_dir : libv4l2plugindir,
> > +                              dependencies : libv4l_mplane_deps,
> > +                              include_directories : v4l2_utils_incdir)
> > +
> > +dep_libv4l_mplane = declare_dependency(link_with : libv4l_mplane)
> > diff --git a/lib/libv4l1/meson.build b/lib/libv4l1/meson.build
> > new file mode 100644
> > index 00000000..3e485280
> > --- /dev/null
> > +++ b/lib/libv4l1/meson.build
> > @@ -0,0 +1,53 @@
> > +libv4l1_sources = files(
> > +    'libv4l1-priv.h',
> > +    'libv4l1.c',
> > +    'log.c',
> > +)
> > +
> > +libv4l1_api = files(
> > +    '../include/libv4l1-videodev.h',
> > +    '../include/libv4l1.h',
> > +)
> > +
> > +install_headers(libv4l1_api)
> > +
> > +libv4l1_deps = [
> > +    dep_libv4l2,
> > +    dep_threads,
> > +]
> > +
> > +libv4l1 = shared_library('v4l1',
> > +                         libv4l1_sources,
> > +                         install : true,
> > +                         dependencies : libv4l1_deps,
> > +                         include_directories : v4l2_utils_incdir)
> > +
> > +dep_libv4l1 = declare_dependency(link_with : libv4l1)
> > +
> > +pkg.generate(
> > +    name : 'libv4l1',
> > +    libraries : libv4l1,
> > +    libraries_private : '-lpthread',
> > +    version : meson.project_version(),
> > +    requires_private : 'libv4l2',
> > +    description : 'v4l1 compatibility library')
> > +
> > +v4l1compat_sources = files(
> > +    'v4l1compat.c',
> > +)
> > +
> > +v4l1compat_deps = [
> > +    dep_libv4l1,
> > +]
> > +
> > +libv4l1privdir = get_option('prefix') / get_option('libdir') / get_option('libv4l1subdir')
> > +
> > +v4l1compat = shared_module('v4l1compat',
> > +                           v4l1compat_sources,
> > +                           name_prefix : '',
> > +                           install : true,
> > +                           install_dir : libv4l1privdir,
> > +                           dependencies : v4l1compat_deps,
> > +                           include_directories : v4l2_utils_incdir)
> > +
> > +dep_v4l1compat = declare_dependency(link_with : v4l1compat)
> > diff --git a/lib/libv4l2/meson.build b/lib/libv4l2/meson.build
> > new file mode 100644
> > index 00000000..3cb64fa0
> > --- /dev/null
> > +++ b/lib/libv4l2/meson.build
> > @@ -0,0 +1,65 @@
> > +libv4l2_sources = files(
> > +    'libv4l2-priv.h',
> > +    'libv4l2.c',
> > +    'log.c',
> > +)
> > +
> > +libv4l2_api = files(
> > +    '../include/libv4l-plugin.h',
> > +    '../include/libv4l2.h',
> > +)
> > +
> > +install_headers(libv4l2_api)
> > +
> > +libv4l2_deps = [
> > +    dep_libdl,
> > +    dep_libv4lconvert,
> > +    dep_threads,
> > +]
> > +
> > +libv4l2_c_args = []
> > +
> > +if get_option('v4l-plugins')
> > +    libv4l2_sources += files('v4l2-plugin.c')
> > +    libv4l2_c_args += [
> > +        '-DHAVE_V4L_PLUGINS',
> > +        '-DLIBV4L2_PLUGIN_DIR="@0@"'.format(libv4l2plugindir)
> > +    ]
> > +endif
> > +
> > +libv4l2 = shared_library('v4l2',
> > +                         libv4l2_sources,
> > +                         install : true,
> > +                         dependencies : libv4l2_deps,
> > +                         c_args : libv4l2_c_args,
> > +                         include_directories : v4l2_utils_incdir)
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
> > +
> > +v4l2convert_sources = files(
> > +    'v4l2convert.c',
> > +)
> > +
> > +v4l2convert_deps = [
> > +    dep_libv4l2,
> > +]
> > +
> > +libv4l2privdir = get_option('prefix') / get_option('libdir') / get_option('libv4l2subdir')
> > +
> > +v4l2convert = shared_module('v4l2convert',
> > +                            v4l2convert_sources,
> > +                            name_prefix : '',
> > +                            install : true,
> > +                            install_dir : libv4l2privdir,
> > +                            dependencies : v4l2convert_deps,
> > +                            include_directories : v4l2_utils_incdir)
> > +
> > +dep_v4l2convert = declare_dependency(link_with : v4l2convert)
> > diff --git a/lib/libv4l2rds/meson.build b/lib/libv4l2rds/meson.build
> > new file mode 100644
> > index 00000000..686170fc
> > --- /dev/null
> > +++ b/lib/libv4l2rds/meson.build
> > @@ -0,0 +1,28 @@
> > +libv4l2rds_sources = files(
> > +    'libv4l2rds.c',
> > +)
> > +
> > +libv4l2rds_api = files(
> > +    '../include/libv4l2rds.h',
> > +)
> > +
> > +install_headers(libv4l2rds_api)
> > +
> > +libv4l2rds_deps = [
> > +    dep_threads,
> > +]
> > +
> > +libv4l2rds = shared_library('v4l2rds',
> > +                            libv4l2rds_sources,
> > +                            install : true,
> > +                            dependencies : libv4l2rds_deps,
> > +                            include_directories : v4l2_utils_incdir)
> > +
> > +dep_libv4l2rds = declare_dependency(link_with : libv4l2rds)
> > +
> > +pkg.generate(
> > +    name : 'libv4l2rds',
> > +    libraries : libv4l2rds,
> > +    libraries_private : '-lpthread',
> > +    version : meson.project_version(),
> > +    description : 'v4l2 RDS decode library')
> > diff --git a/lib/libv4lconvert/meson.build b/lib/libv4lconvert/meson.build
> > new file mode 100644
> > index 00000000..2f3a8ddf
> > --- /dev/null
> > +++ b/lib/libv4lconvert/meson.build
> > @@ -0,0 +1,105 @@
> > +libv4lconvert_sources = files(
> > +    'bayer.c',
> > +    'control/libv4lcontrol-priv.h',
> > +    'control/libv4lcontrol.c',
> > +    'control/libv4lcontrol.h',
> > +    'cpia1.c',
> > +    'crop.c',
> > +    'flip.c',
> > +    'helper-funcs.h',
> > +    'hm12.c',
> > +    'jidctflt.c',
> > +    'jl2005bcd.c',
> > +    'jpeg.c',
> > +    'jpgl.c',
> > +    'libv4lconvert-priv.h',
> > +    'libv4lconvert.c',
> > +    'libv4lsyscall-priv.h',
> > +    'mr97310a.c',
> > +    'pac207.c',
> > +    'processing/autogain.c',
> > +    'processing/gamma.c',
> > +    'processing/libv4lprocessing-priv.h',
> > +    'processing/libv4lprocessing.c',
> > +    'processing/libv4lprocessing.h',
> > +    'processing/whitebalance.c',
> > +    'rgbyuv.c',
> > +    'se401.c',
> > +    'sn9c10x.c',
> > +    'sn9c2028-decomp.c',
> > +    'sn9c20x.c',
> > +    'spca501.c',
> > +    'spca561-decompress.c',
> > +    'sq905c.c',
> > +    'stv0680.c',
> > +    'tinyjpeg-internal.h',
> > +    'tinyjpeg.c',
> > +    'tinyjpeg.h',
> > +)
> > +
> > +libv4lconvert_api = files(
> > +    '../include/libv4lconvert.h',
> > +)
> > +
> > +install_headers(libv4lconvert_api)
> > +
> > +libv4lconvert_deps = [
> > +    dep_libm,
> > +    dep_librt,
> > +]
> > +
> > +libv4lconvert_priv_libs = [
> > +    '-lm',
> > +    '-lrt',
> > +]
> > +
> > +libv4lconvert_c_args = []
> > +
> > +if dep_jpeg.found()
> > +    libv4lconvert_deps += dep_jpeg
> > +    libv4lconvert_priv_libs += dep_jpeg_priv_libs
> > +    libv4lconvert_sources += files(
> > +        'jpeg_memsrcdest.c',
> > +        'jpeg_memsrcdest.h'
> > +    )
> > +    libv4lconvert_c_args += [
> > +        '-DHAVE_JPEG',
> > +    ]
> > +endif
> > +
> > +if have_fork
> > +    libv4lconvert_sources += files(
> > +        'helper.c',
> > +    )
> > +    libv4lconvertprivdir = get_option('prefix') / get_option('libdir') / get_option('libv4lconvertsubdir')
> > +    ov511_decomp_sources = files(
> > +        'ov511-decomp.c',
> > +    )
> > +    ov511_decomp = executable('ov511-decomp',
> > +                              ov511_decomp_sources,
> > +                              install : true,
> > +                              install_dir : libv4lconvertprivdir)
> > +    ov518_decomp_sources = files(
> > +        'ov518-decomp.c',
> > +    )
> > +    ov518_decomp = executable('ov518-decomp',
> > +                              ov518_decomp_sources,
> > +                              install : true,
> > +                              install_dir : libv4lconvertprivdir)
> > +endif
> > +
> > +libv4lconvert = shared_library('v4lconvert',
> > +                               libv4lconvert_sources,
> > +                               install : true,
> > +                               dependencies : libv4lconvert_deps,
> > +                               c_args : libv4lconvert_c_args,
> > +                               include_directories : v4l2_utils_incdir)
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
> > index 00000000..be8a37b3
> > --- /dev/null
> > +++ b/lib/meson.build
> > @@ -0,0 +1,14 @@
> > +libv4l2plugindir = get_option('prefix') / get_option('libdir') / get_option('libv4l2subdir') / 'plugins'
> > +
> > +subdir('libv4lconvert')
> > +subdir('libv4l2')
> > +subdir('libv4l1')
> > +subdir('libv4l2rds')
> > +
> > +if get_option('libdvbv5')
> > +    subdir('libdvbv5')
> > +endif
> > +
> > +if get_option('v4l-plugins')
> > +    subdir('libv4l-mplane')
> > +endif
> > diff --git a/meson.build b/meson.build
> > new file mode 100644
> > index 00000000..428fd403
> > --- /dev/null
> > +++ b/meson.build
> > @@ -0,0 +1,132 @@
> > +project('v4l-utils', 'c', 'cpp',
> > +    version: '1.19.0',
> > +    default_options : [
> > +        'warning_level=1',
> > +    ],
> > +    license : 'LGPL 2.1+')
> > +
> > +cc = meson.get_compiler('c')
> > +have_m32 = cc.has_link_argument('-m32')
> > +
> > +pkg = import('pkgconfig')
> > +qt5 = import('qt5')
> > +
> > +as_version = meson.project_version()
> > +ver_arr = as_version.split('.')
> > +as_major_version = ver_arr[0]
> > +as_minor_version = ver_arr[1]
> > +as_patch_version = ver_arr[2]
> > +
> > +conf = configuration_data()
> > +conf.set_quoted('V4L_UTILS_VERSION', as_version)
> > +conf.set('PACKAGE_VERSION', as_version)
> > +conf.set('MAJOR', as_major_version)
> > +conf.set('MINOR', as_minor_version)
> > +conf.set('PATCH', as_patch_version)
> > +
> > +common_arguments = [
> > +    '-Wpointer-arith',
> > +    '-D_GNU_SOURCE',
> > +    '-I.', # Needed for config.h
> > +    '-DPROMOTED_MODE_T=int'
> > +]
> > +
> > +v4l2_utils_incdir = include_directories(
> > +    'include',
> > +    'lib' / 'include'
> > +)
> > +
> > +prog_bash = find_program('bash')
> > +prog_clang = find_program('clang')
> > +prog_grep = find_program('grep')
> > +prog_perl = find_program('perl')
> > +
> > +dep_alsa = dependency('alsa', required : false)
> > +dep_libdl = cc.find_library('dl')
> > +dep_libelf = cc.find_library('elf', required : false)
> > +dep_libm = cc.find_library('m')
> > +dep_librt = cc.find_library('rt')
> > +dep_opengl = dependency('OpenGL', required : false)
> > +dep_qt5 = dependency('qt5', modules: ['Core', 'Gui', 'Widgets', 'OpenGL'], required : false)
> > +dep_threads = dependency('threads')
> > +dep_xmlrpc = dependency('xmlrpc', required : false)
> > +
> > +have_fork = cc.has_function('fork')
> > +
> > +if cc.has_function('iconv_open')
> > +    dep_iconv = dependency('', required : false)
> > +    have_iconv = true
> > +else
> > +    dep_iconv = cc.find_library('iconv', required : false)
> > +    have_iconv = dep_iconv.found()
> > +endif
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
> > +dep_jpeg = dependency('libjpeg', required : get_option('jpeg'))
> > +if dep_jpeg.found()
> > +    dep_jpeg_priv_libs = '-ljpeg'
> > +endif
> > +
> > +systemd_systemdir = get_option('systemdsystemunitdir')
> > +if systemd_systemdir == ''
> > +    systemd_systemdir = dependency('systemd', required : false).get_pkgconfig_variable('systemdsystemunitdir')
> > +endif
> > +if systemd_systemdir == ''
> > +    systemd_systemdir = '/lib/systemd/system'
> > +endif
> > +# Since systemd v239, udevd is not allowed to execute BPF systems calls;
> > +# add an override to allow bpf(2) in that case. On earlier versions, the
> > +# override will restrict udevd to bpf syscall only and will stop the system
> > +# from booting. This is also true on current debian versions.
> > +have_udevdsyscallfilter = run_command(prog_grep, '-s', 'SystemCallFilter', systemd_systemdir / 'systemd-udevd.service')
> > +
> > +dep_udev = dependency('libudev', required : get_option('udev'))
> > +udevdir = get_option('udevdir')
> > +if udevdir == ''
> > +    udevdir = dependency('udev', required : false).get_pkgconfig_variable('udevdir')
> > +endif
> > +if udevdir == ''
> > +    udevdir = '/lib/udev'
> > +endif
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
> > +                    output : 'version.h')
> > +
> > +man_pages = []
> > +
> > +subdir('lib')
> > +
> > +if get_option('v4l-utils')
> > +    subdir('utils')
> > +endif
> > +
> > +configure_file(output : 'config.h', configuration : conf)
> > +
> > +foreach m : man_pages
> > +    configure_file(input : join_paths(m[0], '@0@.@1@.in'.format(m[1], m[2])),
> > +                   output : '@0@.@1@'.format(m[1], m[2]),
> > +                   install_dir : join_paths(get_option('mandir'), 'man@0@'.format(m[2])),
> > +                   configuration : conf)
> > +endforeach
> > diff --git a/meson_options.txt b/meson_options.txt
> > new file mode 100644
> > index 00000000..c46eed32
> > --- /dev/null
> > +++ b/meson_options.txt
> > @@ -0,0 +1,39 @@
> > +# Features
> > +option('jpeg', type : 'feature', value : 'auto')
> > +option('udev', type : 'feature', value : 'auto')
> > +
> > +# Options
> > +option('bpf', type : 'boolean',
> > +       description : 'Enable IR BPF decoders')
> > +option('libdvbv5', type : 'boolean',
> > +       description : 'Enable libdvbv5 compilation')
> > +option('qv4l2', type : 'boolean',
> > +       description : 'Enable qv4l2 compilation')
> > +option('qvidcap', type : 'boolean',
> > +       description : 'Enable qvidcap compilation')
> > +option('v4l-plugins', type : 'boolean',
> > +       description : 'V4L plugin support')
> > +option('v4l-utils', type : 'boolean',
> > +       description : 'Enable v4l-utils compilation')
> > +option('v4l2-compliance-32', type : 'boolean', value : false,
> > +       description : 'Enable v4l2-compliance-32 compilation (for debugging purposes only)')
> > +option('v4l2-compliance-libv4l', type : 'boolean',
> > +       description : 'Enable use of libv4l in v4l2-compliance')
> > +option('v4l2-ctl-32', type : 'boolean', value : false,
> > +       description : 'Enable v4l2-ctl-32 compilation (for debugging purposes only)')
> > +option('v4l2-ctl-libv4l', type : 'boolean',
> > +       description : 'Enable use of libv4l in v4l2-ctl')
> > +option('v4l2-ctl-stream-to', type : 'boolean',
> > +       description : 'Enable use of --stream-to in v4l2-ctl')
> > +
> > +# Directories
> > +option('libv4l1subdir', type : 'string', value : 'libv4l',
> > +       description : 'Set libv4l1 library subdir')
> > +option('libv4l2subdir', type : 'string', value : 'libv4l',
> > +       description : 'Set libv4l2 library subdir')
> > +option('libv4lconvertsubdir', type : 'string', value : 'libv4l',
> > +       description : 'Set libv4lconvert library subdir')
> > +option('systemdsystemunitdir', type : 'string',
> > +       description : 'Set systemd system unit directory')
> > +option('udevdir', type : 'string',
> > +       description : 'Set udev directory')
> > diff --git a/utils/cec-compliance/meson.build b/utils/cec-compliance/meson.build
> > new file mode 100644
> > index 00000000..e4fc68de
> > --- /dev/null
> > +++ b/utils/cec-compliance/meson.build
> > @@ -0,0 +1,24 @@
> > +cec_compliance_sources = files(
> > +    'cec-compliance.cpp',
> > +    'cec-compliance.h',
> > +    'cec-test-adapter.cpp',
> > +    'cec-test-audio.cpp',
> > +    'cec-test-fuzzing.cpp',
> > +    'cec-test-power.cpp',
> > +    'cec-test.cpp',
> > +)
> > +
> > +cec_compliance_sources += version_h
> > +
> > +cec_compliance_deps = [
> > +    dep_libcecutil,
> > +    dep_librt,
> > +]
> > +
> > +cec_compliance = executable('cec-compliance',
> > +                            cec_compliance_sources,
> > +                            install : true,
> > +                            dependencies : cec_compliance_deps,
> > +                            include_directories : v4l2_utils_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'cec-compliance', 1 ]]
> > diff --git a/utils/cec-ctl/meson.build b/utils/cec-ctl/meson.build
> > new file mode 100644
> > index 00000000..059ca206
> > --- /dev/null
> > +++ b/utils/cec-ctl/meson.build
> > @@ -0,0 +1,18 @@
> > +cec_ctl_sources = files(
> > +    'cec-ctl.cpp',
> > +    'cec-ctl.h',
> > +    'cec-pin.cpp',
> > +)
> > +
> > +cec_ctl_deps = [
> > +    dep_libcecutil,
> > +    dep_librt,
> > +]
> > +
> > +cec_ctl = executable('cec-ctl',
> > +                     cec_ctl_sources,
> > +                     install : true,
> > +                     dependencies : cec_ctl_deps,
> > +                     include_directories : v4l2_utils_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'cec-ctl', 1 ]]
> > diff --git a/utils/cec-follower/meson.build b/utils/cec-follower/meson.build
> > new file mode 100644
> > index 00000000..0ecaf7a4
> > --- /dev/null
> > +++ b/utils/cec-follower/meson.build
> > @@ -0,0 +1,21 @@
> > +cec_follower_sources = files(
> > +    'cec-follower.cpp',
> > +    'cec-follower.h',
> > +    'cec-processing.cpp',
> > +    'cec-tuner.cpp',
> > +)
> > +
> > +cec_follower_sources += version_h
> > +
> > +cec_follower_deps = [
> > +    dep_libcecutil,
> > +    dep_librt,
> > +]
> > +
> > +cec_follower = executable('cec-follower',
> > +                          cec_follower_sources,
> > +                          install : true,
> > +                          dependencies : cec_follower_deps,
> > +                          include_directories : v4l2_utils_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'cec-follower', 1 ]]
> > diff --git a/utils/cx18-ctl/meson.build b/utils/cx18-ctl/meson.build
> > new file mode 100644
> > index 00000000..648c7dd1
> > --- /dev/null
> > +++ b/utils/cx18-ctl/meson.build
> > @@ -0,0 +1,7 @@
> > +cx18_ctl_sources = files(
> > +    'cx18-ctl.c',
> > +)
> > +
> > +cx18_ctl = executable('cx18-ctl',
> > +                      cx18_ctl_sources,
> > +                      install : true)
> > diff --git a/utils/dvb/meson.build b/utils/dvb/meson.build
> > new file mode 100644
> > index 00000000..19071a29
> > --- /dev/null
> > +++ b/utils/dvb/meson.build
> > @@ -0,0 +1,69 @@
> > +dvb_common_deps =  [
> > +    dep_libdvbv5,
> > +    dep_threads,
> > +    dep_udev,
> > +    dep_xmlrpc,
> > +]
> > +
> > +dvb_fe_tool_sources = files(
> > +    'dvb-fe-tool.c',
> > +)
> > +
> > +dvb_fe_tool = executable('dvb-fe-tool',
> > +                         dvb_fe_tool_sources,
> > +                         install : true,
> > +                         dependencies : dvb_common_deps,
> > +                         include_directories : v4l2_utils_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'dvb-fe-tool', 1 ]]
> > +
> > +dvbv5_zap_sources = files(
> > +    'dvbv5-zap.c',
> > +)
> > +
> > +dvbv5_zap = executable('dvbv5-zap',
> > +                       dvbv5_zap_sources,
> > +                       install : true,
> > +                       dependencies : dvb_common_deps,
> > +                       include_directories : v4l2_utils_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'dvbv5-zap', 1 ]]
> > +
> > +dvbv5_scan_sources = files(
> > +    'dvbv5-scan.c',
> > +)
> > +
> > +dvbv5_scan = executable('dvbv5-scan',
> > +                        dvbv5_scan_sources,
> > +                        install : true,
> > +                        dependencies : dvb_common_deps,
> > +                        include_directories : v4l2_utils_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'dvbv5-scan', 1 ]]
> > +
> > +dvb_format_convert_sources = files(
> > +    'dvb-format-convert.c',
> > +)
> > +
> > +dvb_format_convert = executable('dvb-format-convert',
> > +                                dvb_format_convert_sources,
> > +                                install : true,
> > +                                dependencies : dvb_common_deps,
> > +                                include_directories : v4l2_utils_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'dvb-format-convert', 1 ]]
> > +
> > +dvbv5_daemon_sources = files(
> > +    'dvbv5-daemon.c',
> > +)
> > +
> > +dvbv5_daemon_c_args = [
> > +    '-DHAVE_DVBV5_REMOTE',
> > +]
> > +
> > +dvbv5_daemon = executable('dvbv5-daemon',
> > +                          dvbv5_daemon_sources,
> > +                          install : true,
> > +                          dependencies : dvb_common_deps,
> > +                          c_args : dvbv5_daemon_c_args,
> > +                          include_directories : v4l2_utils_incdir)
> > diff --git a/utils/gen_media_bus_format_codes.sh b/utils/gen_media_bus_format_codes.sh
> > new file mode 100755
> > index 00000000..4bdcc3b7
> > --- /dev/null
> > +++ b/utils/gen_media_bus_format_codes.sh
> > @@ -0,0 +1,7 @@
> > +#!/bin/bash
> > +
> > +src="$1"
> > +
> > +sed -e \
> > +'/#define MEDIA_BUS_FMT/ ! d; s/.*#define //; /FIXED/ d; s/\t.*//; s/.*/ &,/;' \
> > +${src}
> > diff --git a/utils/gen_media_bus_format_names.sh b/utils/gen_media_bus_format_names.sh
> > new file mode 100755
> > index 00000000..3fdc830d
> > --- /dev/null
> > +++ b/utils/gen_media_bus_format_names.sh
> > @@ -0,0 +1,7 @@
> > +#!/bin/bash
> > +
> > +src="$1"
> > +
> > +sed -e \
> > +'/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
> > +${src}
> > diff --git a/utils/ir-ctl/meson.build b/utils/ir-ctl/meson.build
> > new file mode 100644
> > index 00000000..59a835c3
> > --- /dev/null
> > +++ b/utils/ir-ctl/meson.build
> > @@ -0,0 +1,17 @@
> > +ir_ctl_sources = files(
> > +    'bpf_encoder.c',
> > +    'bpf_encoder.h',
> > +    'ir-ctl.c',
> > +    'ir-encode.c',
> > +    'ir-encode.h',
> > +    'keymap.c',
> > +    'keymap.h',
> > +    'toml.c',
> > +    'toml.h',
> > +)
> > +
> > +ir_ctl = executable('ir-ctl',
> > +                    ir_ctl_sources,
> > +                    install : true)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'ir-ctl', 1 ]]
> > diff --git a/utils/ivtv-ctl/meson.build b/utils/ivtv-ctl/meson.build
> > new file mode 100644
> > index 00000000..410a8439
> > --- /dev/null
> > +++ b/utils/ivtv-ctl/meson.build
> > @@ -0,0 +1,13 @@
> > +ivtv_ctl_sources = files(
> > +    'ivtv-ctl.c',
> > +)
> > +
> > +ivtv_ctl_deps = [
> > +    dep_libm,
> > +]
> > +
> > +ivtv_ctl = executable('ivtv-ctl',
> > +                      ivtv_ctl_sources,
> > +                      install : true,
> > +                      dependencies : ivtv_ctl_deps,
> > +                      include_directories : v4l2_utils_incdir)
> > diff --git a/utils/keytable/bpf_protocols/clang_sys_includes.sh b/utils/keytable/bpf_protocols/clang_sys_includes.sh
> > new file mode 100755
> > index 00000000..9dc4af12
> > --- /dev/null
> > +++ b/utils/keytable/bpf_protocols/clang_sys_includes.sh
> > @@ -0,0 +1,9 @@
> > +#!/bin/sh
> > +# Get Clang's default includes on this system, as opposed to those seen by
> > +# '-target bpf'. This fixes "missing" files on some architectures/distros,
> > +# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
> > +#
> > +# Use '-idirafter': Don't interfere with include mechanics except where the
> > +# build would have failed anyways.
> > +$CLANG -v -E - </dev/null 2>&1 \
> > +       | sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }'
> > diff --git a/utils/keytable/bpf_protocols/meson.build b/utils/keytable/bpf_protocols/meson.build
> > new file mode 100644
> > index 00000000..2f1ed072
> > --- /dev/null
> > +++ b/utils/keytable/bpf_protocols/meson.build
> > @@ -0,0 +1,31 @@
> > +bpf_protocols_files = [
> > +    'grundig',
> > +    'imon_rsc',
> > +    'manchester',
> > +    'pulse_distance',
> > +    'pulse_length',
> > +    'raw',
> > +    'rc_mm',
> > +    'samsung36',
> > +    'xbox-dvd',
> > +]
> > +
> > +clang_sys_includes = run_command('clang_sys_includes.sh',
> > +                                 check : true,
> > +                                 env : ['CLANG=' + prog_clang.path()])
> > +
> > +foreach file : bpf_protocols_files
> > +    output = file + '.o'
> > +    input = file + '.c'
> > +    custom_target(output,
> > +                  output : output,
> > +                  input : input,
> > +                  command : [
> > +                      prog_clang.path(),
> > +                      clang_sys_includes.stdout().strip(),
> > +                      '-D__linux__', '-target', 'bpf', '-O2',
> > +                      '-c', '@INPUT@', '-o', '@OUTPUT@',
> > +                  ],
> > +                  install : true,
> > +                  install_dir : udevdir / 'rc_keymaps' / 'protocols')
> > +endforeach
> > diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> > new file mode 100644
> > index 00000000..e1e5b385
> > --- /dev/null
> > +++ b/utils/keytable/meson.build
> > @@ -0,0 +1,70 @@
> > +ir_keytable_sources = files(
> > +    'ir-encode.c',
> > +    'ir-encode.h',
> > +    'keymap.c',
> > +    'keymap.h',
> > +    'keytable.c',
> > +    'parse.h',
> > +    'toml.c',
> > +    'toml.h',
> > +)
> > +
> > +ir_keytable_deps = []
> > +
> > +if get_option('bpf')
> > +    ir_keytable_sources += files(
> > +        'bpf.c',
> > +        'bpf.h',
> > +        'bpf_load.c',
> > +        'bpf_load.h',
> > +    )
> > +    ir_keytable_deps += [
> > +        dep_libelf,
> > +    ]
> > +    subdir('bpf_protocols')
> > +endif
> > +
> > +ir_keytable_system_dir = udevdir
> > +ir_keytable_user_dir = get_option('sysconfdir') / 'rc_keymaps'
> > +
> > +ir_keytable_c_args = [
> > +    '-DIR_KEYTABLE_SYSTEM_DIR="@0@"'.format(ir_keytable_system_dir),
> > +    '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
> > +]
> > +
> > +ir_keytable_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +ir_keytable = executable('ir-keytable',
> > +                         sources : ir_keytable_sources,
> > +                         install : true,
> > +                         dependencies : ir_keytable_deps,
> > +                         c_args : ir_keytable_c_args,
> > +                         include_directories : ir_keytable_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'ir-keytable', 1 ]]
> > +man_pages += [[ meson.current_source_dir(), 'rc_keymap', 5 ]]
> > +
> > +ir_keytable_sysconf_files = files(
> > +    'rc_maps.cfg',
> > +)
> > +install_data(ir_keytable_sysconf_files,
> > +             install_dir : get_option('sysconfdir'))
> > +
> > +subdir('rc_keymaps')
> > +install_data(ir_keytable_rc_keymaps,
> > +             install_dir : udevdir / 'rc_keymaps')
> > +
> > +ir_keytable_udev_rules = files(
> > +    '70-infrared.rules',
> > +)
> > +install_data(ir_keytable_udev_rules,
> > +             install_dir : udevdir / 'rules.d')
> > +
> > +ir_keytable_systemd_files = files(
> > +    '50-rc_keymap.conf',
> > +)
> > +install_data(ir_keytable_systemd_files,
> > +             install_dir : systemd_systemdir / 'systemd-udevd.service.d')
> > diff --git a/utils/keytable/rc_keymaps/meson.build b/utils/keytable/rc_keymaps/meson.build
> > new file mode 100644
> > index 00000000..581bd895
> > --- /dev/null
> > +++ b/utils/keytable/rc_keymaps/meson.build
> > @@ -0,0 +1,147 @@
> > +ir_keytable_rc_keymaps = files(
> > +    'adstech_dvb_t_pci.toml',
> > +    'af9005.toml',
> > +    'alink_dtu_m.toml',
> > +    'allwinner_ba10_tv_box.toml',
> > +    'allwinner_i12_a20_tv_box.toml',
> > +    'anysee.toml',
> > +    'apac_viewcomp.toml',
> > +    'astrometa_t2hybrid.toml',
> > +    'asus_pc39.toml',
> > +    'asus_ps3_100.toml',
> > +    'ati_tv_wonder_hd_600.toml',
> > +    'ati_x10.toml',
> > +    'avermedia.toml',
> > +    'avermedia_a16d.toml',
> > +    'avermedia_cardbus.toml',
> > +    'avermedia_dvbt.toml',
> > +    'avermedia_m135a.toml',
> > +    'avermedia_m733a_rm_k6.toml',
> > +    'avermedia_rm_ks.toml',
> > +    'avertv_303.toml',
> > +    'az6027.toml',
> > +    'azurewave_ad_tu700.toml',
> > +    'beelink_gs1.toml',
> > +    'behold.toml',
> > +    'behold_columbus.toml',
> > +    'budget_ci_old.toml',
> > +    'cec.toml',
> > +    'cinergy.toml',
> > +    'cinergy_1400.toml',
> > +    'cinergyt2.toml',
> > +    'd680_dmb.toml',
> > +    'delock_61959.toml',
> > +    'dib0700_nec.toml',
> > +    'dib0700_rc5.toml',
> > +    'dibusb.toml',
> > +    'digitalnow_tinytwin.toml',
> > +    'digittrade.toml',
> > +    'digitv.toml',
> > +    'dish_network.toml',
> > +    'dm1105_nec.toml',
> > +    'dntv_live_dvb_t.toml',
> > +    'dntv_live_dvbt_pro.toml',
> > +    'dtt200u.toml',
> > +    'dvbsky.toml',
> > +    'dvico_mce.toml',
> > +    'dvico_portable.toml',
> > +    'em_terratec.toml',
> > +    'encore_enltv.toml',
> > +    'encore_enltv2.toml',
> > +    'encore_enltv_fm53.toml',
> > +    'evga_indtube.toml',
> > +    'eztv.toml',
> > +    'flydvb.toml',
> > +    'flyvideo.toml',
> > +    'fusionhdtv_mce.toml',
> > +    'gadmei_rm008z.toml',
> > +    'geekbox.toml',
> > +    'genius_tvgo_a11mce.toml',
> > +    'gotview7135.toml',
> > +    'haupp.toml',
> > +    'hauppauge.toml',
> > +    'hisi_poplar.toml',
> > +    'hisi_tv_demo.toml',
> > +    'imon_mce.toml',
> > +    'imon_pad.toml',
> > +    'imon_rsc.toml',
> > +    'iodata_bctv7e.toml',
> > +    'it913x_v1.toml',
> > +    'it913x_v2.toml',
> > +    'kaiomy.toml',
> > +    'khadas.toml',
> > +    'kii_pro.toml',
> > +    'kworld_315u.toml',
> > +    'kworld_pc150u.toml',
> > +    'kworld_plus_tv_analog.toml',
> > +    'leadtek_y04g0051.toml',
> > +    'lme2510.toml',
> > +    'manli.toml',
> > +    'mce_keyboard.toml',
> > +    'medion_x10.toml',
> > +    'medion_x10_digitainer.toml',
> > +    'medion_x10_or2x.toml',
> > +    'megasky.toml',
> > +    'msi_digivox_ii.toml',
> > +    'msi_digivox_iii.toml',
> > +    'msi_tvanywhere.toml',
> > +    'msi_tvanywhere_plus.toml',
> > +    'nebula.toml',
> > +    'nec_terratec_cinergy_xs.toml',
> > +    'norwood.toml',
> > +    'npgtech.toml',
> > +    'odroid.toml',
> > +    'opera1.toml',
> > +    'pctv_sedna.toml',
> > +    'pinnacle310e.toml',
> > +    'pinnacle_color.toml',
> > +    'pinnacle_grey.toml',
> > +    'pinnacle_pctv_hd.toml',
> > +    'pixelview.toml',
> > +    'pixelview_002t.toml',
> > +    'pixelview_mk12.toml',
> > +    'pixelview_new.toml',
> > +    'powercolor_real_angel.toml',
> > +    'proteus_2309.toml',
> > +    'purpletv.toml',
> > +    'pv951.toml',
> > +    'rc6_mce.toml',
> > +    'real_audio_220_32_keys.toml',
> > +    'reddo.toml',
> > +    'snapstream_firefly.toml',
> > +    'streamzap.toml',
> > +    'su3000.toml',
> > +    'tango.toml',
> > +    'tanix_tx3mini.toml',
> > +    'tanix_tx5max.toml',
> > +    'tbs_nec.toml',
> > +    'technisat_ts35.toml',
> > +    'technisat_usb2.toml',
> > +    'terratec_cinergy_c_pci.toml',
> > +    'terratec_cinergy_s2_hd.toml',
> > +    'terratec_cinergy_xs.toml',
> > +    'terratec_slim.toml',
> > +    'terratec_slim_2.toml',
> > +    'tevii_nec.toml',
> > +    'tivo.toml',
> > +    'total_media_in_hand.toml',
> > +    'total_media_in_hand_02.toml',
> > +    'trekstor.toml',
> > +    'tt_1500.toml',
> > +    'tvwalkertwin.toml',
> > +    'twinhan_dtv_cab_ci.toml',
> > +    'twinhan_vp1027_dvbs.toml',
> > +    'vega_s9x.toml',
> > +    'videomate_k100.toml',
> > +    'videomate_s350.toml',
> > +    'videomate_tv_pvr.toml',
> > +    'vp702x.toml',
> > +    'wetek_hub.toml',
> > +    'wetek_play2.toml',
> > +    'winfast.toml',
> > +    'winfast_usbii_deluxe.toml',
> > +    'wobo_i5.toml',
> > +    'x96max.toml',
> > +    'xbox_dvd.toml',
> > +    'zx_irdec.toml',
> > +)
> > diff --git a/utils/libcecutil/meson.build b/utils/libcecutil/meson.build
> > new file mode 100644
> > index 00000000..ed3aa88c
> > --- /dev/null
> > +++ b/utils/libcecutil/meson.build
> > @@ -0,0 +1,45 @@
> > +libcecutil_sources = files(
> > +    'cec-htng-funcs.h',
> > +    'cec-htng.h',
> > +    'cec-info.cpp',
> > +    'cec-info.h',
> > +    'cec-log.cpp',
> > +    'cec-log.h',
> > +    'cec-parse.cpp',
> > +    'cec-parse.h',
> > +)
> > +
> > +libcecutil_deps = [
> > +    dep_libdl,
> > +    dep_libv4lconvert,
> > +    dep_threads,
> > +]
> > +
> > +libcecutil_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
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
> > +    command : [prog_perl, '@INPUT@', cec_gen_sources, 'utils/libcecutil'],
> > +)
> > +
> > +libcecutil = static_library('cecutil',
> > +                            libcecutil_sources,
> > +                            install : false,
> > +                            dependencies : libcecutil_deps,
> > +                            include_directories : libcecutil_incdir)
> > +
> > +dep_libcecutil = declare_dependency(
> > +    link_with : libcecutil,
> > +    include_directories : '.',
> > +)
> > diff --git a/utils/libmedia_dev/meson.build b/utils/libmedia_dev/meson.build
> > new file mode 100644
> > index 00000000..f97238e6
> > --- /dev/null
> > +++ b/utils/libmedia_dev/meson.build
> > @@ -0,0 +1,14 @@
> > +libmedia_dev_sources = files(
> > +    'get_media_devices.c',
> > +    'get_media_devices.h',
> > +)
> > +
> > +libmedia_dev = static_library('media_dev',
> > +                              libmedia_dev_sources,
> > +                              install : false,
> > +                              include_directories : v4l2_utils_incdir)
> > +
> > +dep_libmedia_dev = declare_dependency(
> > +    link_with : libmedia_dev,
> > +    include_directories : '.',
> > +)
> > diff --git a/utils/libv4l2util/meson.build b/utils/libv4l2util/meson.build
> > new file mode 100644
> > index 00000000..9d1c6e12
> > --- /dev/null
> > +++ b/utils/libv4l2util/meson.build
> > @@ -0,0 +1,16 @@
> > +libv4l2util_sources = files(
> > +    'frequencies.c',
> > +    'libv4l2util.h',
> > +    'v4l2_driver.c',
> > +    'v4l2_driver.h',
> > +)
> > +
> > +libv4l2util = static_library('v4l2util',
> > +                             libv4l2util_sources,
> > +                             install : false,
> > +                             include_directories : v4l2_utils_incdir)
> > +
> > +dep_libv4l2util = declare_dependency(
> > +    link_with : libv4l2util,
> > +    include_directories : '.',
> > +)
> > diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> > new file mode 100644
> > index 00000000..acaf2f5d
> > --- /dev/null
> > +++ b/utils/media-ctl/meson.build
> > @@ -0,0 +1,46 @@
> > +libmediactl_sources = files(
> > +    'libmediactl.c',
> > +    'mediactl-priv.h',
> > +)
> > +
> > +libmediactl_deps = [
> > +    dep_udev,
> > +]
> > +
> > +libmediactl = static_library('mediactl',
> > +                             libmediactl_sources,
> > +                             dependencies : libmediactl_deps)
> > +
> > +dep_libmediactl = declare_dependency(link_with : libmediactl)
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
> > +dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
> > +
> > +media_ctl_sources = files(
> > +    'media-ctl.c',
> > +    'options.c',
> > +    'options.h',
> > +    'tools.h',
> > +)
> > +
> > +media_ctl_deps = [
> > +    dep_libmediactl,
> > +    dep_libv4l2subdev,
> > +]
> > +
> > +media_ctl = executable('media-ctl',
> > +                       media_ctl_sources,
> > +                       dependencies : media_ctl_deps,
> > +                       install : true)
> > diff --git a/utils/meson.build b/utils/meson.build
> > new file mode 100644
> > index 00000000..5ca0247e
> > --- /dev/null
> > +++ b/utils/meson.build
> > @@ -0,0 +1,50 @@
> > +utils_common_incdir = include_directories('common')
> > +
> > +# Generate targets for media-bus-format-{names,codes}.h
> > +foreach x: [ 'names', 'codes' ]
> > +    output_file = 'media-bus-format-@0@.h'.format(x)
> > +    input_file = 'gen_media_bus_format_@0@.sh'.format(x)
> > +    target = custom_target(
> > +        output_file,
> > +        output : output_file,
> > +        input : input_file,
> > +        command : [
> > +            prog_bash, '@INPUT@', files('..' / 'include' / 'linux' / 'media-bus-format.h'),
> > +        ],
> > +        capture : true,
> > +    )
> > +    set_variable(output_file.underscorify(), target)
> > +endforeach
> > +
> > +# Libraries
> > +subdir('libcecutil')
> > +subdir('libmedia_dev')
> > +subdir('libv4l2util')
> > +
> > +# Utils
> > +subdir('cec-ctl')
> > +subdir('cec-follower')
> > +subdir('cx18-ctl')
> > +if get_option('libdvbv5')
> > +    subdir('dvb')
> > +endif
> > +subdir('ir-ctl')
> > +subdir('ivtv-ctl')
> > +subdir('keytable')
> > +subdir('media-ctl')
> > +if get_option('qv4l2')
> > +    subdir('qv4l2')
> > +endif
> > +if get_option('qvidcap')
> > +    subdir('qvidcap')
> > +endif
> > +subdir('rds-ctl')
> > +subdir('v4l2-ctl')
> > +subdir('v4l2-dbg')
> > +subdir('v4l2-sysfs-path')
> > +
> > +# Compliance tools
> > +subdir('cec-compliance')
> > +if have_fork
> > +    subdir('v4l2-compliance')
> > +endif
> > diff --git a/utils/qv4l2/meson.build b/utils/qv4l2/meson.build
> > new file mode 100644
> > index 00000000..ced75443
> > --- /dev/null
> > +++ b/utils/qv4l2/meson.build
> > @@ -0,0 +1,75 @@
> > +qv4l2_sources = files(
> > +    'alsa_stream.c',
> > +    'alsa_stream.h',
> > +    'capture-win-gl.cpp',
> > +    'capture-win-gl.h',
> > +    'capture-win-qt.cpp',
> > +    'capture-win-qt.h',
> > +    'capture-win.cpp',
> > +    'capture-win.h',
> > +    'ctrl-tab.cpp',
> > +    'general-tab.cpp',
> > +    'general-tab.h',
> > +    'qv4l2.cpp',
> > +    'qv4l2.h',
> > +    'raw2sliced.cpp',
> > +    'raw2sliced.h',
> > +    'tpg-tab.cpp',
> > +    'v4l2-tpg-colors.c',
> > +    'v4l2-tpg-core.c',
> > +    'vbi-tab.cpp',
> > +    'vbi-tab.h',
> > +)
> > +
> > +qv4l2_deps = [
> > +    dep_alsa,
> > +    dep_libmedia_dev,
> > +    dep_libv4l2,
> > +    dep_libv4l2util,
> > +    dep_libv4lconvert,
> > +    dep_opengl,
> > +    dep_qt5,
> > +    dep_threads,
> > +]
> > +
> > +qv4l2_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +qt5_files = qt5.preprocess(
> > +    moc_headers : ['qv4l2.h', 'general-tab.h', 'vbi-tab.h', 'capture-win.h'],
> > +    qresources : 'qv4l2.qrc',
> > +)
> > +qv4l2_sources += qt5_files
> > +
> > +qv4l2 = executable('qv4l2',
> > +                   sources : qv4l2_sources,
> > +                   install : true,
> > +                   dependencies : qv4l2_deps,
> > +                   include_directories : qv4l2_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'qv4l2', 1 ]]
> > +
> > +qv4l2_applications_files = files(
> > +    'qv4l2.desktop',
> > +)
> > +
> > +install_data('qv4l2.desktop',
> > +             install_dir : get_option('datadir') / 'applications')
> > +
> > +qv4l2_icons_dir = get_option('datadir') / 'icons' / 'hicolor'
> > +
> > +qv4l2_icons_files = [
> > +    ['qv4l2_16x16.png', '16x16',    'qv4l2.png'],
> > +    ['qv4l2_24x24.png', '24x24',    'qv4l2.png'],
> > +    ['qv4l2_32x32.png', '32x32',    'qv4l2.png'],
> > +    ['qv4l2_64x64.png', '64x64',    'qv4l2.png'],
> > +    ['qv4l2.png',       'scalable', 'qv4l2.svg'],
> > +]
> > +
> > +foreach f : qv4l2_icons_files
> > +    install_data(f[0],
> > +                 rename: f[1] / 'apps' / f[2],
> > +                 install_dir : qv4l2_icons_dir)
> > +endforeach
> > diff --git a/utils/qvidcap/meson.build b/utils/qvidcap/meson.build
> > new file mode 100644
> > index 00000000..1c379318
> > --- /dev/null
> > +++ b/utils/qvidcap/meson.build
> > @@ -0,0 +1,75 @@
> > +qvidcap_sources = files(
> > +    'capture.cpp',
> > +    'capture.h',
> > +    'codec-fwht.c',
> > +    'codec-v4l2-fwht.c',
> > +    'paint.cpp',
> > +    'qvidcap.cpp',
> > +    'qvidcap.h',
> > +    'v4l-stream.c',
> > +    'v4l2-info.cpp',
> > +    'v4l2-tpg-colors.c',
> > +    'v4l2-tpg-core.c',
> > +)
> > +
> > +qvidcap_deps = [
> > +    dep_libmedia_dev,
> > +    dep_libv4l2,
> > +    dep_libv4l2util,
> > +    dep_libv4lconvert,
> > +    dep_opengl,
> > +    dep_qt5,
> > +]
> > +
> > +qvidcap_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +qt5_files = qt5.preprocess(
> > +    moc_headers : 'capture.h',
> > +    qresources : 'qvidcap.qrc',
> > +)
> > +qvidcap_sources += qt5_files
> > +
> > +v4l2_convert_sources = files(
> > +    'v4l2-convert.glsl',
> > +)
> > +
> > +configure_file(
> > +    input : 'v4l2-convert.pl',
> > +    output : 'v4l2-convert.h',
> > +    capture : true,
> > +    command : [prog_perl, '@INPUT@', v4l2_convert_sources],
> > +)
> > +
> > +qvidcap = executable('qvidcap',
> > +                     sources : qvidcap_sources,
> > +                     install : true,
> > +                     dependencies : qvidcap_deps,
> > +                     include_directories : qvidcap_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'qvidcap', 1 ]]
> > +
> > +qvidcap_applications_files = files(
> > +    'qvidcap.desktop',
> > +)
> > +
> > +install_data('qvidcap.desktop',
> > +             install_dir : get_option('datadir') / 'applications')
> > +
> > +qvidcap_icons_dir = get_option('datadir') / 'icons' / 'hicolor'
> > +
> > +qvidcap_icons_files = [
> > +    ['qvidcap_16x16.png', '16x16',    'qvidcap.png'],
> > +    ['qvidcap_24x24.png', '24x24',    'qvidcap.png'],
> > +    ['qvidcap_32x32.png', '32x32',    'qvidcap.png'],
> > +    ['qvidcap_64x64.png', '64x64',    'qvidcap.png'],
> > +    ['qvidcap.png',       'scalable', 'qvidcap.svg'],
> > +]
> > +
> > +foreach f : qvidcap_icons_files
> > +    install_data(f[0],
> > +                 rename: f[1] / 'apps' / f[2],
> > +                 install_dir : qvidcap_icons_dir)
> > +endforeach
> > diff --git a/utils/rds-ctl/meson.build b/utils/rds-ctl/meson.build
> > new file mode 100644
> > index 00000000..be797035
> > --- /dev/null
> > +++ b/utils/rds-ctl/meson.build
> > @@ -0,0 +1,13 @@
> > +rds_ctl_sources = files(
> > +    'rds-ctl.cpp',
> > +)
> > +
> > +rds_ctl_deps = [
> > +    dep_libv4l2rds,
> > +]
> > +
> > +rds_ctl = executable('rds-ctl',
> > +                     rds_ctl_sources,
> > +                     install : true,
> > +                     dependencies : rds_ctl_deps,
> > +                     include_directories : v4l2_utils_incdir)
> > diff --git a/utils/v4l2-compliance/meson.build b/utils/v4l2-compliance/meson.build
> > new file mode 100644
> > index 00000000..5b03b570
> > --- /dev/null
> > +++ b/utils/v4l2-compliance/meson.build
> > @@ -0,0 +1,60 @@
> > +v4l2_compliance_sources = files(
> > +    'media-info.cpp',
> > +    'v4l2-compliance.cpp',
> > +    'v4l2-compliance.h',
> > +    'v4l2-info.cpp',
> > +    'v4l2-test-buffers.cpp',
> > +    'v4l2-test-codecs.cpp',
> > +    'v4l2-test-colors.cpp',
> > +    'v4l2-test-controls.cpp',
> > +    'v4l2-test-debug.cpp',
> > +    'v4l2-test-formats.cpp',
> > +    'v4l2-test-input-output.cpp',
> > +    'v4l2-test-io-config.cpp',
> > +    'v4l2-test-media.cpp',
> > +    'v4l2-test-subdevs.cpp',
> > +)
> > +
> > +v4l2_compliance_sources += version_h
> > +
> > +v4l2_compliance_deps = [
> > +    dep_librt,
> > +    dep_threads,
> > +]
> > +
> > +v4l2_compliance_cpp_args = []
> > +
> > +if get_option('v4l2-compliance-libv4l')
> > +    v4l2_compliance_deps += [
> > +        dep_libv4lconvert,
> > +        dep_libv4l2,
> > +    ]
> > +else
> > +    v4l2_compliance_cpp_args += '-DNO_LIBV4L2'
> > +endif
> > +
> > +v4l2_compliance_incdir = [
> > +    utils_common_incdir,
> > +    v4l2_utils_incdir,
> > +]
> > +
> > +v4l2_compliance = executable('v4l2-compliance',
> > +                             v4l2_compliance_sources,
> > +                             install : true,
> > +                             dependencies : v4l2_compliance_deps,
> > +                             cpp_args : v4l2_compliance_cpp_args,
> > +                             include_directories : v4l2_compliance_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'v4l2-compliance', 1 ]]
> > +
> > +v4l2_compliance_32_cpp_args = ['-m32', '-DNO_LIBV4L2']
> > +v4l2_compliance_32_link_args = ['-m32', '-static']
> > +
> > +if get_option('v4l2-compliance-32') and have_m32
> > +    v4l2_compliance_32 = executable('v4l2-compliance-32',
> > +                                    v4l2_compliance_sources,
> > +                                    install : true,
> > +                                    cpp_args : v4l2_compliance_32_cpp_args,
> > +                                    link_args : v4l2_compliance_32_link_args,
> > +                                    include_directories : v4l2_compliance_incdir)
> > +endif
> > diff --git a/utils/v4l2-ctl/meson.build b/utils/v4l2-ctl/meson.build
> > new file mode 100644
> > index 00000000..b7d83acc
> > --- /dev/null
> > +++ b/utils/v4l2-ctl/meson.build
> > @@ -0,0 +1,75 @@
> > +v4l2_ctl_sources = files(
> > +    'codec-fwht.c',
> > +    'codec-v4l2-fwht.c',
> > +    'media-info.cpp',
> > +    'v4l-stream.c',
> > +    'v4l2-ctl-common.cpp',
> > +    'v4l2-ctl-edid.cpp',
> > +    'v4l2-ctl-io.cpp',
> > +    'v4l2-ctl-meta.cpp',
> > +    'v4l2-ctl-misc.cpp',
> > +    'v4l2-ctl-modes.cpp',
> > +    'v4l2-ctl-overlay.cpp',
> > +    'v4l2-ctl-sdr.cpp',
> > +    'v4l2-ctl-selection.cpp',
> > +    'v4l2-ctl-stds.cpp',
> > +    'v4l2-ctl-streaming.cpp',
> > +    'v4l2-ctl-subdev.cpp',
> > +    'v4l2-ctl-tuner.cpp',
> > +    'v4l2-ctl-vbi.cpp',
> > +    'v4l2-ctl-vidcap.cpp',
> > +    'v4l2-ctl-vidout.cpp',
> > +    'v4l2-ctl.cpp',
> > +    'v4l2-ctl.h',
> > +    'v4l2-info.cpp',
> > +    'v4l2-tpg-colors.c',
> > +    'v4l2-tpg-core.c',
> > +)
> > +v4l2_ctl_sources += media_bus_format_names_h
> > +
> > +v4l2_ctl_deps = [
> > +    dep_librt,
> > +    dep_threads,
> > +]
> > +
> > +v4l2_ctl_cpp_args = []
> > +
> > +if get_option('v4l2-ctl-libv4l')
> > +    v4l2_ctl_deps += [
> > +        dep_libv4lconvert,
> > +        dep_libv4l2,
> > +    ]
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
> > +v4l2_ctl = executable('v4l2-ctl',
> > +                      v4l2_ctl_sources,
> > +                      install : true,
> > +                      dependencies : v4l2_ctl_deps,
> > +                      cpp_args : v4l2_ctl_cpp_args,
> > +                      include_directories : v4l2_ctl_incdir)
> > +
> > +man_pages += [[ meson.current_source_dir(), 'v4l2-ctl', 1 ]]
> > +
> > +v4l2_ctl_32_c_cpp_args = ['-m32', '-DNO_LIBV4L2']
> > +v4l2_ctl_32_link_args = ['-m32', '-static']
> > +
> > +if get_option('v4l2-ctl-32') and have_m32
> > +    v4l2_ctl_32 = executable('v4l2-ctl-32',
> > +                             v4l2_ctl_sources,
> > +                             install : true,
> > +                             c_args : v4l2_ctl_32_c_cpp_args,
> > +                             cpp_args : v4l2_ctl_32_c_cpp_args,
> > +                             link_args : v4l2_ctl_32_link_args,
> > +                             include_directories : v4l2_ctl_incdir)
> > +endif
> > diff --git a/utils/v4l2-dbg/meson.build b/utils/v4l2-dbg/meson.build
> > new file mode 100644
> > index 00000000..5c721592
> > --- /dev/null
> > +++ b/utils/v4l2-dbg/meson.build
> > @@ -0,0 +1,16 @@
> > +v4l2_dbg_sources = files(
> > +    'v4l2-dbg-ac97.h',
> > +    'v4l2-dbg-bttv.h',
> > +    'v4l2-dbg-em28xx.h',
> > +    'v4l2-dbg-micron.h',
> > +    'v4l2-dbg-saa7134.h',
> > +    'v4l2-dbg-tvp5150.h',
> > +    'v4l2-dbg.cpp',
> > +    'v4l2-dbg.h',
> > +)
> > +
> > +v4l2_dbg = executable('v4l2-dbg',
> > +                      v4l2_dbg_sources,
> > +                      install : true,
> > +                      install_dir : 'sbin',
> > +                      include_directories : v4l2_utils_incdir)
> > diff --git a/utils/v4l2-sysfs-path/meson.build b/utils/v4l2-sysfs-path/meson.build
> > new file mode 100644
> > index 00000000..b16d3a9c
> > --- /dev/null
> > +++ b/utils/v4l2-sysfs-path/meson.build
> > @@ -0,0 +1,13 @@
> > +v4l2_sysfs_path_sources = files(
> > +    'v4l2-sysfs-path.c',
> > +)
> > +
> > +v4l2_sysfs_path_deps = [
> > +    dep_libmedia_dev,
> > +]
> > +
> > +v4l2_sysfs_path = executable('v4l2-sysfs-path',
> > +                             v4l2_sysfs_path_sources,
> > +                             install : true,
> > +                             dependencies : v4l2_sysfs_path_deps,
> > +                             include_directories : v4l2_utils_incdir)
> > diff --git a/version.h.in b/version.h.in
> > new file mode 100644
> > index 00000000..2506ed9b
> > --- /dev/null
> > +++ b/version.h.in
> > @@ -0,0 +1 @@
> > +#define SHA @VCS_TAG@
> > --
> > 2.25.1
> >
