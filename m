Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBAED68A2CD
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbjBCTSo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbjBCTSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:38 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674D111F
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:37 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j25so2007571wrc.4
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED04Jjib0S5Ccnml5lJKy3n+5EcEHVxL34La+9RfJEo=;
        b=QGTmLXsiPq/GGtJQwvNb5v+C23EpWU8yHJXaXO2e5pm2RYqKiM7z+IUV59Yl8TI16c
         HMtVk68+Dios/iz3YcQBpLeT49XyJ0cPGYN2cWGNIKOqoibRgFXWq+YebBZrRXOG641a
         xyXuHUheJ798VRnDq4ZXVL55N/4VwBqv58OVl6jg1qKT1tCyE8XKjPnbXaSybzyvS5Md
         GsTspbI+WgsHS7EvYucaxyni5I1X/q8OjNcp/oJHhvDYqsqRQ46rdptsdQrJa8wGe6Kf
         KEB4QYYab+lFJaTH7ZV2NgGvTmtQw+/hGmdToso3CaehV4Cbcl4ifF0AoAgFSmIfJI50
         DUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ED04Jjib0S5Ccnml5lJKy3n+5EcEHVxL34La+9RfJEo=;
        b=V0Ibl1llC9j/wBj9EOY8dVK3TMUKQsL90UfQDEE0KGxUz2/Xwvi3CCY7sBzdv3R/Nm
         HvQTKXIV6BYH9drMuzb+4MrHNntuRIHcqtr6vl/i9gOJG4fjpWAe8dZoA8D25Psb9G1K
         C/LZqlxWJD+syO259m4Bso+DZLTVksSc9+Etq/KPHqFlK+Ash+761YAIc2YP2HUCtWRZ
         PU34aVupvchtVaEf3bv4PFglNrHYucLYBszTwmaJqG0P63Nv0lLg3IvlydQOv0ueHwnI
         7q+j5/hMofKLboCRLLfgUq4BKkHOwzYA852yJQ5Kg4uHThyP3COw4jrCIaSV+XYNGc5y
         dKkg==
X-Gm-Message-State: AO0yUKVYq2AB2NwIPR2gfdrPKUo0A2Qf6R3QOT78a9yU9H4hTIgVREth
        e8LM8cmcCynFiYtN/LpNS7VSyA==
X-Google-Smtp-Source: AK7set8vNoag6Ohzb/qiDqbtfdCysN48f8xIqNDhefgtPo2IA+RtuCLEQQyXu4+UbEqn8d5bz3Ibig==
X-Received: by 2002:a05:6000:1376:b0:2bf:d937:3589 with SMTP id q22-20020a056000137600b002bfd9373589mr3933327wrz.14.1675451915996;
        Fri, 03 Feb 2023 11:18:35 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:35 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 06/13] media: i2c: imx290: Use CSI timings as per datasheet
Date:   Fri,  3 Feb 2023 19:18:04 +0000
Message-Id: <20230203191811.947697-7-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 126 +++++++++++++++++++++++++++++++------
 1 file changed, 106 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index a5ea59353a4d..2abe4cdab819 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -190,6 +190,18 @@ struct imx290_mode {
 	u32 data_size;
 };
 
+struct imx290_csi_cfg {
+	u16 repetition;
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
@@ -289,16 +301,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
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
@@ -314,16 +316,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
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
@@ -344,6 +336,58 @@ static const struct imx290_regval imx290_12bit_settings[] = {
 	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
 };
 
+static const struct imx290_csi_cfg imx290_csi_222_75mhz = {
+	/* 222.25MHz or 445.5Mbit/s per lane */
+	.repetition = 0x10,
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
+	.repetition = 0x00,
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
+	.repetition = 0x10,
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
+	.repetition = 0x00,
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
@@ -557,6 +601,42 @@ static int imx290_set_black_level(struct imx290 *imx290,
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
+	imx290_write(imx290, IMX290_REPETITION, csi_cfg->repetition, &ret);
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
@@ -769,6 +849,12 @@ static int imx290_start_streaming(struct imx290 *imx290,
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

