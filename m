Return-Path: <linux-media+bounces-39501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9A3B21DF6
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7238A190512B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6FC2E54A6;
	Tue, 12 Aug 2025 06:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CDIzxiaC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x45lZa31"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E1B2E264F;
	Tue, 12 Aug 2025 06:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978896; cv=none; b=P/jayjQI9GSVgY8vAtKfhMM0nysLA6iA2T/Tafd57WChsUztuM+8cu/94SufgsoSdxe5h0b+sp1fjNaYywFmW/Ep09qs4xAH7UjN/bZsDv/JfyXBYWMc1p6HpykRavXXGnYMI6oebbzJh247gZNWxYlLTFGiAp+d37h867/SDoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978896; c=relaxed/simple;
	bh=Xv7KxTjtEi5jAVg89oMqNhQ5UjlFaArcAsRKTAMGvUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdpj8OgBxTanhel7tnF2q2DhRY9mUKfeYmUZbKmSBx0AGYsi5Q/fbTod3lX4XIx2nXYfVV0T1a4vsvTrV6EVhB+4kGJveKr/XpwrcbE2XAsfQk6dXi4GNU3HvPiXNTVaVbdvH/yApwZjPvPq7lxvU6pS8AjTe1BgpDG8d8lDe14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CDIzxiaC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x45lZa31; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754978893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q15Z5Z9Yrtaw3ZAMBw9L5KUC8aL4gmWi8MTTjpGkzXw=;
	b=CDIzxiaCEf+ao46FYkLERcceUjVZCaXlpt21RKLfbTPVFImrfgN0NArwm/ChdJxtSS/iNF
	rFQomYKf5oeTmXTBucrCUFdwEHoEzlkQTrgIcwdPaqNmzOxqJJJunS0kC+/tBX/iFhbj5K
	xxKFdijteRw1/Nrf2cCXH/f+TwK86Br3r8JUTzTsm4AjCafLfwRDdNMOn7O7CKEur1QZfq
	+K+8dLWmo/PC+7h7LjHcR8l89tVJ4Vm+HD2gG3qd3bOoEfw48gGC3KZeg4eYKpAILJprPE
	H/98u23oVFTjmV8A4HJhDGql07PXkh5gjZ/T7mS9jPwxYpwVE3Ra7EyXKfAZgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754978893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q15Z5Z9Yrtaw3ZAMBw9L5KUC8aL4gmWi8MTTjpGkzXw=;
	b=x45lZa31zk/v1QnEJAGHTK45QEWt/iN+ywHr632eu+MQahdOcASD2awpkQSahzC8mmZEke
	1HKBPQ7tX4Q9DJCg==
Date: Tue, 12 Aug 2025 08:08:12 +0200
Subject: [PATCH 4/8] lib: test_objpool: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-hrtimer-cleanup-get_time-v1-4-b962cd9d9385@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754978890; l=840;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Xv7KxTjtEi5jAVg89oMqNhQ5UjlFaArcAsRKTAMGvUI=;
 b=s/k1F9athEdznY1/7XY+BjuKK+B9LsmJOfnQ5Z+93eK1CWBZt+5/V7rSfhJzlS4c0S3lPoc3I
 IHv/uXwRUnXCdyX7aTb4qkzYcxqSiAVp5WmlmLDMczOEcgaQXU+o5DU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/test_objpool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_objpool.c b/lib/test_objpool.c
index 8f688187fa8727e26d2d065c46e789ee15fd55b5..6a34a7582fdbf50b5632043ec19e77c8fd4dad78 100644
--- a/lib/test_objpool.c
+++ b/lib/test_objpool.c
@@ -164,7 +164,7 @@ static enum hrtimer_restart ot_hrtimer_handler(struct hrtimer *hrt)
 	/* do bulk-testings for objects pop/push */
 	item->worker(item, 1);
 
-	hrtimer_forward(hrt, hrt->base->get_time(), item->hrtcycle);
+	hrtimer_forward_now(hrt, item->hrtcycle);
 	return HRTIMER_RESTART;
 }
 

-- 
2.50.1


