Return-Path: <linux-media+bounces-55646-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOqVHLLss2mDdQAAu9opvQ
	(envelope-from <linux-media+bounces-55646-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:53:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD49E281C82
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67628324175E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26A338F645;
	Fri, 13 Mar 2026 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RQglt8+C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4F34B1AC;
	Fri, 13 Mar 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399035; cv=none; b=s/6OnMT448tlj8ATUci56zSZUsv+6YQafE7VvDOici3HUcBg5rnFsp3xKE/Y0J6Vq7pMpyRBGpKZZtllsJmSFsE1Y/sxlS8phoTnyKnyrP0+Sph0GYiHLll8aY4T9a9kBqvn9hrXaZIku7S8p27/J5SJCxQbcmV52hWgQhjHjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399035; c=relaxed/simple;
	bh=Dk8ZDvYfvz5HR2ziHGUIMpy0acO3OxhEfd43yVDbz7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYB1PEsPJ4SMlVbKGPMjsC6vWGNiXWrACZMh0bqqNamhG8tuxC+4j1a+apOZXei3oENKpTC9MWJOcJ2E7O0Zsmoxu0RfgeM4h18QS0ND4yhVvb9aoH/LKskGOu2WMmVVxGcW6aVDQYZu4MPnXW2zVrYReiZoIkamRQufTIeYlJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RQglt8+C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [91.80.67.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D8B71356;
	Fri, 13 Mar 2026 11:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773398962;
	bh=Dk8ZDvYfvz5HR2ziHGUIMpy0acO3OxhEfd43yVDbz7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RQglt8+CD041MVykHJA34Fx6oThtRVL7TZLNyF4zq14KnKhebIF5LOtLXST1OVH6h
	 MOZUamuASJqkAKueWliSdH45ns8mkvKbvBpQ8wje27UuQxkhD/WVNw6i6zct7UFUER
	 l0Hb9EKX1mZawNdxZyhcT/JhJKKq/MI3LtncJ6DI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 11:49:39 +0100
Subject: [PATCH 2/6] media: mali-c55: Initialize the ISP in
 enable_streams()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v1-2-21805b2b516b@ideasonboard.com>
References: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
To: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <Nayden.Kanchev@arm.com>, 
 Konstantin Babin <Konstantin.Babin@arm.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9591;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Dk8ZDvYfvz5HR2ziHGUIMpy0acO3OxhEfd43yVDbz7U=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps+vxIDHmtaVPJqU+Ou/wJ7QqAeQd3sjfNXqRD
 iIOtYftGVCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPr8QAKCRByNAaPFqFW
 PMKOD/4i6lJqpJNUAgYaoAWYYw4NDCzRMLqt0rp5qNIwr0P0N6Ux+Cl2nNeKeDAM2KVsTEHSJ/M
 MaaXfyhWP76igIXwQfbhLijovIw0NPAEPKup7nqTqXU5jv0CC9yShn10esI+pQQ/sjLgDfZ88aB
 T3YU47ofIdWM2qZUevNDNFJATguM6YL5tb0ztuYTVw8nlDPdGa/KjcFirRq9PsZHsprokSoZO3E
 VIxsJ/z4vfYJXsmarWXM5dQbTLdKeI6wMTit8w7lXAg8Lzv78Vz5WolbTRxdZ2vnDOOOVM8Bh2G
 CtoQAb1mCvYTQH/AhNm7cSZrDOcICY4ElBGkBuGIsib6zahelyiLbhMr0WBRGO2+mpRsSEzWRjO
 LybWvukj0NjW9mZh2qME8feLU82cdKr14ZSarWyYOCrlC/GSp00h7okzNcRcnGaDn71iIXAf5JM
 5ZvZIYJyrxHHiVraDwjvce0JfZ2ydXIjiLVaNyjKL7Mzan44IgspypWjWdoB3x8VIITB79HWzR/
 4vlyXUGK65HCoQ48hmJUFyleCsFRqZeLj7NtqIU/mvSv0JrFgqKuzNFrOwkzKkuhlzb8dAAREa9
 X7Fr+Uj5ROmQn4mw6IYqNNlEDZtDkTvi8oJC0Ckv6Dy26Z2gr6tH2pWuzu2P65jD+stqmzBY1OU
 b70dg132arz/prg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55646-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: CD49E281C82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Mali C55 driver initializes the ISP in two points:

1) At probe time it disables ISP blocks by configuring them in bypass
   mode
2) At enable_streams() it initializes the crop rectangles and the image
   processing pipeline using the current image format

However, as ISP blocks are configured by userspace, if their
configuration is not reset, from the second enable_streams() call
onwards the ISP configuration will depend on the previous streaming
session configuration.

To re-initialize the ISP completely at enable_strems() time consolidate
the ISP block bypass configuration and the image processing path
configuration in a single function to be called at enabled_streams()
time.

Cc: stable@vger.kernel.org
Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  2 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    | 35 -----------
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 37 ++---------
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 72 ++++++++++++++++++++++
 4 files changed, 79 insertions(+), 67 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
index 31c1deaca146..13a3e9dc4243 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -306,5 +306,7 @@ bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55);
 void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
 				enum mali_c55_config_spaces cfg_space);
 void mali_c55_params_write_config(struct mali_c55 *mali_c55);
+void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
+				     const struct v4l2_subdev_state *state);
 
 #endif /* _MALI_C55_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 43b834459ccf..c1a562cd214e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -663,41 +663,6 @@ static int mali_c55_init_context(struct mali_c55 *mali_c55,
 		      mali_c55->base + config_space_addrs[MALI_C55_CONFIG_PING],
 		      MALI_C55_CONFIG_SPACE_SIZE);
 
-	/*
-	 * Some features of the ISP need to be disabled by default and only
-	 * enabled at the same time as they're configured by a parameters buffer
-	 */
-
-	/* Bypass the sqrt and square compression and expansion modules */
-	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_1,
-				 MALI_C55_REG_BYPASS_1_FE_SQRT,
-				 MALI_C55_REG_BYPASS_1_FE_SQRT);
-	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
-				 MALI_C55_REG_BYPASS_3_SQUARE_BE,
-				 MALI_C55_REG_BYPASS_3_SQUARE_BE);
-
-	/* Bypass the temper module */
-	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_2,
-			   MALI_C55_REG_BYPASS_2_TEMPER);
-
-	/* Disable the temper module's DMA read/write */
-	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TEMPER_DMA_IO, 0x0);
-
-	/* Bypass the colour noise reduction  */
-	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
-			   MALI_C55_REG_BYPASS_4_CNR);
-
-	/* Disable the sinter module */
-	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_SINTER_CONFIG,
-				 MALI_C55_SINTER_ENABLE_MASK, 0);
-
-	/* Disable the RGB Gamma module for each output */
-	mali_c55_ctx_write(mali_c55, MALI_C55_REG_FR_GAMMA_RGB_ENABLE, 0);
-	mali_c55_ctx_write(mali_c55, MALI_C55_REG_DS_GAMMA_RGB_ENABLE, 0);
-
-	/* Disable the colour correction matrix */
-	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
-
 	return 0;
 }
 
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 497f25fbdd13..4c0fd1ec741c 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -112,9 +112,6 @@ static int mali_c55_isp_start(struct mali_c55 *mali_c55,
 			      const struct v4l2_subdev_state *state)
 {
 	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
-	const struct mali_c55_isp_format_info *cfg;
-	const struct v4l2_mbus_framefmt *format;
-	const struct v4l2_rect *crop;
 	u32 val;
 	int ret;
 
@@ -122,35 +119,11 @@ static int mali_c55_isp_start(struct mali_c55 *mali_c55,
 			     MALI_C55_REG_MCU_CONFIG_WRITE_MASK,
 			     MALI_C55_REG_MCU_CONFIG_WRITE_PING);
 
-	/* Apply input windowing */
-	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
-	format = v4l2_subdev_state_get_format(state,
-					      MALI_C55_ISP_PAD_SINK_VIDEO);
-	cfg = mali_c55_isp_get_mbus_config_by_code(format->code);
-
-	mali_c55_write(mali_c55, MALI_C55_REG_HC_START,
-		       MALI_C55_HC_START(crop->left));
-	mali_c55_write(mali_c55, MALI_C55_REG_HC_SIZE,
-		       MALI_C55_HC_SIZE(crop->width));
-	mali_c55_write(mali_c55, MALI_C55_REG_VC_START_SIZE,
-		       MALI_C55_VC_START(crop->top) |
-		       MALI_C55_VC_SIZE(crop->height));
-	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
-				 MALI_C55_REG_ACTIVE_WIDTH_MASK, format->width);
-	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
-				 MALI_C55_REG_ACTIVE_HEIGHT_MASK,
-				 format->height << 16);
-	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BAYER_ORDER,
-				 MALI_C55_BAYER_ORDER_MASK, cfg->order);
-	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_INPUT_WIDTH,
-				 MALI_C55_INPUT_WIDTH_MASK,
-				 MALI_C55_INPUT_WIDTH_20BIT);
-
-	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
-				 MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK,
-				 cfg->bypass ? MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK :
-					     0x00);
-
+	/*
+	 * Apply default ISP configuration and the apply configurations from
+	 * the first available parameters buffer.
+	 */
+	mali_c55_params_init_isp_config(mali_c55, state);
 	mali_c55_params_write_config(mali_c55);
 	ret = mali_c55_config_write(ctx, MALI_C55_CONFIG_PING, true);
 	if (ret) {
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index c03a6120ddbf..c84a6047a570 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -732,6 +732,78 @@ void mali_c55_params_write_config(struct mali_c55 *mali_c55)
 	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 }
 
+void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
+				     const struct v4l2_subdev_state *state)
+{
+	const struct mali_c55_isp_format_info *cfg;
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
+
+	/* Apply input windowing */
+	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
+	format = v4l2_subdev_state_get_format(state,
+					      MALI_C55_ISP_PAD_SINK_VIDEO);
+	cfg = mali_c55_isp_get_mbus_config_by_code(format->code);
+
+	mali_c55_write(mali_c55, MALI_C55_REG_HC_START,
+		       MALI_C55_HC_START(crop->left));
+	mali_c55_write(mali_c55, MALI_C55_REG_HC_SIZE,
+		       MALI_C55_HC_SIZE(crop->width));
+	mali_c55_write(mali_c55, MALI_C55_REG_VC_START_SIZE,
+		       MALI_C55_VC_START(crop->top) |
+		       MALI_C55_VC_SIZE(crop->height));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
+				 MALI_C55_REG_ACTIVE_WIDTH_MASK, format->width);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
+				 MALI_C55_REG_ACTIVE_HEIGHT_MASK,
+				 format->height << 16);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BAYER_ORDER,
+				 MALI_C55_BAYER_ORDER_MASK, cfg->order);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_INPUT_WIDTH,
+				 MALI_C55_INPUT_WIDTH_MASK,
+				 MALI_C55_INPUT_WIDTH_20BIT);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
+				 MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK,
+				 cfg->bypass ? MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK :
+					     0x00);
+
+	/*
+	 * Some features of the ISP need to be disabled by default and only
+	 * enabled at the same time as they're configured by a parameters buffer
+	 */
+
+	/* Bypass the sqrt and square compression and expansion modules */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_1,
+				 MALI_C55_REG_BYPASS_1_FE_SQRT,
+				 MALI_C55_REG_BYPASS_1_FE_SQRT);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
+				 MALI_C55_REG_BYPASS_3_SQUARE_BE,
+				 MALI_C55_REG_BYPASS_3_SQUARE_BE);
+
+	/* Bypass the temper module */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_2,
+			   MALI_C55_REG_BYPASS_2_TEMPER);
+
+	/* Disable the temper module's DMA read/write */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TEMPER_DMA_IO, 0x0);
+
+	/* Bypass the colour noise reduction  */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
+			   MALI_C55_REG_BYPASS_4_CNR);
+
+	/* Disable the sinter module */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_SINTER_CONFIG,
+				 MALI_C55_SINTER_ENABLE_MASK, 0);
+
+	/* Disable the RGB Gamma module for each output */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_FR_GAMMA_RGB_ENABLE, 0);
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_DS_GAMMA_RGB_ENABLE, 0);
+
+	/* Disable the colour correction matrix */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
+}
+
 void mali_c55_unregister_params(struct mali_c55 *mali_c55)
 {
 	struct mali_c55_params *params = &mali_c55->params;

-- 
2.53.0


