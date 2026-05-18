Return-Path: <linux-media+bounces-61965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP82NgP5CmpZ+QQAu9opvQ
	(envelope-from <linux-media+bounces-61965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:33:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F956BA0A
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC5363024F89
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522983F86ED;
	Mon, 18 May 2026 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="OOVBiJYA"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EDA3F5BD6;
	Mon, 18 May 2026 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103819; cv=none; b=NBHOEb/BYh/k+sIsuRnBZxrf0VxYFaYF73xL7/XHgMtCR7ItCe0lI3EcgF2/o869JpOzrjzSd1f2ag68A075/cjNqV/SYF0UEEIhTOZkODygOMO7ZF8B+gfIoZMtAp1iX9U7gLmTsbyxCRxRXfB5Eu2dve+iIJKysGfAQt+AbkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103819; c=relaxed/simple;
	bh=T+zVygOBokk79HhCYGyT4FwHbQ8HXxSoWftezh8efK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=epg8E3/sGBO+xm4dNvBtVfwHnJ6uoCOGoLoB8OLMbDF6UNDS86+TKnhvfEosJJDPCsNhIfI7DIWZGKWdvNf8p7N6lwcBkZf/BJxrVVBzIXU2pS3Q1nYhO0PwL6SUziwJgLsyfLsz+4oztWZ6ZPNtTD2v/MFbMINB9NJWFlvfj0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=OOVBiJYA; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103817; x=1810639817;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=T+zVygOBokk79HhCYGyT4FwHbQ8HXxSoWftezh8efK0=;
  b=OOVBiJYAIfmWwNS4FEBO0VNHZ8OWqb9u7y1fKzl3gcY8dMJm5F/fH1h+
   kft0WR8HF7V++Uvi8heHDuZWf69/PKbNQ2eJOs2htYWVCxYXrShia/voQ
   9qB1eXdCtwBEmUH/wL3TgPZU357nAYu1pXWNim3IiuRkMei91oegckm+4
   wFUrpAXDTHtEcEFAQc8VwGJTBV6Hf9cvCD4myjHgr79DaDpdfg/I/HxK7
   snPw8FzM0dbN2v6fS1K6qtTyR8STCwfKpjaCXl9dB1iL+uVHGO3BXc5VE
   H6XhR4L8AoDEwLP1VY2hBKkEm10KGx33Q8EpqrwmnSPFbxgX0siwku2hF
   Q==;
X-CSE-ConnectionGUID: aiq2nMXITC6adAccUQ95+A==
X-CSE-MsgGUID: ov5q6pYsReybU4CnFUAtVw==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="57659251"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:30:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 18 May 2026 04:30:11 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:30:07 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:44 +0530
Subject: [PATCH v4 06/12] media: microchip-isc: set SAM9X7 maximum
 resolution to 2560x1920
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-6-97f189185b7e@microchip.com>
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: C79F956BA0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61965-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


