Return-Path: <linux-media+bounces-62882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG9OFtHQFmowsgcAu9opvQ
	(envelope-from <linux-media+bounces-62882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:09:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F22505E31E2
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFD58302F6A5
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66253F39EA;
	Wed, 27 May 2026 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BjT3WbEZ"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486A3F58E1;
	Wed, 27 May 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880072; cv=none; b=D4lVsQYgYj6j0T88PmhJgT9GFQvhdJIq58CqWAkc9KuLMSEwLj18nWVRmjWI7iUs7kdbxj9IsjXBOUprnZdds2o4ClF8Jd1HDE6iplIaf/8zZSnm7i8g5E3bb9mj6NCuoJZx8fpKrvZ94x3a3Lr8+weMEemhMhffeg4cUFT22PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880072; c=relaxed/simple;
	bh=T+zVygOBokk79HhCYGyT4FwHbQ8HXxSoWftezh8efK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dk5k8LMIQavbSXdFPcLvXEe+a0U8AuNTPJoNPghyiObI1MDn/ZeJt0spUjTOrpzjSqfQPyFWg8ttDlZm0zaF4QOEl5vgephEYKGJCpjo1foljcHBJGYyJdwXrkHfGM1KqvlYGul9j3uxRKOdQWIr5ucWghkcYht3UK+hGjx+XC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=BjT3WbEZ; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779880070; x=1811416070;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=T+zVygOBokk79HhCYGyT4FwHbQ8HXxSoWftezh8efK0=;
  b=BjT3WbEZvH1yyK3yDwurNtqVIEY2KhJvAlkqguKoUOgp+AWKz/EXv9/w
   7H5JAaYUvMDmQ2wpxnQVMPl7SWhH+74d8fhAAp9jJJwkqSDaekOzVv80e
   WX89oOiX8r4/nZ8KZEFq1tQ2e5MXUCQT5lyC91nkQZqsyrZHWsgnv4/DM
   IMGQmKW6S2NCfGsfS5LwiKLAxCagjn+sHkt3ufWsTuhccNwDfxjdwC4Df
   jAe5Bh45q1Itc46SKKrYQ/2l6LE21oLZTF1FT6taqYlNpAHq8f0YWCPWu
   Yi9i512K+v//zV7Jf2VDmY8xFFw4slOTwyXsSfLthtzhYFebCkw3iByCF
   A==;
X-CSE-ConnectionGUID: 6nWmiUMtR9a3WXDcAPLN3w==
X-CSE-MsgGUID: SKCZIK8XSBek6xvzva+nNQ==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="58532060"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:07:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 04:07:49 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 04:07:45 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 16:37:22 +0530
Subject: [PATCH v5 06/12] media: microchip-isc: set SAM9X7 maximum
 resolution to 2560x1920
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-microchip-isc-fixes-v5-6-b0ec1bb954be@microchip.com>
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
	TAGGED_FROM(0.00)[bounces-62882-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: F22505E31E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SAM9X7 XISC uses the same image processing pipeline as SAMA7G5 but has
a smaller internal line buffer. The reduced RAM constrains the maximum
horizontal resolution to 2560 pixels (compared to 3264 on SAMA7G5),
resulting in a maximum capture resolution of 2560x1920.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-sama7g5-isc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index ca23e8adecbd..4119cfe12cdf 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -55,6 +55,9 @@
 #define ISC_SAMA7G5_MAX_SUPPORT_WIDTH   3264
 #define ISC_SAMA7G5_MAX_SUPPORT_HEIGHT  2464
 
+#define ISC_SAM9X7_MAX_SUPPORT_WIDTH    2560
+#define ISC_SAM9X7_MAX_SUPPORT_HEIGHT   1920
+
 #define ISC_SAMA7G5_PIPELINE \
 	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
 	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
@@ -432,8 +435,13 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	isc->gamma_table = isc_sama7g5_gamma_table;
 	isc->gamma_max = 0;
 
-	isc->max_width = ISC_SAMA7G5_MAX_SUPPORT_WIDTH;
-	isc->max_height = ISC_SAMA7G5_MAX_SUPPORT_HEIGHT;
+	if (of_machine_is_compatible("microchip,sam9x7")) {
+		isc->max_width = ISC_SAM9X7_MAX_SUPPORT_WIDTH;
+		isc->max_height = ISC_SAM9X7_MAX_SUPPORT_HEIGHT;
+	} else {
+		isc->max_width = ISC_SAMA7G5_MAX_SUPPORT_WIDTH;
+		isc->max_height = ISC_SAMA7G5_MAX_SUPPORT_HEIGHT;
+	}
 
 	isc->config_dpc = isc_sama7g5_config_dpc;
 	isc->config_csc = isc_sama7g5_config_csc;

-- 
2.34.1


