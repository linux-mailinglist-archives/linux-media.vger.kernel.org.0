Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACA6E276A
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 02:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392859AbfJXAmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 20:42:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52446 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408086AbfJXAmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 20:42:10 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AC78D53;
        Thu, 24 Oct 2019 02:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571877726;
        bh=xSJbvvfuQo4QWevjNSY1sGt+WQ7/jSQmIBgq/0sKzC0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IG9offKVUpLiGGGqG/TR69JTZXz6/0XOS8U3b1fKnhSgTPPbzjcrrWf3XsNV/VAay
         ANZjnMsPZUOEtPT3Ys5HESXXP77hUqYn/mr7P5RfSI4xkX5vfg0a3+b1p/w3Qq5AoJ
         ttm9Z2fqgBwLc4yLGxjV2ap+JghAzytqcXOdh2sI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 4/7] media: imx: imx6-media-csi: Replace Y16 with Y10 and Y12
Date:   Thu, 24 Oct 2019 03:41:52 +0300
Message-Id: <20191024004155.32068-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/staging/media/imx/imx-media-csi.c   |  3 ++-
 drivers/staging/media/imx/imx-media-utils.c | 13 ++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 367e39f5b382..29582ceb2164 100644
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
index 4cc6a7462ae2..a1c313e35bc0 100644
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

