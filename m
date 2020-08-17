Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4491524686D
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 16:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgHQOcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 10:32:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58411 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729049AbgHQOcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 10:32:12 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6C83EC0006;
        Mon, 17 Aug 2020 14:32:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org
Subject: [PATCH 2/4] media: i2c: max9286: Get format from remote ends
Date:   Mon, 17 Aug 2020 16:35:38 +0200
Message-Id: <20200817143540.247340-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
References: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9286 chip does not allow any modification to the image stream
format it de-serializes from the GMSL bus to its MIPI CSI-2 output
interface.

For this reason, when the format is queried from on any of the MAX9286
pads, get the remote subdevice format and return it.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7c292f2e2704..e6a70dbd27df 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -742,8 +742,10 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_format *format)
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
-	struct v4l2_mbus_framefmt *cfg_fmt;
+	struct v4l2_subdev_format remote_fmt = {};
+	struct device *dev = &priv->client->dev;
 	unsigned int pad = format->pad;
+	int ret;
 
 	/*
 	 * Multiplexed Stream Support: Support link validation by returning the
@@ -754,12 +756,26 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 	if (pad == MAX9286_SRC_PAD)
 		pad = __ffs(priv->bound_sources);
 
-	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
-	if (!cfg_fmt)
-		return -EINVAL;
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		mutex_lock(&priv->mutex);
+		format->format = *v4l2_subdev_get_try_format(&priv->sd,
+							     cfg, pad);
+		mutex_unlock(&priv->mutex);
+
+		return 0;
+	}
+
+	remote_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	remote_fmt.pad = 0;
+	ret = v4l2_subdev_call(priv->sources[pad].sd, pad, get_fmt, NULL,
+			       &remote_fmt);
+	if (ret) {
+		dev_err(dev, "Unable get format on source %d\n", pad);
+		return ret;
+	}
 
 	mutex_lock(&priv->mutex);
-	format->format = *cfg_fmt;
+	format->format = remote_fmt.format;
 	mutex_unlock(&priv->mutex);
 
 	return 0;
-- 
2.27.0

