Return-Path: <linux-media+bounces-44121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3937BC9E98
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 18:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0021618843E9
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1908228CA9;
	Thu,  9 Oct 2025 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dcQZB9pq"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B02264DC;
	Thu,  9 Oct 2025 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025302; cv=none; b=POqI2W+Era2hNU0o3LwtZgJ/rHOJBPpxdhy5rWhUEtFyqxjjFm+V6ITa6Z6TfjUVbm1J2dHv4I7mF5ti1SHvLgYWGzwVds1VDGIesSw6FiAW4vNXvVDtke4m85PDIT1GM+hqIMGz6loaYs0gI7T7XtYnWsdGWyZuDbFyxf8vlw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025302; c=relaxed/simple;
	bh=haMO4wNGArj5kzag6iiHU5t/GWJrDKEc4cjZ18byMvQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLnR0FjRIwu7QAY9mpAlHBRo0wR4fKE/Tv2KaqTaxDfkbKzmheOIxcZTkka/A/1tXQBi92140+X84CTVPMlj+Sa0LRvWUTrjpr/xMGcdfMhCLQ1n/qhkN4Bt2zGyitIUQbrXmJ1zoiLow7/mD2xHSyHIe22W8s3IZkj/bhpSNt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=dcQZB9pq; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025300; x=1791561300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=haMO4wNGArj5kzag6iiHU5t/GWJrDKEc4cjZ18byMvQ=;
  b=dcQZB9pqC90kDQIc5nxhYTdcTiaGMpzEHmICjPqou5h4DO/2JqMNaO+g
   3qxRiBOtqTI4zLn4sAK7rLwtlT1CF52VVflxVLi/GzMW3tCop6EhODyqz
   eq2Z/6IU+ZrrLh2PJJRH/iU4qEnZzK+CTogiuRpsbc7LAZZV/knWogjVQ
   jua2qbpvGzFDGICaBmeHMB63aZYcCfgUyTnoLnkmKmhfX0gIIoA0XY1Jl
   zH0TX+TqrvaDjk1zcP2wA63hB18DU1oGj1MgO20U3Gm/0qcULCaG6B4qN
   TNvRm7BDKtl8OvQP3ysVkjMYGfERuYVcEWYoHM78RUOb1V7tt2M3GieVy
   Q==;
X-CSE-ConnectionGUID: 0EboOn8GRV2P1HnHTeE70A==
X-CSE-MsgGUID: hlxhRWc8QgmHEHsfeTSDRQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="46946046"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:39 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:32 -0700
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
Subject: [PATCH 10/18] media: microchip-isc: Always enable histogram for all RAW formats
Date: Thu, 9 Oct 2025 21:22:43 +0530
Message-ID: <20251009155251.102472-11-balamanikandan.gunasundar@microchip.com>
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

Remove AWB dependency to allow histogram collection even when AWB is
handled in userspace.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 5b49b6ff5ae9..e6d7f59893ac 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -318,8 +318,7 @@ static int isc_configure(struct isc_device *isc)
 	 * The current implemented histogram is available for RAW R, B, GB, GR
 	 * channels. We need to check if sensor is outputting RAW BAYER
 	 */
-	if (isc->ctrls.awb &&
-	    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
+	if (ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
 		isc_set_histogram(isc, true);
 	else
 		isc_set_histogram(isc, false);
-- 
2.34.1


