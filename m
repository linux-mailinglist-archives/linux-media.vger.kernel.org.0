Return-Path: <linux-media+bounces-43861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C63BC2591
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D7BC19A4606
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5002EA72B;
	Tue,  7 Oct 2025 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U6Ft1Ogs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264F2EA46F;
	Tue,  7 Oct 2025 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860763; cv=none; b=o6Azl5uRcxsp2QZZYNz6RccL3faRKRGP5CHnalYWFD4cw/s+0uWmZR+3jx8T35kAChKJrrdA58+TXfUfsTRLhHhi7n+zv6Jy7WeDEu7vI/eG9UI7kSChut8U+2x+mcfTXMIcD1BVxCTgGfbDQLHXdZzdCxTF/VNuBIre+dr7VW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860763; c=relaxed/simple;
	bh=jIJYy3RpHeSZ4gcjU37lge3RwOH4+fCoxiq+QmxKE0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0oj8WJYomwucs9tQxpD/YlqiCpbBXQcqrl1cmJ6NhsvUFguBcKCxdf7/y8Ui1v3649JruAHFSi0W2KqmQgVycgzZGu8oi6VDKn1z4jKVL75d8Eoz+zwE6ZxJPkwr1WlTnsCAhH9qHhz60JcD4PGskaHn580kc9wMetD1gp9Q1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U6Ft1Ogs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 488F51122;
	Tue,  7 Oct 2025 20:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759860657;
	bh=jIJYy3RpHeSZ4gcjU37lge3RwOH4+fCoxiq+QmxKE0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U6Ft1OgsJAfOI6mEHDL7XEqFwSGFxtR6ytJlz9FcVofXVvGGwphBStXTvAk8Eri1S
	 ocNIktFf+HJttTXcWQ/Rq2OaZDl9X/90qtTgJoTB1bQ8+DSvNPgQjaaHesHrefU7Pu
	 LFcd5SMz05ZeHFyDDOH9TMYD2yDi3eRW0zV07PcQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 07 Oct 2025 20:12:16 +0200
Subject: [PATCH v6 7/8] media: amlogic-c3: Use v4l2-isp for validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-extensible-parameters-validation-v6-7-5f719d9f39e5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8312;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=jIJYy3RpHeSZ4gcjU37lge3RwOH4+fCoxiq+QmxKE0s=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo5VgH8uf8WBJb9o4fwEmUn5Wh09PLkgoKfKeaW
 HpTgXW7CXaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaOVYBwAKCRByNAaPFqFW
 PGQOD/9DMnT53okXZYfpatc2q/ixPhhiPwUbPzM8nWAzkMP4CVREHoA11ZHyzRGtdcv0mxrwUoB
 YSuB8Km3e7bqvJlnjWqwxt6G1OVJ5JucCQybMrH944MBCUXQ/PB9F1+R1fN8lqFRYMu/iSJcNAc
 +2e3YB8+IdSIlnvVCTJQ7FTAJSgpPtXoc5LX7FyyaXFsYbGsryWqMAj9p0XeDn3Hlpct9Auu8Ny
 wr+ToXBfBPFnNXyj7TDkw4BRk319Wnd6VsOsYCIfUZ7WRT1ISGYpQxvFSChZkaAmhn5zM6x53KE
 4d7Wa5LOaZ2rpz3Nq0RhIam+OBnA9p04KOX4oCrnDhwwSkYpSUEaXSV2VkYjLYVPUcThxe33lm4
 /nSAL6uNkpriPl2kQ/q7dAQpEToaDkUQQa8nR4ScnKfokymZe/KRZILOC5c8iGvZL9E5A9ttdzw
 iln0oxiNUQP7TI6N3ncPs7oawSioUXeD1h9/c12RKiRLllQO6L3PVGA1++lr2SWZ5DeeLQoSK0d
 SCSyEnif55NfZuMlTODShh4CvAVbz1UrN219DuhD99bpXcIjaIjhfN7N2IQ2gqXdaXQ4G6GqbwU
 jd8i3sB4W+zrRGviO640FMNhz46k78//ylDMY43uT5OBSoB6p7Jb24TAMi/SUm9Hsre4N2KnqiZ
 MRIS6/KKVxX/BrA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Convert c3-isp-params.c to use the helpers defined in v4l2-isp.h
to perform validation of a ISP parameters buffer.

Reviewed-by: Keke Li <keke.li@amlogic.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   1 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 125 +++++----------------
 2 files changed, 31 insertions(+), 95 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/Kconfig b/drivers/media/platform/amlogic/c3/isp/Kconfig
index 02c62a50a5e88eac665e27abf163e5d654faed3f..809208cd7e3aa7ca0821cb07366ec73a47edb278 100644
--- a/drivers/media/platform/amlogic/c3/isp/Kconfig
+++ b/drivers/media/platform/amlogic/c3/isp/Kconfig
@@ -10,6 +10,7 @@ config VIDEO_C3_ISP
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
+	select V4L2_ISP
 	help
 	  Video4Linux2 driver for Amlogic C3 ISP pipeline.
 	  The C3 ISP is used for processing raw images and
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index c80667dd766210d2b2e1ee60c8254a5814b9d81b..408a7b0137cf889d6a7e027b1fc23402fad52df4 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -8,6 +8,7 @@
 #include <linux/pm_runtime.h>
 
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
 #include <media/v4l2-mc.h>
 #include <media/videobuf2-vmalloc.h>
 
@@ -51,11 +52,6 @@ union c3_isp_params_block {
 typedef void (*c3_isp_block_handler)(struct c3_isp_device *isp,
 				     const union c3_isp_params_block *block);
 
-struct c3_isp_params_handler {
-	size_t size;
-	c3_isp_block_handler handler;
-};
-
 #define to_c3_isp_params_buffer(vbuf) \
 	container_of(vbuf, struct c3_isp_params_buffer, vb)
 
@@ -523,38 +519,41 @@ static void c3_isp_params_cfg_blc(struct c3_isp_device *isp,
 				   ISP_TOP_BEO_CTRL_BLC_EN);
 }
 
-static const struct c3_isp_params_handler c3_isp_params_handlers[] = {
+static const c3_isp_block_handler c3_isp_params_handlers[] = {
+	[C3_ISP_PARAMS_BLOCK_AWB_GAINS] = c3_isp_params_cfg_awb_gains,
+	[C3_ISP_PARAMS_BLOCK_AWB_CONFIG] = c3_isp_params_cfg_awb_config,
+	[C3_ISP_PARAMS_BLOCK_AE_CONFIG] = c3_isp_params_cfg_ae_config,
+	[C3_ISP_PARAMS_BLOCK_AF_CONFIG] = c3_isp_params_cfg_af_config,
+	[C3_ISP_PARAMS_BLOCK_PST_GAMMA] = c3_isp_params_cfg_pst_gamma,
+	[C3_ISP_PARAMS_BLOCK_CCM] = c3_isp_params_cfg_ccm,
+	[C3_ISP_PARAMS_BLOCK_CSC] = c3_isp_params_cfg_csc,
+	[C3_ISP_PARAMS_BLOCK_BLC] = c3_isp_params_cfg_blc,
+};
+
+static const struct v4l2_isp_params_block_info c3_isp_params_blocks_info[] = {
 	[C3_ISP_PARAMS_BLOCK_AWB_GAINS] = {
 		.size = sizeof(struct c3_isp_params_awb_gains),
-		.handler = c3_isp_params_cfg_awb_gains,
 	},
 	[C3_ISP_PARAMS_BLOCK_AWB_CONFIG] = {
 		.size = sizeof(struct c3_isp_params_awb_config),
-		.handler = c3_isp_params_cfg_awb_config,
 	},
 	[C3_ISP_PARAMS_BLOCK_AE_CONFIG] = {
 		.size = sizeof(struct c3_isp_params_ae_config),
-		.handler = c3_isp_params_cfg_ae_config,
 	},
 	[C3_ISP_PARAMS_BLOCK_AF_CONFIG] = {
 		.size = sizeof(struct c3_isp_params_af_config),
-		.handler = c3_isp_params_cfg_af_config,
 	},
 	[C3_ISP_PARAMS_BLOCK_PST_GAMMA] = {
 		.size = sizeof(struct c3_isp_params_pst_gamma),
-		.handler = c3_isp_params_cfg_pst_gamma,
 	},
 	[C3_ISP_PARAMS_BLOCK_CCM] = {
 		.size = sizeof(struct c3_isp_params_ccm),
-		.handler = c3_isp_params_cfg_ccm,
 	},
 	[C3_ISP_PARAMS_BLOCK_CSC] = {
 		.size = sizeof(struct c3_isp_params_csc),
-		.handler = c3_isp_params_cfg_csc,
 	},
 	[C3_ISP_PARAMS_BLOCK_BLC] = {
 		.size = sizeof(struct c3_isp_params_blc),
-		.handler = c3_isp_params_cfg_blc,
 	},
 };
 
@@ -568,14 +567,14 @@ static void c3_isp_params_cfg_blocks(struct c3_isp_params *params)
 
 	/* Walk the list of parameter blocks and process them */
 	while (block_offset < config->data_size) {
-		const struct c3_isp_params_handler *block_handler;
 		const union c3_isp_params_block *block;
+		c3_isp_block_handler block_handler;
 
 		block = (const union c3_isp_params_block *)
 			 &config->data[block_offset];
 
-		block_handler = &c3_isp_params_handlers[block->header.type];
-		block_handler->handler(params->isp, block);
+		block_handler = c3_isp_params_handlers[block->header.type];
+		block_handler(params->isp, block);
 
 		block_offset += block->header.size;
 	}
@@ -771,26 +770,22 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
 	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
-	struct c3_isp_params_cfg *cfg = buf->cfg;
 	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
 	size_t payload_size = vb2_get_plane_payload(vb, 0);
-	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
-	size_t block_offset = 0;
-	size_t cfg_size;
+	struct c3_isp_params_cfg *cfg = buf->cfg;
+	int ret;
 
-	/* Payload size can't be greater than the destination buffer size */
-	if (payload_size > params->vfmt.fmt.meta.buffersize) {
-		dev_dbg(params->isp->dev,
-			"Payload size is too large: %zu\n", payload_size);
+	/* Only v0 is supported at the moment */
+	if (usr_cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
+		dev_dbg(params->isp->dev, "Invalid params buffer version: %u\n",
+			usr_cfg->version);
 		return -EINVAL;
 	}
 
-	/* Payload size can't be smaller than the header size */
-	if (payload_size < header_size) {
-		dev_dbg(params->isp->dev,
-			"Payload size is too small: %zu\n", payload_size);
-		return -EINVAL;
-	}
+	ret = v4l2_isp_params_validate_buffer_size(params->isp->dev, vb,
+						   params->vfmt.fmt.meta.buffersize);
+	if (ret)
+		return ret;
 
 	/*
 	 * Use the internal scratch buffer to avoid userspace modifying
@@ -798,70 +793,10 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	 */
 	memcpy(cfg, usr_cfg, payload_size);
 
-	/* Only v0 is supported at the moment */
-	if (cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
-		dev_dbg(params->isp->dev,
-			"Invalid params buffer version: %u\n", cfg->version);
-		return -EINVAL;
-	}
-
-	/* Validate the size reported in the parameter buffer header */
-	cfg_size = header_size + cfg->data_size;
-	if (cfg_size != payload_size) {
-		dev_dbg(params->isp->dev,
-			"Data size %zu and payload size %zu are different\n",
-			cfg_size, payload_size);
-		return -EINVAL;
-	}
-
-	/* Walk the list of parameter blocks and validate them */
-	cfg_size = cfg->data_size;
-	while (cfg_size >= sizeof(struct c3_isp_params_block_header)) {
-		const struct c3_isp_params_block_header *block;
-		const struct c3_isp_params_handler *handler;
-
-		block = (struct c3_isp_params_block_header *)
-			&cfg->data[block_offset];
-
-		if (block->type >= ARRAY_SIZE(c3_isp_params_handlers)) {
-			dev_dbg(params->isp->dev,
-				"Invalid params block type\n");
-			return -EINVAL;
-		}
-
-		if (block->size > cfg_size) {
-			dev_dbg(params->isp->dev,
-				"Block size is greater than cfg size\n");
-			return -EINVAL;
-		}
-
-		if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
-				     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
-		    (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
-		     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
-			dev_dbg(params->isp->dev,
-				"Invalid parameters block flags\n");
-			return -EINVAL;
-		}
-
-		handler = &c3_isp_params_handlers[block->type];
-		if (block->size != handler->size) {
-			dev_dbg(params->isp->dev,
-				"Invalid params block size\n");
-			return -EINVAL;
-		}
-
-		block_offset += block->size;
-		cfg_size -= block->size;
-	}
-
-	if (cfg_size) {
-		dev_dbg(params->isp->dev,
-			"Unexpected data after the params buffer end\n");
-		return -EINVAL;
-	}
-
-	return 0;
+	return v4l2_isp_params_validate_buffer(params->isp->dev, vb,
+					(struct v4l2_isp_params_buffer *)cfg,
+					c3_isp_params_blocks_info,
+					ARRAY_SIZE(c3_isp_params_blocks_info));
 }
 
 static int c3_isp_params_vb2_buf_init(struct vb2_buffer *vb)

-- 
2.51.0


