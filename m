Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F77023DC5F
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgHFQvd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729486AbgHFQvB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:51:01 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63F5C002158
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 08:57:08 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id j187so45331089qke.11
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2020 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2L9uZb/NjOsW6lQdpKp2h2LDRv1ZV/tTC9tAXYPSaR4=;
        b=rc9WW0pQLSee1gAVHB8KkmQxQjjHT6dqyL8nAYWlVhgLVj0SRCShGooBUokNRsQwrW
         l2R+YC8GVbgKO4wKXo7Me0tzQxYR3850fb6R8StKnXlfZIlh9w9VgqId+pd1zUJ0eVDK
         PbVmET40qwzRzt+INYz+NtEeSlr5eYhg9wot/BrgN9oHHwGcCU3MyBHiuQMTA2w1b4kC
         xvyTAmgxVabsU4siBQhpegCRotYojU+50gw09X9xwlsTysZwcB8xup+6rqrJQPNZEruG
         sJ8MQHk9Vi8TVUgYHWwXEgB0OsUgQC79bKNJjle8ybZA5WFGvz41esSO5oM17gGm4OR9
         a43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2L9uZb/NjOsW6lQdpKp2h2LDRv1ZV/tTC9tAXYPSaR4=;
        b=OmV+y4u4q8VIbhOukorKxy/jfCg8HjLiqtfMA+IWbTKaEKlhdaPIQSb/tKrKZW42iJ
         ULGtqopAdy6B1Bj1lyPtVJN7HSrYfkmDY8UI3HlDjd9xJU1sxWNzL1IVyJv+S7iaQQiF
         cTsqdUvj5ocO3pXm6NCRwl+qEI3ZlYuwycQvDwGZFT5lNMupwYx1ia2FYiPFV/9HPh/O
         Jw89TWWYNMMXCkQD/YdLczbrr70wGL3imUKDjttNDYZB59pq/Wfbjth6l6ahmLGLAQn/
         uguxz2Rs/6UVcISy4KqBvjD4BL09p4zaWpK8Tt7zKvOai2cYL3Z3azhHd02+96FOPsrM
         96Xg==
X-Gm-Message-State: AOAM533oziMRF8rYBnvPrEMZHfs07PWTavN8Z0oAuBkFpsD7t4wrfsV8
        r20ui92DJYSpds3oEIzAZLs8AGEkmqc=
X-Google-Smtp-Source: ABdhPJxuXzuuvgYbREqBIs50xcy6g0+IibRTztzsRjCr2tKxTmKIdfcNdtwzMCmmboabpN4t57KE3Q==
X-Received: by 2002:a37:6644:: with SMTP id a65mr9136183qkc.4.1596729424795;
        Thu, 06 Aug 2020 08:57:04 -0700 (PDT)
Received: from localhost.localdomain ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id 205sm4317552qkj.19.2020.08.06.08.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:57:04 -0700 (PDT)
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        ariel@vanguardiasur.com.ar, gjasny@googlemail.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com
Subject: [PATCH v4l-utils v3 0/2] Add support for meson building
Date:   Thu,  6 Aug 2020 12:55:17 -0300
Message-Id: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This patchset was developed on top of v4l-utils current master branch:

    commit 1bcfe070d6218bf1074b38feb1e4fd02de2dd4dc
    Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>

        v4l2-ctl: fix INTEGER64 support, add common_print_control()

You can find the patchset pushed to the following branch:

    https://gitlab.com/adalessandro/v4l-utils/-/tree/v4l-utils-meson-v3

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

Ariel D'Alessandro (2):
  Move README to markdown syntax
  Add support for meson building

 .gitignore                                    |    1 +
 Makefile.am                                   |    3 +-
 README                                        |  275 --
 README.md                                     |  331 +++
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
 doc/Doxyfile.in                               | 2351 +++++++++++++++++
 doc/meson.build                               |   34 +
 gen-version.sh                                |   36 +
 lib/Makefile.am                               |    2 +-
 lib/libdvbv5/Makefile.am                      |    2 +-
 lib/libdvbv5/meson.build                      |  154 ++
 lib/libv4l-mplane/Makefile.am                 |    2 +
 lib/libv4l-mplane/meson.build                 |   23 +
 lib/libv4l1/Makefile.am                       |    2 +-
 lib/libv4l1/meson.build                       |   61 +
 lib/libv4l2/Makefile.am                       |    2 +-
 lib/libv4l2/meson.build                       |   70 +
 lib/libv4l2rds/Makefile.am                    |    2 +
 lib/libv4l2rds/meson.build                    |   36 +
 lib/libv4lconvert/Makefile.am                 |    2 +-
 lib/libv4lconvert/meson.build                 |  113 +
 lib/meson.build                               |   11 +
 libdvbv5-po/meson.build                       |    3 +
 meson.build                                   |  263 ++
 meson_options.txt                             |   50 +
 utils/Makefile.am                             |    2 +-
 utils/cec-compliance/Makefile.am              |    2 +-
 utils/cec-compliance/meson.build              |   24 +
 utils/cec-ctl/Makefile.am                     |    2 +-
 utils/cec-ctl/meson.build                     |   18 +
 utils/cec-follower/Makefile.am                |    2 +-
 utils/cec-follower/meson.build                |   21 +
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
 utils/keytable/bpf_protocols/meson.build      |   39 +
 .../user_dir_protocols/README.md              |    1 +
 utils/keytable/meson.build                    |   74 +
 utils/keytable/rc_keymaps/meson.build         |  147 ++
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
 utils/v4l2-compliance/meson.build             |   60 +
 utils/v4l2-ctl/Makefile.am                    |    2 +-
 utils/v4l2-ctl/meson.build                    |   75 +
 utils/v4l2-dbg/Makefile.am                    |    2 +-
 utils/v4l2-dbg/meson.build                    |   16 +
 utils/v4l2-sysfs-path/Makefile.am             |    2 +
 utils/v4l2-sysfs-path/meson.build             |   14 +
 v4l-utils-po/meson.build                      |    3 +
 version.h.in                                  |    1 +
 87 files changed, 4799 insertions(+), 300 deletions(-)
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
 create mode 100755 gen-version.sh
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
 create mode 100644 utils/keytable/bpf_protocols/user_dir_protocols/README.md
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
 create mode 100644 version.h.in

-- 
2.26.2

