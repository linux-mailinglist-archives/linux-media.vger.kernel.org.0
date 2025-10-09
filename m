Return-Path: <linux-media+bounces-44113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAF4BC9DFE
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 17:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB028424193
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BE52288E3;
	Thu,  9 Oct 2025 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="S2LzKHiZ"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A53221544;
	Thu,  9 Oct 2025 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025250; cv=none; b=s40EzBFMsVAg42CtvwPRezm93TYXWcuURrV6Ex615N1Of9wgL0NIabzVYKASJYA9Sx6WpS/ZU/036o7wbPIMUN7TKk/7ypvIi6wtwTvACLQRsCJFPSjfHnqHFE/rRAPrbSEiRtov5Eaoch1XzgnXEMrRbEjtDRQ0ZXOpsOWL0/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025250; c=relaxed/simple;
	bh=gV8/pv5K8wTbaSSqyaWEvyuWsfTPKr+MZKnDEQREMBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AxStnfXkjf7xijadNLh/dMkDNhogwQNct8ENc1W39s/MpIisZ/Mcp68SrLoHiNtR0gTogSzed0o176BbI+9o6IKWdUWy/STLu3nq4j+2UUo/pST5yW7rWryXjSutdAir+Z0C5uIZG5EEpBotcVhG7rYzfcwPG2iHBNniiYDRTn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=S2LzKHiZ; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025249; x=1791561249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gV8/pv5K8wTbaSSqyaWEvyuWsfTPKr+MZKnDEQREMBY=;
  b=S2LzKHiZsWr6hCCShA1lyzGnmdVl7fFXD9k70mg4Q7k5ImbVzfxDcTZK
   XONo389/07QO94nwSIn/xQAw+JJnW8xyWMl8X/dNHcGUNyCwnuRmMbOSC
   ZpU1FhGsrIKfFPhHjsSGXUQqZzBPuVHvPmj1JhFEvQv8JiG1X19ioIeeC
   1Aii1mD8zjwIJHmLbc2bGKsLCp2U+W0UIKwlpYDX3FtOhYjj695FT865m
   eG/lfIi+CkcjmfeHwzKSuX0vjojZC8JWt6i+L+Yu84izMerstsOK/466b
   8pJ6YIM6hkVb1HCUWB/p1EfPi80W4PQ+JOshIKZ2TpIWlfG1B5dN+kFvx
   Q==;
X-CSE-ConnectionGUID: cxE1NKlcTy6ijIhpLPFRrQ==
X-CSE-MsgGUID: Sns/tTj6S8uMW/FVFJg3sA==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057851"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:53:59 -0700
Received: from chn-vm-ex3.mchp-main.com (10.10.87.32) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:53:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 9 Oct 2025 08:53:42 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:35 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 03/18] media: microchip-isc: Enable GDC and CBC module flags for RGB formats
Date: Thu, 9 Oct 2025 21:22:36 +0530
Message-ID: <20251009155251.102472-4-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Balakrishnan Sambath <balakrishnan.s@microchip.com>

Include DPC_GDCENABLE and CBC_ENABLE flags in pipeline configuration for
RGB raw formats to enable green disparity correction and
contrast/brightness control.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index a7cdc743fda7..c138e92a1aca 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -787,7 +787,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				WB_ENABLE | GAM_ENABLES | DPC_BLCENABLE |
-				CC_ENABLE;
+				DPC_GDCENABLE | CBC_ENABLE | CC_ENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
-- 
2.34.1


