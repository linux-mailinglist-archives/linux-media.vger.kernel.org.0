Return-Path: <linux-media+bounces-63509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dVYpE+fSH2rUqQAAu9opvQ
	(envelope-from <linux-media+bounces-63509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:08:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF87634FF1
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:08:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=KGt+9yTB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63509-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63509-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52D01306DE65
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E89A421EF5;
	Wed,  3 Jun 2026 06:59:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A874219EE;
	Wed,  3 Jun 2026 06:59:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469989; cv=none; b=SCCbgu4E+84bprPl1KLYCcPb0emLUhnB83vljnBbmFNBS5q86euFhmYQ0zIspzl2rC0qt8kTPsyylAj4dKcb0Gx6FCGvQC3vy1ZCWwMrKeODF5AJVBpzWLH+iG3wYgPQkWdKtwMfgwaUvU4Tvjw/1pP+PVeluy/p0nXDpbMN/Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469989; c=relaxed/simple;
	bh=nBQ19TzEzHTe10yrI+lQ5MmNQEAYJBqehJsYHxmuwLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hO+xMN7E7iif3Bosrm/4P9jRBFc/jn4QQDcugkzWcFB2vum3c1aaljMc2StSndfAjCxHGZhyAy56QcmUhVhJDCneb3Quaoa/fiHQ2C5NichpOoWU9ttBw5uf0/4KLr+aZnnLdcfxG3vFeh9CoVESHGOrTpustCTL5KDlrTtKoM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=KGt+9yTB; arc=none smtp.client-ip=68.232.153.233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1780469988; x=1812005988;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=nBQ19TzEzHTe10yrI+lQ5MmNQEAYJBqehJsYHxmuwLE=;
  b=KGt+9yTBpvbMMgJZPwXXglIcb1iaVOk0eBybbsS1nR0VSo+acwOSqicd
   V+AvPtCigaRACnvBgWCbdmTbZQmIX78VTuBVThQDd/LkdwXlGvPj2hiEt
   cMSei43c+NwYWA1Zef5Rp7UrSCDpZ6bxVPOxA3/yYCtA6s4XqMVWICBhJ
   WCRqtsZcljzcRPOdmsmH0wFpZBMqaJYHHmzuuTHhUp8EjxZfi10yGiPkT
   PBaMZ1KIFWQMuLoLkW8u8WnfcQawu4OIVI8/6uSmw7aPhlLgOzAsp8C4W
   I1xxi/uU/wPuXfnL0Kl1XX2r8J/hrY8ENVaTOgyYtX2C0JcOBmEyC197O
   w==;
X-CSE-ConnectionGUID: 5RXgQlPqTqmOz34wXxBjiQ==
X-CSE-MsgGUID: oWJSLVceR62yxWPKXTUqQg==
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="289899164"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jun 2026 23:59:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Jun 2026 23:59:47 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Jun 2026 23:59:43 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 3 Jun 2026 12:28:55 +0530
Subject: [PATCH v6 12/12] media: microchip-isc: scale DPC black level to
 sensor bit depth
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260603-microchip-isc-fixes-v6-12-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-0-8c3d7474a768@microchip.com>
In-Reply-To: <20260603-microchip-isc-fixes-v6-0-8c3d7474a768@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, <stable@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63509-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:balamanikandan.gunasundar@microchip.com,m:stable@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:balakrishnan.s@microchip.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,microchip.com:mid,microchip.com:dkim,microchip.com:from_mime,microchip.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAF87634FF1

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
index e6ccdd465805..a57bc022aeb6 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -26,6 +26,7 @@
  * HIS: Histogram module performs statistic counters on the frames
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -290,9 +291,25 @@ static void isc_sama7g5_config_dpc(struct isc_device *isc)
 {
 	u32 bay_cfg = isc->config.sd_format->cfa_baycfg;
 	struct regmap *regmap = isc->regmap;
+	u32 bps, bloff;
+
+	/*
+	 * Scale the nominal 10-bit black level offset (64 counts) to the
+	 * actual sensor bus width.
+	 * ISC_PFE_CFG0_BPS encodes 12 - bit_depth in bits[30:28]:
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


