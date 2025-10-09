Return-Path: <linux-media+bounces-44124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D651BC9E62
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 18:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D7C23B629C
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 16:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDE823371B;
	Thu,  9 Oct 2025 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Lat76oqH"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343F622D781;
	Thu,  9 Oct 2025 15:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025322; cv=none; b=seBv7tP3HDu0tiijrZ5Yy2p9Y1H4J06rPt80zBFwo6I9PV4p9OeNs94B4jvE4oSuW+zbKZjiFPnZPjeMDjBODRN4TsCivfd0WLKV4cGXBwAOAwDiJ+zWug4y2qQe8CfL5nF/l1V8sJeO4ruA6t3ZfJZFFfr076Y23a28gYG7SW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025322; c=relaxed/simple;
	bh=2Se7zj33Lgo/YtUKTOpJ2DSK5Pf7p9rJmkBLoSnWiHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thEQbivUUcptO+Y5rlK7GtZUQ6XMymQGXMutocWT8n8RkcRHU5Sj/SVe7Z3x9JEbh8BsMqEBHC1a/W5U0cabSHHeUXpyLapLGdR9Dgi/am7zisp62mosGDK4RJdn34xrRRzRWpqGJ0472JExJNgqGNEyUOeqECorfkYOtBq8omA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Lat76oqH; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025321; x=1791561321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Se7zj33Lgo/YtUKTOpJ2DSK5Pf7p9rJmkBLoSnWiHc=;
  b=Lat76oqH5XxuMIrYEAmXB3RHC7CU0I5CwtyNSheFvdWfnpklX7ci+oDd
   U9sbOpumIlWyxoakXfiIWTQctJoJ0RZPq2l25mKbYG8E1OhWx0zN9GkBy
   RXdh8f68eEtMrLmCVubqEix/yDMAf+BdbQ36YHz5h5SXfAKci0Ua6+pku
   T7symft7ZG+hm1LBrCyoY0Be2NmZPi3/JtU8JkXUFHGgLJW4ejNS3PNAU
   kJt46GZZWuHP8VvBucF5utmWlbVKHDYR5IBBdYSQgF6eB9XADRVA+cE7g
   3Jhj+E2btVxh5D32EOa+TdsfucQNV5DmrpsUjUTT10gXE3huWEl6pRuPp
   A==;
X-CSE-ConnectionGUID: zFf2VAeJSDmWhPAONYY24w==
X-CSE-MsgGUID: 7xgqSkgPTC+yiXsQ9TcNyg==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="214905374"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:19 -0700
Received: from chn-vm-ex1.mchp-main.com (10.10.87.30) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:55:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:55:13 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:55:05 -0700
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
Subject: [PATCH 14/18] media: microchip-isc: fix histogram state initialization order
Date: Thu, 9 Oct 2025 21:22:47 +0530
Message-ID: <20251009155251.102472-15-balamanikandan.gunasundar@microchip.com>
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

Move hist_stat assignment before profile update to ensure histogram state
is properly set when update_profile triggers register writes. This prevents
race conditions during histogram initialization.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 6651be6fcb57..e9f14de7ae32 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -275,10 +275,10 @@ static void isc_set_histogram(struct isc_device *isc, bool enable)
 			     ISC_HIS_CTRL_EN);
 		regmap_write(regmap, ISC_INTEN, ISC_INT_HISDONE);
 		ctrls->hist_id = ISC_HIS_CFG_MODE_GR;
+		ctrls->hist_stat = HIST_ENABLED;
 		isc_update_profile(isc);
 		regmap_write(regmap, ISC_CTRLEN, ISC_CTRL_HISREQ);
 
-		ctrls->hist_stat = HIST_ENABLED;
 	} else {
 		regmap_write(regmap, ISC_INTDIS, ISC_INT_HISDONE);
 		regmap_write(regmap, ISC_HIS_CTRL + isc->offsets.his,
-- 
2.34.1


