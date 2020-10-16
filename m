Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CE229027E
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 12:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406588AbgJPKHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 06:07:11 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:51793 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406559AbgJPKHF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 06:07:05 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CDA4EE0012;
        Fri, 16 Oct 2020 10:07:01 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 4/7] media: i2c: max9286: Make channel amplitude programmable
Date:   Fri, 16 Oct 2020 14:06:22 +0200
Message-Id: <20201016120625.64337-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
References: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instrument the function that configures the reverse channel with a
programmable amplitude value.

This change serves to prepare to adjust the reverse channel amplitude
depending on the remote end high-threshold configuration.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 526b6e557dfb..31e27d0f34f1 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -336,19 +336,29 @@ static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
 	usleep_range(3000, 5000);
 }
 
-static void max9286_reverse_channel_setup(struct max9286_priv *priv)
+static void max9286_reverse_channel_setup(struct max9286_priv *priv,
+					  unsigned int chan_amplitude)
 {
+	/* Reverse channel transmission time: default to 1. */
+	u8 chan_config = MAX9286_REV_TRF(1);
+
 	/*
 	 * Reverse channel setup.
 	 *
 	 * - Enable custom reverse channel configuration (through register 0x3f)
 	 *   and set the first pulse length to 35 clock cycles.
-	 * - Increase the reverse channel amplitude to 170mV to accommodate the
-	 *   high threshold enabled by the serializer driver.
+	 * - Adjust reverse channel amplitude: values > 130 are programmed
+	 *   using the additional +100mV REV_AMP_X boost flag
 	 */
 	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
-	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
-		      MAX9286_REV_AMP_X);
+
+	if (chan_amplitude > 100) {
+		/* It is not possible to express values (100 < x < 130) */
+		chan_amplitude = chan_amplitude < 130
+			       ? 30 : chan_amplitude - 100;
+		chan_config |= MAX9286_REV_AMP_X;
+	}
+	max9286_write(priv, 0x3b, chan_config | MAX9286_REV_AMP(chan_amplitude));
 	usleep_range(2000, 2500);
 }
 
@@ -957,7 +967,7 @@ static int max9286_setup(struct max9286_priv *priv)
 	 * only. This should be disabled after the mux is initialised.
 	 */
 	max9286_configure_i2c(priv, true);
-	max9286_reverse_channel_setup(priv);
+	max9286_reverse_channel_setup(priv, 170);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
-- 
2.28.0

