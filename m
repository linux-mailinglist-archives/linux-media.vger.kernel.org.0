Return-Path: <linux-media+bounces-67603-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kcpwFUP5VmpgDwEAu9opvQ
	(envelope-from <linux-media+bounces-67603-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:06:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAC275A354
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:06:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=google header.b=YhvNqO8J;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67603-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67603-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2160A300FEF1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E21B352021;
	Wed, 15 Jul 2026 03:06:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D40D1A3029
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 03:06:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084796; cv=none; b=frpWPK5tntq3XiqZBg4hc77hu2XurT838stCaCmQFxah00SpeORTgD9D5ufCrOH9Em/JjIfck/sYoiaKwcFexcxbYK8qlU64gVZYJViiaIVB9kI8NAHOMidu9+egP5rwuBR6OQvgVbpDq1veH11AkhUh6bFxx4WSvUdvWzjwE5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084796; c=relaxed/simple;
	bh=MHpk1OfhALXQJApxVYkVQIlOkRwb625SY/m0BiEbrWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuNp+NmXnB6LFKWogK9AiQ+cqq+FjntwJ7EqCHh3qv5H3OqoIrbriJdRaQb/Ytxovt6TPh0j23VndkGhecj9J0j0IZ6QzUoCT37Va5lMu7cmVNXUZmZmpXJWTBWTxsZBJcRvTW17Y+zSfGXSYrtiG43jxG0hhiqvpE0kFdoCPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YhvNqO8J; arc=none smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso8995323a12.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 20:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784084792; x=1784689592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Oah0XDycOtY1xhMJPJ3ymJEXgGFITe2QDZ98tXb9LA=;
        b=YhvNqO8JaYgkRz+dg94catE56rzZXAWslbgn4Tyn8b3NgpkGEVOAGoT4PttuMDLVNo
         Peve9CzOjQecc+0l6j1SCVGi2f0o/wbJt/GGuCcEoFFpcjFP65JvE5KHwW7ftnFXKXM8
         dH3SGcNqlNVJ4I82h7Jt/4EI7f+lJrC40CZwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084792; x=1784689592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Oah0XDycOtY1xhMJPJ3ymJEXgGFITe2QDZ98tXb9LA=;
        b=ME3qHKiZ50Sshi8x7QaZJeLt/hyN/rbv2Pw6nKaXxgH+MQ3st14xf/vj/lHY9hwVmb
         u7rNsj8Qj2GfvaCDGwJRLIcAVKixNw/eT82+Lh0ThnGPjDVD4LajS/98t6Y3xtlRphq4
         HY0Na5pB/yX7l9SVkLFWRyjIKVOkXC3rlYtwCqGGw76s7DA3HiBRHUabbdCkhNUlTxKV
         5IrC2P1+iWmh282KL1FJw7RH4BlJuLSvy08H0aYjLFQzm8fN9OwarOEdnC1dFTFK7CSZ
         qA3FT5qvllPzKnxO4/lvI2HhgyXzvWwUPpy5e15hZqJ7xRdF/BpKtb2S5Uo1Xqu8Qdml
         TK4A==
X-Forwarded-Encrypted: i=1; AHgh+RrHRyJRZXcHzsSEbQvIpE0WN/MKHADDvS3yo5hd4WuhfAwMztwzA5CEnFa5FlC35sdvwHEYfy07APV00g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Xmn62sCBkb0SEjbh4LGdE0Tdm03F2a9PFTpwMhHRFJKSfR3O
	CcZ0B0Xp5VJEjv9zSGVULLu2hXNoFME8S11JXqxhA/LyGh2Q6dyqvJvYtfhlYBUR+oaTP8POT8Y
	PhHrZ+rE=
X-Gm-Gg: AfdE7ckufzlJKdMypJrAOmIID+GZ/8LQzE6lt8ww31KP7hvt7++j7uqd4G5EXzzk6cr
	zcOWJ1X6NfIclgrSS0vBc7YqMCy8sMs3x6628DziSLRIGWUAOpZWHTASgm+Pf/tfIakL/6HGIwN
	bOTGtZg/akppNMF1PEaDHa3w3KesQUZCwNGJUob7oYAPgip9ljgUzH+dIBApqepGK8GcAlfDzaq
	BJLakaqX8oEMMsMD8qsyrXosdS2vgfo7JTMGu4duZPr8QajXiqS8Btvrfl23LuW+txchDATZU0L
	zK43G5pUXb5bZsji2PkCD4gDxBH89uaEw0FORWwbEQAN8ivF8LKAG1o25PL2iKZJsZHGyCboCR9
	DaEdh+MEeedexrz07H/1Wi+Wv2PaAHllhO15qlU1vzZ3o8ypt/MxeLZoMI21ulELSy+YPny7a8K
	WhKaHikJnyixtcb/1TcumLv9G5dZTcvmq88TtGOBpHD37rbQyg2Fd89ew6Bp0q
X-Received: by 2002:a05:6402:e05:b0:69c:7798:407c with SMTP id 4fb4d7f45d1cf-69cd29f2000mr3582221a12.6.1784084792131;
        Tue, 14 Jul 2026 20:06:32 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2952836sm2295196a12.27.2026.07.14.20.06.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 20:06:31 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so7524209a12.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 20:06:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrj3/ONvb0hHdjlUoMpwHwv574uUfBs17uWAZEMGMbICqYva4TQcrgEnGw/6Rs5PQqtTgW7zRhsP0OE1w==@vger.kernel.org
X-Received: by 2002:a17:907:3f22:b0:c15:9350:dfa6 with SMTP id
 a640c23a62f3a-c16619ad2b0mr326688366b.60.1784084790705; Tue, 14 Jul 2026
 20:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715005909.GF1656185@killaraus.ideasonboard.com> <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
In-Reply-To: <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 14 Jul 2026 20:06:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
X-Gm-Features: AUfX_mx8ZSjXcuPJvd3iUkA0-q7mYf-tl1EE8rFa7q8zX5xY72kSpsyl1CruPtg
Message-ID: <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
Subject: Re: Linking Patchwork with Sashiko?
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67603-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roman.gushchin@linux.dev,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[torvalds@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.dev:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FAC275A354

On Tue, 14 Jul 2026 at 19:01, Roman Gushchin <roman.gushchin@linux.dev> wro=
te:
>
> I think it makes the point of sashiko - helping maintainers - unachievabl=
e. If the point to not use
> LLMs in general, let=E2=80=99s discuss this, not how to make each use cas=
e more complex.
>
> It seems like [1]  expresses a very anti-LLM position in general

Yes.

And no, that's not the position of the Linux kernel.

I realize that some people really dislike AI, but this is an area
where I'm willing to absolutely put my foot down as the top-level
maintainer.

Linux is not one of those anti-AI projects, and if somebody has issues
with that, they can do the open-source thing and fork it.

Or just walk away.

AI is a tool, just like other tools we use.  And it's clearly a useful one.

It may not have been that "clearly" even just a year ago, but it's no
longer in question today.

There are other questions around AI (like what the economy of it will
actually look like in the end), but "is it useful" is no longer one of
those questions. Anybody who doubts that clearly hasn't actually used
it.

Yes, it can also be a somewhat painful tool, both for maintainer
workloads and just from a "it keeps finding embarrassing bugs"
standpoint.

But the solution is not to put your head in the sand and sing "La La
La, I can't hear you" at the top of your voice like some people seem
to do.

The solution is to make sure those LLM tools _help_ maintainers
instead of just causing them pain. There's no question on that side.

We're not forcing anybody to use it, but I will very loudly ignore
people who try to argue against other people from using it.

And no, AI isn't perfect. But Christ, anybody who points to the
problems at AI had better be looking in the mirror and pointing at
themselves at the same time.

Because it's not like natural intelligence is always all that great either.

The kernel project has been and will continue to be about the technology.

Sure, the social angle of working on open source is important and
often a very motivating part of the project, but in the end that's a
side benefit, not the _point_ of the project.

This is *NOT* some kind of "social warrior" project, never has been,
and never will be.

In the kernel community we do open source because it results in better
technology, not because of religious reasons.

And so we make decisions primarily based on technical merit. Not fear
of new tools.

              Linus

