Return-Path: <linux-media+bounces-40589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF5B2FA88
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464D216978A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08977338F44;
	Thu, 21 Aug 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lBfknWVb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eFdHDXbW"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2B3376A4;
	Thu, 21 Aug 2025 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782982; cv=none; b=do6x188ofBcrwJpi/dKPCM03eCMwaMhkqXBg0zvalgaLMF+rrxtlWpQRYGbX1Jz/EEXJg/LYLetgSBAyIie5YU8A93V/yWu2jKTejY6ZG6dPwVXrsIpSQ8b6qtSVip2BBKFkq5sM+PFqMuCXSUBElEa5wpvcG9hX876e+WIfayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782982; c=relaxed/simple;
	bh=lh4GI5/eFBI8OTn1QJ/Btg9LnQHdDy7gu1gwdYWndp8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I0lmAGSEitaAuQFOhPWN+wmlF0eLO67U5lIds1g2AO5aI1ppRqGaDQ2VXfPwIHwjMuEKVDetksxTbBjzXdtqAwji9KTzZutyUMHnfsspMPW/DSI1tiBzuLeOF76pL7Xqjy9lQk6ufLqW4t5n+D80qrtRQQZiQLsPqToSq7AwnDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lBfknWVb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eFdHDXbW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755782978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/22kGxTjt1WwvcoZvYm0bJNx0EMkPzwFbeyf40/sVlo=;
	b=lBfknWVbiLllOft06mMW9dJrAcCa4aTQN2vcpBqK1nn/wNzMgEjNbhCrMWnVIX97s6sQB5
	9FgR3CebjFCEphTsYmgtMBD7Z3LeWjqoLVkOcrSmEQRybtlXzT/s1jTd0dAwXFLEzFTulV
	W8aVbtTiHdypwWgIFM51tFUOOY507X/s7PexDH455Hf12iXwR4tPqQmKMm6FkByBlZFrjp
	d1LJROSWll0hN2mymXErM/rNMdixFHVtA3iSWRFmhCugGGqHo2TgBTJAktfa+gosDM7z2i
	yyc+BnvmoiQljEUtyA0KkqXB5C2HmrvLMMm5RjaFpVvlGrIcHHRT/HuW/gV1Tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755782978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/22kGxTjt1WwvcoZvYm0bJNx0EMkPzwFbeyf40/sVlo=;
	b=eFdHDXbWYZX4kr4QWMEtNTMA1bJ/fYUUlreTQrp+/W1F+7MZjQEr4S27d/OdFlXUuroQ/G
	2j2WR+cFlMb4gFDg==
Subject: [PATCH v2 0/9] hrtimer: Remove hrtimer_clock_base::get_time
Date: Thu, 21 Aug 2025 15:28:07 +0200
Message-Id: <20250821-hrtimer-cleanup-get_time-v2-0-3ae822e5bfbd@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOcep2gC/3WNQQ6CMBBFr0K6dgzUAK0r72GIqe0Ik2Ah00Iwh
 LtbcO3yveS/v4qATBjENVsF40yBBp9AnjJhO+NbBHKJhcxlmddSQceR3shgezR+GqHF+NgNKGO
 1q3VtKlWKNB8ZX7Qc6XuTuKMQB/4cT3Ox219UFfJ/dC4gh6eupHXa6Ysqbz35KfLgaTk7FM22b
 V+dsqK+xAAAAA==
X-Change-ID: 20250728-hrtimer-cleanup-get_time-8ac9d797a685
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Takashi Iwai <tiwai@suse.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782975; l=1774;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lh4GI5/eFBI8OTn1QJ/Btg9LnQHdDy7gu1gwdYWndp8=;
 b=IEkqHTSTeaVThWHHMvcj1X6SuVqEeVfho40mpZjwtWgbknbWPPnuONJBha7nKjoPryqI+qQlx
 x/qodVrzBUkBwB22Hu33ElfpGezuSI9myjtrDgu1L7tzU7JpjFTIGcK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The get_time() callbacks always need to match the bases clockid.
Instead of maintaining that association twice in hrtimer_bases,
use a helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Pick up tags from the mailing list
- Reorder switch-case branches to match hrtimer_bases table
- Link to v1: https://lore.kernel.org/r/20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de

---
Thomas Weißschuh (9):
      posix-timers: Avoid direct access to hrtimer clockbase
      timers/itimer: Avoid direct access to hrtimer clockbase
      sched/core: Avoid direct access to hrtimer clockbase
      lib: test_objpool: Avoid direct access to hrtimer clockbase
      ALSA: hrtimer: Avoid direct access to hrtimer clockbase
      media: pwm-ir-tx: Avoid direct access to hrtimer clockbase
      hrtimer: Use hrtimer_cb_get_time() helper
      hrtimer: Remove hrtimer_clock_base::get_time
      hrtimer: Reorder branches in hrtimer_clockid_to_base()

 drivers/media/rc/pwm-ir-tx.c   |  5 +----
 include/linux/hrtimer.h        | 14 +++++---------
 include/linux/hrtimer_defs.h   |  2 --
 kernel/sched/core.c            |  2 +-
 kernel/time/hrtimer.c          | 38 +++++++++++++++++++++++++++-----------
 kernel/time/itimer.c           |  3 +--
 kernel/time/posix-timers.c     |  5 ++---
 kernel/time/timer_list.c       |  2 --
 lib/test_objpool.c             |  2 +-
 scripts/gdb/linux/timerlist.py |  2 --
 sound/core/hrtimer.c           |  2 +-
 11 files changed, 39 insertions(+), 38 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-hrtimer-cleanup-get_time-8ac9d797a685

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


