Return-Path: <linux-media+bounces-28412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9290DA67291
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B3117EB29
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E07F20C024;
	Tue, 18 Mar 2025 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BHWVpOHU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120F420B812;
	Tue, 18 Mar 2025 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296960; cv=none; b=TCIgGaSO+3bQRr26biqqzP//QMy5xTVcFKo95ACV3I+V3FmLPV4/lKNQr+zSfLYiOKEz5DOwOLJXmU/AdLU4mDlZRKF04b2+xW1jP7mAHWtXMUhOIZb26pYGntXi29++2t2CG23tH2hNG3iRVJprzLr5Ge4Wu6SBmRRRDGwrxeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296960; c=relaxed/simple;
	bh=Ntfb/leZ76e56lVNlSaDyhMpZbW5jt2+J80bJ1w8X8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7xEJvzS2wr14/M6U081MaWL3fPanzTXH7W4f0M/2ktuXYElpSBzNcRRxI/Mt5ql/9cNMc8WUZ3DnYSiRPKdt3p8w2evisjeEOCQVzDCwNmtItuPp+6oFFNvRcSgtSnrZCC0xU9VIkFeaNPKo0eoEcmx2QGCavw/TxfcJqYOSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BHWVpOHU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71CDA177C;
	Tue, 18 Mar 2025 12:20:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742296840;
	bh=Ntfb/leZ76e56lVNlSaDyhMpZbW5jt2+J80bJ1w8X8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BHWVpOHUCIPLKddirtVK8ffRZlnsA2HQSSsPAUIxp9STmFzeD+iz78DTvNdTvOdUQ
	 TNuE62f5Q5uOSIE5sjKyStfc/ZyqqBX6CnwOeesSlxGgdpTsRnv/tDm56qKrnI56bC
	 Xd0tdb8dj4Id4pGp5K9MuD1hEU0YBnXD2JQWWGjM=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 18 Mar 2025 12:21:24 +0100
Subject: [PATCH v4 5/7] media: vsp1: rwpf: Initialize image formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-v4h-iif-v4-5-10ed4c41c195@ideasonboard.com>
References: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
In-Reply-To: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=7618;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Ntfb/leZ76e56lVNlSaDyhMpZbW5jt2+J80bJ1w8X8I=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2VdqE5cSLh2PN11+ttJ9O4eXh7kXFdJ7on9rw
 Iw0+s0sRVyJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9lXagAKCRByNAaPFqFW
 PIgXD/9VMfQLK1h7UiJExO+d4lFqaYoeSaoiLpj5UDvXZXzfRg50myCr3rKKiAPjaIpoqkqxfcz
 IPSRm8iT24z/f/m3Kj97zNXJjcciw/h+qAfHO9FCoygmceNPLmNI66muVpUBeZJ0x5S2wkbSHEW
 LPDdEhRSsai/+yHG2oZht3eDZbXP2RY4McRLBUFBkB11HQYY4sS88DcRWPoD3rTzAGF/m1a5Ndo
 9XzJbunMX5ts/DdnByaztXmkAaaSYS/6EZ60nXjrl3A0Mi+GNLe1mm59jYGuwrW2zeV+KaHWABQ
 BjgEMfIV/fwVnWryAY6SdQ6dAocJ8nZ6MYoc9XomZm7XSUyRwqiWInma0rTBh0Z5vEhR3/b+zyz
 FSJi3a5y6aSBWsrraseuvaOdfN9fEeCFekE5ZtN9De2Yk6u2lu0Uopr+d4U1K5Ac4xZvJDW4m+G
 yTHmagNcO8snmh/9nxtE53Lq6wq62wH5AWXzqDM8NIUpLzpfVFN22yeOCM4k4W6hElFSxUrSo2m
 T7Q/XHKWGzbSC5F7IDvVMTsreXDSnnJ04h+U122it8ygQE3ysyr0VtWA+cwOSBk6yJ57331b55J
 Tv3UHXnwRvcWSEFsQ6vQ2cXSjqE17Gyq4rPNLxgR0SNn+Pm0NNWnLYQsOoJXw5Bl18YsjR4C648
 yFbGoUZN7v2wHFw==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

With the forthcoming support for VSPX the r/wpf unit will be used
to perform memory access on the behalf of the ISP units.

Prepare to support reading from external memory images in RAW Bayer
format and ISP configuration parameters by expanding the list
of supported media bus codes.

Store the list of valid mbus code in the rwpf device and initialize it
in the new vsp1_rwpf_init_formats() function, called by RPFs and WFPs at
entity creation time.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v2->v3:
  - Introduce vsp1_rwpf_init_formats()
  - Store the list of mbus codes at init time instead of computing it
---
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  |  7 +++
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 79 +++++++++++++++++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  4 ++
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c  |  7 +++
 4 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 5c8b3ba1bd3c2c7b9289f05c9c2578e9717c23ff..056491286577cc8e9e7a6bd096f1107da6009ea7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -400,6 +400,13 @@ struct vsp1_rwpf *vsp1_rpf_create(struct vsp1_device *vsp1, unsigned int index)
 	rpf->entity.type = VSP1_ENTITY_RPF;
 	rpf->entity.index = index;
 
+	ret = vsp1_rwpf_init_formats(vsp1, rpf);
+	if (ret < 0) {
+		dev_err(vsp1->dev, "rpf%u: failed to initialize formats\n",
+			index);
+		return ERR_PTR(ret);
+	}
+
 	sprintf(name, "rpf.%u", index);
 	ret = vsp1_entity_init(vsp1, &rpf->entity, name, 2, &vsp1_rwpf_subdev_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 93b0ed5fd0da0c6a182dbbfe1e54eb8cfd66c493..f1d27300ecf3f0f82550fb6aae1d37de33805ca1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -16,12 +16,47 @@
 #define RWPF_MIN_WIDTH				1
 #define RWPF_MIN_HEIGHT				1
 
+struct vsp1_rwpf_codes {
+	const u32 *codes;
+	unsigned int num_codes;
+};
+
 static const u32 rwpf_mbus_codes[] = {
 	MEDIA_BUS_FMT_ARGB8888_1X32,
 	MEDIA_BUS_FMT_AHSV8888_1X32,
 	MEDIA_BUS_FMT_AYUV8_1X32,
 };
 
+static const struct vsp1_rwpf_codes rwpf_codes = {
+	.codes = rwpf_mbus_codes,
+	.num_codes = ARRAY_SIZE(rwpf_mbus_codes),
+};
+
+static const u32 vspx_rpf0_mbus_codes[] = {
+	MEDIA_BUS_FMT_Y8_1X8,
+	MEDIA_BUS_FMT_Y10_1X10,
+	MEDIA_BUS_FMT_Y12_1X12,
+	MEDIA_BUS_FMT_Y16_1X16,
+	MEDIA_BUS_FMT_METADATA_FIXED
+};
+
+static const struct vsp1_rwpf_codes vspx_rpf0_codes = {
+	.codes = vspx_rpf0_mbus_codes,
+	.num_codes = ARRAY_SIZE(vspx_rpf0_mbus_codes),
+};
+
+static const u32 vspx_rpf1_mbus_codes[] = {
+	MEDIA_BUS_FMT_Y8_1X8,
+	MEDIA_BUS_FMT_Y10_1X10,
+	MEDIA_BUS_FMT_Y12_1X12,
+	MEDIA_BUS_FMT_Y16_1X16,
+};
+
+static const struct vsp1_rwpf_codes vspx_rpf1_codes = {
+	.codes = vspx_rpf1_mbus_codes,
+	.num_codes = ARRAY_SIZE(vspx_rpf1_mbus_codes),
+};
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdevice Operations
  */
@@ -30,10 +65,12 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= ARRAY_SIZE(rwpf_mbus_codes))
+	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
+
+	if (code->index >= rwpf->mbus_codes->num_codes)
 		return -EINVAL;
 
-	code->code = rwpf_mbus_codes[code->index];
+	code->code = rwpf->mbus_codes->codes[code->index];
 
 	return 0;
 }
@@ -69,12 +106,12 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	}
 
 	/* Default to YUV if the requested format is not supported. */
-	for (i = 0; i < ARRAY_SIZE(rwpf_mbus_codes); ++i) {
-		if (fmt->format.code == rwpf_mbus_codes[i])
+	for (i = 0; i < rwpf->mbus_codes->num_codes; ++i) {
+		if (fmt->format.code == rwpf->mbus_codes->codes[i])
 			break;
 	}
-	if (i == ARRAY_SIZE(rwpf_mbus_codes))
-		fmt->format.code = MEDIA_BUS_FMT_AYUV8_1X32;
+	if (i == rwpf->mbus_codes->num_codes)
+		fmt->format.code = rwpf->mbus_codes->codes[0];
 
 	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
@@ -267,8 +304,38 @@ static const struct v4l2_ctrl_ops vsp1_rwpf_ctrl_ops = {
 	.s_ctrl = vsp1_rwpf_s_ctrl,
 };
 
+
+int vsp1_rwpf_init_formats(struct vsp1_device *vsp1, struct vsp1_rwpf *rwpf)
+{
+	/* Only VSPX and RPF support reading Bayer data. */
+	if (!vsp1_feature(vsp1, VSP1_HAS_IIF) ||
+	    rwpf->entity.type != VSP1_ENTITY_RPF) {
+		rwpf->mbus_codes = &rwpf_codes;
+		return 0;
+	}
+
+	/*
+	 * VSPX only features RPF0 and RPF1. RPF0 supports reading ISP ConfigDMA
+	 * and Bayer data, RPF1 supports reading Bayer data only.
+	 */
+	switch (rwpf->entity.index) {
+	case 0:
+		rwpf->mbus_codes = &vspx_rpf0_codes;
+		break;
+	case 1:
+		rwpf->mbus_codes = &vspx_rpf1_codes;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols)
 {
+	/* Initialize controls. */
+
 	v4l2_ctrl_handler_init(&rwpf->ctrls, ncontrols + 1);
 	v4l2_ctrl_new_std(&rwpf->ctrls, &vsp1_rwpf_ctrl_ops,
 			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
index 5ac9f0a6fafcee955f32d768aafe8a87516908ae..64feb4742494f6d6a34abe4a21c89b64cfc0a6ca 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
@@ -30,6 +30,7 @@ struct vsp1_rwpf_memory {
 	dma_addr_t addr[3];
 };
 
+struct vsp1_rwpf_codes;
 struct vsp1_rwpf {
 	struct vsp1_entity entity;
 	struct v4l2_ctrl_handler ctrls;
@@ -39,6 +40,8 @@ struct vsp1_rwpf {
 	unsigned int max_width;
 	unsigned int max_height;
 
+	const struct vsp1_rwpf_codes *mbus_codes;
+
 	struct v4l2_pix_format_mplane format;
 	const struct vsp1_format_info *fmtinfo;
 	unsigned int brx_input;
@@ -81,6 +84,7 @@ struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index);
 
 void vsp1_wpf_stop(struct vsp1_rwpf *wpf);
 
+int vsp1_rwpf_init_formats(struct vsp1_device *vsp1, struct vsp1_rwpf *rwpf);
 int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols);
 
 extern const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index da651a882bbb7e4d58f2dfea9dcea60a41f4f79c..a32e4b3527db41e7fac859ad8e13670141c1ef04 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -548,6 +548,13 @@ struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index)
 	wpf->entity.type = VSP1_ENTITY_WPF;
 	wpf->entity.index = index;
 
+	ret = vsp1_rwpf_init_formats(vsp1, wpf);
+	if (ret < 0) {
+		dev_err(vsp1->dev, "wpf%u: failed to initialize formats\n",
+			index);
+		return ERR_PTR(ret);
+	}
+
 	sprintf(name, "wpf.%u", index);
 	ret = vsp1_entity_init(vsp1, &wpf->entity, name, 2, &vsp1_rwpf_subdev_ops,
 			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);

-- 
2.48.1


