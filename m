Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DEE33B399
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhCONQB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:16:01 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:60437 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbhCONPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:15:35 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 95320FF803;
        Mon, 15 Mar 2021 13:15:30 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 14/18] media: i2c: max9286: Cache channel amplitude
Date:   Mon, 15 Mar 2021 14:15:08 +0100
Message-Id: <20210315131512.133720-15-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cache the current channel amplitude in a driver variable
to skip updating it if the newly requested value is the same
as the currently configured one.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 82ec05e96cb7..ed1cdefe7c30 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -165,6 +165,7 @@ struct max9286_priv {
 
 	/* The initial reverse control channel amplitude. */
 	u32 init_rev_chan_mv;
+	u32 rev_chan_mv;
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;
@@ -341,8 +342,15 @@ static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
 static void max9286_reverse_channel_setup(struct max9286_priv *priv,
 					  unsigned int chan_amplitude)
 {
+	u8 chan_config;
+
+	if (priv->rev_chan_mv == chan_amplitude)
+		return;
+
+	priv->rev_chan_mv = chan_amplitude;
+
 	/* Reverse channel transmission time: default to 1. */
-	u8 chan_config = MAX9286_REV_TRF(1);
+	chan_config = MAX9286_REV_TRF(1);
 
 	/*
 	 * Reverse channel setup.
@@ -564,8 +572,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
-	if (priv->init_rev_chan_mv < 170)
-		max9286_reverse_channel_setup(priv, 170);
+	max9286_reverse_channel_setup(priv, 170);
 	max9286_check_config_link(priv, priv->source_mask);
 
 	/*
-- 
2.30.0

