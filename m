Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A7928F69C
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 18:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389826AbgJOQ1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 12:27:42 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:36583 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389721AbgJOQ1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 12:27:42 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3173CFF805;
        Thu, 15 Oct 2020 16:27:38 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/7] media: i2c: max9286: Break-out reverse channel setup
Date:   Thu, 15 Oct 2020 20:27:06 +0200
Message-Id: <20201015182710.54795-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
References: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
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

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index d969ac21a058..89a7248f5c25 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -906,6 +906,22 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
  * Probe/Remove
  */
 
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
 static int max9286_setup(struct max9286_priv *priv)
 {
 	/*
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
2.28.0

