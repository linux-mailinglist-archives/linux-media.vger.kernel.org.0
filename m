Return-Path: <linux-media+bounces-27643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9534A5033E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 16:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9601F16478B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 15:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF3924EF9E;
	Wed,  5 Mar 2025 15:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="Bqv864iw"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC2824C68D;
	Wed,  5 Mar 2025 15:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741187611; cv=none; b=RCrBCzhyXhqP4kzssgZ3FKwA3POuUod26902kFwiMtM0Cb8Zu6qVsGtSOB2IMY5EAIadOk4nz80VKKm6cAtmd935rbB3rZYb03MWe/GZWLWsJOL8ExJWj3aYw4NjNpH7r8aSM1uPJ0BWKYA4XDBQWEOXDng2GxJR0ZgBW1u8czk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741187611; c=relaxed/simple;
	bh=A30K9ZC21AEWOAnZDI/LtiVBGGSU4L6zt2FCIEN/Wog=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hBp8mUFx3Pjt5WitRTDnMQOhpMCnde86/HHmRdzodABoxILcFvWgm1T8Kx3nTZzDWgiDZ0WJxoKLewCDXOFZzAw5OGWuPwLDUpibBbrZvGpILTRkir/TdSxzuRRfexIbCXN3UKLUsYXPXnp3w3LASdBEVzROehpFgy/iTDVJ06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=Bqv864iw; arc=none smtp.client-ip=81.200.124.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id 1F3B9C001C;
	Wed,  5 Mar 2025 18:13:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 1F3B9C001C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1741187605; bh=n5v3qc83BGal1rN0v71QU7IveSQvkixZaWHpHWiEcIQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Bqv864iwas3lLZxl3csNK+tXIldo4W/kctViiASVgRtIBWOFZl/o1fLLcbVkbysP3
	 LkdVKuD5yCHygC96t5bj6cC4wwfbRe4tzXr6y2Y9qYUSwjlfc9HllfxYduxYEoUeI6
	 jxuJp7Sljfu+irrKPqtNAQxDWE89veg0s8m4AtO5ieaAAVHJtZjiNntnBkBlBVsW+S
	 qFUhFRx8OWMyXTDQeQzhpcHO6o9A1iV7IPcOZ4qhTOnDxaEjL4Gp3c+eq6Wb0aGSoM
	 5GbfCID1X2Qci5Yh5hB+K0avuO1+pimOscq2RBnd9Z2OFn8zvb+pXfHK/6BWy54K/l
	 J6NwhXgeDTblA==
Received: from ksmg01.maxima.ru (autodiscover.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru", Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Wed,  5 Mar 2025 18:13:24 +0300 (MSK)
Received: from localhost.maximatelecom.ru (5.1.51.168) by mmail-p-exch01.mt.ru
 (81.200.124.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Wed, 5 Mar 2025
 18:13:23 +0300
From: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
To: Hans Verkuil <hverkuil@xs4all.nl>
CC: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH v2] media: cec: use us_to_ktime() where appropriate
Date: Wed, 5 Mar 2025 20:11:25 +0500
Message-ID: <20250305151212.13660-1-v.shevtsov@mt-integration.ru>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch01.mt.ru
 (81.200.124.61)
X-KSMG-AntiPhishing: NotDetected, bases: 2025/03/05 13:16:00
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: v.shevtsov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {rep_avail}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, ksmg01.maxima.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;mt-integration.ru:7.1.1;lore.kernel.org:7.1.1;81.200.124.61:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 191511 [Mar 05 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/03/05 13:56:00 #27617700
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/03/05 13:16:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

[Why]
There are several ns_to_ktime() calls that require using nanoseconds. It is
better to replace them with us_to_ktime() to make code clear, getting rid
of multiplication by 1000.

Also the timer function code may have an integer wrap-around issue. Since
both tx_custom_low_usecs and tx_custom_high_usecs can be set to up to
9999999 from the user space via cec_pin_error_inj_parse_line(), this may
cause usecs to be overflowed when adap->monitor_pin_cnt is zero and usecs
is multiplied by 1000.

[How]
Take advantage of using an appropriate helper func us_to_ktime() instead of
ns_to_ktime() to improve readability and to make the code clearer. And this
also mitigates possible integer wrap-arounds when usecs value is too large
and it is multiplied by 1000.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Signed-off-by: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
---
v2: Wrapped some lines in the commit description to fit into 75 characters.
    Reported by Patchwork Integration <patchwork@media-ci.org>

This patch was created after the Christophe JAILLET's comment at
https://lore.kernel.org/all/cff4d412-abbf-44b5-9705-ba14dff7d5d0@wanadoo.fr/

 drivers/media/cec/core/cec-pin.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index a70451d99ebc..f232c3df7ee1 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -873,19 +873,19 @@ static enum hrtimer_restart cec_pin_timer(struct hrtimer *timer)
 		if (pin->wait_usecs > 150) {
 			pin->wait_usecs -= 100;
 			pin->timer_ts = ktime_add_us(ts, 100);
-			hrtimer_forward_now(timer, ns_to_ktime(100000));
+			hrtimer_forward_now(timer, us_to_ktime(100));
 			return HRTIMER_RESTART;
 		}
 		if (pin->wait_usecs > 100) {
 			pin->wait_usecs /= 2;
 			pin->timer_ts = ktime_add_us(ts, pin->wait_usecs);
 			hrtimer_forward_now(timer,
-					ns_to_ktime(pin->wait_usecs * 1000));
+					us_to_ktime(pin->wait_usecs));
 			return HRTIMER_RESTART;
 		}
 		pin->timer_ts = ktime_add_us(ts, pin->wait_usecs);
 		hrtimer_forward_now(timer,
-				    ns_to_ktime(pin->wait_usecs * 1000));
+				    us_to_ktime(pin->wait_usecs));
 		pin->wait_usecs = 0;
 		return HRTIMER_RESTART;
 	}
@@ -1020,13 +1020,12 @@ static enum hrtimer_restart cec_pin_timer(struct hrtimer *timer)
 	if (!adap->monitor_pin_cnt || usecs <= 150) {
 		pin->wait_usecs = 0;
 		pin->timer_ts = ktime_add_us(ts, usecs);
-		hrtimer_forward_now(timer,
-				ns_to_ktime(usecs * 1000));
+		hrtimer_forward_now(timer, us_to_ktime(usecs));
 		return HRTIMER_RESTART;
 	}
 	pin->wait_usecs = usecs - 100;
 	pin->timer_ts = ktime_add_us(ts, 100);
-	hrtimer_forward_now(timer, ns_to_ktime(100000));
+	hrtimer_forward_now(timer, us_to_ktime(100));
 	return HRTIMER_RESTART;
 }
 
-- 
2.48.1


