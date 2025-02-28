Return-Path: <linux-media+bounces-27213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 904ADA49781
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81B5B16D376
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A2A25F79A;
	Fri, 28 Feb 2025 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rA61Ea4E"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D425DCE5;
	Fri, 28 Feb 2025 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738936; cv=none; b=L6ZpXaHgzO8z57sjUVZgBeBVSB6YoMQccH0epKUNjW/KLAH5NwHXIPRoUiy4uxrv3sAwRZr0QqkwWK89wc73CKulY09lisVs1ZqBsGm0uZW6R6K07O6pKPx4ckTanPJlZG0ewWxCb113yZQVQAC3XCJgn5vFkuA3vur76mirdoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738936; c=relaxed/simple;
	bh=DHSdtp+XdtA3NPlxrJ57qvr55VazblL+nsCKRKoaPpo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQa1LhN83WMRxgzvmRPw6vcVnEhCvyMV4lctFpjfvdZF46wH53z8sisncSbQvxXiqK+6UASF6YtupPJ48JtP1E56nX0WyU+/mRWL5UU2Fii7Bar2soxDLMa4jIoZmAh6Yk6gU1ixvTjKvfMmWb5fu0upyfEQxIs6aZCwOctGrfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=rA61Ea4E; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740738934; x=1772274934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DHSdtp+XdtA3NPlxrJ57qvr55VazblL+nsCKRKoaPpo=;
  b=rA61Ea4ETnupT3PKS7nHqTqebqA84e9tvRrVDM+o61kMhGejeg6tR3ii
   OxrG16MeT14Lfb7CjImMsG/lftNMFBzlPkIDSRsVV284Xy/NJupTljTUO
   ZnY+G4GXjlOGkbmf5gfIHHUnYvDLZigqKAVPLOmVCxAPbN4lRMzUQxPcQ
   h0SrePD0j8RUZxXUM2s27NwVjA1mch54ZITWZQXGkbOmOnItwCNTml6Kj
   DmfYtlB98dgrZJHbSargbkDqTxxbadUjii47k0jFBotTtaCphidikSMwl
   p137FVX/AKquTNpfho1gGNejW5OL+C5jPDDhlTNU75pk34gmasnZU5Bqo
   g==;
X-CSE-ConnectionGUID: JknLepFYT8+gGnbGNwKrzg==
X-CSE-MsgGUID: euHk0iX9RZ6/bFeHB0LeVg==
X-IronPort-AV: E=Sophos;i="6.13,322,1732604400"; 
   d="scan'208";a="205787153"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2025 03:35:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Feb 2025 03:35:27 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Feb 2025 03:35:24 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V6 3/3] media: i2c: imx334: add modes for 720p and 480p resolutions
Date: Fri, 28 Feb 2025 16:03:32 +0530
Message-ID: <20250228103332.3647098-4-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228103332.3647098-1-shravan.chippa@microchip.com>
References: <20250228103332.3647098-1-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shravan Chippa <shravan.chippa@microchip.com>

Added support for 1280x720@30 and 640x480@30 resolutions

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 66 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index f80a8ce8f9c5..b8d63e0fad66 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -314,6 +314,46 @@ static const struct imx334_reg common_mode_regs[] = {
 	{0x3002, 0x00},
 };
 
+/* Sensor mode registers for 640x480@30fps */
+static const struct imx334_reg mode_640x480_regs[] = {
+	{0x302c, 0x70},
+	{0x302d, 0x06},
+	{0x302e, 0x80},
+	{0x302f, 0x02},
+	{0x3074, 0x48},
+	{0x3075, 0x07},
+	{0x308e, 0x49},
+	{0x308f, 0x07},
+	{0x3076, 0xe0},
+	{0x3077, 0x01},
+	{0x3090, 0xe0},
+	{0x3091, 0x01},
+	{0x3308, 0xe0},
+	{0x3309, 0x01},
+	{0x30d8, 0x30},
+	{0x30d9, 0x0b},
+};
+
+/* Sensor mode registers for 1280x720@30fps */
+static const struct imx334_reg mode_1280x720_regs[] = {
+	{0x302c, 0x30},
+	{0x302d, 0x05},
+	{0x302e, 0x00},
+	{0x302f, 0x05},
+	{0x3074, 0x84},
+	{0x3075, 0x03},
+	{0x308e, 0x85},
+	{0x308f, 0x03},
+	{0x3076, 0xd0},
+	{0x3077, 0x02},
+	{0x3090, 0xd0},
+	{0x3091, 0x02},
+	{0x3308, 0xd0},
+	{0x3309, 0x02},
+	{0x30d8, 0x30},
+	{0x30d9, 0x0b},
+};
+
 /* Sensor mode registers for 1920x1080@30fps */
 static const struct imx334_reg mode_1920x1080_regs[] = {
 	{0x302c, 0xf0},
@@ -434,6 +474,32 @@ static const struct imx334_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
 		},
+	}, {
+		.width = 1280,
+		.height = 720,
+		.hblank = 2480,
+		.vblank = 1170,
+		.vblank_min = 45,
+		.vblank_max = 132840,
+		.pclk = 297000000,
+		.link_freq_idx = 1,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
+			.regs = mode_1280x720_regs,
+		},
+	}, {
+		.width = 640,
+		.height = 480,
+		.hblank = 2480,
+		.vblank = 1170,
+		.vblank_min = 45,
+		.vblank_max = 132840,
+		.pclk = 297000000,
+		.link_freq_idx = 1,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_640x480_regs),
+			.regs = mode_640x480_regs,
+		},
 	},
 };
 
-- 
2.34.1


