Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7321F6BFA
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 18:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgFKQNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 12:13:55 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34331 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgFKQNz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 12:13:55 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8533DC000B;
        Thu, 11 Jun 2020 16:13:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 7/9] media: i2c: adv748x: Adjust TXA data lanes number
Date:   Thu, 11 Jun 2020 18:16:49 +0200
Message-Id: <20200611161651.264633-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200611161651.264633-1-jacopo+renesas@jmondi.org>
References: <20200611161651.264633-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When outputting SD-Core output through the TXA MIPI CSI-2 interface,
the number of enabled data lanes should be reduced in order to guarantee
the two video format produced by the SD-Core (480i and 576i) generate a
MIPI CSI-2 link clock frequency compatible with the MIPI D-PHY
specifications.

Limit the number of enabled data lanes to 2, which is guaranteed to
support 480i and 576i formats.

Cache the number of enabled data lanes to be able to report it through
the new get_mbus_config operation.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 31 ++++++++++++++++++------
 drivers/media/i2c/adv748x/adv748x.h      |  1 +
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 23e02ff27b17..1fe7f97c6d52 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -241,10 +241,10 @@ static int adv748x_power_up_tx(struct adv748x_csi2 *tx)
 	int ret = 0;
 
 	/* Enable n-lane MIPI */
-	adv748x_write_check(state, page, 0x00, 0x80 | tx->num_lanes, &ret);
+	adv748x_write_check(state, page, 0x00, 0x80 | tx->active_lanes, &ret);
 
 	/* Set Auto DPHY Timing */
-	adv748x_write_check(state, page, 0x00, 0xa0 | tx->num_lanes, &ret);
+	adv748x_write_check(state, page, 0x00, 0xa0 | tx->active_lanes, &ret);
 
 	/* ADI Required Write */
 	if (tx->src == &state->hdmi.sd) {
@@ -270,7 +270,7 @@ static int adv748x_power_up_tx(struct adv748x_csi2 *tx)
 	usleep_range(2000, 2500);
 
 	/* Power-up CSI-TX */
-	adv748x_write_check(state, page, 0x00, 0x20 | tx->num_lanes, &ret);
+	adv748x_write_check(state, page, 0x00, 0x20 | tx->active_lanes, &ret);
 	usleep_range(1000, 1500);
 
 	/* ADI Required Writes */
@@ -292,7 +292,7 @@ static int adv748x_power_down_tx(struct adv748x_csi2 *tx)
 	adv748x_write_check(state, page, 0x1e, 0x00, &ret);
 
 	/* Enable n-lane MIPI */
-	adv748x_write_check(state, page, 0x00, 0x80 | tx->num_lanes, &ret);
+	adv748x_write_check(state, page, 0x00, 0x80 | tx->active_lanes, &ret);
 
 	/* i2c_mipi_pll_en - 1'b1 */
 	adv748x_write_check(state, page, 0xda, 0x01, &ret);
@@ -357,14 +357,29 @@ static int adv748x_link_setup(struct media_entity *entity,
 	if (state->afe.tx) {
 		/* AFE Requires TXA enabled, even when output to TXB */
 		io10 |= ADV748X_IO_10_CSI4_EN;
-		if (is_txa(tx))
+		if (is_txa(tx)) {
+			/*
+			 * Output from the SD-core (480i and 576i) from the TXA
+			 * interface requires reducing the number of enabled
+			 * data lanes in order to guarantee a valid link
+			 * frequency.
+			 */
+			tx->active_lanes = min(tx->num_lanes, 2U);
 			io10 |= ADV748X_IO_10_CSI4_IN_SEL_AFE;
-		else
+		} else {
+			/* TXB has a single data lane, no need to adjust. */
 			io10 |= ADV748X_IO_10_CSI1_EN;
+		}
 	}
 
-	if (state->hdmi.tx)
+	if (state->hdmi.tx) {
+		/*
+		 * Restore the number of active lanes, in case we have gone
+		 * through an AFE->TXA streaming sessions.
+		 */
+		tx->active_lanes = tx->num_lanes;
 		io10 |= ADV748X_IO_10_CSI4_EN;
+	}
 
 	return io_clrset(state, ADV748X_IO_10, io10_mask, io10);
 }
@@ -596,6 +611,7 @@ static int adv748x_parse_csi2_lanes(struct adv748x_state *state,
 		}
 
 		state->txa.num_lanes = num_lanes;
+		state->txa.active_lanes = num_lanes;
 		adv_dbg(state, "TXA: using %u lanes\n", state->txa.num_lanes);
 	}
 
@@ -607,6 +623,7 @@ static int adv748x_parse_csi2_lanes(struct adv748x_state *state,
 		}
 
 		state->txb.num_lanes = num_lanes;
+		state->txb.active_lanes = num_lanes;
 		adv_dbg(state, "TXB: using %u lanes\n", state->txb.num_lanes);
 	}
 
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index fccb388ce179..1061f425ece5 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -79,6 +79,7 @@ struct adv748x_csi2 {
 	unsigned int page;
 	unsigned int port;
 	unsigned int num_lanes;
+	unsigned int active_lanes;
 
 	struct media_pad pads[ADV748X_CSI2_NR_PADS];
 	struct v4l2_ctrl_handler ctrl_hdl;
-- 
2.27.0

