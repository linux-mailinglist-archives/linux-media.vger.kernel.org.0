Return-Path: <linux-media+bounces-34266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 576D3AD0621
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 17:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB253B178A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAAF28E562;
	Fri,  6 Jun 2025 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d4cS8iDY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C6028DF3B;
	Fri,  6 Jun 2025 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224690; cv=none; b=bg4VJtx8be1g9LHmYWVmiKLq8FU2EmsTO6eZsdpulo/sOTDobWxVIxGwBIM1ZGqIurEudYlNWMhxm2GhWrU6Dq+1cotlxObJ3G5xBoPxIX3DDmSqzuoXwTuswsVBdllzOnlM99jAB4ZLVB1f3ViiZNjC/pGHkIgSxNORJuWZUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224690; c=relaxed/simple;
	bh=JufAzRLKwdF7p6LD7Zi2lXLBjYvC7TdfCa99ZsqFE1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kY7F93qfk/AEOZTACbonq8neTf4dmZle64FwA2hantAyXij1XoDZUqOstxXFovDwyjwJXWCPW5CrTOmg66ZgTPm2+WWd1o9Vgkc9gfrN7KkGKHnhgo3oBCoytIo3HZb6iMUCdIbYDDQZM6dechYwtzws7Jt91hFap1kjahMW0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d4cS8iDY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.localdomain (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39FC711DD;
	Fri,  6 Jun 2025 17:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749224683;
	bh=JufAzRLKwdF7p6LD7Zi2lXLBjYvC7TdfCa99ZsqFE1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d4cS8iDY9Vay0JBQwOMtv9K2pq35drIUecmkmGPsRZbivIF+wpunE7NXSyov4EQjD
	 AIkzTQq1ToL7EFqzbkWKy3odfGc+FRfO2ByARpL/ZeJxdUwQxCZLzpCyjFEaMFCTu7
	 4TJ7w2ABB/PsNZuGGt5bJRy/N39iVKavOYNAnV2k=
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
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 2/2] media: platform: Add user line interrupt to imx-mipi-csis driver
Date: Fri,  6 Jun 2025 16:44:14 +0100
Message-ID: <20250606154414.540290-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606154414.540290-1-isaac.scott@ideasonboard.com>
References: <20250606154414.540290-1-isaac.scott@ideasonboard.com>
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

---

Changes since v1:
- Moved from magic number to enum in status_index
- Clear INT_MSK_1 in enable_interrupts() when on == false
- use local variable in set_params() as in the interrupt handler
- move interrupt handling code outside of spinlock
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 394987d72c64..1b71f6c19fa8 100644
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
 	MAIN = 0,
 	DEBUG = 1,
+	USER = 2,
 };
 
 struct mipi_csis_event {
@@ -286,6 +296,8 @@ static const struct mipi_csis_event mipi_csis_events[] = {
 	{ MAIN, MIPI_CSIS_INT_SRC_FRAME_END,			"Frame End"},
 	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,		"VSYNC Falling Edge"},
 	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,		"VSYNC Rising Edge"},
+	/* User Line interrupt */
+	{ USER, MIPI_CSIS_INT_SRC_1_LINE_END,			"Line End"}
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
 
@@ -533,6 +548,8 @@ static void mipi_csis_enable_interrupts(struct mipi_csis_device *csis, bool on)
 {
 	mipi_csis_write(csis, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
 	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : 0);
+	mipi_csis_write(csis, MIPI_CSIS_INT_MSK_1,
+			on ? MIPI_CSIS_INT_MSK_1_LINE_END : 0);
 }
 
 static void mipi_csis_sw_reset(struct mipi_csis_device *csis)
@@ -655,6 +672,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 				 const struct csis_pix_format *csis_fmt)
 {
 	int lanes = csis->bus.num_data_lanes;
+	u32 int_lines;
 	u32 val;
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
@@ -691,6 +709,13 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_DPHY_BCTRL_L_B_DPHYCTRL(20000000));
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_H, 0);
 
+	int_lines = READ_ONCE(csis->debug.int_line);
+	if (int_lines > 0)
+		mipi_csis_write(csis, MIPI_CSIS_LINE_INTERRUPT_RATIO(0),
+				max(int_lines, 1U) - 1);
+
+	csis->debug.last_int_line = int_lines;
+
 	/* Update the shadow register. */
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
@@ -770,10 +795,12 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	struct mipi_csis_device *csis = dev_id;
 	unsigned long flags;
 	unsigned int i;
-	u32 status[2];
+	u32 int_lines;
+	u32 status[3];
 
 	status[MAIN] = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
 	status[DEBUG] = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
+	status[USER] = mipi_csis_read(csis, MIPI_CSIS_INT_SRC_1);
 
 	spin_lock_irqsave(&csis->slock, flags);
 
@@ -792,8 +819,16 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 
 	spin_unlock_irqrestore(&csis->slock, flags);
 
+	int_lines = READ_ONCE(csis->debug.int_line);
+	if (int_lines != csis->debug.last_int_line) {
+		mipi_csis_write(csis, MIPI_CSIS_LINE_INTERRUPT_RATIO(0),
+				max(int_lines, 1U) - 1);
+		csis->debug.last_int_line = int_lines;
+	}
+
 	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[MAIN]);
 	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[DEBUG]);
+	mipi_csis_write(csis, MIPI_CSIS_INT_SRC_1, status[USER]);
 
 	return IRQ_HANDLED;
 }
@@ -933,6 +968,7 @@ static void mipi_csis_debugfs_init(struct mipi_csis_device *csis)
 {
 	csis->debug.hs_settle = UINT_MAX;
 	csis->debug.clk_settle = UINT_MAX;
+	csis->debug.int_line = 0;
 
 	csis->debugfs_root = debugfs_create_dir(dev_name(csis->dev), NULL);
 
@@ -944,6 +980,8 @@ static void mipi_csis_debugfs_init(struct mipi_csis_device *csis)
 			   &csis->debug.clk_settle);
 	debugfs_create_u32("ths_settle", 0600, csis->debugfs_root,
 			   &csis->debug.hs_settle);
+	debugfs_create_u32("int_line_0", 0600, csis->debugfs_root,
+			   &csis->debug.int_line);
 }
 
 static void mipi_csis_debugfs_exit(struct mipi_csis_device *csis)
-- 
2.43.0


