Return-Path: <linux-media+bounces-62888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKeyCM/SFmq+swcAu9opvQ
	(envelope-from <linux-media+bounces-62888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:17:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C75E341C
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A3AB3000891
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839FB3F6C3C;
	Wed, 27 May 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jh3KTMZk"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10DB3F39EA;
	Wed, 27 May 2026 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880098; cv=none; b=PTd98bJXt7Xxlgr1HUL5Fcdh/VOth1dko4wfOKb7iPKEbqrW44tbiNmONhDfJrKP8bLq0hLMlXrS28SBumr6cZvGvvAguQJW5meY+FOEh1/5CBPav52KjWSR/lIIkcj2PdJIHaBkajf4tkJ8jyHIdnAuF2u/8IdgmzLfqRK3ylc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880098; c=relaxed/simple;
	bh=ReiDdwkcSLe/Nn2wIdWLLJpIXqoldTX9ysS+Ik/I7zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HNByagAPiuiYq04/jRUo+ZXgevzhjG4HiGmQvFeDSnvXhCvXvze0fEK+Xebax/IeSzPzCt8GP7zvjlIQWw2RM0Yh/A7FRWBtTZW+gKuegiiGEqjXAeore1/9KsmTDFrPLI9kaoTFLeZ6qBjECLJI3aMjycSu1PvqNqzIVoafot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jh3KTMZk; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779880098; x=1811416098;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ReiDdwkcSLe/Nn2wIdWLLJpIXqoldTX9ysS+Ik/I7zA=;
  b=jh3KTMZk3rLwTlk7IlxADdHm25NgZjHLSHV4YfP4O2SUw0FOT+p25alz
   aONPNZq3LKKCBjn4UoM40C20cY8JTBP/lve65h0u7D1IFk7/9dWL/Y8+G
   qtYB6oGnj4Uvyh2maYFxd0drFhAgEPzGo4d8b3qNGocbF/4qoMMUQ7TXg
   RwneBYPHEvnznjuVhM/w2absvCQ/e2sLLCbcJ17Y7uMumDA90EhFVd9CY
   YbEyibate0XUMcZ3lasdjjNoPa4fuXAlhg+Arxvupxx5jvhsKk0lD57Ma
   SosYog3sb8KmvCoG1pPFRTqLwb+qFZRDaH0PeiwuJBkShT8dOTZxO6G85
   g==;
X-CSE-ConnectionGUID: YtkCLYPYRH+rVljlFN//UA==
X-CSE-MsgGUID: zq6Q3617RFqRIFdRKtuy8A==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="58112124"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:08:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 04:08:16 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 04:08:12 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 16:37:28 +0530
Subject: [PATCH v5 12/12] media: microchip-isc: scale DPC black level to
 sensor bit depth
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-microchip-isc-fixes-v5-12-b0ec1bb954be@microchip.com>
References: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
In-Reply-To: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, <stable@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62888-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 218C75E341C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DPC_BLCFG black level register expects counts in the sensor's
native bit depth. The previous fixed 10-bit value (64 counts) under-
corrects 12-bit sensors and over-corrects 8-bit ones, producing an
incorrect black point. Scale the nominal 10-bit value to match the
8/10/12-bit sensor bus width derived from pfe_cfg0_bps.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-sama7g5-isc.c  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index f51c7cac25df..067a6e1558d3 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -26,6 +26,7 @@
  * HIS: Histogram module performs statistic counters on the frames
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -289,9 +290,25 @@ static void isc_sama7g5_config_dpc(struct isc_device *isc)
 {
 	u32 bay_cfg = isc->config.sd_format->cfa_baycfg;
 	struct regmap *regmap = isc->regmap;
+	u32 bps, bloff;
+
+	/*
+	 * Scale the nominal 10-bit black level offset (64 counts) to the
+	 * actual sensor bus width.
+	 * ISC_PFE_CFG0_BPS encodes (12 - bit_depth) / 2 in bits[30:28]:
+	 *   BPS_EIGHT  = 4  ->  8-bit  -> bloff = 64 >> 2 = 16
+	 *   BPS_TEN    = 2  -> 10-bit  -> bloff = 64
+	 *   BPS_TWELVE = 0  -> 12-bit  -> bloff = min(64 << 2, 255) = 255
+	 * The BLOFF hardware field is 8-bit so values are clamped to 255.
+	 */
+	bps = FIELD_GET(ISC_PFE_CFG0_BPS_MASK, isc->config.sd_format->pfe_cfg0_bps);
+	if (bps >= 2)
+		bloff = 64u >> (bps - 2);
+	else
+		bloff = min(64u << (2 - bps), 255u);
 
 	regmap_update_bits(regmap, ISC_DPC_CFG, ISC_DPC_CFG_BLOFF_MASK,
-			   (64 << ISC_DPC_CFG_BLOFF_SHIFT));
+			   (bloff << ISC_DPC_CFG_BLOFF_SHIFT));
 	regmap_update_bits(regmap, ISC_DPC_CFG, ISC_DPC_CFG_BAYCFG_MASK,
 			   (bay_cfg << ISC_DPC_CFG_BAYCFG_SHIFT));
 }

-- 
2.34.1


