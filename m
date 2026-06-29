Return-Path: <linux-media+bounces-65859-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YcG6DQYkQmqP0wkAu9opvQ
	(envelope-from <linux-media+bounces-65859-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:51:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77D6D72E4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:51:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=OMwXmyBt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65859-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65859-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01BD5314F2F9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AE3352C34;
	Mon, 29 Jun 2026 07:41:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048003D7D9B
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 07:41:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718900; cv=none; b=VDyMpFIZiyDrHsB1m0hwO7eFbpwSuxRH0daZKegRaI7nvEOgzRObafgNNaujCa53XBHLYMiR+2EUV5uvVeg0v91LBx+rYnAbHxzf4+znzr4nZ/50/Xoz4Pi1kyQym1vGt4YwEPRGZGHoWkP7tHNEgn9kb+2nK1kjU3iX9dGZMR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718900; c=relaxed/simple;
	bh=VE12+kheJUHNJcZS0xmm8G1jNE16tSQxXib+Pnrs7qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NkB3xsAm5K6eP+OAOJEod54hxE6gZG5DWCgRAn598nOhQLPWxthsTwE/sQyw3EoPagVPuTO/eGLIhWJjxbk7wYp3b18uml4C/2kgLEl4IsxS0KvPsmwOaUCSC8WN/YHv/F7M6AHarK/K0K7pe44nAT2Wl2FDd4dBAWe/fEhiW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OMwXmyBt; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782718898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ux+/tM864TLH9DO10ATye6W9QF5Lm9wdYYjyrQrqxbQ=;
	b=OMwXmyBtkzTOho7MovEaNTv0ak1X6eBaOzN46snMzTssB2yej8sQphl81pHtijqDsAsw3V
	kdrX+40J3rsZcWxMa5nVJMurPnbADkmhInItWC0/fu8WIXTG93a37Bi2xZ5xZN99Ym9do9
	kwY3xs1SKdZtRs9t27JRnsmkbRMttVQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-oMX9TvHCNouSWNnG8KdNvg-1; Mon,
 29 Jun 2026 03:41:29 -0400
X-MC-Unique: oMX9TvHCNouSWNnG8KdNvg-1
X-Mimecast-MFC-AGG-ID: oMX9TvHCNouSWNnG8KdNvg_1782718887
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A988719560A2;
	Mon, 29 Jun 2026 07:41:27 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.com (unknown [10.67.32.110])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA58E1956041;
	Mon, 29 Jun 2026 07:41:20 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: computman <anis@talbi.fr>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony IMX471 as power enable
Date: Mon, 29 Jun 2026 03:40:25 -0400
Message-ID: <20260629074026.35490-4-hpa@redhat.com>
In-Reply-To: <20260629074026.35490-1-hpa@redhat.com>
References: <20260629074026.35490-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65859-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,intel.com,siliconsignals.io,gmail.com,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hansg@kernel.org,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hpa@redhat.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF77D6D72E4

Update the con_id for the Sony IMX471 sensor to "vana" to serve as the
power enable. Additionally, the HID values SONY471A and TBE20A0, both
associated with the IMX471 image sensor, have been identified on Lenovo
laptops.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 115bb37577a1..adff564bf3fd 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -164,6 +164,24 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.con_id = "dvdd",
 		.enable_time_us = 45 * USEC_PER_MSEC,
 	},
+	{	/* imx471 expects "vana" as con_id for power enable */
+		.hid = "SONY471A",
+		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.con_id = "vana",
+		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
+	},
+	{
+		/*
+		 * imx471 (on Lenovo ThinkPads X1 G14) expects "vana" as con_id
+		 * for power enable
+		 */
+		.hid = "TBE20A0",
+		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.con_id = "vana",
+		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
+	},
 };
 
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
-- 
2.54.0


