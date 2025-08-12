Return-Path: <linux-media+bounces-39521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2602B21FD9
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B8FF4E496C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97F22DFA46;
	Tue, 12 Aug 2025 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c+BCn4Cw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3R9XWM/S"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB162DEA60;
	Tue, 12 Aug 2025 07:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985070; cv=none; b=qBww8zRjh4f1kxM6VRV8n8YOl97otsaTvjwEA2xGQc85IoFUB4AjWHTvNivM5yQXGNRCy5sdE7+3TJpwtGq46Up3ZjQSgPEBpNByZBYcIEcdrYtXHAIt3iDbsAWmdXcvVT3QkKzfPQzlz8O1eQ8V2qd5hRgep76RbOEADRVpf0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985070; c=relaxed/simple;
	bh=TuHQsYMnoJnPIYD5ZnboAkE0RTxkAU5y9XIRKBO5nYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mS57RXAPu6Q0dnjyCJzebgqZ0WLChjtIEkPOtPV7wEX9INYRH0kuAPrhcKJ+ZLtHBdNrMTPOxZ1eWOrMd3O0gDadY8c9RSe1k19JGq82Rqt0TW9uuCOxe/zOs/NGdmAlDlcN23PuSg+dDctmu/FKGTK+SQCKE5buV3Zg+5LfIw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c+BCn4Cw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3R9XWM/S; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 12 Aug 2025 09:51:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754985066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EyI6sWCh69MK7OvukK32iLnxTgqFOYwNwYwHVU0738Q=;
	b=c+BCn4Cw/fqbmaKgYNzuS6CJM6phzW9foZYmngHw99AYefJs6ZWcQODkt0SaojrAZXUPE4
	rcbwnqqo6s38z8UIxVJm9hOcBIoOeNY+OZzVDDAP6llDydyw27kgwsOQNdR4l2k00VUTf7
	clgj83Yau2uPVOWXVe1Q7VnqXMhbCrcI1aVJiFy3J791430RaRQt+Y3swAawawUZhTeSbk
	Vz90M8Dv6tG62iZ5krrp/JrxUf6uqbf63X4yKjHwv63J5esE2e3FIaVHEgwc4dcmUipvT2
	tMlBfnZIyKok1bh+v23qXDGL2uzxUcK9vAW1btPGUfXbpSYoe9B4xzg78pAuog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754985066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EyI6sWCh69MK7OvukK32iLnxTgqFOYwNwYwHVU0738Q=;
	b=3R9XWM/SdceMuPVmHPKfIZ852zDntpMOx9mhOLIfFcgWR788LrDXSIU6pLBIDqFuSuZKmg
	nbqChMHV2kg+SCCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matt Wu <wuqiang.matt@bytedance.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 8/8] hrtimer: Remove hrtimer_clock_base::get_time
Message-ID: <20250812094740-68fe99d9-25b0-42cc-bdd0-188bb956a798@linutronix.de>
References: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
 <20250812-hrtimer-cleanup-get_time-v1-8-b962cd9d9385@linutronix.de>
 <20250812074246.GC4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812074246.GC4067720@noisy.programming.kicks-ass.net>

On Tue, Aug 12, 2025 at 09:42:46AM +0200, Peter Zijlstra wrote:
> On Tue, Aug 12, 2025 at 08:08:16AM +0200, Thomas Weißschuh wrote:
> 
> > @@ -76,42 +77,34 @@ DEFINE_PER_CPU(struct hrtimer_cpu_base, hrtimer_bases) =
> >  		{
> >  			.index = HRTIMER_BASE_MONOTONIC,
> >  			.clockid = CLOCK_MONOTONIC,
> > -			.get_time = &ktime_get,
> >  		},
> >  		{
> >  			.index = HRTIMER_BASE_REALTIME,
> >  			.clockid = CLOCK_REALTIME,
> > -			.get_time = &ktime_get_real,
> >  		},
> >  		{
> >  			.index = HRTIMER_BASE_BOOTTIME,
> >  			.clockid = CLOCK_BOOTTIME,
> > -			.get_time = &ktime_get_boottime,
> >  		},
> >  		{
> >  			.index = HRTIMER_BASE_TAI,
> >  			.clockid = CLOCK_TAI,
> > -			.get_time = &ktime_get_clocktai,
> >  		},
> >  		{
> >  			.index = HRTIMER_BASE_MONOTONIC_SOFT,
> >  			.clockid = CLOCK_MONOTONIC,
> > -			.get_time = &ktime_get,
> >  		},
> >  		{
> >  			.index = HRTIMER_BASE_REALTIME_SOFT,
> >  			.clockid = CLOCK_REALTIME,
> > -			.get_time = &ktime_get_real,
> >  		},
> >  		{
> >  			.index = HRTIMER_BASE_BOOTTIME_SOFT,
> >  			.clockid = CLOCK_BOOTTIME,
> > -			.get_time = &ktime_get_boottime,
> >  		},
> >  		{
> >  			.index = HRTIMER_BASE_TAI_SOFT,
> >  			.clockid = CLOCK_TAI,
> > -			.get_time = &ktime_get_clocktai,
> >  		},
> >  	},
> >  	.csd = CSD_INIT(retrigger_next_event, NULL)
> > @@ -1253,7 +1246,7 @@ static int __hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
> >  	remove_hrtimer(timer, base, true, force_local);
> >  
> >  	if (mode & HRTIMER_MODE_REL)
> > -		tim = ktime_add_safe(tim, base->get_time());
> > +		tim = ktime_add_safe(tim, __hrtimer_cb_get_time(base->clockid));
> >  
> >  	tim = hrtimer_update_lowres(timer, tim, mode);
> >  
> > @@ -1588,6 +1581,29 @@ static inline int hrtimer_clockid_to_base(clockid_t clock_id)
> >  	}
> >  }
> >  
> > +static ktime_t __hrtimer_cb_get_time(clockid_t clock_id)
> > +{
> > +	switch (clock_id) {
> > +	case CLOCK_REALTIME:
> > +		return ktime_get_real();
> > +	case CLOCK_MONOTONIC:
> > +		return ktime_get();
> > +	case CLOCK_BOOTTIME:
> > +		return ktime_get_boottime();
> > +	case CLOCK_TAI:
> > +		return ktime_get_clocktai();
> 
> It would've been nice if these had the same order as the other array.

Yeah. This is the same order as in hrtimer_clockid_to_base(), right above
this function. I'll add a patch to reorder that one, too.

> 
> > +	default:
> > +		WARN(1, "Invalid clockid %d. Using MONOTONIC\n", clock_id);
> > +		return ktime_get();
> > +	}
> > +}

