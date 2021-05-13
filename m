Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD4D37F482
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 10:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbhEMI55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 04:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbhEMI54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 04:57:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287AAC061574
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:56:47 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D250891;
        Thu, 13 May 2021 10:56:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620896204;
        bh=XqDam/NnGaUHxRfW/mIs9E8DJgNSIhJvWw1zcSBtvig=;
        h=Reply-To:To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=EUcgTnwUrEy8PGszR4R4OGJoPon29S79whK3m3VTnXgmH0RkW1wjRunSHjos+dzpy
         j0XgFAOKqIvgAuhlDCKARsgAL7qD/ZqbUTMSO4szRo4xy7WZRBKt0Rm5vzm7AYbHuo
         MvtzeG/J5wD8MKmr8Cw7HrKbm9JbunB+8ohFcKBE=
Reply-To: kieran.bingham@ideasonboard.com
To:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, gjasny@googlemail.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com, sakari.ailus@iki.fi, mchehab+huawei@kernel.org,
        rosenp@gmail.com
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Organization: Ideas on Board
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
Message-ID: <f2f72ec5-e352-132f-b8d1-718589360bf0@ideasonboard.com>
Date:   Thu, 13 May 2021 09:56:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ariel,

I'm still very much looking forward to this update!

I still think meson could be used in parallel for some cross over period
while these issues are worked out, which would encourage and support
wider testing before any consideration to swap altogether occurred.


Furthermore, the performance improvement on this is really nice
(intel i7 8th gen 4 core/8threads)

/usr/bin/time -v ./make-meson.sh
	User time (seconds): 99.38
	System time (seconds): 10.69
	Percent of CPU this job got: 577%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 0:19.05


/usr/bin/time -v ./make-autoconf.sh
	User time (seconds): 218.19
	System time (seconds): 21.46
	Percent of CPU this job got: 360%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 1:06.54

however the build output directories are not comparable so I suspect
that perhaps meson isn't (yet?) building all the same things?

du -sh build-autoconf build-meson/
129M	build-autoconf
69M	build-meson/


I've just tried testing it locally and found a smallish issue:


On 12/05/2021 19:49, Ariel D'Alessandro wrote:
> Hi all,
> 
> Another attempt to support meson build, addressing comments/fixes from
> reviewers.
> 
> This patchset was developed on top of v4l-utils current master branch:
> 
>     commit f0c7e3d71eaf4182bae7eb3ee0e43b4eeb047ea9
>     Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
>         v4l2-ctl: add '--set-edid type=list' support
> 
> You can find the patchset pushed to the following branch:
> 
>     https://gitlab.collabora.com/adalessandro/v4l-utils/-/tree/v4l-utils-meson-v5
> 
> Feedback appreciated as always :-)
> 
> Changes from v4:
> 
>   * Dropped install_subdir() work-around to install empty dir. Supported
>     now in meson v0.57.
>   * Bump to meson v0.57. Replaced deprecated methods.
>   * Added override_dependency() calls on libraries.
>   * Properly check for bpf and SDL2 dependencies.

The SDL2 dependency is optional when I run ./bootstrap.sh; ./configure
which gives the following output:

compile time options summary
============================

    Host OS                    : linux-gnu
    X11                        : yes
    GL                         : yes
    glu                        : yes
    libelf		       : yes
    libjpeg                    : yes
    libudev                    : yes
    pthread                    : yes
    QT version                 : v5.4 with QtGL
    ALSA support               : yes
    SDL support		       : no

    build dynamic libs         : yes
    build static libs          : yes

    gconv                      : no

    dynamic libv4l             : yes
    v4l_plugins                : yes
    v4l_wrappers               : yes
    libdvbv5                   : yes
    dvbv5-daemon               : yes
    v4lutils                   : yes
    qv4l2                      : yes
    qvidcap                    : yes
    v4l2-ctl uses libv4l       : yes
    v4l2-ctl-32                : no
    v4l2-compliance            : yes
    v4l2-compliance uses libv4l: yes
    v4l2-compliance-32         : no
    BPF IR Decoders:           : no


However running meson build gives:

Has header "bpf/bpf.h" : NO
Run-time dependency sdl2 found: YES 2.0.10
Run-time dependency sdl2_image found: NO (tried pkgconfig and cmake)

meson.build:90:4: ERROR: C header 'SDL2/SDL_image.h' not found

Now I bet that's a corner case because SDL was found but SDL Image
wasn't, but perhaps it needs updating so that both are optional, and the
SDL support is only enabled when all SDL dependencies are met.



Of course I was able to 'solve/workaround' this locally with
 sudo apt install libsdl2-image-dev

Note that the time measurements reported above were after installing SDL
image so that both meson and autoconf should have been building the


>   * Removed libraries_private field from libv4lconvert pkgconfig.
>   * Documented meson static builds support.
>   * Set default compiler standard options.
>   * Added bpf check in keytable.
> 
> Changes from v3:
> 
>   * Split Doxygen support patch.
>   * Properly generate config.h configuration file.
> 
> Changes from v2:
> 
>   * Updated to current master branch.
>   * Moved README to markdown syntax.
>   * Documented meson build.
>   * Set PACKAGE_VERSION config macro as quoted.
> 
> Changes from v1:
> 
>   * Updated project version to 1.21.0.
>   * Fixed clang includes in keytable bpf compilation.
>   * Improved variable reutilization in meson scripts.        
>   * Set libraries version and soversion.                     
>   * Control symbol visibility.                  
>   * Install empty 'protocols' directory in keytable user dir.
>   * Fixed svg filenames in qv4l2 and qvidcap.                         
>   * Added support for Doxygen documentation (html and man).
>   * Updated required meson version to v0.53 (for fs module).       
>   * Added new files to EXTRA_DIST in each Makefile.am.              
> 
> Regards,
> 
> Ariel D'Alessandro (5):
>   Move README to markdown syntax
>   Add support for meson building
>   Copy Doxygen configuration file to doc/
>   meson: Add support for doxygen documentation
>   Makefile.am: Distribute meson related files
> 
>  .gitignore                                    |    1 +
>  INSTALL.meson.md                              |  142 +
>  Makefile.am                                   |    5 +-
>  README                                        |  274 --
>  README.md                                     |  332 +++
>  contrib/Makefile.am                           |    3 +-
>  contrib/cobalt-ctl/Makefile.am                |    2 +
>  contrib/cobalt-ctl/meson.build                |    8 +
>  contrib/decode_tm6000/Makefile.am             |    2 +
>  contrib/decode_tm6000/meson.build             |   14 +
>  contrib/gconv/Makefile.am                     |    2 +-
>  contrib/gconv/meson.build                     |   44 +
>  contrib/meson.build                           |   13 +
>  contrib/rds-saa6588/Makefile.am               |    2 +
>  contrib/rds-saa6588/meson.build               |    7 +
>  contrib/test/Makefile.am                      |    3 +-
>  contrib/test/meson.build                      |  143 +
>  contrib/xc3028-firmware/Makefile.am           |    2 +-
>  contrib/xc3028-firmware/meson.build           |   11 +
>  doc/Doxyfile.in                               | 2352 +++++++++++++++++
>  doc/meson.build                               |   34 +
>  lib/Makefile.am                               |    2 +-
>  lib/libdvbv5/Makefile.am                      |    2 +-
>  lib/libdvbv5/meson.build                      |  159 ++
>  lib/libv4l-mplane/Makefile.am                 |    2 +
>  lib/libv4l-mplane/meson.build                 |   23 +
>  lib/libv4l1/Makefile.am                       |    2 +-
>  lib/libv4l1/meson.build                       |   62 +
>  lib/libv4l2/Makefile.am                       |    2 +-
>  lib/libv4l2/meson.build                       |   71 +
>  lib/libv4l2rds/Makefile.am                    |    2 +
>  lib/libv4l2rds/meson.build                    |   37 +
>  lib/libv4lconvert/Makefile.am                 |    2 +-
>  lib/libv4lconvert/meson.build                 |  117 +
>  lib/meson.build                               |   11 +
>  libdvbv5-po/meson.build                       |    3 +
>  meson.build                                   |  334 +++
>  meson_options.txt                             |   50 +
>  utils/Makefile.am                             |    2 +-
>  utils/cec-compliance/Makefile.am              |    2 +-
>  utils/cec-compliance/meson.build              |   22 +
>  utils/cec-ctl/Makefile.am                     |    2 +-
>  utils/cec-ctl/meson.build                     |   18 +
>  utils/cec-follower/Makefile.am                |    2 +-
>  utils/cec-follower/meson.build                |   19 +
>  utils/cx18-ctl/Makefile.am                    |    2 +
>  utils/cx18-ctl/meson.build                    |    8 +
>  utils/dvb/Makefile.am                         |    2 +-
>  utils/dvb/meson.build                         |   70 +
>  utils/gen_media_bus_format_codes.sh           |    7 +
>  utils/gen_media_bus_format_names.sh           |    7 +
>  utils/ir-ctl/Makefile.am                      |    2 +
>  utils/ir-ctl/meson.build                      |   23 +
>  utils/ivtv-ctl/Makefile.am                    |    2 +
>  utils/ivtv-ctl/meson.build                    |   13 +
>  utils/keytable/Makefile.am                    |    3 +-
>  utils/keytable/bpf_protocols/Makefile.am      |    3 +-
>  .../bpf_protocols/clang_sys_includes.sh       |    9 +
>  utils/keytable/bpf_protocols/meson.build      |   31 +
>  utils/keytable/meson.build                    |   81 +
>  utils/keytable/rc_keymaps/meson.build         |  151 ++
>  utils/libcecutil/Makefile.am                  |    2 +-
>  utils/libcecutil/meson.build                  |   45 +
>  utils/libmedia_dev/Makefile.am                |    2 +-
>  utils/libmedia_dev/meson.build                |   14 +
>  utils/libv4l2util/Makefile.am                 |    2 +-
>  utils/libv4l2util/meson.build                 |   16 +
>  utils/media-ctl/Makefile.am                   |    2 +
>  utils/media-ctl/meson.build                   |   43 +
>  utils/meson.build                             |   46 +
>  utils/qv4l2/Makefile.am                       |    3 +-
>  utils/qv4l2/meson.build                       |   80 +
>  utils/qvidcap/Makefile.am                     |    3 +-
>  utils/qvidcap/meson.build                     |   82 +
>  utils/rds-ctl/Makefile.am                     |    1 +
>  utils/rds-ctl/meson.build                     |   13 +
>  utils/v4l2-compliance/Makefile.am             |    2 +-
>  utils/v4l2-compliance/meson.build             |   58 +
>  utils/v4l2-ctl/Makefile.am                    |    2 +-
>  utils/v4l2-ctl/meson.build                    |   75 +
>  utils/v4l2-dbg/Makefile.am                    |    2 +-
>  utils/v4l2-dbg/meson.build                    |   16 +
>  utils/v4l2-sysfs-path/Makefile.am             |    2 +
>  utils/v4l2-sysfs-path/meson.build             |   14 +
>  v4l-utils-po/meson.build                      |    3 +
>  85 files changed, 4987 insertions(+), 299 deletions(-)
>  create mode 100644 INSTALL.meson.md
>  delete mode 100644 README
>  create mode 100644 README.md
>  create mode 100644 contrib/cobalt-ctl/meson.build
>  create mode 100644 contrib/decode_tm6000/meson.build
>  create mode 100644 contrib/gconv/meson.build
>  create mode 100644 contrib/meson.build
>  create mode 100644 contrib/rds-saa6588/meson.build
>  create mode 100644 contrib/test/meson.build
>  create mode 100644 contrib/xc3028-firmware/meson.build
>  create mode 100644 doc/Doxyfile.in
>  create mode 100644 doc/meson.build
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
> 

-- 
Regards
--
Kieran
