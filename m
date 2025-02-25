Return-Path: <linux-media+bounces-26948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C150A43FC2
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EF063B651F
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768B8268C6F;
	Tue, 25 Feb 2025 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PwwdkKNW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A372638DE0;
	Tue, 25 Feb 2025 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488102; cv=none; b=mNTT26Jg5AgVjhVUO2VHATAReM65XCEZn45AwtVsLbP5tcHuDX/51ebSk30r3rhF/RYh1Iogh0olgUQYqaAYW07f8a2jNJRi6lp6lNsokGfqIgJgdCh1OMTy/V448lpxBrpJUpnIMrRvpaCQZnxy0Gsuyt+v95mAuXMT9uCfYNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488102; c=relaxed/simple;
	bh=lx3N2KbKiWWkGH2KVobNfuJy+OP4umFs68JFdvlSDcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdbtJ14donUd0TSrnJVp8XymXoxiD95TMkRAc69MyIsuEg0ZFVFzQ2cqACusRhN5oSOdzjMvBruBP/hINDjUQKwiYLY3YtjE1iNlEz42mCNcWwF7+uEPh1p13qG+bcS1UGkWfYfbZJajH52hiaKzEoFvgM8pf7lUPS4BoyPAvTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PwwdkKNW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BFC2A30;
	Tue, 25 Feb 2025 13:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740488012;
	bh=lx3N2KbKiWWkGH2KVobNfuJy+OP4umFs68JFdvlSDcc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PwwdkKNWFjBRz7STLHvfBsMl7gokWn29ySR7MRM3SWRMVNzhA0lxZ8JpznwEdtrRt
	 0MtNuHX5H/PP9w4GgkdqltK6+ro2+z8tf0e3JVNZqhHVyimZFktNu3IL9ab/1Y2Yqx
	 haU/ff129W2ylXvMfaxdt6lLzU4mOeCXPgR7Yt9A=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 25 Feb 2025 18:23:04 +0530
Subject: [PATCH v3 1/2] media: rockchip: rkisp1: Add support for Wide
 Dynamic Range
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-awb64-v3-1-af29b1201e48@ideasonboard.com>
References: <20250225-awb64-v3-0-af29b1201e48@ideasonboard.com>
In-Reply-To: <20250225-awb64-v3-0-af29b1201e48@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19615;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=lx3N2KbKiWWkGH2KVobNfuJy+OP4umFs68JFdvlSDcc=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnvb2CKKed3kFntfA8FLRKeii06q/p+PiulsxFI
 ED0giJiMW2JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ729ggAKCRBD3pH5JJpx
 RWeBEACnBGbQEOhm0Xv1Hx31hnyDNZp8Q39GYcuVciy1kScEGCSwgpm7JCuiKhgQRFvqxL0LHcI
 /AipJcFrFrhuSnGE2C6C5xQpj61mcckIYSQZu2vUJQq+7eNdvNOuREVzR4yhgpDL6yTZ9SjwLrr
 RQfxpCMLnWcJBCdYdN7yg0QY7zW1XJAo/2nrKCHBtBOoRZe1MQFpjhZTRBGSkUJNPSo57qt5jxW
 pgPoJL5pzVqPXaBKnuJ/x3uy2iTMGYNgMC4Kzy/uE9CvyvU16S2qRuhQenNcard0xesxqwAqh2c
 cuyRmVwM22V03w6HKYA3jt8I5xTS9NVEQu/pL+xJ6BNR1zc4xQoEKUosZQ81xQ0ccDqbMlHep0z
 by1fG9b3blKQdjkNxrbVdLiqrSN2eGpS4EPRlrcL24ev6dL0WJXhWNMfxAaCuZVxQAsyGx4mfRN
 MkDKiC7FfCau1jJ8vuo5NrF20LSwLVG/4cbpT8IOYb6DnddLCdNKHhPwfB3HjjqxyDnb+cWCQ96
 zpfpID95SmPKDDar0qHszrQq5Cwo4dB7u4QwYI3ejOPII4PnmD+86kXo0FTEa3IJG/vPoja2jqi
 bgPvX1k9TT5YzuwsGukz+hutPscJg4uyQuEChdfCKAE+Y2D4oKOTl3gVRjMMrnGCdE+MTWsBpCr
 3E8zAkUYgShfP+Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

RKISP supports a basic Wide Dynamic Range (WDR) module since the first
iteration (v1.0) of the ISP. Add support for enabling and configuring it
using extensible parameters.

Also, to ease programming, switch to using macro variables for defining
the tonemapping curve register addresses.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
New patch in v3
---
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  92 +++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  99 +++++---------------
 include/uapi/linux/rkisp1-config.h                 | 101 +++++++++++++++++++++
 3 files changed, 218 insertions(+), 74 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a309a3231d44d825c6461e3ecb2a44..92a9aad79f6dca3c76d7692421827234e7f06390 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -60,6 +60,7 @@ union rkisp1_ext_params_config {
 	struct rkisp1_ext_params_afc_config afc;
 	struct rkisp1_ext_params_compand_bls_config compand_bls;
 	struct rkisp1_ext_params_compand_curve_config compand_curve;
+	struct rkisp1_ext_params_wdr_config wdr;
 };
 
 enum rkisp1_params_formats {
@@ -1348,6 +1349,73 @@ rkisp1_compand_compress_config(struct rkisp1_params *params,
 				       arg->x);
 }
 
+static void rkisp1_wdr_config(struct rkisp1_params *params,
+			      const struct rkisp1_cif_isp_wdr_config *arg)
+{
+	unsigned int i;
+	u32 value = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_WDR_CTRL);
+
+	/* Colorspace and chrominance mapping */
+	if (arg->use_rgb_colorspace)
+		value |= RKISP1_CIF_ISP_WDR_COLOR_SPACE_SELECT;
+	else
+		value &= ~RKISP1_CIF_ISP_WDR_COLOR_SPACE_SELECT;
+
+	if (!arg->use_rgb_colorspace && arg->bypass_chroma_mapping)
+		value |= RKISP1_CIF_ISP_WDR_CR_MAPPING_DISABLE;
+	else
+		value &= ~RKISP1_CIF_ISP_WDR_CR_MAPPING_DISABLE;
+
+	/* Illumination reference */
+	if (arg->use_iref) {
+		value = RKISP1_CIF_ISP_WDR_USE_IREF;
+
+		if (arg->iref_config.use_y9_8)
+			value |= RKISP1_CIF_ISP_WDR_USE_Y9_8;
+		else
+			value &= ~RKISP1_CIF_ISP_WDR_USE_Y9_8;
+
+		if (arg->iref_config.use_rgb7_8)
+			value |= RKISP1_CIF_ISP_WDR_USE_RGB7_8;
+		else
+			value &= ~RKISP1_CIF_ISP_WDR_USE_RGB7_8;
+
+		if (arg->iref_config.disable_transient)
+			value |= RKISP1_CIF_ISP_WDR_DISABLE_TRANSIENT;
+		else
+			value &= ~RKISP1_CIF_ISP_WDR_DISABLE_TRANSIENT;
+
+		value |= min_t(u8, arg->iref_config.rgb_factor,
+			       RKISP1_CIF_ISP_WDR_RGB_FACTOR_MAX)
+			 << RKISP1_CIF_ISP_WDR_RGB_FACTOR_SHIFT;
+	} else {
+		value &= ~RKISP1_CIF_ISP_WDR_USE_IREF;
+	}
+
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_CTRL, value);
+
+	/* RGB and Luminance offsets */
+	value = arg->rgb_offset & RKISP1_CIF_ISP_WDR_OFFSET_MASK;
+	value |= (arg->luma_offset & RKISP1_CIF_ISP_WDR_OFFSET_MASK)
+		 << RKISP1_CIF_ISP_WDR_LUM_OFFSET_SHIFT;
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_OFFSET, value);
+
+	/* DeltaMin */
+	value = arg->dmin_thresh & RKISP1_CIF_ISP_WDR_DMIN_THRESH_MASK;
+	value |= min_t(u8, arg->dmin_strength,
+		       RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MAX)
+		 << RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_SHIFT;
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_DELTAMIN, value);
+
+	/* Tone curve */
+	for (i = 0; i < RKISP1_CIF_ISP_WDR_CURVE_NUM_DY_REGS; i++)
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_TONECURVE(i),
+			     arg->tone_curve.dY[i]);
+	for (i = 0; i < RKISP1_CIF_ISP_WDR_CURVE_NUM_COEFF; i++)
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_TONECURVE_YM(i),
+			     arg->tone_curve.ym[i]);
+}
+
 static void
 rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 			    const struct rkisp1_params_cfg *new_params)
@@ -2005,6 +2073,25 @@ static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
 }
 
+static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
+				  const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_wdr_config *wdr = &block->wdr;
+
+	if (wdr->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_WDR_CTRL,
+					RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
+		return;
+	}
+
+	rkisp1_wdr_config(params, &wdr->config);
+
+	if ((wdr->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
+	    !(params->enabled_blocks & BIT(wdr->header.type)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_WDR_CTRL,
+				      RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
+}
+
 typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
 			     const union rkisp1_ext_params_config *config);
 
@@ -2118,6 +2205,11 @@ static const struct rkisp1_ext_params_handler {
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 		.features	= RKISP1_FEATURE_COMPAND,
 	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR] = {
+		.size		= sizeof(struct rkisp1_ext_params_wdr_config),
+		.handler	= rkisp1_ext_params_wdr,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
 };
 
 static void rkisp1_ext_params_config(struct rkisp1_params *params,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index bf0260600a1923eebde6b5fe233daf7d427362dd..31783617f39753a9b847b6612c9adf09c2ea8c99 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -710,6 +710,27 @@
 #define RKISP1_CIF_ISP_COMPAND_CTRL_SOFT_RESET_FLAG	BIT(2)
 #define RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE		BIT(3)
 
+/* WDR */
+/* ISP_WDR_CTRL */
+#define RKISP1_CIF_ISP_WDR_CTRL_ENABLE			BIT(0)
+#define RKISP1_CIF_ISP_WDR_COLOR_SPACE_SELECT		BIT(1)
+#define RKISP1_CIF_ISP_WDR_CR_MAPPING_DISABLE		BIT(2)
+#define RKISP1_CIF_ISP_WDR_USE_IREF			BIT(3)
+#define RKISP1_CIF_ISP_WDR_USE_Y9_8			BIT(4)
+#define RKISP1_CIF_ISP_WDR_USE_RGB7_8			BIT(5)
+#define RKISP1_CIF_ISP_WDR_DISABLE_TRANSIENT		BIT(6)
+#define RKISP1_CIF_ISP_WDR_RGB_FACTOR_SHIFT		8
+#define RKISP1_CIF_ISP_WDR_RGB_FACTOR_MAX		8
+/* ISP_WDR_TONE_CURVE_YM */
+#define RKISP1_CIF_ISP_WDR_TONE_CURVE_YM_MASK		GENMASK(12, 0)
+/* ISP_WDR_OFFSET */
+#define RKISP1_CIF_ISP_WDR_OFFSET_MASK			GENMASK(11, 0)
+#define RKISP1_CIF_ISP_WDR_LUM_OFFSET_SHIFT		16
+/* ISP_WDR_DELTAMIN */
+#define RKISP1_CIF_ISP_WDR_DMIN_THRESH_MASK		GENMASK(11, 0)
+#define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MAX		0x10
+#define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_SHIFT		16
+
 /* =================================================================== */
 /*                            CIF Registers                            */
 /* =================================================================== */
@@ -1302,82 +1323,12 @@
 
 #define RKISP1_CIF_ISP_WDR_BASE			0x00002a00
 #define RKISP1_CIF_ISP_WDR_CTRL			(RKISP1_CIF_ISP_WDR_BASE + 0x00000000)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_1		(RKISP1_CIF_ISP_WDR_BASE + 0x00000004)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_2		(RKISP1_CIF_ISP_WDR_BASE + 0x00000008)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_3		(RKISP1_CIF_ISP_WDR_BASE + 0x0000000c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_4		(RKISP1_CIF_ISP_WDR_BASE + 0x00000010)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_0	(RKISP1_CIF_ISP_WDR_BASE + 0x00000014)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_1	(RKISP1_CIF_ISP_WDR_BASE + 0x00000018)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_2	(RKISP1_CIF_ISP_WDR_BASE + 0x0000001c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_3	(RKISP1_CIF_ISP_WDR_BASE + 0x00000020)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_4	(RKISP1_CIF_ISP_WDR_BASE + 0x00000024)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_5	(RKISP1_CIF_ISP_WDR_BASE + 0x00000028)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_6	(RKISP1_CIF_ISP_WDR_BASE + 0x0000002c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_7	(RKISP1_CIF_ISP_WDR_BASE + 0x00000030)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_8	(RKISP1_CIF_ISP_WDR_BASE + 0x00000034)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_9	(RKISP1_CIF_ISP_WDR_BASE + 0x00000038)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_10	(RKISP1_CIF_ISP_WDR_BASE + 0x0000003c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_11	(RKISP1_CIF_ISP_WDR_BASE + 0x00000040)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_12	(RKISP1_CIF_ISP_WDR_BASE + 0x00000044)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_13	(RKISP1_CIF_ISP_WDR_BASE + 0x00000048)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_14	(RKISP1_CIF_ISP_WDR_BASE + 0x0000004c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_15	(RKISP1_CIF_ISP_WDR_BASE + 0x00000050)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_16	(RKISP1_CIF_ISP_WDR_BASE + 0x00000054)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_17	(RKISP1_CIF_ISP_WDR_BASE + 0x00000058)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_18	(RKISP1_CIF_ISP_WDR_BASE + 0x0000005c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_19	(RKISP1_CIF_ISP_WDR_BASE + 0x00000060)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_20	(RKISP1_CIF_ISP_WDR_BASE + 0x00000064)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_21	(RKISP1_CIF_ISP_WDR_BASE + 0x00000068)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_22	(RKISP1_CIF_ISP_WDR_BASE + 0x0000006c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_23	(RKISP1_CIF_ISP_WDR_BASE + 0x00000070)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_24	(RKISP1_CIF_ISP_WDR_BASE + 0x00000074)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_25	(RKISP1_CIF_ISP_WDR_BASE + 0x00000078)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_26	(RKISP1_CIF_ISP_WDR_BASE + 0x0000007c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_27	(RKISP1_CIF_ISP_WDR_BASE + 0x00000080)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_28	(RKISP1_CIF_ISP_WDR_BASE + 0x00000084)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_29	(RKISP1_CIF_ISP_WDR_BASE + 0x00000088)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_30	(RKISP1_CIF_ISP_WDR_BASE + 0x0000008c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31	(RKISP1_CIF_ISP_WDR_BASE + 0x00000090)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32	(RKISP1_CIF_ISP_WDR_BASE + 0x00000094)
+#define RKISP1_CIF_ISP_WDR_TONECURVE(n)		(RKISP1_CIF_ISP_WDR_BASE + 0x00000004 + (n) * 4)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM(n)	(RKISP1_CIF_ISP_WDR_BASE + 0x00000014 + (n) * 4)
 #define RKISP1_CIF_ISP_WDR_OFFSET		(RKISP1_CIF_ISP_WDR_BASE + 0x00000098)
 #define RKISP1_CIF_ISP_WDR_DELTAMIN		(RKISP1_CIF_ISP_WDR_BASE + 0x0000009c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_1_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000a0)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_2_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000a4)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_3_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000a8)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_4_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000ac)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_0_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000b0)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_1_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000b4)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_2_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000b8)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_3_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000bc)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_4_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000c0)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_5_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000c4)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_6_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000c8)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_7_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000cc)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_8_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000d0)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_9_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000d4)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_10_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000d8)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_11_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000dc)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_12_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000e0)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_13_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000e4)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_14_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000e8)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_15_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000ec)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_16_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000f0)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_17_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000f4)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_18_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000f8)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_19_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000fc)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_20_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000100)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_21_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000104)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_22_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000108)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_23_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000010c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_24_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000110)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_25_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000114)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_26_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000118)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_27_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000011c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_28_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000120)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_29_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000124)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_30_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000128)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000012c)
-#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000130)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_SHD(n)	(RKISP1_CIF_ISP_WDR_BASE + 0x000000a0 + (n) * 4)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_SHD(n)	(RKISP1_CIF_ISP_WDR_BASE + 0x000000b0 + (n) * 4)
 
 #define RKISP1_CIF_ISP_HIST_BASE_V12		0x00002c00
 #define RKISP1_CIF_ISP_HIST_CTRL_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000000)
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 430daceafac7056951be968f3b4d9cd50eb04e71..78f4f350119bd29b2ac50cba2dd7cf3b0e4a8416 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -169,6 +169,13 @@
  */
 #define RKISP1_CIF_ISP_COMPAND_NUM_POINTS	64
 
+/*
+ * Wide Dynamic Range
+ */
+#define RKISP1_CIF_ISP_WDR_CURVE_NUM_INTERV	32
+#define RKISP1_CIF_ISP_WDR_CURVE_NUM_COEFF	(RKISP1_CIF_ISP_WDR_CURVE_NUM_INTERV + 1)
+#define RKISP1_CIF_ISP_WDR_CURVE_NUM_DY_REGS	4
+
 /*
  * Measurement types
  */
@@ -889,6 +896,81 @@ struct rkisp1_cif_isp_compand_curve_config {
 	__u32 y[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
 };
 
+/**
+ * struct rkisp1_cif_isp_wdr_tone_curve - Tone mapping curve definition for WDR.
+ *
+ * @dY: the dYn increments for horizontal (input) axis of the tone curve.
+ *      each 3-bit dY value represents an increment of 2**(value+3).
+ *      dY[0] bits 0:2 is increment dY1, bit 3 unused
+ *      dY[0] bits 4:6 is increment dY2, bit 7 unused
+ *      ...
+ *      dY[0] bits 28:30 is increment dY8, bit 31 unused
+ *      ... and so on till dY[3] bits 28:30 is increment dY32, bit 31 unused.
+ * @ym: the Ym values for the vertical (output) axis of the tone curve.
+ *      each value is 13 bit.
+ *
+ * The reset values define a linear curve which has the same effect as bypass:
+ *
+ * dY[0..3] = 0x44444444, This means that input sample range of 0-4096 is
+ * divided in 32 equal increments of 2**(4+3) = 128 units
+ *
+ * ym[0] = 0x0000, ym[1] = 0x0080, ... ym[31] = 0x0f80, ym[32] = 0x1000
+ * which increases by 0x80 = 128 units
+ *
+ */
+struct rkisp1_cif_isp_wdr_tone_curve {
+	__u32 dY[RKISP1_CIF_ISP_WDR_CURVE_NUM_DY_REGS];
+	__u16 ym[RKISP1_CIF_ISP_WDR_CURVE_NUM_COEFF];
+};
+
+/**
+ * struct rkisp1_cif_isp_wdr_iref_config - Illumination reference config for WDR.
+ *
+ * Use illumination reference value as described below, instead of only the
+ * luminance (Y) value for tone mapping and gain calculations:
+ * IRef = (rgb_factor * RGBMax_tr + (8 - rgb_factor) * Y)/8
+ *
+ * @rgb_factor: defines how much influence the RGBmax approach has in
+ *              comparison to Y (valid values are 0..8).
+ * @use_y9_8: use Y*9/8 for maximum value calculation along with the
+ *            default of R, G, B for noise reduction.
+ * @use_rgb7_8: decrease RGBMax by 7/8 for noise reduction.
+ * @disable_transient: disable transient calculation between Y and RGBY_max.
+ */
+struct rkisp1_cif_isp_wdr_iref_config {
+	__u8 rgb_factor;
+	__u8 use_y9_8;
+	__u8 use_rgb7_8;
+	__u8 disable_transient;
+};
+
+/**
+ * struct rkisp1_cif_isp_wdr_config - Configuration for wide dynamic range.
+ *
+ * @tone_curve: tone mapping curve.
+ * @iref_config: illumination reference configuration. (when use_iref is true)
+ * @rgb_offset: RGB offset value for RGB operation mode. (12 bits)
+ * @luma_offset: luminance offset value for RGB operation mode. (12 bits)
+ * @dmin_thresh: lower threshold for deltaMin value. (12 bits)
+ * @dmin_strength: strength factor for deltaMin. (valid range is 0x00..0x10)
+ * @use_rgb_colorspace: use RGB instead of luminance/chrominance colorspace.
+ * @bypass_chroma_mapping: disable chrominance mapping (only valid if
+ *                         use_rgb_colorspace = 0)
+ * @use_iref: use illumination reference instead of Y for tone mapping
+ *            and gain calculations.
+ */
+struct rkisp1_cif_isp_wdr_config {
+	struct rkisp1_cif_isp_wdr_tone_curve tone_curve;
+	struct rkisp1_cif_isp_wdr_iref_config iref_config;
+	__u16 rgb_offset;
+	__u16 luma_offset;
+	__u16 dmin_thresh;
+	__u8 dmin_strength;
+	__u8 use_rgb_colorspace;
+	__u8 bypass_chroma_mapping;
+	__u8 use_iref;
+};
+
 /*---------- PART2: Measurement Statistics ------------*/
 
 /**
@@ -1059,6 +1141,7 @@ struct rkisp1_stat_buffer {
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS: BLS in the compand block
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress curve
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR: Wide dynamic range
  */
 enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
@@ -1081,6 +1164,7 @@ enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
 };
 
 #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
@@ -1460,6 +1544,23 @@ struct rkisp1_ext_params_compand_curve_config {
 	struct rkisp1_cif_isp_compand_curve_config config;
 } __attribute__((aligned(8)));
 
+/**
+ * struct rkisp1_ext_params_wdr_config - RkISP1 extensible params
+ *                                       Wide dynamic range config
+ *
+ * RkISP1 extensible parameters WDR block.
+ * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR`
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @config: WDR configuration, see
+ *	    :c:type:`rkisp1_cif_isp_wdr_config`
+ */
+struct rkisp1_ext_params_wdr_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_wdr_config config;
+} __attribute__((aligned(8)));
+
 /*
  * The rkisp1_ext_params_compand_curve_config structure is counted twice as it
  * is used for both the COMPAND_EXPAND and COMPAND_COMPRESS block types.

-- 
2.48.1


