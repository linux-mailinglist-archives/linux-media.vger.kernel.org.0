Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4D7184990
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 15:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgCMOiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 10:38:08 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:47857 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMOiI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 10:38:08 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B3D31FF80B;
        Fri, 13 Mar 2020 14:37:59 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        dave.stevenson@raspberrypi.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] media: i2c: adv748x: Implement get_mbus_config
Date:   Fri, 13 Mar 2020 15:40:34 +0100
Message-Id: <20200313144035.401430-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the newly introduced get_mbus_config operation to report the
number of currently used data lanes on the MIPI CSI-2 interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 2091cda50935..f13563da3ff3 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -214,9 +214,24 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
+					struct v4l2_mbus_pad_config *config)
+{
+	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
+
+	if (pad != ADV748X_CSI2_SOURCE)
+		return -EINVAL;
+
+	config->type = V4L2_MBUS_CSI2_DPHY;
+	config->csi2_dphy.data_lanes = tx->active_lanes;
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
2.25.1

