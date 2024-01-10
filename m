Return-Path: <linux-media+bounces-3461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 683BC82996A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 12:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC0DE1F248A7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 11:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BA0481B2;
	Wed, 10 Jan 2024 11:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qW6k1oi/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F3547F41
	for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 11:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704886950; x=1736422950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jP0eqahg/V99axzyHcPdhhfMx4/BdOsY1ztEdYMgiCk=;
  b=qW6k1oi/VRb8qQF3jcFr97ZS7Tx9FM9dBXwp4ND7eFIbkkJGqtBEl6uH
   +s2N+eb9HD667pcoXPSUi/jQWV2kZzFDzWypLXx65LnTLFQEshYLlo3Jv
   uhfEtOEsph7U5Jod8BMDJ1UJhF6+SYd/ecqTp4qfaFQc1macurwUm0F7p
   KEn8mPI21/EMhMWAS4hjTyiBP7hdUQjRFQMsoXouvKJTvpTd/mFCal9iq
   5myz6yClRJIFZ9msgHYI26f41V4mxVIengBlrvQP4n/aWqD1sz8dpv6iy
   kSBz7tae5pHidJrcG32K586vBWKhcws9Pt7IHQrPhetVLOFNbqm4r41Lz
   A==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; 
   d="scan'208";a="34827598"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2024 12:42:22 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 61490280075;
	Wed, 10 Jan 2024 12:42:22 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/2] media: i2c: imx415: Add more clock configurations
Date: Wed, 10 Jan 2024 12:42:16 +0100
Message-Id: <20240110114216.504690-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110114216.504690-1-alexander.stein@ew.tq-group.com>
References: <20240110114216.504690-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete the list from "INCK Setting" section in IMX415-AAQR-C
(Rev. E19504, 2019/05/21). For consistency suffix all lane rate values by
UL, which is needed for 2376000000 anyway.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx415.c | 265 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 260 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index c62eba5b72168..89ec1167ba8a5 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -114,7 +114,7 @@ struct imx415_clk_params {
 /* INCK Settings - includes all lane rate and INCK dependent registers */
 static const struct imx415_clk_params imx415_clk_params[] = {
 	{
-		.lane_rate = 594000000,
+		.lane_rate = 594000000UL,
 		.inck = 27000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
@@ -129,7 +129,37 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
 	},
 	{
-		.lane_rate = 720000000,
+		.lane_rate = 594000000UL,
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
+		.lane_rate = 594000000UL,
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
+	{
+		.lane_rate = 720000000UL,
 		.inck = 24000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
@@ -144,7 +174,22 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
 	},
 	{
-		.lane_rate = 891000000,
+		.lane_rate = 720000000UL,
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
+	{
+		.lane_rate = 891000000UL,
 		.inck = 27000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
@@ -159,7 +204,37 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
 	},
 	{
-		.lane_rate = 1440000000,
+		.lane_rate = 891000000UL,
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
+		.lane_rate = 891000000UL,
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
+	{
+		.lane_rate = 1440000000UL,
 		.inck = 24000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
@@ -174,7 +249,22 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
 	},
 	{
-		.lane_rate = 1485000000,
+		.lane_rate = 1440000000UL,
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
+	{
+		.lane_rate = 1485000000UL,
 		.inck = 27000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
@@ -188,6 +278,171 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[9] = { IMX415_INCKSEL7, 0x0 },
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
 	},
+	{
+		.lane_rate = 1485000000UL,
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
+		.lane_rate = 1485000000UL,
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
+		.lane_rate = 1782000000UL,
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
+		.lane_rate = 1782000000UL,
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
+		.lane_rate = 1782000000UL,
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
+		.lane_rate = 2079000000UL,
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
+		.lane_rate = 2079000000UL,
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
+		.lane_rate = 2079000000UL,
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
+		.lane_rate = 2376000000UL,
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
+		.lane_rate = 2376000000UL,
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
+		.lane_rate = 2376000000UL,
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


