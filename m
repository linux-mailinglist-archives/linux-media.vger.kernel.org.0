Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32040347020
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 04:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbhCXD3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 23:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235045AbhCXD3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 23:29:05 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4A0C061763;
        Tue, 23 Mar 2021 20:29:05 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id h25so13715353pgm.3;
        Tue, 23 Mar 2021 20:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GoTQD0Cplvh8amn0DEisJMbNROOwhI2HVGKzSSOpwOI=;
        b=gk/2ADrjI9nDy0gKkDATv99r680d+ehtjYYg/xXN+5JkiPkY1bB1CND2SJf3Vc4BJ6
         Vr6TP0QYr5D1k9MZKGq6SrG1lqx13hiLUy2/yqRnek5UbAtFUJwkTMWB8azv5EputTUp
         UfXKIKTE0RNfSp1KBQNZqUx9FR/Aj5YyQnzxe+3pHPNDCbcEOcmJJAsVA7VO3xTktLG/
         Cv4hRdjXsrO1MKktiH4AkuBpBbkEsDLZGAg7MutYDdb3PAYSnyPDN7/RtbxaZ3mkIUvc
         +AmbhTR96NXHuHrm57tYcRPrloVnr31LOisyjhTPEOvlwOb3b5PacPQQ6QUVtH9MEzGD
         cXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GoTQD0Cplvh8amn0DEisJMbNROOwhI2HVGKzSSOpwOI=;
        b=aA9e7dy9JWBVoCswAMBO2uJpzshuKkSlf3vm1gXLhTLOQpFV10tjNXyTbsNsTDq8QS
         6eXMpHFWz8TRK+z/mCyqjtvHtWEkgo8p6Bf5gYkaIi3I/9lI/6ZA4IYB2Di4S3UtLFR6
         gulWmT0+0wqVYECkIMIAR6f7W/2ZChVa+fnduA/k2AtaKADXYppbfIgNPxrRASCvpN5M
         bvMjPsxJEOcum4qTNcq1eqTk/iNGCKe4xpRDEyTyf6oYLYoPW2HsGrwHwvcgEjlIruRX
         APCB5wWL8iSOEX3GfM103mFHd2cP/ztNShO7bywN/MX+63dzvUjcojsafTM2fgv57fMR
         Njkw==
X-Gm-Message-State: AOAM530RkzLTGpIDKu0gRoXMoZ3b/mcm/m8abpOoffpJiAlySyKyr4xc
        pUJAtyQnbwYbjid/An+R5qMq96zfZPehDg==
X-Google-Smtp-Source: ABdhPJzCmWs+QQjY/moEs291q6quo3+ZoaLdCI3/Xn0QkjfDjAddfP5nY3mpcrglLC613qaDaJGs3w==
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id g136-20020a62528e0000b02901f5c5eea487mr1192160pfb.7.1616556544829;
        Tue, 23 Mar 2021 20:29:04 -0700 (PDT)
Received: from DESKTOP-4V60UBS.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id 202sm552861pfu.46.2021.03.23.20.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 20:29:04 -0700 (PDT)
From:   Xiaofeng Cao <cxfcosmos@gmail.com>
X-Google-Original-From: Xiaofeng Cao <caoxiaofeng@yulong.com>
To:     mchehab@kernel.org
Cc:     Julia.Lawall@inria.fr, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiaofeng Cao <caoxiaofeng@yulong.com>
Subject: [PATCH v2] drivers/media/pci/bt8xx/bttv-cards: fix typos
Date:   Wed, 24 Mar 2021 11:29:06 +0800
Message-Id: <20210324032906.17094-1-caoxiaofeng@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

change 'vodeo'     to 'video'
change 'nevery'    to 'never'
change 'is'        to 'it'
change 'connevted' to 'connected'
change 'swichers'  to 'switchers'
change 'strucure'  to 'structure'
change 'unblanced' to 'unbalanced'
change 'fonctionality' to 'functionality'

Signed-off-by: Xiaofeng Cao <caoxiaofeng@yulong.com>
---
v2: resume space and change 'USED' to 'USE'
 drivers/media/pci/bt8xx/bttv-cards.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
index ca20b806e82d..c2b5ab287dd7 100644
--- a/drivers/media/pci/bt8xx/bttv-cards.c
+++ b/drivers/media/pci/bt8xx/bttv-cards.c
@@ -2011,7 +2011,7 @@ struct tvcard bttv_tvcards[] = {
 		/* .audio_inputs= 0, */
 		.svhs           = 9,
 		.gpiomask       = 0x00,
-		.gpiomask2      = 0x03, /* used for external vodeo mux */
+		.gpiomask2      = 0x03, /* used for external video mux */
 		.muxsel         = MUXSEL(2, 2, 2, 2, 3, 3, 3, 3, 1, 0),
 		.muxsel_hook	= phytec_muxsel,
 		.gpiomux        = { 0, 0, 0, 0 }, /* card has no audio */
@@ -2025,7 +2025,7 @@ struct tvcard bttv_tvcards[] = {
 		/* .audio_inputs= 0, */
 		.svhs           = 9,
 		.gpiomask       = 0x00,
-		.gpiomask2      = 0x03, /* used for external vodeo mux */
+		.gpiomask2      = 0x03, /* used for external video mux */
 		.muxsel         = MUXSEL(2, 2, 2, 2, 3, 3, 3, 3, 1, 1),
 		.muxsel_hook	= phytec_muxsel,
 		.gpiomux        = { 0, 0, 0, 0 }, /* card has no audio */
@@ -2180,8 +2180,8 @@ struct tvcard bttv_tvcards[] = {
 	[BTTV_BOARD_PICOLO_TETRA_CHIP] = {
 		/*Eric DEBIEF <debief@telemsa.com>*/
 		/*EURESYS Picolo Tetra : 4 Conexant Fusion 878A, no audio, video input set with analog multiplexers GPIO controlled*/
-		/* adds picolo_tetra_muxsel(), picolo_tetra_init(), the following declaration strucure, and #define BTTV_BOARD_PICOLO_TETRA_CHIP*/
-		/*0x79 in bttv.h*/
+		/*adds picolo_tetra_muxsel(), picolo_tetra_init(), the following declaration*/
+		/*structure and #define BTTV_BOARD_PICOLO_TETRA_CHIP 0x79 in bttv.h*/
 		.name           = "Euresys Picolo Tetra",
 		.video_inputs   = 4,
 		/* .audio_inputs= 0, */
@@ -2506,7 +2506,7 @@ struct tvcard bttv_tvcards[] = {
 	     one external BNC composite input (mux 2)
 	     three internal composite inputs (unknown muxes)
 	     an 18-bit stereo A/D (CS5331A), which has:
-	       one external stereo unblanced (RCA) audio connection
+	       one external stereo unbalanced (RCA) audio connection
 	       one (or 3?) internal stereo balanced (XLR) audio connection
 	       input is selected via gpio to a 14052B mux
 		 (mask=0x300, unbal=0x000, bal=0x100, ??=0x200,0x300)
@@ -3924,7 +3924,7 @@ static void osprey_eeprom(struct bttv *btv, const u8 ee[256])
 	u32 serial = 0;
 	int cardid = -1;
 
-	/* This code will nevery actually get called in this case.... */
+	/* This code will never actually get called in this case.... */
 	if (btv->c.type == BTTV_BOARD_UNKNOWN) {
 		/* this might be an antique... check for MMAC label in eeprom */
 		if (!strncmp(ee, "MMAC", 4)) {
@@ -4086,7 +4086,7 @@ static void avermedia_eeprom(struct bttv *btv)
 /*
  * For Voodoo TV/FM and Voodoo 200.  These cards' tuners use a TDA9880
  * analog demod, which is not I2C controlled like the newer and more common
- * TDA9887 series.  Instead is has two tri-state input pins, S0 and S1,
+ * TDA9887 series.  Instead it has two tri-state input pins, S0 and S1,
  * that control the IF for the video and audio.  Apparently, bttv GPIO
  * 0x10000 is connected to S0.  S0 low selects a 38.9 MHz VIF for B/G/D/K/I
  * (i.e., PAL) while high selects 45.75 MHz for M/N (i.e., NTSC).
@@ -4144,7 +4144,7 @@ static void init_PXC200(struct bttv *btv)
 	int tmp;
 	u32 val;
 
-	/* Initialise GPIO-connevted stuff */
+	/* Initialise GPIO-connected stuff */
 	gpio_inout(0xffffff, (1<<13));
 	gpio_write(0);
 	udelay(3);
@@ -4580,7 +4580,7 @@ static void xguard_muxsel(struct bttv *btv, unsigned int input)
 }
 static void picolo_tetra_init(struct bttv *btv)
 {
-	/*This is the video input redirection fonctionality : I DID NOT USED IT. */
+	/*This is the video input redirection functionality : I DID NOT USE IT. */
 	btwrite (0x08<<16,BT848_GPIO_DATA);/*GPIO[19] [==> 4053 B+C] set to 1 */
 	btwrite (0x04<<16,BT848_GPIO_DATA);/*GPIO[18] [==> 4053 A]  set to 1*/
 }
@@ -4598,7 +4598,7 @@ static void picolo_tetra_muxsel (struct bttv* btv, unsigned int input)
  * ivc120_muxsel [Added by Alan Garfield <alan@fromorbit.com>]
  *
  * The IVC120G security card has 4 i2c controlled TDA8540 matrix
- * swichers to provide 16 channels to MUX0. The TDA8540's have
+ * switchers to provide 16 channels to MUX0. The TDA8540's have
  * 4 independent outputs and as such the IVC120G also has the
  * optional "Monitor Out" bus. This allows the card to be looking
  * at one input while the monitor is looking at another.
-- 
2.25.1

