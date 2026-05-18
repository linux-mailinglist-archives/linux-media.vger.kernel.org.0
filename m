Return-Path: <linux-media+bounces-61971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONcBMDv7CmqA+wQAu9opvQ
	(envelope-from <linux-media+bounces-61971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:42:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D05556BCC0
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DAF831ACCC9
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8711A3F926F;
	Mon, 18 May 2026 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YRPiTR7E"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA23F6C56;
	Mon, 18 May 2026 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103864; cv=none; b=rYr7hpnfDYmb0tn8Kxfwe5cv+X5xcwr7D/U5znI5nu0K4gqbJR/QCX4SBcJ/Rfz8lA1iEenVniOpRG0A5TU30w7Ee0wpNEBafP/wbpBx6w8crvJYzhtHOdmjIW5jVxKkeCl6yZU5JZHyY2VDKZHNJ19xS4uVY9+j1cksJaPsRcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103864; c=relaxed/simple;
	bh=bZM/OFGDNN2SUaUl5en2h45OH2l7nKM1piuvVDpGE30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RWLajyPqlBu6o3BpWTTMd1E6w51OzQlcdudzaYr0S4h8bHg+BVPkn/ajhQXagU2iMGwWzsCElK+/niq90oZw/+6GBnpRz1kSDXLItfApVOI4FlE408yDoqfdMWplthdWGCdX7p0eT4oQ6ntNffH7LMt09eMQorbErTA6O2F9vnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YRPiTR7E; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103859; x=1810639859;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=bZM/OFGDNN2SUaUl5en2h45OH2l7nKM1piuvVDpGE30=;
  b=YRPiTR7E85fkkqXCWRkVDYjunxb/gVQwWUk3+dYcMuphM21pIPNPAvxp
   xxb9F6d9vtXIZKrosUUmIK+tKRF6+WajOAROp9ri6Io0U4Ienu+YL7c8G
   RFwh5t/r/+1J4DJrreRYnI3Up/NLoWFzWH2DrY+STmh2tClr1P+HswaxM
   no9BjhubOALUb/mqJSaQMU5umGMm55K+GhhRzk5J6chyXkwkfxAzft5+3
   gHmvgqKw/61XNejSc/gxOe4WBoYZOL32smUqlMSfmgm/fPbw2urQYufud
   Unhxwwb16+JWrQgeJw6RNr4uQBwC6ta7427Qy0xSMFx5i/FX6+B3va+YW
   A==;
X-CSE-ConnectionGUID: IWB/NJnVT2+pFiIV+OvEBQ==
X-CSE-MsgGUID: 5/kHSOkmTiGx2gMkCUPVig==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="66410469"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:30:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 18 May 2026 04:30:54 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:30:51 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:50 +0530
Subject: [PATCH v4 12/12] media: microchip-isc: scale DPC black level to
 sensor bit depth
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-12-97f189185b7e@microchip.com>
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 6D05556BCC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61971-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Scale the nominal 10-bit black level (64 counts) to match 8/10/12-bit
sensor bus width.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-sama7g5-isc.c  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 6705011edc2a..d978466aa489 100644
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


