Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93081E41E5
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 14:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgE0MR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 08:17:27 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:5558 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727798AbgE0MR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 08:17:27 -0400
X-IronPort-AV: E=Sophos;i="5.73,441,1583161200"; 
   d="scan'208";a="47942586"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 May 2020 21:17:25 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8230A42BA9F4;
        Wed, 27 May 2020 21:17:24 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/3] media: rcar-vin: Invalidate pipeline if conversion is not possible on input formats
Date:   Wed, 27 May 2020 13:16:48 +0100
Message-Id: <1590581810-19317-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590581810-19317-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1590581810-19317-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Up until now the VIN was capable to convert any of its supported input mbus
formats to any of it's supported output pixel formats. With the addition of
RAW formats this is no longer true.

This patch invalidates the pipeline by adding a check if given vin input
format can be converted to supported output pixel format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  |  6 +++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 11 ++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 1a30cd036371..2b26204910fd 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1110,11 +1110,15 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 	case MEDIA_BUS_FMT_UYVY10_2X10:
 	case MEDIA_BUS_FMT_RGB888_1X24:
-		vin->mbus_code = fmt.format.code;
+		break;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
+			return -EPIPE;
 		break;
 	default:
 		return -EPIPE;
 	}
+	vin->mbus_code = fmt.format.code;
 
 	switch (fmt.format.field) {
 	case V4L2_FIELD_TOP:
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index f421e2584875..d3b6a992b4a2 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -350,9 +350,9 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 	 * all of the related pixel formats. If mbus_code is not set enumerate
 	 * all possible pixelformats.
 	 *
-	 * TODO: Once raw capture formats are added to the driver this needs
-	 * to be extended so raw media bus codes only result in raw pixel
-	 * formats.
+	 * TODO: Once raw MEDIA_BUS_FMT_SRGGB12_1X12 format is added to the
+	 * driver this needs to be extended so raw media bus code only result in
+	 * raw pixel format.
 	 */
 	switch (f->mbus_code) {
 	case 0:
@@ -362,6 +362,11 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 	case MEDIA_BUS_FMT_UYVY10_2X10:
 	case MEDIA_BUS_FMT_RGB888_1X24:
 		break;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		if (f->index)
+			return -EINVAL;
+		f->pixelformat = V4L2_PIX_FMT_SRGGB8;
+		return 0;
 	default:
 		return -EINVAL;
 	}
-- 
2.17.1

