Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F5E36662A
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235529AbhDUHVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbhDUHVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:21:11 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A848C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:39 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id w10so28939567pgh.5
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lsJQGiylJ8Q0fC63RMBRAV5F1QZambfdv6JDw+W5Fz4=;
        b=JBrlyViKYWS32H4lIdRNpWGj9x2qcatsTYVFyryLNEqriZn4U/lrcGuCAIbHOoiPIG
         zNGfjFqRoZOqtoghWdWUHQrGWLc1p5oZt4T1/p8o2443YCoSYiJZ611d6VmFJX5vjmq2
         2HXtTnk9waZvb/5dz0fbLarnSeeTi/R/jAm/3mdIXimkbAZ3o74hKc0/IfRYVY6eW9JD
         vdpkaezR0Q9XYs7Yng8UIgskNDrlddyTwXOeSQrFMkH+mae0gpyChOsgWwZ0Ke5qENnK
         xIhLFt5+z88/APLX/m2pRiqiVUCUE3MJFbPaFIvwlQxIVZGCDQAkRlMR4Lum09aJJEQA
         j1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lsJQGiylJ8Q0fC63RMBRAV5F1QZambfdv6JDw+W5Fz4=;
        b=HEscAK9z/H+LdOnOzZCIt34CbP6Uni2avSbAiLM3i4H2JERxE3oBwMS4l1cQtKBGjN
         l4PBu6KqAVJyqJrEIebGXfflen2+jWzMVlgRBe4ySzZWLpDBM9Y5cxZU0/0gDE97S8Yb
         Em4HHddGCWgvNIybaPuLFdzKCW2C4fKXSdkTnENLXskgMCmqMtQBZMkPvfG+AgQtK/FZ
         vbS0F6h1lkdpq+WvunAEnixnoA2e8D80Y8Ld7fdajmoflNLlVKkTCElImBNC+mAIDpY1
         xP/QH6eKkwZaafJQOsAiKGPmCcMqe+2eKRp1nZDCFtSGEZoNyvi09v12ZIYH63WGxGIw
         pKbw==
X-Gm-Message-State: AOAM532Htd/7oh9aOQCVSLCxtwO75J64CMOd6azzNufHftZ02Nrr/AOz
        /DocJJi28p2dQS80pI7TMcuNKrvxcMwW+g==
X-Google-Smtp-Source: ABdhPJwJ/flYRx8nBn37/BzUmcDRW3MQcdEd0YKUW/7knMOQWY2/gmSYYm80sM+9Mn+h+JxyJScyJA==
X-Received: by 2002:a63:5112:: with SMTP id f18mr13182556pgb.379.1618989638844;
        Wed, 21 Apr 2021 00:20:38 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id p10sm907815pfo.210.2021.04.21.00.20.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:20:38 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/8] remove unused ARRAY_SIZE
Date:   Wed, 21 Apr 2021 00:20:30 -0700
Message-Id: <20210421072035.4188497-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421072035.4188497-1-rosenp@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a C construct that is not really needed in C++.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.h | 3 ---
 utils/cec-ctl/cec-pin.cpp             | 2 --
 utils/cec-follower/cec-follower.h     | 3 ---
 utils/cec-follower/cec-processing.cpp | 3 ---
 utils/rds-ctl/rds-ctl.cpp             | 2 --
 5 files changed, 13 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index 26c70c216..c558f043b 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -191,9 +191,6 @@ using vec_remote_subtests = std::vector<remote_subtest>;
 
 #define CEC_LOG_ADDR_MASK_ALL 0xffff
 
-#define ARRAY_SIZE(a) \
-	(sizeof(a) / sizeof(*a))
-
 #define COLOR_GREEN(s) "\033[32m" s "\033[0m"
 #define COLOR_RED(s) "\033[1;31m" s "\033[0m"
 #define COLOR_BOLD(s) "\033[1m" s "\033[0m"
diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
index f9ecac7fb..30e5accf5 100644
--- a/utils/cec-ctl/cec-pin.cpp
+++ b/utils/cec-ctl/cec-pin.cpp
@@ -17,8 +17,6 @@
 #include "cec-ctl.h"
 #include "cec-log.h"
 
-#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
-
 static std::string find_opcode_name(__u8 opcode)
 {
 	const char *name = cec_opcode2s(opcode);
diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 5b67a260f..7806a4b64 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -20,9 +20,6 @@
 #include <cec-info.h>
 #include <cec-log.h>
 
-#define ARRAY_SIZE(a) \
-	(sizeof(a) / sizeof(*a))
-
 extern bool show_info;
 extern bool show_msgs;
 extern bool show_state;
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 83ffcc30b..024407471 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -29,9 +29,6 @@
 /* Time between each polling message sent to a device */
 #define POLL_PERIOD 15000
 
-#define ARRAY_SIZE(a) \
-	(sizeof(a) / sizeof(*a))
-
 struct cec_enum_values {
 	const char *type_name;
 	__u8 value;
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index e27182821..8161aa453 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -27,8 +27,6 @@
 #include <linux/videodev2.h>
 #include <libv4l2rds.h>
 
-#define ARRAY_SIZE(arr) ((int)(sizeof(arr) / sizeof((arr)[0])))
-
 using dev_vec = std::vector<std::string>;
 using dev_map = std::map<std::string, std::string>;
 
-- 
2.30.2

