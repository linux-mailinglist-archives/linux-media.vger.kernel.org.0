Return-Path: <linux-media+bounces-44363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87397BD80F2
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406D0421FCC
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB9B30FC24;
	Tue, 14 Oct 2025 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F+GLN1pH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6412DC768;
	Tue, 14 Oct 2025 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428890; cv=none; b=qmM5T4T60xkCJKpU4wl9MqSL/zTITVtr0hKo+AhYowqZMSElhetgkhGYsrOi/9xCp8KXiKcaovyTHIXFhidppqKVKdmwuflACYW4us/BnxXSsXBDJgJotwJkmtqYjWPpuCpDxblv28F+6bRPp55cMCZKxMIfrsoPByzqSJxU5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428890; c=relaxed/simple;
	bh=H9glGWs+tZBu1vv1PdSeEUPSbMrGZr2Onk1XH09PPQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cBmS+Xzei+8AiZyjaUD6nbmsB8M3tfe4dqOG08XaTVJkSS/T7uX1JnBgGCEgIzxBrUn5rEAlcpjD19I8aC4bYDjXGUz91GPPlkYuFOANFnjlis5n723Sc1Gm4xQN4wdkxU+reDc25ZOyiU1cJVdu+zDXZ4kndnz0qgsKNN/gDIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F+GLN1pH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0854811D5;
	Tue, 14 Oct 2025 09:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428777;
	bh=H9glGWs+tZBu1vv1PdSeEUPSbMrGZr2Onk1XH09PPQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F+GLN1pHt8NR6u2C8aXzXv1AtXlHo150GzF1jvTY3lqXUXVGMEzGf+GkvqPi7pZkh
	 0c96gML99G97DwskMEFk2V2sfgUIwnqTaavdJ2+azz7reXNxewHEekaJ0+HhWgnkMX
	 KVj+vr/jvZnLHszJ2rh0FdUzpr+ZX2QtVr1iCuw8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 10:00:58 +0200
Subject: [PATCH v7 6/8] media: rkisp1: Use v4l2-isp for validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-extensible-parameters-validation-v7-6-6628bed5ca98@ideasonboard.com>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12668;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=H9glGWs+tZBu1vv1PdSeEUPSbMrGZr2Onk1XH09PPQg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNGqwzaoh7uKg6PzQo+GpNvyX1V/K1yMhUje
 25H5NieYb+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRgAKCRByNAaPFqFW
 PLoZD/9YnpYw1ndM/0H1fx55BwTkVoCEPBNKiHaEiDF/QQynENyPt6h6Ae2Sy85AlLJWzTEw9xA
 ffwnZDlMgHTFjPliBErXx+bfU22tObrDIIULqnzvvbwCCBlt5s0gHDNaqu2U6ESpbjTqSjp1aCI
 eRVusw3nyN+yJ6DXa6umRKXWdbYgEUumNHsxQGQDBgrxMj74FHbJ/5EdBZ+6d1oTcBfUDUY2iuI
 gRrvgukGYyBqXMJecPpeGMkIi5lagoUK0yO9xVKI5Hb6FhLGuphn8WeX1Q8/WepdTE9u6tzJeIj
 x8vOPAFNHrifg4Kv/shgd4Vu7HNZR7XiEvQHWvigdCFtahhUGA1glscMskH8cgPDpyf4XPyP4Ao
 GkXcSyA5k7BgenstNy3gAMrLPmOXlKIwnM3qnRk/AZUJqMWGbBQPmCqv5VZTyy64a9K5UDRXfGk
 MWlzwNmBP2MfUgH/C9AgVbUC7J15/lJfqJ1YDZV74dVszTX7bGFBVQgAwmuttma+GB8OK3YQFhM
 LJB3Iqe3WDUeC5DlLUCaaZAcAXw1JOHvCrbUBKqSAXCwQwSKQsip87hmWXI1OSyh/znAihGX/9g
 Vw1X4WSMHOOljog9RDMoXvmQHIw94tT/a/gjTD7aBTuxpxllNz2iAnsBJ7Z54YctKiozFS/cIlY
 6VGlYiEcwCDwULw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Convert rkisp1-params.c to use the helpers defined in v4l2-isp.h
to perform validation of a ISP parameters buffer.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/Kconfig     |   1 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 183 +++++++++------------
 2 files changed, 77 insertions(+), 107 deletions(-)

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
index f1585f8fa0f478304f74317fd9dd09199c94ec82..a880a46d2eefefc6474b36dc5aa69b4f3dce51d1 100644
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
@@ -2646,31 +2691,16 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
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
-
-	/*
-	 * Validate the buffer payload size before copying the parameters. The
-	 * payload has to be smaller than the destination buffer size and larger
-	 * than the header size.
-	 */
-	if (payload_size > params->metafmt->buffersize) {
-		dev_dbg(params->rkisp1->dev,
-			"Too large buffer payload size %zu\n", payload_size);
-		return -EINVAL;
-	}
+	int ret;
 
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
@@ -2678,71 +2708,10 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
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


