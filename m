Return-Path: <linux-media+bounces-67340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Si7vDlj1UWpwKwMAu9opvQ
	(envelope-from <linux-media+bounces-67340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 09:48:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD088740CBD
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 09:48:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=O5aYCdCj;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67340-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67340-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A3833025905
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 07:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0688337B3FE;
	Sat, 11 Jul 2026 07:48:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BA033D4EC;
	Sat, 11 Jul 2026 07:48:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756108; cv=none; b=rylyamzh5gSOoOhwTK2hpSQpaWao/hQNWqSq9xAV8KUiojl0Wrg4J1tA7DsHBjUFCek2K6mobE1hgzgP02gbFsFjKmGjOTfqYHKrGmzqhQmJ9GFZGyCrbWIoYeAwgjc7+h1hzrCckrXzJAjnLbGwJU7QeLSn5yyPwzjaHOtev8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756108; c=relaxed/simple;
	bh=KE+72P2uQcBXBlZZq1zaAkbc+AOsaUB3YGu4yTSMCeU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WT8u2GvNgKs85I3bqV4yH1a4YdBKXFD9yGIfH6qymWuwyIev7vBThjYyMAqIQ6IVZ/OiGQEt9Pl3AATN2W9yrmVUnTW1+sy64QfYAo3VNGKn34r/ozCYsXsxXR2ij5zAWaKHGdm2a2oaRNRNYZfL3laqpaKsHYbOmpj7RFBpoxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5aYCdCj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596EF1F000E9;
	Sat, 11 Jul 2026 07:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783756106;
	bh=tKA7a+fh5KArhGWB9G167Li6VnYyGas0rjAKc2ZtQ3o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=O5aYCdCjrrtAWEu9taLih0uc4+kZVjpLI3Hf4RMRXnYe4CoJJG7AnCqKUo9GGolOF
	 zbYYik8LGprtIheSGCyyeInOU2yfsmN99d7IEopvSZHyQ4zPc2J6WaL61KrskgmsQH
	 uyTRzM24oVieIWxCfMSdPC0LKB3kLWdq2SyBPbXHddFGBk18CBoLz9JPl+HC2bfFaB
	 PXUOaTe703kKBpKGAfRKWWvLE9HoUggGuuAkeXZ5JAJGj26iNI4pCoBZN0Cz25QG/r
	 dAZn2QCqu5BQapCcuX/ZAjpoOvUQ0G0XSKNxyi5pZrMQcKuOiI/IYMjGN83p4KsXoK
	 Jj88YOAJEwdag==
Date: Sat, 11 Jul 2026 09:48:21 +0200
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
Message-ID: <20260711094821.5e262356@foz.lan>
In-Reply-To: <20260711001015.3cf5d166@foz.lan>
References: <1950557405f1150acb1de50de1801f2413223b87.1783673996.git.mchehab+huawei@kernel.org>
	<87fr1qn9us.fsf@trenco.lwn.net>
	<20260710211953.2a3dbfa9@foz.lan>
	<87a4ryk4fc.fsf@trenco.lwn.net>
	<20260711001015.3cf5d166@foz.lan>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:clintdotphillips@gmail.com,m:dlp@qtec.com,m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:pvorel@suse.cz,m:rdunlap@infradead.org,m:rito@ritovision.com,m:skhan@linuxfoundation.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67340-lists,linux-media=lfdr.de,huawei];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD088740CBD

On Sat, 11 Jul 2026 00:10:15 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Fri, 10 Jul 2026 13:52:55 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
> 
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> > 
> > > On Fri, 10 Jul 2026 09:27:23 -0600
> > > Jonathan Corbet <corbet@lwn.net> wrote:
> > >  
> > >> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> > >>   
> > >> > Right now, base.css style imposes a maximum limit of 800 horizontal
> > >> > pixels to be compatible with very old SVGA monitors.
> > >> >
> > >> > Remove such artificial limit, letting the output to be adjusted to
> > >> > the browser windows size.
> > >> >
> > >> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > >> > ---
> > >> >  Documentation/sphinx-static/custom.css | 2 ++
> > >> >  1 file changed, 2 insertions(+)
> > >> >
> > >> > diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> > >> > index 5aa0a1ed9864..1055db7dc1dd 100644
> > >> > --- a/Documentation/sphinx-static/custom.css
> > >> > +++ b/Documentation/sphinx-static/custom.css
> > >> > @@ -3,6 +3,8 @@
> > >> >   * CSS tweaks for the Alabaster theme
> > >> >   */
> > >> >  
> > >> > +div.body {  max-width: none; }
> > >> > +    
> > >> 
> > >> 800px is clearly a dumb limit, I have no problem changing that.  Going
> > >> to arbitrary width doesn't seem good for readability, though.  What do
> > >> you think about, instead, setting a limit in a resolution-independent
> > >> say, to (say) 60em?  
> > >
> > > 60em also seems too small, considering the size of tables we have on
> > > media. Some tables have one column for each bit, plus one or two other
> > > columns, so the table would easily have up to 34 columns. After adding
> > > long fourcc codes there and V4L macro names, it can easily be very big,
> > > in terms of "em" measures.  
> > 
> > I did say "say" :)  I don't feel the need to argue too much about the
> > exact value.  I do believe, though, that excessively wide columns are
> > not good human factors in general.
> 
> If one gets a big enough "em" to fit the largest tables and ascii artwork,
> I'm ok using "em" but one would need to double check what's the bigger
> one, which would require some time and someone would need to periodically
> review it.
> 
> My feeling is that, on media, the bigger tables are the pixformat ones,
> but maybe the biggest one is somewhere else.
> 
> Most (if not all) artwork fits on 80 columns, but I vaguely remember
> some that were bigger (can't remember if they were changed to fit on
> 80 cols).
> 
> Probably a way to define a limit that covers artwork would be to run a script
> to get the max column size for .rst files. Not perfect because of indentation,
> on codeblocks, but it could work as a hint. Unfortunately, this won't work
> for tables using flat-table (which is used on ~235 files - most on media,
> but ~20 files elsewhere).

After sleeping on it, I think that we need something bigger than 100em,
as this is is the checkpatch.pl max columns warning limit. To align with
most pixfmt tables on media, 120em sounds a reasonable limit.

Patch enclosed.


Thanks,
Mauro

[PATCH] docs: custom.css: don't limit randering to old 800px monitors

Right now, base.css style imposes a maximum limit of 800 horizontal
pixels to be compatible with very old SVGA monitors.

This is not enough to display some tables like pixformat ones on
media. Instead, use a more realistic maximum limit.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 2e019c8f8a56..be33d9ed1280 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -3,6 +3,8 @@
  * CSS tweaks for the Alabaster theme
  */
 
+div.body {  max-width: 120em; }
+
 /* Shrink the headers a bit */
 div.body h1 { font-size: 180%; }
 div.body h2 { font-size: 150%; }

