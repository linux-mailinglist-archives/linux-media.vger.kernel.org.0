Return-Path: <linux-media+bounces-39518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3CB21FBF
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7945A680BD0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132492E03F2;
	Tue, 12 Aug 2025 07:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R5BpJJm8"
X-Original-To: linux-media@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023DC2DEA90;
	Tue, 12 Aug 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754984584; cv=none; b=M2XD3nagDBfbQ8jVlI7+Ilv9g64ntNb3zOBnkn4tT3hIYEAoeQFrcTxVjNojh9wVNG+XmZX97k2OUalsXz1/xXSOPTTw6d5wGdCLmp6t7vIVfsA87PDvKUeA/tFBsXl+/UH0KQDdtd527RTEe9dH8krOkvj46B0vVcqYpcqkp04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754984584; c=relaxed/simple;
	bh=XuudU9Ut/rVqcvvSE0KR5roBjHUmIGtceSLksVXDWrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiTmBy7sinkhpiYiqFOdP/EFFfxrPW91iO/590dhQ3vffqregPa+iJscqRZGsubwo3btNkrxjFCT2RESDIzR7rTR3BjH/d2PHVU7H4spq1DdTEoF7eSo3EDh2jqtO0CsOcOEyQmXg9RYbQwfut1D9PyG9RK1B9MaZKZnwWIfTEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R5BpJJm8; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pRjC9shHMyqHQbJMoHIYvO4XEWMGERwA2pE61iqgDIM=; b=R5BpJJm87tPddpxrOx/yjRIH2a
	qgqjrz/o3GGfX3bVjsixGaAWeiVyUrLenI70nW8ioHf2airsBbaoAM0x7ad995jTuHD10Csbqjrjw
	+6VCj8opZqAF+Itoo3QkhwCa0Ggq58Rv/tTb3JJC3T/k7U2xeNp4RZtGIvR75QT9xbVkjIYFxTw2n
	TWL9e4bBMxGb9BaiphnnCHHPTiavCI0ot+/VfJN07tGpgWrec8aPGO9Lll5rExvfEfx9Llujw76/Y
	5bgcokK/50ueGojJgJOojTaFULyc3d5PgqbtDkWtdwcbby7M74gmMACpE1w4uPlapjBWtdZa6CRZu
	D05ZeI+Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljeh-0000000FjYW-3OOT;
	Tue, 12 Aug 2025 07:42:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C8FA33002C5; Tue, 12 Aug 2025 09:42:46 +0200 (CEST)
Date: Tue, 12 Aug 2025 09:42:46 +0200
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
Subject: Re: [PATCH 8/8] hrtimer: Remove hrtimer_clock_base::get_time
Message-ID: <20250812074246.GC4067720@noisy.programming.kicks-ass.net>
References: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
 <20250812-hrtimer-cleanup-get_time-v1-8-b962cd9d9385@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812-hrtimer-cleanup-get_time-v1-8-b962cd9d9385@linutronix.de>

On Tue, Aug 12, 2025 at 08:08:16AM +0200, Thomas Weißschuh wrote:

> @@ -76,42 +77,34 @@ DEFINE_PER_CPU(struct hrtimer_cpu_base, hrtimer_bases) =
>  		{
>  			.index = HRTIMER_BASE_MONOTONIC,
>  			.clockid = CLOCK_MONOTONIC,
> -			.get_time = &ktime_get,
>  		},
>  		{
>  			.index = HRTIMER_BASE_REALTIME,
>  			.clockid = CLOCK_REALTIME,
> -			.get_time = &ktime_get_real,
>  		},
>  		{
>  			.index = HRTIMER_BASE_BOOTTIME,
>  			.clockid = CLOCK_BOOTTIME,
> -			.get_time = &ktime_get_boottime,
>  		},
>  		{
>  			.index = HRTIMER_BASE_TAI,
>  			.clockid = CLOCK_TAI,
> -			.get_time = &ktime_get_clocktai,
>  		},
>  		{
>  			.index = HRTIMER_BASE_MONOTONIC_SOFT,
>  			.clockid = CLOCK_MONOTONIC,
> -			.get_time = &ktime_get,
>  		},
>  		{
>  			.index = HRTIMER_BASE_REALTIME_SOFT,
>  			.clockid = CLOCK_REALTIME,
> -			.get_time = &ktime_get_real,
>  		},
>  		{
>  			.index = HRTIMER_BASE_BOOTTIME_SOFT,
>  			.clockid = CLOCK_BOOTTIME,
> -			.get_time = &ktime_get_boottime,
>  		},
>  		{
>  			.index = HRTIMER_BASE_TAI_SOFT,
>  			.clockid = CLOCK_TAI,
> -			.get_time = &ktime_get_clocktai,
>  		},
>  	},
>  	.csd = CSD_INIT(retrigger_next_event, NULL)
> @@ -1253,7 +1246,7 @@ static int __hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
>  	remove_hrtimer(timer, base, true, force_local);
>  
>  	if (mode & HRTIMER_MODE_REL)
> -		tim = ktime_add_safe(tim, base->get_time());
> +		tim = ktime_add_safe(tim, __hrtimer_cb_get_time(base->clockid));
>  
>  	tim = hrtimer_update_lowres(timer, tim, mode);
>  
> @@ -1588,6 +1581,29 @@ static inline int hrtimer_clockid_to_base(clockid_t clock_id)
>  	}
>  }
>  
> +static ktime_t __hrtimer_cb_get_time(clockid_t clock_id)
> +{
> +	switch (clock_id) {
> +	case CLOCK_REALTIME:
> +		return ktime_get_real();
> +	case CLOCK_MONOTONIC:
> +		return ktime_get();
> +	case CLOCK_BOOTTIME:
> +		return ktime_get_boottime();
> +	case CLOCK_TAI:
> +		return ktime_get_clocktai();

It would've been nice if these had the same order as the other array.

> +	default:
> +		WARN(1, "Invalid clockid %d. Using MONOTONIC\n", clock_id);
> +		return ktime_get();
> +	}
> +}

