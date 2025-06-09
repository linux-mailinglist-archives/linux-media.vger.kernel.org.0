Return-Path: <linux-media+bounces-34336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F79AD1B36
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 12:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51F16188D78E
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 10:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD178252912;
	Mon,  9 Jun 2025 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bx7Zpgq9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2B32505AF;
	Mon,  9 Jun 2025 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463567; cv=none; b=d9xr1wISctzYambqvYkd+3erossDLDJt9cMJDQeycGPLovGcvW8pdxioabdDZ4ydA9ZAWiQ7aoV91CSpHSaH2ezkJPh6UExvnxYHXqkzoFxlKy9hk9e5IjM4D1dFiqJqOxVQe+VjyvylidPaO7QRz4MssDniX507BMoQXC0TRsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463567; c=relaxed/simple;
	bh=nUXwW/kfcyPoabPPGhNF/JzaC/ZMwZ23lGvL1p04f+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCUtGpdHX0TjIEyCyEgralvKgBw3V8e8VrinnHFI2ryfTMbXYPysF2Y4tQtrqViRb1ZFaUHS9EHbun0puG03bjM1MXkDnf+pt2ahavWYh3vdemiKTfR2W58ha3Yv8DI8I8GtQIUR2rCcoxte3rh7DwRp3K07dvy4HNWgMxRzfUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bx7Zpgq9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DCA9D77;
	Mon,  9 Jun 2025 12:05:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749463555;
	bh=nUXwW/kfcyPoabPPGhNF/JzaC/ZMwZ23lGvL1p04f+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bx7Zpgq9nLqrpD8n6KV0AaTMF0pjoRUQ/pUw6F/obRckISldifmMdvKXnfoZo4VNC
	 upH3+JjDtuKvlwBKtVORfh9PQ2SHeGlcTyIGfGOuvpfOCZcBAn0RS9RvjfHbFxE8ox
	 fluXwEllCLnQYhfHm23m2R6xa+VPZJuqwiRucbD0=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: kieran.bingham@ideasonboard.com,
	rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 2/2] media: imx-mipi-csis: Add user line interrupt to imx-mipi-csis driver
Date: Mon,  9 Jun 2025 11:05:44 +0100
Message-ID: <20250609100544.571821-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609100544.571821-1-isaac.scott@ideasonboard.com>
References: <20250609100544.571821-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NXP i.MX 8M Plus features an interrupt that triggers after the MIPI
CSI receiver counts a user-configurable number of lines. This is useful
for debugging, as it allows users to check if the amount of lines per
frame equals what they are expecting.

Add support for this interrupt in the driver, and an entry into debugfs
to allow the user to configure whether the interrupt is enabled, as well
as the number of lines after which to trigger the interrupt.

This debugfs control can be altered while a stream is in progress, with
0 disabling the interrupt and >0 setting a new desired line count.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

---

Changes since v2:
- The interrupt is no longer enabled by default when debug is on
- Renamed enum from USER to MIPI_CSIS_EVENT_TYPE_MAIN_1
- Removed redundant if statement in set_params()
- Added imx-mipi-csis to commit title

Changes since v1:
- Moved from magic number to enum in status_index
- Clear INT_MSK_1 in enable_interrupts() when on == false
- use local variable in set_params() as in the interrupt handler
- move interrupt handling code outside of spinlock
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 39 +++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 72432a8062f5..795a9d499de4 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -88,6 +88,10 @@
 #define MIPI_CSIS_INT_MSK_ERR_CRC		BIT(1)
 #define MIPI_CSIS_INT_MSK_ERR_UNKNOWN		BIT(0)
 
+/* CSIS Interrupt mask 1 */
+#define MIPI_CSIS_INT_MSK_1			0x18
+#define MIPI_CSIS_INT_MSK_1_LINE_END		BIT(0)
+
 /* CSIS Interrupt source */
 #define MIPI_CSIS_INT_SRC			0x14
 #define MIPI_CSIS_INT_SRC_EVEN_BEFORE		BIT(31)
@@ -109,6 +113,10 @@
 #define MIPI_CSIS_INT_SRC_ERR_UNKNOWN		BIT(0)
 #define MIPI_CSIS_INT_SRC_ERRORS		0xfffff
 
+/* CSIS Interrupt source 1 */
+#define MIPI_CSIS_INT_SRC_1			0x1c
+#define MIPI_CSIS_INT_SRC_1_LINE_END		BIT(0)
+
 /* D-PHY status control */
 #define MIPI_CSIS_DPHY_STATUS			0x20
 #define MIPI_CSIS_DPHY_STATUS_ULPS_DAT		BIT(8)
@@ -221,6 +229,7 @@
 #define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
 
 #define MIPI_CSIS_FRAME_COUNTER_CH(n)		(0x0100 + (n) * 4)
+#define MIPI_CSIS_LINE_INTERRUPT_RATIO(n)	(0x0110 + (n) * 4)
 
 /* Non-image packet data buffers */
 #define MIPI_CSIS_PKTDATA_ODD			0x2000
@@ -251,6 +260,7 @@
 enum mipi_csis_event_type {
 	MIPI_CSIS_EVENT_TYPE_MAIN_0 = 0,
 	MIPI_CSIS_EVENT_TYPE_DEBUG = 1,
+	MIPI_CSIS_EVENT_TYPE_MAIN_1 = 2,
 };
 
 struct mipi_csis_event {
@@ -286,6 +296,8 @@ static const struct mipi_csis_event mipi_csis_events[] = {
 	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End"},
 	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge"},
 	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge"},
+	/* User Line interrupt */
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_1, MIPI_CSIS_INT_SRC_1_LINE_END,		"Line End"}
 };
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
@@ -338,11 +350,14 @@ struct mipi_csis_device {
 
 	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
+
 	struct dentry *debugfs_root;
 	struct {
 		bool enable;
 		u32 hs_settle;
 		u32 clk_settle;
+		u32 int_line;
+		u32 last_int_line;
 	} debug;
 };
 
@@ -655,6 +670,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 				 const struct csis_pix_format *csis_fmt)
 {
 	int lanes = csis->bus.num_data_lanes;
+	u32 int_lines;
 	u32 val;
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
@@ -691,6 +707,12 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_DPHY_BCTRL_L_B_DPHYCTRL(20000000));
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_H, 0);
 
+	int_lines = READ_ONCE(csis->debug.int_line);
+	mipi_csis_write(csis, MIPI_CSIS_LINE_INTERRUPT_RATIO(0),
+			max(int_lines, 1U) - 1);
+
+	csis->debug.last_int_line = int_lines;
+
 	/* Update the shadow register. */
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
@@ -770,12 +792,15 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	struct mipi_csis_device *csis = dev_id;
 	unsigned long flags;
 	unsigned int i;
-	u32 status[2];
+	u32 int_lines;
+	u32 status[3];
 
 	status[MIPI_CSIS_EVENT_TYPE_MAIN_0] =
 				mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
 	status[MIPI_CSIS_EVENT_TYPE_DEBUG] =
 				mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
+	status[MIPI_CSIS_EVENT_TYPE_MAIN_1] =
+				mipi_csis_read(csis, MIPI_CSIS_INT_SRC_1);
 
 	spin_lock_irqsave(&csis->slock, flags);
 
@@ -795,10 +820,19 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 
 	spin_unlock_irqrestore(&csis->slock, flags);
 
+	int_lines = READ_ONCE(csis->debug.int_line);
+	if (int_lines != csis->debug.last_int_line) {
+		mipi_csis_write(csis, MIPI_CSIS_LINE_INTERRUPT_RATIO(0),
+				max(int_lines, 1U) - 1);
+		csis->debug.last_int_line = int_lines;
+	}
+
 	mipi_csis_write(csis, MIPI_CSIS_INT_SRC,
 			status[MIPI_CSIS_EVENT_TYPE_MAIN_0]);
 	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC,
 			status[MIPI_CSIS_EVENT_TYPE_DEBUG]);
+	mipi_csis_write(csis, MIPI_CSIS_INT_SRC_1,
+			status[MIPI_CSIS_EVENT_TYPE_MAIN_1]);
 
 	return IRQ_HANDLED;
 }
@@ -938,6 +972,7 @@ static void mipi_csis_debugfs_init(struct mipi_csis_device *csis)
 {
 	csis->debug.hs_settle = UINT_MAX;
 	csis->debug.clk_settle = UINT_MAX;
+	csis->debug.int_line = 0;
 
 	csis->debugfs_root = debugfs_create_dir(dev_name(csis->dev), NULL);
 
@@ -949,6 +984,8 @@ static void mipi_csis_debugfs_init(struct mipi_csis_device *csis)
 			   &csis->debug.clk_settle);
 	debugfs_create_u32("ths_settle", 0600, csis->debugfs_root,
 			   &csis->debug.hs_settle);
+	debugfs_create_u32("int_line_0", 0600, csis->debugfs_root,
+			   &csis->debug.int_line);
 }
 
 static void mipi_csis_debugfs_exit(struct mipi_csis_device *csis)
-- 
2.43.0


