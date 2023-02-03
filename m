Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE39068A2CE
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbjBCTSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbjBCTSk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:40 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B2311F
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:38 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id h12so5528934wrv.10
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0FDKkzy1dQbNBgFR6ybwu/xD+gyy+MskA28TAJg1Pw=;
        b=nBm5eeY+jhsxdvNMVe+p1BEUZ2TWTB3s5usixA5b2E+WH5BqtncNfIzhBwd9FJhNM6
         dc8WTNTbnGue1oB/G6SDuG6tRGWZ8uheA8SinnLtnZTQLGq3+2fioN0bX1aEDXYCmOq0
         4HDqNj5snUSKA9GzPT+91u6z1XhKj7hwJbxCXc7Nh2FI2zsLAUNeMskT9Wtoa+iCxPG+
         hIMkZCMYB/EXqv/cvAwJ4hx26qzxA7j+PctaCHvwtjJhILdUZM2TqQuWBXkLBid/PMvy
         HqWGZrq8ShkfFItYCzbqEXRAQv9SDzZbt5URfeh+u2xqQlXgkPzSgaD/xDDh5L5lcyiW
         VT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0FDKkzy1dQbNBgFR6ybwu/xD+gyy+MskA28TAJg1Pw=;
        b=Sq8xArxsa2qC9I9kqwczao8NyikLUJ5hzA+RFDj2y/LfM4D90L2H9eanDHAkYN2Wsp
         zpPTcYedHeajde4Ake4mYVkQgI4hbuCh/jPQhf/WX/+HcYNtrl+NDaYOMr5iO3Fo0xsx
         CRd0Y7DzESVdhoNyXumqOZcbFuVi9yC98BEliZKGSlxH+MVaxWjSD3CCdpG93VC+lbxJ
         8qdW7ZeMw7hrWaK8fnOFsn6bmkFPSj86mPVdwKopr7PDFopVLbK7ECZ6R0NNpJoh106U
         QXouq2bpiXZFlqN5dVBDbL5gyF2W1LiroiWpvgMVsdJ8TXqGrrXB1TMVu+d3xmUasSPu
         DEUg==
X-Gm-Message-State: AO0yUKWrneooH5hAFgGMbxQYr/kDWHz1PAQB7eXRnvvORNGiW1c0f+Zh
        xYab6ELvJdb98NJpIdaxk41Ngg==
X-Google-Smtp-Source: AK7set9EhzKi1LCPAvxQModCPD1z/kWdy54+P7O2eqbMKChilN2YGvTPSgFP+Z+jRBcUKrRbaWtm3w==
X-Received: by 2002:adf:fe86:0:b0:2bf:f6b7:7a63 with SMTP id l6-20020adffe86000000b002bff6b77a63mr12285212wrr.0.1675451917494;
        Fri, 03 Feb 2023 11:18:37 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:37 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 08/13] media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
Date:   Fri,  3 Feb 2023 19:18:06 +0000
Message-Id: <20230203191811.947697-9-dave.stevenson@raspberrypi.com>
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

The driver exposed V4L2_CID_VBLANK as a read only control to allow
for exposure calculations and determination of the frame rate.

Convert to a read/write control so that the frame rate can be
controlled.
V4L2_CID_VBLANK also sets the limits for the exposure control,
therefore exposure ranges have to be updated when vblank changes
(either via s_ctrl, or via changing mode).

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 58 +++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 74eafed15613..403bd7de875e 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -46,6 +46,7 @@
 #define IMX290_BLKLEVEL					IMX290_REG_16BIT(0x300a)
 #define IMX290_GAIN					IMX290_REG_8BIT(0x3014)
 #define IMX290_VMAX					IMX290_REG_24BIT(0x3018)
+#define IMX290_VMAX_MAX					0x3ffff
 #define IMX290_HMAX					IMX290_REG_16BIT(0x301c)
 #define IMX290_HMAX_MAX					0xffff
 #define IMX290_SHS1					IMX290_REG_24BIT(0x3020)
@@ -106,6 +107,9 @@
 #define IMX290_PGCTRL_THRU				BIT(1)
 #define IMX290_PGCTRL_MODE(n)				((n) << 4)
 
+/* Number of lines by which exposure must be less than VMAX) */
+#define IMX290_EXPOSURE_OFFSET				2
+
 #define IMX290_VMAX_DEFAULT				1125
 
 #define IMX290_PIXEL_RATE				148500000
@@ -222,6 +226,7 @@ struct imx290 {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
 };
 
 static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
@@ -235,7 +240,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
 
 static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
-	{ IMX290_VMAX, IMX290_VMAX_DEFAULT },
 	{ IMX290_EXTCK_FREQ, 0x2520 },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
@@ -659,6 +663,16 @@ static int imx290_setup_format(struct imx290 *imx290,
 /* ----------------------------------------------------------------------------
  * Controls
  */
+static void imx290_exposure_update(struct imx290 *imx290,
+				   const struct imx290_mode *mode)
+{
+	unsigned int exposure_max;
+
+	exposure_max = imx290->vblank->val + mode->height -
+		       IMX290_EXPOSURE_OFFSET;
+	__v4l2_ctrl_modify_range(imx290->exposure, 1, exposure_max, 1,
+				 exposure_max);
+}
 
 static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 {
@@ -666,7 +680,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 					     struct imx290, ctrls);
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	int ret = 0;
+	int ret = 0, vmax;
 
 	/*
 	 * Return immediately for controls that don't need to be applied to the
@@ -675,6 +689,11 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
 		return 0;
 
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Changing vblank changes the allowed range for exposure. */
+		imx290_exposure_update(imx290, imx290->current_mode);
+	}
+
 	/* V4L2 controls values will be applied only when power is already up */
 	if (!pm_runtime_get_if_in_use(imx290->dev))
 		return 0;
@@ -687,9 +706,23 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
 		break;
 
+	case V4L2_CID_VBLANK:
+		ret = imx290_write(imx290, IMX290_VMAX,
+				   ctrl->val + imx290->current_mode->height,
+				   NULL);
+		/*
+		 * Due to the way that exposure is programmed in this sensor in
+		 * relation to VMAX, we have to reprogramme it whenever VMAX is
+		 * changed.
+		 * Update ctrl so that the V4L2_CID_EXPOSURE case can refer to
+		 * it.
+		 */
+		ctrl = imx290->exposure;
+		fallthrough;
 	case V4L2_CID_EXPOSURE:
+		vmax = imx290->vblank->val + imx290->current_mode->height;
 		ret = imx290_write(imx290, IMX290_SHS1,
-				   IMX290_VMAX_DEFAULT - ctrl->val - 1, NULL);
+				   vmax - ctrl->val - 1, NULL);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -746,13 +779,15 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 {
 	unsigned int hblank_min = mode->hmax_min - mode->width;
 	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
-	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
+	unsigned int vblank_min = IMX290_VMAX_DEFAULT - mode->height;
+	unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 
 	__v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
 				 hblank_min);
-	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
+	__v4l2_ctrl_modify_range(imx290->vblank, vblank_min, vblank_max, 1,
+				 vblank_min);
 }
 
 static int imx290_ctrl_init(struct imx290 *imx290)
@@ -782,9 +817,13 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
 
-	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
-			  IMX290_VMAX_DEFAULT - 2);
+	/*
+	 * Correct range will be determined through imx290_ctrl_update setting
+	 * V4L2_CID_VBLANK.
+	 */
+	imx290->exposure = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					     V4L2_CID_EXPOSURE, 1, 65535, 1,
+					     65535);
 
 	/*
 	 * Set the link frequency, pixel rate, horizontal blanking and vertical
@@ -816,8 +855,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 
 	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					   V4L2_CID_VBLANK, 1, 1, 1, 1);
-	if (imx290->vblank)
-		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
 					&props);
@@ -1003,6 +1040,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 		imx290->current_mode = mode;
 
 		imx290_ctrl_update(imx290, &fmt->format, mode);
+		imx290_exposure_update(imx290, mode);
 	}
 
 	*format = fmt->format;
-- 
2.34.1

