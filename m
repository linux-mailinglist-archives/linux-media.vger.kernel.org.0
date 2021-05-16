Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797B8381C18
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbhEPCYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhEPCYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:24:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C5CC06175F
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 18:50:01 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62E7B9DF;
        Sun, 16 May 2021 03:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129498;
        bh=d0zqvS5SUUKmEtcm2Zyz8OOivx4it5DdOiU5LvYwKd8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pl49Noqk4vuuG1wNS6g80F+iRc5WRJwt8Kxs07eoCOM3Cbl8cHSkDFGpl33YVJKdu
         kEckSscT0aTlG+zAUc6wVYdGg/mkylEiY+65OyTDNtAVAM5Jq4UoNsmkLCRdMb1Oj4
         0Yz2EyyJfodIgq6wcAE3G11viCTxnrEcaN/yW2fQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 02/25] media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
Date:   Sun, 16 May 2021 04:44:18 +0300
Message-Id: <20210516014441.5508-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In addition to the main interrupts that flag errors and other events,
the CSI-2 receiver has debug interrupt sources that flag various events
useful for debugging. Add those sources to the event counter mechanism
and print them when debugging is enabled.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 69 ++++++++++++++++------
 1 file changed, 51 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 25d0f89b2e53..67911eb8761f 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -195,6 +195,24 @@
 
 /* Debug control register */
 #define MIPI_CSIS_DBG_CTRL			0xc0
+#define MIPI_CSIS_DBG_INTR_MSK			0xc4
+#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT	BIT(25)
+#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE	BIT(24)
+#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE	BIT(20)
+#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME	BIT(16)
+#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE		BIT(12)
+#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS		BIT(8)
+#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL	BIT(4)
+#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE	BIT(0)
+#define MIPI_CSIS_DBG_INTR_SRC			0xc8
+#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT	BIT(25)
+#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE	BIT(24)
+#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE	BIT(20)
+#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME	BIT(16)
+#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE		BIT(12)
+#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS		BIT(8)
+#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL	BIT(4)
+#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
 
 /* Non-image packet data buffers */
 #define MIPI_CSIS_PKTDATA_ODD			0x2000
@@ -210,6 +228,7 @@ enum {
 };
 
 struct mipi_csis_event {
+	bool debug;
 	u32 mask;
 	const char * const name;
 	unsigned int counter;
@@ -217,22 +236,30 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
-	{ MIPI_CSIS_INT_SRC_ERR_LOST_FS,	"Lost Frame Start Error" },
-	{ MIPI_CSIS_INT_SRC_ERR_LOST_FE,	"Lost Frame End Error" },
-	{ MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
-	{ MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
-	{ MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
-	{ MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
-	{ MIPI_CSIS_INT_SRC_ERR_UNKNOWN,	"Unknown Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
+	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
+	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
+	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
+	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
+	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
+	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
 	/* Non-image data receive events */
-	{ MIPI_CSIS_INT_SRC_EVEN_BEFORE,	"Non-image data before even frame" },
-	{ MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
-	{ MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
-	{ MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
+	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
+	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
+	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
+	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
 	/* Frame start/end */
-	{ MIPI_CSIS_INT_SRC_FRAME_START,	"Frame Start" },
-	{ MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
+	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
+	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
+	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
+	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
 };
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
@@ -455,6 +482,7 @@ static const struct csis_pix_format *find_csis_format(u32 code)
 static void mipi_csis_enable_interrupts(struct csi_state *state, bool on)
 {
 	mipi_csis_write(state, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
+	mipi_csis_write(state, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : 0);
 }
 
 static void mipi_csis_sw_reset(struct csi_state *state)
@@ -667,7 +695,7 @@ static void mipi_csis_clear_counters(struct csi_state *state)
 static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
 {
 	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
-				: MIPI_CSIS_NUM_EVENTS - 6;
+				: MIPI_CSIS_NUM_EVENTS - 8;
 	struct device *dev = &state->pdev->dev;
 	unsigned long flags;
 	unsigned int i;
@@ -963,22 +991,27 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	unsigned long flags;
 	unsigned int i;
 	u32 status;
+	u32 dbg_status;
 
 	status = mipi_csis_read(state, MIPI_CSIS_INT_SRC);
+	dbg_status = mipi_csis_read(state, MIPI_CSIS_DBG_INTR_SRC);
 
 	spin_lock_irqsave(&state->slock, flags);
 
 	/* Update the event/error counters */
 	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || state->debug) {
 		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
-			if (!(status & state->events[i].mask))
-				continue;
-			state->events[i].counter++;
+			struct mipi_csis_event *event = &state->events[i];
+
+			if ((!event->debug && (status & event->mask)) ||
+			    (event->debug && (dbg_status & event->mask)))
+				event->counter++;
 		}
 	}
 	spin_unlock_irqrestore(&state->slock, flags);
 
 	mipi_csis_write(state, MIPI_CSIS_INT_SRC, status);
+	mipi_csis_write(state, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
 
 	return IRQ_HANDLED;
 }
-- 
Regards,

Laurent Pinchart

