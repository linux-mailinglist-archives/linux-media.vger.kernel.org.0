Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A8C2EAEC7
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbhAEPiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:38:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbhAEPiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:38:02 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 428A51BDF;
        Tue,  5 Jan 2021 16:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860613;
        bh=AZnPZwjS42ZFXpz0QMKutJqIstS52y4u0obMeZBmJdY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GuyLIYeqlfOs9nhTmbPWYYoK1zovWWcgJUzf+TnOLMTgD2w4ErWUZheNlAXcbbyFn
         xPrJiNTfbmx4+NiwhMiO5A1dsv3I9hta9oje1ip65pfUa+cTVrOPHacmi1Q0H3bZUb
         wWnDqHeZluDm2vuR/s/4S/Rh/m4rm2TMFYyHt9jo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 54/75] media: imx: imx7_media-csi: Add support for additional Bayer patterns
Date:   Tue,  5 Jan 2021 17:28:31 +0200
Message-Id: <20210105152852.5733-55-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI driver only supports the BGGR Bayer patterns currently. The
hardware supports all patterns (the only pattern-dependent hardware
operation is statistics calculation, as de-bayering isn't supported),
enable them in the driver too.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b13c4c17382c..a0397dd06b95 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -496,7 +496,13 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 		case V4L2_PIX_FMT_Y10:
 		case V4L2_PIX_FMT_Y12:
 		case V4L2_PIX_FMT_SBGGR8:
+		case V4L2_PIX_FMT_SGBRG8:
+		case V4L2_PIX_FMT_SGRBG8:
+		case V4L2_PIX_FMT_SRGGB8:
 		case V4L2_PIX_FMT_SBGGR16:
+		case V4L2_PIX_FMT_SGBRG16:
+		case V4L2_PIX_FMT_SGRBG16:
+		case V4L2_PIX_FMT_SRGGB16:
 			cr1 |= BIT_PIXEL_BIT;
 			break;
 		}
@@ -961,7 +967,13 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	case V4L2_PIX_FMT_Y10:
 	case V4L2_PIX_FMT_Y12:
 	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
 	case V4L2_PIX_FMT_SBGGR16:
+	case V4L2_PIX_FMT_SGBRG16:
+	case V4L2_PIX_FMT_SGRBG16:
+	case V4L2_PIX_FMT_SRGGB16:
 		break;
 
 	default:
-- 
Regards,

Laurent Pinchart

