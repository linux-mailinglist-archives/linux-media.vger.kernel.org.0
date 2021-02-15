Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE77031B4D4
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhBOEkK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhBOEkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:40:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5369BC061756
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 20:39:29 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BB3B270B;
        Mon, 15 Feb 2021 05:29:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363344;
        bh=1CTZLVyXa2tje91X8SklHWDkGY7cEz0H9TnbFCx+jtg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dgzvTNjE5fvLgqRSvmauawub784FMDJan1h8/JdgMKMS4DvINx7/NuPvmWchD2on/
         x8urawXnaNqhUW7mc5HS99UHwI1tUAF19PSwALB1MR0VW/N97NQswEV+6BCGBzVOvQ
         mp5uAK1v3xpboDNpr/GwhX0T7rpf9SBdjDMP+AFA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 67/77] media: imx: imx7_mipi_csis: Fix UYVY8 media bus format
Date:   Mon, 15 Feb 2021 06:27:31 +0200
Message-Id: <20210215042741.28850-68-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CSI-2 uses, as a convention, 1Xn media bus formats. Replace
MEDIA_BUS_FMT_UYVY8_2X8 with MEDIA_BUS_FMT_UYVY8_1X16, and set the width
value accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index e73efc7e99f9..a705797559dd 100644
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

