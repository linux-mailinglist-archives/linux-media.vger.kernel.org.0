Return-Path: <linux-media+bounces-61292-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEamOBNLA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61292-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:45:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54E523ED4
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40288306194F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84FB3C37B6;
	Tue, 12 May 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RwG0mOtH"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E25A3C4B89;
	Tue, 12 May 2026 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600648; cv=none; b=LmqqftAn2xWf6THxdGytEdhf7iz0iSZ+JoE/sBBygv4XrgbqMkaxIQvNQfNJsv3CV8dcEOTVrdJGlE6yHRAH0kJbNNiz7gzxwZ/c43WxAt+Ybka/7f68TvS3PlWUY62X7e+U7lYh0DxywzJR7VRYALX1y0VkygN9Aw20+UeOWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600648; c=relaxed/simple;
	bh=RhJYAoeL6NtWiQnFs8Rwn3lmLWMOs3QTN0Vdn5x96s4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dS7n4uKsMln0a1NlIjfU1VOQY+POa9KRE8AQqLFMtvYgIpr3tu8xfpquNmvhV4Y+gkXzLrN152Lx6GzHv8tKjmGEPYjBSMVeFWUaz4aoog1Tur6i2txTKxq/aQCha+xxVSkCuurjRG9Ohsw76Dmi7/HNsTI7/ZiwKdiARYolIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RwG0mOtH; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600646; x=1810136646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RhJYAoeL6NtWiQnFs8Rwn3lmLWMOs3QTN0Vdn5x96s4=;
  b=RwG0mOtHKYYc1YNBGNii47z/65Pra8TVCQ44TEal6IjBkTnJm5nN4/kz
   glIVrhLRV6exXfeHT/UfU163SMJY95tNrRLxdOt6M7dSpmRQ8TjIlNvmW
   enf08cQjh6ZsIRCGBM07kVXHDvi0XpYlAgTidEv51apGCH5jQgN3QkS7U
   dkcxyEWs9keungAX6tJMEIkGEg7WFcY7x6HWxBhMEXNlkooIDnGTMvGE1
   q08iL6dXkngr72CKuC3FXLXEerWD7w+H4a+ITudwc+uPAY2Oa+ZFiXKLZ
   YqLuVICCSp9/8gVUAIE1R60YjqA+i5kdmkgHPvQotd2GPggXhjki+uLQm
   Q==;
X-CSE-ConnectionGUID: c/d2dmHeT12wfTerVaKHaA==
X-CSE-MsgGUID: 1n1mzC1ORyWxnWw6kFNLRw==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="224633710"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 08:44:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 12 May 2026 08:44:05 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:44:02 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	"Balamanikandan Gunasundar" <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v2 07/15] media: microchip-isc: configure DPC and pipeline for SAMA7G5
Date: Tue, 12 May 2026 21:13:31 +0530
Message-ID: <20260512154339.210444-8-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512154339.210444-1-balakrishnan.s@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20260512154339.210444-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 4B54E523ED4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61292-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

Enable DPC_GDCENABLE for RGB output. Disable pipeline for raw Bayer
passthrough to provide unmodified sensor data for software ISP.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microch=
ip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c    | 7 ++-----
 drivers/media/platform/microchip/microchip-sama7g5-isc.c | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index f61a5d5a3e04..23a09ed12946 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -800,7 +800,7 @@ static int isc_try_configure_pipeline(struct isc_device=
 *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline =3D CFA_ENABLE |
 				WB_ENABLE | GAM_ENABLES | DPC_BLCENABLE |
-				CC_ENABLE;
+				DPC_GDCENABLE | CC_ENABLE;
 		} else {
 			isc->try_config.bits_pipeline =3D 0x0;
 		}
@@ -850,10 +850,7 @@ static int isc_try_configure_pipeline(struct isc_devic=
e *isc)
 		}
 		break;
 	default:
-		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code))
-			isc->try_config.bits_pipeline =3D WB_ENABLE | DPC_BLCENABLE;
-		else
-			isc->try_config.bits_pipeline =3D 0x0;
+		isc->try_config.bits_pipeline =3D 0x0;
 	}
=20
 	/* Tune the pipeline to product specific */
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/dri=
vers/media/platform/microchip/microchip-sama7g5-isc.c
index 4119cfe12cdf..04930aa0f289 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -59,7 +59,8 @@
 #define ISC_SAM9X7_MAX_SUPPORT_HEIGHT   1920
=20
 #define ISC_SAMA7G5_PIPELINE \
-	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
+	(DPC_DPCENABLE | DPC_GDCENABLE | DPC_BLCENABLE | \
+	WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
 	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
=20
 /* This is a list of the formats that the ISC can *output* */
--=20
2.34.1


