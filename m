Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A4C228362
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 17:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbgGUPPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 11:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbgGUPPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 11:15:30 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A989C061794
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 08:15:30 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id ed14so9482439qvb.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+bMtmzQw3RYo3O18KRd5sMsUi8bop7S3QjK0dgPZLfU=;
        b=0tg11yZW4yTYw3ufnocVqsRnVvIWaKdomBIRAFN8FqN399hRAL72PzqZA/em04c3qM
         DjEuyFlrYuEPVN8hK6ECIAHE7AWGqIk5V2Et9ILFPYRutnMIqsCKhNWid4AMquxWz0y9
         x3UoHxi1mKH2nZi5L/dZAXWCu0C555UWa8pIX5J96wckDyAap0vMFHQQjHnN30WYtZaZ
         vSpstHOAHWLgD4oF8GDU03qPDYVsRrum20NU5qb+BiQbB99mNgd1iGR2tW6TfX06E0Rh
         LJyYLSkurX0cjtoFvNto4rn46jlg8jPd6VzsjqU/txHoVBk3XO1J+wLtFfamXGk1nm/4
         hwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+bMtmzQw3RYo3O18KRd5sMsUi8bop7S3QjK0dgPZLfU=;
        b=Aex+NwpyvngdRO9Gmq2jURMx9DE5jqYrDBNjrEwDVYHVlq+VdSGSMEgcnJS3EJrjML
         9O9eBYDHgiGhbiaNIssKUqGhReBuVfN4TlvyTLa3CXhXKr+hULo8DH3x29G1X+NpeLaQ
         sOXSrkk3QW5v0tk26C00zWk6l9D33SjumPuiPIQNxsEgaRMuPvtqJkOOKjrorq10fYAS
         FR6ITmN/ICOQ0/oes6EKKHgmgpkX15qi3RFPpR2VwPn74m654ALnRAsS3dzMdn7XS3OL
         dUUJBlyv7o3apo4fjhxbigvC3Zi6ThEnxEDF0WOjwF+YsNi5OeOf26lSFEabjDiT7qB1
         oNGQ==
X-Gm-Message-State: AOAM530y177Yn6YeyTkN5gGroeISTbxpGNg0gi11wIq7t6WSQpxscX2u
        lckpLQCWWOcOLDEUjFjYiYlsZQ2CzWK+eg==
X-Google-Smtp-Source: ABdhPJwIEKn2niMaB+059HoZreLqD0X/EPFb5YbnGuqCTlCCxZL9fF4ZG9GD0YiYIOy5M41HjTzEnw==
X-Received: by 2002:a0c:dc8c:: with SMTP id n12mr26816883qvk.221.1595344528904;
        Tue, 21 Jul 2020 08:15:28 -0700 (PDT)
Received: from ariel-arch.fibertel.com.ar (201-212-81-161.cab.prima.net.ar. [201.212.81.161])
        by smtp.gmail.com with ESMTPSA id o5sm23310441qtb.26.2020.07.21.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 08:15:28 -0700 (PDT)
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        ariel@vanguardiasur.com.ar, gjasny@googlemail.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com
Subject: [PATCH v2 0/1] Add support for meson building
Date:   Tue, 21 Jul 2020 12:14:33 -0300
Message-Id: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello there,

Here's another step on porting v4l-utils to meson build system.
Following the discussion thread for v1, several changes were added (see
Changelog below).

Tested Debian/Ubuntu packaging scripts from Gregor Jasny, which can be
found in branch `meson-build` from:

    https://git.launchpad.net/\~libv4l/+git/v4l-utils-packaging

This patchset was developed on top of v4l-utils tag: v4l-utils-1.20.0:

    commit 3b22ab02b960e4d1e90618e9fce9b7c8a80d814a
    Author: Gregor Jasny <gjasny@googlemail.com>
        Prepare for 1.20.0 release

You can find the patch pushed to the following branch:

    https://gitlab.com/adalessandro/v4l-utils/-/tree/v4l-utils-1.20.0-meson-v2

Further testing, deeper reviews, more comments, are all welcome :-)

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

Ariel D'Alessandro (1):
  Add support for meson building

 .gitignore                                    |    1 +
 Makefile.am                                   |    3 +-
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
 85 files changed, 4468 insertions(+), 25 deletions(-)
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

