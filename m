Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B6E342242
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhCSQmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:42:20 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34869 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhCSQlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:41:55 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1865BC0006;
        Fri, 19 Mar 2021 16:41:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 07/19] media: i2c: max9286: Rework comments in .bound()
Date:   Fri, 19 Mar 2021 17:41:36 +0100
Message-Id: <20210319164148.199192-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rephrase a comment in .bound() callback to make it clear we register
a subdev notifier and remove a redundant comment about disabling i2c
auto-ack.

No functional changes intended.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index b6347639901e..16b2cb9b44a2 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -556,9 +556,9 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 		subdev->name, src_pad, index);
 
 	/*
-	 * We can only register v4l2_async_notifiers, which do not provide a
-	 * means to register a complete callback. bound_sources allows us to
-	 * identify when all remote serializers have completed their probe.
+	 * As we register a subdev notifiers we won't get a .complete() callback
+	 * here, so we have to use bound_sources to identify when all remote
+	 * serializers have probed.
 	 */
 	if (priv->bound_sources != priv->source_mask)
 		return 0;
@@ -581,16 +581,12 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
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

