Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F0634222C
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbhCSQmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:42:17 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58071 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhCSQlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:41:46 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B76CFC0006;
        Fri, 19 Mar 2021 16:41:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 04/19] media: i2c: max9286: Define high channel amplitude
Date:   Fri, 19 Mar 2021 17:41:33 +0100
Message-Id: <20210319164148.199192-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
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
2.30.0

