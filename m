Return-Path: <linux-media+bounces-39503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8EB21DFB
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14D443B2D6C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F042D3A68;
	Tue, 12 Aug 2025 06:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aqX/wyVW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6BMazsdy"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67132E370F;
	Tue, 12 Aug 2025 06:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978897; cv=none; b=a3nA8E3N/PGIpgF3YWmjgczHb52qHzQ2vWcbf42hKr+XoSW92IyET2x8tpdxq5ZRJXhPY129JSBvKT0Z1cq3Cp5gQdsSoy3bpr7RexOjTPZ3WGgXJsHdKrzSvv9z+oVc5zWfrkoV/rxAaADHBvJCXH5C/TrCJUlpX9exddh4VrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978897; c=relaxed/simple;
	bh=tzlPDbI22bFVZnyx/aUubSg1nyN9LP7Z1nRVUBaVZrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pr33tH++Pc65mFS8KtNGpKlI4GEBKlSHwJcAS/6jd+IEK3lJ/cc4ah8I+7qOS3jE+ne61zQJBNRXKY2kwQ9j2LiG6T0a75Q4liw25R9L6+2doskQDeNlUTg/9mX7lq9ePqwBYK5NhbDJPrTpCFUJNN7Ma5kyy6gP4WKNpp2sqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aqX/wyVW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6BMazsdy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754978894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vaOYSQe8+r4ASI339nLTErW+Fc/xW8X676P1cpWtPUI=;
	b=aqX/wyVWMvyej+XbL6nxV+OMmQBVWeFr8v+c0GlCNErNPTQ+DcTwLCbrVXWmo8Qq5+0j+H
	eGyvqXziywNaj0DUa3Lv6uP5o0nWQk5xrYIj1lvem1RIZufjesFD7Q0Wj0ohYMwyc2Oud3
	Z+/+4fu04z+KwA9mcFwn0NLEcVPR9E9p4Wa89kOyOxLR7HhpUZkQ6NkfTJA1wZYwWhdZ4y
	W3RZmBPZj4vzJqp8spO+TaOu9n9d20dUD9bFHcgBX7HaOiO+H2ZNQgSIH1bv/3ibQa3H1n
	HyB+ZAHhp6XPgqCbfEZvipl+GFHnR5Jmp4zKGkMHMnUVWz3FZRZQGG533YMgrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754978894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vaOYSQe8+r4ASI339nLTErW+Fc/xW8X676P1cpWtPUI=;
	b=6BMazsdyZAQN6IHtOnEl2iW4+56hBjTHd+SOOs6YeA9Pcv89FJ/WQPjgBS6Sc8aM6QxhaD
	1y2ekj/I/jHZjYDw==
Date: Tue, 12 Aug 2025 08:08:14 +0200
Subject: [PATCH 6/8] media: pwm-ir-tx: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-hrtimer-cleanup-get_time-v1-6-b962cd9d9385@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754978890; l=1247;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=tzlPDbI22bFVZnyx/aUubSg1nyN9LP7Z1nRVUBaVZrI=;
 b=c+GawmMcaez6PbPORddUcVnsUEZyD+mp7mJap4RdqRRDGhN6JA4ZZm73rjeuA1LnjMJn0m51V
 aHFBJr4db9lB4NdOB0tLi1c2Lhc4+r+mCfwb1E/6KTuBAbP3/K0CZ4k
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to an equivalent higher-level helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/media/rc/pwm-ir-tx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/rc/pwm-ir-tx.c b/drivers/media/rc/pwm-ir-tx.c
index 84533fdd61aa6ce3c0f8593aaefe5919fd05c7f9..047472dc9244afe0e56e505be20f36fd7d9c449a 100644
--- a/drivers/media/rc/pwm-ir-tx.c
+++ b/drivers/media/rc/pwm-ir-tx.c
@@ -117,7 +117,6 @@ static int pwm_ir_tx_atomic(struct rc_dev *dev, unsigned int *txbuf,
 static enum hrtimer_restart pwm_ir_timer(struct hrtimer *timer)
 {
 	struct pwm_ir *pwm_ir = container_of(timer, struct pwm_ir, timer);
-	ktime_t now;
 
 	/*
 	 * If we happen to hit an odd latency spike, loop through the
@@ -139,9 +138,7 @@ static enum hrtimer_restart pwm_ir_timer(struct hrtimer *timer)
 		hrtimer_add_expires_ns(timer, ns);
 
 		pwm_ir->txbuf_index++;
-
-		now = timer->base->get_time();
-	} while (hrtimer_get_expires_tv64(timer) < now);
+	} while (hrtimer_expires_remaining(timer) > 0);
 
 	return HRTIMER_RESTART;
 }

-- 
2.50.1


