Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1DD3A0F04
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 10:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237738AbhFIIyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 04:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbhFIIyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 04:54:44 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38B6C061574;
        Wed,  9 Jun 2021 01:52:50 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id c13so12215429plz.0;
        Wed, 09 Jun 2021 01:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0/ufYcgj2Y9s6a1RMhi7VQMo9p53LwRlh8d9Dq2wfzM=;
        b=vTRKqZysWcP96FSwqbugYLTrZBnsE16ht2Geq4llJkc15i+j86llFPvn/t5rr57Ul+
         H0ygiVWBhLN3qA2zGY9BptJYbj0bVc4PxVqaOaLZm3DmxhAO/JV8xza1xT/VigOvyafm
         IQT3B/h7U/Ta/JFLVYJp5fSIJnx85620ecKRvxXexKmYWPAPDz6ebPwEfWgRorQvulpM
         VR+JZP0NCt+NCKJFx1UF5O5D7lnTw9TYd7GLnCImYaLSyug7/uGLVgub0tkJZ6b59XWH
         XksJfIPqsSa6rqrpbeSojieZdrrvtAfE8jflx6eZX5RbgoOckue22P4kbaAATr+eCzae
         Wgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0/ufYcgj2Y9s6a1RMhi7VQMo9p53LwRlh8d9Dq2wfzM=;
        b=WcRndjG4rvMunOTBLwOSNtvS9uS/u/0hkXZOELzfPKDxKHmW/D3W5so7NmyecHqBcB
         7nYoACl+yJUtrGHwtYbEfnsEzW2J3A2Op6AS6eTHRTe83buo4vfklbHillvBFhHTc9U3
         yW9v9AbM5x9jBBghbLOZD35y4Z0t4UnsIByDFgdryqcpQLt+3ptoFntN4edsmqERRgYT
         nWQTlmWw+Cgtwf9DegHTH6Somx1JLDxeACj0rrUwIjai5EIAuY1HVwjpzXhVhIF/p/Vq
         +t2IjrEvyefXoMsfERI8YFLwIP0Tx+S+QOjQ85WRZIeGoA4NutkN5H6ekON8c5ATAAzU
         yhqA==
X-Gm-Message-State: AOAM531dCnrgjL3n6vNmafwou0pCk9JXta0KL0kz5Wb095ApKNfysELS
        Hds67Ztf9xAYzPu9A1os7As=
X-Google-Smtp-Source: ABdhPJyN1hfxt4FeMFoTiad8gFl9+ulWI8mo+YG2Aa87mjgPJF3aW9wniVsRXvojdhCAxxtuXHJyOA==
X-Received: by 2002:a17:902:d64c:b029:101:17cb:e63c with SMTP id y12-20020a170902d64cb029010117cbe63cmr4436544plh.3.1623228770031;
        Wed, 09 Jun 2021 01:52:50 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id mi10sm4188784pjb.10.2021.06.09.01.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 01:52:49 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, Herman <yanshuaijun@yulong.com>
Subject: [PATCH] drivers/media/usb/gspca/zc3xx.c: fix typo Fliker -> Flicker
Date:   Wed,  9 Jun 2021 16:52:40 +0800
Message-Id: <20210609085240.9491-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

change 'Fliker' into 'Flicker'

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/usb/gspca/zc3xx.c | 134 ++++++++++++++++----------------
 1 file changed, 67 insertions(+), 67 deletions(-)

diff --git a/drivers/media/usb/gspca/zc3xx.c b/drivers/media/usb/gspca/zc3xx.c
index aa285d5d6c0d..5bcbf0d40147 100644
--- a/drivers/media/usb/gspca/zc3xx.c
+++ b/drivers/media/usb/gspca/zc3xx.c
@@ -323,7 +323,7 @@ static const struct usb_action adcm2700_60HZ[] = {
 	{0xaa, 0x28, 0x0002},				/* 00,28,02,aa */
 	{}
 };
-static const struct usb_action adcm2700_NoFliker[] = {
+static const struct usb_action adcm2700_NoFlicker[] = {
 	{0xa0, 0x01, ZC3XX_R010_CMOSSENSORSELECT},	/* 00,10,01,cc */
 	{0xaa, 0xfe, 0x0002},				/* 00,fe,02,aa */
 	{0xa0, 0x0a, ZC3XX_R010_CMOSSENSORSELECT},	/* 00,10,0a,cc */
@@ -525,7 +525,7 @@ static const struct usb_action cs2102_60HZ[] = {
 	{0xa0, 0xff, ZC3XX_R020_HSYNC_3},
 	{}
 };
-static const struct usb_action cs2102_NoFlikerScale[] = {
+static const struct usb_action cs2102_NoFlickerScale[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xaa, 0x23, 0x0001},
 	{0xaa, 0x24, 0x005f},
@@ -547,7 +547,7 @@ static const struct usb_action cs2102_NoFlikerScale[] = {
 	{0xa0, 0xff, ZC3XX_R020_HSYNC_3},
 	{}
 };
-static const struct usb_action cs2102_NoFliker[] = {
+static const struct usb_action cs2102_NoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xaa, 0x23, 0x0000},
 	{0xaa, 0x24, 0x00af},
@@ -1385,7 +1385,7 @@ static const struct usb_action gc0305_60HZ[] = {
 	{}
 };
 
-static const struct usb_action gc0305_NoFliker[] = {
+static const struct usb_action gc0305_NoFlicker[] = {
 	{0xa0, 0x0c, ZC3XX_R100_OPERATIONMODE},	/* 01,00,0c,cc */
 	{0xaa, 0x82, 0x0000},	/* 00,82,00,aa */
 	{0xaa, 0x83, 0x0000},	/* 00,83,00,aa */
@@ -1710,7 +1710,7 @@ static const struct usb_action hdcs2020_60HZ[] = {
 	{0xa0, 0x2c, ZC3XX_R01F_HSYNC_2}, /* 00,1f,2c,cc */
 	{}
 };
-static const struct usb_action hdcs2020_NoFliker[] = {
+static const struct usb_action hdcs2020_NoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS}, /* 00,19,00,cc */
 	{0xaa, 0x13, 0x0010},			/* 00,13,10,aa */
 	{0xaa, 0x14, 0x0001},			/* 00,14,01,aa */
@@ -1925,7 +1925,7 @@ static const struct usb_action hv7131b_60HZScale[] = {	/* 320x240 */
 	{0xa0, 0x40, ZC3XX_R020_HSYNC_3},	/* 00,20,40,cc */
 	{}
 };
-static const struct usb_action hv7131b_NoFliker[] = {	/* 640x480*/
+static const struct usb_action hv7131b_NoFlicker[] = {	/* 640x480*/
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},	/* 00,19,00,cc */
 	{0xaa, 0x25, 0x0003},			/* 00,25,03,aa */
 	{0xaa, 0x26, 0x0000},			/* 00,26,00,aa */
@@ -1950,7 +1950,7 @@ static const struct usb_action hv7131b_NoFliker[] = {	/* 640x480*/
 	{0xa0, 0x03, ZC3XX_R020_HSYNC_3},	/* 00,20,03,cc */
 	{}
 };
-static const struct usb_action hv7131b_NoFlikerScale[] = { /* 320x240 */
+static const struct usb_action hv7131b_NoFlickerScale[] = { /* 320x240 */
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},	/* 00,19,00,cc */
 	{0xaa, 0x25, 0x0003},			/* 00,25,03,aa */
 	{0xaa, 0x26, 0x0000},			/* 00,26,00,aa */
@@ -2141,7 +2141,7 @@ static const struct usb_action hv7131r_60HZScale[] = {
 	{0xa0, 0x08, ZC3XX_R020_HSYNC_3},
 	{}
 };
-static const struct usb_action hv7131r_NoFliker[] = {
+static const struct usb_action hv7131r_NoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xa0, 0x2f, ZC3XX_R190_EXPOSURELIMITHIGH},
 	{0xa0, 0xf8, ZC3XX_R191_EXPOSURELIMITMID},
@@ -2159,7 +2159,7 @@ static const struct usb_action hv7131r_NoFliker[] = {
 	{0xa0, 0x08, ZC3XX_R020_HSYNC_3},
 	{}
 };
-static const struct usb_action hv7131r_NoFlikerScale[] = {
+static const struct usb_action hv7131r_NoFlickerScale[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xa0, 0x2f, ZC3XX_R190_EXPOSURELIMITHIGH},
 	{0xa0, 0xf8, ZC3XX_R191_EXPOSURELIMITMID},
@@ -2662,7 +2662,7 @@ static const struct usb_action icm105a_60HZ[] = {
 	{0xa0, 0xc0, ZC3XX_R1A8_DIGITALGAIN}, /* 01,a8,c0,cc */
 	{}
 };
-static const struct usb_action icm105a_NoFlikerScale[] = {
+static const struct usb_action icm105a_NoFlickerScale[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS}, /* 00,19,00,cc */
 	{0xaa, 0x0d, 0x0003}, /* 00,0d,03,aa */
 	{0xaa, 0x0c, 0x0004}, /* 00,0c,04,aa */
@@ -2693,7 +2693,7 @@ static const struct usb_action icm105a_NoFlikerScale[] = {
 	{0xa0, 0xff, ZC3XX_R020_HSYNC_3}, /* 00,20,ff,cc */
 	{}
 };
-static const struct usb_action icm105a_NoFliker[] = {
+static const struct usb_action icm105a_NoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS}, /* 00,19,00,cc */
 	{0xaa, 0x0d, 0x0003}, /* 00,0d,03,aa */
 	{0xaa, 0x0c, 0x0004}, /* 00,0c,04,aa */
@@ -3009,7 +3009,7 @@ static const struct usb_action mc501cb_60HZScale[] = {
 	{}
 };
 
-static const struct usb_action mc501cb_NoFliker[] = {
+static const struct usb_action mc501cb_NoFlicker[] = {
 	{0xaa, 0x03, 0x0003}, /* 00,03,03,aa */
 	{0xaa, 0x10, 0x00fc}, /* 00,10,fc,aa */
 	{0xaa, 0x36, 0x0018}, /* 00,36,18,aa */
@@ -3021,7 +3021,7 @@ static const struct usb_action mc501cb_NoFliker[] = {
 	{}
 };
 
-static const struct usb_action mc501cb_NoFlikerScale[] = {
+static const struct usb_action mc501cb_NoFlickerScale[] = {
 	{0xaa, 0x03, 0x0003}, /* 00,03,03,aa */
 	{0xaa, 0x10, 0x00fc}, /* 00,10,fc,aa */
 	{0xaa, 0x36, 0x0030}, /* 00,36,30,aa */
@@ -3211,7 +3211,7 @@ static const struct usb_action ov7620_60HZ[] = {
 	{0xa1, 0x01, 0x0037},		*/
 	{}
 };
-static const struct usb_action ov7620_NoFliker[] = {
+static const struct usb_action ov7620_NoFlicker[] = {
 	{0xdd, 0x00, 0x0100},			/* 00,01,00,dd */
 	{0xaa, 0x2b, 0x0000},			/* 00,2b,00,aa */
 	/* disable 1/120s & 1/100s exposures for banding filter */
@@ -3827,7 +3827,7 @@ static const struct usb_action pas106b_60HZ[] = {
 	{0xa0, 0x04, ZC3XX_R1A9_DIGITALLIMITDIFF}, /* 01,a9,04,cc */
 	{}
 };
-static const struct usb_action pas106b_NoFliker[] = {
+static const struct usb_action pas106b_NoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R190_EXPOSURELIMITHIGH}, /* 01,90,00,cc */
 	{0xa0, 0x06, ZC3XX_R191_EXPOSURELIMITMID}, /* 01,91,06,cc */
 	{0xa0, 0x50, ZC3XX_R192_EXPOSURELIMITLOW}, /* 01,92,50,cc */
@@ -4051,7 +4051,7 @@ static const struct usb_action pas202b_60HZScale[] = {
 	{0xa0, 0x0e, ZC3XX_R088_EXPTIMELOW},		/* 00,88,0e,cc */
 	{}
 };
-static const struct usb_action pas202b_NoFliker[] = {
+static const struct usb_action pas202b_NoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},		/* 00,19,00,cc */
 	{0xa0, 0x20, ZC3XX_R087_EXPTIMEMID},		/* 00,87,20,cc */
 	{0xa0, 0x21, ZC3XX_R088_EXPTIMELOW},		/* 00,88,21,cc */
@@ -4080,7 +4080,7 @@ static const struct usb_action pas202b_NoFliker[] = {
 	{0xa0, 0x0e, ZC3XX_R088_EXPTIMELOW},		/* 00,88,0e,cc */
 	{}
 };
-static const struct usb_action pas202b_NoFlikerScale[] = {
+static const struct usb_action pas202b_NoFlickerScale[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},		/* 00,19,00,cc */
 	{0xa0, 0x20, ZC3XX_R087_EXPTIMEMID},		/* 00,87,20,cc */
 	{0xa0, 0x21, ZC3XX_R088_EXPTIMELOW},		/* 00,88,21,cc */
@@ -4309,7 +4309,7 @@ static const struct usb_action mt9v111_1_AE60HZScale[] = {
 	{0xa0, 0x42, ZC3XX_R180_AUTOCORRECTENABLE},
 	{}
 };
-static const struct usb_action mt9v111_1_AENoFliker[] = {
+static const struct usb_action mt9v111_1_AENoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R180_AUTOCORRECTENABLE},
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xbb, 0x00, 0x0509},
@@ -4332,7 +4332,7 @@ static const struct usb_action mt9v111_1_AENoFliker[] = {
 	{0xa0, 0x42, ZC3XX_R180_AUTOCORRECTENABLE},
 	{}
 };
-static const struct usb_action mt9v111_1_AENoFlikerScale[] = {
+static const struct usb_action mt9v111_1_AENoFlickerScale[] = {
 	{0xa0, 0x00, ZC3XX_R180_AUTOCORRECTENABLE},
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xbb, 0x00, 0x0534},
@@ -4554,7 +4554,7 @@ static const struct usb_action mt9v111_3_AE60HZScale[] = {
 	{0xa0, 0x42, ZC3XX_R180_AUTOCORRECTENABLE},
 	{}
 };
-static const struct usb_action mt9v111_3_AENoFliker[] = {
+static const struct usb_action mt9v111_3_AENoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R180_AUTOCORRECTENABLE},
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xaa, 0x05, 0x0034},
@@ -4577,7 +4577,7 @@ static const struct usb_action mt9v111_3_AENoFliker[] = {
 	{0xa0, 0x42, ZC3XX_R180_AUTOCORRECTENABLE},
 	{}
 };
-static const struct usb_action mt9v111_3_AENoFlikerScale[] = {
+static const struct usb_action mt9v111_3_AENoFlickerScale[] = {
 	{0xa0, 0x00, ZC3XX_R180_AUTOCORRECTENABLE},
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xaa, 0x05, 0x0034},
@@ -4787,7 +4787,7 @@ static const struct usb_action pb0330_60HZScale[] = {
 	{0xa0, 0xd0, ZC3XX_R020_HSYNC_3},
 	{}
 };
-static const struct usb_action pb0330_NoFliker[] = {
+static const struct usb_action pb0330_NoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xbb, 0x00, 0x0509},
 	{0xbb, 0x02, 0x0940},
@@ -4809,7 +4809,7 @@ static const struct usb_action pb0330_NoFliker[] = {
 	{0xa0, 0xe0, ZC3XX_R020_HSYNC_3},
 	{}
 };
-static const struct usb_action pb0330_NoFlikerScale[] = {
+static const struct usb_action pb0330_NoFlickerScale[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS},
 	{0xbb, 0x00, 0x0535},
 	{0xbb, 0x01, 0x0980},
@@ -5031,7 +5031,7 @@ static const struct usb_action po2030_60HZ[] = {
 	{}
 };
 
-static const struct usb_action po2030_NoFliker[] = {
+static const struct usb_action po2030_NoFlicker[] = {
 	{0xa0, 0x02, ZC3XX_R180_AUTOCORRECTENABLE}, /* 01,80,02,cc */
 	{0xaa, 0x8d, 0x000d}, /* 00,8d,0d,aa */
 	{0xaa, 0x1a, 0x0000}, /* 00,1a,00,aa */
@@ -5215,7 +5215,7 @@ static const struct usb_action tas5130c_60HZScale[] = {
 	{0xa0, 0x50, ZC3XX_R11D_GLOBALGAIN},
 	{}
 };
-static const struct usb_action tas5130c_NoFliker[] = {
+static const struct usb_action tas5130c_NoFlicker[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS}, /* 00,19,00,cc */
 	{0xaa, 0xa3, 0x0001}, /* 00,a3,01,aa */
 	{0xaa, 0xa4, 0x0040}, /* 00,a4,40,aa */
@@ -5241,7 +5241,7 @@ static const struct usb_action tas5130c_NoFliker[] = {
 	{}
 };
 
-static const struct usb_action tas5130c_NoFlikerScale[] = {
+static const struct usb_action tas5130c_NoFlickerScale[] = {
 	{0xa0, 0x00, ZC3XX_R019_AUTOADJUSTFPS}, /* 00,19,00,cc */
 	{0xaa, 0xa3, 0x0001}, /* 00,a3,01,aa */
 	{0xaa, 0xa4, 0x0090}, /* 00,a4,90,aa */
@@ -5482,7 +5482,7 @@ static const struct usb_action gc0303_60HZScale[] = {
 	{}
 };
 
-static const struct usb_action gc0303_NoFliker[] = {
+static const struct usb_action gc0303_NoFlicker[] = {
 	{0xa0, 0x0c, ZC3XX_R100_OPERATIONMODE},		/* 01,00,0c,cc, */
 	{0xaa, 0x82, 0x0000},		/* 00,82,00,aa */
 	{0xaa, 0x83, 0x0000},		/* 00,83,00,aa */
@@ -5504,7 +5504,7 @@ static const struct usb_action gc0303_NoFliker[] = {
 	{}
 };
 
-static const struct usb_action gc0303_NoFlikerScale[] = {
+static const struct usb_action gc0303_NoFlickerScale[] = {
 	{0xa0, 0x0c, ZC3XX_R100_OPERATIONMODE},		/* 01,00,0c,cc, */
 	{0xaa, 0x82, 0x0000},		/* 00,82,00,aa */
 	{0xaa, 0x83, 0x0000},		/* 00,83,00,aa */
@@ -5806,7 +5806,7 @@ static void setquality(struct gspca_dev *gspca_dev)
  * Valid frequencies are:
  *	50Hz, for European and Asian lighting (default)
  *	60Hz, for American lighting
- *	0 = No Fliker (for outdoore usage)
+ *	0 = No Flicker (for outdoor usage)
  */
 static void setlightfreq(struct gspca_dev *gspca_dev, s32 val)
 {
@@ -5814,80 +5814,80 @@ static void setlightfreq(struct gspca_dev *gspca_dev, s32 val)
 	int i, mode;
 	const struct usb_action *zc3_freq;
 	static const struct usb_action *freq_tb[SENSOR_MAX][6] = {
-	[SENSOR_ADCM2700] =
-		{adcm2700_NoFliker, adcm2700_NoFliker,
+	[SENSOR_ADCM2700] = {
+		 adcm2700_NoFlicker, adcm2700_NoFlicker,
 		 adcm2700_50HZ, adcm2700_50HZ,
 		 adcm2700_60HZ, adcm2700_60HZ},
-	[SENSOR_CS2102] =
-		{cs2102_NoFliker, cs2102_NoFlikerScale,
+	[SENSOR_CS2102] = {
+		 cs2102_NoFlicker, cs2102_NoFlickerScale,
 		 cs2102_50HZ, cs2102_50HZScale,
 		 cs2102_60HZ, cs2102_60HZScale},
-	[SENSOR_CS2102K] =
-		{cs2102_NoFliker, cs2102_NoFlikerScale,
+	[SENSOR_CS2102K] = {
+		 cs2102_NoFlicker, cs2102_NoFlickerScale,
 		 NULL, NULL, /* currently disabled */
 		 NULL, NULL},
-	[SENSOR_GC0303] =
-		{gc0303_NoFliker, gc0303_NoFlikerScale,
+	[SENSOR_GC0303] = {
+		 gc0303_NoFlicker, gc0303_NoFlickerScale,
 		 gc0303_50HZ, gc0303_50HZScale,
 		 gc0303_60HZ, gc0303_60HZScale},
-	[SENSOR_GC0305] =
-		{gc0305_NoFliker, gc0305_NoFliker,
+	[SENSOR_GC0305] = {
+		 gc0305_NoFlicker, gc0305_NoFlicker,
 		 gc0305_50HZ, gc0305_50HZ,
 		 gc0305_60HZ, gc0305_60HZ},
-	[SENSOR_HDCS2020] =
-		{hdcs2020_NoFliker, hdcs2020_NoFliker,
+	[SENSOR_HDCS2020] = {
+		 hdcs2020_NoFlicker, hdcs2020_NoFlicker,
 		 hdcs2020_50HZ, hdcs2020_50HZ,
 		 hdcs2020_60HZ, hdcs2020_60HZ},
-	[SENSOR_HV7131B] =
-		{hv7131b_NoFliker, hv7131b_NoFlikerScale,
+	[SENSOR_HV7131B] = {
+		 hv7131b_NoFlicker, hv7131b_NoFlickerScale,
 		 hv7131b_50HZ, hv7131b_50HZScale,
 		 hv7131b_60HZ, hv7131b_60HZScale},
-	[SENSOR_HV7131R] =
-		{hv7131r_NoFliker, hv7131r_NoFlikerScale,
+	[SENSOR_HV7131R] = {
+		 hv7131r_NoFlicker, hv7131r_NoFlickerScale,
 		 hv7131r_50HZ, hv7131r_50HZScale,
 		 hv7131r_60HZ, hv7131r_60HZScale},
-	[SENSOR_ICM105A] =
-		{icm105a_NoFliker, icm105a_NoFlikerScale,
+	[SENSOR_ICM105A] = {
+		 icm105a_NoFlicker, icm105a_NoFlickerScale,
 		 icm105a_50HZ, icm105a_50HZScale,
 		 icm105a_60HZ, icm105a_60HZScale},
-	[SENSOR_MC501CB] =
-		{mc501cb_NoFliker, mc501cb_NoFlikerScale,
+	[SENSOR_MC501CB] = {
+		 mc501cb_NoFlicker, mc501cb_NoFlickerScale,
 		 mc501cb_50HZ, mc501cb_50HZScale,
 		 mc501cb_60HZ, mc501cb_60HZScale},
-	[SENSOR_MT9V111_1] =
-		{mt9v111_1_AENoFliker, mt9v111_1_AENoFlikerScale,
+	[SENSOR_MT9V111_1] = {
+		 mt9v111_1_AENoFlicker, mt9v111_1_AENoFlickerScale,
 		 mt9v111_1_AE50HZ, mt9v111_1_AE50HZScale,
 		 mt9v111_1_AE60HZ, mt9v111_1_AE60HZScale},
-	[SENSOR_MT9V111_3] =
-		{mt9v111_3_AENoFliker, mt9v111_3_AENoFlikerScale,
+	[SENSOR_MT9V111_3] = {
+		 mt9v111_3_AENoFlicker, mt9v111_3_AENoFlickerScale,
 		 mt9v111_3_AE50HZ, mt9v111_3_AE50HZScale,
 		 mt9v111_3_AE60HZ, mt9v111_3_AE60HZScale},
-	[SENSOR_OV7620] =
-		{ov7620_NoFliker, ov7620_NoFliker,
+	[SENSOR_OV7620] = {
+		 ov7620_NoFlicker, ov7620_NoFlicker,
 		 ov7620_50HZ, ov7620_50HZ,
 		 ov7620_60HZ, ov7620_60HZ},
-	[SENSOR_OV7630C] =
-		{NULL, NULL,
+	[SENSOR_OV7630C] = {
+		 NULL, NULL,
 		 NULL, NULL,
 		 NULL, NULL},
-	[SENSOR_PAS106] =
-		{pas106b_NoFliker, pas106b_NoFliker,
+	[SENSOR_PAS106] = {
+		 pas106b_NoFlicker, pas106b_NoFlicker,
 		 pas106b_50HZ, pas106b_50HZ,
 		 pas106b_60HZ, pas106b_60HZ},
-	[SENSOR_PAS202B] =
-		{pas202b_NoFliker, pas202b_NoFlikerScale,
+	[SENSOR_PAS202B] = {
+		 pas202b_NoFlicker, pas202b_NoFlickerScale,
 		 pas202b_50HZ, pas202b_50HZScale,
 		 pas202b_60HZ, pas202b_60HZScale},
-	[SENSOR_PB0330] =
-		{pb0330_NoFliker, pb0330_NoFlikerScale,
+	[SENSOR_PB0330] = {
+		 pb0330_NoFlicker, pb0330_NoFlickerScale,
 		 pb0330_50HZ, pb0330_50HZScale,
 		 pb0330_60HZ, pb0330_60HZScale},
-	[SENSOR_PO2030] =
-		{po2030_NoFliker, po2030_NoFliker,
+	[SENSOR_PO2030] = {
+		 po2030_NoFlicker, po2030_NoFlicker,
 		 po2030_50HZ, po2030_50HZ,
 		 po2030_60HZ, po2030_60HZ},
-	[SENSOR_TAS5130C] =
-		{tas5130c_NoFliker, tas5130c_NoFlikerScale,
+	[SENSOR_TAS5130C] = {
+		 tas5130c_NoFlicker, tas5130c_NoFlickerScale,
 		 tas5130c_50HZ, tas5130c_50HZScale,
 		 tas5130c_60HZ, tas5130c_60HZScale},
 	};
-- 
2.25.1

