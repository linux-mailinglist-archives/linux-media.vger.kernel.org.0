Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA9931B4C2
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhBOEiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:38:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhBOEh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:37:56 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6215B1ADA;
        Mon, 15 Feb 2021 05:28:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363333;
        bh=sI42DePyY374HJXrbzJqjrbirQ7UwMD++TISrajVzjI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q0VJBAABZ0KP7ugOa+J8n/rJ0E2ewkMvOzdDioOUyPZMtMzuvpXH4+WhYplmsx7K5
         Aw7kIZkVBBZf9FOC5qMskXUxabxAjgzv/LRh844ZJiyJh93pIzQX0ZCBegaaeQfQHO
         j2pKCPnUH4/l0jwPUmkMHnvvTyqYkRLEUVmYv25I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 55/77] media: imx: imx7_media-csi: Add support for additional Bayer patterns
Date:   Mon, 15 Feb 2021 06:27:19 +0200
Message-Id: <20210215042741.28850-56-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 475c39b05f9a..763235447422 100644
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
@@ -975,7 +981,13 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
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

