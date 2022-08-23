Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07DFD59EB84
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 20:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbiHWSyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 14:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiHWSxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 14:53:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC53E1142
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:19:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 455636BB;
        Tue, 23 Aug 2022 19:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661275128;
        bh=dpRQoQdidwsPDR2uIIecPAZtZqaBPiziKux6rvilmys=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gdu7QqWoyzEVt/xGlp0het0DkeCBsTQXiT5wVn+VKoxNwlxxyGcyDXVoFZ7BE+itM
         Ujg3npeLKScHmatkuY8+2fAZoGq43HbTbuHkN/tsKk9rBnHFT+CvHVGDDmBKZ+yExC
         4oc1Z6sH+yA1WRc8DTKZ60c0VjREPETBuJtu1+L0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 2/9] media: rkisp1: Allow setting color space on ISP sink pad
Date:   Tue, 23 Aug 2022 20:18:33 +0300
Message-Id: <20220823171840.8958-3-laurent.pinchart@ideasonboard.com>
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

The ISP accepts different color spaces on its input: for YUV input, it
doesn't set any restrictions, and for Bayer inputs, any color primaries
or transfer function can be accepted (YCbCr encoding isn't applicable
there, and quantization range can only be full).

Allow setting a color space on the ISP sink pad, with the aforementioned
restrictions. The settings don't influence hardware yet (only the YUV
quantization range will, anything else has no direct effect on the ISP
configuration), but can already be set to allow color space information
to be coherent across the ISP sink link.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Fix swapped default color spaces for YUV and Bayer
- Improve coherency in usage of ternary operator ? :
---
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index a52b22824739..b5bdf427c7e1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -705,6 +705,7 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 	const struct rkisp1_mbus_info *mbus_info;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_rect *sink_crop;
+	bool is_yuv;
 
 	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
 					  RKISP1_ISP_PAD_SINK_VIDEO,
@@ -725,6 +726,36 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 				   RKISP1_ISP_MIN_HEIGHT,
 				   RKISP1_ISP_MAX_HEIGHT);
 
+	/*
+	 * Adjust the color space fields. Accept any color primaries and
+	 * transfer function for both YUV and Bayer. For YUV any YCbCr encoding
+	 * and quantization range is also accepted. For Bayer formats, the YCbCr
+	 * encoding isn't applicable, and the quantization range can only be
+	 * full.
+	 */
+	is_yuv = mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV;
+
+	sink_fmt->colorspace = format->colorspace ? :
+			       (is_yuv ? V4L2_COLORSPACE_SRGB :
+				V4L2_COLORSPACE_RAW);
+	sink_fmt->xfer_func = format->xfer_func ? :
+			      V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
+	if (is_yuv) {
+		sink_fmt->ycbcr_enc = format->ycbcr_enc ? :
+			V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
+		sink_fmt->quantization = format->quantization ? :
+			V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
+						      sink_fmt->ycbcr_enc);
+	} else {
+		/*
+		 * The YCbCr encoding isn't applicable for non-YUV formats, but
+		 * V4L2 has no "no encoding" value. Hardcode it to Rec. 601, it
+		 * should be ignored by userspace.
+		 */
+		sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+		sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	}
+
 	*format = *sink_fmt;
 
 	/* Propagate to in crop */
-- 
Regards,

Laurent Pinchart

