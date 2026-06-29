Return-Path: <linux-media+bounces-65907-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2t9qM8FTQmps4wkAu9opvQ
	(envelope-from <linux-media+bounces-65907-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:15:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522A6D9447
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:15:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=iQRHHKoC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65907-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65907-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20EB9307E1A5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0F3FFF82;
	Mon, 29 Jun 2026 11:09:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB63B71D6;
	Mon, 29 Jun 2026 11:09:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731386; cv=none; b=b1f35ufbHYK24yWPpJ165XgDDQagHSnub8IUGXGMg/8n73uoM/96GF6Jqy/xiAXwvdlWK3LXKKqxHMr/MvTtpDkQhjvFeX+HyQSRQMMKyWHv04IdDRm2Ksf2PMg+sTQvN/+6uBH6v2+JzX+ujKdVeqZ/A7CphjSYpAZqvEkj66c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731386; c=relaxed/simple;
	bh=agcXhHZQfY9GSymiB+S4S7qoSlSq70hKgrCm9xXkH+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TLKMX+XpML7hPVwrnaHQYHhJTsRv6JIT1dN+LeDe6UXRK5RVi3sI6GUeWXg17pp4R2EopgIXT+9b65FJlPhHrtHTD5XS9Ts4uU/WEDPZj08+i0v2z3kuVCKM0tOGRgBitInwgnp7AyYDRV2zSotGmCyulhSmQ74ST7REpjCace0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=iQRHHKoC; arc=none smtp.client-ip=68.232.154.123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782731385; x=1814267385;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=agcXhHZQfY9GSymiB+S4S7qoSlSq70hKgrCm9xXkH+c=;
  b=iQRHHKoCbQll1xvEJpOrc+BnK+LCYsdEQhC3FNEKnoAsCenTDsB6qv41
   uNcHIt0umcHN/x7Vlekbusu3khKQ8S2omQ45h3UI4GdQNEKj3hlHpi9ju
   OP89MtgSPJHoHg3CiyT+M1hflh+kTxa9gEpENuKMX8tmDwWWqVIJWcLcA
   1Q9CjUr/UzCukQYL7WD4/2QyRzyJf7NLimjWaSquK0CjNgq2r+h+ujWrM
   GecnMB6tBiucIFAx7+iTLJ7jlFv4LagGGk2xCqBJ7UEQ6PnmZBFoOvoah
   yKP+zuE1PYlKsjFY4ajrS0WF6dgPyR6+wxcdUqHaIwK7fHSq7vB6YksaR
   g==;
X-CSE-ConnectionGUID: BX/kHuIhSKSPz1hJiZnQ2g==
X-CSE-MsgGUID: SRYV5SV1SbWdH71qT6NCcg==
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="58973937"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jun 2026 04:09:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 29 Jun 2026 04:09:38 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 29 Jun 2026 04:09:35 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 29 Jun 2026 16:39:27 +0530
Subject: [PATCH v2 02/10] media: microchip-isc: take a reference on the
 parsed endpoints
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260629-balki-isc-prefix-fixes-v1-v2-2-3b120cc3742f@microchip.com>
References: <20260629-balki-isc-prefix-fixes-v1-v2-0-3b120cc3742f@microchip.com>
In-Reply-To: <20260629-balki-isc-prefix-fixes-v1-v2-0-3b120cc3742f@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65907-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:balakrishnan.s@microchip.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:dkim,microchip.com:email,microchip.com:mid,microchip.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4522A6D9447

for_each_endpoint_of_node() drops the reference on the current node as
it advances. xisc_parse_dt() and isc_parse_dt() store the node in
subdev_entity->epn and release it later with of_node_put(), but never
took their own reference, so the stored pointer refers to an
already-released node. This underflows the refcount and can
use-after-free, reachable through the camera device tree overlay.

Take a reference with of_node_get() when storing the node, and drop it
in microchip_isc_subdev_cleanup() so the entities the bind loop never
reaches on an early exit do not leak it.

Fixes: c9aa973884a1 ("media: atmel: atmel-isc: add microchip-xisc driver")
Fixes: d6701f13bd07 ("media: atmel: Use v4l2_async_notifier_add_fwnode_remote_subdev")
Cc: stable@vger.kernel.org
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c  |  6 ++++++
 .../media/platform/microchip/microchip-sama5d2-isc.c   | 18 ++++++++++++------
 .../media/platform/microchip/microchip-sama7g5-isc.c   | 18 ++++++++++++------
 3 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 45a7af779323..4079c79cb668 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1859,6 +1859,12 @@ void microchip_isc_subdev_cleanup(struct isc_device *isc)
 	list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
 		v4l2_async_nf_unregister(&subdev_entity->notifier);
 		v4l2_async_nf_cleanup(&subdev_entity->notifier);
+		/*
+		 * Release the endpoint reference taken while parsing. It is
+		 * NULL for entities the bind loop already consumed, so this
+		 * only drops the ones left over on an early exit.
+		 */
+		of_node_put(subdev_entity->epn);
 	}
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 66d3d7891991..97752eca6d6b 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -356,28 +356,28 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
+	int ret;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
 	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_put;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			of_node_put(epn);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_put;
 		}
-		subdev_entity->epn = epn;
+		subdev_entity->epn = of_node_get(epn);
 
 		flags = v4l2_epn.bus.parallel.flags;
 
@@ -398,6 +398,12 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 	}
 
 	return 0;
+
+err_put:
+	of_node_put(epn);
+	list_for_each_entry(subdev_entity, &isc->subdev_entities, list)
+		of_node_put(subdev_entity->epn);
+	return ret;
 }
 
 static int microchip_isc_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index b0302dfc3278..1f5debb74f18 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -340,6 +340,7 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
 	bool mipi_mode;
+	int ret;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
@@ -347,23 +348,22 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 
 	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_put;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			of_node_put(epn);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_put;
 		}
-		subdev_entity->epn = epn;
+		subdev_entity->epn = of_node_get(epn);
 
 		flags = v4l2_epn.bus.parallel.flags;
 
@@ -387,6 +387,12 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 	}
 
 	return 0;
+
+err_put:
+	of_node_put(epn);
+	list_for_each_entry(subdev_entity, &isc->subdev_entities, list)
+		of_node_put(subdev_entity->epn);
+	return ret;
 }
 
 static int microchip_xisc_probe(struct platform_device *pdev)

-- 
2.34.1


