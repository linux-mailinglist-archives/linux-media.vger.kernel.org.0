Return-Path: <linux-media+bounces-35719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E59AE5D41
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 08:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79B4217BE84
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 06:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B552517AA;
	Tue, 24 Jun 2025 06:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HyuE10GG"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9E24A06F;
	Tue, 24 Jun 2025 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748125; cv=none; b=G0B6M9t0JoIoW4MOzu0a9I1V2qXxS//KAEC0yG9galdJlo8O00bWWwm/zJ/gm5CAAafL+RCGjVsPjWoIE71B1m8ljm0pnMXZn0U+FbPlggviWdc582ywcg3fclnS1tA3M6/lu+XJwO7Jj8Zn/vDWn/JwjXvjzZX3H1ccInSS9P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748125; c=relaxed/simple;
	bh=aPPh+HmFQqsfhDNkaSovjYdAsLIQKoKFRNEszaYKM68=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JjlZzdMobR7m/dgYvhtSAtW8sSWvsJnECrSMTAsxDJeRTyUDi57Y9BEu2AbAwzWIi92Kn2N28m2LrehbYcHJRNzaQNrOtNFlOIEYEAZgJgZFcavyfCMBHfsQ8mXHrO9SwMKZRD2WzldZvm93hW6BPO6qJQiI6+oHwKC+E91Zz30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HyuE10GG; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750748123; x=1782284123;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aPPh+HmFQqsfhDNkaSovjYdAsLIQKoKFRNEszaYKM68=;
  b=HyuE10GGiW2NVPnG96q7TJH/XQ4ugFHuqNfMXxjwK/dt9ZHfOUeUVtPv
   WD32ruAPGWAn2svCZf1yU0KU/O6xj8x1pYGwti3KsYxeIWZd1l4wj7ftt
   hpH50v6qWaKixDsfjncfEE2xY6KxR27jn0ZBSlouQN9vR2JSIrsDXsKey
   c85LXbPskGunSC5opTfqC53qOdz5KRh0K9ObD8gO2JMvv4raxWrrpvwAe
   UBUF5lq91N6UUxbHU/7GI4ULezbQjohiDwCutBlNunUkhKLOquo2/zry9
   VZPcQcAmLuIbHg3O8ktlOTFop8wQQq7UFmVunAKmx2AjJ4SFMBnX6ukxe
   Q==;
X-CSE-ConnectionGUID: 0bOzDgvpTueJpEwYn8gY3g==
X-CSE-MsgGUID: oaqHzgTcTD68xEvHbKUqEA==
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="210622141"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jun 2025 23:55:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Jun 2025 23:54:51 -0700
Received: from hyd-ld-i35088a.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 23 Jun 2025 23:54:48 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH] media: i2c: imx334: add support for additional test patterns
Date: Tue, 24 Jun 2025 12:24:38 +0530
Message-ID: <20250624065438.2021044-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shravan Chippa <shravan.chippa@microchip.com>

Added support for three additional test patterns in the
IMX334 driver: Black and Grey Bars, Black Color, and White Color.

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 846b9928d4e8..43dd7edb48c8 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -118,6 +118,9 @@
 #define IMX334_REG_TP			CCI_REG8(0x329e)
 #define IMX334_TP_COLOR_HBARS		0xa
 #define IMX334_TP_COLOR_VBARS		0xb
+#define IMX334_TP_BLACK			0x0
+#define IMX334_TP_WHITE			0x1
+#define IMX334_TP_BLACK_GREY		0xC
 
 #define IMX334_TPG_EN_DOUT		CCI_REG8(0x329c)
 #define IMX334_TP_ENABLE		0x1
@@ -398,12 +401,18 @@ static const char * const imx334_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Color Bars",
 	"Horizontal Color Bars",
+	"Black and Grey Bars",
+	"Black Color",
+	"White Color",
 };
 
 static const int imx334_test_pattern_val[] = {
 	IMX334_TP_DISABLE,
 	IMX334_TP_COLOR_HBARS,
 	IMX334_TP_COLOR_VBARS,
+	IMX334_TP_BLACK_GREY,
+	IMX334_TP_BLACK,
+	IMX334_TP_WHITE,
 };
 
 static const struct cci_reg_sequence raw10_framefmt_regs[] = {
-- 
2.34.1


