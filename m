Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09625381C24
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbhEPCnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:43:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35836 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232339AbhEPCnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:43:52 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1717B2B;
        Sun, 16 May 2021 04:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621132952;
        bh=DmkdxJTLbHMXO2sVLsvE86kHiRszT73Fv/Wjf2n85ao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bcV+6H6Qh3SPiDA6MMYrymMhQUcZRAib2gFepN5xdMMNx2uhYy3zQ2WeMWYZi6qIn
         uz+bEySZlaI3AIlcHhaPzFLA4Ru7h4IjeMCtAr4NjSzXIEgOBRId9jp05DO3x8pF04
         cwv427S0Tfx886mjoX3i7FDqZLf6txWWMNm3Q/Ok=
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
Subject: [RFC PATCH 3/3] media: imx: imx7-media-csi: Don't set PIXEL_BIT in CSICR1
Date:   Sun, 16 May 2021 05:42:16 +0300
Message-Id: <20210516024216.4576-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PIXEL_BIT field of the CSICR1 register is documented as setting the
Bayer data width to 10 bits, and is set by the driver for all non-YUV
pixel formats. Test code from NXP showed that the bit shouldn't be set
for Bayer formats, and this was confirmed by experimentation with RAW8
capture (which doesn't work when setting the field) and RAW10 capture
(for which setting the field doesn't seem to make a difference) on
i.MX8MM with an OV5640 sensor connected over CSI-2. Don't set it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 256b9aa978f0..94ee8d9838ee 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -495,21 +495,6 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
 			break;
 		}
-
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
-			cr1 |= BIT_PIXEL_BIT;
-			break;
-		}
 	}
 
 	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
-- 
Regards,

Laurent Pinchart

