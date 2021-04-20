Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0631366166
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 23:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhDTVLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 17:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbhDTVLf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 17:11:35 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762FFC06174A
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 14:11:00 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id e2so16073758plh.8
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ur5bIdKfVnF3C5hyJI2hNqtvCrepD4uapES7JhKjRFc=;
        b=cFZvnLtlaci6wqTlyiBzvrtCcaT8pKk9KhZFqFyirWLKS/fFiCbAt5+JVxUXrfVypZ
         3ggKA2tB8BD8pPG8c1ifi9TY0MjQrUvJYY2Rppbv5OYMGEykmWIwm015CWndn2amcLES
         Xwfbtr7Zl3yAcS7P9g1B+36/E9bg5hPeU5z1xeXTSe4Q0YC6RZ4fLeWrAjZn0YjfWJ0e
         e77zt+G42bHKzPTQr9s6s7jo42/g7t0hoeu0DPBV/g+MwEajRdW5tt1ExN2RpjygxwST
         eN63Xwb8IUMpXEWeSVv4pdPjRy4AiPHoBRIdlbeELoo5xSsdPlWpaaWF82gPAjEBPOy4
         79jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ur5bIdKfVnF3C5hyJI2hNqtvCrepD4uapES7JhKjRFc=;
        b=Y/BMv1ZobPmNFb78ctwDeQ4uYb+XkPe0+gu6o549Y/9Wq6bt9b8/cYPVbld/i6R1Ga
         lGcN40ZYHNs72ZevG4g3Uk4gHh1FvaOC93VYcpLktbUhUd3cTgWI+3InpgISVifqRICa
         kcifmO9xivAbGX4q2QRIenZY/UWz2L2Cm1KIUg4Xe09128ODQmcRpT1EW/rAN9M21EaB
         K0fbc1kb9/vXqczqcm3+HZM4JJSma8Bih/PEb5p8EsB2n9nswj20207F6uCN6KunRk4P
         rINCYbBk9jYX76COtlS6tdglXEQ3j1k02Cmmt1awoojonXtjWOGwKHJkuvMjBKeKutH1
         40OA==
X-Gm-Message-State: AOAM5338DTpQNiHIsVi8o+ezB3Mfj1gIuLDfEh8Yp1MRtFXKXcfcYA6h
        kuOgYCBzb47eHdAcMtVVgavmnKmDGUOzkw==
X-Google-Smtp-Source: ABdhPJy9rofx3H5SXpbqSGv7LdFnd8JUK25vZyIX+1uF4WSHtkNb8C0HtZYe8yO2heQ6Eg6u3F3zDw==
X-Received: by 2002:a17:902:6b81:b029:ea:dcc5:b841 with SMTP id p1-20020a1709026b81b02900eadcc5b841mr30458287plk.29.1618953059680;
        Tue, 20 Apr 2021 14:10:59 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id mv13sm37219pjb.29.2021.04.20.14.10.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 14:10:59 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] clang-tidy: use using instead of typedef
Date:   Tue, 20 Apr 2021 14:10:58 -0700
Message-Id: <20210420211058.7221-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with modernize-use-using

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-ctl/cec-ctl.cpp                   | 2 +-
 utils/common/media-info.cpp                 | 4 ++--
 utils/common/v4l2-info.cpp                  | 4 ++--
 utils/qv4l2/qv4l2.h                         | 8 ++++----
 utils/rds-ctl/rds-ctl.cpp                   | 2 +-
 utils/v4l2-compliance/v4l2-compliance.h     | 8 ++++----
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
 utils/v4l2-compliance/v4l2-test-media.cpp   | 2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp          | 2 +-
 utils/v4l2-ctl/v4l2-ctl.h                   | 4 ++--
 10 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index a9d4d5c02..c17265a5c 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -148,7 +148,7 @@ struct node {
 
 bool verbose;
 
-typedef std::vector<cec_msg> msg_vec;
+using msg_vec = std::vector<cec_msg>;
 
 static struct option long_options[] = {
 	{ "device", required_argument, nullptr, OptSetDevice },
diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 29a43fb35..9c74b1477 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -118,10 +118,10 @@ std::string mi_media_get_device(__u32 major, __u32 minor)
 	return "";
 }
 
-typedef struct {
+struct flag_def {
 	unsigned flag;
 	const char *str;
-} flag_def;
+};
 
 static std::string flags2s(unsigned val, const flag_def *def)
 {
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index fe4defd9c..cb3cb91f7 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -16,10 +16,10 @@ static std::string num2s(unsigned num, bool is_hex = true)
 	return buf;
 }
 
-typedef struct {
+struct flag_def {
 	unsigned flag;
 	const char *str;
-} flag_def;
+};
 
 static std::string flags2s(unsigned val, const flag_def *def)
 {
diff --git a/utils/qv4l2/qv4l2.h b/utils/qv4l2/qv4l2.h
index a585ac35c..aaba74d0e 100644
--- a/utils/qv4l2/qv4l2.h
+++ b/utils/qv4l2/qv4l2.h
@@ -51,10 +51,10 @@ class VbiTab;
 class QCloseEvent;
 class CaptureWin;
 
-typedef std::vector<unsigned> ClassIDVec;
-typedef std::map<unsigned, ClassIDVec> ClassMap;
-typedef std::map<unsigned, struct v4l2_query_ext_ctrl> CtrlMap;
-typedef std::map<unsigned, QWidget *> WidgetMap;
+using ClassIDVec = std::vector<unsigned>;
+using ClassMap = std::map<unsigned, ClassIDVec>;
+using CtrlMap = std::map<unsigned, v4l2_query_ext_ctrl>;
+using WidgetMap = std::map<unsigned, QWidget *>;
 
 enum {
 	CTRL_UPDATE_ON_CHANGE = 0x10,
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 994fc9c4d..e27182821 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -29,7 +29,7 @@
 
 #define ARRAY_SIZE(arr) ((int)(sizeof(arr) / sizeof((arr)[0])))
 
-typedef std::vector<std::string> dev_vec;
+using dev_vec = std::vector<std::string>;
 using dev_map = std::map<std::string, std::string>;
 
 /* Short option list
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 4d5c3a5c0..d13dd2e2d 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -78,10 +78,10 @@ struct test_query_ext_ctrl: v4l2_query_ext_ctrl {
 	__u64 menu_mask;
 };
 
-typedef std::map<__u32, struct test_query_ext_ctrl> qctrl_map;
-typedef std::map<__u32, __u32> pixfmt_map;
-typedef std::set<__u64> frmsizes_set;
-typedef std::map<__u32, unsigned> frmsizes_count_map;
+using qctrl_map = std::map<__u32, test_query_ext_ctrl>;
+using pixfmt_map = std::map<__u32, __u32>;
+using frmsizes_set = std::set<__u64>;
+using frmsizes_count_map = std::map<__u32, unsigned>;
 
 struct base_node;
 
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 131fedc67..bc5958c2c 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -93,7 +93,7 @@ enum QueryBufMode {
 	Dequeued
 };
 
-typedef std::map<struct timeval, struct v4l2_buffer> buf_info_map;
+using buf_info_map = std::map<struct timeval, struct v4l2_buffer>;
 static buf_info_map buffer_info;
 
 #define FILE_HDR_ID			v4l2_fourcc('V', 'h', 'd', 'r')
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index d7a83b0cd..ef2982c04 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -73,7 +73,7 @@ static int checkDevice(__u32 major, __u32 minor, bool iface, __u32 id)
 	return 0;
 }
 
-typedef std::set<__u32> id_set;
+using id_set = std::set<__u32>;
 
 static media_v2_topology topology;
 static media_v2_entity *v2_ents;
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 15b68b5ee..17ad488dd 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -22,7 +22,7 @@ struct ctrl_subset {
 	unsigned size[V4L2_CTRL_MAX_DIMS];
 };
 
-typedef std::map<unsigned, std::vector<struct v4l2_ext_control> > class2ctrls_map;
+using class2ctrls_map = std::map<unsigned int, std::vector<struct v4l2_ext_control> >;
 
 using ctrl_qmap = std::map<std::string, struct v4l2_query_ext_ctrl>;
 static ctrl_qmap ctrl_str2q;
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index f9bad45cc..7518ac6f5 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -277,10 +277,10 @@ extern __u32 vidcap_buftype;
 extern __u32 vidout_buftype;
 extern int verbose;
 
-typedef struct {
+struct flag_def {
 	unsigned flag;
 	const char *str;
-} flag_def;
+};
 
 /* fmts specified */
 #define FmtWidth		(1L<<0)
-- 
2.30.2

