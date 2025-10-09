Return-Path: <linux-media+bounces-44127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DDCBC9E89
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 18:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523723BAA1C
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 16:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43A32F5A37;
	Thu,  9 Oct 2025 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="MklNDhUi"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D98023B615;
	Thu,  9 Oct 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025353; cv=none; b=Jt0gSVd3HvOVy3uF3uas3CH18wmschB5v1Xni9mSBJaJGXnRQl1eHPc4jXP+OKifvY7Fy+uR4rMbdVshtItIucA4psGapO806CoaeU3VecRu/ABnJF6B8E4Ml4Gzh1abKTgIgQ0df8mrgW9En4CH0XfZNrBx4MkzRTJYUgMcDTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025353; c=relaxed/simple;
	bh=NmHYnwZO3k1u6RXbCftGuTbVjS2S07lpsShuIUYK9b0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7LiW3POs9qUUfpviwixanAJp01LsVN0Px4JS0kyyTLse5KZ+2O1Vby9381iPbopv1rvSvPfUVTTsjMg5GSeh6Rq/EQXoACJytXprRjxTXEazLOQMoTPYywZ3Bxiyce4B3vmjZP75vLllevW8WikkgyAcTUl4EIsxCcIUUCxmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=MklNDhUi; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025351; x=1791561351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NmHYnwZO3k1u6RXbCftGuTbVjS2S07lpsShuIUYK9b0=;
  b=MklNDhUiAXlDWkg1U5EDOfYbHPQxYJCkC2Dfpk5CZHi8zoXIDPw74Won
   W+XQAhKKLVuGEB0FkXLxChJ5K57+45fQo9ToiCIrS2LjNcn4R78OlgEXu
   4+vQ4dWA5BhXNTJjwWV8ykYuHHyDxWbK3s3Q03FZuvJ7JqMwwNSZi7r73
   WIQYIzi4nQ6y1RJck2emoxi50CzxdVmnx8vBEhywtI6ZtwkUu7WpBvo6H
   S+aWByE9WhX11IRxV5XcMHQPmA4dOC1U6t/L0ClQYe2j5YxE3vHZ0zj3n
   lr/4XBMEEmgkStiIqFrDROAAB+4pEjDW2SoDZitk5Fe+O7OPMnAELrwfe
   w==;
X-CSE-ConnectionGUID: BY5Dt4iOTF6lw0TCi1Tv9Q==
X-CSE-MsgGUID: /RvSuAcuQFKg0QDO0OH5Pg==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057949"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:55:31 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:55:22 -0700
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
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 16/18] media: microchip-isc: enable userspace histogram statistics export
Date: Thu, 9 Oct 2025 21:22:49 +0530
Message-ID: <20251009155251.102472-17-balamanikandan.gunasundar@microchip.com>
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

Export raw histogram data to userspace only when all 4 Bayer channels
are ready and userspace has active listeners. Also continue AWB work as
long as userspace listeners are active.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index cafd05244db2..6c937a20fce0 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1450,6 +1450,15 @@ static void isc_awb_work(struct work_struct *w)
 	if (hist_id != ISC_HIS_CFG_MODE_B) {
 		hist_id++;
 	} else {
+		/* All 4 channels processed - notify userspace */
+		if (isc_stats_active(&isc->stats))
+			isc_stats_isr(&isc->stats);
+		else
+			dev_info(isc->dev, "No active userspace listeners\n");
+	}
+
+	/* Continue with AWB processing only if AWB is enabled */
+	if (ctrls->awb != ISC_WB_NONE) {
 		isc_wb_update(ctrls);
 		hist_id = ISC_HIS_CFG_MODE_GR;
 	}
@@ -1499,7 +1508,7 @@ static void isc_awb_work(struct work_struct *w)
 	mutex_lock(&isc->awb_mutex);
 
 	/* streaming is not active anymore */
-	if (isc->stop) {
+	if (isc->stop && !isc_stats_active(&isc->stats)) {
 		mutex_unlock(&isc->awb_mutex);
 		return;
 	}
-- 
2.34.1


