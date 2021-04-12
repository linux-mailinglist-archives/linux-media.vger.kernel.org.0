Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7B435C1F9
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240382AbhDLJhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:37:17 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:60669 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238497AbhDLJeq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:34:46 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1E1A320000F;
        Mon, 12 Apr 2021 09:34:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 04/17] media: i2c: max9286: Define high channel amplitude
Date:   Mon, 12 Apr 2021 11:34:38 +0200
Message-Id: <20210412093451.14198-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide a macro to define the reverse channel amplitude to
be used to compensate the remote serializer noise immunity.

While at it, update a comment.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ed1cdefe7c30..9124d5fa6ea3 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -113,6 +113,7 @@
 #define MAX9286_REV_TRF(n)		((n) << 4)
 #define MAX9286_REV_AMP(n)		((((n) - 30) / 10) << 1) /* in mV */
 #define MAX9286_REV_AMP_X		BIT(0)
+#define MAX9286_REV_AMP_HIGH		170
 /* Register 0x3f */
 #define MAX9286_EN_REV_CFG		BIT(6)
 #define MAX9286_REV_FLEN(n)		((n) - 20)
@@ -567,12 +568,12 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 * channels:
 	 *
 	 * - Increase the reverse channel amplitude to compensate for the
-	 *   remote ends high threshold, if not done already
+	 *   remote ends high threshold
 	 * - Verify all configuration links are properly detected
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
-	max9286_reverse_channel_setup(priv, 170);
+	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
 	max9286_check_config_link(priv, priv->source_mask);
 
 	/*
-- 
2.31.1

