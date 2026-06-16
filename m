Return-Path: <linux-media+bounces-65017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rV+LDxhKMWqNgAUAu9opvQ
	(envelope-from <linux-media+bounces-65017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:05:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD1C68FBAC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:05:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=wDt6pMd7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65017-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65017-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6083930B282A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BC736B046;
	Tue, 16 Jun 2026 13:01:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B7F369D7C;
	Tue, 16 Jun 2026 13:01:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614912; cv=none; b=dOP/I1FnaDnZNceIDHkOUbzwzTBTahLYBFRZt6FWDjV5XUSyzs2Cfb0E/ql5vfjKo5/1VRuSTMJyYHOxXO6BRymrxlJB3xqzIdiP0HsP41/qFuCpnI/ADIkl31EgvV0vEvWa+AQUuEdxChky7uQ8DhYbbnf/Gw1a0yavdDt1ZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614912; c=relaxed/simple;
	bh=K46JZq+H2sJjj9661pJyMBSxxsC57egpo9bjJFY6rzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejxCBen8SS57Nl24nmXP17ltY3jjctvpsRHKxh/62ZpRQX+7iRmwrlxn129O3oXo/7KKb39BNW+j4qhP+wBH8kqKge3/BM4bC1J4zaD+/HH9CEkVuV2xJb7N36aL1lfPDZhQjDEsMculh8aCv4kbeQ1FjfrCaBZDB4U5/Ds+qhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wDt6pMd7; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.107] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 126371CD4;
	Tue, 16 Jun 2026 15:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781614871;
	bh=K46JZq+H2sJjj9661pJyMBSxxsC57egpo9bjJFY6rzU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wDt6pMd70aCNbvxmgUdhDO0ACTQkQUPYZzxVD42oclL8Ra8/x6AYQT66PtsuBXYak
	 JdhgKkZ0qUUxk0f234vSUf/tyTpmPdPkrcoccfy1vMI/zbeB3Gx3XmIL+ZnNgJ4aEh
	 o1mxewqHTLlUWE0fQbnaxXbNQLUxjwdl3xRxVZn4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 16 Jun 2026 15:01:33 +0200
Subject: [PATCH 2/2] media: arm: mali-c55: Add support for RGB Gamma
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-mali-c55-ccm-gamma-v1-2-174fe4fedea3@ideasonboard.com>
References: <20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com>
In-Reply-To: <20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com>
To: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
 Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, 
 linus.walleij@arm.com, Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9866;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=lvPqBWCUTcCiJQxzBIlaxgbUtVdV8JsL14LDiA16lJY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqMUk27VVVVkOr74y8EswAqHDlp4is4fOn7fXHI
 CGeAl8bR3mJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCajFJNgAKCRByNAaPFqFW
 POd5EACKrdI+cB5XBcANYnTmVBnhVfP+2/p8AXVxzeGBYNdSwCngbyuUgfP6XyiyW3DKWghfcN0
 P8X8x8PzV9NyqIgP6CED/h6zVu9S4fSekkmaeGjDeJp3t5HjvFMlxehbThg+68cBZau3+VFuObm
 tEer4eJnjbIC84H7LTvh2SGjlnjwpWsk3i2ud7JaFUJACUA7qbuTyJSjFNh9QA6rjPXmJKPNE7o
 in3kWwku97F/Om1J2tvOUsqTacsnkFZq2TDD5gqlwBQmOuiZz6TfypBnKeJygR5W1tD+58iDasJ
 7VbetPl1hlhQIoL0ueP9R/GR0UWHx0727pVsQivASdkCoZwQR05mz1i5uMd41iJOu6/ozCO+4HF
 3BYE2XTYs6he/Hm3y0JPBh0tIEZtwdERj/soGanihBV/EyQcllKBJ0wMjZkgInDW/ZEac73TpUe
 3qgzAog30XQrQjSGPOyxpYsF1eu8Ke3qaFq6KhBkkEJGEocAdToCPHaRgxwBDpcJIoXUlrasvSh
 aWAn21ta7QoW7Z0n93RBunQHZUfVW54Pa03zWlDvt8GF0usSVJPXdL/WJb7DPxp0WVQc58LDEeN
 3p2IvJXDL0w8LSpqy+nfv1gcssO5leELuySO0K3dzmCDutOZ0UPOSBnnzX3srmsXgri64NGiVVX
 ugqZm1P6KYNFWJQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65017-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFD1C68FBAC

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Add support for Gamma curve correction for the Mali C55 ISP.

Define a new block in the uAPI using the extensible v4l2-isp format and
implement support for configuring the RGB Gamma parameters in the
mali-c55 parameters handler.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 75 ++++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |  5 ++
 include/uapi/linux/media/arm/mali-c55-config.h     | 46 ++++++++++++-
 3 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 96f1b28a6d77..913e8c7fef73 100644
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
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + offset,
+				 MALI_C55_GAMMA_GAIN_R_MASK, params->gains[0]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + offset,
+				 MALI_C55_GAMMA_GAIN_G_MASK,
+				 MALI_C55_GAMMA_GAIN_G(params->gains[1]));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_2 + offset,
+				 MALI_C55_GAMMA_GAIN_B_MASK, params->gains[2]);
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_OFFSETS_1 + offset,
+				 MALI_C55_GAMMA_OFFSET_R_MASK,
+				 params->offs[0]);
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_OFFSETS_1 + offset,
+				 MALI_C55_GAMMA_OFFSET_G_MASK,
+				 MALI_C55_GAMMA_OFFSET_G(params->offs[1]));
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_OFFSETS_2 + offset,
+				 MALI_C55_GAMMA_OFFSET_B_MASK,
+				 params->offs[2]);
+
+	for (unsigned int i = 0; i < MALI_C55_NUM_GAMMA_LUT_ELEMENTS; i++) {
+		__u32 addr = lut_base + (i * 4);
+		mali_c55_ctx_write(mali_c55, addr, params->lut[i]);
+	}
+
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
+				 MALI_C55_GAMMA_ENABLE_MASK, 0x1);
+
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
index f098effde7b4..7a606bd2e843 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
@@ -425,11 +425,13 @@ enum mali_c55_interrupts {
 #define MALI_C55_REG_GAMMA_GAINS_1			0x1c068
 #define MALI_C55_GAMMA_GAIN_R_MASK			GENMASK(11, 0)
 #define MALI_C55_GAMMA_GAIN_G_MASK			GENMASK(27, 16)
+#define MALI_C55_GAMMA_GAIN_G(x)			((x) << 16)
 #define MALI_C55_REG_GAMMA_GAINS_2			0x1c06c
 #define MALI_C55_GAMMA_GAIN_B_MASK			GENMASK(11, 0)
 #define MALI_C55_REG_GAMMA_OFFSETS_1			0x1c070
 #define MALI_C55_GAMMA_OFFSET_R_MASK			GENMASK(11, 0)
 #define MALI_C55_GAMMA_OFFSET_G_MASK			GENMASK(27, 16)
+#define MALI_C55_GAMMA_OFFSET_G(x)				((x) << 16)
 #define MALI_C55_REG_GAMMA_OFFSETS_2			0x1c074
 #define MALI_C55_GAMMA_OFFSET_B_MASK			GENMASK(11, 0)
 
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
index 0b2085eed81b..06eb85a6d66a 100644
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
@@ -795,6 +802,41 @@ struct mali_c55_params_ccm {
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
+ * It is expected that LUT[0]=0 and LUT[128]=0xffff, with the other 127 values
+ * defining the Gamma correction curve.
+ *
+ * As one Gamma correction block is available on both the FR and DS pipes, the
+ * header.type field should be set to one of either
+ * MALI_C55_PARAM_BLOCK_GAMMA_FR or MALI_C55_PARAM_BLOCK_GAMMA_DS from
+ * :c:type:`mali_c55_param_block_type`.
+ *
+ * @header:	The Mali-C55 parameters block header
+ * @gains:	Gains for the red, green and blue channel in unsigned Q4.8 format
+ * @offs:	Offsets subtracted from the red, green and blue channels
+ *		in unsigned 12-bit format
+ * @lut: 	129-node Gamma LUT in u0.12 format
+ */
+struct mali_c55_params_gamma {
+	struct v4l2_isp_params_block_header header;
+	__u8 rgb_enable;
+	__u16 gains[3];
+	__u16 offs[3];
+	__u32 lut[MALI_C55_NUM_GAMMA_LUT_ELEMENTS];
+};
+
 /**
  * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
  *
@@ -819,6 +861,8 @@ struct mali_c55_params_ccm {
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


