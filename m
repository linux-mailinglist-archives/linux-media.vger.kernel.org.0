Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CE731CF62
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhBPRnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:43:20 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:58953 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbhBPRnA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:43:00 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7E00020000A;
        Tue, 16 Feb 2021 17:41:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] media: i2c: max9286: Rework comments in .bound()
Date:   Tue, 16 Feb 2021 18:41:45 +0100
Message-Id: <20210216174146.106639-16-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Re-phrase a comment in .bound() callback to make it clear we register
a subdev notifier and remove a redundant comment about disabling i2c
auto-ack.

No functional changes intended.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index c41284de89b6..aa01d5bb79ef 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -567,9 +567,9 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	/*
-	 * We can only register v4l2_async_notifiers, which do not provide a
-	 * means to register a complete callback. bound_sources allows us to
-	 * identify when all remote serializers have completed their probe.
+	 * As we register a subdev notifiers we won't get a .complete() callback
+	 * here, so we have to use bound_sources to identify when all remote
+	 * serializers have probed.
 	 */
 	if (priv->bound_sources != priv->source_mask) {
 		/*
@@ -583,16 +583,12 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	/*
 	 * All enabled sources have probed and enabled their reverse control
 	 * channels:
+	 * - The reverse channel amplitude stays high
 	 * - Verify all configuration links are properly detected
-	 * - Disable auto-ack as communication on the control channel are now
-	 *   stable.
+	 * - Disable auto-ack as communications on the control channel are now
+	 *   stable
 	 */
 	max9286_check_config_link(priv, priv->source_mask);
-
-	/*
-	 * Re-configure I2C with local acknowledge disabled after cameras have
-	 * probed.
-	 */
 	max9286_configure_i2c(priv, false);
 
 	return max9286_set_pixelrate(priv);
-- 
2.30.0

