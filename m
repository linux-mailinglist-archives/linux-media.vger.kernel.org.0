Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346A133D372
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbhCPL5y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:57:54 -0400
Received: from comms.puri.sm ([159.203.221.185]:42016 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237527AbhCPL5i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:57:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 1ABE2E0212;
        Tue, 16 Mar 2021 04:57:03 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yhF5nxxlS_fX; Tue, 16 Mar 2021 04:57:01 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, festevam@gmail.com,
        linux-media@vger.kernel.org, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, slongerbeam@gmail.com,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH] imx7-media-csi: csi2 only
Date:   Tue, 16 Mar 2021 12:56:35 +0100
Message-Id: <20210316115635.4096574-1-martin.kepplinger@puri.sm>
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

---

hi Laurent,

thanks a lot for posting this series!

First: I only test imx7-media-csi (csi bridge) because I run it on imx8mq.
overall, I'm very happy with all of this and I get the same image out
of it as I get with the mx6s_capture nxp driver.

one issue I have is with is_csi2, so I post this patch that I need in
order to test. It's obviously no solution, just to describe the issue:

I'm not sure why but imx7_csi_pad_link_validate() isn't called in my case
and is_csi2 doesn't get set, so I force it. Would it make sense to make
a dts property for this?

The other thing is that
v4l2-ctl --set-fmt-video=width=1280,height=720,pixelformat=0
doesn't call the sensor drivers' set_fmt() pad function. That means that
only the one mode I hard-code as default will work. instead I just see this:

[  742.977677] imx7-csi 30a90000.csi1_bridge: begin graph walk at 'csi capture'
[  742.977702] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi' on stack
[  742.977709] imx7-csi 30a90000.csi1_bridge: walk: skipping entity 'csi capture' (already seen)
[  742.977714] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi'
[  742.977720] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi capture'
[  742.977985] imx7-csi 30a90000.csi1_bridge: begin graph walk at 'csi capture'
[  742.977992] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi' on stack
[  742.977997] imx7-csi 30a90000.csi1_bridge: walk: skipping entity 'csi capture' (already seen)
[  742.978002] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi'
[  742.978008] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi capture'
[  742.978025] mc: media_release: Media Release

Does anything come to your mind that would prevent the set_fmt call here?
That's what the (nxp) mipi driver looks like I'm running here:
https://source.puri.sm/martin.kepplinger/linux-next/-/blob/5.12-rc3/librem5__integration_byzantium/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c

                             martin


 drivers/staging/media/imx/imx7-media-csi.c | 135 +++++++++------------
 1 file changed, 60 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 56b92ba97d25..95c359019725 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -435,82 +435,67 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 		stride = out_pix->width;
 	}
 
-	if (!csi->is_csi2) {
-		dev_dbg(csi->dev, "%s: NOT is_csi2\n", __func__);
-		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_GCLK_MODE | BIT_HSYNC_POL
-		    | BIT_FCC | BIT_MCLKDIV(1) | BIT_MCLKEN;
-
-		cr18 |= BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
-			BIT_BASEADDR_CHG_ERR_EN;
-
-		if (out_pix->pixelformat == V4L2_PIX_FMT_UYVY ||
-		    out_pix->pixelformat == V4L2_PIX_FMT_YUYV)
-			width *= 2;
-	} else {
-		dev_dbg(csi->dev, "%s: is_csi2\n", __func__);
-
-		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FCC
-		    | BIT_MCLKDIV(1) | BIT_MCLKEN;
-
-		cr18 |= BIT_DATA_FROM_MIPI;
-
-		switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
-		case MEDIA_BUS_FMT_Y8_1X8:
-		case MEDIA_BUS_FMT_SBGGR8_1X8:
-		case MEDIA_BUS_FMT_SGBRG8_1X8:
-		case MEDIA_BUS_FMT_SGRBG8_1X8:
-		case MEDIA_BUS_FMT_SRGGB8_1X8:
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
-			break;
-		case MEDIA_BUS_FMT_Y10_1X10:
-		case MEDIA_BUS_FMT_SBGGR10_1X10:
-		case MEDIA_BUS_FMT_SGBRG10_1X10:
-		case MEDIA_BUS_FMT_SGRBG10_1X10:
-		case MEDIA_BUS_FMT_SRGGB10_1X10:
-			dev_dbg(csi->dev, "%s: RAW10\n", __func__);
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
-			break;
-		case MEDIA_BUS_FMT_Y12_1X12:
-		case MEDIA_BUS_FMT_SBGGR12_1X12:
-		case MEDIA_BUS_FMT_SGBRG12_1X12:
-		case MEDIA_BUS_FMT_SGRBG12_1X12:
-		case MEDIA_BUS_FMT_SRGGB12_1X12:
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
-			break;
-		case MEDIA_BUS_FMT_Y14_1X14:
-		case MEDIA_BUS_FMT_SBGGR14_1X14:
-		case MEDIA_BUS_FMT_SGBRG14_1X14:
-		case MEDIA_BUS_FMT_SGRBG14_1X14:
-		case MEDIA_BUS_FMT_SRGGB14_1X14:
-			cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
-			break;
-		/*
-		 * CSI-2 sources are supposed to use the 1X16 formats, but not
-		 * all of them comply. Support both variants.
-		 */
-		case MEDIA_BUS_FMT_UYVY8_2X8:
-		case MEDIA_BUS_FMT_UYVY8_1X16:
-		case MEDIA_BUS_FMT_YUYV8_2X8:
-		case MEDIA_BUS_FMT_YUYV8_1X16:
-			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
-			break;
-		}
+	cr1 = BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FCC
+	    | BIT_MCLKDIV(1) | BIT_MCLKEN;
+
+	cr18 |= BIT_DATA_FROM_MIPI;
+
+	switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
+	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
+		break;
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		dev_dbg(csi->dev, "%s: RAW10\n", __func__);
+		cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
+		break;
+	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
+		break;
+	case MEDIA_BUS_FMT_Y14_1X14:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
+		break;
+	/*
+	 * CSI-2 sources are supposed to use the 1X16 formats, but not
+	 * all of them comply. Support both variants.
+	 */
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
+		break;
+	}
 
-		switch (out_pix->pixelformat) {
-		case V4L2_PIX_FMT_Y10:
-		case V4L2_PIX_FMT_Y12:
-		case V4L2_PIX_FMT_SBGGR8:
-		case V4L2_PIX_FMT_SGBRG8:
-		case V4L2_PIX_FMT_SGRBG8:
-		case V4L2_PIX_FMT_SRGGB8:
-		case V4L2_PIX_FMT_SBGGR16:
-		case V4L2_PIX_FMT_SGBRG16:
-		case V4L2_PIX_FMT_SGRBG16:
-		case V4L2_PIX_FMT_SRGGB16:
-			dev_dbg(csi->dev, "%s: PIXEL_BIT\n", __func__);
-			cr1 |= BIT_PIXEL_BIT;
-			break;
-		}
+	switch (out_pix->pixelformat) {
+	case V4L2_PIX_FMT_Y10:
+	case V4L2_PIX_FMT_Y12:
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SBGGR16:
+	case V4L2_PIX_FMT_SGBRG16:
+	case V4L2_PIX_FMT_SGRBG16:
+	case V4L2_PIX_FMT_SRGGB16:
+		dev_dbg(csi->dev, "%s: PIXEL_BIT\n", __func__);
+		cr1 |= BIT_PIXEL_BIT;
+		break;
 	}
 
 	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
-- 
2.30.1

