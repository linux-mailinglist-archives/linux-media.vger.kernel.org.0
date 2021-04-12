Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B97535C208
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241305AbhDLJht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:37:49 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:54111 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240640AbhDLJet (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:34:49 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1F965200019;
        Mon, 12 Apr 2021 09:34:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 05/17] media: i2c: max9286: Rework comments in .bound()
Date:   Mon, 12 Apr 2021 11:34:39 +0200
Message-Id: <20210412093451.14198-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
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
 drivers/media/i2c/max9286.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9124d5fa6ea3..e1c7173f2d00 100644
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
@@ -575,11 +575,6 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 */
 	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
 	max9286_check_config_link(priv, priv->source_mask);
-
-	/*
-	 * Re-configure I2C with local acknowledge disabled after cameras have
-	 * probed.
-	 */
 	max9286_configure_i2c(priv, false);
 
 	return max9286_set_pixelrate(priv);
-- 
2.31.1

