Return-Path: <linux-media+bounces-63504-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cQcRJk3UH2pFqgAAu9opvQ
	(envelope-from <linux-media+bounces-63504-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:14:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6716350CF
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:14:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=YqqHjHr7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63504-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63504-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3EB1B3020FF6
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730EF402BB5;
	Wed,  3 Jun 2026 06:59:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9583FB7FC;
	Wed,  3 Jun 2026 06:59:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469965; cv=none; b=tbSKu53Sb3oVc47KwfVUpDM3A+qAubcWiHJtGgrE2p9Gm2HUi9bQSiq1z6H0dM5uDgdFMuVkjNAB4AJV7lUIvuA9bsPmuF7udHZ4ou8vhX/eiRjk6dG+fcyPMHjot09wguXO/doJv1OX3EDDFPFbpzWK/a+lfd/GD48QHAzFRwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469965; c=relaxed/simple;
	bh=iHjSNTf2eTdHe+Qw5/khPP/EISzSR2wYSByRoJgcxE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=U9ErE/iRl/fMru+cB2IP0SmOmX+IYclFNSx9cEuA8PkeJLzctAqEYLYdrFYvh9GnQfNCvvRjBAGNOo810CY4IYo2qNtjrha0gXcu0AJBmjfMT7sqnw0CyXTp/uoGbPZq0k0zVB7qPBVUZrVY1D/ys2PJ1a1kQBQGrIznrM7R+5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YqqHjHr7; arc=none smtp.client-ip=68.232.153.233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1780469964; x=1812005964;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=iHjSNTf2eTdHe+Qw5/khPP/EISzSR2wYSByRoJgcxE4=;
  b=YqqHjHr7CAka5EWJR2hjHcNZzyTR+IkJ78nPUqx4WiAI7E+KuHaAcwIw
   xQrtP/qiw6PNxNM9nFdpC62GFgJxNcnSeO4BiQLVeOjiSip+Ua0Yg60Sa
   li1U6N2l5bL2yuNnyM6Mdf5CJzA2VQQFylmaGKCuI2Yzkif2F2IkSnTaA
   oYp7y/g0bWM+3BK66CkS71TLP010uiNMx5SSR+wcWbaNW7lTJZ6sdbJI+
   Ykkxn8quTELQ8K0gq38AVEZuWBg93CYq08KASBADRQRnGMryQ1HKWRmgi
   2TTZpyE01naRE7hrEXcccZpxC5ORU5JEVrS3zOrD2XO1AYldwUusgJf7h
   g==;
X-CSE-ConnectionGUID: KRcJc3beTNaIB8Fc6UmnyQ==
X-CSE-MsgGUID: +rTjc9j5Q5yBm8Nfe4Kwhg==
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="289899137"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jun 2026 23:59:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Jun 2026 23:59:23 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Jun 2026 23:59:19 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 3 Jun 2026 12:28:50 +0530
Subject: [PATCH v6 07/12] media: microchip-isc: configure DPC and pipeline
 for SAMA7G5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260603-microchip-isc-fixes-v6-7-8c3d7474a768@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63504-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:balamanikandan.gunasundar@microchip.com,m:stable@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:balakrishnan.s@microchip.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,microchip.com:mid,microchip.com:dkim,microchip.com:from_mime,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC6716350CF

Enable DPC black level and green disparity correction for raw Bayer
to RGB conversion. Bypass the pipeline for raw Bayer output so
software ISPs (libcamera) receive unmodified sensor data.

Rename CBC_ENABLE to CBHS_ENABLE to match the SAMA7G5 block name;
SAMA5D2's CBC sub-block uses the same bitmap bit.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c    | 15 ++++++---------
 drivers/media/platform/microchip/microchip-isc.h         |  2 +-
 drivers/media/platform/microchip/microchip-sama5d2-isc.c |  2 +-
 drivers/media/platform/microchip/microchip-sama7g5-isc.c |  5 +++--
 4 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index f61a5d5a3e04..ff920019fe37 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -800,7 +800,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				WB_ENABLE | GAM_ENABLES | DPC_BLCENABLE |
-				CC_ENABLE;
+				DPC_GDCENABLE | CC_ENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -810,7 +810,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | GAM_ENABLES | WB_ENABLE |
-				SUB420_ENABLE | SUB422_ENABLE | CBC_ENABLE |
+				SUB420_ENABLE | SUB422_ENABLE | CBHS_ENABLE |
 				DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
@@ -821,7 +821,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -833,7 +833,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -844,16 +844,13 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				CBC_ENABLE | DPC_BLCENABLE;
+				CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
 		break;
 	default:
-		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code))
-			isc->try_config.bits_pipeline = WB_ENABLE | DPC_BLCENABLE;
-		else
-			isc->try_config.bits_pipeline = 0x0;
+		isc->try_config.bits_pipeline = 0x0;
 	}
 
 	/* Tune the pipeline to product specific */
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index ad4e98a1dd8f..a943b072f6be 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -88,7 +88,7 @@ struct isc_format {
 #define GAM_RENABLE	BIT(9)
 #define VHXS_ENABLE	BIT(10)
 #define CSC_ENABLE	BIT(11)
-#define CBC_ENABLE	BIT(12)
+#define CBHS_ENABLE	BIT(12)
 #define SUB422_ENABLE	BIT(13)
 #define SUB420_ENABLE	BIT(14)
 
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 0ddff1e7b0a0..71609a93358a 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -54,7 +54,7 @@
 
 #define ISC_SAMA5D2_PIPELINE \
 	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
 
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama5d2_controller_formats[] = {
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 4119cfe12cdf..287fc76da479 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -59,8 +59,9 @@
 #define ISC_SAM9X7_MAX_SUPPORT_HEIGHT   1920
 
 #define ISC_SAMA7G5_PIPELINE \
-	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	(DPC_GDCENABLE | DPC_BLCENABLE | \
+	 WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
+	 CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
 
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama7g5_controller_formats[] = {

-- 
2.34.1


