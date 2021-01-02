Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431EC2E8086
	for <lists+linux-media@lfdr.de>; Thu, 31 Dec 2020 15:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgLaOa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Dec 2020 09:30:56 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:40871 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbgLaOaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Dec 2020 09:30:55 -0500
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3574C20000A;
        Thu, 31 Dec 2020 14:30:11 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: [PATCH v4 04/15] media: sun6i-csi: Use common V4L2 format info for storage bpp
Date:   Thu, 31 Dec 2020 15:29:37 +0100
Message-Id: <20201231142948.3241780-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 has a common helper which can be used for calculating the number
of stored bits per pixels of a given (stored) image format.

Use the helper-returned structure instead of our own switch/case list.
Note that a few formats are not in that list so we keep them as
special cases.

The custom switch/case was also wrong concerning 10/12-bit Bayer
formats, which are aligned to 16 bits in memory. Using the common
helper fixes it.

Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      | 55 +++++++------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index c626821aaedb..092445f04c60 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -86,53 +86,38 @@ void sun6i_csi_update_buf_addr(struct sun6i_csi *csi, dma_addr_t addr);
  */
 void sun6i_csi_set_stream(struct sun6i_csi *csi, bool enable);
 
-/* get bpp form v4l2 pixformat */
+/* get memory storage bpp from v4l2 pixformat */
 static inline int sun6i_csi_get_bpp(unsigned int pixformat)
 {
+	const struct v4l2_format_info *info;
+	unsigned int i;
+	int bpp = 0;
+
+	/* Handle special cases unknown to V4L2 format info first. */
 	switch (pixformat) {
-	case V4L2_PIX_FMT_SBGGR8:
-	case V4L2_PIX_FMT_SGBRG8:
-	case V4L2_PIX_FMT_SGRBG8:
-	case V4L2_PIX_FMT_SRGGB8:
 	case V4L2_PIX_FMT_JPEG:
 		return 8;
-	case V4L2_PIX_FMT_SBGGR10:
-	case V4L2_PIX_FMT_SGBRG10:
-	case V4L2_PIX_FMT_SGRBG10:
-	case V4L2_PIX_FMT_SRGGB10:
-		return 10;
-	case V4L2_PIX_FMT_SBGGR12:
-	case V4L2_PIX_FMT_SGBRG12:
-	case V4L2_PIX_FMT_SGRBG12:
-	case V4L2_PIX_FMT_SRGGB12:
 	case V4L2_PIX_FMT_HM12:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_YVU420:
 		return 12;
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_RGB565:
 	case V4L2_PIX_FMT_RGB565X:
 		return 16;
-	case V4L2_PIX_FMT_RGB24:
-	case V4L2_PIX_FMT_BGR24:
-		return 24;
-	case V4L2_PIX_FMT_RGB32:
-	case V4L2_PIX_FMT_BGR32:
-		return 32;
-	default:
+	}
+
+	info = v4l2_format_info(pixformat);
+	if (!info) {
 		WARN(1, "Unsupported pixformat: 0x%x\n", pixformat);
-		break;
+		return 0;
+	}
+
+	for (i = 0; i < info->comp_planes; i++) {
+		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
+		unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
+
+		/* We return bits per pixel while V4L2 format info is bytes. */
+		bpp += 8 * info->bpp[i] / hdiv / vdiv;
 	}
 
-	return 0;
+	return bpp;
 }
 
 #endif /* __SUN6I_CSI_H__ */
-- 
2.29.2

