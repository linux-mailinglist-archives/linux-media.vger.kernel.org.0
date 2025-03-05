Return-Path: <linux-media+bounces-27539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C78D6A4F66E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FBC5189039D
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 05:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C661DB15F;
	Wed,  5 Mar 2025 05:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BtFtxWEq"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B1E1C8635;
	Wed,  5 Mar 2025 05:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151805; cv=none; b=VDGV1+msZhNX6o2rQJhYLSdwZtxBAV71YH6BLHS7JUv/b2t0D39AnrgIOnrI/boph5IFMRwwiVz94soVpp4DOOiYOOC4FlLVnZeRVFi15lHJasjQK9HfpTTjdNzKI/vI91UWi122CvD6zJPb8QkMhj56OrrEeTnyK0T4Yh3JPJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151805; c=relaxed/simple;
	bh=xsTeBXIKpjdBNQ/TITvJzce8eDHE/+kyUUqLsxGz8/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELNlMsTXp7nZUfwUSuu1MkPIicPeTCMEwWj1O6UJ4H9Cbb9G2pmlwsneaQgX53BP09DefmgoJxXXoa5kjxciOvoH5hVF/Q8OcXUZIg+jDHNDxpTwELlalA0jXUvEFnd/oh1xqryUzx224A1Esi9CFnM5SjoFCPufjOz9XNGgeBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=BtFtxWEq; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741151804; x=1772687804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xsTeBXIKpjdBNQ/TITvJzce8eDHE/+kyUUqLsxGz8/I=;
  b=BtFtxWEqguoWetZIGQ5y+eDv6oCoGeE7gEKgSh0EVAhmP/D4LoPoXGSm
   4QNHyc0dKGebk8Ar+kmst4DaemRePMilhKNUVZA6Vptaqjm3vthp4sle0
   SgAIfS+H5PGFvE7mXgxEQ/bv4AOXGFTWZ+TVuyJVfJsa3iwAez7QtH2KN
   /gx8Q3NiMxzwvobCVlHlgk9Ub54mpElaMFXsPDnN9vc7Z8oDRp8j6fXze
   qs6kiIU9/OY55GqqijI1TVo2vT8vLjsFiMgSvoAoL1gOLGg2uDi4ca0rG
   xEZOi+k48M9RSSsfeVzUBvJcmqxMHjAqRnQ5/caoofM1VXp4zcV1b4tm0
   g==;
X-CSE-ConnectionGUID: Blbl5gjCRMSkEPMLME7zkg==
X-CSE-MsgGUID: sEYOOxBTRbWb9K7/jwzvUg==
X-IronPort-AV: E=Sophos;i="6.14,222,1736838000"; 
   d="scan'208";a="205972042"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2025 22:16:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Mar 2025 22:16:33 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 4 Mar 2025 22:16:30 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V7 2/4] media: i2c: imx334: common reg value correction
Date: Wed, 5 Mar 2025 10:44:40 +0530
Message-ID: <20250305051442.3716817-3-shravan.chippa@microchip.com>
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

correcting the CPWAIT_TIME value as per the data sheet
for the link frequency and input clock

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index db61b298ceb3..0b42bc0470a1 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -191,7 +191,7 @@ static const struct imx334_reg common_mode_regs[] = {
 	{0x31a0, 0x20},
 	{0x31a1, 0x0f},
 	{0x300c, 0x3b},
-	{0x300d, 0x29},
+	{0x300d, 0x2a},
 	{0x314c, 0x29},
 	{0x314d, 0x01},
 	{0x315a, 0x06},
-- 
2.34.1


