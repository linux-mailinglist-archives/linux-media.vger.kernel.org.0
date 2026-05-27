Return-Path: <linux-media+bounces-62883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNZ3FN3QFmowsgcAu9opvQ
	(envelope-from <linux-media+bounces-62883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:09:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2125E31EA
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 316853031B51
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FAF3F54D8;
	Wed, 27 May 2026 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="sws3Ucj2"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FBF3F58E1;
	Wed, 27 May 2026 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880076; cv=none; b=syhxKLOPz6VZXynBudjTOY0IFFDJzAJpTrK1m6osFo3whe5rdxaSct6FzCGa3O935/kRIOOQx+0WSK2d0NINox/mfff06ZxXUVFTiKdfpoSK1Y14YlXQYRfArShbwArkVf+KHhIb4t8b6XgCZRh0MgcX3cUD5UsZ/jkJkn0jP+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880076; c=relaxed/simple;
	bh=drHEvYa4YJpTMJ4qYN35cNY20m8cHSTXYxTJca/Jg9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KBHAtLTfX3TZa2i48QUsBVdpu9kn6W0RVWJk/oQyNYEyYg6yT8m/U0zmw2M/g/LQfe+cuvMp5sAAHgnCqCx+aJFrYKzH783PwrmKU9yK0LiLI5KFu4m5lOAaD9CWVlOWkn4GoW/q7GD1FXkqHtLDx0quPMWK2fdrzQvwK4VDQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=sws3Ucj2; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779880075; x=1811416075;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=drHEvYa4YJpTMJ4qYN35cNY20m8cHSTXYxTJca/Jg9M=;
  b=sws3Ucj2HIt+CsVKFTClmF2tEhaNhOpHwcFa//GHFNlvo3r23CZ6eNRX
   zrqRTb/8T/h6YBHqcjfaMWe3NpF39erpYPB+Q191FM+HCu5UnJDN8Dbgf
   bAgDOOfG2Y8HfFE31EaGOjq6kmwimU53bEbB8N3CglYLmEXriruJv7yDR
   vZzj0Wop8mmA68hisUWnVPTnWfpTUekb+iuzPtKmwFkP9Pt+DHfkP4Vog
   uoel004W0nVOoKAjGe5EUxCxb4+RRV0YyzrgzsVa00RoyF2OmbUyoRmV2
   qWYGfySfH7TlIyfV4tY8tb1Z0pZ4PImDHrLK6BHD27qW+z2f/C+I22T16
   A==;
X-CSE-ConnectionGUID: drKn2R8hTNqdHpaPYCXNqg==
X-CSE-MsgGUID: hR9f2rnwRs2uBJj3UU84qg==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="289504005"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:07:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 04:07:53 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 04:07:49 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 16:37:23 +0530
Subject: [PATCH v5 07/12] media: microchip-isc: configure DPC and pipeline
 for SAMA7G5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-microchip-isc-fixes-v5-7-b0ec1bb954be@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62883-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EE2125E31EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 4119cfe12cdf..daa3978a89bd 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -59,8 +59,9 @@
 #define ISC_SAM9X7_MAX_SUPPORT_HEIGHT   1920
 
 #define ISC_SAMA7G5_PIPELINE \
-	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	(DPC_DPCENABLE | DPC_GDCENABLE | DPC_BLCENABLE | \
+	 WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
+	 CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
 
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama7g5_controller_formats[] = {

-- 
2.34.1


