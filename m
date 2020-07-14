Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3A321F324
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 15:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgGNNzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 09:55:13 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:48339 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgGNNzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 09:55:12 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 106151C0007;
        Tue, 14 Jul 2020 13:55:07 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v6 8/9] media: i2c: adv748x: Implement get_mbus_config
Date:   Tue, 14 Jul 2020 15:58:11 +0200
Message-Id: <20200714135812.55158-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the newly introduced get_mbus_config operation to report the
number of currently used data lanes on the MIPI CSI-2 interface.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 2091cda50935..99bb63d05eef 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -214,9 +214,40 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
+					struct v4l2_mbus_config *config)
+{
+	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
+
+	if (pad != ADV748X_CSI2_SOURCE)
+		return -EINVAL;
+
+	config->type = V4L2_MBUS_CSI2_DPHY;
+	switch (tx->active_lanes) {
+	case 1:
+		config->flags = V4L2_MBUS_CSI2_1_LANE;
+		break;
+
+	case 2:
+		config->flags = V4L2_MBUS_CSI2_2_LANE;
+		break;
+
+	case 3:
+		config->flags = V4L2_MBUS_CSI2_3_LANE;
+		break;
+
+	case 4:
+		config->flags = V4L2_MBUS_CSI2_4_LANE;
+		break;
+	}
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
 	.get_fmt = adv748x_csi2_get_format,
 	.set_fmt = adv748x_csi2_set_format,
+	.get_mbus_config = adv748x_csi2_get_mbus_config,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.27.0

