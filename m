Return-Path: <linux-media+bounces-27540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DEAA4F672
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A49A18903C8
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 05:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79F91D2F42;
	Wed,  5 Mar 2025 05:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fw2DtJO1"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1EC19CC2E;
	Wed,  5 Mar 2025 05:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151835; cv=none; b=srMlqbi+3TWU63y67n6+GGJeJiIxw+LGNzgUSFcS94NVidKYpfhcsqu9qXkdgmVk4xV2PF2fDXCcQXX6BiSSR+oZTo7TC/AimEWfYc3OQSynsFyy1nl/ybFOLzBpP3yoQQiFphFI834Rhv5Z08ol+twmc0Ok72yuQvvS8lE/0iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151835; c=relaxed/simple;
	bh=np20Fi4ehXMs2ZkD5gn/9vBWlXZdoICplCLicOJvjro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hg1cIyStFGevRUAEtLEcCHaZ1JvFmOeirZid/2BIdNf7+KvMiUs1y0IbTN6jN9U04/9Pm4wtHjgc8upv8bF7LTL6/ueU5N+xWDGhNhDKDpvmHhRr4QocQoUhUOtzN/pj5QAyAlops3Iwm62F7TArSv32TpKXiLT6A7Wn4e2VVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=fw2DtJO1; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741151834; x=1772687834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=np20Fi4ehXMs2ZkD5gn/9vBWlXZdoICplCLicOJvjro=;
  b=fw2DtJO1s8EZ0GLZbcHJbi1pt5cU0x4x+3xUTtq/IwZwJ6UsmguHJYC6
   ejq2oxCnZX1sjmJSP/X1zksPX0sPVLB09VDNnl7QVmmZ/TxbeAJ6B9P0l
   3TXK2QfQAuavDRJwQ69c1CkJKsVKFaqjF3ofv6kPYIe13CfYAbQGJYxtA
   QAA9GyibkQWMS58U3jXAPQk2xx+YdmG3FXmVp+mOBx+2m1FHHCuwRyc3r
   3npWNSImQomMriPZjCHtF7Ad3+T+GxCZs85+eJgnsolqOW9o1npFGzbfj
   KonTHuLkosBjsvymB872Ed1NIA/iAuvGObNraDkvGMOpWFmVPEX5Qw7Sa
   A==;
X-CSE-ConnectionGUID: hd3A3q2XTOaw0tKDefSG0A==
X-CSE-MsgGUID: su03/SlDSZKaDOtB5fkjKQ==
X-IronPort-AV: E=Sophos;i="6.14,222,1736838000"; 
   d="scan'208";a="38432577"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2025 22:17:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Mar 2025 22:16:36 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 4 Mar 2025 22:16:33 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V7 3/4] media: i2c: imx334: update mode_3840x2160_regs array
Date: Wed, 5 Mar 2025 10:44:41 +0530
Message-ID: <20250305051442.3716817-4-shravan.chippa@microchip.com>
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

The 3840x2160 mode operates with the imx334 reset values.
If we switch to other modes and then return to the 3840x2160 mode,
it should function correctly. so updated the mode_3840x2160_regs
array with the imx334 reset values.

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 0b42bc0470a1..a7c0bd38c9b8 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -343,6 +343,12 @@ static const struct imx334_reg mode_3840x2160_regs[] = {
 	{0x302d, 0x00},
 	{0x302e, 0x00},
 	{0x302f, 0x0f},
+	{0x3074, 0xb0},
+	{0x3075, 0x00},
+	{0x308e, 0xb1},
+	{0x308f, 0x00},
+	{0x30d8, 0x20},
+	{0x30d9, 0x12},
 	{0x3076, 0x70},
 	{0x3077, 0x08},
 	{0x3090, 0x70},
-- 
2.34.1


