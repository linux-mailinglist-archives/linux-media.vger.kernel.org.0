Return-Path: <linux-media+bounces-67314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q8n6KwVGUWrBBgMAu9opvQ
	(envelope-from <linux-media+bounces-67314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:20:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE7673DAEB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:20:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GEJqiMos;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67314-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67314-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9012C3046C40
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 19:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809313839A9;
	Fri, 10 Jul 2026 19:20:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B52C11CA;
	Fri, 10 Jul 2026 19:19:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711201; cv=none; b=OpyWq5NKKPiQhZfJvvkPL71E/GlL7FYkkQQgwhiXcIwKHH2sjXmMJXR8xqALMyl5GPKlq6NZQ6kvrrMtKGoihTugupGiZ1+TVt40HasTKh02y1bBTd8c5jpWbMuWa/GKWU2vX1jLO1BBf1xGYYuIZ9fHVwQsh9LR9n3mqcG1DUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711201; c=relaxed/simple;
	bh=2rw2PxLGznQEWQfneszCluqe4OqXoypkNdS9ILgvT5w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VD/1RXhLRMykSYf/F/IwvgkCQoVEuOpasaINOZ4PSUie+QKLr2uh5jn96P8MTi6A9ajGCD5ZOp3T/O6QNssrapAjIJBAcY5OIH3bgPM535THtrSFaIixWtLYqoejT4henXWgs1i9ZhNWu5Dw2ibYTcYSNiKtBKC3dnCS7KwHMPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEJqiMos; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E681F000E9;
	Fri, 10 Jul 2026 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783711199;
	bh=7vaDAEzbyRLblqFIJzSExEX+Fr8GhvQNfu9Gwp2NWyw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GEJqiMosDruYqisdW+phxteUPy3iHgILrQMivz5euJ8bS+hUmhdd27d5awf2DrfbK
	 vcxcVEb622u5gqNn7KE5H4SrHa2iAO8oIWYSiKsghMJ6lOq3dRxdxndkQphjIMisye
	 h659COxfNcPvdro1ElOBYvHzSwlHarGtFM23U9j7dQLZl1wAfc3mRlMLJk+5C5Z9yh
	 A0lRv61iPgecL0QQcbl5oJ0GacPMPL/uKju4Z2PSp/LiUxToNRLtGFOF7uhSYEA0bO
	 4LKKBDQekmE1yhMvWNVUQRA1MmLT/m4MCleo28Jg5z6O9fuYVQL2zJccDI4vZnlQGU
	 29n6IpB066iUA==
Date: Fri, 10 Jul 2026 21:19:53 +0200
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
Message-ID: <20260710211953.2a3dbfa9@foz.lan>
In-Reply-To: <87fr1qn9us.fsf@trenco.lwn.net>
References: <1950557405f1150acb1de50de1801f2413223b87.1783673996.git.mchehab+huawei@kernel.org>
	<87fr1qn9us.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67314-lists,linux-media=lfdr.de,huawei];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:clintdotphillips@gmail.com,m:dlp@qtec.com,m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:pvorel@suse.cz,m:rdunlap@infradead.org,m:rito@ritovision.com,m:skhan@linuxfoundation.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,qtec.com,kernel.org,suse.cz,infradead.org,ritovision.com,linuxfoundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FE7673DAEB

On Fri, 10 Jul 2026 09:27:23 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Right now, base.css style imposes a maximum limit of 800 horizontal
> > pixels to be compatible with very old SVGA monitors.
> >
> > Remove such artificial limit, letting the output to be adjusted to
> > the browser windows size.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/sphinx-static/custom.css | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> > index 5aa0a1ed9864..1055db7dc1dd 100644
> > --- a/Documentation/sphinx-static/custom.css
> > +++ b/Documentation/sphinx-static/custom.css
> > @@ -3,6 +3,8 @@
> >   * CSS tweaks for the Alabaster theme
> >   */
> >  
> > +div.body {  max-width: none; }
> > +  
> 
> 800px is clearly a dumb limit, I have no problem changing that.  Going
> to arbitrary width doesn't seem good for readability, though.  What do
> you think about, instead, setting a limit in a resolution-independent
> say, to (say) 60em?

60em also seems too small, considering the size of tables we have on
media. Some tables have one column for each bit, plus one or two other
columns, so the table would easily have up to 34 columns. After adding
long fourcc codes there and V4L macro names, it can easily be very big,
in terms of "em" measures.

If you don't want to let it become too big(*), then perhaps it could
be something like:

	div.body {  max-width: 80%; }

(*) personally, I don't see any issues on it. My monitor's ratio is
    32/9. Quite the opposite, with such ultra-wide screen, I don't like
    sites that have fixed max-width limits, as they end limiting my
    personal taste for no good reason.

Thanks,
Mauro

