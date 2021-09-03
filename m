Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF724005A1
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 21:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350650AbhICTRI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 15:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350642AbhICTQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 15:16:59 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3D6C061796
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 12:15:57 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id u16so126854wrn.5
        for <linux-media@vger.kernel.org>; Fri, 03 Sep 2021 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UWYtJJBsa0LLLZRoFXWiICK8It/s64t7LfobsR7d4kA=;
        b=rB986yscxcriQHyHhrHHPg6S1PvOrT/OtOk7NUbcuALTTlkDK70ocS7L5eUFN+fPYT
         EdExfceHzEG1Tb5jYm4MfFYrUnySIt067kVl+XDYVkOhqW7g0qr/HhVXDIo8Lk8OkZUK
         /Kn1vZufyjby6Dw3iG2RGRoCozXKBUXn0lcQrVrIe9TQdULaJNHoTPqfgdZnU1IUmWAj
         AJM46Vc46LUESLpoIlhr8Kz8zKsiS5KEyrNKk6fnK7RzfjS8+xJFoecDu1KK49mJbdlA
         8Uu1Jq5cShTkDS/4lJE4yZR6Ui5Ms2kwm1FAV0eXcXuOIL8wMqAVZWA3hDVKg/aUmCcZ
         SjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UWYtJJBsa0LLLZRoFXWiICK8It/s64t7LfobsR7d4kA=;
        b=f93Rje4ezQtFhpQeEpEqfNZtiFQyEqJ7X5g3h66q6JBTdqN7FhgC5oANDpFdCV/XuA
         g1d0DvyIhFxWuQgq+iMpJJ4vqZXiuwoAh8euPpiYW4Amlk5t4K7MH9Tm7pheh38draO0
         AjmvzovzfAFHI/P3npjw4kEV9EoeEW5zlHvvAY0Z6qbgOrY952s5TGA8ANk+uRFBg53p
         YKAO92nGtnc4+803LiSsk0WGOAYk8fs0XnJgMa4W7PUDjv0t0g3BZpR6U3JeTnNTKs8s
         BnDx5z94VhNB398IBZJvn4PqHXVJTCMkkwPKHoPTqEcOi2md0Q/tS1aDuHjWYiM+j2Kn
         68Bw==
X-Gm-Message-State: AOAM532N36ttIXDKMWutxcnoEqpfR5Hb1lpE82Fcn0IwkagrzPT2E6Pt
        yVqYSv1koso6MhMCPD+lqJnxyA==
X-Google-Smtp-Source: ABdhPJwDRmmJwYZ+p6duGwUWbZ5Qfro1RZoo3m3FiRZuEr03QDGrxID0djV4Vdvbq0byvZJtpIEw/g==
X-Received: by 2002:adf:cd0f:: with SMTP id w15mr618635wrm.346.1630696555673;
        Fri, 03 Sep 2021 12:15:55 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a133sm253397wme.5.2021.09.03.12.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:15:55 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 3/8] staging: media: zoran: rename debug module parameter
Date:   Fri,  3 Sep 2021 19:15:35 +0000
Message-Id: <20210903191540.3052775-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903191540.3052775-1-clabbe@baylibre.com>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All zoran module will be merged, so to prevent conflict, the debug
module parameter need to be renamed

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/videocodec.c |  8 ++++----
 drivers/staging/media/zoran/zr36016.c    | 12 ++++++------
 drivers/staging/media/zoran/zr36050.c    |  8 ++++----
 drivers/staging/media/zoran/zr36060.c    |  9 ++++-----
 4 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 28031d3fd757..31019b5f377e 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -26,13 +26,13 @@
 
 #include "videocodec.h"
 
-static int debug;
-module_param(debug, int, 0);
-MODULE_PARM_DESC(debug, "Debug level (0-4)");
+static int videocodec_debug;
+module_param(videocodec_debug, int, 0);
+MODULE_PARM_DESC(videocodec_debug, "Debug level (0-4)");
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (debug >= num) \
+		if (videocodec_debug >= num) \
 			printk(format, ##args); \
 	} while (0)
 
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 9b350a885879..50605460a44b 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -22,14 +22,14 @@
 /* amount of chips attached via this driver */
 static int zr36016_codecs;
 
-/* debugging is available via module parameter */
-static int debug;
-module_param(debug, int, 0);
-MODULE_PARM_DESC(debug, "Debug level (0-4)");
+static int zr36016_debug;
+module_param(zr36016_debug, int, 0);
+MODULE_PARM_DESC(zr36016_debug, "Debug level (0-4)");
+
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (debug >= num) \
+		if (zr36016_debug >= num) \
 			printk(format, ##args); \
 	} while (0)
 
@@ -120,7 +120,7 @@ static u8 zr36016_read_version(struct zr36016 *ptr)
 
 static int zr36016_basic_test(struct zr36016 *ptr)
 {
-	if (debug) {
+	if (zr36016_debug) {
 		int i;
 
 		zr36016_writei(ptr, ZR016I_PAX_LO, 0x55);
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index c62af27f2683..4dc7927fefc3 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -32,13 +32,13 @@
 static int zr36050_codecs;
 
 /* debugging is available via module parameter */
-static int debug;
-module_param(debug, int, 0);
-MODULE_PARM_DESC(debug, "Debug level (0-4)");
+static int zr36050_debug;
+module_param(zr36050_debug, int, 0);
+MODULE_PARM_DESC(zr36050_debug, "Debug level (0-4)");
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (debug >= num) \
+		if (zr36050_debug >= num) \
 			printk(format, ##args); \
 	} while (0)
 
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 1c3af11b5f24..7904d5b1f402 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -34,14 +34,13 @@ static bool low_bitrate;
 module_param(low_bitrate, bool, 0);
 MODULE_PARM_DESC(low_bitrate, "Buz compatibility option, halves bitrate");
 
-/* debugging is available via module parameter */
-static int debug;
-module_param(debug, int, 0);
-MODULE_PARM_DESC(debug, "Debug level (0-4)");
+static int zr36060_debug;
+module_param(zr36060_debug, int, 0);
+MODULE_PARM_DESC(zr36060_debug, "Debug level (0-4)");
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (debug >= num) \
+		if (zr36060_debug >= num) \
 			printk(format, ##args); \
 	} while (0)
 
-- 
2.32.0

