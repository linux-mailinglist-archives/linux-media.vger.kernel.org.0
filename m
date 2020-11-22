Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D5C2BC72A
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 17:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgKVQhU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 11:37:20 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:58377 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728175AbgKVQhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 11:37:20 -0500
X-Halon-ID: 452226e5-2cdf-11eb-8a9c-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 452226e5-2cdf-11eb-8a9c-005056917a89;
        Sun, 22 Nov 2020 17:25:02 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] adv748x: afe: Select input port when device is reset
Date:   Sun, 22 Nov 2020 17:36:35 +0100
Message-Id: <20201122163637.3590465-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's not enough to select the AFE input port during probe it also needs
to be set when the device is reset. Move the port selection to
adv748x_reset() that is called during probe and when the device needs to
be reset.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x-afe.c  | 6 +-----
 drivers/media/i2c/adv748x/adv748x-core.c | 4 ++++
 drivers/media/i2c/adv748x/adv748x.h      | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index dbbb1e4d63637a33..4052cf67bf16c7fb 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -154,7 +154,7 @@ static void adv748x_afe_set_video_standard(struct adv748x_state *state,
 		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT);
 }
 
-static int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
+int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
 {
 	struct adv748x_state *state = adv748x_afe_to_state(afe);
 
@@ -520,10 +520,6 @@ int adv748x_afe_init(struct adv748x_afe *afe)
 		}
 	}
 
-	adv748x_afe_s_input(afe, afe->input);
-
-	adv_dbg(state, "AFE Default input set to %d\n", afe->input);
-
 	/* Entity pads and sinks are 0-indexed to match the pads */
 	for (i = ADV748X_AFE_SINK_AIN0; i <= ADV748X_AFE_SINK_AIN7; i++)
 		afe->pads[i].flags = MEDIA_PAD_FL_SINK;
diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 00966fe104881a14..8676ad2428856dd3 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -516,6 +516,10 @@ static int adv748x_reset(struct adv748x_state *state)
 	if (ret)
 		return ret;
 
+	adv748x_afe_s_input(&state->afe, state->afe.input);
+
+	adv_dbg(state, "AFE Default input set to %d\n", state->afe.input);
+
 	/* Reset TXA and TXB */
 	adv748x_tx_power(&state->txa, 1);
 	adv748x_tx_power(&state->txa, 0);
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 1061f425ece5989e..747947ea3e316451 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -435,6 +435,7 @@ int adv748x_tx_power(struct adv748x_csi2 *tx, bool on);
 
 int adv748x_afe_init(struct adv748x_afe *afe);
 void adv748x_afe_cleanup(struct adv748x_afe *afe);
+int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input);
 
 int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx);
 void adv748x_csi2_cleanup(struct adv748x_csi2 *tx);
-- 
2.29.2

