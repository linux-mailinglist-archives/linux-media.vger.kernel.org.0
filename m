Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76E82F949D
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 19:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbhAQScq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 13:32:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59822 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbhAQSci (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 13:32:38 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0BE491F44A55
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mickael Guene <mickael.guene@st.com>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 07/14] media: cdns-csi2rx: Use v4l2_async_notifier_add_fwnode_remote_subdev
Date:   Sun, 17 Jan 2021 15:29:45 -0300
Message-Id: <20210117182956.41298-14-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117182956.41298-1-ezequiel@collabora.com>
References: <20210117182956.41298-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index be9ec59774d6..7d299cacef8c 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -81,7 +81,6 @@ struct csi2rx_priv {
 	struct media_pad		pads[CSI2RX_PAD_MAX];
 
 	/* Remote source */
-	struct v4l2_async_subdev	asd;
 	struct v4l2_subdev		*source_subdev;
 	int				source_pad;
 };
@@ -362,6 +361,7 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
 static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 {
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
+	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *fwh;
 	struct device_node *ep;
 	int ret;
@@ -395,17 +395,13 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 		return -EINVAL;
 	}
 
-	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_port_parent(fwh);
-	csi2rx->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-	of_node_put(ep);
-
 	v4l2_async_notifier_init(&csi2rx->notifier);
 
-	ret = v4l2_async_notifier_add_subdev(&csi2rx->notifier, &csi2rx->asd);
-	if (ret) {
-		fwnode_handle_put(csi2rx->asd.match.fwnode);
-		return ret;
-	}
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi2rx->notifier,
+							   fwh, sizeof(*asd));
+	of_node_put(ep);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	csi2rx->notifier.ops = &csi2rx_notifier_ops;
 
-- 
2.29.2

