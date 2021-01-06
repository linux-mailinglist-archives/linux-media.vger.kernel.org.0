Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5082D2EB856
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 04:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbhAFDFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 22:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbhAFDFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 22:05:31 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B9DC061358;
        Tue,  5 Jan 2021 19:05:05 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id b9so1308478qtr.2;
        Tue, 05 Jan 2021 19:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lKW/iSJjrbgSAXySgNzKmXZFqMqWpYYmhMcxC2gJPf4=;
        b=nZSO6iZbGxKJXcbAT25lwYlWrvKanic7Tx/yE8sO/QCCguQ8dgTkAl71IgfiMACxwM
         yjrWYxjxRE+GJZ8F5y3ByVdTMXihUE2Ai4vpDskSVE9KYWwVzzck62Yk/3lqsg9oLncr
         X+ndpgd5yGK8nkWs4gca+K+noqoVAMBonSU0ym6FHpp9E9+mQnbaTx/mKm+C/1dMCfnt
         kFMnwyW2Nh5gKTfmFU0KCsURA8D4TrKpbzrvd8+ku3ZQflAQl07cmVoU8w7wDcMUsPSI
         wPUJcHzbHCFECS1539ElqUk2yTVx08p+ba4Zz/ZSpmCFx4wCb0fdWOnmI7skrVLxzgdb
         pJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKW/iSJjrbgSAXySgNzKmXZFqMqWpYYmhMcxC2gJPf4=;
        b=Rr+s2f6GLS+J8OpY1Kl4ABksAdw6zr/YBDO3wHy5Jkgq8/1Grwy1lVDI4BwL6ie6lW
         4yBoUVu8TBWHfqP/oP7llg6oWA4gl3/A5Xo8iF2IFZ1C+AhC4cmLZUcjvp8xAaCr+PpS
         YNsAuXH2zp/04QXAS6rgZfY5xGWmK0YeQGtaG+/bV9JvJMjJ+rsbuEyO8r7PxmvGOC80
         sRUsvA5QoiFSTl3P0rzsmEMLfUfivQQ/w+x3bQeEbEW9UVA+iWz1F1G/i967jWHNwVZT
         i97NCgPpL8dKuSxsgVnKiC6h4GqaRTgkJIfIE9me88LXZrZ4iQ5Ez7ACCZhC3Rkmn4PM
         4+GA==
X-Gm-Message-State: AOAM533YKl9cHEGnlFi1+UDYX6CXHOfPAzJmQatd7YyKptVtRD2RyTdG
        kn0/MeDf4Ab2FfXzAqKwsvg=
X-Google-Smtp-Source: ABdhPJxNJvoNg1gzhOenroDJ0dLzWeV8ux91mzHYWkvLQpKBJBPwu7y+jCoXYkxXw2XhxVPpUsZamg==
X-Received: by 2002:ac8:5cce:: with SMTP id s14mr2387647qta.135.1609902304761;
        Tue, 05 Jan 2021 19:05:04 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id n195sm730019qke.20.2021.01.05.19.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 19:05:04 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] media: vidtv: use a simpler name in platform_{device|driver}
Date:   Wed,  6 Jan 2021 00:04:48 -0300
Message-Id: <20210106030449.3223172-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
References: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Change from "vidtv_bridge" to simply "vidtv" so that vidtv looks
more similar to the other media virtual drivers in /sys/bus/platform.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 4 ++--
 drivers/media/test-drivers/vidtv/vidtv_bridge.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 405e89f62b5a..9964d1331aff 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -564,13 +564,13 @@ static void vidtv_bridge_dev_release(struct device *dev)
 }
 
 static struct platform_device vidtv_bridge_dev = {
-	.name		= "vidtv_bridge",
+	.name		= VIDTV_PDEV_NAME,
 	.dev.release	= vidtv_bridge_dev_release,
 };
 
 static struct platform_driver vidtv_bridge_driver = {
 	.driver = {
-		.name                = "vidtv_bridge",
+		.name = VIDTV_PDEV_NAME,
 	},
 	.probe    = vidtv_bridge_probe,
 	.remove   = vidtv_bridge_remove,
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
index d42899a31295..101a26a4415f 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -16,6 +16,7 @@
  * For now, only one frontend is supported. See vidtv_start_streaming()
  */
 #define NUM_FE 1
+#define VIDTV_PDEV_NAME "vidtv"
 
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
-- 
2.30.0

