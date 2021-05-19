Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F4C3883B9
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 02:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237171AbhESAY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 20:24:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60792 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbhESAY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 20:24:57 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81A5145E;
        Wed, 19 May 2021 02:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621383817;
        bh=cRw4b1DrjSLxNdY/lyr3LkOl/8VlGtxInKBCvumkRlE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rzrL+2jU3bYEEQhDqW53P64Z8crYosYSQ5mh8xuT6gonlCp9RyANBbxr9uT71o5Xn
         LbYIpx2XwC5JU/Ds+Z0CysQGNCYo2eusN17NkgOkXLr7h21MQwes6KW8Y/8fF6cyBh
         coi7A+2JtSaAng0YsG9DgCZLrXotFhtVBcr5C03g=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        linux-imx@nxp.com, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [RFC PATCH 2/3 v1.1] media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR for >= 10-bit formats
Date:   Wed, 19 May 2021 03:23:32 +0300
Message-Id: <20210519002332.10406-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <CBFG1V17RJK2.2Q6JTIOSUD8ML@arch-thunder>
References: <CBFG1V17RJK2.2Q6JTIOSUD8ML@arch-thunder>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sample code from NXP, as well as experiments on i.MX8MM with RAW10
capture with an OV5640 sensor connected over CSI-2, showed that the
TWO_8BIT_SENSOR field of the CSICR3 register needs to be set for formats
larger than 8 bits. Do so, even if the reference manual doesn't clearly
describe the effect of the field.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Initialize cr3 to BIT_FRMCNT_RST
---
 drivers/staging/media/imx/imx7-media-csi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index f85a2f5f1413..5ae9ed1849e9 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -421,6 +421,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 	struct v4l2_pix_format *out_pix = &vdev->fmt;
 	int width = out_pix->width;
 	u32 stride = 0;
+	u32 cr3 = BIT_FRMCNT_RST;
 	u32 cr1, cr18;
 
 	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
@@ -464,6 +465,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 		case MEDIA_BUS_FMT_SGBRG10_1X10:
 		case MEDIA_BUS_FMT_SGRBG10_1X10:
 		case MEDIA_BUS_FMT_SRGGB10_1X10:
+			cr3 |= BIT_TWO_8BIT_SENSOR;
 			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
 			break;
 		case MEDIA_BUS_FMT_Y12_1X12:
@@ -471,6 +473,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 		case MEDIA_BUS_FMT_SGBRG12_1X12:
 		case MEDIA_BUS_FMT_SGRBG12_1X12:
 		case MEDIA_BUS_FMT_SRGGB12_1X12:
+			cr3 |= BIT_TWO_8BIT_SENSOR;
 			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
 			break;
 		case MEDIA_BUS_FMT_Y14_1X14:
@@ -478,6 +481,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 		case MEDIA_BUS_FMT_SGBRG14_1X14:
 		case MEDIA_BUS_FMT_SGRBG14_1X14:
 		case MEDIA_BUS_FMT_SRGGB14_1X14:
+			cr3 |= BIT_TWO_8BIT_SENSOR;
 			cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
 			break;
 		/*
@@ -510,7 +514,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 
 	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
 	imx7_csi_reg_write(csi, BIT_DMA_BURST_TYPE_RFF_INCR16, CSI_CSICR2);
-	imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
+	imx7_csi_reg_write(csi, cr3, CSI_CSICR3);
 	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
 
 	imx7_csi_reg_write(csi, (width * out_pix->height) >> 2, CSI_CSIRXCNT);
-- 
Regards,

Laurent Pinchart

