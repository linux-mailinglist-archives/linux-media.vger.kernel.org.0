Return-Path: <linux-media+bounces-40591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389DB2FA7E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C307188C719
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE27A33CE8A;
	Thu, 21 Aug 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tgsUFy1Y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eHleXzNJ"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C31338F26;
	Thu, 21 Aug 2025 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782983; cv=none; b=ulY9zzxgnvu7ANvcoQdbFZwvmqxIJQeSrYw3tOsMIpuHW9tzgctgfGLVwYUNKFaKLZWVwh841XHpob73Wl4eVGQV7kf5X5VD6/vtweNoqVqOPpsadzXosxbJf2cAkIa2NzoVKpk0iRJPLoaOTLNXtk2E28VT3oNKxEu6yzd2pys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782983; c=relaxed/simple;
	bh=gpXy2GjW3NstgkefEL7nb0bYvGGEsP7NwP6FnKaezKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDALbFDtrn0YyH5uNwsinCgEFpSzBfWA73pq+XvVz1pe2z2Y2so6+Lb9HTmYniTNfaV7G+wtliSNaR6EFPoP2HSejJ1Oxj2/eXtZPcFLoCH0VUI2Olh5E/bR4zg31cDtoBV78x+JPKaJT5FfrKckYvZQ+3v3B6SA0/toMaHYqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tgsUFy1Y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eHleXzNJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755782980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ6UHeBc4TYS0MVyvj20OtZxtPShZrHBOAEWRaqEkWU=;
	b=tgsUFy1YSinjiYltQZAabBGZRv/YzxWuGd67x58NbfBmEWbsuNETCDnVsKXJEbjtSxylig
	l/subEZvhekAFr0lH1Ee/10Kla/rkxZvIK+CXajQIQVt5QeOFbe9xZAFeta/xLXFJaX3A7
	FcLjfCy0vddFi6+HGsD0Jk1YIojDQEdc9nQnqeJ1TuEBU+QbHmBykNDIrE525PPBzt+AeS
	9MBJfz3t+ILqv9qynxKgSlLl9wMtJeStQv6seXjiWD3Mv1KJD058DFs0GOjmZVbSdPp66u
	MpReC/2XRju4O8BDp2WAvi6vkY2D+5Z/ACCQOhL3Y4VFOEX5lr7jvBNoHlJ8YA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755782980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ6UHeBc4TYS0MVyvj20OtZxtPShZrHBOAEWRaqEkWU=;
	b=eHleXzNJYKy06BSGAiV2zMojorWvaG3upzol4W3wXXjCY8WOIgfTyZTPhBPcrk7LNu92d6
	KrJQ3Uy1Ndg2bzCA==
Date: Thu, 21 Aug 2025 15:28:10 +0200
Subject: [PATCH v2 3/9] sched/core: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-hrtimer-cleanup-get_time-v2-3-3ae822e5bfbd@linutronix.de>
References: <20250821-hrtimer-cleanup-get_time-v2-0-3ae822e5bfbd@linutronix.de>
In-Reply-To: <20250821-hrtimer-cleanup-get_time-v2-0-3ae822e5bfbd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782975; l=945;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gpXy2GjW3NstgkefEL7nb0bYvGGEsP7NwP6FnKaezKA=;
 b=3JuQ9pzBlUOX66p0yHXqiM2ErjzTIqpIV+LcgLLopIK+gP2xTxN8xgmU17OaAJtWbnghEqJc/
 xqykf3x+QXQBk1hTF2WRPA7iHccdbeCOMjhBsWTQgh5q8cTHhnshf+Z
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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


