Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B24E2BC72D
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 17:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgKVQhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 11:37:22 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:28480 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728175AbgKVQhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 11:37:21 -0500
X-Halon-ID: 45ffcda3-2cdf-11eb-8a9c-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 45ffcda3-2cdf-11eb-8a9c-005056917a89;
        Sun, 22 Nov 2020 17:25:03 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] adv748x: csi2: Set virtual channel when device is reset
Date:   Sun, 22 Nov 2020 17:36:36 +0100
Message-Id: <20201122163637.3590465-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's not enough to set the CSI-2 virtual channel for TXA and TXB during
probe it also needs to be set when the device is reset. Move the virtual
channel selection to adv748x_reset() that is called during probe and
when the device needs to be reset.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 8 ++++++--
 drivers/media/i2c/adv748x/adv748x-csi2.c | 6 +-----
 drivers/media/i2c/adv748x/adv748x.h      | 1 +
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 8676ad2428856dd3..b578a01cfebe7217 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -530,10 +530,14 @@ static int adv748x_reset(struct adv748x_state *state)
 	io_write(state, ADV748X_IO_PD, ADV748X_IO_PD_RX_EN);
 
 	/* Conditionally enable TXa and TXb. */
-	if (is_tx_enabled(&state->txa))
+	if (is_tx_enabled(&state->txa)) {
 		regval |= ADV748X_IO_10_CSI4_EN;
-	if (is_tx_enabled(&state->txb))
+		adv748x_csi2_set_virtual_channel(&state->txa, 0);
+	}
+	if (is_tx_enabled(&state->txb)) {
 		regval |= ADV748X_IO_10_CSI1_EN;
+		adv748x_csi2_set_virtual_channel(&state->txb, 0);
+	}
 	io_write(state, ADV748X_IO_10, regval);
 
 	/* Use vid_std and v_freq as freerun resolution for CP */
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 99bb63d05eef1cd5..fa9278a08fdee3bb 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -14,8 +14,7 @@
 
 #include "adv748x.h"
 
-static int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx,
-					    unsigned int vc)
+int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
 {
 	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
 }
@@ -313,9 +312,6 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	if (!is_tx_enabled(tx))
 		return 0;
 
-	/* Initialise the virtual channel */
-	adv748x_csi2_set_virtual_channel(tx, 0);
-
 	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
 			    MEDIA_ENT_F_VID_IF_BRIDGE,
 			    is_txa(tx) ? "txa" : "txb");
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 747947ea3e316451..56256c1e8b0d3f01 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -439,6 +439,7 @@ int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input);
 
 int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx);
 void adv748x_csi2_cleanup(struct adv748x_csi2 *tx);
+int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc);
 int adv748x_csi2_set_pixelrate(struct v4l2_subdev *sd, s64 rate);
 
 int adv748x_hdmi_init(struct adv748x_hdmi *hdmi);
-- 
2.29.2

