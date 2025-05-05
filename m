Return-Path: <linux-media+bounces-31747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED042AAA389
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0F5A7B3AEC
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18E52F1CD4;
	Mon,  5 May 2025 22:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AncV8vDT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FDE2F0BBC;
	Mon,  5 May 2025 22:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483825; cv=none; b=PdOuO/PSdyDpYrQTKTnBPA+SQWmBmzjmCRwetXzhHsvJUk9+ULl5lzMx9ig0NydHRNmyfxhZ3BCBqpDuF6ugGNPpYf/+qqEpPnxITprfp1RWZbSOfuLjU1/mvUSBZJjNlDkTXEyxGJvhSRUJZxCsteMF88fCEN4pKzv4crOxzd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483825; c=relaxed/simple;
	bh=edg0nVXu9uZj8Xe9yrtJPdIbvKzEURgpFHi0v/+YL6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aKZQ+zn4Dj1qXym26hSfsGSE8/XK9FdDHg5tSwkK5yJJTpTtJ1kWaI7OGttJAEgCWtR+w67Y6HOqMRya7hLh+rYzdapFWJ/ObPyspFFJr5+N5vrxpwF+jG6efr6PQrUn3Dc5Y/+AoLK1lx7tNQHh7a4NeS6ymFTLW3BIqkaCFmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AncV8vDT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17406C4CEE4;
	Mon,  5 May 2025 22:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483825;
	bh=edg0nVXu9uZj8Xe9yrtJPdIbvKzEURgpFHi0v/+YL6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AncV8vDTIwaC4MLZN7NaViufOkAl4CRikmEI3Lwpq0B6Tpkdy5qppnC2cPOgtlI2P
	 niy3Gv9IW8HDT0+PzJ4pazHcl4PsaqUFoD+9GXGzf1GffG87qjQlkyQLGn3XdnALNn
	 01gV8LrizKVUzpDmsNFD1MH4XaOHe3fn8yyU8TD5Rxh9rY8WK4D492Qco+qpbZy3lv
	 Y40JE2GrSmggZAkE2YSBpJ3pRdx5gfnt8ekHyBaydIWt5mHlW0Cdh1IC8ZTwvTPQEd
	 ulDv9+/Axit6QbW8R9XJnF2TZ6kk1DfkdOy0rgHE+1DyOcoIj8FSGt5o5cfdLkF9+n
	 kZhs3mQFJMGRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	namcao@linutronix.de,
	tglx@linutronix.de,
	jani.nikula@intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 236/642] media: cec: use us_to_ktime() where appropriate
Date: Mon,  5 May 2025 18:07:32 -0400
Message-Id: <20250505221419.2672473-236-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>

[ Upstream commit c0c1a6bf80e9075e3f6b81fd542550d8eb91e57a ]

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
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/cec/core/cec-pin.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index a70451d99ebc9..f232c3df7ee16 100644
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
2.39.5


