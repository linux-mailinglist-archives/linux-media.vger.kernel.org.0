Return-Path: <linux-media+bounces-43860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B001BC258B
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C21B19A4515
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D702EA490;
	Tue,  7 Oct 2025 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZAQCMMou"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A918C21D58B;
	Tue,  7 Oct 2025 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860762; cv=none; b=C6seALin1NweE/6ZGJWlRqgwPTSv7/zyq7Q0+7VafExjcq9gAMUJWOemJvZWbSV9xlbW9+3ATWDcRaQ9wXqaY8A7StAZNWdfx/5qefZlkfGkJGQNsM1QYVyi20EOopZZ7N3ysQxyX1ifP+ecFuHw7eH/23Tw/uJ2W7UVJUsVl6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860762; c=relaxed/simple;
	bh=CMSnpKWFm8f6XNXGl5yxfM39oQyAVrbdQCzRsiilxxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtH6hWiIt8IIRUhRhlAV4LF5bxekU0QikMlXJAMWjkKy01xe7Tm9SxdzkJdLXDY3l83/dO5eocHy6cOar5t10nFHotDTfAfMUU+1KyhcL+dd4LuK+CxiSmMQqTlxWQV8KbERJBMAgNJdv0vxKsd2ywmaumsQYZNlaGE6+MqOlLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZAQCMMou; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74FD2EBA;
	Tue,  7 Oct 2025 20:10:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759860657;
	bh=CMSnpKWFm8f6XNXGl5yxfM39oQyAVrbdQCzRsiilxxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZAQCMMoumIqaa0eEy06lC3j0q9xyq7A7NqBgu0hL9OyZMxdANWiMz1inSmugkstUy
	 Vva2VfrRSp2+1ICVI4Kfghw8bRYtIvbVnQMiUl4dbm/laYNnR+yQTIYIPOzIkbgoKL
	 ULxx66FNnBtA9efzwbwymngLymFASnjp9l9M0p5M=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 07 Oct 2025 20:12:15 +0200
Subject: [PATCH v6 6/8] media: rkisp1: Use v4l2-isp for validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-extensible-parameters-validation-v6-6-5f719d9f39e5@ideasonboard.com>
References: <20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com>
In-Reply-To: <20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12850;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=CMSnpKWFm8f6XNXGl5yxfM39oQyAVrbdQCzRsiilxxg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo5VgHH/oMp1C7/8X/Ms0vwkM77ZZ/iX4ZUsw/0
 NCl4zpm+O6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaOVYBwAKCRByNAaPFqFW
 PC3LEACn7xuhDwTCrhW+XxCaUFEPQ7Tyq8neeaQ9/IF6huMiSKT0FA7VFXSBjdoLjpRazE6le3I
 TvgFJUJzl+CxxMQzZzIrF+j5oJG5TEUMO+MRRzmxQYOwoACs2jGcYZBBYwpQXS6DWpmwhlWYStK
 OfIwj7LnUCYtvCVYS3YL1zMwcdn/q9pEL+4fbrtW2iYKvkGd5T5Dz32MakB0bO6MqnDzOy53JXn
 vnoim0ilTk2CqGIkqZfWkpkTyNTdsCr02O74Ul7LNZ9XAKOkK0n3DHrlkOVE3iDSTahHxhzeDU7
 OcifPCz8UjEOjMA8sSNB3iIMC3AnigqGYCx795kLkHcivxGHaGvKJDnIfm10J9FW/dY2xJcH5Tu
 bHJhbsOZKHqqfY5qawrLBQE9TsraPnDyOsrAAHIV8O4Kq6XQoStpkRVyr79RhYkP2ev2nc0tg8C
 +z6paJpti7yAXS7sfINzMJOAzmbWUzDQYpvDHrLvxlqc/a3bZqEPpiP0rm1zITpgqVOqDurZm+9
 eZmQdbDmt5DoECUF1p6uq6RajCYpOdN8fedVKd0SjiRp5W0KGsnlu0bR2nRDQn3WrtZ9tqrdjEy
 b1jLXLCtMYgxbdzElKNdNfH7AW5B8fvOJWe1nJpZgWso17vZ/cWbo2xPFPWK6kdzvC2o2FdEhzE
 ZHCeW6CLEFjUQEA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Convert rkisp1-params.c to use the helpers defined in v4l2-isp.h
to perform validation of a ISP parameters buffer.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/Kconfig     |   1 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 183 +++++++++------------
 2 files changed, 81 insertions(+), 103 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
index 731c9acbf6efa33188617204d441fb0ea59adebc..f53eb1f3f3e7003d8e02c9236aeabb5ae8844f7b 100644
--- a/drivers/media/platform/rockchip/rkisp1/Kconfig
+++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
@@ -10,6 +10,7 @@ config VIDEO_ROCKCHIP_ISP1
 	select VIDEOBUF2_VMALLOC
 	select V4L2_FWNODE
 	select GENERIC_PHY_MIPI_DPHY
+	select V4L2_ISP
 	default n
 	help
 	  Enable this to support the Image Signal Processing (ISP) module
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index f1585f8fa0f478304f74317fd9dd09199c94ec82..7946adb1c7f322042d39a269715a674ce347794f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -12,6 +12,7 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>	/* for ISP params */
 
@@ -2097,122 +2098,166 @@ typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
 			     const union rkisp1_ext_params_config *config);
 
 static const struct rkisp1_ext_params_handler {
-	size_t size;
 	rkisp1_block_handler handler;
 	unsigned int group;
 	unsigned int features;
 } rkisp1_ext_params_handlers[] = {
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
-		.size		= sizeof(struct rkisp1_ext_params_bls_config),
 		.handler	= rkisp1_ext_params_bls,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 		.features       = RKISP1_FEATURE_BLS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
-		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
 		.handler	= rkisp1_ext_params_dpcc,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
-		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
 		.handler	= rkisp1_ext_params_sdg,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN] = {
-		.size		= sizeof(struct rkisp1_ext_params_awb_gain_config),
 		.handler	= rkisp1_ext_params_awbg,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
-		.size		= sizeof(struct rkisp1_ext_params_flt_config),
 		.handler	= rkisp1_ext_params_flt,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
-		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
 		.handler	= rkisp1_ext_params_bdm,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
-		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
 		.handler	= rkisp1_ext_params_ctk,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
-		.size		= sizeof(struct rkisp1_ext_params_goc_config),
 		.handler	= rkisp1_ext_params_goc,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
-		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
 		.handler	= rkisp1_ext_params_dpf,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH] = {
-		.size		= sizeof(struct rkisp1_ext_params_dpf_strength_config),
 		.handler	= rkisp1_ext_params_dpfs,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
-		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
 		.handler	= rkisp1_ext_params_cproc,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
-		.size		= sizeof(struct rkisp1_ext_params_ie_config),
 		.handler	= rkisp1_ext_params_ie,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
-		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
 		.handler	= rkisp1_ext_params_lsc,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
-		.size		= sizeof(struct rkisp1_ext_params_awb_meas_config),
 		.handler	= rkisp1_ext_params_awbm,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
-		.size		= sizeof(struct rkisp1_ext_params_hst_config),
 		.handler	= rkisp1_ext_params_hstm,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
-		.size		= sizeof(struct rkisp1_ext_params_aec_config),
 		.handler	= rkisp1_ext_params_aecm,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
-		.size		= sizeof(struct rkisp1_ext_params_afc_config),
 		.handler	= rkisp1_ext_params_afcm,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] = {
-		.size		= sizeof(struct rkisp1_ext_params_compand_bls_config),
 		.handler	= rkisp1_ext_params_compand_bls,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 		.features	= RKISP1_FEATURE_COMPAND,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] = {
-		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
 		.handler	= rkisp1_ext_params_compand_expand,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 		.features	= RKISP1_FEATURE_COMPAND,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] = {
-		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
 		.handler	= rkisp1_ext_params_compand_compress,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 		.features	= RKISP1_FEATURE_COMPAND,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR] = {
-		.size		= sizeof(struct rkisp1_ext_params_wdr_config),
 		.handler	= rkisp1_ext_params_wdr,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 };
 
+static const struct v4l2_isp_params_block_info rkisp1_ext_params_blocks_info[] = {
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
+		.size		= sizeof(struct rkisp1_ext_params_bls_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
+		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
+		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN] = {
+		.size		= sizeof(struct rkisp1_ext_params_awb_gain_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
+		.size		= sizeof(struct rkisp1_ext_params_flt_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
+		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
+		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
+		.size		= sizeof(struct rkisp1_ext_params_goc_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
+		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH] = {
+		.size		= sizeof(struct rkisp1_ext_params_dpf_strength_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
+		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
+		.size		= sizeof(struct rkisp1_ext_params_ie_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
+		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_awb_meas_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_hst_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_aec_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_afc_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] = {
+		.size		= sizeof(struct rkisp1_ext_params_compand_bls_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] = {
+		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] = {
+		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR] = {
+		.size		= sizeof(struct rkisp1_ext_params_wdr_config),
+	},
+};
+
 static void rkisp1_ext_params_config(struct rkisp1_params *params,
 				     struct rkisp1_ext_params_cfg *cfg,
 				     u32 block_group_mask)
@@ -2646,31 +2691,24 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
-	size_t header_size = offsetof(struct rkisp1_ext_params_cfg, data);
 	struct rkisp1_ext_params_cfg *cfg = params_buf->cfg;
 	size_t payload_size = vb2_get_plane_payload(vb, 0);
 	struct rkisp1_ext_params_cfg *usr_cfg =
 		vb2_plane_vaddr(&vbuf->vb2_buf, 0);
-	size_t block_offset = 0;
-	size_t cfg_size;
+	int ret;
 
-	/*
-	 * Validate the buffer payload size before copying the parameters. The
-	 * payload has to be smaller than the destination buffer size and larger
-	 * than the header size.
-	 */
-	if (payload_size > params->metafmt->buffersize) {
+	/* Only v1 is supported at the moment. */
+	if (usr_cfg->version != RKISP1_EXT_PARAM_BUFFER_V1) {
 		dev_dbg(params->rkisp1->dev,
-			"Too large buffer payload size %zu\n", payload_size);
+			"Unsupported extensible parameters version: %u\n",
+			usr_cfg->version);
 		return -EINVAL;
 	}
 
-	if (payload_size < header_size) {
-		dev_dbg(params->rkisp1->dev,
-			"Buffer payload %zu smaller than header size %zu\n",
-			payload_size, header_size);
-		return -EINVAL;
-	}
+	ret = v4l2_isp_params_validate_buffer_size(params->rkisp1->dev, vb,
+						   params->metafmt->buffersize);
+	if (ret)
+		return ret;
 
 	/*
 	 * Copy the parameters buffer to the internal scratch buffer to avoid
@@ -2678,71 +2716,10 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
 	 */
 	memcpy(cfg, usr_cfg, payload_size);
 
-	/* Only v1 is supported at the moment. */
-	if (cfg->version != RKISP1_EXT_PARAM_BUFFER_V1) {
-		dev_dbg(params->rkisp1->dev,
-			"Unsupported extensible format version: %u\n",
-			cfg->version);
-		return -EINVAL;
-	}
-
-	/* Validate the size reported in the parameters buffer header. */
-	cfg_size = header_size + cfg->data_size;
-	if (cfg_size != payload_size) {
-		dev_dbg(params->rkisp1->dev,
-			"Data size %zu different than buffer payload size %zu\n",
-			cfg_size, payload_size);
-		return -EINVAL;
-	}
-
-	/* Walk the list of parameter blocks and validate them. */
-	cfg_size = cfg->data_size;
-	while (cfg_size >= sizeof(struct rkisp1_ext_params_block_header)) {
-		const struct rkisp1_ext_params_block_header *block;
-		const struct rkisp1_ext_params_handler *handler;
-
-		block = (const struct rkisp1_ext_params_block_header *)
-			&cfg->data[block_offset];
-
-		if (block->type >= ARRAY_SIZE(rkisp1_ext_params_handlers)) {
-			dev_dbg(params->rkisp1->dev,
-				"Invalid parameters block type\n");
-			return -EINVAL;
-		}
-
-		if (block->size > cfg_size) {
-			dev_dbg(params->rkisp1->dev,
-				"Premature end of parameters data\n");
-			return -EINVAL;
-		}
-
-		if ((block->flags & (RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE |
-				     RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)) ==
-		   (RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE |
-		    RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)) {
-			dev_dbg(params->rkisp1->dev,
-				"Invalid parameters block flags\n");
-			return -EINVAL;
-		}
-
-		handler = &rkisp1_ext_params_handlers[block->type];
-		if (block->size != handler->size) {
-			dev_dbg(params->rkisp1->dev,
-				"Invalid parameters block size\n");
-			return -EINVAL;
-		}
-
-		block_offset += block->size;
-		cfg_size -= block->size;
-	}
-
-	if (cfg_size) {
-		dev_dbg(params->rkisp1->dev,
-			"Unexpected data after the parameters buffer end\n");
-		return -EINVAL;
-	}
-
-	return 0;
+	return v4l2_isp_params_validate_buffer(params->rkisp1->dev, vb,
+				(struct v4l2_isp_params_buffer *)cfg,
+				rkisp1_ext_params_blocks_info,
+				ARRAY_SIZE(rkisp1_ext_params_blocks_info));
 }
 
 static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)

-- 
2.51.0


