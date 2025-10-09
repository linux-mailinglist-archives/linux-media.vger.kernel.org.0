Return-Path: <linux-media+bounces-44118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E730CBC9E5F
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 18:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06047188C2EF
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595EB2EDD76;
	Thu,  9 Oct 2025 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="O+Beovpz"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279742EDD53;
	Thu,  9 Oct 2025 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025281; cv=none; b=jRtZhAq1ishZQ/RuOok9a+F0PpHnBjKZjLl9n3LxY/I8hg5ZZqn6QK/xBMzS7EdXobRw5moFSJar3MzaxitwaFm2lHqK0mSgUGT0gpeRWe8bAp68qeq/0GTyhZ21GotbF7goTR5iFbAuYIIBFugciirzxn4KhxNPhHT0WYT8GRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025281; c=relaxed/simple;
	bh=eJf4UTMPqJkln5EdhKh/6cOT12g2cjSMKWCXo8sdgV8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sagpgkmCZ5ktUnhq8L/Ow8IMZTGZbChLRb7zlFZqyEe+4AMw1RWY8vHnJBKQyo4RAS8WgJ6YYIfoIwHXrD1Jed8youEI/gyN8tSPiAH5MnBzXAErl1MTLBO5QzNVpbpY2O8RfIv0f8IQ3VuAYJu/KzZqvTNqRzZ651fr6gspRm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=O+Beovpz; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025280; x=1791561280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eJf4UTMPqJkln5EdhKh/6cOT12g2cjSMKWCXo8sdgV8=;
  b=O+BeovpzfW8qjlYYieSxwrjGrPqguRlGEU9uDCpByJ03KTUfjxfexsRt
   T34dBWRl7A9n8FDCCzQ5Ayi63faeDkyhFb1WjUfe3FNR1VggAkBp4wZYj
   Zu7RuZL3tRRPGEJAK8SKFaVLNfhe6OjIAscA1BPYGCBuz+yQiJjS2iao2
   1tgg0gjMlS2ZiD8nW47Zdv76+uYcnI56tvo0XrOuksiLBfiwsY0msN/Eh
   QNh2IqbXxAIodkbD5crC3e/+h8Zyxi4VclGqUw/EtAWdX4KjxKrnr0Oby
   Gkx5wiW4r2TdsIQNuxrNy9DoMP4OF6oApj6EK7eJ05R5b3LwGdq81IyFZ
   Q==;
X-CSE-ConnectionGUID: /X4p8s51R2m1uwZxUki7lw==
X-CSE-MsgGUID: qBNcf2BOSxaZUSryRrMOiQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="214905334"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:38 -0700
Received: from chn-vm-ex3.mchp-main.com (10.10.87.32) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 9 Oct 2025 08:54:06 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:58 -0700
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
Subject: [PATCH 06/18] media: microchip-isc: Add range based black level correction
Date: Thu, 9 Oct 2025 21:22:39 +0530
Message-ID: <20251009155251.102472-7-balamanikandan.gunasundar@microchip.com>
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

Add adaptive black level offset based on histogram minimum and pixel
statistics. Apply conservative correction for high black levels and
gentle correction for low levels to prevent overcorrection and improve
dynamic range.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index bb2dd69a83f0..2706a27a2506 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1349,7 +1349,27 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		 * we stretch this color to the full range by substracting
 		 * this value from the color component.
 		 */
-		offset[c] = ctrls->hist_minmax[c][HIST_MIN_INDEX];
+		if (hist_min > 5 && hist_min < 60 && total_pixels > 1000) {
+			/*
+			 * Basic adaptive black level offset correction
+			 * (Simplified version for kernel fallback)
+			 */
+			if (hist_min > 20)
+				/* Conservative for high levels */
+				offset[c] = hist_min - 4;
+			else if (hist_min > 10)
+				/* Moderate correction */
+				offset[c] = hist_min - 2;
+			else
+				/* Gentle correction */
+				offset[c] = hist_min - 1;
+
+			offset[c] = max(1U, offset[c]);  /* Ensure minimum of 1 */
+		} else {
+			/* Use default behavior for edge cases */
+			offset[c] = hist_min;
+		}
+
 		/*
 		 * The offset is always at least 1. If the offset is 1, we do
 		 * not need to adjust it, so our result must be zero.
-- 
2.34.1


