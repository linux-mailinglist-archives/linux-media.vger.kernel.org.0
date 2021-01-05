Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47ADB2EAEDE
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbhAEPjh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:39:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728694AbhAEPjg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:39:36 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4419D1C09;
        Tue,  5 Jan 2021 16:30:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860620;
        bh=ftfLaB/aEQPAep5eMoglJXhmA1Ug5eHx9W4WqgyO/Gc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=an9BXPIdmDw+0L94vIo6eNtW88NKhjoo49UO4moz3QlzUVv+jsJdbS9qrmymnxuA8
         pxQ3X8w55FcF34kCGfvwBJprzd5FLTZBmM/X+QfHprlG1gxQL7wrzgPoOu5myyNqzW
         yFAUW4GdYPBIBoGDprFn5AudgQ8vh0fni8SuzmXU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 65/75] media: imx: imx7_mipi_csis: Fix UYVY8 media bus format
Date:   Tue,  5 Jan 2021 17:28:42 +0200
Message-Id: <20210105152852.5733-66-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CSI-2 uses, as a convention, 1Xn media bus formats. Replace
MEDIA_BUS_FMT_UYVY8_2X8 with MEDIA_BUS_FMT_UYVY8_1X16, and set the width
value accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 5a5b3723f0a8..938503601c60 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -273,9 +273,9 @@ struct csis_pix_format {
 static const struct csis_pix_format mipi_csis_formats[] = {
 	/* YUV formats. */
 	{
-		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.fmt_reg = MIPI_CSIS_ISPCFG_FMT_YCBCR422_8BIT,
-		.width = 8,
+		.width = 16,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -718,7 +718,7 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
 	which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 	fmt_sink = mipi_csis_get_format(state, cfg, which, CSIS_PAD_SINK);
 
-	fmt_sink->code = MEDIA_BUS_FMT_UYVY8_2X8;
+	fmt_sink->code = MEDIA_BUS_FMT_UYVY8_1X16;
 	fmt_sink->width = MIPI_CSIS_DEF_PIX_WIDTH;
 	fmt_sink->height = MIPI_CSIS_DEF_PIX_HEIGHT;
 	fmt_sink->field = V4L2_FIELD_NONE;
-- 
Regards,

Laurent Pinchart

