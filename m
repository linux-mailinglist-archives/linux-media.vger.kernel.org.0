Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5225468365F
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjAaTVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjAaTVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:21:06 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A44599AF
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:58 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q10so15219661wrm.4
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5McuJ2hRZrWx+uYtLO8QBzTJ9fuESjuMdU73e0TzLA=;
        b=s6sgjx2jimyUaoKyGGZXhTNlC4TcrIfwNDF1wpvcBNLh1IaOYAAhsK7LXT45TB3R0D
         eyAk523tRxkVx3w00erIRhkjhUWGsa5RM56UzC1wfsy7OE9LsUgNRVFYd45gBPTd3b1S
         /LSBZpR0DotPJTNPQk+YTmzEmlN2qFy90/W3d439E4SG1W7yv4rpqBjhbGm6ntu+HWWZ
         KKnMA3d6+02Zqk65duVThhkCtDGsBPYaTJOKWoTsORO7iMKpHbWdIe5zRz4CbZJ5I88Q
         b7MVKxJabV28zZr637rrFvA+7Ib69QZwfIszLGq2lQ9EtjummTCbIboypRtfJPBehTPn
         AVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5McuJ2hRZrWx+uYtLO8QBzTJ9fuESjuMdU73e0TzLA=;
        b=AoPCJwSXqtM7gL9Bc1KU5MCj7f+F8ON3ImOew7Mt4HwrMs4prbVuInH5wj+zRoyCSi
         pMtiLxuoKWE/ys8oCh2yMOY0w/IzHuxSOqiFpqNWCyOKjSQTgniA7PtmnfhooWKJyyLJ
         IlI3cGIe+ouolMIFCB3nmG81piluDuh+oidlgyX3d/BPKRLNQE6UUe+Knc831cKO5XYA
         aDe0z1I6Eub26f6zB5XZiqYCwFrjx0FKHWDzyHnOmieYMpCez3oDfAn3sleHPOlgo9v3
         b8QCoYpTo2h2Lmnwd3zW2Hx2kSgdI1WheqxzGTj2ln6P59mbAKNFiEkQRP/sga7+Lv69
         RtLw==
X-Gm-Message-State: AO0yUKUpP1iHb91RBhydRkZKPRVXbg89i4d3VOF40WgmYuyCxaJK1la3
        p8Gjnksqbd7oqdC8T+3Rz7lQ86n1jOP5BFWS
X-Google-Smtp-Source: AK7set/JPjn9n9VoNB2/5M4o5xd5uwP8v8rDeJDJvAFuOglgmYRV1aGJXAaZNaQv9qJKRIMAcWawCA==
X-Received: by 2002:adf:c754:0:b0:2ba:dce5:ee28 with SMTP id b20-20020adfc754000000b002badce5ee28mr164864wrh.18.1675192858175;
        Tue, 31 Jan 2023 11:20:58 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:20:57 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 06/11] media: i2c: imx290: Use CSI timings as per datasheet
Date:   Tue, 31 Jan 2023 19:20:11 +0000
Message-Id: <20230131192016.3476937-7-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit "98e0500eadb7 media: i2c: imx290: Add configurable link frequency
and pixel rate" added support for the increased link frequencies
on 2 data lanes, but didn't update the CSI timing registers in
accordance with the datasheet.

Use the specified settings.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 126 +++++++++++++++++++++++++++++++------
 1 file changed, 106 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6bcfa535872f..9ddd6382b127 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -174,6 +174,18 @@ struct imx290_mode {
 	u32 data_size;
 };
 
+struct imx290_csi_cfg {
+	u16 repitition;
+	u16 tclkpost;
+	u16 thszero;
+	u16 thsprepare;
+	u16 tclktrail;
+	u16 thstrail;
+	u16 tclkzero;
+	u16 tclkprepare;
+	u16 tlpx;
+};
+
 struct imx290 {
 	struct device *dev;
 	struct clk *xclk;
@@ -273,16 +285,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
 	{ IMX290_INCKSEL4, 0x01 },
 	{ IMX290_INCKSEL5, 0x1a },
 	{ IMX290_INCKSEL6, 0x1a },
-	/* data rate settings */
-	{ IMX290_REPETITION, 0x10 },
-	{ IMX290_TCLKPOST, 87 },
-	{ IMX290_THSZERO, 55 },
-	{ IMX290_THSPREPARE, 31 },
-	{ IMX290_TCLKTRAIL, 31 },
-	{ IMX290_THSTRAIL, 31 },
-	{ IMX290_TCLKZERO, 119 },
-	{ IMX290_TCLKPREPARE, 31 },
-	{ IMX290_TLPX, 23 },
 };
 
 static const struct imx290_regval imx290_720p_settings[] = {
@@ -298,16 +300,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
 	{ IMX290_INCKSEL4, 0x01 },
 	{ IMX290_INCKSEL5, 0x1a },
 	{ IMX290_INCKSEL6, 0x1a },
-	/* data rate settings */
-	{ IMX290_REPETITION, 0x10 },
-	{ IMX290_TCLKPOST, 79 },
-	{ IMX290_THSZERO, 47 },
-	{ IMX290_THSPREPARE, 23 },
-	{ IMX290_TCLKTRAIL, 23 },
-	{ IMX290_THSTRAIL, 23 },
-	{ IMX290_TCLKZERO, 87 },
-	{ IMX290_TCLKPREPARE, 23 },
-	{ IMX290_TLPX, 23 },
 };
 
 static const struct imx290_regval imx290_10bit_settings[] = {
@@ -328,6 +320,58 @@ static const struct imx290_regval imx290_12bit_settings[] = {
 	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
 };
 
+static const struct imx290_csi_cfg imx290_csi_222_75mhz = {
+	/* 222.25MHz or 445.5Mbit/s per lane */
+	.repitition = 0x10,
+	.tclkpost = 87,
+	.thszero = 55,
+	.thsprepare = 31,
+	.tclktrail = 31,
+	.thstrail = 31,
+	.tclkzero = 119,
+	.tclkprepare = 31,
+	.tlpx = 23,
+};
+
+static const struct imx290_csi_cfg imx290_csi_445_5mhz = {
+	/* 445.5MHz or 891Mbit/s per lane */
+	.repitition = 0x00,
+	.tclkpost = 119,
+	.thszero = 103,
+	.thsprepare = 71,
+	.tclktrail = 55,
+	.thstrail = 63,
+	.tclkzero = 255,
+	.tclkprepare = 63,
+	.tlpx = 55,
+};
+
+static const struct imx290_csi_cfg imx290_csi_148_5mhz = {
+	/* 148.5MHz or 297Mbit/s per lane */
+	.repitition = 0x10,
+	.tclkpost = 79,
+	.thszero = 47,
+	.thsprepare = 23,
+	.tclktrail = 23,
+	.thstrail = 23,
+	.tclkzero = 87,
+	.tclkprepare = 23,
+	.tlpx = 23,
+};
+
+static const struct imx290_csi_cfg imx290_csi_297mhz = {
+	/* 297MHz or 594Mbit/s per lane */
+	.repitition = 0x00,
+	.tclkpost = 103,
+	.thszero = 87,
+	.thsprepare = 47,
+	.tclktrail = 39,
+	.thstrail = 47,
+	.tclkzero = 191,
+	.tclkprepare = 47,
+	.tlpx = 39,
+};
+
 /* supported link frequencies */
 #define FREQ_INDEX_1080P	0
 #define FREQ_INDEX_720P		1
@@ -536,6 +580,42 @@ static int imx290_set_black_level(struct imx290 *imx290,
 			    black_level >> (16 - bpp), err);
 }
 
+static int imx290_set_csi_config(struct imx290 *imx290)
+{
+	const s64 *link_freqs = imx290_link_freqs_ptr(imx290);
+	const struct imx290_csi_cfg *csi_cfg;
+	int ret = 0;
+
+	switch (link_freqs[imx290->current_mode->link_freq_index]) {
+	case 445500000:
+		csi_cfg = &imx290_csi_445_5mhz;
+		break;
+	case 297000000:
+		csi_cfg = &imx290_csi_297mhz;
+		break;
+	case 222750000:
+		csi_cfg = &imx290_csi_222_75mhz;
+		break;
+	case 148500000:
+		csi_cfg = &imx290_csi_148_5mhz;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	imx290_write(imx290, IMX290_REPETITION, csi_cfg->repitition, &ret);
+	imx290_write(imx290, IMX290_TCLKPOST, csi_cfg->tclkpost, &ret);
+	imx290_write(imx290, IMX290_THSZERO, csi_cfg->thszero, &ret);
+	imx290_write(imx290, IMX290_THSPREPARE, csi_cfg->thsprepare, &ret);
+	imx290_write(imx290, IMX290_TCLKTRAIL, csi_cfg->tclktrail, &ret);
+	imx290_write(imx290, IMX290_THSTRAIL, csi_cfg->thstrail, &ret);
+	imx290_write(imx290, IMX290_TCLKZERO, csi_cfg->tclkzero, &ret);
+	imx290_write(imx290, IMX290_TCLKPREPARE, csi_cfg->tclkprepare, &ret);
+	imx290_write(imx290, IMX290_TLPX, csi_cfg->tlpx, &ret);
+
+	return ret;
+}
+
 static int imx290_setup_format(struct imx290 *imx290,
 			       const struct v4l2_mbus_framefmt *format)
 {
@@ -748,6 +828,12 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
+	ret = imx290_set_csi_config(imx290);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Could not set csi cfg\n");
+		return ret;
+	}
+
 	/* Apply the register values related to current frame format */
 	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
 	ret = imx290_setup_format(imx290, format);
-- 
2.34.1

