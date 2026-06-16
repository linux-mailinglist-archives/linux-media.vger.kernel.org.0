Return-Path: <linux-media+bounces-65000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XoLzC5I5MWqoeQUAu9opvQ
	(envelope-from <linux-media+bounces-65000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:54:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7468EFC7
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:54:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=07uL4YVr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65000-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65000-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4234131CB988
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB96B43CED9;
	Tue, 16 Jun 2026 11:51:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B9343DA3A;
	Tue, 16 Jun 2026 11:51:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610687; cv=none; b=UbLXoXHgsBLVEkg/o/BFgmvoJB5JUJ7Uofhc7sNDizFfBRo9lnzysEqZ0HBC5p5AhdljPic3n6IpWuZmBlLSgpQvhVBaZwN8gcZUdxNHRa01PR4Q45EVQCSaiMsyN0OKA2p9pZDOoHhKMQmscWBKY5fU7QJvn3WiCoJn4PJjqfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610687; c=relaxed/simple;
	bh=4TYg+VMs8h32sXya3vkW1B41uQjMUC2J6Dzq0oxsgoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZeV1xlFLYHQ/VqdKdgs9PFEGm6yS4myxdYJnkQZz1TaCHCAn5eOt8SEu/gZbh/50KsUy663w6YO51ogLwPTvU4DULfZDNlVzr5GUA4JN4VMkZAbamZceQ5jgoqN5+cH4jo9794MtP4fA66U4XdZOw315VualWhDwIyR26AH9i/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=07uL4YVr; arc=none smtp.client-ip=68.232.154.123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781610680; x=1813146680;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=4TYg+VMs8h32sXya3vkW1B41uQjMUC2J6Dzq0oxsgoY=;
  b=07uL4YVr0vHAVG/AaQLcanJhMqS9QIuoT+t/5/p+KtTZI+gd5ndZJWpV
   9sZmM7D5punG+a5qXH8LJeAnElpx1vNHPt2+73rshLc+0KEYNCZAwc/V8
   CMUZ8vxXaWn7KBuEoFzH3IrHrsAAPZse7yFuwQFHMWUX9l7jiB6uEHS3T
   XpjTj/seYlN/jsy/6Fssm07Ik7dH70+/uBWIp8StmzEqx5GtxRQSwl2GT
   N7e7U5Jv4O3LB/NFLLtFO3NTW5LmIkRaKArksJSNTnqfDh7QrFfXj5+OR
   F2XOGJVoH33QDWDquPSDb+0VGmvCp8Gnyb4TUouzCymSAEGWfJdHIvuF7
   w==;
X-CSE-ConnectionGUID: WHSi6MErRqeZKN9xflmWgg==
X-CSE-MsgGUID: d+HcYmg0QBORuDwF8eWErA==
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="58365056"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:51:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Tue, 16 Jun 2026 04:51:19 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 16 Jun 2026 04:51:16 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Tue, 16 Jun 2026 17:21:00 +0530
Subject: [PATCH 05/10] media: microchip-isc: clean up histogram on the
 start_streaming error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260616-balki-isc-prefix-fixes-v1-v1-5-b23677fc5ab6@microchip.com>
References: <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
In-Reply-To: <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65000-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:balakrishnan.s@microchip.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:dkim,microchip.com:email,microchip.com:mid,microchip.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBE7468EFC7

isc_configure() enables the histogram, its ISC_INT_HISDONE interrupt and
a HISREQ before calling isc_update_profile(), which can time out and
fail. When it does, isc_start_streaming() jumps to err_configure and
drops the runtime PM reference without disabling the histogram or
cancelling awb_work. A pending HISDONE can then schedule isc_awb_work(),
which reads the histogram registers after the clocks are gone, causing
an external abort.

Disable the histogram, synchronize the IRQ and flush the work before
dropping the PM reference, mirroring isc_stop_streaming(): the
synchronize_irq() has to precede cancel_work_sync() so a handler that is
still in flight cannot re-queue awb_work after it has been cancelled.

Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
Cc: stable@vger.kernel.org
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 8f255a4c4e7a..f7fbd3cd8edc 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -382,6 +382,13 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err_configure:
+	isc_set_histogram(isc, false);
+
+	/* let a running IRQ handler finish before the clock is disabled */
+	synchronize_irq(isc->irq);
+
+	cancel_work_sync(&isc->awb_work);
+
 	pm_runtime_put_sync(isc->dev);
 err_pm_get:
 	v4l2_subdev_call(isc->current_subdev->sd, video, s_stream, 0);

-- 
2.34.1


