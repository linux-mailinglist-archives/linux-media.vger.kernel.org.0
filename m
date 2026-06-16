Return-Path: <linux-media+bounces-65016-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LfQSI/pJMWqEgAUAu9opvQ
	(envelope-from <linux-media+bounces-65016-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:04:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9AE68FB8D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:04:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=SzN7ifOY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65016-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65016-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB7E930A1556
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7556736A37C;
	Tue, 16 Jun 2026 13:01:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F74736B05E;
	Tue, 16 Jun 2026 13:01:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614909; cv=none; b=mufM+rkuegtgh2hfjShVO+leKtuE8nYksGxThR8EAMi1AOe7RBYF/8o9+RIvKXfp1eqFTs5fCAOQ1FofQEpWUtCuvKAImgjpadaQDVYQzavPO1K1QrYnIg41aSKohzpaglo+jUwnSaxCGm61iY8sEgsdZJjGHi74lt//bov2UAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614909; c=relaxed/simple;
	bh=YpfR1Dw2RGBpATC6a7JY8jt9/Sqsy7Q1m2fRfGU8HGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMvJEEO6EnKTIBRk6oym+jn13CzMk/yEOuPdc1QJITEiLttvkODGhsNkz4JaTx5YD61RS0ppuLcZGFdTll841HlT4OoHphn1wz20ZJPP6c9FyJ2MOYy7NREkinjVN+yhoYxqD4QRf5p5yZOYP/KGipiUCESO4o157M+lh8gag2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SzN7ifOY; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.107] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 438EA1A4E;
	Tue, 16 Jun 2026 15:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781614870;
	bh=YpfR1Dw2RGBpATC6a7JY8jt9/Sqsy7Q1m2fRfGU8HGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SzN7ifOYt7fIAI3oBz3LBMhiYooIuPG08yZrn8Dwffs3SLZAw8I6nHOpjN7klwq2X
	 nv7zWhl+L2mxK49jOB8FLB2roXq/4L5dCKvUibd90XnMHRGF5dZgzA/Ho8WQIxu6Ik
	 DLdQN0qP8AWWkmnpdnM0p4lGL252tGLkSvjCAPmU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 16 Jun 2026 15:01:32 +0200
Subject: [PATCH 1/2] media: arm: mali-c55: Add support for CCM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-mali-c55-ccm-gamma-v1-1-174fe4fedea3@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7925;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=H8Vx0frzmK3TDFZRFUxjYD0ylp7CRxlXIDkXrkvKN0k=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqMUk2b7eBukjgk1k0jUfUMeb00IbRO1MFJGJbh
 jJwQ1yJie2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCajFJNgAKCRByNAaPFqFW
 PE+oD/41iynPAivIChIaYFQlJ0lUoidHw6TcJBmYt3f3ilM/bJNHGAuA93PXZKMvCHHXeHVimOj
 fLQfUoDcXmPF0Rh5zRddXgY+uaAE8C3EfHtUkFYRXynZav4SVYHd8gys/1MwN/cMHqr11hwWsYn
 ZYAqGbxiTN3A4MGeM/DU1khldM1E1DUWShzxkPgRYRYpdLwOjy4ilwNZHWOq+cIAlGw/JyFmsDQ
 IXYXMIXvIW7AIZLNtv/IJxc8hdzWVsEnoVIYWZvuX3CAeXDfOfdhYKcKIy20Fc3AvRUbO9G7OgX
 bfpEtl8WEaNPKVC5rMFPV0akoGFhxjm71WY9EAqoIlrPUiPko19I6MSWxKzsEBpCtb5FcUbb9as
 zP3Bwd3dkGf877DPZN4eFbkK33N/SKXLU2IdFchEASXRc2EoMazvpkWdul1Q2IfWDSw8E4hI33W
 AqPLVXTC5bXBUEhexBnYkv8QuyVs3dWEfmrlvjsCP53xz2NQMFRvkZ2BlnF/+qi1HNymiNpgGYx
 eHiYwgHwm/9FQut2Vj+q5Ybv/jjNaRSKKRm1QvZMRV0WZqQc3jsGPFPruIwQAbN/1OXOA5eOL8f
 zrNkb1w3V3o7arIJrk+SdqyQJtIRfocRWFA1O2TW1gxURhe7KDF2PWJQbYOL/dsz7i0cU74Uhqn
 Akn4ELB8Qk5GHUQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,vger.kernel.org:server fail,ideasonboard.com:server fail];
	TAGGED_FROM(0.00)[bounces-65016-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED9AE68FB8D

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Add support for the CCM (Color Correction Matrix) for the Mali C55 ISP.

Define a new block in the uAPI using the extensible v4l2-isp format and
implement support for configuring the CCM parameters in the mali-c55
ISP driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 52 ++++++++++++++++++++++
 include/uapi/linux/media/arm/mali-c55-config.h     | 41 ++++++++++++++++-
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index de0e9d898db7..96f1b28a6d77 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -46,6 +46,7 @@
  * @awb_config:		For header->type == MALI_C55_PARAM_BLOCK_AWB_CONFIG
  * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
  * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
+ * @ccm:		For header->type == MALI_C55_PARAM_BLOCK_CCM
  * @data:		Allows easy initialisation of a union variable with a
  *			pointer into a __u8 array.
  */
@@ -59,6 +60,7 @@ union mali_c55_params_block {
 	const struct mali_c55_params_awb_config *awb_config;
 	const struct mali_c55_params_mesh_shading_config *shading_config;
 	const struct mali_c55_params_mesh_shading_selection *shading_selection;
+	const struct mali_c55_params_ccm *ccm;
 	const __u8 *data;
 };
 
@@ -414,6 +416,52 @@ static void mali_c55_params_lsc_selection(struct mali_c55 *mali_c55,
 				 params->mesh_strength);
 }
 
+static void mali_c55_params_ccm(struct mali_c55 *mali_c55,
+				union mali_c55_params_block block)
+{
+	const struct mali_c55_params_ccm *params = block.ccm;
+
+	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
+		return;
+	}
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_R,
+				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][0]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_G,
+				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][1]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_B,
+				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][2]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_G_R,
+				 MALI_C55_CCM_COEF_MASK, params->coeffs[1][0]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_G_G,
+				 MALI_C55_CCM_COEF_MASK, params->coeffs[1][1]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_G_B,
+				 MALI_C55_CCM_COEF_MASK, params->coeffs[1][2]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_B_R,
+				 MALI_C55_CCM_COEF_MASK, params->coeffs[2][0]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_B_G,
+				 MALI_C55_CCM_COEF_MASK, params->coeffs[2][1]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_B_B,
+				 MALI_C55_CCM_COEF_MASK, params->coeffs[2][2]);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_GAIN_R,
+				 MALI_C55_CCM_ANTIFOG_GAIN_MASK, params->gains[0]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_GAIN_G,
+				 MALI_C55_CCM_ANTIFOG_GAIN_MASK, params->gains[1]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_GAIN_B,
+				 MALI_C55_CCM_ANTIFOG_GAIN_MASK, params->gains[2]);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_OFFSET_R,
+				 MALI_C55_CCM_ANTIFOG_OFFSET_MASK, params->offs[0]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_OFFSET_G,
+				 MALI_C55_CCM_ANTIFOG_OFFSET_MASK, params->offs[1]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_OFFSET_B,
+				 MALI_C55_CCM_ANTIFOG_OFFSET_MASK, params->offs[2]);
+
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 1);
+}
+
 static const mali_c55_params_handler mali_c55_params_handlers[] = {
 	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = &mali_c55_params_sensor_offs,
 	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = &mali_c55_params_aexp_hist,
@@ -426,6 +474,7 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
 	[MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP] = &mali_c55_params_awb_gains,
 	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = &mali_c55_params_lsc_config,
 	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = &mali_c55_params_lsc_selection,
+	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
 };
 
 static const struct v4l2_isp_params_block_type_info
@@ -463,6 +512,9 @@ mali_c55_params_block_types_info[] = {
 	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = {
 		.size = sizeof(struct mali_c55_params_mesh_shading_selection),
 	},
+	[MALI_C55_PARAM_BLOCK_CCM] = {
+		.size = sizeof(struct mali_c55_params_ccm),
+	},
 };
 
 static_assert(ARRAY_SIZE(mali_c55_params_handlers) ==
diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
index 3d335f950eeb..0b2085eed81b 100644
--- a/include/uapi/linux/media/arm/mali-c55-config.h
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -219,6 +219,7 @@ struct mali_c55_stats_buffer {
  * @MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP: Auto-white balance gains for AEXP-0 tap
  * @MALI_C55_PARAM_MESH_SHADING_CONFIG : Mesh shading tables configuration
  * @MALI_C55_PARAM_MESH_SHADING_SELECTION: Mesh shading table selection
+ * @MALI_C55_PARAM_BLOCK_CCM: Colour correction matrix
  */
 enum mali_c55_param_block_type {
 	MALI_C55_PARAM_BLOCK_SENSOR_OFFS,
@@ -232,6 +233,7 @@ enum mali_c55_param_block_type {
 	MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP,
 	MALI_C55_PARAM_MESH_SHADING_CONFIG,
 	MALI_C55_PARAM_MESH_SHADING_SELECTION,
+	MALI_C55_PARAM_BLOCK_CCM,
 };
 
 /**
@@ -757,6 +759,42 @@ struct mali_c55_params_mesh_shading_selection {
 	__u16 mesh_strength;
 };
 
+/**
+ * struct mali_c55_params_ccm - Coefficients, offsets and gains for the colour
+ *				correction matrix
+ *
+ * The colour correction module converts images data from a sensor-specific
+ * colour space to known one.
+ *
+ * Colour correction is applied after demosaicing and each pixel is represented
+ * as a column vector of the three RGB colour channels on which the following
+ * operations take place:
+ * 1) An offset is subtracted from each colour channel
+ * 2) Each colour channel is multiplied by a gain
+ * 3) The pixel column vector is multiplied by the colour correction matrix
+ *
+ * This struct allows users to configure the coefficients for CCM and the
+ * per-channel offsets and gains. The nine matrix coefficients are expressed as
+ * signed Q4.8 Sign/Magnitude fixed-point numbers, the three gain multipliers
+ * are expressed as unsigned Q4.8 fixed-point numbers and the three offsets are
+ * expressed as a 12-bit unsigned integers.
+ *
+ * header.type should be set to MALI_C55_PARAM_BLOCK_CCM from
+ * :c:type:`mali_c55_param_block_type`.
+ *
+ * @header:	The Mali-C55 parameters block header
+ * @coeffs:	3x3 color conversion matrix coefficients in sign/magnitude
+ *		Q4.8 format
+ * @gains:	Gains for red, green and blue channels in unsigned Q4.8 format
+ * @offs:	Offsets for red, green and blue channels
+ */
+struct mali_c55_params_ccm {
+	struct v4l2_isp_params_block_header header;
+	__u16 coeffs[3][3];
+	__u16 gains[3];
+	__u16 offs[3];
+};
+
 /**
  * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
  *
@@ -780,6 +818,7 @@ struct mali_c55_params_mesh_shading_selection {
 	sizeof(struct mali_c55_params_awb_config) +		\
 	sizeof(struct mali_c55_params_awb_gains) +		\
 	sizeof(struct mali_c55_params_mesh_shading_config) +	\
-	sizeof(struct mali_c55_params_mesh_shading_selection))
+	sizeof(struct mali_c55_params_mesh_shading_selection) +	\
+	sizeof(struct mali_c55_params_ccm))
 
 #endif /* __UAPI_MALI_C55_CONFIG_H */

-- 
2.54.0


