Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C23731CF5D
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhBPRnN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:43:13 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:41669 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhBPRm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:42:59 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3AE9E200016;
        Tue, 16 Feb 2021 17:41:46 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/16] media: i2c: max9286: Cache channel amplitude
Date:   Tue, 16 Feb 2021 18:41:41 +0100
Message-Id: <20210216174146.106639-12-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cache the current channel amplitude in a driver variable
to skip updating it if the new requested value is the same
as the currently configured one.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 1f14cd817fbf..4afb5ca06448 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -164,6 +164,7 @@ struct max9286_priv {
 	bool mux_open;
 
 	u32 init_rev_chan_mv;
+	u32 rev_chan_mv;
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;
@@ -340,8 +341,15 @@ static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
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
@@ -563,8 +571,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
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

