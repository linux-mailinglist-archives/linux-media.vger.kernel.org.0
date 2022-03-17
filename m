Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2440D4DC8DC
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 15:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbiCQOim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 10:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235131AbiCQOil (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 10:38:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C225C1D66CD
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 07:37:24 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DAE948F;
        Thu, 17 Mar 2022 15:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647527841;
        bh=EiHK/2QtNkkncFLVJhxK3TLugudz6hQS4BikZ+iIUaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LUECFsCqysqHZyg1NZbrSpaKHLGehV/bZeCoyuXlE9KWQazfUI0DY5cUyl5FMPUBU
         sP/6VPEaoIx7oef7uME4WFuP0skzdAamFsIe/clld01fkp/smNz/C/aBCF1+bhmjVO
         CBztRHkVIIzhWEIHEIBp0+e0ZaACzDzVnFsc5RYU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 2/2] media: v4l2: Sanitize colorspace values in the framework
Date:   Thu, 17 Mar 2022 16:37:00 +0200
Message-Id: <20220317143700.12769-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317143700.12769-1-laurent.pinchart@ideasonboard.com>
References: <20220317143700.12769-1-laurent.pinchart@ideasonboard.com>
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

Extend the format sanitization code in the framework to handle invalid
values for the colorspace-related fields.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 65 +++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4fe3f21f8bb4..01cfd3442ba5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1006,6 +1006,31 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 	return -EINVAL;
 }
 
+static void v4l_sanitize_colorspace(u32 pixelformat, u32 *colorspace,
+				    u32 *encoding, u32 *quantization,
+				    u32 *xfer_func)
+{
+	bool is_hsv = pixelformat == V4L2_PIX_FMT_HSV24 ||
+		      pixelformat == V4L2_PIX_FMT_HSV32;
+
+	if (!v4l2_is_colorspace_valid(*colorspace)) {
+		*colorspace = V4L2_COLORSPACE_DEFAULT;
+		*encoding = V4L2_YCBCR_ENC_DEFAULT;
+		*quantization = V4L2_QUANTIZATION_DEFAULT;
+		*xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	}
+
+	if ((!is_hsv && !v4l2_is_ycbcr_enc_valid(*encoding)) ||
+	    (is_hsv && !v4l2_is_hsv_enc_valid(*encoding)))
+		*encoding = V4L2_YCBCR_ENC_DEFAULT;
+
+	if (!v4l2_is_quant_valid(*quantization))
+		*quantization = V4L2_QUANTIZATION_DEFAULT;
+
+	if (!v4l2_is_xfer_func_valid(*xfer_func))
+		*xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
 static void v4l_sanitize_format(struct v4l2_format *fmt)
 {
 	unsigned int offset;
@@ -1025,20 +1050,40 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
 	 * field to the magic value when the extended pixel format structure
 	 * isn't used by applications.
 	 */
+	if (fmt->type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	    fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		if (fmt->fmt.pix.priv != V4L2_PIX_FMT_PRIV_MAGIC) {
+			fmt->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
 
-	if (fmt->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
-	    fmt->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
-		return;
+			offset = offsetof(struct v4l2_pix_format, priv)
+			       + sizeof(fmt->fmt.pix.priv);
+			memset(((void *)&fmt->fmt.pix) + offset, 0,
+			       sizeof(fmt->fmt.pix) - offset);
+		}
+	}
 
-	if (fmt->fmt.pix.priv == V4L2_PIX_FMT_PRIV_MAGIC)
-		return;
+	/* Replace invalid colorspace values with defaults. */
+	if (fmt->type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+	    fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		v4l_sanitize_colorspace(fmt->fmt.pix.pixelformat,
+					&fmt->fmt.pix.colorspace,
+					&fmt->fmt.pix.ycbcr_enc,
+					&fmt->fmt.pix.quantization,
+					&fmt->fmt.pix.xfer_func);
+	} else if (fmt->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
+		   fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		u32 ycbcr_enc = fmt->fmt.pix_mp.ycbcr_enc;
+		u32 quantization = fmt->fmt.pix_mp.quantization;
+		u32 xfer_func = fmt->fmt.pix_mp.xfer_func;
 
-	fmt->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+		v4l_sanitize_colorspace(fmt->fmt.pix_mp.pixelformat,
+					&fmt->fmt.pix_mp.colorspace, &ycbcr_enc,
+					&quantization, &xfer_func);
 
-	offset = offsetof(struct v4l2_pix_format, priv)
-	       + sizeof(fmt->fmt.pix.priv);
-	memset(((void *)&fmt->fmt.pix) + offset, 0,
-	       sizeof(fmt->fmt.pix) - offset);
+		fmt->fmt.pix_mp.ycbcr_enc = ycbcr_enc;
+		fmt->fmt.pix_mp.quantization = quantization;
+		fmt->fmt.pix_mp.xfer_func = xfer_func;
+	}
 }
 
 static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
-- 
Regards,

Laurent Pinchart

