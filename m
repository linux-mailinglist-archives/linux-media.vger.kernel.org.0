Return-Path: <linux-media+bounces-65911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YoQ3BcRTQmpu4wkAu9opvQ
	(envelope-from <linux-media+bounces-65911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:15:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 088696D944B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:15:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=MBpPa8uh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65911-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65911-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53D0C3021BD4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB3E4014AB;
	Mon, 29 Jun 2026 11:09:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C63BB664;
	Mon, 29 Jun 2026 11:09:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731398; cv=none; b=cls40W1g2uiQ9dYZLJpxKFG91c9rbr5xB9xIMVLhbV6kV0SIw/tIiSQx8cns4P6wIgaiIM4auC67l0MEv7JSEavxtASHvI1rwwu5pWuDOFSiSa+GZ9XkXh/pPHuXk4CdulyC2su28Gt6xeKwKB/R+GsJ3NINKSI5P7pYzzRdId4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731398; c=relaxed/simple;
	bh=lXXYQQluLFXJuyBwL1YcAjS6yfyXWjYcvsbKR/j4GW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eYN6oxf5YnNgxFmOzXKYn76lEm5SKPQyq3NYLRtRf8Mk57tIW/Okby7eA/P+mM09TdvR9PqIdqtx97FzOUl7QGsf/5D1BEgB2MU3OzWF84Q5c4+Y2XN0BmmX3+8BlCOtodDZJaaimcCTWR5c34F+r/X8gVUyi1+2BCHRODl0Gjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=MBpPa8uh; arc=none smtp.client-ip=68.232.154.123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782731399; x=1814267399;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=lXXYQQluLFXJuyBwL1YcAjS6yfyXWjYcvsbKR/j4GW4=;
  b=MBpPa8uhBAIhU0ev61SFJa7SHqSrsFtGQDoM/66uKhTZdCegvfng0XIr
   jryTwsz5XA1oWjLFDaRPxrEyBDMpGzxuAfzlITgVbbJwYaTBY1eHLzWiW
   WqVn9Z9txr4Fu9q09cpzS0ZTIashxRxty/r1aJ31uAxzZi6dINJnCZB6L
   /YzPf+E+uDN0rmeRxk6C/tcixO4UdItPnCLp6fI9JMXp8kLo4dFjcC9Bj
   Q7UsyYBo6aX4TEY1/jmdrqt2PcCHUbQwZIKRr1Z8OlDgQ689ux233Z0yH
   uZVpQ8bnboYrQ0qDCrODDvSrKJickx8DkMCxPTpUZrt8CsPQuEXHIomoj
   w==;
X-CSE-ConnectionGUID: y9P7tQarSHKY3EYfugvQaQ==
X-CSE-MsgGUID: 1fvxws4lRa2y5AbaIEzPvQ==
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="60174596"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jun 2026 04:09:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 29 Jun 2026 04:09:56 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 29 Jun 2026 04:09:53 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 29 Jun 2026 16:39:32 +0530
Subject: [PATCH v2 07/10] media: microchip-isc: fix ISC_PFG_CFG0_BPS macro
 name typo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260629-balki-isc-prefix-fixes-v1-v2-7-3b120cc3742f@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65911-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:balakrishnan.s@microchip.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,microchip.com:dkim,microchip.com:email,microchip.com:mid,microchip.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 088696D944B

The BPS field macros for ISC_PFE_CFG0 were spelled ISC_PFG_CFG0_BPS_*
(NINE, TEN, ELEVEN, TWELVE). The register is PFE, not PFG. Rename them
to ISC_PFE_CFG0_BPS_* to match the register and the EIGHT and MASK
macros. No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-regs.h  |  8 ++++----
 .../media/platform/microchip/microchip-sama5d2-isc.c   | 18 +++++++++---------
 .../media/platform/microchip/microchip-sama7g5-isc.c   | 18 +++++++++---------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/drivers/media/platform/microchip/microchip-isc-regs.h
index 185ef0eab7ad..9ddbbb6dd68b 100644
--- a/drivers/media/platform/microchip/microchip-isc-regs.h
+++ b/drivers/media/platform/microchip/microchip-isc-regs.h
@@ -32,10 +32,10 @@
 #define ISC_PFE_CFG0_MODE_MASK          GENMASK(6, 4)
 
 #define ISC_PFE_CFG0_BPS_EIGHT  0x4
-#define ISC_PFG_CFG0_BPS_NINE   0x3
-#define ISC_PFG_CFG0_BPS_TEN    0x2
-#define ISC_PFG_CFG0_BPS_ELEVEN 0x1
-#define ISC_PFG_CFG0_BPS_TWELVE 0x0
+#define ISC_PFE_CFG0_BPS_NINE   0x3
+#define ISC_PFE_CFG0_BPS_TEN    0x2
+#define ISC_PFE_CFG0_BPS_ELEVEN 0x1
+#define ISC_PFE_CFG0_BPS_TWELVE 0x0
 #define ISC_PFE_CFG0_BPS_MASK   GENMASK(30, 28)
 
 #define ISC_PFE_CFG0_COLEN	BIT(12)
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 5d49b9d48f57..5c59a692b30e 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -146,49 +146,49 @@ static struct isc_format sama5d2_formats_list[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_BGBG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
@@ -209,7 +209,7 @@ static struct isc_format sama5d2_formats_list[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_Y10,
 		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 	},
 
 };
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 4f9e9a5ed4d1..5c7a10c9a2a5 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -155,49 +155,49 @@ static struct isc_format sama7g5_formats_list[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_BGBG,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TWELVE,
 		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
 	},
 	{
@@ -223,7 +223,7 @@ static struct isc_format sama7g5_formats_list[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_Y10,
 		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_TEN,
 	},
 };
 

-- 
2.34.1


