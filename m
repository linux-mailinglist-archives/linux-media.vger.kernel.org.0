Return-Path: <linux-media+bounces-40598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A99B2FA9F
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C21A2601D33
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078AE343D94;
	Thu, 21 Aug 2025 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sbWEZzS9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ej46kqb5"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52DD34165C;
	Thu, 21 Aug 2025 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782987; cv=none; b=s5lFQj/px0K6kVUsorqqfGHiU6iwwe/Jwz4iOfuefz2RWCeuUEAoDzrAunaCxM77gjS0g/W7ztASRbqVvAfg0Uwav64DlPiM+tOdIMuEclcZ/abDfkXe8Wvn7oiUdwhwEW5ks6ZMlUgYCq40Qr0y5EzvjaVrjerQLtImLWswr3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782987; c=relaxed/simple;
	bh=lRNEtqcrtlw74Q5TFa9XsODgun9hFWArZJOwnOWoo2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FjhLpSUkGudlOaPcR4q48N6lrhSzbU55fDpOLB9sXMHfY2606h60QEbnwULvMDLEmUSr7rDSsJxnni4NmAKY/XNqo3Qo8o+TsERDXsemQagMogcVA/y+YuF4FFrFLDoEYssg1n/Bgbg1XGA/9i+Ysp9DuiiQ0oTRWuzHAJ9betY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sbWEZzS9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ej46kqb5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755782983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/IFfXb2Gts/wINwWBJRkteFrwzlStBGHf9GvRYuutbo=;
	b=sbWEZzS9RpijCcTfWGULdNkOaitzT7INtDE+7XhR76hdc3RdH7lQe3J0T+0slwNnrUSJS7
	TDP7BuP8pXIcqbq5n7fxBRfaw2kPQjYbD5lXkh/tdmlUMGCbuVL+KspzwYkfRNigqgURYx
	hNq+qHTkoJysQe2PwIlscKD8js5IUolD2/wYCU0sGmZagCgtQ92/9Kp/TzNVs78vysanYA
	iHCsYcktO58z+mBvDR8egjaXjnCs+t3Pkm7S2V9C6Qq8KV4kooeDooSaJ1HA5nbo8jRqCW
	S2W5r5QkPsO6AK2fho514PoA+zfwrUD++MTZ3U1f/mDA0SqHRdNrplLkfwGvkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755782983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/IFfXb2Gts/wINwWBJRkteFrwzlStBGHf9GvRYuutbo=;
	b=Ej46kqb5WCNAosfV2HN79ixwnaFLactfkbLvZsHJCyzAJ2P1Y24yz0l2D6XhrKcOBjJwFz
	Cn0mdygi2Gc9MGCg==
Date: Thu, 21 Aug 2025 15:28:16 +0200
Subject: [PATCH v2 9/9] hrtimer: Reorder branches in
 hrtimer_clockid_to_base()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-hrtimer-cleanup-get_time-v2-9-3ae822e5bfbd@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782976; l=898;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lRNEtqcrtlw74Q5TFa9XsODgun9hFWArZJOwnOWoo2E=;
 b=vqkNbf2HDc9MrwNYTlgNZcaXjPwKmO8nzmctb1RJqQ7MWtSVWXM+JlSG1p27AZCkXGbENtHUi
 pzFWlcUBNJbA9pAFtazbmHpBdCfoY1IMbm5HzMzCgTDf4tSQdjuFN7Q
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Align the ordering to the one used for hrtimer_bases.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

---
v2: New patch
---
 kernel/time/hrtimer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index fedd1d793f6cdf8923cc8a6707ff793f36b77f26..f383df28c5325919b4d22df383d7fb286ea05874 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1567,10 +1567,10 @@ u64 hrtimer_next_event_without(const struct hrtimer *exclude)
 static inline int hrtimer_clockid_to_base(clockid_t clock_id)
 {
 	switch (clock_id) {
-	case CLOCK_REALTIME:
-		return HRTIMER_BASE_REALTIME;
 	case CLOCK_MONOTONIC:
 		return HRTIMER_BASE_MONOTONIC;
+	case CLOCK_REALTIME:
+		return HRTIMER_BASE_REALTIME;
 	case CLOCK_BOOTTIME:
 		return HRTIMER_BASE_BOOTTIME;
 	case CLOCK_TAI:

-- 
2.50.1


