Return-Path: <linux-media+bounces-61289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBUcBzhMA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:50:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A66F52401C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B54803151FAC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9623C769D;
	Tue, 12 May 2026 15:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="hJHVujOY"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B303C5855;
	Tue, 12 May 2026 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600638; cv=none; b=oUlbreo3Ae/Dnuo+u8RlYbpQ4Y7r9jHb9foc4uoKDqVZsj5zFnlF6TqSjp3j5qRA7Xtn63/C4KgqhKtRAMhraTxqy3LQBMDDtLwoevBbBUuW7WJ/X1klHBwcy/kjoIkocIcZtsLrLY9V3dbjbh+0/yrqSw2+/mY17pH5M3xDFIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600638; c=relaxed/simple;
	bh=KBOyCfytO59B3eLkt3W3y4OYYEa4q8H0EU2Rolfcwok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EdAklZTxw2KZMY6Aj48tP7WKwtoPcYMaTALmRUcieppooPtufZI6/RRlOmxDgmzE/h1dArXcyxOUYgXS4unfvt+Ti2Qo8Ta4brnhP9bh8XK+QSw1Hhc/SssbgTxfDRQ6k4wOI1REfGbX8nWAFP5iUQdCuIt4NWN11Gm7mIe8bLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=hJHVujOY; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600637; x=1810136637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KBOyCfytO59B3eLkt3W3y4OYYEa4q8H0EU2Rolfcwok=;
  b=hJHVujOY1lgsCIQdqqR7yMU82xcX0Ae1kenjSGpvxhXvbq+zx85ISFzY
   2bKvXeVtC3FB6l/sI82jWal1HnX11K/JXkHlkZRBGvqsL0rSoq0PAThWM
   HvwEQ2TF1JYmePH4Z7VUz0iHUzawifj99ZB5lKG5lFTHb/3gDPuytMEze
   Jw9ycgTwk0xjYvobZcFrhpZ1HosKgiyMpopcRTR71FF4D1wZoCpzxVMTG
   zK7wAzcehdtTCk1pvEl/LDh6rOnalre9/2iUY2bbqMf64TIt6eOKcpVUz
   weAAtrckWYHoWT6ls/EyavG0L4eVO30Wzdftx2riQj0BqmXGZPSXB6jec
   w==;
X-CSE-ConnectionGUID: beovU07SRTqav/gjPHMA9g==
X-CSE-MsgGUID: k1wnj1dJTC2tyhVpjTBbXA==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="65713094"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2026 08:43:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 12 May 2026 08:43:56 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:43:53 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v2 04/15] media: microchip-isc: fix PM runtime leak in AWB work handler
Date: Tue, 12 May 2026 21:13:28 +0530
Message-ID: <20260512154339.210444-5-balakrishnan.s@microchip.com>
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
X-Rspamd-Queue-Id: 8A66F52401C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61289-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Early return when streaming stops skips pm_runtime_put_sync(),
leaking the reference and preventing runtime suspend.

Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
Cc: stable@vger.kernel.org
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index b19c5a63b4bd..f61a5d5a3e04 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1429,7 +1429,7 @@ static void isc_awb_work(struct work_struct *w)
 	/* streaming is not active anymore */
 	if (isc->stop) {
 		mutex_unlock(&isc->awb_mutex);
-		return;
+		goto out_pm_put;
 	}
=20
 	isc_update_profile(isc);
@@ -1440,6 +1440,7 @@ static void isc_awb_work(struct work_struct *w)
 	if (ctrls->awb)
 		regmap_write(regmap, ISC_CTRLEN, ISC_CTRL_HISREQ);
=20
+out_pm_put:
 	pm_runtime_put_sync(isc->dev);
 }
=20
--=20
2.34.1


