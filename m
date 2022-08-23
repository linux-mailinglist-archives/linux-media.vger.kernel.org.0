Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8BC659EB90
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 20:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbiHWSyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 14:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbiHWSy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 14:54:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825C6816B9
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:20:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 256C0EF2;
        Tue, 23 Aug 2022 19:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661275135;
        bh=PEo66cr/iALjZ+PwUPkXm9qqrciKduhUGDqzHmg7kuM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=loY8MvXHngDVOLL9FS5d3IuGTGTCtCxQb+L89n0ydoLH8ezrSdRSAO74Y8B9IT7gm
         7K6JB/8f2on8jAOIwtCfGsoO7xVU451FQVxqbwwmlMudrcl3i+4QTeuQVH4kzawe+n
         +dcUX8HvqSbq7kCjuVJNL2MjEgFGm5jw69FS5nVA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 7/9] media: rkisp1: Configure CSM based on YCbCr encoding
Date:   Tue, 23 Aug 2022 20:18:38 +0300
Message-Id: <20220823171840.8958-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver currently only implements the Rec. 601 YCbCr encoding, extend
it with support for the other encodings defined by V4L2 (Rec. 709, Rec.
2020 and SMPTE240m). The coefficients have been calculated by rounding
the floating point values to the nearest Q1.7 fixed-point value,
adjusting the rounding to ensure that the sum of each line in the matrix
is preserved to avoid overflows.

At the hardware level, the RGB to YUV conversion matrix is fully
configurable, custom encoding could be supported by extending the ISP
parameters if desired.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  5 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  3 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 97 +++++++++++++++----
 3 files changed, 84 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 589999020a16..1383c13e22b8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -393,6 +393,7 @@ struct rkisp1_params {
 	struct v4l2_format vdev_fmt;
 
 	enum v4l2_quantization quantization;
+	enum v4l2_ycbcr_encoding ycbcr_encoding;
 	enum rkisp1_fmt_raw_pat_type raw_type;
 };
 
@@ -595,10 +596,12 @@ const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_code(u32 mbus_code);
  * @params:	  pointer to rkisp1_params.
  * @bayer_pat:	  the bayer pattern on the isp video sink pad
  * @quantization: the quantization configured on the isp's src pad
+ * @ycbcr_encoding: the ycbcr_encoding configured on the isp's src pad
  */
 void rkisp1_params_configure(struct rkisp1_params *params,
 			     enum rkisp1_fmt_raw_pat_type bayer_pat,
-			     enum v4l2_quantization quantization);
+			     enum v4l2_quantization quantization,
+			     enum v4l2_ycbcr_encoding ycbcr_encoding);
 
 /* rkisp1_params_disable - disable all parameters.
  *			   This function is called by the isp entity upon stream start
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index babf88066c2e..20c01e0e2e17 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -344,7 +344,8 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 						 RKISP1_ISP_PAD_SOURCE_VIDEO,
 						 V4L2_SUBDEV_FORMAT_ACTIVE);
 		rkisp1_params_configure(&rkisp1->params, sink_fmt->bayer_pat,
-					src_frm->quantization);
+					src_frm->quantization,
+					src_frm->ycbcr_enc);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 163419624370..246a6faa1fc1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1078,37 +1078,94 @@ static void rkisp1_ie_enable(struct rkisp1_params *params, bool en)
 
 static void rkisp1_csm_config(struct rkisp1_params *params)
 {
-	static const u16 full_range_coeff[] = {
-		0x0026, 0x004b, 0x000f,
-		0x01ea, 0x01d6, 0x0040,
-		0x0040, 0x01ca, 0x01f6
+	struct csm_coeffs {
+		u16 limited[9];
+		u16 full[9];
 	};
-	static const u16 limited_range_coeff[] = {
-		0x0021, 0x0040, 0x000d,
-		0x01ed, 0x01db, 0x0038,
-		0x0038, 0x01d1, 0x01f7,
+	static const struct csm_coeffs rec601_coeffs = {
+		.limited = {
+			0x0021, 0x0042, 0x000d,
+			0x01ed, 0x01db, 0x0038,
+			0x0038, 0x01d1, 0x01f7,
+		},
+		.full = {
+			0x0026, 0x004b, 0x000f,
+			0x01ea, 0x01d6, 0x0040,
+			0x0040, 0x01ca, 0x01f6,
+		},
 	};
+	static const struct csm_coeffs rec709_coeffs = {
+		.limited = {
+			0x0018, 0x0050, 0x0008,
+			0x01f3, 0x01d5, 0x0038,
+			0x0038, 0x01cd, 0x01fb,
+		},
+		.full = {
+			0x001b, 0x005c, 0x0009,
+			0x01f1, 0x01cf, 0x0040,
+			0x0040, 0x01c6, 0x01fa,
+		},
+	};
+	static const struct csm_coeffs rec2020_coeffs = {
+		.limited = {
+			0x001d, 0x004c, 0x0007,
+			0x01f0, 0x01d8, 0x0038,
+			0x0038, 0x01cd, 0x01fb,
+		},
+		.full = {
+			0x0022, 0x0057, 0x0008,
+			0x01ee, 0x01d2, 0x0040,
+			0x0040, 0x01c5, 0x01fb,
+		},
+	};
+	static const struct csm_coeffs smpte240m_coeffs = {
+		.limited = {
+			0x0018, 0x004f, 0x000a,
+			0x01f3, 0x01d5, 0x0038,
+			0x0038, 0x01ce, 0x01fa,
+		},
+		.full = {
+			0x001b, 0x005a, 0x000b,
+			0x01f1, 0x01cf, 0x0040,
+			0x0040, 0x01c7, 0x01f9,
+		},
+	};
+
+	const struct csm_coeffs *coeffs;
+	const u16 *csm;
 	unsigned int i;
 
+	switch (params->ycbcr_encoding) {
+	case V4L2_YCBCR_ENC_601:
+	default:
+		coeffs = &rec601_coeffs;
+		break;
+	case V4L2_YCBCR_ENC_709:
+		coeffs = &rec709_coeffs;
+		break;
+	case V4L2_YCBCR_ENC_BT2020:
+		coeffs = &rec2020_coeffs;
+		break;
+	case V4L2_YCBCR_ENC_SMPTE240M:
+		coeffs = &smpte240m_coeffs;
+		break;
+	}
+
 	if (params->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
-		for (i = 0; i < ARRAY_SIZE(full_range_coeff); i++)
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_CC_COEFF_0 + i * 4,
-				     full_range_coeff[i]);
-
+		csm = coeffs->full;
 		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
 				      RKISP1_CIF_ISP_CTRL_ISP_CSM_Y_FULL_ENA |
 				      RKISP1_CIF_ISP_CTRL_ISP_CSM_C_FULL_ENA);
 	} else {
-		for (i = 0; i < ARRAY_SIZE(limited_range_coeff); i++)
-			rkisp1_write(params->rkisp1,
-				     RKISP1_CIF_ISP_CC_COEFF_0 + i * 4,
-				     limited_range_coeff[i]);
-
+		csm = coeffs->limited;
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
 					RKISP1_CIF_ISP_CTRL_ISP_CSM_Y_FULL_ENA |
 					RKISP1_CIF_ISP_CTRL_ISP_CSM_C_FULL_ENA);
 	}
+
+	for (i = 0; i < 9; i++)
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CC_COEFF_0 + i * 4,
+			     csm[i]);
 }
 
 /* ISP De-noise Pre-Filter(DPF) function */
@@ -1574,9 +1631,11 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
 
 void rkisp1_params_configure(struct rkisp1_params *params,
 			     enum rkisp1_fmt_raw_pat_type bayer_pat,
-			     enum v4l2_quantization quantization)
+			     enum v4l2_quantization quantization,
+			     enum v4l2_ycbcr_encoding ycbcr_encoding)
 {
 	params->quantization = quantization;
+	params->ycbcr_encoding = ycbcr_encoding;
 	params->raw_type = bayer_pat;
 	rkisp1_params_config_parameter(params);
 }
-- 
Regards,

Laurent Pinchart

