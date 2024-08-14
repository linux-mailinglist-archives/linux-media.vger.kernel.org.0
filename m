Return-Path: <linux-media+bounces-16260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB29951135
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 02:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D673284C18
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 00:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EEB171C2;
	Wed, 14 Aug 2024 00:54:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225816138;
	Wed, 14 Aug 2024 00:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723596876; cv=none; b=S2hAHpwLvdths2uxKPUNNr5SNms+XWpI+78OTZPUcycpP0a+FnmziN2rQEWvT1CsEaofhkOqQKwDJQcv1KJqufUTDWDY/y0ZED9jCfwrIvMjMlb0wqC0sbPRPp6x+4EY8fznZWDNeu1XBMehXlQrJnnMd8a7u4RD7akgnEADa9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723596876; c=relaxed/simple;
	bh=ceN6lqR8XBckxlwlx8abIvCdYmT55I9BsWPel02DVYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KF+nCeQXjmYOfxndt0cfEkkfE36JfxMp5SUTraMXFlSx2/YlgEL9BO3M5Ho6RwnXd/sYSyGNGDfg0lFa4sui8MF3tbvN1GsZhcXTKvZMN4LCh08wXo3P5zDQkDnHhW2Vt63kmF8/b3qTL38bdohjy8eTLK6RVWrCwhYPBIeUyNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 14 Aug
 2024 08:54:21 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 14 Aug 2024 08:54:21 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <pmenzel@molgen.mpg.de>, <krzk@kernel.org>
CC: <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] ARM: dts: aspeed: Add properties of scu and gfx for video
Date: Wed, 14 Aug 2024 08:54:20 +0800
Message-ID: <20240814005421.3362441-2-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814005421.3362441-1-jammy_huang@aspeedtech.com>
References: <20240814005421.3362441-1-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

To have video support capture from SoC display(GFX), these properties
are added to allow video to control related registers.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7fb421153596..9f122717dfe3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -451,6 +451,8 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				aspeed,scu = <&syscon>;
+				aspeed,gfx = <&gfx>;
 				status = "disabled";
 			};
 
-- 
2.25.1


