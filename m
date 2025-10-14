Return-Path: <linux-media+bounces-44364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C77C2BD8105
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FABA192289D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FDD155322;
	Tue, 14 Oct 2025 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hX+rENfy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56F30FC20;
	Tue, 14 Oct 2025 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428892; cv=none; b=IWAbcDP8GBqnTZFEM4fts/KSfOmKdxL2ELnkPxVLBbcX9aiaqcgmrg9I1NBr9qRwa+N+jw2Iy5SzzRgl71mER814pG1yvLqV4tuHZrvbTalKWmAbKmuLhSvhY8KfQ7VWXNPl/r+RLyWWOjz9J2UgZPw4abid/MUNpaKL4nEeYuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428892; c=relaxed/simple;
	bh=Rcnbc5GQWRE3nXnwQde2olvlVlFTfb1KEB0nxjBJ878=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUZ1zN2477WFIoln6wpI5KobftSq6TxZoJ3iZpFFQfYwY+YF54imBwEKC5kJUxfMh9A2uQK/EelNGLJ2sbY6Ss68/WtJIZxKUM43CbLWPdn9cr+2jEhZXP0fCx+XNJ/o5LRjqHAt/7AWNGrdcwSr0MeM1cHZSIDt3q8+naME6ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hX+rENfy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B88411DA;
	Tue, 14 Oct 2025 09:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428778;
	bh=Rcnbc5GQWRE3nXnwQde2olvlVlFTfb1KEB0nxjBJ878=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hX+rENfyd48m5NJj6fK8yOr/XLRVn5VlH3Q70OBiota80jLxoTe1+QzEIUkQHCF94
	 z1xqGHyiVEAIG1BN69jWQMqlX1nsPVvgSi7VYh8kY7IhS/eR8UAfV1RkxACN4aNHW3
	 K7Iy0zhWG4Xfq0QnJx0GDHdwZcHeIMPRzGUxP4S0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 10:00:59 +0200
Subject: [PATCH v7 7/8] media: amlogic-c3: Use v4l2-isp for validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-extensible-parameters-validation-v7-7-6628bed5ca98@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8121;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Rcnbc5GQWRE3nXnwQde2olvlVlFTfb1KEB0nxjBJ878=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNHTlxyaJDla9v2J2v74o6KyKj76iqmIbGhj
 PamIRFcAmWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRwAKCRByNAaPFqFW
 PBoeEACy4dVmrdtK5jWTpaNcpFTDUWYZAT7ridVb0769G+VL0kqxP1nNmzBLlMsflF0Ua1jRQkR
 +qXOK4Ewx27bEj7yOhxfczZnQIf+1+6ffTwl2e9aoTeef4GYMsM/z8yJwHVk1cy7P7LRACIcncD
 Wrp/df6lxR7r2cKaP7VQk0egXsB8C0MHhfr8WhbNXSU2daLLKU0JpC/4/ZqmeO+tLIWgp7tNQpz
 NsS1XPrl2wd4noRJN70mUUs5xZAMamGz0EC8CjeYZawqCN1zyxVmI4MGqaBxcmzIr4sKsbXelDU
 5zUysWzkimqHsVu9FLPpne85I2K988h9gBa3NDvOUo903cFn2HHymX876XJzjaEY8F8YPBGkt9r
 QnLZDStm25J/lzH4gTo732bDX/fpSVoUUZb8wNDXmi/acbfMyF0rFJl2hq6UAzAQuEMkkmGdnbm
 q2i0McaNMrjXBfad4MmVGejwVTcNhhok9NaUJOluXxRTmCjdUoR+o9tcOcJSkfKLlRhYtdaaZHG
 vHIQ7Wbper+pVORzQTasqieOh3W3e3OLdEtMnWx9iAt5tyiBwnWCBFz2Tv5WCxRkT4VOkO8FdOP
 VLgSDZ/ullhKbvKrYU0a2GuzHUEo5aWDDUXPrkk3aWYkvae6rxC8dLmFYnww01dWgBgJnBnJfGF
 i0l3JYOgWcV3A3Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Convert c3-isp-params.c to use the helpers defined in v4l2-isp.h
to perform validation of a ISP parameters buffer.

Reviewed-by: Keke Li <keke.li@amlogic.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   1 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 124 +++++----------------
 2 files changed, 27 insertions(+), 98 deletions(-)

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
index c80667dd766210d2b2e1ee60c8254a5814b9d81b..0e031d64de312cfdf0a52a46f70edbaf07563359 100644
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
@@ -771,26 +770,15 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
 	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
-	struct c3_isp_params_cfg *cfg = buf->cfg;
 	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
 	size_t payload_size = vb2_get_plane_payload(vb, 0);
-	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
-	size_t block_offset = 0;
-	size_t cfg_size;
-
-	/* Payload size can't be greater than the destination buffer size */
-	if (payload_size > params->vfmt.fmt.meta.buffersize) {
-		dev_dbg(params->isp->dev,
-			"Payload size is too large: %zu\n", payload_size);
-		return -EINVAL;
-	}
+	struct c3_isp_params_cfg *cfg = buf->cfg;
+	int ret;
 
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
@@ -798,70 +786,10 @@ static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
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


