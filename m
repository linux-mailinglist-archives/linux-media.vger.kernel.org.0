Return-Path: <linux-media+bounces-65910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8O30KCVUQmp74wkAu9opvQ
	(envelope-from <linux-media+bounces-65910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:16:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E506D946C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:16:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=z3wNT2aw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65910-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65910-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DBA5309F9D3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA48401494;
	Mon, 29 Jun 2026 11:09:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B14014AB;
	Mon, 29 Jun 2026 11:09:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731394; cv=none; b=Jba8KmL5q3ynNvRfKUh1a+OVrgyCeBPA9jku8/PR8540K9yh+ckutOL9CkBCnKsQQebv9xsBOFMT6NXyL/6qZLqKxPVQmUzmwTNg1egotYDK2kIdBV0MrEssuHrkTix29nDm2Y2vaqchbANVEu/788yicGVqN5BvXhoJuSwE9ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731394; c=relaxed/simple;
	bh=ed5uhRiCVfBJgPbTKt3gEE1ydGHErfFVNlt/f11Izhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JC+ItTw6S187ratZ4XqVp/m/KyFpVkqLiQ7RXAbvYQf1+OgaA7fT0o0EExfEh1mRMUv6VFfrRE/3DlwDQ0dqmFNSuaqbD+g3Itekjr/h1AvjWTpcs2Wy1ImQwxRnTO2If7h0TBoADKXKVN624lrTSU7wEm4b6OJIjItPhe2yWzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=z3wNT2aw; arc=none smtp.client-ip=68.232.153.233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782731393; x=1814267393;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ed5uhRiCVfBJgPbTKt3gEE1ydGHErfFVNlt/f11Izhc=;
  b=z3wNT2aw8CGG1yeoRJHWAlV4zk0Az2txBP5oEdfaEoNCklUvPrsSAbO/
   X/zuAlmIBW3T8A0+4nHElrT7/RTnD6JDLsrRnfJCaD9E0aXusQUmS48D2
   wTPXc21x8TkHrlyWs9gAxmkSAHDHPF3Cu1dtGyb56dfAZ3LSi8msNzW/M
   zfA6z2n1rMJ+INMtzbwQxG9OXOBYpE2sLBD3cn7rNxfrVVVI0QraWyJ3G
   INEB/XzraWRWblwmFgGZBMpTkTFKG4ITfWDTb5VYt57kzlGGDtBb9CQ7l
   CTRpAEtMTG3eFF81/Fsa7Th9zfjiLwFYgwgxW07l5akR36wozRpOPMow3
   g==;
X-CSE-ConnectionGUID: vf/oHnKOTxSvCR1MpUr+Hw==
X-CSE-MsgGUID: x3K7D46vSayJcElu4eQPNg==
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="291199064"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jun 2026 04:09:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 29 Jun 2026 04:09:52 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 29 Jun 2026 04:09:49 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 29 Jun 2026 16:39:31 +0530
Subject: [PATCH v2 06/10] media: microchip-isc: store the unshifted
 PFE_CFG0 BPS value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260629-balki-isc-prefix-fixes-v1-v2-6-3b120cc3742f@microchip.com>
References: <20260629-balki-isc-prefix-fixes-v1-v2-0-3b120cc3742f@microchip.com>
In-Reply-To: <20260629-balki-isc-prefix-fixes-v1-v2-0-3b120cc3742f@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65910-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:balakrishnan.s@microchip.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,microchip.com:dkim,microchip.com:email,microchip.com:mid,microchip.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4E506D946C

pfe_cfg0_bps held a pre-shifted BPS value (ISC_PFE_CFG0_BPS_EIGHT was
0x4 << 28) ORed straight into the register. The other format selectors
like cfa_baycfg store the bare field value and position it at the write,
so this one was inconsistent.

Store the bare BPS value and apply it with FIELD_PREP() at the PFE_CFG0
write, and fix the pfe_cfg0_bps comment to match. No functional change.

Suggested-by: Eugen Hristev <ehristev@kernel.org>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c |  4 +++-
 drivers/media/platform/microchip/microchip-isc-regs.h | 10 +++++-----
 drivers/media/platform/microchip/microchip-isc.h      |  4 +++-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index a2f7035f4418..4e87e5f45ac4 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -8,6 +8,7 @@
  * Author: Eugen Hristev <eugen.hristev@microchip.com>
  *
  */
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/math64.h>
@@ -290,7 +291,8 @@ static int isc_configure(struct isc_device *isc)
 	u32 pfe_cfg0, dcfg, mask, pipeline;
 	struct isc_subdev_entity *subdev = isc->current_subdev;
 
-	pfe_cfg0 = isc->config.sd_format->pfe_cfg0_bps;
+	pfe_cfg0 = FIELD_PREP(ISC_PFE_CFG0_BPS_MASK,
+			      isc->config.sd_format->pfe_cfg0_bps);
 	pipeline = isc->config.bits_pipeline;
 
 	dcfg = isc->config.dcfg_imode | isc->dcfg;
diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/drivers/media/platform/microchip/microchip-isc-regs.h
index e77e1d9a1db8..185ef0eab7ad 100644
--- a/drivers/media/platform/microchip/microchip-isc-regs.h
+++ b/drivers/media/platform/microchip/microchip-isc-regs.h
@@ -31,11 +31,11 @@
 #define ISC_PFE_CFG0_MODE_PROGRESSIVE   (0x0 << 4)
 #define ISC_PFE_CFG0_MODE_MASK          GENMASK(6, 4)
 
-#define ISC_PFE_CFG0_BPS_EIGHT  (0x4 << 28)
-#define ISC_PFG_CFG0_BPS_NINE   (0x3 << 28)
-#define ISC_PFG_CFG0_BPS_TEN    (0x2 << 28)
-#define ISC_PFG_CFG0_BPS_ELEVEN (0x1 << 28)
-#define ISC_PFG_CFG0_BPS_TWELVE (0x0 << 28)
+#define ISC_PFE_CFG0_BPS_EIGHT  0x4
+#define ISC_PFG_CFG0_BPS_NINE   0x3
+#define ISC_PFG_CFG0_BPS_TEN    0x2
+#define ISC_PFG_CFG0_BPS_ELEVEN 0x1
+#define ISC_PFG_CFG0_BPS_TWELVE 0x0
 #define ISC_PFE_CFG0_BPS_MASK   GENMASK(30, 28)
 
 #define ISC_PFE_CFG0_COLEN	BIT(12)
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index f5e322c2e36b..d7bcd74efff9 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -62,7 +62,9 @@ struct isc_subdev_entity {
  * @mbus_code:		V4L2 media bus format code.
  * @cfa_baycfg:		If this format is RAW BAYER, indicate the type of bayer.
 			this is either BGBG, RGRG, etc.
- * @pfe_cfg0_bps:	Number of hardware data lines connected to the ISC
+ * @pfe_cfg0_bps:	ISC_PFE_CFG0 BPS field value (e.g. ISC_PFE_CFG0_BPS_EIGHT),
+			written into PFE_CFG0 with FIELD_PREP(ISC_PFE_CFG0_BPS_MASK)
+			at configure time.
  * @raw:		If the format is raw bayer.
  */
 

-- 
2.34.1


