Return-Path: <linux-media+bounces-44126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F6BC9E7A
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 18:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9D3A4FB5EB
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 16:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B2423D7D4;
	Thu,  9 Oct 2025 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tceG3tzJ"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DD8226CF1;
	Thu,  9 Oct 2025 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025351; cv=none; b=POiY8QrtAW0fRqnDb2+NZ+o/8WHoH7+V3YwF2SwDUhYGX5mGEERMvG5gLhi4Ngk3HdvGaEAlAQ0uO2ULXnPK2+R44dRMmm2XudXp3zko9Pu9AxY5fiYmrYg1kOxBxling/ybYtMYrPAIF/mcVpR9oLeiSMji8fwO4qsP1hh4Qp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025351; c=relaxed/simple;
	bh=186aunkFZ+DaR7NwbVBgBmpyszUiuZDCagnLEubuYVI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IvUJYqAlvyzT3wlB/L4J+Rv2z0CiTiN4dj7YwQnbrMkjkdkV8mYTHZN+buYRI09JXxLnhbbnun3J+2dhTu/+GlQ45Z5f153Y1fa94vFfoG4izVw65M1XzGRAYIU6ZIJdguQ1GV0JSz3xOTpwo263p5/CnfV+a0DxLr5vbBkRt60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=tceG3tzJ; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025350; x=1791561350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=186aunkFZ+DaR7NwbVBgBmpyszUiuZDCagnLEubuYVI=;
  b=tceG3tzJj96pEpB8EmvtnbZMozJx61OCL4l9FtRHmwRu1uyvuAytPC0o
   kiNHPtUtGAl2netaaqwVj6ntc5VSYEyh3zM1LMsogg+7wNN65PtM8GbbZ
   Gm7JayAsPPtpCNuCeFxMnfyD3Iz2hBtneJKhpt8sybfNEfWTy3igfsGGv
   FmvylRnNk4mB6fh97Qz8VBmlMhKoE72/4iMN8NVXZvIbb3oinMDzY+8Bb
   v5leIJzW8AmK1zOT9XLpXdpbqhU5ezcvKfmuS/dvHHi7kqyALsAx36YwN
   p21vs1elR4mlAufQ8YLU3ze939kr9XW5XVvWbdStFckI45IvSA5w+aQUS
   A==;
X-CSE-ConnectionGUID: BY5Dt4iOTF6lw0TCi1Tv9Q==
X-CSE-MsgGUID: gRBAh4qzTtiU7k10zAP/nw==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057947"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:55:22 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:55:14 -0700
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
Subject: [PATCH 15/18] media: microchip-isc: decouple histogram cycling from AWB mode
Date: Thu, 9 Oct 2025 21:22:48 +0530
Message-ID: <20251009155251.102472-16-balamanikandan.gunasundar@microchip.com>
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

Fix histogram cycling stopping after first channel when AWB is disabled.
Now the histogram cycling will continue even when AWB is disabled,
enabling hardware histogram data export to userspace.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index e9f14de7ae32..cafd05244db2 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1509,7 +1509,7 @@ static void isc_awb_work(struct work_struct *w)
 	mutex_unlock(&isc->awb_mutex);
 
 	/* if awb has been disabled, we don't need to start another histogram */
-	if (ctrls->awb)
+	if (ctrls->hist_stat == HIST_ENABLED)
 		regmap_write(regmap, ISC_CTRLEN, ISC_CTRL_HISREQ);
 
 	pm_runtime_put_sync(isc->dev);
-- 
2.34.1


