Return-Path: <linux-media+bounces-27260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7140A4AA9B
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 12:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C67C7A8A3E
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 11:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D73C1DE3A6;
	Sat,  1 Mar 2025 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="ELPdYg+l"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580681C5F2D;
	Sat,  1 Mar 2025 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740827616; cv=none; b=ml3dKCZ3BIYSQndRtM5lIlypbsk7i957+YRT+yh0bZBO8WEGGq5MKp8i1CsZ9bcot1paY45NDSF1u3JdcJmB8Pbi75mWbQal8ksceIWfwDWU+8a91KxRRtKvgbUjf5tHPvGGxDx+nWfWq4jdAVsssqhiz1XxkvxGNhGRVyWqMHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740827616; c=relaxed/simple;
	bh=+AbNtnaDXud5s74tJVuptbsFx8r7MhvvdNtsYu3ZnYQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P+MlbyyNfl6Zf2P40ph0A2X8zb6TxpTLsajx9Bj+uIqLr/6FrPaCaXO5j99P8kNBWXrelQBz2pFhp01eBJqJkC2F2A//qAf6RImqPsG563KMncl8x40yhCtrF8U7tiRBh1uKuFmW3pJ2MC4zQJ4VYxHk7qIL3Fxmf2SLkWf2Jfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=ELPdYg+l; arc=none smtp.client-ip=81.200.124.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id 0BCBCC0010;
	Sat,  1 Mar 2025 14:13:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 0BCBCC0010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1740827604; bh=QQhkhPBQhZUQUCZDT/NBlpDqW9OIbH89a7upfUDq8Fc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ELPdYg+lR8sntCXynN9bMOO2/F9rne5oWjPqJZTJg+DCWlgEUJX/8iYd6BFjfrMvj
	 HWeFMCZ7i+UISQ3N4mBYrMvW1xcYyn6taC5iiykMXsWEURKhsKCkYJnqKZLqOxWqBz
	 hkloNiHPi7rxHhWkhALanWTi5QIHA4E7Jq7AooTavz/arjdca+hUVkKYASagejOg5/
	 m3Mnvqx4h83yoe8gDgfEo8hpztM6AtNFp/QErej8k0NufKe6i9LUBFAf6medJozTxw
	 QhxcBpmkQGSWEqt1QLsu9yD5hin3yzJ3wz9YUXvSxsPzBNmg+cW6DdbSsHXCiVUGTB
	 ZFAdpn5C5018Q==
Received: from ksmg01.maxima.ru (mail.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru", Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Sat,  1 Mar 2025 14:13:23 +0300 (MSK)
Received: from localhost.maximatelecom.ru (5.1.51.90) by mmail-p-exch01.mt.ru
 (81.200.124.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Sat, 1 Mar 2025
 14:13:22 +0300
From: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
To: Hans Verkuil <hverkuil@xs4all.nl>
CC: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] media: cec: avoid wraparound in timer interval calculation
Date: Sat, 1 Mar 2025 16:09:57 +0500
Message-ID: <20250301111053.2661-1-v.shevtsov@mt-integration.ru>
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
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: v.shevtsov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {rep_avail}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;ksmg01.maxima.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;81.200.124.61:7.1.2;mt-integration.ru:7.1.1, FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 191398 [Mar 01 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/03/01 07:55:00 #27511358
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

[Why]
The timer function code may have an integer wraparound issue. Since both
pin->tx_custom_low_usecs and pin->tx_custom_high_usecs can be set to up to
9999999 from the user space via cec_pin_error_inj_parse_line(), this may
cause usecs to be overflowed when adap->monitor_pin_cnt is zero and usecs
is multiplied by 1000.

[How]
Fix this by casting usecs to u64 when it is being converted from
microseconds to nanoseconds.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: 865463fc03ed ("media: cec-pin: add error injection support")
Signed-off-by: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
---
 drivers/media/cec/core/cec-pin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index a70451d99ebc..f15ed5c67a65 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -1021,7 +1021,7 @@ static enum hrtimer_restart cec_pin_timer(struct hrtimer *timer)
 		pin->wait_usecs = 0;
 		pin->timer_ts = ktime_add_us(ts, usecs);
 		hrtimer_forward_now(timer,
-				ns_to_ktime(usecs * 1000));
+				ns_to_ktime((u64)usecs * 1000));
 		return HRTIMER_RESTART;
 	}
 	pin->wait_usecs = usecs - 100;
-- 
2.48.1


