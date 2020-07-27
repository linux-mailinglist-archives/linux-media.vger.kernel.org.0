Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A9922E449
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 05:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgG0DPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 23:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727948AbgG0DO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 23:14:58 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6378FC0619D2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:14:58 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w17so7264388ply.11
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5hMs4n8ytaXiC8AELvvR6J9wwKmNQs+XrXgS0LAK2GU=;
        b=GwWy8SboULNDBcP5yg/lamPL87FP4WsGASzvCoNB7w8fz92EOuY9db7Y2bEJhXdyvV
         RsBeyC8H2oVBN++rRZ937zlDmgnAPqGbbXYbfQhr/k7DNoVZzsgaoZmZrVHBx43Cr4zF
         nOqu7X/YA2+Fmqftgc/jN+zwgtqynhN0xYjOsk5zPD5hs/UCEKp17QPpJoeX4a07TaNL
         Ps1MXQgN5GoEnqAEZvFpssWkMCwtrviuCVHTJaMPlx+Rr6m/7mIb0PsDMxiEIzZnIqAQ
         wozkyegaDSZp6/nrLsmiPtn4PYnS9LbOHx08t8xLbMIgntfTOZnhPxiKMUCEWncaklhp
         1UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5hMs4n8ytaXiC8AELvvR6J9wwKmNQs+XrXgS0LAK2GU=;
        b=gjo5AkzrozlDsjMkYByiiTGX8SlK1MaGOHiLwPZYECkHA4PhpMFuW5DhWMIokmPJDG
         ezxzwkMJi+eK3y0ZTPN//cyiyHn+0qZqTlDBkWv01h2PSqeQH78RX/EvzRCsHatnRb0A
         R3Jae858piWTZ4yuDTgWmJRQY7sf2HbwPr0jqWbTDjSDY7y0GIVPYlnP4McQjp3YSAfu
         LVvCXkVbE1gEiGcCX2uy0UpwGokJ1Q6VVxhsdeh4TVv8nF7eT/ywF0pmuk8dCnnXrifM
         gJyO5VnQr1uebk9vvJrvV1apsJrG7li2pJW343DLW45Z2+cNWpcMFjIbKEaxkZmR3WDv
         7viw==
X-Gm-Message-State: AOAM533xoocksN8q4aknzlD4nNqB/CahW3SgBAGk6u7YJsr8KdbsjQk7
        QJPHPVpn3gj696AFS9rW9hkGJ13nweI=
X-Google-Smtp-Source: ABdhPJyS36fBG8M6N2fjKlKeTiF+lZXUmkHPjWC1jifdabEeYsbucwJMlrwfuK1aUtL3nROn0vRfFg==
X-Received: by 2002:a17:90a:3044:: with SMTP id q4mr15338732pjl.81.1595819697677;
        Sun, 26 Jul 2020 20:14:57 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id t126sm13259345pfd.214.2020.07.26.20.14.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 20:14:57 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/8] v4l-utils: C++11 modernization
Date:   Sun, 26 Jul 2020 20:14:48 -0700
Message-Id: <20200727031456.232955-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I noticed that the utils do not compile in C++98 mode as
v4l2-test-buffers.cpp includes <atomic>, which is a C++11+ header.

Ran the codebase through clang-tidy and modernized the code slightly.

Rosen Penev (8):
  fix GCC enum warning
  [clang-tidy] convert to range based loops
  [clang-tidy] use auto
  [clang-tidy] use using instead of typedef
  [clang-tidy] use emplace_back
  [clang-tidy] convert files to reference
  [clang-tidy] fix mismatching declarations
  [clang-tidy] use explicit for single argument constructors

 lib/include/libdvbv5/atsc_eit.h               |   4 +-
 lib/include/libdvbv5/cat.h                    |   4 +-
 lib/include/libdvbv5/descriptors.h            |   2 +-
 lib/include/libdvbv5/dvb-demux.h              |   2 +-
 lib/include/libdvbv5/dvb-dev.h                |   2 +-
 lib/include/libdvbv5/dvb-fe.h                 |   2 +-
 lib/include/libdvbv5/dvb-file.h               |   4 +-
 lib/include/libdvbv5/dvb-scan.h               |  16 +--
 lib/include/libdvbv5/eit.h                    |   4 +-
 lib/include/libdvbv5/header.h                 |   4 +-
 lib/include/libdvbv5/mgt.h                    |   4 +-
 lib/include/libdvbv5/mpeg_pes.h               |   2 +-
 lib/include/libdvbv5/nit.h                    |   6 +-
 lib/include/libdvbv5/pat.h                    |   4 +-
 lib/include/libdvbv5/pmt.h                    |   4 +-
 lib/include/libdvbv5/sdt.h                    |   4 +-
 lib/include/libdvbv5/vct.h                    |   4 +-
 lib/include/libv4l2.h                         |   2 +-
 lib/libdvbv5/parse_string.h                   |   2 +-
 lib/libv4lconvert/libv4lconvert-priv.h        |  48 ++++----
 .../processing/libv4lprocessing.h             |   2 +-
 lib/libv4lconvert/tinyjpeg.h                  |   2 +-
 utils/cec-compliance/cec-compliance.cpp       |   2 +-
 utils/cec-compliance/cec-test.cpp             |  57 +++++----
 utils/cec-ctl/cec-ctl.cpp                     |  34 +++---
 utils/cec-follower/cec-follower.cpp           |   6 +-
 utils/cec-follower/cec-processing.cpp         |  12 +-
 utils/common/v4l-helpers.h                    |   2 +-
 utils/common/v4l-stream.h                     |   4 +-
 utils/keytable/bpf.h                          |   6 +-
 utils/libcecutil/cec-info.cpp                 |  24 ++--
 utils/libcecutil/cec-log.cpp                  |  12 +-
 utils/libmedia_dev/get_media_devices.c        |   6 +-
 utils/rds-ctl/rds-ctl.cpp                     |  18 ++-
 utils/v4l2-compliance/v4l2-compliance.cpp     |  10 +-
 utils/v4l2-compliance/v4l2-test-buffers.cpp   |  19 ++-
 utils/v4l2-compliance/v4l2-test-formats.cpp   |  14 +--
 utils/v4l2-compliance/v4l2-test-media.cpp     |   7 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp            | 115 ++++++++----------
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp           |   4 +-
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp         |   9 +-
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp            |   4 +-
 utils/v4l2-ctl/v4l2-ctl.cpp                   |   8 +-
 utils/v4l2-dbg/v4l2-dbg.cpp                   |   7 +-
 44 files changed, 243 insertions(+), 265 deletions(-)

-- 
2.26.2

