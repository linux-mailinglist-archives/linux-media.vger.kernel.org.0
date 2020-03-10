Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E45A1802D2
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgCJQGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:06:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55128 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgCJQGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:06:46 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 968EAAC3;
        Tue, 10 Mar 2020 17:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583856403;
        bh=UABPsoFkIBRcv6iWcleJ4LS/4me2cSyfh2TaYtK0oRs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P5EQItPQPl1nDJO1Fx+qZOmI00r7HKMpgG+IyFeI4u8mWVbaJeGO/DrSlObmvnaJC
         vzpt5QwPIw+orestT+HucW4M6ayjqR46oudUt4TWKUa3eR0aS0cBPli9Jh7OKYd0Lo
         mnxCB8AqsT1GnfMhQy95e1uUyHhNPQIxi0aCzDhw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 07/10] media: imx: imx6-media-csi: Replace Y16 with Y10 and Y12
Date:   Tue, 10 Mar 2020 18:06:30 +0200
Message-Id: <20200310160633.950-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver doesn't really support V4L2_PIX_FMT_Y16, as there's no 16-bit
greyscale media bus code defined by the kernel. It (ab)uses the format
to capture 10-bit and 12-bit greyscale formats. Fix it to properly
support MEDIA_BUS_FMT_Y10_1X10 and MEDIA_BUS_FMT_Y12_1X12 instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c   |  3 ++-
 drivers/staging/media/imx/imx-media-utils.c | 13 ++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index b60ed4f22f6d..f4abac93c0e4 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -457,7 +457,8 @@ static int csi_idmac_setup_channel(struct csi_priv *priv)
 	case V4L2_PIX_FMT_SGBRG16:
 	case V4L2_PIX_FMT_SGRBG16:
 	case V4L2_PIX_FMT_SRGGB16:
-	case V4L2_PIX_FMT_Y16:
+	case V4L2_PIX_FMT_Y10:
+	case V4L2_PIX_FMT_Y12:
 		burst_size = 8;
 		passthrough_bits = 16;
 		break;
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 0788a1874557..bc20fcc88267 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -166,11 +166,14 @@ static const struct imx_media_pixfmt rgb_formats[] = {
 		.bpp    = 8,
 		.bayer  = true,
 	}, {
-		.fourcc = V4L2_PIX_FMT_Y16,
-		.codes = {
-			MEDIA_BUS_FMT_Y10_1X10,
-			MEDIA_BUS_FMT_Y12_1X12,
-		},
+		.fourcc = V4L2_PIX_FMT_Y10,
+		.codes = {MEDIA_BUS_FMT_Y10_1X10},
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y12,
+		.codes = {MEDIA_BUS_FMT_Y12_1X12},
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
-- 
Regards,

Laurent Pinchart

