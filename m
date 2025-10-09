Return-Path: <linux-media+bounces-44122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7EFBC9E9E
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 18:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 421B51A65278
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1E42F3633;
	Thu,  9 Oct 2025 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="IO3d7LXR"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53255226D02;
	Thu,  9 Oct 2025 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025304; cv=none; b=GGJnUbfW4h/1pKMeAW1KR2sqqLLzdkSuQlspDp3dcHgZYtYFgn2rg9Q2IBSJf+USP4BzaPDSEI8kCtY0Kb/teqgI9EfNrXVxw3iaK3LRv6bkAYbmByMTfKrbFKih399Ae/qK6x3Tvf9jMW1z/TUEjKySDspYvW/EiR79Py29dO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025304; c=relaxed/simple;
	bh=HnJXNWDH9Usfh1fp5D5yBCiM1tYerwb8Pj7KlbBwaCM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4FgZNuU5TwQZ0OsEYS0sK+zxCNCbz6YdsPGAaB6XOpf81uEoghITb5lwKr3mGu90bVJrF7/lpkGiNyrO02Qz+izJMCrmfyRm8+qrowWEr4IsTGI9le99Kvw/2e/WSPqt3pwS2Cni4tpwBS6jIRt8WLVk3sSGMP4jkLOzBm5PBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=IO3d7LXR; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025302; x=1791561302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HnJXNWDH9Usfh1fp5D5yBCiM1tYerwb8Pj7KlbBwaCM=;
  b=IO3d7LXRGzvnSA7ntheUfzqPE/aC6YDEaD3TF5gb6VTqECPNo28vRIOi
   GwutW7eJZTphWl3MRkKi250y7R2yDGPa8kUagnaX9VUJiFt5ASr7ND6VX
   /eV333p/8gq6qpGJfaJ/M1+HAYhmrPU8zCKmpGNOAOeYcO9VnB/hSAWmK
   GJhj3uCDVZI8PM9O8y36SnbnoOQwEkoc6afnrdtDdZ0IoEVFMtRva4DQZ
   R8ooO63Uj2jYq6eWejtTmakdYcizLkAUOFSDQL11BT35ApblxRkt2Jc2c
   VgL2cF49iPITEWrOG9RdHZIqME6O+ChbqL3sB1PpgXEHLhYetQHjFBCMd
   g==;
X-CSE-ConnectionGUID: 0EboOn8GRV2P1HnHTeE70A==
X-CSE-MsgGUID: GkfuCNVbTgm4xxOSCfUpBw==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="46946049"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:00 -0700
Received: from chn-vm-ex3.mchp-main.com (10.10.87.32) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 9 Oct 2025 08:54:56 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:48 -0700
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
Subject: [PATCH 12/18] media: microchip-isc: Rename CBC to CBHS
Date: Thu, 9 Oct 2025 21:22:45 +0530
Message-ID: <20251009155251.102472-13-balamanikandan.gunasundar@microchip.com>
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

As per the datasheet the more relevant name for this enable bit is
"Contrast, Brightness, Hue and Saturation Control Enable"

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c  | 10 +++++-----
 drivers/media/platform/microchip/microchip-isc.h       |  2 +-
 .../media/platform/microchip/microchip-sama5d2-isc.c   |  2 +-
 .../media/platform/microchip/microchip-sama7g5-isc.c   |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index ce22b4789ebd..e9bd191f042b 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -790,7 +790,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				WB_ENABLE | GAM_ENABLES | DPC_BLCENABLE |
-				DPC_GDCENABLE | CBC_ENABLE | CC_ENABLE;
+				DPC_GDCENABLE | CBHS_ENABLE | CC_ENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -800,7 +800,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | GAM_ENABLES | WB_ENABLE |
-				SUB420_ENABLE | SUB422_ENABLE | CBC_ENABLE |
+				SUB420_ENABLE | SUB422_ENABLE | CBHS_ENABLE |
 				DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
@@ -811,7 +811,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -823,7 +823,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -834,7 +834,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				CBC_ENABLE | DPC_BLCENABLE;
+				CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index 7afba3c04dfb..35dfd2501ea2 100644
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
index 66d3d7891991..239aac170472 100644
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
index d3ed9cfe6686..985281c4dc76 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -61,7 +61,7 @@
 #define ISC_SAMA7G5_PIPELINE \
 	(DPC_DPCENABLE | DPC_GDCENABLE | DPC_BLCENABLE | \
 	WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
 
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama7g5_controller_formats[] = {
-- 
2.34.1


