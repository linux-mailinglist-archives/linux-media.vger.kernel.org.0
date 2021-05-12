Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC0C37EAE6
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 00:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244679AbhELTOP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 15:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359616AbhELSxf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 14:53:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F30C06175F
        for <linux-media@vger.kernel.org>; Wed, 12 May 2021 11:49:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: adalessandro)
        with ESMTPSA id 9CE9E1F40F2A
From:   Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, mchehab+huawei@kernel.org, rosenp@gmail.com
Subject: [v4l-utils v5 0/5] Add support for meson building
Date:   Wed, 12 May 2021 15:49:41 -0300
Message-Id: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Another attempt to support meson build, addressing comments/fixes from
reviewers.

This patchset was developed on top of v4l-utils current master branch:

    commit f0c7e3d71eaf4182bae7eb3ee0e43b4eeb047ea9
    Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>

        v4l2-ctl: add '--set-edid type=list' support

You can find the patchset pushed to the following branch:

    https://gitlab.collabora.com/adalessandro/v4l-utils/-/tree/v4l-utils-meson-v5

Feedback appreciated as always :-)

Changes from v4:

  * Dropped install_subdir() work-around to install empty dir. Supported
    now in meson v0.57.
  * Bump to meson v0.57. Replaced deprecated methods.
  * Added override_dependency() calls on libraries.
  * Properly check for bpf and SDL2 dependencies.
  * Removed libraries_private field from libv4lconvert pkgconfig.
  * Documented meson static builds support.
  * Set default compiler standard options.
  * Added bpf check in keytable.

Changes from v3:

  * Split Doxygen support patch.
  * Properly generate config.h configuration file.

Changes from v2:

  * Updated to current master branch.
  * Moved README to markdown syntax.
  * Documented meson build.
  * Set PACKAGE_VERSION config macro as quoted.

Changes from v1:

  * Updated project version to 1.21.0.
  * Fixed clang includes in keytable bpf compilation.
  * Improved variable reutilization in meson scripts.        
  * Set libraries version and soversion.                     
  * Control symbol visibility.                  
  * Install empty 'protocols' directory in keytable user dir.
  * Fixed svg filenames in qv4l2 and qvidcap.                         
  * Added support for Doxygen documentation (html and man).
  * Updated required meson version to v0.53 (for fs module).       
  * Added new files to EXTRA_DIST in each Makefile.am.              

Regards,

Ariel D'Alessandro (5):
  Move README to markdown syntax
  Add support for meson building
  Copy Doxygen configuration file to doc/
  meson: Add support for doxygen documentation
  Makefile.am: Distribute meson related files

 .gitignore                                    |    1 +
 INSTALL.meson.md                              |  142 +
 Makefile.am                                   |    5 +-
 README                                        |  274 --
 README.md                                     |  332 +++
 contrib/Makefile.am                           |    3 +-
 contrib/cobalt-ctl/Makefile.am                |    2 +
 contrib/cobalt-ctl/meson.build                |    8 +
 contrib/decode_tm6000/Makefile.am             |    2 +
 contrib/decode_tm6000/meson.build             |   14 +
 contrib/gconv/Makefile.am                     |    2 +-
 contrib/gconv/meson.build                     |   44 +
 contrib/meson.build                           |   13 +
 contrib/rds-saa6588/Makefile.am               |    2 +
 contrib/rds-saa6588/meson.build               |    7 +
 contrib/test/Makefile.am                      |    3 +-
 contrib/test/meson.build                      |  143 +
 contrib/xc3028-firmware/Makefile.am           |    2 +-
 contrib/xc3028-firmware/meson.build           |   11 +
 doc/Doxyfile.in                               | 2352 +++++++++++++++++
 doc/meson.build                               |   34 +
 lib/Makefile.am                               |    2 +-
 lib/libdvbv5/Makefile.am                      |    2 +-
 lib/libdvbv5/meson.build                      |  159 ++
 lib/libv4l-mplane/Makefile.am                 |    2 +
 lib/libv4l-mplane/meson.build                 |   23 +
 lib/libv4l1/Makefile.am                       |    2 +-
 lib/libv4l1/meson.build                       |   62 +
 lib/libv4l2/Makefile.am                       |    2 +-
 lib/libv4l2/meson.build                       |   71 +
 lib/libv4l2rds/Makefile.am                    |    2 +
 lib/libv4l2rds/meson.build                    |   37 +
 lib/libv4lconvert/Makefile.am                 |    2 +-
 lib/libv4lconvert/meson.build                 |  117 +
 lib/meson.build                               |   11 +
 libdvbv5-po/meson.build                       |    3 +
 meson.build                                   |  334 +++
 meson_options.txt                             |   50 +
 utils/Makefile.am                             |    2 +-
 utils/cec-compliance/Makefile.am              |    2 +-
 utils/cec-compliance/meson.build              |   22 +
 utils/cec-ctl/Makefile.am                     |    2 +-
 utils/cec-ctl/meson.build                     |   18 +
 utils/cec-follower/Makefile.am                |    2 +-
 utils/cec-follower/meson.build                |   19 +
 utils/cx18-ctl/Makefile.am                    |    2 +
 utils/cx18-ctl/meson.build                    |    8 +
 utils/dvb/Makefile.am                         |    2 +-
 utils/dvb/meson.build                         |   70 +
 utils/gen_media_bus_format_codes.sh           |    7 +
 utils/gen_media_bus_format_names.sh           |    7 +
 utils/ir-ctl/Makefile.am                      |    2 +
 utils/ir-ctl/meson.build                      |   23 +
 utils/ivtv-ctl/Makefile.am                    |    2 +
 utils/ivtv-ctl/meson.build                    |   13 +
 utils/keytable/Makefile.am                    |    3 +-
 utils/keytable/bpf_protocols/Makefile.am      |    3 +-
 .../bpf_protocols/clang_sys_includes.sh       |    9 +
 utils/keytable/bpf_protocols/meson.build      |   31 +
 utils/keytable/meson.build                    |   81 +
 utils/keytable/rc_keymaps/meson.build         |  151 ++
 utils/libcecutil/Makefile.am                  |    2 +-
 utils/libcecutil/meson.build                  |   45 +
 utils/libmedia_dev/Makefile.am                |    2 +-
 utils/libmedia_dev/meson.build                |   14 +
 utils/libv4l2util/Makefile.am                 |    2 +-
 utils/libv4l2util/meson.build                 |   16 +
 utils/media-ctl/Makefile.am                   |    2 +
 utils/media-ctl/meson.build                   |   43 +
 utils/meson.build                             |   46 +
 utils/qv4l2/Makefile.am                       |    3 +-
 utils/qv4l2/meson.build                       |   80 +
 utils/qvidcap/Makefile.am                     |    3 +-
 utils/qvidcap/meson.build                     |   82 +
 utils/rds-ctl/Makefile.am                     |    1 +
 utils/rds-ctl/meson.build                     |   13 +
 utils/v4l2-compliance/Makefile.am             |    2 +-
 utils/v4l2-compliance/meson.build             |   58 +
 utils/v4l2-ctl/Makefile.am                    |    2 +-
 utils/v4l2-ctl/meson.build                    |   75 +
 utils/v4l2-dbg/Makefile.am                    |    2 +-
 utils/v4l2-dbg/meson.build                    |   16 +
 utils/v4l2-sysfs-path/Makefile.am             |    2 +
 utils/v4l2-sysfs-path/meson.build             |   14 +
 v4l-utils-po/meson.build                      |    3 +
 85 files changed, 4987 insertions(+), 299 deletions(-)
 create mode 100644 INSTALL.meson.md
 delete mode 100644 README
 create mode 100644 README.md
 create mode 100644 contrib/cobalt-ctl/meson.build
 create mode 100644 contrib/decode_tm6000/meson.build
 create mode 100644 contrib/gconv/meson.build
 create mode 100644 contrib/meson.build
 create mode 100644 contrib/rds-saa6588/meson.build
 create mode 100644 contrib/test/meson.build
 create mode 100644 contrib/xc3028-firmware/meson.build
 create mode 100644 doc/Doxyfile.in
 create mode 100644 doc/meson.build
 create mode 100644 lib/libdvbv5/meson.build
 create mode 100644 lib/libv4l-mplane/meson.build
 create mode 100644 lib/libv4l1/meson.build
 create mode 100644 lib/libv4l2/meson.build
 create mode 100644 lib/libv4l2rds/meson.build
 create mode 100644 lib/libv4lconvert/meson.build
 create mode 100644 lib/meson.build
 create mode 100644 libdvbv5-po/meson.build
 create mode 100644 meson.build
 create mode 100644 meson_options.txt
 create mode 100644 utils/cec-compliance/meson.build
 create mode 100644 utils/cec-ctl/meson.build
 create mode 100644 utils/cec-follower/meson.build
 create mode 100644 utils/cx18-ctl/meson.build
 create mode 100644 utils/dvb/meson.build
 create mode 100755 utils/gen_media_bus_format_codes.sh
 create mode 100755 utils/gen_media_bus_format_names.sh
 create mode 100644 utils/ir-ctl/meson.build
 create mode 100644 utils/ivtv-ctl/meson.build
 create mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
 create mode 100644 utils/keytable/bpf_protocols/meson.build
 create mode 100644 utils/keytable/meson.build
 create mode 100644 utils/keytable/rc_keymaps/meson.build
 create mode 100644 utils/libcecutil/meson.build
 create mode 100644 utils/libmedia_dev/meson.build
 create mode 100644 utils/libv4l2util/meson.build
 create mode 100644 utils/media-ctl/meson.build
 create mode 100644 utils/meson.build
 create mode 100644 utils/qv4l2/meson.build
 create mode 100644 utils/qvidcap/meson.build
 create mode 100644 utils/rds-ctl/meson.build
 create mode 100644 utils/v4l2-compliance/meson.build
 create mode 100644 utils/v4l2-ctl/meson.build
 create mode 100644 utils/v4l2-dbg/meson.build
 create mode 100644 utils/v4l2-sysfs-path/meson.build
 create mode 100644 v4l-utils-po/meson.build

-- 
2.30.2

