Return-Path: <linux-media+bounces-27541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81625A4F674
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF6D17A74BF
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 05:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781541D8A12;
	Wed,  5 Mar 2025 05:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="w8GkhLlQ"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452C01C8623;
	Wed,  5 Mar 2025 05:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151836; cv=none; b=bU/IxfhO73X+jzl2uDPENIevH/2Tdx2/O6cBalrvaOfM2Z9lLvcHTD5ROpb+KIUX8qVWILosMDzJwZlxhc4xWYhCFqWSSAZxJwHGmt8cpTIqALnE4lq3E5FaKMvrROGYEHEw+WM3/GHPYwuC0VrHuFYEEg1Ccq7EPTNEafclO0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151836; c=relaxed/simple;
	bh=W2Nsx/pqRmI3mmKlVgCwig3ab6N3gpZoWxrsOoAIqjU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T2lDwy6J+hzVh7yhJNHLkN+Z+v2S0ePGuB3SQ3OT46YPbKdlZH4VHymMuZXhMwf4W55v8KuUY2dPFec9aBqOAYAsax0Z0b/S5MzHzzY0KaGKGQFcAVHSENLqgZhucuTh8FM8GnTavi0GC8ISw++M0TBZcm03+hUkWsvEzX7q7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=w8GkhLlQ; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741151836; x=1772687836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W2Nsx/pqRmI3mmKlVgCwig3ab6N3gpZoWxrsOoAIqjU=;
  b=w8GkhLlQQ3EeZDLAi38wuEssfmvCa9vQdm4RD7Yu7CCw88E84uXLpYG6
   VTuWZdYd1ezXGwo6KV/rX6TbSwRTv8aItUFCFe/pk8zW/1cWMuoAKflgF
   Ha1FzjuD3WZdrIDAMukUXrg7pjq115BTJdEgbpLnH3eTvvDQSKifFeknQ
   Lwbyncrt67ZAquDLyyrh0yAtzXewEKvp+iNfFfL3s7qqKsCrlJHujedsW
   Zqu6QZGWxX3p9Znt5NkZ5emve+RZPkCebMlsJVtTmDcRulknHyuNaz+DK
   VUXjMhxT8ljxAqt5kxcDKOvd6H/5ClhzaWzK/2WuTg15t+mxDJ2Uy81IE
   w==;
X-CSE-ConnectionGUID: hd3A3q2XTOaw0tKDefSG0A==
X-CSE-MsgGUID: 0m1xHRa8QZC7XgUJmo/SkQ==
X-IronPort-AV: E=Sophos;i="6.14,222,1736838000"; 
   d="scan'208";a="38432578"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2025 22:17:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Mar 2025 22:16:40 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 4 Mar 2025 22:16:37 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p resolutions
Date: Wed, 5 Mar 2025 10:44:42 +0530
Message-ID: <20250305051442.3716817-5-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305051442.3716817-1-shravan.chippa@microchip.com>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com>
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
index a7c0bd38c9b8..8cd1eecd0143 100644
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
@@ -433,6 +473,32 @@ static const struct imx334_mode supported_modes[] = {
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


