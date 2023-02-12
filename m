Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 116F3693951
	for <lists+linux-media@lfdr.de>; Sun, 12 Feb 2023 19:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjBLSPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Feb 2023 13:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjBLSPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Feb 2023 13:15:35 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C92EC78
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 10:15:33 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id m10so1191025wrn.4
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 10:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nqS3CDctZWdIODRGE1tG0epA/PSEJtGINjnlm0MTzck=;
        b=u5LTkMUPI/2Dj1NYj1Pyy3dh1U6MEI/OzC5ieT7nVYRbcZfezNwfOgEk8c+sD6uaIz
         Es3oPOWvXt9xBKP3Ksag7HnsZ0Vwk8ZJem3l1yJTr/8OTCxc7QvcoqVyOHU++iNkjfG9
         15PFt4HFv2C3cZlxsRZeR82Zq9Wy2zi+wECNAXwWj8qIaKK2FRHprvXdc0Pled9FpFZA
         40ySLpM0Kobc/Ko7+LH0RSrqwfbztvnqWbE9U0IkQnYD86P+ql7Hn9ykHgSlal0bPzUw
         0f1oUGukHILRKg3fhQxyqLtGRTY5w9DYgO1P7q4mXlfNyITkYuGTmuEuLkVKB6pMcCRk
         TaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqS3CDctZWdIODRGE1tG0epA/PSEJtGINjnlm0MTzck=;
        b=P/1sBBUnV7LGk7lWjpEVSErPCYdRwFS5LEYr9st2Fyu/hAfJWj6v0vFvAfnAPLx3xt
         Ewmc+nETXF7EN6NoC+B1QFniuBbC4JipSflaCmYibxaXdawwTdwdyhz3EgivnQDmLzpx
         aZx4vkHIbkAbtpBb8rqdUaF0tOxn/qXO/Sd5pD5mfG/3hDrzomauLJbtsKhHJqkyESft
         Xe6TQVaoAzY0wv6VXqttDk6PdWNntRATs+TzkHlGkp3f6OpGfR9KdWoDUc2/5eDc/PdS
         9jyGUzgJL/jDBIQOUPcy+gKvuwASinrXu4uqEC9FLUF0lODpaqrbpT3Nm6g45x2qmiYx
         IkDQ==
X-Gm-Message-State: AO0yUKVZ8Qf/snq34FevpDtwoyfcYUIOeBWIW312KD0W7KUJ7+rTFsRM
        KcPWX4MgWY/NDApwJaC9VXT+zQ==
X-Google-Smtp-Source: AK7set+saQjRZOml5FZDc6ohSHYxk5rDWV1PHhyx2kblkT1akAFgSxBgV2O1ajju/ZxQC49sutLLQQ==
X-Received: by 2002:adf:ef03:0:b0:2c4:43f9:62f9 with SMTP id e3-20020adfef03000000b002c443f962f9mr10576782wro.57.1676225731777;
        Sun, 12 Feb 2023 10:15:31 -0800 (PST)
Received: from localhost (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.gmail.com with ESMTPSA id h12-20020adff4cc000000b002be505ab59asm8784210wrp.97.2023.02.12.10.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 10:15:31 -0800 (PST)
Date:   Sun, 12 Feb 2023 19:15:30 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com
Subject: Re: [v4l-utils] [PATCH v8 0/6] Switch build system to meson
Message-ID: <Y+kswtufbuxSwVis@sleipner.dyn.berto.se>
References: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

The build log is so much more useful with meson. It actually highlights 
some Doxygen issues that should be fixed (unrelated to this series) that 
otherwise was hidden in the noise.

warning: Tag 'FORMULA_TRANSPARENT' at line 1431 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'DOT_FONTNAME' at line 2062 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'DOT_FONTSIZE' at line 2069 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'DOT_TRANSPARENT' at line 2269 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
/home/neg/work/repo/v4l-utils/lib/include/libdvbv5/pmt.h:59: warning: documented symbol 'stream_reserved0' was not declared or defined.
/home/neg/work/repo/v4l-utils/lib/include/libdvbv5/pmt.h:101: warning: documented symbol 'stream_reserved' was not declared or defined.
/home/neg/work/repo/v4l-utils/lib/include/libdvbv5/pmt.h:103: warning: documented symbol 'stream_private' was not declared or defined.
/home/neg/work/repo/v4l-utils/lib/include/libdvbv5/dvb-dev.h:117: warning: Found unknown command '@type'
/home/neg/work/repo/v4l-utils/lib/include/libdvbv5/dvb-dev.h:171: warning: argument 'enable_monitor' of command @param is not found in the argument list of dvb_dev_find(struct dvb_device *dvb, dvb_dev_change_t handler, void *user_priv)
/home/neg/work/repo/v4l-utils/lib/include/libdvbv5/dvb-dev.h:171: warning: The following parameter of dvb_dev_find(struct dvb_device *dvb, dvb_dev_change_t handler, void *user_priv) is not documented:
  parameter 'handler'
/home/neg/work/repo/v4l-utils/lib/include/libdvbv5/dvb-sat.h:147: warning: argument 'parms' of command @param is not found in the argument list of dvb_sat_real_freq(struct dvb_v5_fe_parms *p, int freq)
/home/neg/work/repo/v4l-utils/lib/include/libdvbv5/dvb-sat.h:147: warning: The following parameters of dvb_sat_real_freq(struct dvb_v5_fe_parms *p, int freq) are not documented:
  parameter 'p'
  parameter 'freq'
/home/neg/work/repo/v4l-utils/lib/include/libdvbv5/desc_extension.h:141: warning: argument 'buf' of command @param is not found in the argument list of dvb_desc_ext_print_func(struct dvb_v5_fe_parms *parms, const struct dvb_extension_descriptor *ext, const void *desc)

For the whole series,

Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

On 2023-02-12 02:51:31 +0200, Laurent Pinchart wrote:
> Hello everybody,
> 
> This series is the latest (and greatest) attempt to switch v4l-utils
> from autotools to meson.
> 
> Compared to v7, the series has been rebased on top of the latest master
> branch, and lots of fixes have been added. All review comments should
> have been addressed. Detailed changelogs are included in individual
> patches, in particular in patch 3/6.
> 
> The rebase was a bit painful due to the new v4l2-tracer tool and its
> code generation script. While meson handles code generation fine, it
> required fixes to the script to be able to specify the output directory
> and to generate the trace and retrace sources separately. Many thanks to
> Sakari for his help with this, which I've included in this series as
> patch 1/6.
> 
> Gregor, I haven't included the Tested-by tag you gave on v7 as v8
> contains many small changes. Sorry about that.
> 
> The patches are based on 3 pending patches for v4l-utils that have been
> posted to the list in the last couple of days:
> 
> - libv4lconvert: Don't ignore return value of ftruncate()
> - keytable: Add -fno-stack-protector compilation option
> - configure.ac: Add option to disable compilation of v4l2-tracer
> 
> None are strictly required, but I've included the equivalent of the
> second and third patches in the meson support, so I wanted to base the
> patches on top of the autotools' equivalent. I expect those three
> patches to be merged soon.
> 
> As far as I can tell, meson support is now ready. I can address review
> comments in a v9 if there are any, but I'd like to merge it soon to
> avoid another painful rebase. I'll be available to fix issues on top if
> any problem is encountered later.
> 
> A tag that includes this series can be found at
> 
>         git://linuxtv.org/pinchartl/v4l-utils.git tags/meson-v8
> 
> Ariel D'Alessandro (4):
>   Move README to markdown syntax
>   Add support for meson building
>   Copy Doxygen configuration file to doc/
>   meson: Add support for doxygen documentation
> 
> Laurent Pinchart (1):
>   Drop autoconf/automake support
> 
> Sakari Ailus (1):
>   utils: Allow choosing v4l2-tracer-gen.pl output
> 
>  .gitignore                                    |  62 +-
>  INSTALL                                       | 105 ---
>  INSTALL.md                                    | 142 ++++
>  Makefile.am                                   |  20 -
>  README                                        | 282 -------
>  README.md                                     | 285 +++++++
>  aminclude.am                                  | 186 -----
>  bootstrap.sh                                  |  28 -
>  configure.ac                                  | 694 ------------------
>  contrib/Makefile.am                           |  25 -
>  contrib/cobalt-ctl/.gitignore                 |   1 -
>  contrib/cobalt-ctl/Makefile.am                |   3 -
>  contrib/cobalt-ctl/meson.build                |   8 +
>  contrib/decode_tm6000/.gitignore              |   1 -
>  contrib/decode_tm6000/Makefile.am             |   4 -
>  contrib/decode_tm6000/meson.build             |  14 +
>  contrib/freebsd/Makefile.am                   |   3 -
>  contrib/gconv/Makefile.am                     |  17 -
>  contrib/gconv/meson.build                     |  44 ++
>  contrib/meson.build                           |  13 +
>  contrib/rds-saa6588/.gitignore                |   1 -
>  contrib/rds-saa6588/Makefile.am               |   3 -
>  contrib/rds-saa6588/meson.build               |   7 +
>  contrib/test/.gitignore                       |  11 -
>  contrib/test/Makefile.am                      |  65 --
>  contrib/test/meson.build                      | 143 ++++
>  contrib/xc3028-firmware/.gitignore            |   1 -
>  contrib/xc3028-firmware/Makefile.am           |   5 -
>  contrib/xc3028-firmware/meson.build           |  11 +
>  doxygen_libdvbv5.cfg => doc/Doxyfile.in       | 128 ++--
>  doc/meson.build                               |  34 +
>  lib/Makefile.am                               |  13 -
>  lib/libdvbv5/Makefile.am                      | 126 ----
>  lib/libdvbv5/libdvbv5.pc.in                   |  11 -
>  lib/libdvbv5/meson.build                      | 156 ++++
>  lib/libv4l-mplane/Makefile.am                 |   7 -
>  lib/libv4l-mplane/meson.build                 |  23 +
>  lib/libv4l1/Makefile.am                       |  29 -
>  lib/libv4l1/libv4l1.pc.in                     |  12 -
>  lib/libv4l1/meson.build                       |  64 ++
>  lib/libv4l2/Makefile.am                       |  32 -
>  lib/libv4l2/libv4l2.pc.in                     |  12 -
>  lib/libv4l2/meson.build                       |  73 ++
>  lib/libv4l2rds/Makefile.am                    |  12 -
>  lib/libv4l2rds/libv4l2rds.pc.in               |  11 -
>  lib/libv4l2rds/meson.build                    |  37 +
>  lib/libv4lconvert/.gitignore                  |   3 -
>  lib/libv4lconvert/Makefile.am                 |  36 -
>  lib/libv4lconvert/libv4lconvert.pc.in         |  11 -
>  lib/libv4lconvert/meson.build                 | 117 +++
>  lib/meson.build                               |  11 +
>  libdvbv5-po/Makevars                          |  72 --
>  libdvbv5-po/meson.build                       |   3 +
>  m4/ac_define_dir.m4                           |  34 -
>  m4/ax_prog_doxygen.m4                         | 532 --------------
>  m4/ax_pthread.m4                              | 522 -------------
>  m4/mode_t.m4                                  |  26 -
>  m4/visibility.m4                              |  82 ---
>  meson.build                                   | 399 ++++++++++
>  meson_options.txt                             |  54 ++
>  utils/Makefile.am                             |  41 --
>  utils/cec-compliance/.gitignore               |   2 -
>  utils/cec-compliance/Makefile.am              |   8 -
>  utils/cec-compliance/meson.build              |  23 +
>  utils/cec-ctl/.gitignore                      |   2 -
>  utils/cec-ctl/Makefile.am                     |   8 -
>  utils/cec-ctl/meson.build                     |  18 +
>  utils/cec-follower/.gitignore                 |   2 -
>  utils/cec-follower/Makefile.am                |   8 -
>  utils/cec-follower/meson.build                |  19 +
>  utils/cx18-ctl/.gitignore                     |   1 -
>  utils/cx18-ctl/Makefile.am                    |   3 -
>  utils/cx18-ctl/meson.build                    |   8 +
>  utils/dvb/.gitignore                          |   9 -
>  utils/dvb/Makefile.am                         |  35 -
>  utils/dvb/meson.build                         |  70 ++
>  utils/gen_media_bus_format_codes.sh           |   7 +
>  utils/gen_media_bus_format_names.sh           |   7 +
>  utils/ir-ctl/.gitignore                       |   2 -
>  utils/ir-ctl/Makefile.am                      |   6 -
>  utils/ir-ctl/meson.build                      |  23 +
>  utils/ivtv-ctl/.gitignore                     |   1 -
>  utils/ivtv-ctl/Makefile.am                    |   4 -
>  utils/ivtv-ctl/meson.build                    |  13 +
>  utils/keytable/.gitignore                     |   3 -
>  utils/keytable/Makefile.am                    |  36 -
>  utils/keytable/bpf_protocols/Makefile.am      |  24 -
>  .../bpf_protocols/clang_sys_includes.sh       |   9 +
>  utils/keytable/bpf_protocols/meson.build      |  31 +
>  utils/keytable/meson.build                    |  85 +++
>  utils/keytable/rc_keymaps/meson.build         | 150 ++++
>  utils/libcecutil/.gitignore                   |   4 -
>  utils/libcecutil/Makefile.am                  |  24 -
>  utils/libcecutil/meson.build                  |  45 ++
>  utils/libmedia_dev/Makefile.am                |   7 -
>  utils/libmedia_dev/meson.build                |  14 +
>  utils/libv4l2util/Makefile.am                 |   7 -
>  utils/libv4l2util/meson.build                 |  16 +
>  utils/media-ctl/.gitignore                    |   3 -
>  utils/media-ctl/Makefile.am                   |  30 -
>  utils/media-ctl/libmediactl.pc.in             |  10 -
>  utils/media-ctl/libv4l2subdev.pc.in           |  11 -
>  utils/media-ctl/meson.build                   |  43 ++
>  utils/meson.build                             |  43 ++
>  utils/qv4l2/.gitignore                        |   9 -
>  utils/qv4l2/Makefile.am                       |  54 --
>  utils/qv4l2/meson.build                       |  79 ++
>  utils/qvidcap/.gitignore                      |   6 -
>  utils/qvidcap/Makefile.am                     |  42 --
>  utils/qvidcap/meson.build                     |  87 +++
>  utils/rds-ctl/.gitignore                      |   2 -
>  utils/rds-ctl/Makefile.am                     |   6 -
>  utils/rds-ctl/meson.build                     |  17 +
>  utils/v4l2-compliance/.gitignore              |   3 -
>  utils/v4l2-compliance/Makefile.am             |  31 -
>  utils/v4l2-compliance/meson.build             |  63 ++
>  utils/v4l2-ctl/.gitignore                     |   4 -
>  utils/v4l2-ctl/Makefile.am                    |  44 --
>  utils/v4l2-ctl/meson.build                    |  75 ++
>  utils/v4l2-dbg/.gitignore                     |   1 -
>  utils/v4l2-dbg/Makefile.am                    |   6 -
>  utils/v4l2-dbg/meson.build                    |  20 +
>  utils/v4l2-sysfs-path/.gitignore              |   1 -
>  utils/v4l2-sysfs-path/Makefile.am             |   4 -
>  utils/v4l2-sysfs-path/meson.build             |  14 +
>  utils/v4l2-tracer/.gitignore                  |   7 -
>  utils/v4l2-tracer/Makefile.am                 |  36 -
>  utils/v4l2-tracer/media-info.cpp              |   1 +
>  utils/v4l2-tracer/meson.build                 | 133 ++++
>  utils/v4l2-tracer/v4l2-info.cpp               |   1 +
>  utils/v4l2-tracer/v4l2-tracer-gen.pl          |  36 +-
>  v4l-utils-po/Makevars                         |  72 --
>  v4l-utils-po/meson.build                      |   3 +
>  v4l-utils.spec.in                             |   6 +-
>  134 files changed, 2854 insertions(+), 3790 deletions(-)
>  delete mode 100644 INSTALL
>  create mode 100644 INSTALL.md
>  delete mode 100644 Makefile.am
>  delete mode 100644 README
>  create mode 100644 README.md
>  delete mode 100644 aminclude.am
>  delete mode 100755 bootstrap.sh
>  delete mode 100644 configure.ac
>  delete mode 100644 contrib/Makefile.am
>  delete mode 100644 contrib/cobalt-ctl/.gitignore
>  delete mode 100644 contrib/cobalt-ctl/Makefile.am
>  create mode 100644 contrib/cobalt-ctl/meson.build
>  delete mode 100644 contrib/decode_tm6000/.gitignore
>  delete mode 100644 contrib/decode_tm6000/Makefile.am
>  create mode 100644 contrib/decode_tm6000/meson.build
>  delete mode 100644 contrib/freebsd/Makefile.am
>  delete mode 100644 contrib/gconv/Makefile.am
>  create mode 100644 contrib/gconv/meson.build
>  create mode 100644 contrib/meson.build
>  delete mode 100644 contrib/rds-saa6588/.gitignore
>  delete mode 100644 contrib/rds-saa6588/Makefile.am
>  create mode 100644 contrib/rds-saa6588/meson.build
>  delete mode 100644 contrib/test/.gitignore
>  delete mode 100644 contrib/test/Makefile.am
>  create mode 100644 contrib/test/meson.build
>  delete mode 100644 contrib/xc3028-firmware/.gitignore
>  delete mode 100644 contrib/xc3028-firmware/Makefile.am
>  create mode 100644 contrib/xc3028-firmware/meson.build
>  rename doxygen_libdvbv5.cfg => doc/Doxyfile.in (96%)
>  create mode 100644 doc/meson.build
>  delete mode 100644 lib/Makefile.am
>  delete mode 100644 lib/libdvbv5/Makefile.am
>  delete mode 100644 lib/libdvbv5/libdvbv5.pc.in
>  create mode 100644 lib/libdvbv5/meson.build
>  delete mode 100644 lib/libv4l-mplane/Makefile.am
>  create mode 100644 lib/libv4l-mplane/meson.build
>  delete mode 100644 lib/libv4l1/Makefile.am
>  delete mode 100644 lib/libv4l1/libv4l1.pc.in
>  create mode 100644 lib/libv4l1/meson.build
>  delete mode 100644 lib/libv4l2/Makefile.am
>  delete mode 100644 lib/libv4l2/libv4l2.pc.in
>  create mode 100644 lib/libv4l2/meson.build
>  delete mode 100644 lib/libv4l2rds/Makefile.am
>  delete mode 100644 lib/libv4l2rds/libv4l2rds.pc.in
>  create mode 100644 lib/libv4l2rds/meson.build
>  delete mode 100644 lib/libv4lconvert/.gitignore
>  delete mode 100644 lib/libv4lconvert/Makefile.am
>  delete mode 100644 lib/libv4lconvert/libv4lconvert.pc.in
>  create mode 100644 lib/libv4lconvert/meson.build
>  create mode 100644 lib/meson.build
>  delete mode 100644 libdvbv5-po/Makevars
>  create mode 100644 libdvbv5-po/meson.build
>  delete mode 100644 m4/ac_define_dir.m4
>  delete mode 100644 m4/ax_prog_doxygen.m4
>  delete mode 100644 m4/ax_pthread.m4
>  delete mode 100644 m4/mode_t.m4
>  delete mode 100644 m4/visibility.m4
>  create mode 100644 meson.build
>  create mode 100644 meson_options.txt
>  delete mode 100644 utils/Makefile.am
>  delete mode 100644 utils/cec-compliance/.gitignore
>  delete mode 100644 utils/cec-compliance/Makefile.am
>  create mode 100644 utils/cec-compliance/meson.build
>  delete mode 100644 utils/cec-ctl/.gitignore
>  delete mode 100644 utils/cec-ctl/Makefile.am
>  create mode 100644 utils/cec-ctl/meson.build
>  delete mode 100644 utils/cec-follower/.gitignore
>  delete mode 100644 utils/cec-follower/Makefile.am
>  create mode 100644 utils/cec-follower/meson.build
>  delete mode 100644 utils/cx18-ctl/.gitignore
>  delete mode 100644 utils/cx18-ctl/Makefile.am
>  create mode 100644 utils/cx18-ctl/meson.build
>  delete mode 100644 utils/dvb/.gitignore
>  delete mode 100644 utils/dvb/Makefile.am
>  create mode 100644 utils/dvb/meson.build
>  create mode 100755 utils/gen_media_bus_format_codes.sh
>  create mode 100755 utils/gen_media_bus_format_names.sh
>  delete mode 100644 utils/ir-ctl/.gitignore
>  delete mode 100644 utils/ir-ctl/Makefile.am
>  create mode 100644 utils/ir-ctl/meson.build
>  delete mode 100644 utils/ivtv-ctl/.gitignore
>  delete mode 100644 utils/ivtv-ctl/Makefile.am
>  create mode 100644 utils/ivtv-ctl/meson.build
>  delete mode 100644 utils/keytable/.gitignore
>  delete mode 100644 utils/keytable/Makefile.am
>  delete mode 100644 utils/keytable/bpf_protocols/Makefile.am
>  create mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
>  create mode 100644 utils/keytable/bpf_protocols/meson.build
>  create mode 100644 utils/keytable/meson.build
>  create mode 100644 utils/keytable/rc_keymaps/meson.build
>  delete mode 100644 utils/libcecutil/.gitignore
>  delete mode 100644 utils/libcecutil/Makefile.am
>  create mode 100644 utils/libcecutil/meson.build
>  delete mode 100644 utils/libmedia_dev/Makefile.am
>  create mode 100644 utils/libmedia_dev/meson.build
>  delete mode 100644 utils/libv4l2util/Makefile.am
>  create mode 100644 utils/libv4l2util/meson.build
>  delete mode 100644 utils/media-ctl/.gitignore
>  delete mode 100644 utils/media-ctl/Makefile.am
>  delete mode 100644 utils/media-ctl/libmediactl.pc.in
>  delete mode 100644 utils/media-ctl/libv4l2subdev.pc.in
>  create mode 100644 utils/media-ctl/meson.build
>  create mode 100644 utils/meson.build
>  delete mode 100644 utils/qv4l2/.gitignore
>  delete mode 100644 utils/qv4l2/Makefile.am
>  create mode 100644 utils/qv4l2/meson.build
>  delete mode 100644 utils/qvidcap/.gitignore
>  delete mode 100644 utils/qvidcap/Makefile.am
>  create mode 100644 utils/qvidcap/meson.build
>  delete mode 100644 utils/rds-ctl/.gitignore
>  delete mode 100644 utils/rds-ctl/Makefile.am
>  create mode 100644 utils/rds-ctl/meson.build
>  delete mode 100644 utils/v4l2-compliance/.gitignore
>  delete mode 100644 utils/v4l2-compliance/Makefile.am
>  create mode 100644 utils/v4l2-compliance/meson.build
>  delete mode 100644 utils/v4l2-ctl/.gitignore
>  delete mode 100644 utils/v4l2-ctl/Makefile.am
>  create mode 100644 utils/v4l2-ctl/meson.build
>  delete mode 100644 utils/v4l2-dbg/.gitignore
>  delete mode 100644 utils/v4l2-dbg/Makefile.am
>  create mode 100644 utils/v4l2-dbg/meson.build
>  delete mode 100644 utils/v4l2-sysfs-path/.gitignore
>  delete mode 100644 utils/v4l2-sysfs-path/Makefile.am
>  create mode 100644 utils/v4l2-sysfs-path/meson.build
>  delete mode 100644 utils/v4l2-tracer/.gitignore
>  delete mode 100644 utils/v4l2-tracer/Makefile.am
>  create mode 120000 utils/v4l2-tracer/media-info.cpp
>  create mode 100644 utils/v4l2-tracer/meson.build
>  create mode 120000 utils/v4l2-tracer/v4l2-info.cpp
>  delete mode 100644 v4l-utils-po/Makevars
>  create mode 100644 v4l-utils-po/meson.build
> 
> 
> base-commit: 310b43a6452b31db2eaff863f057523eadbfcc14
> prerequisite-patch-id: 3536110786ee89506c05ec8d88fafb597b698d6b
> prerequisite-patch-id: faa8ba32b217309c605d66a0e685263043ae687d
> prerequisite-patch-id: a3c446b1d2375e7f7dc342083ad135bc5c47e9e8
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund
