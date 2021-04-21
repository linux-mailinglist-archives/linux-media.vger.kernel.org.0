Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1198736662D
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236735AbhDUHVP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235548AbhDUHVO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:21:14 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5F5C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:41 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id y32so28914815pga.11
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PJ/S/k3FWC2OeQ4AWPZOkhr9dS9J8DY0WyKmH92BPIk=;
        b=Yz2yAUt2dbiDAjVdKcZyr0rOkSZk7EfeRuZjXhl0bDX169BvXAzbUxY4Jj1jxZxvV5
         85Yuilr3NUYf6yF6ACJUkH9RjjsA1sc9CXAqAfO9kjRQjMt1VLX0ZHT7+4E+y0BiSbWj
         /WgMMfPAfg7NNHD9jUv1JmW8PBZWHSqT8gViBnFy0yYB8YukoGgLJT+0NaDyBrxAsGn4
         E7nSS8pE0sCVj1tUbmb8T10zlisDHCyYQQQAhFAwhVDhMieCo93cxVey3jxLZt95ZWm4
         wtOh0PydKVruaeEa1TmuJxQtA36dwZmjuFc62LP+yjUyvJTnh9YliOkydS8d0dPw/Fyu
         Jiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PJ/S/k3FWC2OeQ4AWPZOkhr9dS9J8DY0WyKmH92BPIk=;
        b=FLc5F9FB4CZHrg0wdZC+mDT5DgmsGKtRICUyJyWEDpZXvrM36fBV9Vu7jHa0QhGSOp
         +Fk6yUbE/aHXUlnNqSo3AsfA4zg9Msded8VyOhHdUN0DNw2f8nEflWduNxt8NoNoZeCw
         75ckyVuLMtAJLdbLjKqPX5OFtmb/kHaWn1c5nquxUktcDsSj/dBmZapeKqOFTYUr5AF8
         eZWmPj33vKWf161DC4Coyb6SsCfsC1wnXiavQ7aO07NLIRV8D33fAvB+xiRaNzNKnknw
         eKdADV4/9L0cg5AokmwuC0OQ7dchGzSCW122fEgIdxA5tCnFO/pTpkCj89FXsqLPTSMX
         3IFQ==
X-Gm-Message-State: AOAM531YOV1J2E0YjekrYegbTXAjgxsQ3nbTuZdD3yXLW9nGjNLAoLoj
        5GxQxkiXlJnuNezawYIMGgxGQlzsp+8gzA==
X-Google-Smtp-Source: ABdhPJzszYsazpVKpjg6+/GMxk902Qwt6qr9Bap/1RCtxaVcNoTshn6yn2J7F2KYtVQzCW7RQdzfbQ==
X-Received: by 2002:a63:556:: with SMTP id 83mr20282469pgf.188.1618989640455;
        Wed, 21 Apr 2021 00:20:40 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id p10sm907815pfo.210.2021.04.21.00.20.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:20:39 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 5/8] v4l2-info: remove a strange sizeof usage
Date:   Wed, 21 Apr 2021 00:20:32 -0700
Message-Id: <20210421072035.4188497-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421072035.4188497-1-rosenp@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The array has a nullptr and 0 member for some reason. Remove and convert
loop to a for range one.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/common/v4l2-info.cpp | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index cb3cb91f7..0359cf137 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -3,6 +3,8 @@
  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <array>
+
 #include <v4l2-info.h>
 
 static std::string num2s(unsigned num, bool is_hex = true)
@@ -411,21 +413,20 @@ std::string mbus2s(unsigned flags, bool is_hsv)
 	return flags2s(flags, mbus_ycbcr_def);
 }
 
-static const flag_def selection_targets_def[] = {
-	{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
-	{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
-	{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
-	{ V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
-	{ V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
-	{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
-	{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
-	{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
-	{ 0, nullptr }
+static constexpr std::array<flag_def, 8> selection_targets_def{
+	flag_def{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
+	flag_def{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
+	flag_def{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
+	flag_def{ V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
+	flag_def{ V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
+	flag_def{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
+	flag_def{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
+	flag_def{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
 };
 
 bool valid_seltarget_at_idx(unsigned i)
 {
-	return i < sizeof(selection_targets_def) / sizeof(selection_targets_def[0]) - 1;
+	return i < selection_targets_def.size();
 }
 
 unsigned seltarget_at_idx(unsigned i)
@@ -437,13 +438,9 @@ unsigned seltarget_at_idx(unsigned i)
 
 std::string seltarget2s(__u32 target)
 {
-	int i = 0;
-
-	while (selection_targets_def[i].str != nullptr) {
-		if (selection_targets_def[i].flag == target)
-			return selection_targets_def[i].str;
-		i++;
-	}
+	for (const auto &def : selection_targets_def)
+		if (def.flag == target)
+			return def.str;
 	return std::string("Unknown (") + num2s(target) + ")";
 }
 
-- 
2.30.2

