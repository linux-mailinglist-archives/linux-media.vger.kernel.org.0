Return-Path: <linux-media+bounces-1647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3AE804D31
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 10:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B0E81C20AC0
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851C13D998;
	Tue,  5 Dec 2023 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="byKvK2QS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F1A11F
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 01:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701767169; x=1733303169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wAXP5DIZf71Tb0PhxEKywLelpwpcgMXkVU6fg2yDVio=;
  b=byKvK2QSy0xIeOh752IO/Mgn4aGl8POOxZmGsccDlXSQVa8azXzUMAiT
   WnNAbB0KvazLDMlAtdUcsaNsIFD5b2pWuBx2OlrkBRs87YEp0HlyQzZPw
   xkmvUi/Tz64rUkkU3ETNmfx6a1bQN2CoA9EODWsUgt0fNL2mUmnkEnZ+T
   DjiFfRAsEdPlA9+751HZCx5XhBtOX5FlRv3kJGcOHVCoiUS4jXzzrgHuw
   U7MUHeaQBWZqZJzi5vy8awX8PKRrj7igjXljtqVTNKFb4oHcL6dJUD3BB
   +0EGYlHkSZ4QfbIt9s5HWxv8Vrswc9tjXALjusswjQh00QwdBZ9ZeaYDQ
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,251,1695679200"; 
   d="scan'208";a="34328803"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Dec 2023 10:06:00 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 792F8280085;
	Tue,  5 Dec 2023 10:06:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: imx415: Add more clock configurations
Date: Tue,  5 Dec 2023 10:05:56 +0100
Message-Id: <20231205090557.298680-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete the list from "INCK Setting" section in IMX415-AAQR-C
(Rev. E19504, 2019/05/21)

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx415.c | 255 +++++++++++++++++++++++++++++++++++++
 1 file changed, 255 insertions(+)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index bb1a779defab..a222b9134aa2 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -128,6 +128,36 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[9] = { IMX415_INCKSEL7, 0x1 },
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
 	},
+	{
+		.lane_rate = 594000000,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x7 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x080 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0984 },
+	},
+	{
+		.lane_rate = 594000000,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x7 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x080 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
 	{
 		.lane_rate = 720000000,
 		.inck = 24000000,
@@ -143,6 +173,21 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[9] = { IMX415_INCKSEL7, 0x1 },
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
 	},
+	{
+		.lane_rate = 720000000,
+		.inck = 72000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0F8 },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B0 },
+		.regs[2] = { IMX415_SYS_MODE, 0x9 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1200 },
+	},
 	{
 		.lane_rate = 891000000,
 		.inck = 27000000,
@@ -158,6 +203,36 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[9] = { IMX415_INCKSEL7, 0x1 },
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
 	},
+	{
+		.lane_rate = 891000000,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x5 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 891000000,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x5 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
 	{
 		.lane_rate = 1440000000,
 		.inck = 24000000,
@@ -173,6 +248,21 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[9] = { IMX415_INCKSEL7, 0x0 },
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
 	},
+	{
+		.lane_rate = 1440000000,
+		.inck = 72000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0F8 },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B0 },
+		.regs[2] = { IMX415_SYS_MODE, 0x8 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1200 },
+	},
 	{
 		.lane_rate = 1485000000,
 		.inck = 27000000,
@@ -188,6 +278,171 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[9] = { IMX415_INCKSEL7, 0x0 },
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
 	},
+	{
+		.lane_rate = 1485000000,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x8 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 1485000000,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x8 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
+	{
+		.lane_rate = 1782000000,
+		.inck = 27000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
+		.regs[2] = { IMX415_SYS_MODE, 0x4 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x23 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C6 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
+		.regs[7] = { IMX415_INCKSEL5, 0x23 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
+	},
+	{
+		.lane_rate = 1782000000,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x4 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 1782000000,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x4 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
+	{
+		.lane_rate = 2079000000,
+		.inck = 27000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
+		.regs[2] = { IMX415_SYS_MODE, 0x2 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x23 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0E7 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
+		.regs[7] = { IMX415_INCKSEL5, 0x23 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
+	},
+	{
+		.lane_rate = 2079000000,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x2 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0E0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 2079000000,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x2 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0E0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
+	{
+		.lane_rate = 2376000000,
+		.inck = 27000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
+		.regs[2] = { IMX415_SYS_MODE, 0x0 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x23 },
+		.regs[5] = { IMX415_INCKSEL3, 0x108 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
+		.regs[7] = { IMX415_INCKSEL5, 0x23 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
+	},
+	{
+		.lane_rate = 2376000000,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x0 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x100 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 2376000000,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x0 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x100 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
 };
 
 /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
-- 
2.34.1


