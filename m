Return-Path: <linux-media+bounces-34265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0614FAD060E
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 17:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D736317C388
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F99D28DF34;
	Fri,  6 Jun 2025 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ovxbnmE2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB1828AAE9;
	Fri,  6 Jun 2025 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224688; cv=none; b=Hy9T9c0m5OCjlN4/WIFaZ8lCxpXAx9SISn6p+m5Jsl+QWG4rOwoya0AZd+d6o8Kzox/ZBkL46kPWhKAs/efJWQw+MVNiT0CxqJqyn6zyzYKgt0lhyPSzPHaPwFcnFBFRempftHAHHfNuLMJbgMJIYBbYzVGcZu9jqaDBZD+LV/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224688; c=relaxed/simple;
	bh=bejcWE6MQotWr+1JFHVSPWJJJKLq7InC7Ch4izqVrXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNYuMeJTPOk3873knxMnDJgoafD08jV5UGxKAF3VcXSjUHvoX3Ud07hZOA4xfBX+qvAv1g4AX8PtpBUxa1SXGFaNPcAnLRTMpont8D1Qf1OcCguDGt8TBRYm3KToMceTsLOOrIklsrFk9kkjkOuPMsxS/loZbQUDO4QaZz8PaMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ovxbnmE2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.localdomain (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE79B8DB;
	Fri,  6 Jun 2025 17:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749224679;
	bh=bejcWE6MQotWr+1JFHVSPWJJJKLq7InC7Ch4izqVrXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ovxbnmE2VtCRNGFFn6Y/Y28e3TS0gul1iMWvBZ0oTl7cf9sUFP6M+uI4eLle45qJD
	 vHIbnvVtJMTg79zG+VAXFXoq5ys84rNlNsoSH25B0ne0nApxLYHFTSILfc22ie+Bwg
	 IwkOYYkr3ztwgBG/8xH20EflANXJ3CyfACzuTVo4=
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
Subject: [PATCH v2 1/2] media: platform: Refactor interrupt status registers
Date: Fri,  6 Jun 2025 16:44:13 +0100
Message-ID: <20250606154414.540290-2-isaac.scott@ideasonboard.com>
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

The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and debug
status sources which span multiple registers. The driver currently
supports two interrupt source registers, and attributes the
mipi_csis_event event entries to those registers through a boolean debug
field that indicate if the event relates to the main interrupt status
(false) or debug interrupt status (true) register. To make it easier to
add new event fields, replace the debug bool with a 'status index'
integer than indicates the index of the corresponding status register.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---

Changes since v1:
- Switched from magic numbers to enum.
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 69 +++++++++++-----------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d060eadebc7a..394987d72c64 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -248,8 +248,13 @@
 #define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
 #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
 
+enum mipi_csis_event_type {
+	MAIN = 0,
+	DEBUG = 1,
+};
+
 struct mipi_csis_event {
-	bool debug;
+	enum mipi_csis_event_type status_index;
 	u32 mask;
 	const char * const name;
 	unsigned int counter;
@@ -257,30 +262,30 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
+	{ MAIN, MIPI_CSIS_INT_SRC_ERR_SOT_HS,			"SOT Error"},
+	{ MAIN, MIPI_CSIS_INT_SRC_ERR_LOST_FS,			"Lost Frame Start Error"},
+	{ MAIN, MIPI_CSIS_INT_SRC_ERR_LOST_FE,			"Lost Frame End Error"},
+	{ MAIN, MIPI_CSIS_INT_SRC_ERR_OVER,			"FIFO Overflow Error"},
+	{ MAIN, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error"},
+	{ MAIN, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
+	{ MAIN, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
+	{ MAIN, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,			"Unknown Error"},
+	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,		"Data Type Not Supported"},
+	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored"},
+	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,		"Frame Size Error"},
+	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame"},
+	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early Frame End"},
+	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early Frame Start"},
 	/* Non-image data receive events */
-	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
-	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
-	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
-	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
+	{ MAIN, MIPI_CSIS_INT_SRC_EVEN_BEFORE,			"Non-image data before even frame"},
+	{ MAIN, MIPI_CSIS_INT_SRC_EVEN_AFTER,			"Non-image data after even frame"},
+	{ MAIN, MIPI_CSIS_INT_SRC_ODD_BEFORE,			"Non-image data before odd frame"},
+	{ MAIN, MIPI_CSIS_INT_SRC_ODD_AFTER,			"Non-image data after odd frame"},
 	/* Frame start/end */
-	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
-	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
+	{ MAIN, MIPI_CSIS_INT_SRC_FRAME_START,			"Frame Start"},
+	{ MAIN, MIPI_CSIS_INT_SRC_FRAME_END,			"Frame End"},
+	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,		"VSYNC Falling Edge"},
+	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,		"VSYNC Rising Edge"},
 };
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
@@ -765,32 +770,30 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	struct mipi_csis_device *csis = dev_id;
 	unsigned long flags;
 	unsigned int i;
-	u32 status;
-	u32 dbg_status;
+	u32 status[2];
 
-	status = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
-	dbg_status = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
+	status[MAIN] = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
+	status[DEBUG] = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
 
 	spin_lock_irqsave(&csis->slock, flags);
 
 	/* Update the event/error counters */
-	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
+	if ((status[MAIN] & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
 		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
 			struct mipi_csis_event *event = &csis->events[i];
 
-			if ((!event->debug && (status & event->mask)) ||
-			    (event->debug && (dbg_status & event->mask)))
+			if (status[event->status_index] & event->mask)
 				event->counter++;
 		}
 	}
 
-	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
+	if (status[MAIN] & MIPI_CSIS_INT_SRC_FRAME_START)
 		mipi_csis_queue_event_sof(csis);
 
 	spin_unlock_irqrestore(&csis->slock, flags);
 
-	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
-	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
+	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[MAIN]);
+	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[DEBUG]);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0


