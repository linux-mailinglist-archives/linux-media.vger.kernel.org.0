Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C921B5F8D3A
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 20:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiJIShN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 14:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiJIShJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 14:37:09 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5868025C64
        for <linux-media@vger.kernel.org>; Sun,  9 Oct 2022 11:37:07 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id a13so13317643edj.0
        for <linux-media@vger.kernel.org>; Sun, 09 Oct 2022 11:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj0Wfwy57ePpPrUHPKsXOZY4zPaEoycK+hSSdAHSG9Y=;
        b=r7VQPz6lVYietClII1zBmMvguenaxKiGqGAH8OJtpyWztgcUYZacNOLpT0rGbIb1ks
         UmX/UqUzbLZPYi9/MLD1oInyYljzD6s3zNKPXWWUwP/an6AmNb9MR4oyceWD51Qdp/L+
         I1hYE/UGZJX6wR7IEZsyzffnSF93179e/vXfhLNnu4P4ARm2/gjiIogqjbSt0jdw6NOp
         o1BzjLAoEDJvENXPRAFEO735xBt1YlnOhRgH1Iut8SbuVs8vH/Y4KpDA1JSlRvWoKMcD
         iR7mRP7aYMFMrlcLDJOpX7vrQa1jTiCaadru18YPS2O3GmzqCqVwRBrX8Y295+2Ehl00
         Eaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nj0Wfwy57ePpPrUHPKsXOZY4zPaEoycK+hSSdAHSG9Y=;
        b=Ee/aEvyp5a2E8R2wjW2cOy6F8Po0GyO1+IkpMU2K1J56bufmznlhi6iNljT76LpEi0
         vbF8REkRqb2HocLAc8aEEI3FeHi13B7JlNN+yflKLcy+FsU3WJ4NkhTeakgjBKaRiuLY
         Jlx9QmXPtRa38pagdaaw9FAlV3DJ9wT7LK5zty1FC/dTxvK5BeX5hRUTblLCaG5BW2SI
         x7F3mr0jiBrS8aRo/0zrw4M6wG4GLdTYeQmCUQQPwDii+dwTiOdMb9b096G3VU5HDySl
         FzHl4cBrMWumjpwT0DJuY/syQTS58tRTyvVdTQoEmAt2tKfEm0c+VsQRAMDzzddTaqg4
         aiAQ==
X-Gm-Message-State: ACrzQf3eGrNdZmb89bZpLuGabWRYK6IfQHp3xrSsL8MbF98QZOdPEz4p
        AnGFy9DJqmQ3TrkBdnTPFfIa2w==
X-Google-Smtp-Source: AMsMyM5iRj06WJuGV5rSB2uASdv2+t8V4IIgp0k/thNjxm31entGR9/up3eqSrM/S7mzO0KGaA5OBQ==
X-Received: by 2002:a05:6402:27c9:b0:45b:c963:2586 with SMTP id c9-20020a05640227c900b0045bc9632586mr7730858ede.61.1665340625703;
        Sun, 09 Oct 2022 11:37:05 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5370.dip0.t-ipconnect.de. [84.172.83.112])
        by smtp.googlemail.com with ESMTPSA id o14-20020a50fd8e000000b00459148fbb3csm5610050edt.86.2022.10.09.11.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 11:37:05 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] media: rcar-vin: Store scaler in a function pointer
Date:   Sun,  9 Oct 2022 20:35:50 +0200
Message-Id: <20221009183551.1664631-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221009183551.1664631-1-niklas.soderlund+renesas@ragnatech.se>
References: <20221009183551.1664631-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The scaler implementation is different between the VIN generations, and
not all SoCs have a scaler. Currently only Gen2 scalers are supported.

Prepare to add support for more scalers by storing the setup in a
function pointer initialized at probe time. While at it move call site
to after, instead of before, the generic capture setup, this have no
effect on the Gen2 scaler but will be leveraged by the Gen3 scaler.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 13 +++++--
 .../platform/renesas/rcar-vin/rcar-dma.c      | 34 +++++++++++++------
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  6 ++++
 .../platform/renesas/rcar-vin/rcar-vin.h      |  6 ++++
 4 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 968a74234e92..c70c29a82ce1 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1132,6 +1132,7 @@ static const struct rvin_info rcar_info_h1 = {
 	.use_mc = false,
 	.max_width = 2048,
 	.max_height = 2048,
+	.scaler = rvin_scaler_gen2,
 };
 
 static const struct rvin_info rcar_info_m1 = {
@@ -1139,6 +1140,7 @@ static const struct rvin_info rcar_info_m1 = {
 	.use_mc = false,
 	.max_width = 2048,
 	.max_height = 2048,
+	.scaler = rvin_scaler_gen2,
 };
 
 static const struct rvin_info rcar_info_gen2 = {
@@ -1146,6 +1148,7 @@ static const struct rvin_info rcar_info_gen2 = {
 	.use_mc = false,
 	.max_width = 2048,
 	.max_height = 2048,
+	.scaler = rvin_scaler_gen2,
 };
 
 static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
@@ -1409,13 +1412,17 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
-	if (vin->info->use_isp)
+	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
-	else if (vin->info->use_mc)
+	} else if (vin->info->use_mc) {
 		ret = rvin_csi2_init(vin);
-	else
+	} else {
 		ret = rvin_parallel_init(vin);
 
+		if (vin->info->scaler)
+			vin->scaler = vin->info->scaler;
+	}
+
 	if (ret) {
 		rvin_dma_unregister(vin);
 		return ret;
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 8d37fbdc266a..0efd98998acb 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -160,9 +160,17 @@ static u32 rvin_read(struct rvin_dev *vin, u32 offset)
 }
 
 /* -----------------------------------------------------------------------------
- * Crop and Scaling Gen2
+ * Crop and Scaling
  */
 
+static bool rvin_scaler_needed(const struct rvin_dev *vin)
+{
+	return !(vin->crop.width == vin->format.width &&
+		 vin->compose.width == vin->format.width &&
+		 vin->crop.height == vin->format.height &&
+		 vin->compose.height == vin->format.height);
+}
+
 struct vin_coeff {
 	unsigned short xs_value;
 	u32 coeff_set[24];
@@ -535,7 +543,7 @@ static void rvin_set_coeff(struct rvin_dev *vin, unsigned short xs)
 	rvin_write(vin, p_set->coeff_set[23], VNC8C_REG);
 }
 
-static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
+void rvin_scaler_gen2(struct rvin_dev *vin)
 {
 	unsigned int crop_height;
 	u32 xs, ys;
@@ -594,9 +602,8 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
 	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
 
-	/* TODO: Add support for the UDS scaler. */
-	if (vin->info->model != RCAR_GEN3)
-		rvin_crop_scale_comp_gen2(vin);
+	if (vin->scaler)
+		vin->scaler(vin);
 
 	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
 	stride = vin->format.bytesperline / fmt->bpp;
@@ -984,12 +991,12 @@ static int rvin_capture_start(struct rvin_dev *vin)
 	for (slot = 0; slot < HW_BUFFER_NUM; slot++)
 		rvin_fill_hw_slot(vin, slot);
 
-	rvin_crop_scale_comp(vin);
-
 	ret = rvin_setup(vin);
 	if (ret)
 		return ret;
 
+	rvin_crop_scale_comp(vin);
+
 	vin_dbg(vin, "Starting to capture\n");
 
 	/* Continuous Frame Capture Mode */
@@ -1234,9 +1241,16 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 		return -EPIPE;
 	}
 
-	if (fmt.format.width != vin->format.width ||
-	    fmt.format.height != vin->format.height ||
-	    fmt.format.code != vin->mbus_code)
+	if (rvin_scaler_needed(vin)) {
+		if (!vin->scaler)
+			return -EPIPE;
+	} else {
+		if (fmt.format.width != vin->format.width ||
+		    fmt.format.height != vin->format.height)
+			return -EPIPE;
+	}
+
+	if (fmt.format.code != vin->mbus_code)
 		return -EPIPE;
 
 	return 0;
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index a0b398aa2596..07564e05ed8c 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -477,6 +477,9 @@ static int rvin_g_selection(struct file *file, void *fh,
 	struct rvin_dev *vin = video_drvdata(file);
 	int ret;
 
+	if (!vin->scaler)
+		return -ENOIOCTLCMD;
+
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
@@ -520,6 +523,9 @@ static int rvin_s_selection(struct file *file, void *fh,
 	};
 	int ret;
 
+	if (!vin->scaler)
+		return -ENOIOCTLCMD;
+
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 469c4aaf90e2..334c327889a0 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -31,6 +31,7 @@
 /* Max number on VIN instances that can be in a system */
 #define RCAR_VIN_NUM 32
 
+struct rvin_dev;
 struct rvin_group;
 
 enum model_id {
@@ -155,6 +156,7 @@ struct rvin_group_route {
  * @max_height:		max input height the VIN supports
  * @routes:		list of possible routes from the CSI-2 recivers to
  *			all VINs. The list mush be NULL terminated.
+ * @scaler:		Optional scaler
  */
 struct rvin_info {
 	enum model_id model;
@@ -165,6 +167,7 @@ struct rvin_info {
 	unsigned int max_width;
 	unsigned int max_height;
 	const struct rvin_group_route *routes;
+	void (*scaler)(struct rvin_dev *vin);
 };
 
 /**
@@ -203,6 +206,7 @@ struct rvin_info {
  *
  * @crop:		active cropping
  * @compose:		active composing
+ * @scaler:		Optional scaler
  * @std:		active video standard of the video source
  *
  * @alpha:		Alpha component to fill in for supported pixel formats
@@ -246,6 +250,7 @@ struct rvin_dev {
 
 	struct v4l2_rect crop;
 	struct v4l2_rect compose;
+	void (*scaler)(struct rvin_dev *vin);
 	v4l2_std_id std;
 
 	unsigned int alpha;
@@ -302,6 +307,7 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
 
 
 /* Cropping, composing and scaling */
+void rvin_scaler_gen2(struct rvin_dev *vin);
 void rvin_crop_scale_comp(struct rvin_dev *vin);
 
 int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel);
-- 
2.37.3

