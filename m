Return-Path: <linux-media+bounces-63508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zMLsIHHTH2oGqgAAu9opvQ
	(envelope-from <linux-media+bounces-63508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:10:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E5635075
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:10:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=bXIynNIU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63508-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63508-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCFB930E379B
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7753B410D34;
	Wed,  3 Jun 2026 06:59:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876DF4048BD;
	Wed,  3 Jun 2026 06:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469984; cv=none; b=CGNARQRKgkIPP2QjrBy9fggRhsJSMNmuq2dH8DWoQSt2FyKDomCarZXrn8xRrYSllpiGiiexRHauCDybWAO4bN3ID1mfY7fxDWUAZ2NijNwke5eXeG/kDKyCji9quzLDDltP5E6Uw3p+XlVVvgbq3vaDdYoIM5dNytPRXWmi/SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469984; c=relaxed/simple;
	bh=m+RqOJfgRCuu3A+Pt9T7a3821k0tfdlK5SRxwEZZGmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IROVAsgP2fbuLpHcj7FNa24S4nNeTn2NjvFiaaG79PeFoa1K265sjkKbXtoEI5fkzfvoOaUHGYZP4BszJjr38qcTUwWOYNVct1C3aVFXNIHrmkSSKSKTnft3WZsSZXYSBDv/mA2VDior/ntkwcE3Gt/7YLRyxrsvtoNrwqFNz9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=bXIynNIU; arc=none smtp.client-ip=68.232.154.123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1780469983; x=1812005983;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=m+RqOJfgRCuu3A+Pt9T7a3821k0tfdlK5SRxwEZZGmc=;
  b=bXIynNIU8O7M4aj+1uInJqsJgAHrQX7LgJE4Yq9O9iIrKbKZ+gs4cKAP
   RZmHfturwRYJEnqoTwhf97mAkSdrqPGxVbL3fCUoE9ptr8jYtGLMk+Csg
   ehmazo2Km7k/oqd+qRY+zJj64RZ3MjyQgZBIle/ywf7Cjttl1vfh5zk1M
   vbpdruVTJmlDgND4VzBx4k4jeoNA+HsZYdSEFh+rjsXdMHtrPlUB0Z7H1
   RPp85hjxGQxcG2YROvA6e4tLt3ljTlefuXomQcTDenTSsACTeVOMyyXwM
   RRstdoAzj7V8SIhb/+7s7ob0NUsmIqPJqFNTmoc44fF3HVr18e94NgrA5
   Q==;
X-CSE-ConnectionGUID: QYB0Fs6XSTmcpS9OrsUAtA==
X-CSE-MsgGUID: 5oKuKCjkSMyS+h6C7B0tLQ==
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="58923880"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 23:59:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Tue, 2 Jun 2026 23:59:42 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Jun 2026 23:59:38 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 3 Jun 2026 12:28:54 +0530
Subject: [PATCH v6 11/12] media: microchip-isc: smooth AWB gains with EMA
 filter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260603-microchip-isc-fixes-v6-11-8c3d7474a768@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63508-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:balamanikandan.gunasundar@microchip.com,m:stable@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:balakrishnan.s@microchip.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:mid,microchip.com:dkim,microchip.com:from_mime,microchip.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F00E5635075

Apply exponential moving average (alpha=0.25) to reduce per-frame
flicker from sensor noise.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 6ebbb8adea45..621d90afe730 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1467,11 +1467,20 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		/* Combine stretch and grey-world gains; result stays in Q9. */
 		gain = (s_gain * gw_gain) >> 9;
 
-		ctrls->gain[c] = clamp_val(gain, 0, GENMASK(12, 0));
+		/*
+		 * Smooth gain updates with an exponential weighted average
+		 * to suppress per-frame flicker:
+		 *   gain = (3 * gain_old + gain_new) / 4   (alpha = 0.25)
+		 * Clamp to the hardware register width to prevent unbounded
+		 * accumulation under degenerate (near-empty histogram) inputs.
+		 */
+		ctrls->gain[c] = (3 * ctrls->gain[c] + gain) / 4;
+		ctrls->gain[c] = min_t(u32, ctrls->gain[c], GENMASK(12, 0));
 
 		dev_dbg(isc->dev,
-			"isc wb: c=%u black=%u avg=%u s_gain=%u gw_gain=%u gain=%u",
-			c, hist_min, channel_avg, s_gain, gw_gain, gain);
+			"isc wb: c=%u black=%u avg=%u s_gain=%u gw_gain=%u gain=%u\n",
+			c, hist_min, channel_avg, s_gain, gw_gain,
+			ctrls->gain[c]);
 	}
 }
 

-- 
2.34.1


