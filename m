Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D8B222554
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 16:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgGPOY0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 10:24:26 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:42633 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbgGPOY0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 10:24:26 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5462A1BF20C;
        Thu, 16 Jul 2020 14:24:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v7 09/10] media: i2c: adv748x: Implement get_mbus_config
Date:   Thu, 16 Jul 2020 16:27:12 +0200
Message-Id: <20200716142713.110655-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716142713.110655-1-jacopo+renesas@jmondi.org>
References: <20200716142713.110655-1-jacopo+renesas@jmondi.org>
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

