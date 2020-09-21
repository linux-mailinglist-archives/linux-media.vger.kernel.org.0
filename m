Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB55E272082
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgIUKW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgIUKVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:06 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCBBC061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:05 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id b79so12013232wmb.4
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OuktUbzogSgMnm6tl68bM64IlyF+ws6MaXPokPAQRHg=;
        b=JCcu8rOSnPInqXXKrkjuF8aGuowsFaGAbtpYyb+vQHU7NqPENDa9PW1qv8sAfKG1f3
         7ntQVJJZGoBUND9z+U/AAht1eWh5G/xaHd+Ojy86mTkXkHqGrfpq7cQIUJHHomFT7ait
         tQhT432OntImygVT+KMUCebXRrIC9w2Ex4czSug9xHx6W3wOUR4Ef7v3Q+7KZVsJJVQw
         whoqxIl+7pkUT/u242X0EMAD1q4tcn6lHU5Uoh+PWv4P0ZhaV9iJ9lZ2XHdY3BJoTpDY
         G0O6Ocfbz+qG86kxfAb2iXxcQs+zspSw5+4QSCm5c8SIZiGLBT/rd2BjisiuKUO605hA
         OZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OuktUbzogSgMnm6tl68bM64IlyF+ws6MaXPokPAQRHg=;
        b=HSFfKL+uNYoBQX7xigBUL49SUtxb4RMmL6fwriu9SfWTLN66lF4aYxMPUGlPV0KkNc
         tR9u9m/zYPltK4011MD/qbPliy+6LfcRUKFi7wNoqZHrvBiHYNXOHhP/53MYu9EptGc3
         oQqDPaz6qVDRsDD6hFGEvqf61Gul4IAskvBUvwZWPRU/nUEeMY0FASHlZFQFga8vwrbL
         C19BtPbv1MzDOW9dLzWH5Uq2LTRGYvM8Uh3ozTgSun2CPXUVKU3PT/2/wGv6m5xO0h9w
         b9ZaoiHLtLcqyaDniEC/8TvdkbtPR/DHVhjNaNG+TWohpcSBjvORSg+D6wzUYTUEJzL4
         dG6Q==
X-Gm-Message-State: AOAM531I6C4BvUq0Lgw6SNURzkB8zgUOiv6D+08Fh3rsqA4o0LiXIfwA
        fwL3+74D+VmfhgxR7IYbcSChHw==
X-Google-Smtp-Source: ABdhPJz9qluklEwv8ciov73f9EFAyhxDpwQwXye4ZaFDhhVRjgzehOstV5sBL1dsX8CAEJIsF5SddQ==
X-Received: by 2002:a05:600c:220f:: with SMTP id z15mr16339258wml.87.1600683664607;
        Mon, 21 Sep 2020 03:21:04 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:03 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 34/49] staging: media: zoran: constify struct tvnorm
Date:   Mon, 21 Sep 2020 10:20:09 +0000
Message-Id: <1600683624-5863-35-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The structure tvnorm could be consified.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/videocodec.h   |  2 +-
 drivers/staging/media/zoran/zoran.h        |  4 ++--
 drivers/staging/media/zoran/zoran_card.c   | 24 +++++++++++-----------
 drivers/staging/media/zoran/zoran_device.c |  4 ++--
 drivers/staging/media/zoran/zr36016.c      |  4 ++--
 drivers/staging/media/zoran/zr36050.c      |  4 ++--
 drivers/staging/media/zoran/zr36060.c      |  2 +-
 7 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.h b/drivers/staging/media/zoran/videocodec.h
index 553af4ad431e..a049f3c2c68a 100644
--- a/drivers/staging/media/zoran/videocodec.h
+++ b/drivers/staging/media/zoran/videocodec.h
@@ -256,7 +256,7 @@ struct videocodec {
 	// set compression or decompression (or freeze, stop, standby, etc)
 	int (*set_mode)(struct videocodec *codec, int mode);
 	// setup picture size and norm (for the codec's video frontend)
-	int (*set_video)(struct videocodec *codec, struct tvnorm *norm,
+	int (*set_video)(struct videocodec *codec, const struct tvnorm *norm,
 			 struct vfe_settings *cap, struct vfe_polarity *pol);
 	// other control commands, also mmap setup etc.
 	int (*control)(struct videocodec *codec, int type, int size, void *data);
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index c73b7e7fd5e1..727ba67afd56 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -227,7 +227,7 @@ struct card_info {
 	} input[BUZ_MAX_INPUT];
 
 	v4l2_std_id norms;
-	struct tvnorm *tvn[3];	/* supported TV norms */
+	const struct tvnorm *tvn[3];	/* supported TV norms */
 
 	u32 jpeg_int;		/* JPEG interrupt */
 	u32 vsync_int;		/* VSYNC interrupt */
@@ -266,7 +266,7 @@ struct zoran {
 	u8 initialized;		/* flag if zoran has been correctly initialized */
 	int user;		/* number of current users */
 	struct card_info card;
-	struct tvnorm *timing;
+	const struct tvnorm *timing;
 
 	unsigned short id;	/* number of this device */
 	char name[32];		/* name of this device */
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index b841f532e6bb..176ce8a355ba 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -277,24 +277,24 @@ static char *codecid_to_modulename(u16 codecid)
 //      u16 Wt, Wa, HStart, HSyncStart, Ht, Ha, VStart;
 // };
 
-static struct tvnorm f50sqpixel = { 944, 768, 83, 880, 625, 576, 16 };
-static struct tvnorm f60sqpixel = { 780, 640, 51, 716, 525, 480, 12 };
-static struct tvnorm f50ccir601 = { 864, 720, 75, 804, 625, 576, 18 };
-static struct tvnorm f60ccir601 = { 858, 720, 57, 788, 525, 480, 16 };
+static const struct tvnorm f50sqpixel = { 944, 768, 83, 880, 625, 576, 16 };
+static const struct tvnorm f60sqpixel = { 780, 640, 51, 716, 525, 480, 12 };
+static const struct tvnorm f50ccir601 = { 864, 720, 75, 804, 625, 576, 18 };
+static const struct tvnorm f60ccir601 = { 858, 720, 57, 788, 525, 480, 16 };
 
-static struct tvnorm f50ccir601_lml33 = { 864, 720, 75 + 34, 804, 625, 576, 18 };
-static struct tvnorm f60ccir601_lml33 = { 858, 720, 57 + 34, 788, 525, 480, 16 };
+static const struct tvnorm f50ccir601_lml33 = { 864, 720, 75 + 34, 804, 625, 576, 18 };
+static const struct tvnorm f60ccir601_lml33 = { 858, 720, 57 + 34, 788, 525, 480, 16 };
 
 /* The DC10 (57/16/50) uses VActive as HSync, so HStart must be 0 */
-static struct tvnorm f50sqpixel_dc10 = { 944, 768, 0, 880, 625, 576, 0 };
-static struct tvnorm f60sqpixel_dc10 = { 780, 640, 0, 716, 525, 480, 12 };
+static const struct tvnorm f50sqpixel_dc10 = { 944, 768, 0, 880, 625, 576, 0 };
+static const struct tvnorm f60sqpixel_dc10 = { 780, 640, 0, 716, 525, 480, 12 };
 
 /*
  * FIXME: I cannot swap U and V in saa7114, so i do one pixel left shift in zoran (75 -> 74)
  * (Maxim Yevtyushkin <max@linuxmedialabs.com>)
  */
-static struct tvnorm f50ccir601_lm33r10 = { 864, 720, 74 + 54, 804, 625, 576, 18 };
-static struct tvnorm f60ccir601_lm33r10 = { 858, 720, 56 + 54, 788, 525, 480, 16 };
+static const struct tvnorm f50ccir601_lm33r10 = { 864, 720, 74 + 54, 804, 625, 576, 18 };
+static const struct tvnorm f60ccir601_lm33r10 = { 858, 720, 56 + 54, 788, 525, 480, 16 };
 
 /*
  * FIXME: The ks0127 seem incapable of swapping U and V, too, which is why I copy Maxim's left
@@ -303,8 +303,8 @@ static struct tvnorm f60ccir601_lm33r10 = { 858, 720, 56 + 54, 788, 525, 480, 16
  * Christer's driver used the unshifted norms, though...
  * /Sam
  */
-static struct tvnorm f50ccir601_avs6eyes = { 864, 720, 74, 804, 625, 576, 18 };
-static struct tvnorm f60ccir601_avs6eyes = { 858, 720, 56, 788, 525, 480, 16 };
+static const struct tvnorm f50ccir601_avs6eyes = { 864, 720, 74, 804, 625, 576, 18 };
+static const struct tvnorm f60ccir601_avs6eyes = { 858, 720, 56, 788, 525, 480, 16 };
 
 static const unsigned short vpx3220_addrs[] = { 0x43, 0x47, I2C_CLIENT_END };
 static const unsigned short saa7110_addrs[] = { 0x4e, 0x4f, I2C_CLIENT_END };
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 82d522c1a528..9558bafdde7d 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -292,7 +292,7 @@ static void zr36057_adjust_vfe(struct zoran *zr, enum zoran_codec_mode mode)
 static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 			    const struct zoran_format *format)
 {
-	struct tvnorm *tvn;
+	const struct tvnorm *tvn;
 	unsigned int HStart, HEnd, VStart, VEnd;
 	unsigned int DispMode;
 	unsigned int VidWinWid, VidWinHt;
@@ -510,7 +510,7 @@ static void init_jpeg_queue(struct zoran *zr)
 
 static void zr36057_set_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 {
-	struct tvnorm *tvn;
+	const struct tvnorm *tvn;
 	u32 reg;
 
 	tvn = zr->timing;
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index a8190005bc4d..046cffb92f5f 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -238,8 +238,8 @@ static int zr36016_set_mode(struct videocodec *codec, int mode)
 }
 
 /* set picture size */
-static int zr36016_set_video(struct videocodec *codec, struct tvnorm *norm,
-		   struct vfe_settings *cap, struct vfe_polarity *pol)
+static int zr36016_set_video(struct videocodec *codec, const struct tvnorm *norm,
+			     struct vfe_settings *cap, struct vfe_polarity *pol)
 {
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index f551631c18cd..348b9f0ab74c 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -554,8 +554,8 @@ static int zr36050_set_mode(struct videocodec *codec, int mode)
 }
 
 /* set picture size (norm is ignored as the codec doesn't know about it) */
-static int zr36050_set_video(struct videocodec *codec, struct tvnorm *norm,
-		   struct vfe_settings *cap, struct vfe_polarity *pol)
+static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm,
+			     struct vfe_settings *cap, struct vfe_polarity *pol)
 {
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
 	int size;
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 0a0916f5f8cd..773de0e64daf 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -477,7 +477,7 @@ static int zr36060_set_mode(struct videocodec *codec, int mode)
 }
 
 /* set picture size (norm is ignored as the codec doesn't know about it) */
-static int zr36060_set_video(struct videocodec *codec, struct tvnorm *norm,
+static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm,
 			     struct vfe_settings *cap, struct vfe_polarity *pol)
 {
 	struct zr36060 *ptr = (struct zr36060 *)codec->data;
-- 
2.26.2

