Return-Path: <linux-media+bounces-27261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FCBA4AAB0
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 12:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2060F18992AE
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 11:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FB11DE881;
	Sat,  1 Mar 2025 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sijftE7s"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21DE1C5D40;
	Sat,  1 Mar 2025 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740829319; cv=none; b=R8vN8R6znQnoOi9qgghLyBUdJ9HAZPJnuwULSVmvKxd+sp8rGYp3OMsLvMbgTDDLV4sLg6IoXDYsydzTx6X++Vvj65TPDnv2Bue0Gfk0FqSTtF/KqDNSo2A5k7lNwwVZS2Umlhah/IwROtBOM42m+hEGZowEFNPsqPmudXWjuoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740829319; c=relaxed/simple;
	bh=jP7i8EhtTmiP4K0NJmZjXXlHvGIOyh0IDiAXjKJ3vWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CS240yRsPzI+qtQHaZ2dtglCsJ5zA1wGS3wUhjBvAcYXR9abutEvHu57JWwWocIfGo+IXKgRs/lLzSpnOQsznJpLRAOx1miyBRk72d5PuFqSGXep93G8515+Re8Sx7PUD2Aoygu3Cr8la/HrBQvWSnO561nfpOH8RVrDfRUh6Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sijftE7s; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id oL54tXbKXfIwSoL58tBTRu; Sat, 01 Mar 2025 12:32:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740828763;
	bh=kF+JmnmWEiXFKVYF48g4gqnqY3PNBaqivGj7uEXTqjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=sijftE7skR2XXW93IzejiQEjIf6j3bZOOuIfOzFNxkJk00z852jVrEJlxhc9Xlijp
	 TdG5ozCCQElD/YyGrXfsmO+pbWIwhsi6XXJPdQvPNPOyX1d0fsPys98UKZekt3/aPX
	 wLse4WGD63nYRqyKBt0dJUbrt/mzlyoMhb8zWH9hCZYHQQ0DtxcYYL3r60ZcL/nPQj
	 A2ISimlk9d7CY+Uh42g43BFR8/edYcw1hAZ+5hiQM2FcKcOIXDLHpHWwl+XGA6KX89
	 WyTv6JMYlNnKl9H4O0MCBvamko6qypWBWZ4ve4Bx2xXRZcMOqbQMvPulEiBNbBTpxa
	 IS29Qxv0Ksq+Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 01 Mar 2025 12:32:43 +0100
X-ME-IP: 90.11.132.44
Message-ID: <cff4d412-abbf-44b5-9705-ba14dff7d5d0@wanadoo.fr>
Date: Sat, 1 Mar 2025 12:32:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: cec: avoid wraparound in timer interval
 calculation
To: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20250301111053.2661-1-v.shevtsov@mt-integration.ru>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250301111053.2661-1-v.shevtsov@mt-integration.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/03/2025 à 12:09, Vitaliy Shevtsov a écrit :
> [Why]
> The timer function code may have an integer wraparound issue. Since both
> pin->tx_custom_low_usecs and pin->tx_custom_high_usecs can be set to up to
> 9999999 from the user space via cec_pin_error_inj_parse_line(), this may
> cause usecs to be overflowed when adap->monitor_pin_cnt is zero and usecs
> is multiplied by 1000.
> 
> [How]
> Fix this by casting usecs to u64 when it is being converted from
> microseconds to nanoseconds.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace.
> 
> Fixes: 865463fc03ed ("media: cec-pin: add error injection support")
> Signed-off-by: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
> ---
>   drivers/media/cec/core/cec-pin.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
> index a70451d99ebc..f15ed5c67a65 100644
> --- a/drivers/media/cec/core/cec-pin.c
> +++ b/drivers/media/cec/core/cec-pin.c
> @@ -1021,7 +1021,7 @@ static enum hrtimer_restart cec_pin_timer(struct hrtimer *timer)
>   		pin->wait_usecs = 0;
>   		pin->timer_ts = ktime_add_us(ts, usecs);
>   		hrtimer_forward_now(timer,
> -				ns_to_ktime(usecs * 1000));
> +				ns_to_ktime((u64)usecs * 1000));

Or maybe us_to_ktime() to be less verbose?

CJ

>   		return HRTIMER_RESTART;
>   	}
>   	pin->wait_usecs = usecs - 100;


