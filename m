Return-Path: <linux-media+bounces-61337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEhwOsklBGqDEwIAu9opvQ
	(envelope-from <linux-media+bounces-61337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:18:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8EC52E7C5
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E362030034B6
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0063D6498;
	Wed, 13 May 2026 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="f5TtkJCu"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA5E3D5C35;
	Wed, 13 May 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656680; cv=none; b=livMc3DTJHx5gXArspiXiClzE/nQKJ+Rg3e4mpZr8xcgrmbUe4Rpg1bQQWK7ZECEe2zZAXVTTWt4f+ZXjCYYMFGyvJNy3GiJ6nxpiKLTqWdNpg95dOdilclGwrNgYwKECbhhCtqgJc+b3sMvm9SESL9oq1+FTUP6i90Vmcd2xds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656680; c=relaxed/simple;
	bh=KBOyCfytO59B3eLkt3W3y4OYYEa4q8H0EU2Rolfcwok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kmbk9Ca/XK0tNm8gEnKDFAerZrZC501MpaB3zejKoxml3xaEqUCM/kFwmN77pbjJgVfyRkBeDyV5DYvUR/E9AdJ8U7wHlAlFP96uQ06RlAK4UABo769ijS0uS1e6HBZnuUKgGvzKyxfmZ7kwV07nP0xIks9FtJ9w/GynWrZ6KdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=f5TtkJCu; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778656679; x=1810192679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KBOyCfytO59B3eLkt3W3y4OYYEa4q8H0EU2Rolfcwok=;
  b=f5TtkJCuQVOGuT3OcREBCblF68qAunsQl8loiYru1AKb7xp8n5g+ABq9
   MZTG57aBnUFwuiBlTaIpssgoS+XnHA+uT+FrZhJFHebxF2qlTwAQ3XZXc
   X+ab3QpwJrhnM07qrYjXj5wvxG7qQ4uAAjkGeZqzcwUxnmYQa6n8JVWAF
   xw3u0vu/oC2djBo/6dCQZ180MTTvTfV//OG/JwaSwpqOdngkOAa6fyCw6
   8pIiLOVC6XNT7NwbWY9qNJbftMwjS9yhtvPG0VnxCQ9GwBFeUe2mU3NdV
   UhDW+Ndbo37HsqaIKMVBXDuuaWTuKoSBrrRvUGNSBpjLjl5of9eDeJuqd
   w==;
X-CSE-ConnectionGUID: heKVsA9yTHi1mJDkxCkcaw==
X-CSE-MsgGUID: uO3MbnyyTPSaK/w0eCF3rQ==
X-IronPort-AV: E=Sophos;i="6.23,232,1770620400"; 
   d="scan'208";a="56656513"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 00:17:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 13 May 2026 00:17:58 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 13 May 2026 00:17:55 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v3 04/15] media: microchip-isc: fix PM runtime leak in AWB work handler
Date: Wed, 13 May 2026 12:47:31 +0530
Message-ID: <20260513071742.97263-5-balakrishnan.s@microchip.com>
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
X-Rspamd-Queue-Id: DB8EC52E7C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61337-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
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


