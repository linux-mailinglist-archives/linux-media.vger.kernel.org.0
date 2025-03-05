Return-Path: <linux-media+bounces-27617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F32A4FEA0
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A09C73AA73F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A33245019;
	Wed,  5 Mar 2025 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="LmI72CSt"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881BB2A1BF;
	Wed,  5 Mar 2025 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741177813; cv=none; b=muS2W1ofiQgA2ThAoLjwyVFJVjtmiuYBsZ9jEKeXDAHQbjj5wM75iVjKzuTkVsOWJasl0Ynnou2RggOVCSkv4953bwwudSYD+TvS9NKJ908oDeueXIrDQ6bPcJzCBKHmx517XA3Ac1J74OyVN4nOrdcPbjDV0SgbQeEdy7B3DXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741177813; c=relaxed/simple;
	bh=XUYFquD2kF7krYW6kimapa9xXRvl53m+sHdaVBDWrg0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vA/XAN7jvw5Ch8/mafxeJI9OHZOZb4FLMD5LUepjmBqa0zrMgYQ4NSc3bmbxDEMYqlEUMuS26eMzOD7iiyMIIh9BJLiK5movSO8yq0CG0mQD0tqePz9AQKzbZ8R3AUgz5B+5Wv9d66tjftp6KLdu4+a4mDs1ns461f6SjEd21qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=LmI72CSt; arc=none smtp.client-ip=81.200.124.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id 1DB85C001B;
	Wed,  5 Mar 2025 15:30:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 1DB85C001B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1741177801; bh=jwfiOKN+C1alB3gS3qmr0uc2qIJJ9i/ducBeeGQwW5k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=LmI72CStgcWWaWzQbPfDk2TeA2dNAw1/zxz9w4rltvJGmKJZmLg9PXkYa8PRzKBVT
	 UGjoA21Hu+cXHtOOHmAL5TJHVKEnEqf46aH025ZhpVbmH0Y4ywdQVFnJz4d8POQ7Ef
	 Fsmmxz3CaSccae4tValibP5bwu4CuA6NDgcVzG4OnQV/aJFAGp4RVMdvXD2C7tRohY
	 ZzjNrQPRkS28SOwBVtTfHHZ3tHWk+90/hWCAmeCua/fdakNDARAPK91ZUzDzIMUnxC
	 PLOYqCLKabmkNH3fzPAyexycXydUgKMNvm0qRgEILHAVjKuaTRblBvGftrK2nyTDuY
	 LKwiV/RLW9MYA==
Received: from ksmg01.maxima.ru (autodiscover.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru", Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Wed,  5 Mar 2025 15:30:00 +0300 (MSK)
Received: from localhost.maximatelecom.ru (178.236.220.168) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.4; Wed, 5 Mar 2025 15:29:59 +0300
From: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
To: Hans Verkuil <hverkuil@xs4all.nl>
CC: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] media: cec: use us_to_ktime() where appropriate
Date: Wed, 5 Mar 2025 17:26:39 +0500
Message-ID: <20250305122728.2317-1-v.shevtsov@mt-integration.ru>
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
X-KSMG-AntiPhishing: NotDetected, bases: 2025/03/05 10:40:00
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: v.shevtsov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {rep_avail}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, mt-integration.ru:7.1.1;ksmg01.maxima.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1;127.0.0.199:7.1.2;81.200.124.61:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 191499 [Mar 05 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/03/05 09:56:00 #27614020
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/03/05 10:40:00
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
ns_to_ktime() to improve readability and to make the code clearer. This also
mitigates possible integer wrap-arounds when usecs value is too large and
it is multiplied by 1000.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Signed-off-by: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
---
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


