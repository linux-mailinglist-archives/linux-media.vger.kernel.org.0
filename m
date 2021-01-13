Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AE22F52D2
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 19:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbhAMSzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 13:55:53 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45741 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbhAMSzw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 13:55:52 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 670AB1C0011;
        Wed, 13 Jan 2021 18:55:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesasa@ideasonboard.com>
Subject: [PATCH v7 5/7] media: i2c: max9286: Break-out reverse channel setup
Date:   Wed, 13 Jan 2021 19:55:03 +0100
Message-Id: <20210113185506.119808-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113185506.119808-1-jacopo+renesas@jmondi.org>
References: <20210113185506.119808-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Break out the reverse channel setup configuration procedure to its own
function.

This change prepares for configuring the reverse channel conditionally
to the remote side high threshold configuration.

No functional changes intended.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesasa@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index c82c1493e099..1cfc8801c0b2 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -336,6 +336,22 @@ static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
 	usleep_range(3000, 5000);
 }
 
+static void max9286_reverse_channel_setup(struct max9286_priv *priv)
+{
+	/*
+	 * Reverse channel setup.
+	 *
+	 * - Enable custom reverse channel configuration (through register 0x3f)
+	 *   and set the first pulse length to 35 clock cycles.
+	 * - Increase the reverse channel amplitude to 170mV to accommodate the
+	 *   high threshold enabled by the serializer driver.
+	 */
+	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
+	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
+		      MAX9286_REV_AMP_X);
+	usleep_range(2000, 2500);
+}
+
 /*
  * max9286_check_video_links() - Make sure video links are detected and locked
  *
@@ -941,19 +957,7 @@ static int max9286_setup(struct max9286_priv *priv)
 	 * only. This should be disabled after the mux is initialised.
 	 */
 	max9286_configure_i2c(priv, true);
-
-	/*
-	 * Reverse channel setup.
-	 *
-	 * - Enable custom reverse channel configuration (through register 0x3f)
-	 *   and set the first pulse length to 35 clock cycles.
-	 * - Increase the reverse channel amplitude to 170mV to accommodate the
-	 *   high threshold enabled by the serializer driver.
-	 */
-	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
-	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
-		      MAX9286_REV_AMP_X);
-	usleep_range(2000, 2500);
+	max9286_reverse_channel_setup(priv);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
-- 
2.29.2

