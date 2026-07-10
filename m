Return-Path: <linux-media+bounces-67332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QCRSGRFvUWpyEwMAu9opvQ
	(envelope-from <linux-media+bounces-67332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 00:15:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E335873F72F
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 00:15:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QbcaZMVa;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67332-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67332-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CC1E30417BF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 22:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6613C1992;
	Fri, 10 Jul 2026 22:10:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F896376A1A;
	Fri, 10 Jul 2026 22:10:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721423; cv=none; b=nZu57CcyLgnHBOkOZjr7pbCUvbqaXgOVEClhfWEThuTGTY4xptTZ043JpV+9uiYD1mHK2dhqrt/fpgnn848sDQhue3riclR7zfMM268fcu/Bj3STxf4kQ57T4t/nKEb/tffVOQ/qQD3v1qF+9qQlvpZqkIbYMGqS2ib3CGlMN+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721423; c=relaxed/simple;
	bh=3lMVYBJh9AOOrlIfe42E8crqK1zaWHyg9SuRHBrtcQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7pWX0D0mwkc4dVfpZvVrAoRgoXVdF4AFI99ppoKkUIycaQYemPKlTLxJL3JF7NuZ9wETL4Ic8xtScTh7AtJjTDb3mr9Xpmm8dIjIQyTWFW4XzgkuEbhALTWXGy7+YCyeImhUg+h1kYrrsDZ/sltU5lHjpiXVFcQMeCuqeAHso4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbcaZMVa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E6C1F000E9;
	Fri, 10 Jul 2026 22:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783721421;
	bh=WHmKVrTHqUOu0t0HzhdbiTzgSST566vrKFh+Ipx55oc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QbcaZMVacjeFRPAKBmr6KOPXwIERjDdELg58KQZHknEzj1q9EZf72CXdcIGNGvIOb
	 3hVQOQi7C9wXLGTizfnHGyKL89uCcWTxqT+1qgngXRsO3eRZutIwbo+Rd3D6cgsg8L
	 7lKIks2DA+3aR4gI9VfIQ76YbeYG512cY8VDjAYFaXzdDrAJvQRPyGKa2AI2hFNM9a
	 hQ6VCaEuCZMn8ZsKZV0k0LoxVwAjo67rpm462A/QT070ctYPeB6NEoEFifAZJPiIM+
	 g1h6fiLDOtiBV+N7AHqVhFRnNhDwaFVyUTuq3q6GfFVpxMT4+ZJJoMC0t15ErGvr1+
	 bOsHha1ywnpCQ==
Date: Sat, 11 Jul 2026 00:10:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Clinton Phillips
 <clintdotphillips@gmail.com>, Daniel Lundberg Pedersen <dlp@qtec.com>, Hans
 Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Petr Vorel <pvorel@suse.cz>, Randy Dunlap
 <rdunlap@infradead.org>, Rito Rhymes <rito@ritovision.com>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] docs: custom.css: don't limit randering to old 800px
 monitors
Message-ID: <20260711001015.3cf5d166@foz.lan>
In-Reply-To: <87a4ryk4fc.fsf@trenco.lwn.net>
References: <1950557405f1150acb1de50de1801f2413223b87.1783673996.git.mchehab+huawei@kernel.org>
	<87fr1qn9us.fsf@trenco.lwn.net>
	<20260710211953.2a3dbfa9@foz.lan>
	<87a4ryk4fc.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:clintdotphillips@gmail.com,m:dlp@qtec.com,m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:pvorel@suse.cz,m:rdunlap@infradead.org,m:rito@ritovision.com,m:skhan@linuxfoundation.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67332-lists,linux-media=lfdr.de,huawei];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,qtec.com,kernel.org,suse.cz,infradead.org,ritovision.com,linuxfoundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E335873F72F

On Fri, 10 Jul 2026 13:52:55 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > On Fri, 10 Jul 2026 09:27:23 -0600
> > Jonathan Corbet <corbet@lwn.net> wrote:
> >  
> >> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >>   
> >> > Right now, base.css style imposes a maximum limit of 800 horizontal
> >> > pixels to be compatible with very old SVGA monitors.
> >> >
> >> > Remove such artificial limit, letting the output to be adjusted to
> >> > the browser windows size.
> >> >
> >> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> > ---
> >> >  Documentation/sphinx-static/custom.css | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> >> > index 5aa0a1ed9864..1055db7dc1dd 100644
> >> > --- a/Documentation/sphinx-static/custom.css
> >> > +++ b/Documentation/sphinx-static/custom.css
> >> > @@ -3,6 +3,8 @@
> >> >   * CSS tweaks for the Alabaster theme
> >> >   */
> >> >  
> >> > +div.body {  max-width: none; }
> >> > +    
> >> 
> >> 800px is clearly a dumb limit, I have no problem changing that.  Going
> >> to arbitrary width doesn't seem good for readability, though.  What do
> >> you think about, instead, setting a limit in a resolution-independent
> >> say, to (say) 60em?  
> >
> > 60em also seems too small, considering the size of tables we have on
> > media. Some tables have one column for each bit, plus one or two other
> > columns, so the table would easily have up to 34 columns. After adding
> > long fourcc codes there and V4L macro names, it can easily be very big,
> > in terms of "em" measures.  
> 
> I did say "say" :)  I don't feel the need to argue too much about the
> exact value.  I do believe, though, that excessively wide columns are
> not good human factors in general.

If one gets a big enough "em" to fit the largest tables and ascii artwork,
I'm ok using "em" but one would need to double check what's the bigger
one, which would require some time and someone would need to periodically
review it.

My feeling is that, on media, the bigger tables are the pixformat ones,
but maybe the biggest one is somewhere else.

Most (if not all) artwork fits on 80 columns, but I vaguely remember
some that were bigger (can't remember if they were changed to fit on
80 cols).

Probably a way to define a limit that covers artwork would be to run a script
to get the max column size for .rst files. Not perfect because of indentation,
on codeblocks, but it could work as a hint. Unfortunately, this won't work
for tables using flat-table (which is used on ~235 files - most on media,
but ~20 files elsewhere).

> 
> > If you don't want to let it become too big(*), then perhaps it could
> > be something like:
> >
> > 	div.body {  max-width: 80%; }  
> 
> I like that even less...I tend to use relatively narrow browser windows
> so that I can fit more of them on the screen...it shouldn't waste that
> space unnecessarily.

Agreed.

> > (*) personally, I don't see any issues on it. My monitor's ratio is
> >     32/9. Quite the opposite, with such ultra-wide screen, I don't like
> >     sites that have fixed max-width limits, as they end limiting my
> >     personal taste for no good reason.  
> 
> Well, I won't fight about it (too much :).  I definitely agree that the
> 800px value makes little sense.
> 
> jon



Thanks,
Mauro

