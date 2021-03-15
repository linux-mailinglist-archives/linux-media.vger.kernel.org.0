Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9890133B392
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhCONP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:15:58 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44413 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbhCONPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:15:33 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3A081FF810;
        Mon, 15 Mar 2021 13:15:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 13/18] media: i2c: max9286: Rename reverse_channel_mv
Date:   Mon, 15 Mar 2021 14:15:07 +0100
Message-Id: <20210315131512.133720-14-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename the reverse_channel_mv variable to init_rev_chan_mv as
the next patch will cache the reverse channel amplitude in
a new driver variable.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 1d9951215868..82ec05e96cb7 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -163,7 +163,8 @@ struct max9286_priv {
 	unsigned int mux_channel;
 	bool mux_open;
 
-	u32 reverse_channel_mv;
+	/* The initial reverse control channel amplitude. */
+	u32 init_rev_chan_mv;
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;
@@ -563,7 +564,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
-	if (priv->reverse_channel_mv < 170)
+	if (priv->init_rev_chan_mv < 170)
 		max9286_reverse_channel_setup(priv, 170);
 	max9286_check_config_link(priv, priv->source_mask);
 
@@ -971,7 +972,7 @@ static int max9286_setup(struct max9286_priv *priv)
 	 * only. This should be disabled after the mux is initialised.
 	 */
 	max9286_configure_i2c(priv, true);
-	max9286_reverse_channel_setup(priv, priv->reverse_channel_mv);
+	max9286_reverse_channel_setup(priv, priv->init_rev_chan_mv);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
@@ -1236,9 +1237,9 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	if (of_property_read_u32(dev->of_node,
 				 "maxim,reverse-channel-microvolt",
 				 &reverse_channel_microvolt))
-		priv->reverse_channel_mv = 170;
+		priv->init_rev_chan_mv = 170;
 	else
-		priv->reverse_channel_mv = reverse_channel_microvolt / 1000U;
+		priv->init_rev_chan_mv = reverse_channel_microvolt / 1000U;
 
 	priv->route_mask = priv->source_mask;
 
-- 
2.30.0

