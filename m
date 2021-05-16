Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54AF2381C20
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhEPCnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:43:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35834 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbhEPCnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:43:52 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFA1A9DF;
        Sun, 16 May 2021 04:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621132951;
        bh=zmZgzMgfdUnOLBKmT5LsykPM2XfK7ywnzC0N7pI57XY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BqdsdernYAotswjlp/21rWHjiZOS367KUZtJMhWlxTdE078QNZhkBNlFGdM9w3X2c
         V6pFTsaEI4cEGxFy9VDCOLgUOpp6SDdZ5fetfdxyTFqkyLPBC2V2+KvmIwdohYpdRI
         SlugRoYiChb3RHqK6dr74H18DV0vk2+O3WiVLkL0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Subject: [RFC PATCH 2/3] media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR for >= 10-bit formats
Date:   Sun, 16 May 2021 05:42:15 +0300
Message-Id: <20210516024216.4576-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
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
 drivers/staging/media/imx/imx7-media-csi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index f85a2f5f1413..256b9aa978f0 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -422,6 +422,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 	int width = out_pix->width;
 	u32 stride = 0;
 	u32 cr1, cr18;
+	u32 cr3 = 0;
 
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
+	imx7_csi_reg_write(csi, BIT_FRMCNT_RST | cr3, CSI_CSICR3);
 	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
 
 	imx7_csi_reg_write(csi, (width * out_pix->height) >> 2, CSI_CSIRXCNT);
-- 
Regards,

Laurent Pinchart

