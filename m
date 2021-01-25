Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CC9303252
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 04:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbhAYNbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 08:31:33 -0500
Received: from retiisi.eu ([95.216.213.190]:36802 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728856AbhAYN3q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:29:46 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 3388A634C8E;
        Mon, 25 Jan 2021 15:25:57 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 05/14] media: st-mipid02: Use v4l2_async_notifier_add_fwnode_remote_subdev
Date:   Mon, 25 Jan 2021 15:22:06 +0200
Message-Id: <20210125132230.6600-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

The use of v4l2_async_notifier_add_subdev will be discouraged.
Drivers are instead encouraged to use a helper such as
v4l2_async_notifier_add_fwnode_remote_subdev.

This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
should get a kmalloc'ed struct v4l2_async_subdev,
removing some boilerplate code while at it.

Use the appropriate helper v4l2_async_notifier_add_fwnode_remote_subdev,
which handles the needed setup, instead of open-coding it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/st-mipid02.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 003ba22334cd..42549b3a62a0 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -92,7 +92,6 @@ struct mipid02_dev {
 	u64 link_frequency;
 	struct v4l2_fwnode_endpoint tx;
 	/* remote source */
-	struct v4l2_async_subdev asd;
 	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *s_subdev;
 	/* registers */
@@ -844,6 +843,7 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 {
 	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
 	struct i2c_client *client = bridge->i2c_client;
+	struct v4l2_async_subdev *asd;
 	struct device_node *ep_node;
 	int ret;
 
@@ -875,18 +875,17 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	bridge->rx = ep;
 
 	/* register async notifier so we get noticed when sensor is connected */
-	bridge->asd.match.fwnode =
-		fwnode_graph_get_remote_port_parent(of_fwnode_handle(ep_node));
-	bridge->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
+	v4l2_async_notifier_init(&bridge->notifier);
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+					&bridge->notifier,
+					of_fwnode_handle(ep_node),
+					sizeof(*asd));
 	of_node_put(ep_node);
 
-	v4l2_async_notifier_init(&bridge->notifier);
-	ret = v4l2_async_notifier_add_subdev(&bridge->notifier, &bridge->asd);
-	if (ret) {
+	if (IS_ERR(asd)) {
 		dev_err(&client->dev, "fail to register asd to notifier %d",
-			ret);
-		fwnode_handle_put(bridge->asd.match.fwnode);
-		return ret;
+			PTR_ERR(asd));
+		return PTR_ERR(asd);
 	}
 	bridge->notifier.ops = &mipid02_notifier_ops;
 
-- 
2.29.2

