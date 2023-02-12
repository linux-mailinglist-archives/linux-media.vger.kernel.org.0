Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A6F693571
	for <lists+linux-media@lfdr.de>; Sun, 12 Feb 2023 01:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjBLAvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 19:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBLAvo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 19:51:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39B117CF8
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 16:51:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 634F24B0;
        Sun, 12 Feb 2023 01:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676163099;
        bh=J5dHgdymTmolXZ6iQ6u96jWO7mHo+GuTPuGR2z3RQKM=;
        h=From:To:Cc:Subject:Date:From;
        b=i0Uc+weXWObVXMUyhYaGHM/rryk9n2vALAFPf/znm5V3bXPb4QkFP2rb/4InkOeby
         WLpBzTaPS/C2ifu6XD/daIhLdZ1gwRQhk3F/W/x3E9vG0TqaBfNW71Y0+sXx6DqTg8
         b20mBjD9s0OMfvnfkgqPVXAgKcIh3rTXnA+j/S80=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com
Subject: [v4l-utils] [PATCH v8 0/6] Switch build system to meson
Date:   Sun, 12 Feb 2023 02:51:31 +0200
Message-Id: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everybody,

This series is the latest (and greatest) attempt to switch v4l-utils
from autotools to meson.

Compared to v7, the series has been rebased on top of the latest master
branch, and lots of fixes have been added. All review comments should
have been addressed. Detailed changelogs are included in individual
patches, in particular in patch 3/6.

The rebase was a bit painful due to the new v4l2-tracer tool and its
code generation script. While meson handles code generation fine, it
required fixes to the script to be able to specify the output directory
and to generate the trace and retrace sources separately. Many thanks to
Sakari for his help with this, which I've included in this series as
patch 1/6.

Gregor, I haven't included the Tested-by tag you gave on v7 as v8
contains many small changes. Sorry about that.

The patches are based on 3 pending patches for v4l-utils that have been
posted to the list in the last couple of days:

- libv4lconvert: Don't ignore return value of ftruncate()
- keytable: Add -fno-stack-protector compilation option
- configure.ac: Add option to disable compilation of v4l2-tracer

None are strictly required, but I've included the equivalent of the
second and third patches in the meson support, so I wanted to base the
patches on top of the autotools' equivalent. I expect those three
patches to be merged soon.

As far as I can tell, meson support is now ready. I can address review
comments in a v9 if there are any, but I'd like to merge it soon to
avoid another painful rebase. I'll be available to fix issues on top if
any problem is encountered later.

A tag that includes this series can be found at

        git://linuxtv.org/pinchartl/v4l-utils.git tags/meson-v8

Ariel D'Alessandro (4):
  Move README to markdown syntax
  Add support for meson building
  Copy Doxygen configuration file to doc/
  meson: Add support for doxygen documentation

Laurent Pinchart (1):
  Drop autoconf/automake support

Sakari Ailus (1):
  utils: Allow choosing v4l2-tracer-gen.pl output

 .gitignore                                    |  62 +-
 INSTALL                                       | 105 ---
 INSTALL.md                                    | 142 ++++
 Makefile.am                                   |  20 -
 README                                        | 282 -------
 README.md                                     | 285 +++++++
 aminclude.am                                  | 186 -----
 bootstrap.sh                                  |  28 -
 configure.ac                                  | 694 ------------------
 contrib/Makefile.am                           |  25 -
 contrib/cobalt-ctl/.gitignore                 |   1 -
 contrib/cobalt-ctl/Makefile.am                |   3 -
 contrib/cobalt-ctl/meson.build                |   8 +
 contrib/decode_tm6000/.gitignore              |   1 -
 contrib/decode_tm6000/Makefile.am             |   4 -
 contrib/decode_tm6000/meson.build             |  14 +
 contrib/freebsd/Makefile.am                   |   3 -
 contrib/gconv/Makefile.am                     |  17 -
 contrib/gconv/meson.build                     |  44 ++
 contrib/meson.build                           |  13 +
 contrib/rds-saa6588/.gitignore                |   1 -
 contrib/rds-saa6588/Makefile.am               |   3 -
 contrib/rds-saa6588/meson.build               |   7 +
 contrib/test/.gitignore                       |  11 -
 contrib/test/Makefile.am                      |  65 --
 contrib/test/meson.build                      | 143 ++++
 contrib/xc3028-firmware/.gitignore            |   1 -
 contrib/xc3028-firmware/Makefile.am           |   5 -
 contrib/xc3028-firmware/meson.build           |  11 +
 doxygen_libdvbv5.cfg => doc/Doxyfile.in       | 128 ++--
 doc/meson.build                               |  34 +
 lib/Makefile.am                               |  13 -
 lib/libdvbv5/Makefile.am                      | 126 ----
 lib/libdvbv5/libdvbv5.pc.in                   |  11 -
 lib/libdvbv5/meson.build                      | 156 ++++
 lib/libv4l-mplane/Makefile.am                 |   7 -
 lib/libv4l-mplane/meson.build                 |  23 +
 lib/libv4l1/Makefile.am                       |  29 -
 lib/libv4l1/libv4l1.pc.in                     |  12 -
 lib/libv4l1/meson.build                       |  64 ++
 lib/libv4l2/Makefile.am                       |  32 -
 lib/libv4l2/libv4l2.pc.in                     |  12 -
 lib/libv4l2/meson.build                       |  73 ++
 lib/libv4l2rds/Makefile.am                    |  12 -
 lib/libv4l2rds/libv4l2rds.pc.in               |  11 -
 lib/libv4l2rds/meson.build                    |  37 +
 lib/libv4lconvert/.gitignore                  |   3 -
 lib/libv4lconvert/Makefile.am                 |  36 -
 lib/libv4lconvert/libv4lconvert.pc.in         |  11 -
 lib/libv4lconvert/meson.build                 | 117 +++
 lib/meson.build                               |  11 +
 libdvbv5-po/Makevars                          |  72 --
 libdvbv5-po/meson.build                       |   3 +
 m4/ac_define_dir.m4                           |  34 -
 m4/ax_prog_doxygen.m4                         | 532 --------------
 m4/ax_pthread.m4                              | 522 -------------
 m4/mode_t.m4                                  |  26 -
 m4/visibility.m4                              |  82 ---
 meson.build                                   | 399 ++++++++++
 meson_options.txt                             |  54 ++
 utils/Makefile.am                             |  41 --
 utils/cec-compliance/.gitignore               |   2 -
 utils/cec-compliance/Makefile.am              |   8 -
 utils/cec-compliance/meson.build              |  23 +
 utils/cec-ctl/.gitignore                      |   2 -
 utils/cec-ctl/Makefile.am                     |   8 -
 utils/cec-ctl/meson.build                     |  18 +
 utils/cec-follower/.gitignore                 |   2 -
 utils/cec-follower/Makefile.am                |   8 -
 utils/cec-follower/meson.build                |  19 +
 utils/cx18-ctl/.gitignore                     |   1 -
 utils/cx18-ctl/Makefile.am                    |   3 -
 utils/cx18-ctl/meson.build                    |   8 +
 utils/dvb/.gitignore                          |   9 -
 utils/dvb/Makefile.am                         |  35 -
 utils/dvb/meson.build                         |  70 ++
 utils/gen_media_bus_format_codes.sh           |   7 +
 utils/gen_media_bus_format_names.sh           |   7 +
 utils/ir-ctl/.gitignore                       |   2 -
 utils/ir-ctl/Makefile.am                      |   6 -
 utils/ir-ctl/meson.build                      |  23 +
 utils/ivtv-ctl/.gitignore                     |   1 -
 utils/ivtv-ctl/Makefile.am                    |   4 -
 utils/ivtv-ctl/meson.build                    |  13 +
 utils/keytable/.gitignore                     |   3 -
 utils/keytable/Makefile.am                    |  36 -
 utils/keytable/bpf_protocols/Makefile.am      |  24 -
 .../bpf_protocols/clang_sys_includes.sh       |   9 +
 utils/keytable/bpf_protocols/meson.build      |  31 +
 utils/keytable/meson.build                    |  85 +++
 utils/keytable/rc_keymaps/meson.build         | 150 ++++
 utils/libcecutil/.gitignore                   |   4 -
 utils/libcecutil/Makefile.am                  |  24 -
 utils/libcecutil/meson.build                  |  45 ++
 utils/libmedia_dev/Makefile.am                |   7 -
 utils/libmedia_dev/meson.build                |  14 +
 utils/libv4l2util/Makefile.am                 |   7 -
 utils/libv4l2util/meson.build                 |  16 +
 utils/media-ctl/.gitignore                    |   3 -
 utils/media-ctl/Makefile.am                   |  30 -
 utils/media-ctl/libmediactl.pc.in             |  10 -
 utils/media-ctl/libv4l2subdev.pc.in           |  11 -
 utils/media-ctl/meson.build                   |  43 ++
 utils/meson.build                             |  43 ++
 utils/qv4l2/.gitignore                        |   9 -
 utils/qv4l2/Makefile.am                       |  54 --
 utils/qv4l2/meson.build                       |  79 ++
 utils/qvidcap/.gitignore                      |   6 -
 utils/qvidcap/Makefile.am                     |  42 --
 utils/qvidcap/meson.build                     |  87 +++
 utils/rds-ctl/.gitignore                      |   2 -
 utils/rds-ctl/Makefile.am                     |   6 -
 utils/rds-ctl/meson.build                     |  17 +
 utils/v4l2-compliance/.gitignore              |   3 -
 utils/v4l2-compliance/Makefile.am             |  31 -
 utils/v4l2-compliance/meson.build             |  63 ++
 utils/v4l2-ctl/.gitignore                     |   4 -
 utils/v4l2-ctl/Makefile.am                    |  44 --
 utils/v4l2-ctl/meson.build                    |  75 ++
 utils/v4l2-dbg/.gitignore                     |   1 -
 utils/v4l2-dbg/Makefile.am                    |   6 -
 utils/v4l2-dbg/meson.build                    |  20 +
 utils/v4l2-sysfs-path/.gitignore              |   1 -
 utils/v4l2-sysfs-path/Makefile.am             |   4 -
 utils/v4l2-sysfs-path/meson.build             |  14 +
 utils/v4l2-tracer/.gitignore                  |   7 -
 utils/v4l2-tracer/Makefile.am                 |  36 -
 utils/v4l2-tracer/media-info.cpp              |   1 +
 utils/v4l2-tracer/meson.build                 | 133 ++++
 utils/v4l2-tracer/v4l2-info.cpp               |   1 +
 utils/v4l2-tracer/v4l2-tracer-gen.pl          |  36 +-
 v4l-utils-po/Makevars                         |  72 --
 v4l-utils-po/meson.build                      |   3 +
 v4l-utils.spec.in                             |   6 +-
 134 files changed, 2854 insertions(+), 3790 deletions(-)
 delete mode 100644 INSTALL
 create mode 100644 INSTALL.md
 delete mode 100644 Makefile.am
 delete mode 100644 README
 create mode 100644 README.md
 delete mode 100644 aminclude.am
 delete mode 100755 bootstrap.sh
 delete mode 100644 configure.ac
 delete mode 100644 contrib/Makefile.am
 delete mode 100644 contrib/cobalt-ctl/.gitignore
 delete mode 100644 contrib/cobalt-ctl/Makefile.am
 create mode 100644 contrib/cobalt-ctl/meson.build
 delete mode 100644 contrib/decode_tm6000/.gitignore
 delete mode 100644 contrib/decode_tm6000/Makefile.am
 create mode 100644 contrib/decode_tm6000/meson.build
 delete mode 100644 contrib/freebsd/Makefile.am
 delete mode 100644 contrib/gconv/Makefile.am
 create mode 100644 contrib/gconv/meson.build
 create mode 100644 contrib/meson.build
 delete mode 100644 contrib/rds-saa6588/.gitignore
 delete mode 100644 contrib/rds-saa6588/Makefile.am
 create mode 100644 contrib/rds-saa6588/meson.build
 delete mode 100644 contrib/test/.gitignore
 delete mode 100644 contrib/test/Makefile.am
 create mode 100644 contrib/test/meson.build
 delete mode 100644 contrib/xc3028-firmware/.gitignore
 delete mode 100644 contrib/xc3028-firmware/Makefile.am
 create mode 100644 contrib/xc3028-firmware/meson.build
 rename doxygen_libdvbv5.cfg => doc/Doxyfile.in (96%)
 create mode 100644 doc/meson.build
 delete mode 100644 lib/Makefile.am
 delete mode 100644 lib/libdvbv5/Makefile.am
 delete mode 100644 lib/libdvbv5/libdvbv5.pc.in
 create mode 100644 lib/libdvbv5/meson.build
 delete mode 100644 lib/libv4l-mplane/Makefile.am
 create mode 100644 lib/libv4l-mplane/meson.build
 delete mode 100644 lib/libv4l1/Makefile.am
 delete mode 100644 lib/libv4l1/libv4l1.pc.in
 create mode 100644 lib/libv4l1/meson.build
 delete mode 100644 lib/libv4l2/Makefile.am
 delete mode 100644 lib/libv4l2/libv4l2.pc.in
 create mode 100644 lib/libv4l2/meson.build
 delete mode 100644 lib/libv4l2rds/Makefile.am
 delete mode 100644 lib/libv4l2rds/libv4l2rds.pc.in
 create mode 100644 lib/libv4l2rds/meson.build
 delete mode 100644 lib/libv4lconvert/.gitignore
 delete mode 100644 lib/libv4lconvert/Makefile.am
 delete mode 100644 lib/libv4lconvert/libv4lconvert.pc.in
 create mode 100644 lib/libv4lconvert/meson.build
 create mode 100644 lib/meson.build
 delete mode 100644 libdvbv5-po/Makevars
 create mode 100644 libdvbv5-po/meson.build
 delete mode 100644 m4/ac_define_dir.m4
 delete mode 100644 m4/ax_prog_doxygen.m4
 delete mode 100644 m4/ax_pthread.m4
 delete mode 100644 m4/mode_t.m4
 delete mode 100644 m4/visibility.m4
 create mode 100644 meson.build
 create mode 100644 meson_options.txt
 delete mode 100644 utils/Makefile.am
 delete mode 100644 utils/cec-compliance/.gitignore
 delete mode 100644 utils/cec-compliance/Makefile.am
 create mode 100644 utils/cec-compliance/meson.build
 delete mode 100644 utils/cec-ctl/.gitignore
 delete mode 100644 utils/cec-ctl/Makefile.am
 create mode 100644 utils/cec-ctl/meson.build
 delete mode 100644 utils/cec-follower/.gitignore
 delete mode 100644 utils/cec-follower/Makefile.am
 create mode 100644 utils/cec-follower/meson.build
 delete mode 100644 utils/cx18-ctl/.gitignore
 delete mode 100644 utils/cx18-ctl/Makefile.am
 create mode 100644 utils/cx18-ctl/meson.build
 delete mode 100644 utils/dvb/.gitignore
 delete mode 100644 utils/dvb/Makefile.am
 create mode 100644 utils/dvb/meson.build
 create mode 100755 utils/gen_media_bus_format_codes.sh
 create mode 100755 utils/gen_media_bus_format_names.sh
 delete mode 100644 utils/ir-ctl/.gitignore
 delete mode 100644 utils/ir-ctl/Makefile.am
 create mode 100644 utils/ir-ctl/meson.build
 delete mode 100644 utils/ivtv-ctl/.gitignore
 delete mode 100644 utils/ivtv-ctl/Makefile.am
 create mode 100644 utils/ivtv-ctl/meson.build
 delete mode 100644 utils/keytable/.gitignore
 delete mode 100644 utils/keytable/Makefile.am
 delete mode 100644 utils/keytable/bpf_protocols/Makefile.am
 create mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
 create mode 100644 utils/keytable/bpf_protocols/meson.build
 create mode 100644 utils/keytable/meson.build
 create mode 100644 utils/keytable/rc_keymaps/meson.build
 delete mode 100644 utils/libcecutil/.gitignore
 delete mode 100644 utils/libcecutil/Makefile.am
 create mode 100644 utils/libcecutil/meson.build
 delete mode 100644 utils/libmedia_dev/Makefile.am
 create mode 100644 utils/libmedia_dev/meson.build
 delete mode 100644 utils/libv4l2util/Makefile.am
 create mode 100644 utils/libv4l2util/meson.build
 delete mode 100644 utils/media-ctl/.gitignore
 delete mode 100644 utils/media-ctl/Makefile.am
 delete mode 100644 utils/media-ctl/libmediactl.pc.in
 delete mode 100644 utils/media-ctl/libv4l2subdev.pc.in
 create mode 100644 utils/media-ctl/meson.build
 create mode 100644 utils/meson.build
 delete mode 100644 utils/qv4l2/.gitignore
 delete mode 100644 utils/qv4l2/Makefile.am
 create mode 100644 utils/qv4l2/meson.build
 delete mode 100644 utils/qvidcap/.gitignore
 delete mode 100644 utils/qvidcap/Makefile.am
 create mode 100644 utils/qvidcap/meson.build
 delete mode 100644 utils/rds-ctl/.gitignore
 delete mode 100644 utils/rds-ctl/Makefile.am
 create mode 100644 utils/rds-ctl/meson.build
 delete mode 100644 utils/v4l2-compliance/.gitignore
 delete mode 100644 utils/v4l2-compliance/Makefile.am
 create mode 100644 utils/v4l2-compliance/meson.build
 delete mode 100644 utils/v4l2-ctl/.gitignore
 delete mode 100644 utils/v4l2-ctl/Makefile.am
 create mode 100644 utils/v4l2-ctl/meson.build
 delete mode 100644 utils/v4l2-dbg/.gitignore
 delete mode 100644 utils/v4l2-dbg/Makefile.am
 create mode 100644 utils/v4l2-dbg/meson.build
 delete mode 100644 utils/v4l2-sysfs-path/.gitignore
 delete mode 100644 utils/v4l2-sysfs-path/Makefile.am
 create mode 100644 utils/v4l2-sysfs-path/meson.build
 delete mode 100644 utils/v4l2-tracer/.gitignore
 delete mode 100644 utils/v4l2-tracer/Makefile.am
 create mode 120000 utils/v4l2-tracer/media-info.cpp
 create mode 100644 utils/v4l2-tracer/meson.build
 create mode 120000 utils/v4l2-tracer/v4l2-info.cpp
 delete mode 100644 v4l-utils-po/Makevars
 create mode 100644 v4l-utils-po/meson.build


base-commit: 310b43a6452b31db2eaff863f057523eadbfcc14
prerequisite-patch-id: 3536110786ee89506c05ec8d88fafb597b698d6b
prerequisite-patch-id: faa8ba32b217309c605d66a0e685263043ae687d
prerequisite-patch-id: a3c446b1d2375e7f7dc342083ad135bc5c47e9e8
-- 
Regards,

Laurent Pinchart

