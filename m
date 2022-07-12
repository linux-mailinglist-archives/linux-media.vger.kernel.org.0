Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9735A570E8D
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 02:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiGLADn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 20:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiGLADf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 20:03:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B35BAA
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 17:03:32 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 741011381;
        Tue, 12 Jul 2022 02:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657584206;
        bh=Lq+YZgkv3OzOOxMqLZm8rU2vBQQrXUCKRJJ8V0NMTeo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YC1oSUU3+rOFYAW2SceT6/mciEjYKYWGFBPKMNuuBCCa9IpFee1A5a8oZ3gbNKPv7
         uvXtIDeakf5JukJattV9zjxvnkxSY1H/y0C/6l2efa/CpEl+k+gQ9LuZJf94K77D8N
         +tFxEr8W6rsioPG1S7fCLPjl62zBLEZgxAE79pBw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v2 5/7] media: v4l2: Sanitize colorspace values in the framework
Date:   Tue, 12 Jul 2022 03:02:49 +0300
Message-Id: <20220712000251.13607-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
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
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 65 +++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 18ed2227255a..24b5968e8f32 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1008,6 +1008,31 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
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
@@ -1027,20 +1052,40 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
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

