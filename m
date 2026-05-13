Return-Path: <linux-media+bounces-61340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON0GL7wmBGqDEwIAu9opvQ
	(envelope-from <linux-media+bounces-61340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:22:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CA852E8E8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBAD530FD9FB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F5E3D6496;
	Wed, 13 May 2026 07:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZszRtgxb"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C13D47A1;
	Wed, 13 May 2026 07:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656693; cv=none; b=suAs1RcRPFgFczkwIznLStag97UdfbxCy858nxACGWOfyh3ejVB8lSN2yg/Jkj++N235v4hyqVoITMZhSY7CZe02VBUKEPNGDXOafaCkhvAqfJIJ7PvqI8aTZA/9LS2WxUqb07uWCoZf48+ClemV5oi4Gu/e1WX1cmJ+/Kgt0YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656693; c=relaxed/simple;
	bh=nN0rf7xTB1OQOg1b0V+DQCqgq8N+dmLjdSCCiQAYtQw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEgl7/HcAKzz/DEaca+GzsE+vUtLJShLjYae6EG33G8A4Dkw2ypYP9Hdg66pWNRTQ4VbtY87sN0uGpzMQPcM14eoWKZ9TqLWQt1nf9692h++C/ClbQ6FOOchOeDNaOeNlgv0cQdI/WYgtzNRb3tcbflYC1/4d3/jR5boIbIkKGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ZszRtgxb; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778656691; x=1810192691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nN0rf7xTB1OQOg1b0V+DQCqgq8N+dmLjdSCCiQAYtQw=;
  b=ZszRtgxbtisYIbE1hlf/wrYP37CfggaaNaj2B6TObXDMXHWt1FxsEFpl
   Gc1BKffljP+cJ6aTabdvunmNNe2UgrytQpdqFUe4zZkvE2LAbVI34/tJZ
   PcwuGjj6sWFDOUCox1zl6Y3AUE5XcPZokAhSbw39hPLM9STRmC5IwHby1
   gOrl5AbqSPsMW6CV0wUvCTfAGAJuS5Ypo4ouYz2MtCoTDcVruWRhahrU2
   tVp0RCxv6EJG1N9GH+z5dURJWj7wG9zy05letiGQ8iDfR2btP8nQzrxiv
   AD8j6Z1YMFitI906I6V8AmRRZ2Kz/JeZSEwUmCcECCu1ab36cc8rp7wxA
   Q==;
X-CSE-ConnectionGUID: RIE7Drp7QHumCMy5TdwwSg==
X-CSE-MsgGUID: ZaRQj648SM+1DQ+I096iQQ==
X-IronPort-AV: E=Sophos;i="6.23,232,1770620400"; 
   d="scan'208";a="65766801"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 00:18:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 13 May 2026 00:18:04 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 13 May 2026 00:18:01 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	"Balamanikandan Gunasundar" <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 06/15] media: microchip-isc: set SAM9X7 maximum resolution to 2560x1920
Date: Wed, 13 May 2026 12:47:33 +0530
Message-ID: <20260513071742.97263-7-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513071742.97263-1-balakrishnan.s@microchip.com>
References: <20260512154339.210444-1-balakrishnan.s@microchip.com>
 <20260513071742.97263-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 68CA852E8E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61340-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

SAM9X7 XISC uses the same image processing pipeline as SAMA7G5 but has
a smaller internal line buffer. The reduced RAM constrains the maximum
horizontal resolution to 2560 pixels (compared to 3264 on SAMA7G5),
resulting in a maximum capture resolution of 2560x1920.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@micro=
chip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microch=
ip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-sama7g5-isc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/dri=
vers/media/platform/microchip/microchip-sama7g5-isc.c
index ca23e8adecbd..4119cfe12cdf 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -55,6 +55,9 @@
 #define ISC_SAMA7G5_MAX_SUPPORT_WIDTH   3264
 #define ISC_SAMA7G5_MAX_SUPPORT_HEIGHT  2464
=20
+#define ISC_SAM9X7_MAX_SUPPORT_WIDTH    2560
+#define ISC_SAM9X7_MAX_SUPPORT_HEIGHT   1920
+
 #define ISC_SAMA7G5_PIPELINE \
 	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
 	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
@@ -432,8 +435,13 @@ static int microchip_xisc_probe(struct platform_device=
 *pdev)
 	isc->gamma_table =3D isc_sama7g5_gamma_table;
 	isc->gamma_max =3D 0;
=20
-	isc->max_width =3D ISC_SAMA7G5_MAX_SUPPORT_WIDTH;
-	isc->max_height =3D ISC_SAMA7G5_MAX_SUPPORT_HEIGHT;
+	if (of_machine_is_compatible("microchip,sam9x7")) {
+		isc->max_width =3D ISC_SAM9X7_MAX_SUPPORT_WIDTH;
+		isc->max_height =3D ISC_SAM9X7_MAX_SUPPORT_HEIGHT;
+	} else {
+		isc->max_width =3D ISC_SAMA7G5_MAX_SUPPORT_WIDTH;
+		isc->max_height =3D ISC_SAMA7G5_MAX_SUPPORT_HEIGHT;
+	}
=20
 	isc->config_dpc =3D isc_sama7g5_config_dpc;
 	isc->config_csc =3D isc_sama7g5_config_csc;
--=20
2.34.1


