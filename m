Return-Path: <linux-media+bounces-39500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E4B21DF4
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF161905062
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB6B2E5411;
	Tue, 12 Aug 2025 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VPQV7qAL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bzNzbqCH"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA162D948C;
	Tue, 12 Aug 2025 06:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978895; cv=none; b=kTcMRjG5tARqJWo/zxwZaIDWOnM4z3P2naU8jEDlDP+yV4o3pzO0ajelvhzV/xpJ0QWh9E4JFav5+blRZGhTo5/CClvCy7fwYrNgnRWfvm1qQISotLKHhtTFGgv3+ENfXpnaCgKc7Y5fOu5jy4+ykCC+jrL9Q6Gh8Zd1DvBvfE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978895; c=relaxed/simple;
	bh=z3HQR43UqG3JSyrM06mxtW8lA1cmGVnE5uffmTfAQFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlGRJWO1b4WuB5FKhTOboFBX8ndyAdgKWsk8JQ7nwrqkIYZJpemfeLZrbbzfqiRqD0ksNDDj3ZVC+24SJ1m8F9JYzirU/tPsU2dnLot/8HlaAPznvwonQ7OY0QQiCl7yAzJgvSDkM3C2bYxc5d6j6Lxk0ySyQ+wh4dKdSb745nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VPQV7qAL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bzNzbqCH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754978892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tey58V1tUmxjEhIxGwXATPrEYoF8tOxa4AE85TvKXZc=;
	b=VPQV7qALVu83oSqawIsSv29GXoM5sJKIog0ekvKdLeSxDpYJ0omFMzGl966uvIDtYQPJ9E
	lfCTulTtiwQnekMH+zGB/vHaXy9F2dGwKI1jduHdON2V+eFl0Q/S09YyyHua37+u1lYmi3
	UjXTzHnGCHVtxjleQrD6N++li6erqrxxP5YTHzhwtkRGNeS5/5Pak4u1kyXTcee+vX2D3Y
	1qSeGQ/braKkXW1DsmekYvkKcmRESotaifcCK3/egYUdF8U6UHLAaa1eRdRVZG81tGsaOP
	EAcYCHt3AJTUgb9H4EfR//TXHeVjxmEa+4cGb6QPWZetQ7uiLd4Dc3EhRiXR5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754978892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tey58V1tUmxjEhIxGwXATPrEYoF8tOxa4AE85TvKXZc=;
	b=bzNzbqCHQMOzvVEs5qkzK19tnbkGnPI4yBGtIIi0Pgp+LPwWzRWJVMVEuhF8e8VBJf7NBz
	oj/yMg95U6JhIpAQ==
Date: Tue, 12 Aug 2025 08:08:11 +0200
Subject: [PATCH 3/8] sched/core: Avoid direct access to hrtimer clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-hrtimer-cleanup-get_time-v1-3-b962cd9d9385@linutronix.de>
References: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
In-Reply-To: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Matt Wu <wuqiang.matt@bytedance.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Sean Young <sean@mess.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-media@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754978890; l=888;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=z3HQR43UqG3JSyrM06mxtW8lA1cmGVnE5uffmTfAQFI=;
 b=N7rZSEcP/IydxFGDv1sBDbMbv9+D8TqlAZly0Gxy2T9Z4PBM6cdTTdUZyGEpNiR14FmFWWjkI
 IyYLu1gRm8/C7+wcuiabeeXjJkbYjHx0EsTuce5pnkRjCHo25COhse/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index be00629f0ba4cc5832189c0052b0b632deb4ea2e..4dc12838ad4fdf086b3f3f1168072d6301f51aa3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -917,7 +917,7 @@ void hrtick_start(struct rq *rq, u64 delay)
 	 * doesn't make sense and can cause timer DoS.
 	 */
 	delta = max_t(s64, delay, 10000LL);
-	rq->hrtick_time = ktime_add_ns(timer->base->get_time(), delta);
+	rq->hrtick_time = ktime_add_ns(hrtimer_cb_get_time(timer), delta);
 
 	if (rq == this_rq())
 		__hrtick_restart(rq);

-- 
2.50.1


