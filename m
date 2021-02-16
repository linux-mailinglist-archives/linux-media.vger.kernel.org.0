Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6A031CF60
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhBPRnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:43:17 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:46653 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhBPRm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:42:59 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 51C28200012;
        Tue, 16 Feb 2021 17:41:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/16] media: i2c: max9286: Rename reverse_channel_mv
Date:   Tue, 16 Feb 2021 18:41:40 +0100
Message-Id: <20210216174146.106639-11-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename the reverse_channel_mv variable to init_rev_chan_mv as
the next patches will cache the reverse channel amplitude in
a new driver variable.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 1d9951215868..1f14cd817fbf 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -163,7 +163,7 @@ struct max9286_priv {
 	unsigned int mux_channel;
 	bool mux_open;
 
-	u32 reverse_channel_mv;
+	u32 init_rev_chan_mv;
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;
@@ -563,7 +563,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
-	if (priv->reverse_channel_mv < 170)
+	if (priv->init_rev_chan_mv < 170)
 		max9286_reverse_channel_setup(priv, 170);
 	max9286_check_config_link(priv, priv->source_mask);
 
@@ -971,7 +971,7 @@ static int max9286_setup(struct max9286_priv *priv)
 	 * only. This should be disabled after the mux is initialised.
 	 */
 	max9286_configure_i2c(priv, true);
-	max9286_reverse_channel_setup(priv, priv->reverse_channel_mv);
+	max9286_reverse_channel_setup(priv, priv->init_rev_chan_mv);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
@@ -1236,9 +1236,9 @@ static int max9286_parse_dt(struct max9286_priv *priv)
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

