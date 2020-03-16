Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79EC6187400
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 21:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732563AbgCPUZV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 16:25:21 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58527 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732556AbgCPUZU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 16:25:20 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 77656FF802;
        Mon, 16 Mar 2020 20:25:17 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/5] media: i2c: max9286: Parse overlap window value
Date:   Mon, 16 Mar 2020 21:27:55 +0100
Message-Id: <20200316202757.529740-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse the 'maxim,overlap-window' property value and cache its
content to later program registers 0x63 and 0x64.

As specified by the bindings documentation, the property is mandatory as
long as a default value cannot be established to guarantee DTB backward
compatibility.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 06edd8bd3e82..0357515860b2 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -117,6 +117,9 @@
 #define MAX9286_REV_FLEN(n)		((n) - 20)
 /* Register 0x49 */
 #define MAX9286_VIDEO_DETECT_MASK	0x0f
+/* Register 0x64 */
+#define MAX9286_OVLP_WINDOWH_MASK	GENMASK(4, 0)
+
 /* Register 0x69 */
 #define MAX9286_LFLTBMONMASKED		BIT(7)
 #define MAX9286_LOCKMONMASKED		BIT(6)
@@ -164,6 +167,8 @@ struct max9286_priv {
 	unsigned int csi2_data_lanes;
 	struct max9286_source sources[MAX9286_NUM_GMSL];
 	struct v4l2_async_notifier notifier;
+
+	u32 overlap_window;
 };
 
 static struct max9286_source *next_source(struct max9286_priv *priv,
@@ -895,6 +900,11 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
 		      MAX9286_FSYNCMETH_AUTO);
 
+	/* Configure overlap window. */
+	max9286_write(priv, 0x63, priv->overlap_window);
+	max9286_write(priv, 0x64, (priv->overlap_window >> 8) &
+				  MAX9286_OVLP_WINDOWH_MASK);
+
 	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
 	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
 		      MAX9286_HVSRC_D14);
@@ -1041,8 +1051,24 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	struct device_node *i2c_mux;
 	struct device_node *node = NULL;
 	unsigned int i2c_mux_mask = 0;
+	int ret;
 
 	of_node_get(dev->of_node);
+
+	/*
+	 * FIXM: Require overlap window value to be specified by DTS as long as
+	 * the control function is not clarified. As soon as a default
+	 * behaviour can be established drop this requirement, while older
+	 * DTBs are guaranteed to be fully specified.
+	 */
+	ret = of_property_read_u32(dev->of_node, "maxim,overlap-window",
+				   &priv->overlap_window);
+	if (ret) {
+		dev_err(dev, "Missing property \"maxim,overlap-window\"\n");
+		of_node_put(dev->of_node);
+		return -EINVAL;
+	}
+
 	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
 	if (!i2c_mux) {
 		dev_err(dev, "Failed to find i2c-mux node\n");
-- 
2.25.1

