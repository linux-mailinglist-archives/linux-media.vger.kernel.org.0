Return-Path: <linux-media+bounces-28476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD7A68BBA
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B72A416D76B
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 11:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399DD256C74;
	Wed, 19 Mar 2025 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jwa60ile"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E822561C0;
	Wed, 19 Mar 2025 11:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383715; cv=none; b=L7jOtXw5nIE7D8qi8s843KosdMgnE7lkCepgFYtsiQiFhZamlJpJhyQqni+5+Eh9YmIECvoNlQEsAekoHQdW2zMHedL5XIgkS+sWd6cNkeVgQ5K2NE3hfDFvoC3N4ycN64B5GOL7g6CbIDmfTZ8B8bRCEgFjFQQSFLlmk3HNLM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383715; c=relaxed/simple;
	bh=R9QKAaXFfAXVA8Tx664fwYPZrf6MQujcerzG528pv1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwVxx7n82ENvwidLU597/FdcZNXB7Cm1BcTL8nD0kCbxJ3z+WVhWPmxJYJqJyVvDTEZy73HtwWcJHuN+zsNc3a7a5hhX6Sh/495iX9VKDzAaKAVwkZrRGDYtRIUivi5OjmnC6lMOKfqEDNUWQxX9sNGlcNhkrPiwZ+SYNtEO5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jwa60ile; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34BAC1648;
	Wed, 19 Mar 2025 12:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742383604;
	bh=R9QKAaXFfAXVA8Tx664fwYPZrf6MQujcerzG528pv1E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jwa60ilePcS7kKOBet5n27/K0b3rNELqz687tpfNca9tOXe0kK7Ir5uHC/72+4aVB
	 9mgYO7axNnqPfUCA+22pNuHRVvoTED47d6fcjwp1EQ/v4dIuK2KblAXwt/retIc+G1
	 noWdqsMgkLji1IqrX8W1V2WhQNMxZkgeT1+jfc1U=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Wed, 19 Mar 2025 12:28:18 +0100
Subject: [PATCH v5 5/7] media: vsp1: rwpf: Initialize image formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250319-v4h-iif-v5-5-0a10456d792c@ideasonboard.com>
References: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
In-Reply-To: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=7652;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=R9QKAaXFfAXVA8Tx664fwYPZrf6MQujcerzG528pv1E=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2qpX/A6M/v6FiWTlOP5nlRPK5n4hinTTyWj98
 Z1CYhgNTpyJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9qqVwAKCRByNAaPFqFW
 PMZXD/461Kvcw9OsBj8tsqdPUG4IgYSHeXjJG407Vbbo/+9pWIR9dZ945kKlDEuHQsCWeFI03UR
 5g3Z80m+jxFOGBir3NBwHOg/xXkysqrzC60eGxYyWj+U5tFJg8RBoPKA/WN+AptJgf0khw3k0AQ
 /u4uFpt7yis/9fwbnQB5GUzxwHTjG+bKrasj8luv/a9DdQlcYkYXnD47WY0nOv0VfGrsFZ+t7Zr
 RiQwT43E5ff5GTvBAxEL5NglOdu/QxdufEuT0KVjn1Mcd6dfby9vUFzXOwn7d3rGH2pVMmQn6HR
 QegupRyvrP2FF22r7htuKmzbCgP2s6WT6gL1G3O5Kv+QFTfNjltgIvWN9Biy0nXBrkmqQcLCyfK
 rVzDrO44EcI5d8KpiEGGWisrBc0AiiEDRWlwPrKV/+iEQWjnCLC9f5/pesS7iq7w/ojDKcstG7u
 9jVGcnKRew3X3OLN+anG2Sr1ahFV6LEstf9QwFtfUlKCzbhjSvKfee+f7V53DCr2gAAgne8AKgk
 FOhWJxnVWgW6JFq5/2AAD90ZMocU2HKI4Jn/QcW6DPnEV8M3c8Rdl8qcS/2C81ma/zA3RcbYp0u
 1AOyORfog4L+fziykCLOL+HyuF22G9HazM9F/RMPbsWa17RPW3BbQdgQcE9YFU5LSqbr+Y9kNGT
 +mnJFKMfi+EFz3g==
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
v4->v5:
  - Drop double empty line
v2->v3:
  - Introduce vsp1_rwpf_init_formats()
  - Store the list of mbus codes at init time instead of computing it
---
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  |  7 +++
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 78 +++++++++++++++++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  4 ++
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c  |  7 +++
 4 files changed, 90 insertions(+), 6 deletions(-)

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
index 93b0ed5fd0da0c6a182dbbfe1e54eb8cfd66c493..91d70886e64d52ec007126b7c16699075d8a97b5 100644
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
 
@@ -267,8 +304,37 @@ static const struct v4l2_ctrl_ops vsp1_rwpf_ctrl_ops = {
 	.s_ctrl = vsp1_rwpf_s_ctrl,
 };
 
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


