Return-Path: <linux-media+bounces-27288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA37A4AE06
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 22:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A4E3B28A8
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 21:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342B81E7660;
	Sat,  1 Mar 2025 21:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="LW/zRCI+"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF681C5D77;
	Sat,  1 Mar 2025 21:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740864552; cv=none; b=ZldefX/NjuVr+SvgJUHPnv9vUwGzCkkNX0PrlWXqCgRFmQeLobtiH0xR98TDMo0ThqocsobmRVYdQM1p4niq9ZliNbQGxNUkrZmqkG6t0nwvDki5Vwk97UXnAUxRmKBfNBJZaBj+9D4GVumXnHAh7Y3NhZ+EPIqA9E0mcfdBnds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740864552; c=relaxed/simple;
	bh=wFgpVcZMA4A8ClRtG/vzZVjhAkeeOQo5hLUQI3mB5pk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WvcM4vHrMX2YOnkwClcGg4xChj2+MJB2ZwHPf/yiOb3tfx4Si6FM60aKnLB5HC7vps4WvPx5alTP1jBDN/dGge2ipnQI++DxAxuvJN81cFHX8J5k7fm86BexX/ch5LF4QvMpfpVuD20wbdefKojSVRKxM4z1+SoADZkjTnrdzt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=LW/zRCI+; arc=none smtp.client-ip=81.200.124.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id 5764EC0003;
	Sun,  2 Mar 2025 00:29:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 5764EC0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1740864545; bh=un2XxHMkLbWAbgAQ+YeQnD9PaPLgmGvd7W1AjDGV6bw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=LW/zRCI+aMORVpjUySsaQ9gur+lP7aOyWYKMPDCJ2M0AK1cFGKBwiblqGblZbBYNS
	 pFFLrEqy91i/QPj+Ryr1jWmZFGHxI6qMlhXvHGCRQ8IwcnYOahKpDOwdoP2yVWW3Vh
	 J6coptL9HUJcBfV/Wr5hW6o08ma44qtUrBthkpm65IIGjeotFDWGfICQILaFF1AOhd
	 tfw6LT8uERXS8EL2cHZagjxTwHTY1LaRUri1dq+S5srU4cwccrq2Od548V63aBhYxW
	 HisluPnNiV1QmaGRV61YfCUSFJADMmeevCnvEwuMyqZ3E6WdT8GLT9cLt7FsPHJIc3
	 kRb3xuRJydhCg==
Received: from ksmg01.maxima.ru (mail.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru", Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Sun,  2 Mar 2025 00:29:05 +0300 (MSK)
Received: from localhost (5.1.51.90) by mmail-p-exch01.mt.ru (81.200.124.61)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Sun, 2 Mar 2025
 00:29:04 +0300
Date: Sun, 2 Mar 2025 02:28:06 +0500
From: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: Re: [PATCH] media: cec: avoid wraparound in timer interval
 calculation
Message-ID: <20250302022806.e66f4f2903748b9bc63289c2@mt-integration.ru>
In-Reply-To: <cff4d412-abbf-44b5-9705-ba14dff7d5d0@wanadoo.fr>
References: <20250301111053.2661-1-v.shevtsov@mt-integration.ru>
	<cff4d412-abbf-44b5-9705-ba14dff7d5d0@wanadoo.fr>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64--netbsd)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch01.mt.ru
 (81.200.124.61)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: v.shevtsov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {rep_avail}, {Prob_CN_TRASH_MAILERS}, {Tracking_from_domain_doesnt_match_to}, ksmg01.maxima.ru:7.1.1;127.0.0.199:7.1.2;81.200.124.61:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;mt-integration.ru:7.1.1, FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 191402 [Mar 01 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 40
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/03/01 18:37:00 #27521468
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

On Sat, 1 Mar 2025 12:32:30 +0100, Christophe JAILLET wrote:

> Le 01/03/2025 à 12:09, Vitaliy Shevtsov a écrit :
> > [Why]
> > The timer function code may have an integer wraparound issue. Since both
> > pin->tx_custom_low_usecs and pin->tx_custom_high_usecs can be set to up to
> > 9999999 from the user space via cec_pin_error_inj_parse_line(), this may
> > cause usecs to be overflowed when adap->monitor_pin_cnt is zero and usecs
> > is multiplied by 1000.
> > 
> > [How]
> > Fix this by casting usecs to u64 when it is being converted from
> > microseconds to nanoseconds.
> > 
> > Found by Linux Verification Center (linuxtesting.org) with Svace.
> > 
> > Fixes: 865463fc03ed ("media: cec-pin: add error injection support")
> > Signed-off-by: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
> > ---
> >   drivers/media/cec/core/cec-pin.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
> > index a70451d99ebc..f15ed5c67a65 100644
> > --- a/drivers/media/cec/core/cec-pin.c
> > +++ b/drivers/media/cec/core/cec-pin.c
> > @@ -1021,7 +1021,7 @@ static enum hrtimer_restart cec_pin_timer(struct hrtimer *timer)
> >   		pin->wait_usecs = 0;
> >   		pin->timer_ts = ktime_add_us(ts, usecs);
> >   		hrtimer_forward_now(timer,
> > -				ns_to_ktime(usecs * 1000));
> > +				ns_to_ktime((u64)usecs * 1000));
> 
> Or maybe us_to_ktime() to be less verbose?
> 
> CJ
> 

That makes sense but let me check first. I will send a new one soon.

> >   		return HRTIMER_RESTART;
> >   	}
> >   	pin->wait_usecs = usecs - 100;
> 


-- 
Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>

