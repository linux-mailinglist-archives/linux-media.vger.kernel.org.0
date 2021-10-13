Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2696C42C935
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238897AbhJMTAw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 15:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238904AbhJMTA3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 15:00:29 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE59C06174E
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:25 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id k7so11467780wrd.13
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1pX+dk6S2Emip4/Nqct0yrRJCmYFD6furMGbyUcjpgc=;
        b=DA976g7/t/FGIK9BnAw3PJeMOr49NCZphgKnIJN+7Zbrv+2hzUmipTqnbJySonFi6X
         O0+iuAiK4K8S+JOJF93g216nCbxxW4lpPRNbfE6R4x+DmNrweAG1JD0i3XECMVLDgQsV
         30abQnqDP2BLMsglFLRsU38lLS9y1sOu1sKnhD530/pTiUl08OC8zpOVUIwW6oTsWDKJ
         RqsYeZ3tIQy0PTwOCozcEO2rmSfVTbg8/FBtJHO0IvNcnCJqoRT9VpYwzpXOYRPqcVfe
         Bq7X5Qonol3FbPE/F9XwPWfIMY83Jn9CpMSlAfNrbo62Sfo0jTrk4ed5dU0T2wiGYcPU
         D7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1pX+dk6S2Emip4/Nqct0yrRJCmYFD6furMGbyUcjpgc=;
        b=IhykllCUir+/mkyXUT+joYSn0vg3rHiPmIHdgyW67bKHOedalk73lEsSf/q/Ebo/yR
         8iRXPVQ7m6n+Gf6kyaJFQnqL26LwQp1U2elAMpJ6sBX2EhSYMGiwod7RM5Loxkj9rz0Y
         FeuntlaZtIHbeADWKxikN0dYCIJH+qnxwVyO9REWIjUJVYji9dPDAUp9zoCSEoZQWOao
         /seXWXdpTdsqt0YupgJxkwDU7wvUyjmh4hZXl3+awezM89oAC0YJssjrJbhb41uFiFqD
         mfaw6G44mrZ9pkC5ci7pEr0NAZyT1Z1tbFh3QVm6N7w4p4IDmBmhBV1m5v0E2XFwfFIP
         hHyg==
X-Gm-Message-State: AOAM531qKEmy9f0sqzc9dYFkY4QQm8er4G/BZqSiUYzgpEcpBWynVbrq
        5qI8YqIwfXXf9Fr8gyU1zY8pvA==
X-Google-Smtp-Source: ABdhPJzTLS+In7OLgKpaJ0PsmFa9QHJG7F0VtX1X537GrRAr6D8fhAYJAtOnQu+iky8AFPxa2X3+RQ==
X-Received: by 2002:adf:a48c:: with SMTP id g12mr995452wrb.341.1634151503877;
        Wed, 13 Oct 2021 11:58:23 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:23 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 09/10] staging: media: zoran: move config select on primary kconfig
Date:   Wed, 13 Oct 2021 18:58:11 +0000
Message-Id: <20211013185812.590931-10-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since all kconfigs for card selection are bool, this causes all selected modules
to be always built-in.
Prevent this by moving selects to the main tristate kconfig.

By doing this, remove also all "if MEDIA_SUBDRV_AUTOSELECT" which are
wrong, since zoran always need them to work.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Kconfig | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index b5a3fc6e98f6..0a9c1ab19016 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -3,6 +3,16 @@ config VIDEO_ZORAN
 	depends on PCI && I2C_ALGOBIT && VIDEO_V4L2
 	depends on !ALPHA
 	select VIDEOBUF2_DMA_CONTIG
+	select VIDEO_ADV7170 if VIDEO_ZORAN_LML33R10
+	select VIDEO_ADV7175 if VIDEO_ZORAN_DC10 || VIDEO_ZORAN_DC30
+	select VIDEO_BT819 if VIDEO_ZORAN_LML33
+	select VIDEO_BT856 if VIDEO_ZORAN_LML33 || VIDEO_ZORAN_AVS6EYES
+	select VIDEO_BT866 if VIDEO_ZORAN_AVS6EYES
+	select VIDEO_KS0127 if VIDEO_ZORAN_AVS6EYES
+	select VIDEO_SAA711X if VIDEO_ZORAN_BUZ || VIDEO_ZORAN_LML33R10
+	select VIDEO_SAA7110 if VIDEO_ZORAN_DC10
+	select VIDEO_SAA7185 if VIDEO_ZORAN_BUZ
+	select VIDEO_VPX3220 if VIDEO_ZORAN_DC30
 	help
 	  Say Y for support for MJPEG capture cards based on the Zoran
 	  36057/36067 PCI controller chipset. This includes the Iomega
@@ -16,8 +26,6 @@ config VIDEO_ZORAN
 config VIDEO_ZORAN_DC30
 	bool "Pinnacle/Miro DC30(+) support"
 	depends on VIDEO_ZORAN
-	select VIDEO_ADV7175 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_VPX3220 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the Pinnacle/Miro DC30(+) MJPEG capture/playback
 	  card. This also supports really old DC10 cards based on the
@@ -34,16 +42,12 @@ config VIDEO_ZORAN_ZR36060
 config VIDEO_ZORAN_BUZ
 	bool "Iomega Buz support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_SAA7185 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the Iomega Buz MJPEG capture/playback card.
 
 config VIDEO_ZORAN_DC10
 	bool "Pinnacle/Miro DC10(+) support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_SAA7110 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_ADV7175 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the Pinnacle/Miro DC10(+) MJPEG capture/playback
 	  card.
@@ -51,8 +55,6 @@ config VIDEO_ZORAN_DC10
 config VIDEO_ZORAN_LML33
 	bool "Linux Media Labs LML33 support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_BT819 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_BT856 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the Linux Media Labs LML33 MJPEG capture/playback
 	  card.
@@ -60,8 +62,6 @@ config VIDEO_ZORAN_LML33
 config VIDEO_ZORAN_LML33R10
 	bool "Linux Media Labs LML33R10 support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_ADV7170 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  support for the Linux Media Labs LML33R10 MJPEG capture/playback
 	  card.
@@ -69,9 +69,6 @@ config VIDEO_ZORAN_LML33R10
 config VIDEO_ZORAN_AVS6EYES
 	bool "AverMedia 6 Eyes support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_BT856 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_BT866 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_KS0127 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the AverMedia 6 Eyes video surveillance card.
 
-- 
2.32.0

