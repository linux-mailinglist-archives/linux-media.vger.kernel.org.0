Return-Path: <linux-media+bounces-39580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5A6B22653
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 14:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB88C1B63418
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E552EF64F;
	Tue, 12 Aug 2025 12:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="hvey+1ge"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24B2C21D7;
	Tue, 12 Aug 2025 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000430; cv=none; b=ovIpEwBG4rSf5wjkWfSgPubng/A97CPJ3U/AhTrxFPb+rmVIRQfNgsDAqiHQSjzqnmCLZj7TNliZg3M4A1XkEPDVDND1doBbp3lMxaqOM0UVBwjzIPWtKXQIexjaqZ5SSTmUykoSVrfltJfPgLmX6WSM/h3h1lrJW0Ogai+HVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000430; c=relaxed/simple;
	bh=hDryeNe10Owcz/z22DracgjAtkgAx9mmmIC9ti6DPNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUjh8Uj262jxtAWsXBjVNi5fUb8ieotA4zmKbR7Sl6vg/jMUSf0G378dxxye3kZHMcXmKzqO3Oh7TpcXq8Vgd4T6ELiBRYKTay+BbGhV3w0AnpIcQcXOGgL3dF3MYalkzdCvQ48gA7Kz/RncCXZIcFaKdRaYegqYI4W87evi+YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=hvey+1ge; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1755000418; bh=hDryeNe10Owcz/z22DracgjAtkgAx9mmmIC9ti6DPNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvey+1geXvqlzBdxVqViE81tB6F6NyIMpVIkpU722theLxblUj6uAnKFYecaaEtHs
	 e0LYd1zua+pgnvycAWfGWopTMf+bDxo8Km907pBQjzi9txG/ljBlbf+vHO4doZGk9w
	 lWbxcps5vTPvkeRPtF/W6uWRmDWlZ2WWZmmN/3gIrmb3GTmJnQx7dbGyH6MVe5UWH7
	 iNpyNhAzdGCV3NA6sPR4TCc/896mmYYdfMXWZaJPrkODYb8ShesfobqOr2rmtsJvM1
	 7fhfXydvy7YPC3n5e6PxgMYlXSIjCawT1h84zNtSuEKnY1+flqT8N9EQs/ieSszowa
	 ijD+DRjdwg+Eg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 662D81000D4; Tue, 12 Aug 2025 13:06:58 +0100 (BST)
Date: Tue, 12 Aug 2025 13:06:58 +0100
From: Sean Young <sean@mess.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 6/8] media: pwm-ir-tx: Avoid direct access to hrtimer
 clockbase
Message-ID: <aJsuYlRDgmpdQ_rK@gofer.mess.org>
References: <20250812-hrtimer-cleanup-get_time-v1-0-b962cd9d9385@linutronix.de>
 <20250812-hrtimer-cleanup-get_time-v1-6-b962cd9d9385@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812-hrtimer-cleanup-get_time-v1-6-b962cd9d9385@linutronix.de>

On Tue, Aug 12, 2025 at 08:08:14AM +0200, Thomas Weiﬂschuh wrote:
> The field timer->base->get_time is a private implementation detail and
> should not be accessed outside of the hrtimer core.
> 
> Switch to an equivalent higher-level helper.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/media/rc/pwm-ir-tx.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/rc/pwm-ir-tx.c b/drivers/media/rc/pwm-ir-tx.c
> index 84533fdd61aa6ce3c0f8593aaefe5919fd05c7f9..047472dc9244afe0e56e505be20f36fd7d9c449a 100644
> --- a/drivers/media/rc/pwm-ir-tx.c
> +++ b/drivers/media/rc/pwm-ir-tx.c
> @@ -117,7 +117,6 @@ static int pwm_ir_tx_atomic(struct rc_dev *dev, unsigned int *txbuf,
>  static enum hrtimer_restart pwm_ir_timer(struct hrtimer *timer)
>  {
>  	struct pwm_ir *pwm_ir = container_of(timer, struct pwm_ir, timer);
> -	ktime_t now;
>  
>  	/*
>  	 * If we happen to hit an odd latency spike, loop through the
> @@ -139,9 +138,7 @@ static enum hrtimer_restart pwm_ir_timer(struct hrtimer *timer)
>  		hrtimer_add_expires_ns(timer, ns);
>  
>  		pwm_ir->txbuf_index++;
> -
> -		now = timer->base->get_time();
> -	} while (hrtimer_get_expires_tv64(timer) < now);
> +	} while (hrtimer_expires_remaining(timer) > 0);

Acked-by: Sean Young <sean@mess.org>



