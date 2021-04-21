Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8DDB36662F
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbhDUHVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235548AbhDUHVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:21:15 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EEEC06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:43 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id b17so28927993pgh.7
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K+OhM81Oh238gSow0sGcpWOkJq4Dr+zbW6YcgC1WmZU=;
        b=jvKAQ9WI5gzPbVRy0tN98LGUiC17QBkVnKEqV8XMSXO5IF0oQ6EUTSxDtYmJG3Gvqz
         M1spPGmeKGuZOdlwInoKVS7ymT10AHWvyXZ1IdhznTNcnxOzOqedLQVmxIvQ8WUUo611
         BRhCaPF+Um/pa7Jd/PqEFnVOKfpaj8JZRu4E5uooNYobJOg2RZV3fXvDsDxNyt0uL7pJ
         ZAx3FvVuR+1hp61XFXBsnmVxXBU3DyZ093B3iXtp/vwAQx/ICMU/zJgG3n1bTpGsv/ki
         LyTQkqkhAVmw+Uoa/0IWizWOhiFgwm+xZCc3GkXwAByPVMPY7BqxTIe7wSF+AXpr5F3m
         lrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K+OhM81Oh238gSow0sGcpWOkJq4Dr+zbW6YcgC1WmZU=;
        b=ZMCzAe2P0qaUZgdF1T4iwHa0Y6Uum6ogU+1HHkd6213soHthRWQgR2dpHaTZ8FTKDn
         /LFOcmH+ca4qO3jwy5Ue1T1sFZC2ADSehAP/R1ZX/hcAiXx5syJid2H77q/uWTT3p5S4
         pjOYJqJQO/aDrKtCRD/S6N6ttQNT6mNIKl5jSe8yRwtew01PqDTLRmpkf/PQ9w4kGfJh
         WXOHunehtyqYZZxw5O8twRpOoYJrN0b3Z/wybpRO+uk7KFBusBbYBvN5HW99a7ZxzOYr
         uJ4sAjXNKw2HVJvZsulGBq79jf964pDUOO5+xVUHgl7fwfSLHrCZAiru+iks40jHtBSm
         75sQ==
X-Gm-Message-State: AOAM533Vd+yI841M7yOHtsmnMhUpGMCUVYljBNL8XTgMAAWsuVVK9xyL
        tuhegqo4GIz7SbZ/qY559VKVWV4k+WhdJw==
X-Google-Smtp-Source: ABdhPJwz8G3KFOQKozbxuZQBatdF7tCfP5YYeDOW9BkSYWoLNn8Ostvornu//3E9eKhuez/U5S6jFw==
X-Received: by 2002:a17:90a:1c02:: with SMTP id s2mr9253080pjs.17.1618989642739;
        Wed, 21 Apr 2021 00:20:42 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id p10sm907815pfo.210.2021.04.21.00.20.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:20:42 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 8/8] v4l2-utils: turn prefixes to a constexpr array
Date:   Wed, 21 Apr 2021 00:20:35 -0700
Message-Id: <20210421072035.4188497-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421072035.4188497-1-rosenp@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allows usage of a single any_of instead of a raw loop.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 17ad488dd..2b6dd6d13 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -116,28 +116,14 @@ void common_usage()
 	       );
 }
 
-static const char *prefixes[] = {
-	"video",
-	"radio",
-	"vbi",
-	"swradio",
-	"v4l-subdev",
-	"v4l-touch",
-	"media",
-	nullptr
+static constexpr std::array<const char *, 7> prefixes{
+	"video", "radio", "vbi", "swradio", "v4l-subdev", "v4l-touch", "media",
 };
 
 static bool is_v4l_dev(const char *name)
 {
-	for (unsigned i = 0; prefixes[i]; i++) {
-		unsigned l = strlen(prefixes[i]);
-
-		if (!memcmp(name, prefixes[i], l)) {
-			if (isdigit(name[l]))
-				return true;
-		}
-	}
-	return false;
+	return std::any_of(prefixes.begin(), prefixes.end(),
+			   [=](const char *prefix) { return !strcmp(name, prefix) && isdigit(name[strlen(prefix)]); });
 }
 
 static int calc_node_val(const char *s)
@@ -146,7 +132,7 @@ static int calc_node_val(const char *s)
 
 	s = std::strrchr(s, '/') + 1;
 
-	for (unsigned i = 0; prefixes[i]; i++) {
+	for (size_t i = 0; i < prefixes.size(); i++) {
 		unsigned l = strlen(prefixes[i]);
 
 		if (!memcmp(s, prefixes[i], l)) {
-- 
2.30.2

