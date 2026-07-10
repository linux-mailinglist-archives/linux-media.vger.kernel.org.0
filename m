Return-Path: <linux-media+bounces-67315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rW6EBp1NUWp9CAMAu9opvQ
	(envelope-from <linux-media+bounces-67315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:53:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3A273DF4A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:53:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=DaVnCHl5;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67315-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67315-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 846CA301B91E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 19:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEA638F233;
	Fri, 10 Jul 2026 19:52:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD07733A6E9;
	Fri, 10 Jul 2026 19:52:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713177; cv=none; b=Ep0dCG381QJrBCwUhuo0GGz1e3RbL31BZucuuaPmB6Ha611ptjKNZTbtVtkmUzAQ2DWcC9FWBasaWPSYMaczcQJ01rtTDMU0wnpGspYoGGVLflXeeHcxyrwaBGfBRJ23tfhVJ5+abz3K2w6e1FO77xl076xcOJ2dcjxvXnwHJpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713177; c=relaxed/simple;
	bh=S9YhyzrjkkF5liSWiD7srbFLm8qZPLCAg9kt5XGj8OE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jr55SYQGCfQhOlyjdbyURxhg+MwzqRIgs9LLD/do/2MCCqpFSyRS6zE9hxObOMfzR8WjwINqjsvSAnR013jTPXYWD/7EC7fUQ0O/d8HJ1HD6RJwFcxGTUvL0BhWm+43lktcP8x8gBXvHxkXbvlGhM+s+w/P2Tzhnxie6t9ZENd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DaVnCHl5; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 01086415B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783713176; bh=xVNyZNNKTFKleXI0EcCEPDI7RrOVX51P0/lKKUicYAA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DaVnCHl5fBGdTFxB0b7V7lD3W8ZSquhx2DNNh5UUczvzkv1ix9Y1Hoae7HdlXMv8c
	 aytDPfDMsQZ7IlA88ahgbZedqs047XdzteKks+ocTbL2UUzle/s8DZdFZbzVKTYWDx
	 MFBvKyLseQI2Z/+nwEh0p/6ztVshTegOriwZ+W7JcF1etuKqqWXkVPqwhMIguKJA4W
	 Ukhc0fiieL5iGfJAXw4kxG+uzGIua1RisuZCbfi+/fs2SG2PzIMqyMtm/qI5QPDRon
	 /W2EGYzdzfM8yhQTE+xyp2wJxCsXme9jQzXRH3ddY8frK/ES5VJvyO6E8UkWQoSWJq
	 QDusPwE/+s4RA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 01086415B3;
	Fri, 10 Jul 2026 19:52:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Clinton Phillips
 <clintdotphillips@gmail.com>, Daniel Lundberg Pedersen <dlp@qtec.com>,
 Hans
 Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Petr Vorel <pvorel@suse.cz>, Randy Dunlap
 <rdunlap@infradead.org>, Rito Rhymes <rito@ritovision.com>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] docs: custom.css: don't limit randering to old 800px
 monitors
In-Reply-To: <20260710211953.2a3dbfa9@foz.lan>
References: <1950557405f1150acb1de50de1801f2413223b87.1783673996.git.mchehab+huawei@kernel.org>
 <87fr1qn9us.fsf@trenco.lwn.net> <20260710211953.2a3dbfa9@foz.lan>
Date: Fri, 10 Jul 2026 13:52:55 -0600
Message-ID: <87a4ryk4fc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67315-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:clintdotphillips@gmail.com,m:dlp@qtec.com,m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:pvorel@suse.cz,m:rdunlap@infradead.org,m:rito@ritovision.com,m:skhan@linuxfoundation.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,qtec.com,kernel.org,suse.cz,infradead.org,ritovision.com,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A3A273DF4A

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> On Fri, 10 Jul 2026 09:27:23 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
>
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>> 
>> > Right now, base.css style imposes a maximum limit of 800 horizontal
>> > pixels to be compatible with very old SVGA monitors.
>> >
>> > Remove such artificial limit, letting the output to be adjusted to
>> > the browser windows size.
>> >
>> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> > ---
>> >  Documentation/sphinx-static/custom.css | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
>> > index 5aa0a1ed9864..1055db7dc1dd 100644
>> > --- a/Documentation/sphinx-static/custom.css
>> > +++ b/Documentation/sphinx-static/custom.css
>> > @@ -3,6 +3,8 @@
>> >   * CSS tweaks for the Alabaster theme
>> >   */
>> >  
>> > +div.body {  max-width: none; }
>> > +  
>> 
>> 800px is clearly a dumb limit, I have no problem changing that.  Going
>> to arbitrary width doesn't seem good for readability, though.  What do
>> you think about, instead, setting a limit in a resolution-independent
>> say, to (say) 60em?
>
> 60em also seems too small, considering the size of tables we have on
> media. Some tables have one column for each bit, plus one or two other
> columns, so the table would easily have up to 34 columns. After adding
> long fourcc codes there and V4L macro names, it can easily be very big,
> in terms of "em" measures.

I did say "say" :)  I don't feel the need to argue too much about the
exact value.  I do believe, though, that excessively wide columns are
not good human factors in general.

> If you don't want to let it become too big(*), then perhaps it could
> be something like:
>
> 	div.body {  max-width: 80%; }

I like that even less...I tend to use relatively narrow browser windows
so that I can fit more of them on the screen...it shouldn't waste that
space unnecessarily.

> (*) personally, I don't see any issues on it. My monitor's ratio is
>     32/9. Quite the opposite, with such ultra-wide screen, I don't like
>     sites that have fixed max-width limits, as they end limiting my
>     personal taste for no good reason.

Well, I won't fight about it (too much :).  I definitely agree that the
800px value makes little sense.

jon

