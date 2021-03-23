Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45676345DFC
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 13:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCWM0G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 08:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhCWMZs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 08:25:48 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336B2C061574;
        Tue, 23 Mar 2021 05:25:48 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so12108788pjq.5;
        Tue, 23 Mar 2021 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22WapxlsL5Vep3Jfk2Q9IvrWzyL5hDN2I+44snTBXPk=;
        b=HsU1ZuivSi6tHNkA220k4j8xUNCECpij38gODzRHQ1P88/n27LlMbPdIn8diVI3igY
         P6fQ+CIpTU9LwnnMp05+atJT43fA6wOix1ZjTG1qWUWcJH8N13AlfiB34XkZwwGJhJiU
         qnC2b6G7QgM7iMrhqAOPUjHu6ssbuH/GOAfTl4JIvTYICmAFbw0syTiQ0vdHPtFojHDi
         LQWCdme4XjdZKKvAebV2yjtYyI5KWWrA7phNYoiAQqUOv10VsiAa3VmqmqSdI1UGZ+HK
         KN2TL0zVfcMk7arHdz94LEstGIMdzv5S9FETZitz5LkwC4wnwnJ1juwI9gTmGHRb4NmZ
         rlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22WapxlsL5Vep3Jfk2Q9IvrWzyL5hDN2I+44snTBXPk=;
        b=e9LdjAODsQ3DmOtikPeMd0G6AybMvu9cL2JTb20vL2Gd/GGboOjRyKWUQNbNhGVLKT
         1hFu8ataZM0f55zOsMbn3RnEe3fd92Rhu6eYASW7Q0ianDGQweZWWD2bUjFTDHQwCDfV
         /LujaPk8ROkZCQYCOJfjsyUYGsL+YdPPfbGO5Vv1pSvS3eidspVMZZzXrMT1t4ovBTKP
         AvRxv+SHf3LX5ZV0+CTbfvyuWs1gkRCCudFxpeGncvNx3lgRe9slqm7ZbCKhI0B0W2ga
         5U9PSlogAvUCfkZF8Zjejc6ABF7LsqTTHwliogqbZDMwZ5uSh02yPn/O8TuFNGaNRcZt
         8EKQ==
X-Gm-Message-State: AOAM53126NM3MuwfM3c1isk0w005i2Sdj2+6uNqcgJOgkyjBYU5WWaiF
        f9+1jiaTdTrYK6A/vmG9z+U=
X-Google-Smtp-Source: ABdhPJzyTafoesjtuxwDYIHYjS/gPPqyQyTRdXSJ15HIX9/Sz5rea86ks9uauzes2kKRIgnK570J+Q==
X-Received: by 2002:a17:90a:bc4c:: with SMTP id t12mr4338074pjv.223.1616502347695;
        Tue, 23 Mar 2021 05:25:47 -0700 (PDT)
Received: from DESKTOP-4V60UBS.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id e63sm16659013pfe.208.2021.03.23.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 05:25:47 -0700 (PDT)
From:   Xiaofeng Cao <cxfcosmos@gmail.com>
X-Google-Original-From: Xiaofeng Cao <caoxiaofeng@yulong.com>
To:     mchehab@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiaofeng Cao <caoxiaofeng@yulong.com>
Subject: [PATCH] drivers/media/pci/bt8xx/bttv-cards: fix typos
Date:   Tue, 23 Mar 2021 20:25:46 +0800
Message-Id: <20210323122546.16262-1-caoxiaofeng@yulong.com>
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
 drivers/media/pci/bt8xx/bttv-cards.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
index ca20b806e82d..9a07e1094978 100644
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
+	       one external stereo unbalanced(RCA) audio connection
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
+	/*This is the video input redirection functionality : I DID NOT USED IT. */
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

