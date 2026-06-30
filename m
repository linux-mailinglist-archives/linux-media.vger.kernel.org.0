Return-Path: <linux-media+bounces-66046-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /i2UK2l0Q2rJYgoAu9opvQ
	(envelope-from <linux-media+bounces-66046-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:46:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6FB6E156A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:46:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Zqemmbjp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66046-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66046-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D1E130C3861
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 07:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D1627FB3A;
	Tue, 30 Jun 2026 07:41:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C643E3C73;
	Tue, 30 Jun 2026 07:41:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805307; cv=none; b=lWQjvtBbCYGro1CF54G8a0DvmjXHTXpdxao3rBvtK6HJP+zfrqtkTR+rvBq7x2Hn/t/C/iMiizXLhkWSofa7C6Xpz9AeJ46ASd/bUNGMMdVf/dY4VNpC4/WfK4cGRUeJGYnagNRrKqa9Q+ct06Ny8dkNnd7r1OX2lJnJe4VgZJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805307; c=relaxed/simple;
	bh=mEqOsJRJGVe/6uO9EHo8K35An5cY4kOdKYP/T03798E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dmUpW8aKzVT+hNME4B75eQtXmokGeSdQO8WkDFLLvIhTnWt3NhqwZt1E5hp5hoz+ab3K4UiWJdUYQw9ZSiowBJKoQNUGqTLKm/sylyykAQclxvq9apj/IhffC1dt31uvV2TogjnXbH6+Bbu2zWkKC2HnxmeRD6oFZ4hOuR2rg9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zqemmbjp; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.125.177] (mob-109-113-0-8.net.vodafone.it [109.113.0.8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93B7C196B;
	Tue, 30 Jun 2026 09:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782805258;
	bh=mEqOsJRJGVe/6uO9EHo8K35An5cY4kOdKYP/T03798E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zqemmbjp39cZBMl4C2NWTUYLhYWqB1QUgnChGf5bqxHcyEs27sVJmHR6okc91Ybj6
	 OAWpisJhiMw5mugwxHJeVusaiF/dPvZjYkBq8QVViH4mcbguUhIGEP6ig5alObp9x6
	 kYWCEVSYgsc05AJ0or9Fb+s+Pz0FLL5q8v1vbnNc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 30 Jun 2026 09:41:28 +0200
Subject: [PATCH v4 2/2] media: mali-c55: Add support for RGB Gamma
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-mali-c55-ccm-gamma-v4-2-e4321b38a14d@ideasonboard.com>
References: <20260630-mali-c55-ccm-gamma-v4-0-e4321b38a14d@ideasonboard.com>
In-Reply-To: <20260630-mali-c55-ccm-gamma-v4-0-e4321b38a14d@ideasonboard.com>
To: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
 Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, 
 linus.walleij@arm.com, laurent.pinchart@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10881;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=eSAh42p8kRKvG9tYCPJKRYaqcG14YUI+1232cAStFnQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqQ3MxEr9u0NPCDFZhTtYSFU0FgnkwxRZ3qPCpD
 3iAv5MORcWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCakNzMQAKCRByNAaPFqFW
 PDzhD/0YdYWQuba2C0mdyqGM3S6RgxwOhahWZnAeB/bUhCFKoZ/7WihzrV9lIZfEp2c1RTiPVH9
 Qxo3KhxH5ZYby23tvvIxiTZb/v3dq/bkJ0lDjNH67YxW9WXOiyxlRDF/GL0gDw0RBeoRVJ91YCj
 nqErbjDx9g+W+i1fo9ljy7ZbbHqIo2a1zeaabxCUhUlSsMmiDsbhghDxIvpP2Sk92TAO5Z2d5Lr
 yo1LcSzlkdyUeciX73x40ZBvGXiLN/sDbosn1Uou8+sTDb5adIpjzgcjjTbEj33VKQ1W2UiaHuX
 FlXdnTJJ8/2lTtoc8SEaBVvVrTcXOZLSDf7lQhiBhfV8n4WZhrzVGRiHYZjcZGQPf9Wg6V6+S6M
 2mpaPhzlq+DR5/3ZZuXGBghwi4tXa9Z7Yy8ay35Fp2+aQbNS9fSQE2W71TWcLklCuewQdJUwZcQ
 71vTbv46SmrUO6lUnoO6Ha8bA39kJkpm/+jfiXpseVwe996+Ge8bPat3OQ+OuLjZjm++Uybh5q0
 ppj2dYuRfr34WmMLCkA6MALw2KZgHlllInuNDh5zIkgGoGXL/4wLIoP1EVz6akoi6mV4ixvSDnl
 KyiOo/aEwpfVBe/BnQ0K+IwGtTXHdEcvRyYgojD+YUV+H1H2nrfauhgwOHXfLwqJgL5R/Fg3UkS
 JsMK0a3UuX4lT5A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linusw@kernel.org,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-66046-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A6FB6E156A

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Add support for Gamma curve correction for the Mali C55 ISP.

Define a new block in the uAPI using the extensible v4l2-isp format and
implement support for configuring the RGB Gamma parameters in the
mali-c55 parameters handler.

While at it, rename the MALI_C55_REG_GAMMA_GAINS_[1|2] register name
to MALI_C55_REG_GAMMA_GAINS_[RG|B] and the
MALI_C55_REG_GAMMA_OFFSETS_[1|2] register name to
MALI_C55_REG_GAMMA_OFFSETS_[RG|B] to better clarify their intent.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v3:
- Rename register as suggested by Linus
- Remove an additional tab and fix gamma maximum value in uapi as
  suggested by Vincenzo
v2:
- Remove unused 'rgb_enable' member
- Address checkpatch issues
---
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 75 ++++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     | 13 ++--
 include/uapi/linux/media/arm/mali-c55-config.h     | 47 +++++++++++++-
 3 files changed, 130 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 96f1b28a6d77..b38f5a168e31 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -47,6 +47,8 @@
  * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
  * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
  * @ccm:		For header->type == MALI_C55_PARAM_BLOCK_CCM
+ * @gamma:		For header->type == MALI_C55_PARAM_BLOCK_GAMMA_FR and
+ *			header->type = MALI_C55_PARAM_BLOCK_GAMMA_DS
  * @data:		Allows easy initialisation of a union variable with a
  *			pointer into a __u8 array.
  */
@@ -61,6 +63,7 @@ union mali_c55_params_block {
 	const struct mali_c55_params_mesh_shading_config *shading_config;
 	const struct mali_c55_params_mesh_shading_selection *shading_selection;
 	const struct mali_c55_params_ccm *ccm;
+	const struct mali_c55_params_gamma *gamma;
 	const __u8 *data;
 };
 
@@ -462,6 +465,70 @@ static void mali_c55_params_ccm(struct mali_c55 *mali_c55,
 	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 1);
 }
 
+static void mali_c55_params_gamma(struct mali_c55 *mali_c55,
+				  union mali_c55_params_block block,
+				  __u32 offset, __u32 lut_base)
+{
+	const struct mali_c55_params_gamma *params = block.gamma;
+
+	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		mali_c55_ctx_update_bits(mali_c55,
+					 MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
+					 MALI_C55_GAMMA_ENABLE_MASK, 0x00);
+		return;
+	}
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_RG + offset,
+				 MALI_C55_GAMMA_GAIN_R_MASK, params->gains[0]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_RG + offset,
+				 MALI_C55_GAMMA_GAIN_G_MASK,
+				 MALI_C55_GAMMA_GAIN_G(params->gains[1]));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_B + offset,
+				 MALI_C55_GAMMA_GAIN_B_MASK, params->gains[2]);
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_OFFSETS_RG + offset,
+				 MALI_C55_GAMMA_OFFSET_R_MASK,
+				 params->offs[0]);
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_OFFSETS_RG + offset,
+				 MALI_C55_GAMMA_OFFSET_G_MASK,
+				 MALI_C55_GAMMA_OFFSET_G(params->offs[1]));
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_OFFSETS_B + offset,
+				 MALI_C55_GAMMA_OFFSET_B_MASK,
+				 params->offs[2]);
+
+	for (unsigned int i = 0; i < MALI_C55_NUM_GAMMA_LUT_ELEMENTS; i++) {
+		__u32 addr = lut_base + (i * 4);
+
+		mali_c55_ctx_write(mali_c55, addr, params->lut[i]);
+	}
+
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
+				 MALI_C55_GAMMA_ENABLE_MASK, 0x1);
+}
+
+static void mali_c55_params_gamma_fr(struct mali_c55 *mali_c55,
+				     union mali_c55_params_block block)
+{
+	return mali_c55_params_gamma(mali_c55, block,
+				     MALI_C55_CAP_DEV_FR_REG_OFFSET,
+				     MALI_C55_REG_FR_GAMMA_RGB_MEM);
+}
+
+static void mali_c55_params_gamma_ds(struct mali_c55 *mali_c55,
+				     union mali_c55_params_block block)
+{
+	/* We cannot apply parameters to DS if it is not fitted. */
+	if (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED))
+		return;
+
+	return mali_c55_params_gamma(mali_c55, block,
+				     MALI_C55_CAP_DEV_DS_REG_OFFSET,
+				     MALI_C55_REG_DS_GAMMA_RGB_MEM);
+}
+
 static const mali_c55_params_handler mali_c55_params_handlers[] = {
 	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = &mali_c55_params_sensor_offs,
 	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = &mali_c55_params_aexp_hist,
@@ -475,6 +542,8 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
 	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = &mali_c55_params_lsc_config,
 	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = &mali_c55_params_lsc_selection,
 	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
+	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = &mali_c55_params_gamma_fr,
+	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = &mali_c55_params_gamma_ds,
 };
 
 static const struct v4l2_isp_params_block_type_info
@@ -515,6 +584,12 @@ mali_c55_params_block_types_info[] = {
 	[MALI_C55_PARAM_BLOCK_CCM] = {
 		.size = sizeof(struct mali_c55_params_ccm),
 	},
+	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = {
+		.size = sizeof(struct mali_c55_params_gamma),
+	},
+	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = {
+		.size = sizeof(struct mali_c55_params_gamma),
+	},
 };
 
 static_assert(ARRAY_SIZE(mali_c55_params_handlers) ==
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
index f098effde7b4..7d9f51b53448 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
@@ -422,15 +422,17 @@ enum mali_c55_interrupts {
 
 #define MALI_C55_REG_GAMMA_RGB_ENABLE			0x1c064
 #define MALI_C55_GAMMA_ENABLE_MASK			BIT(0)
-#define MALI_C55_REG_GAMMA_GAINS_1			0x1c068
+#define MALI_C55_REG_GAMMA_GAINS_RG			0x1c068
 #define MALI_C55_GAMMA_GAIN_R_MASK			GENMASK(11, 0)
 #define MALI_C55_GAMMA_GAIN_G_MASK			GENMASK(27, 16)
-#define MALI_C55_REG_GAMMA_GAINS_2			0x1c06c
+#define MALI_C55_GAMMA_GAIN_G(x)			((x) << 16)
+#define MALI_C55_REG_GAMMA_GAINS_B			0x1c06c
 #define MALI_C55_GAMMA_GAIN_B_MASK			GENMASK(11, 0)
-#define MALI_C55_REG_GAMMA_OFFSETS_1			0x1c070
+#define MALI_C55_REG_GAMMA_OFFSETS_RG			0x1c070
 #define MALI_C55_GAMMA_OFFSET_R_MASK			GENMASK(11, 0)
 #define MALI_C55_GAMMA_OFFSET_G_MASK			GENMASK(27, 16)
-#define MALI_C55_REG_GAMMA_OFFSETS_2			0x1c074
+#define MALI_C55_GAMMA_OFFSET_G(x)			((x) << 16)
+#define MALI_C55_REG_GAMMA_OFFSETS_B			0x1c074
 #define MALI_C55_GAMMA_OFFSET_B_MASK			GENMASK(11, 0)
 
 /*
@@ -441,6 +443,9 @@ enum mali_c55_interrupts {
 #define MALI_C55_REG_FR_GAMMA_RGB_ENABLE		0x1c064
 #define MALI_C55_REG_DS_GAMMA_RGB_ENABLE		0x1c1d8
 
+#define MALI_C55_REG_FR_GAMMA_RGB_MEM			0x18280
+#define MALI_C55_REG_DS_GAMMA_RGB_MEM			0x18484
+
 #define MALI_C55_REG_FR_SCALER_HFILT			0x34a8
 #define MALI_C55_REG_FR_SCALER_VFILT			0x44a8
 #define MALI_C55_REG_DS_SCALER_HFILT			0x14a8
diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
index 0b18863f973d..ef0fe17df96e 100644
--- a/include/uapi/linux/media/arm/mali-c55-config.h
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -36,6 +36,9 @@
  */
 #define MALI_C55_MAX_ZONES	(15 * 15)
 
+/* Number of RGB gamma LUT entries. */
+#define MALI_C55_NUM_GAMMA_LUT_ELEMENTS 129
+
 /**
  * struct mali_c55_ae_1024bin_hist - Auto Exposure 1024-bin histogram statistics
  *
@@ -220,6 +223,8 @@ struct mali_c55_stats_buffer {
  * @MALI_C55_PARAM_MESH_SHADING_CONFIG : Mesh shading tables configuration
  * @MALI_C55_PARAM_MESH_SHADING_SELECTION: Mesh shading table selection
  * @MALI_C55_PARAM_BLOCK_CCM: Colour correction matrix
+ * @MALI_C55_PARAM_BLOCK_GAMMA_FR: Gamma gain and offset for FR pipe
+ * @MALI_C55_PARAM_BLOCK_GAMMA_DS: Gamma gain and offset for DS pipe
  */
 enum mali_c55_param_block_type {
 	MALI_C55_PARAM_BLOCK_SENSOR_OFFS,
@@ -234,6 +239,8 @@ enum mali_c55_param_block_type {
 	MALI_C55_PARAM_MESH_SHADING_CONFIG,
 	MALI_C55_PARAM_MESH_SHADING_SELECTION,
 	MALI_C55_PARAM_BLOCK_CCM,
+	MALI_C55_PARAM_BLOCK_GAMMA_FR,
+	MALI_C55_PARAM_BLOCK_GAMMA_DS,
 };
 
 /**
@@ -795,6 +802,42 @@ struct mali_c55_params_ccm {
 	__u16 offs[3];
 };
 
+/**
+ * struct mali_c55_params_gamma - RGB Gamma correction
+ *
+ * Gamma correction is used to program a standard gamma curve such as the sRGB
+ * one. It provides gains and offsets to implement contrast adjustments.
+ *
+ * Gamma correction is applied on both the FR and DS pipes separately in the RGB
+ * colour domain where the following operations take place:
+ * 1) An offset is subtracted from each colour channel
+ * 2) Each colour channel is multiplied by a gain
+ * 3) The Gamma LUT is applied to each colour channel
+ *
+ * The Gamma LUT has 129 entries where each node is an unsigned 12 bit number.
+ * It is expected that LUT[0]=0 and LUT[128]=0xfff, with the other 127 values
+ * defining the Gamma correction curve. The three gain multipliers are expressed
+ * as 12-bits unsigned Q4.8 fixed-point numbers and the three offsets are
+ * expressed as a 12-bits unsigned integers.
+ *
+ * As one Gamma correction block is available on both the FR and DS pipes, the
+ * header.type field should be set to one of either
+ * MALI_C55_PARAM_BLOCK_GAMMA_FR or MALI_C55_PARAM_BLOCK_GAMMA_DS from
+ * :c:type:`mali_c55_param_block_type`.
+ *
+ * @header:	The Mali-C55 parameters block header
+ * @gains:	Gains for the red, green and blue channel in unsigned Q4.8 format
+ * @offs:	Offsets subtracted from the red, green and blue channels
+ *		in unsigned 12 bits format
+ * @lut:	129-node Gamma LUT in unsigned 12 bits format
+ */
+struct mali_c55_params_gamma {
+	struct v4l2_isp_params_block_header header;
+	__u16 gains[3];
+	__u16 offs[3];
+	__u32 lut[MALI_C55_NUM_GAMMA_LUT_ELEMENTS];
+};
+
 /**
  * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
  *
@@ -819,6 +862,8 @@ struct mali_c55_params_ccm {
 	sizeof(struct mali_c55_params_awb_gains) +		\
 	sizeof(struct mali_c55_params_mesh_shading_config) +	\
 	sizeof(struct mali_c55_params_mesh_shading_selection) +	\
-	sizeof(struct mali_c55_params_ccm))
+	sizeof(struct mali_c55_params_ccm) +			\
+	sizeof(struct mali_c55_params_gamma) +			\
+	sizeof(struct mali_c55_params_gamma))
 
 #endif /* __UAPI_MALI_C55_CONFIG_H */

-- 
2.54.0


