Return-Path: <linux-media+bounces-39502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4579B21DF8
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA701A28238
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109A12E3706;
	Tue, 12 Aug 2025 06:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h1kB2Xb2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UIqmkJHJ"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68752E3AEF;
	Tue, 12 Aug 2025 06:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978897; cv=none; b=IQER4fMlw+NgEqmpn4EbBMl29WKmZswJ7LKTk/cDzo74aGluAv97ow2mRtD8nmofoa0++enBJkwphyFo0cKPvXrQ5Y4Mr93XikC9H3XA9ifXYvz0dkzqY9hx6lZmeQG6cblLq2iIQ0oiPIKJFj9hIy+1rbwrVOn4Eg0kx5ZlZ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978897; c=relaxed/simple;
	bh=VRKYPUCHOj1o3uk7vZH1eLfdSiAOjbVhE6hy3N92Zj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWEi+iQX8lfo0xmz36541u9UYyqBaLANIeFXFfX7lly+/9MxIomNucrj6mSWWi7e5e+lxwuVmtCEUt5Dx5voleYJJ7hm7/6DvOzWGA3HrWUtagiOCUO8DJ05xxrLuBN0CjqdxBuLyVnhTZVT+mqdPgI9E26vy+LArhWa9RQr+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h1kB2Xb2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UIqmkJHJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754978893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kqr8kmeS74BlHeqTh196jDqSmuVvZJCQ2K9/zwMU41s=;
	b=h1kB2Xb2sT7mvI9FV2ADPzUp3mHBJyq2UXQtySsENZHSrfcEEa2oMalCnIucFOaM0UmEMl
	bB3g9MgYjEE49gmQbrGG6e+uzLI2vne8te4YX5CJTctTJy1J/5dIeOkN2ezYv+tU03XyNL
	eWLG6m+a5TqzJ0f168SqNFZJRUajZTB+t2J5CC6YBxIXfOvI7kJQlT5wIq1EVyv6t8i2Ud
	+UEXOFXc8w4hNBaSh+ZDH+mDNTqF710Wh0LPE/VwiCz0dAjS+JtVDsJlGJgx2F03bkvYeu
	I9jqb6jy9oe5/RT857Q5PoM0P/SWLUldzHT3O/YzasNnTpQ6YDP5vsuIA0IHJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754978893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kqr8kmeS74BlHeqTh196jDqSmuVvZJCQ2K9/zwMU41s=;
	b=UIqmkJHJChJKem0Pz0rGOMgQXFUIt6+3ZFPETIuHK8ATovWs2eBOPLGLXC/zJkJEfkMw4/
	rrP+0SzS56/S/tAg==
Date: Tue, 12 Aug 2025 08:08:13 +0200
Subject: [PATCH 5/8] ALSA: hrtimer: Avoid direct access to hrtimer
 clockbase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-hrtimer-cleanup-get_time-v1-5-b962cd9d9385@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754978890; l=887;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VRKYPUCHOj1o3uk7vZH1eLfdSiAOjbVhE6hy3N92Zj4=;
 b=DIUjYMVo+Dk4K6NT/EE25eInyR21nhdIAp6af0VYj9qalUUh1Sib1zZEgo3By6etxDOe/EphY
 26HEGkqNlIGCGfp0Ux/R/ru99EPb1DjucpNmzeaMpxAAAWM1mJSgw/9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The field timer->base->get_time is a private implementation detail and
should not be accessed outside of the hrtimer core.

Switch to the equivalent helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 sound/core/hrtimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/hrtimer.c b/sound/core/hrtimer.c
index c364bd126ac8b311e3ce899e226ff9fd82c4485f..2d5f4d47071f79d7db24c8f004f0f4154808fdd8 100644
--- a/sound/core/hrtimer.c
+++ b/sound/core/hrtimer.c
@@ -44,7 +44,7 @@ static enum hrtimer_restart snd_hrtimer_callback(struct hrtimer *hrt)
 	}
 
 	/* calculate the drift */
-	delta = ktime_sub(hrt->base->get_time(), hrtimer_get_expires(hrt));
+	delta = ktime_sub(hrtimer_cb_get_time(hrt), hrtimer_get_expires(hrt));
 	if (delta > 0)
 		ticks += ktime_divns(delta, ticks * resolution);
 

-- 
2.50.1


