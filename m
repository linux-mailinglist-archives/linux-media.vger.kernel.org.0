Return-Path: <linux-media+bounces-44125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5ABC9E6C
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 18:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D2D84FBC74
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 16:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8445B2F532F;
	Thu,  9 Oct 2025 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="PXIdQCQ7"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E40B22D781;
	Thu,  9 Oct 2025 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025331; cv=none; b=FW4EE/gQ06dIXSbcvFTqfo72JZSJaiwR7Vkh38nwunM578G/HmH6he1FzbIz6Y2EPEsB6o1AH03wBXqoqhE+oJT9qKJXvCzfgDoKpU44S2AfFQ8XoQsw0lGT3KAeQTsdbuQZiSE/NV55SwXdMMN/o8HN1lXT0HvImVpZdFc9Rpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025331; c=relaxed/simple;
	bh=Ldr0J4d8oLQ9xg/bEwW76/C7Vo+NvP/FYftwus6rV+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M/oAXDDGeWZdTwGMQZftliiPZCWjpKiagKgAAh+86dq2igtdri6ZQ4OUxXaWN5b3Kusxs5IDFMGyY3+NWfUpdaN2cy0O2OVtegDzbEpna9IaHiGW887jY4vLtq7KeluL07ILdTWQlASaJxKVcLOZsXTIflBPznkKRRFKtVD6Z7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=PXIdQCQ7; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025330; x=1791561330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ldr0J4d8oLQ9xg/bEwW76/C7Vo+NvP/FYftwus6rV+g=;
  b=PXIdQCQ7bujYEgFqRDerd5HnnJbHAXnUbN/ofMxqEdAHL1sOXc7I6U7j
   I7ZpNNUd2nJTd4L9wmWqq7fRFf+5tWNimraeddatpQikKQwmenx0DGAVn
   eLhPawieYVqS6ODs23GeLJXJHv5pbdY00jchbXcdlbxHNUGTZitW4LjXO
   Z5ATc0WNPE7zqgLrW5sxX8Oj03YChtoqZa/NGbqNF719ZMR92afiNmf0v
   qvEoUOFXWSRdpGL4Q76bXuU7JNJx3zJYz2uvMhqUKIy5cTI/EWyARFLfm
   3Etq2Jc9O0V83ciU7cYiYOpCGzpqPjxWL1a+tvPnHH68UKC4u7e0X4UKf
   w==;
X-CSE-ConnectionGUID: oiXu0ae6SEGA7hK0w89rgw==
X-CSE-MsgGUID: QSddFo6vQrKs2L3VXBkHtQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="278928772"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:55:05 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:57 -0700
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
Subject: [PATCH 13/18] media: microchip-isc: Store histogram data of all channels
Date: Thu, 9 Oct 2025 21:22:46 +0530
Message-ID: <20251009155251.102472-14-balamanikandan.gunasundar@microchip.com>
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

Store the histogram data for all 4 channels(R, B, GR, GB). The data of each
channel is available on one interrupt. We need 4 interrupt cycles to get
all four channels. Store all the channels in a 2D array. This data is later
passed to the application buffer when it requests for a dequeue.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c  | 2 +-
 drivers/media/platform/microchip/microchip-isc-stats.c | 2 +-
 drivers/media/platform/microchip/microchip-isc.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index e9bd191f042b..6651be6fcb57 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1225,7 +1225,7 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 	struct regmap *regmap = isc->regmap;
 	struct isc_ctrls *ctrls = &isc->ctrls;
 	u32 *hist_count = &ctrls->hist_count[ctrls->hist_id];
-	u32 *hist_entry = &ctrls->hist_entry[0];
+	u32 *hist_entry = &ctrls->hist_entry[ctrls->hist_id][0];
 	u32 i;
 
 	*min = 0;
diff --git a/drivers/media/platform/microchip/microchip-isc-stats.c b/drivers/media/platform/microchip/microchip-isc-stats.c
index d7813c9d95ac..1f3d1ea75005 100644
--- a/drivers/media/platform/microchip/microchip-isc-stats.c
+++ b/drivers/media/platform/microchip/microchip-isc-stats.c
@@ -298,7 +298,7 @@ static void isc_stats_fill_data(struct isc_stats *stats,
 
 	/* Copy existing histogram data from AWB work function */
 	for (c = 0; c < HIST_BAYER; c++) {
-		memcpy(pbuf->hist[c].hist_bins, isc->full_hist_data[c],
+		memcpy(pbuf->hist[c].hist_bins, &isc->ctrls.hist_entry[0][c],
 		       sizeof(pbuf->hist[c].hist_bins));
 
 		pbuf->hist[c].hist_min = ctrls->hist_minmax[c][HIST_MIN_INDEX];
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index 35dfd2501ea2..fcb20669ef69 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -151,7 +151,7 @@ struct isc_ctrls {
 	u32 gain[HIST_BAYER];
 	s32 offset[HIST_BAYER];
 
-	u32 hist_entry[HIST_ENTRIES];
+	u32 hist_entry[HIST_BAYER][HIST_ENTRIES];
 	u32 hist_count[HIST_BAYER];
 	u8 hist_id;
 	u8 hist_stat;
-- 
2.34.1


