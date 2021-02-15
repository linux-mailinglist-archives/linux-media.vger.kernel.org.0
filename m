Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FF131B4BB
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhBOEhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:37:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhBOEhC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:37:02 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 759B81AC7;
        Mon, 15 Feb 2021 05:28:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363328;
        bh=4hz7iAcM/NPeYAS37JD+qMmFF+mtP81yLZT43kTMdso=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h9KwZh+4ds4Ek0LDA/zw3xn73htMFdUgkhQOXMk7NOV0KIrK3dy9qXxozknYc8NUt
         6n5bYE7TWjXDW9eChegEIB4jZrp+T2BNJmmWabgGZOIBjVgy5Ss/Ju4j0h0XvsdiAu
         vfYUk4U7exYMVVzLYKMI8VC+ogdLkLWiZE41MvVk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 48/77] media: imx: imx7-media-csi: Clear all configurable CSICR18 fields
Date:   Mon, 15 Feb 2021 06:27:12 +0200
Message-Id: <20210215042741.28850-49-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When configuring the CSI in imx7_csi_configure(), the CSICR18 is set
through a read-modify-write cycle to avoid affecting fields whose usage
isn't clear. The function then sets fields depending on whether the
input is interlaced or progressive, and from the parallel input or the
CSI-2 receiver.

Those bits are only set and never cleared. For instance, when switching
from a CSI-2 source to the parallel input, the BIT_DATA_FROM_MIPI will
stay set. Fix this issue by first clearing all the fields we need to
configure.

Add BIT_CSI_HW_ENABLE to the set of fields being cleared, as the CSI
needs to start in the disabled state. This allows dropping the call to
imx7_csi_hw_disable() in imx7_csi_sw_reset().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 9c1e4c8754e2..ea14195e6c7f 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -333,8 +333,6 @@ static void imx7_csi_dmareq_rff_disable(struct imx7_csi *csi)
 
 static void imx7_csi_sw_reset(struct imx7_csi *csi)
 {
-	imx7_csi_hw_disable(csi);
-
 	imx7_csi_rx_fifo_clear(csi);
 
 	imx7_csi_dma_reflash(csi);
@@ -451,17 +449,19 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 	struct imx_media_video_dev *vdev = csi->vdev;
 	struct v4l2_pix_format *out_pix = &vdev->fmt;
 	int width = out_pix->width;
+	u32 stride = 0;
 	u32 cr1, cr18;
-	u32 stride;
 
 	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
 
+	cr18 &= ~(BIT_CSI_HW_ENABLE | BIT_MIPI_DATA_FORMAT_MASK |
+		  BIT_DATA_FROM_MIPI | BIT_BASEADDR_CHG_ERR_EN |
+		  BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
+		  BIT_DEINTERLACE_EN);
+
 	if (out_pix->field == V4L2_FIELD_INTERLACED) {
 		cr18 |= BIT_DEINTERLACE_EN;
 		stride = out_pix->width;
-	} else {
-		cr18 &= ~BIT_DEINTERLACE_EN;
-		stride = 0;
 	}
 
 	if (!csi->is_csi2) {
@@ -478,7 +478,6 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FCC
 		    | BIT_MCLKDIV(1) | BIT_MCLKEN;
 
-		cr18 &= BIT_MIPI_DATA_FORMAT_MASK;
 		cr18 |= BIT_DATA_FROM_MIPI;
 
 		switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
-- 
Regards,

Laurent Pinchart

