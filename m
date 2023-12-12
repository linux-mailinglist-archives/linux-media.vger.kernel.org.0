Return-Path: <linux-media+bounces-2194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6002B80E4CE
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 08:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16749284464
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 07:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50672171A1;
	Tue, 12 Dec 2023 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="KBUs8+5o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E472AB
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 23:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702366005; x=1733902005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qQez78PVg00OzHqMGmFwYpIlztTeIQA948el4aN56cM=;
  b=KBUs8+5odVi8GYBr9uihRQ8ZFVtaQd4bHPabHm0v5vkY2P3lqC130pFM
   579F9qLDk4aIPMsLzouu7GUUJYLVcuMRI9UVq87ZM52g6JbyBFbjFX4k7
   iSptAcnd7f8SPqBvoHzrsj41ribeTfh98NzJWkeZPPT6CE7+sCJYyp5Ao
   2dJigG8aKerTwzhD1DmrHC6RMiuAEYrQaM/C2UW9SixE8LPYeLeIPtuhs
   KWbFbCnJoUb97sl4dqvjcYXsSVgiinra8cOsHXzQInCMS61B1mFEjMG+g
   apKfpNhv519+KjEpQjm8BldqqRsKFSIVDcGRb1n9B+muBye+Z2kUYpP6v
   A==;
X-IronPort-AV: E=Sophos;i="6.04,269,1695679200"; 
   d="scan'208";a="34447324"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2023 08:26:41 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8941A280075;
	Tue, 12 Dec 2023 08:26:41 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: imx415: Add more clock configurations
Date: Tue, 12 Dec 2023 08:26:37 +0100
Message-Id: <20231212072637.67642-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212072637.67642-1-alexander.stein@ew.tq-group.com>
References: <20231212072637.67642-1-alexander.stein@ew.tq-group.com>
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
index a20ece87d6e23..7cc429b9ab258 100644
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


