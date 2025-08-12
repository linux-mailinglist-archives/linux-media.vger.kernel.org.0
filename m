Return-Path: <linux-media+bounces-39519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41148B21FC2
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 768D13B603C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EAF2DECD6;
	Tue, 12 Aug 2025 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ak0jpxAM"
X-Original-To: linux-media@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0D2DE709;
	Tue, 12 Aug 2025 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754984595; cv=none; b=d1YhwqmaMMXxZxq2YhMT9r+TKH+gR6xlxFMpDdcIB/kiaNpEIO3UoKn/CTfTWRBU//7OrMPnJyYK1EQO7XxsSK0VRGbfx4fNVizRZX5hPe3ayGFfEkeFyaIPNpC967TMRuWy/U6v1RiM3iJn7pKi+80F9w9oWFgR1ewi+Fvwxvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754984595; c=relaxed/simple;
	bh=0A//2Exv4mtissrpUI9DkbYI+FdyOCpS4fL7Ag/lo5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOnd3wUt60aMLDyULj26ikkGcaooiMAYGiVm24oikcJY4W9/JTckxJAnX6oDzJnnvChv+JmNBTaA6YRHCcuaYlvn2rfmewEkEuD4nVe0QBFMmOMsl5NmFIc5Zw1+PMSZ1nvAZc8p+x/4na8QJgv2TInYyB69GaEtawQz7/low6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ak0jpxAM; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MnE2DIPhZPQSmiehfj+YTSIBtI5Zzg3HCPs+hiz8JBw=; b=ak0jpxAMIUrtGsVuw3wZFfdUfz
	t1mnz1beNInoxHY2u3eZREtheVvVjQJw1Ru7Os9rRcD1S1JzWpQnl4XQO93oCh3rhU/W4OXjZ+0Dm
	YO0zQzVjOJZijJYBP8xDGGEE82bkN5kVOhqNlYK92f2L5wLXliKq60UJpBmMzm426M1vAiSLTercT
	YKNs4zLoACoA3Ad000d2VQRNtYK2cFyfg3SlLxOK1d/U4wH5DLgULjo6GQ3QK4g2src5iaDGThFT8
	uBEUjQeTn8Tpq5GIe31uP+Pbd3ZXNbSyfdm009ro3/UpWULud5JFjYwT9bBeDcuqXpPQPY8wEu9Yf
	VHvrhNzg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljf0-0000000FjYr-30Bn;
	Tue, 12 Aug 2025 07:43:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 540293002C5; Tue, 12 Aug 2025 09:43:06 +0200 (CEST)
Date: Tue, 12 Aug 2025 09:43:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/8] hrtimer: Remove hrtimer_clock_base::get_time
Message-ID: <20250812074306.GD4067720@noisy.programming.kicks-ass.net>
References: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>

On Tue, Aug 12, 2025 at 08:08:08AM +0200, Thomas Weiﬂschuh wrote:
> The get_time() callbacks always need to match the bases clockid.
> Instead of maintaining that association twice in hrtimer_bases,
> use a helper.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Thomas Weiﬂschuh (8):
>       posix-timers: Avoid direct access to hrtimer clockbase
>       timers/itimer: Avoid direct access to hrtimer clockbase
>       sched/core: Avoid direct access to hrtimer clockbase
>       lib: test_objpool: Avoid direct access to hrtimer clockbase
>       ALSA: hrtimer: Avoid direct access to hrtimer clockbase
>       media: pwm-ir-tx: Avoid direct access to hrtimer clockbase
>       hrtimer: Use hrtimer_cb_get_time() helper
>       hrtimer: Remove hrtimer_clock_base::get_time
> 
>  drivers/media/rc/pwm-ir-tx.c   |  5 +----
>  include/linux/hrtimer.h        | 14 +++++---------
>  include/linux/hrtimer_defs.h   |  2 --
>  kernel/sched/core.c            |  2 +-
>  kernel/time/hrtimer.c          | 34 +++++++++++++++++++++++++---------
>  kernel/time/itimer.c           |  3 +--
>  kernel/time/posix-timers.c     |  5 ++---
>  kernel/time/timer_list.c       |  2 --
>  lib/test_objpool.c             |  2 +-
>  scripts/gdb/linux/timerlist.py |  2 --
>  sound/core/hrtimer.c           |  2 +-
>  11 files changed, 37 insertions(+), 36 deletions(-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

