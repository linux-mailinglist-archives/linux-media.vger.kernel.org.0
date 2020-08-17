Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1044246870
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 16:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgHQOcR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 10:32:17 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:43685 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729053AbgHQOcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 10:32:16 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 92BC8C0009;
        Mon, 17 Aug 2020 14:32:12 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org
Subject: [PATCH 4/4] media: i2c: max9286: Remove cached formats
Date:   Mon, 17 Aug 2020 16:35:40 +0200
Message-Id: <20200817143540.247340-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
References: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the image stream formats are retrieved from the remote
sources there's no need to cache them in the driver structure.

Remove the cached mbus frame formats and their initialization.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index a4e23396c4b6..97dfee767bbf 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -160,8 +160,6 @@ struct max9286_priv {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;
 
-	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
-
 	/* Protects controls and fmt structures */
 	struct mutex mutex;
 
@@ -758,18 +756,6 @@ static const struct v4l2_subdev_ops max9286_subdev_ops = {
 	.pad		= &max9286_pad_ops,
 };
 
-static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
-{
-	fmt->width		= 1280;
-	fmt->height		= 800;
-	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
-	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
-	fmt->field		= V4L2_FIELD_NONE;
-	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
-	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
-	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
-}
-
 static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 {
 	struct max9286_priv *priv = sd_to_max9286(subdev);
@@ -834,9 +820,6 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 
 	/* Configure V4L2 for the MAX9286 itself */
 
-	for (i = 0; i < MAX9286_N_SINKS; i++)
-		max9286_init_format(&priv->fmt[i]);
-
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
 	priv->sd.internal_ops = &max9286_subdev_internal_ops;
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-- 
2.27.0

