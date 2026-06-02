Return-Path: <linux-media+bounces-63425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5o9LBBUkH2oliAAAu9opvQ
	(envelope-from <linux-media+bounces-63425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 20:42:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A56312B7
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 20:42:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ziepe.ca header.s=google header.b=c554Rr70;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63425-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63425-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B5463021701
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 18:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37619395AF3;
	Tue,  2 Jun 2026 18:40:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53462288C2C
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 18:39:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780425599; cv=none; b=u/xMvMt7b82gTx3COrTcgBV5ZofxzB6qGLQVLJjBjnDHoZNKzvix/fRWN7wZt/zl5/ndVVyH4aBeBdJWeqd14bdcJe8ti7Sy5bal6GuFrkgy4cPpkqX9bJW++iykcWxT7af1oxA3cQNV388QBAZwdUynViQ6gHH/8aedSec31sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780425599; c=relaxed/simple;
	bh=l4Q7l1H8ZPiPsW13ulscqg5pSjPq8xn354usE28sRcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7WeH3n/hozfPcoMGWuCRPdVFi+K+0mqOtRXSCsxgmfHu7w/PSDrvDgphYyz5MdF21rZ8OOCGQLqqDZSIK9X+cAsbNsUyOUOj3Pyo7mKY5LfUuvInvI3taYD4TkIsXMGGnhUGTGX1gFvJZhh8dYmTrdIZx5cwabHwHe2dUsgDao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=c554Rr70; arc=none smtp.client-ip=209.85.222.176
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9158629a220so58116485a.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 11:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780425597; x=1781030397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EXM1ekMd/zxRVEjkZOPyvz+Q4sXtgfPK+IXoVvjo1ic=;
        b=c554Rr707dOl+JPoL/ymxH9FOh/kWV1lmxZt71Zw2PTgOjSoOFUccLndPLv3vW0w9u
         Ql5BgeaMjH/ZHlJaZJyo8eijjdGK1QXsEHGRMzB9Ld7mviLGatIxoJyyb1qxaOWRHFPh
         tqAGGV7X+lRQVX2uQ/3gwtvaeIj+n2qIDqsS1b4zC6bbWRKT+9dXhqy1lb1c4FWjNULB
         ohCpm+Gt4TJe/mLyrTGTOfCezDGF0FSkf3J14Zzy7g+y4HTcwQqCwjWdgdtvEsLfQTur
         vBIxzqJqZTdw5byZ6KJlNPQcBmTZWhTs7VRtTfi9s4PX5ttRZNwuezZIWQgh2GprLqC3
         hDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780425597; x=1781030397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXM1ekMd/zxRVEjkZOPyvz+Q4sXtgfPK+IXoVvjo1ic=;
        b=pA6B/Y6xhlh1H1WFJKLHsitQl9dkmcEbOCPNK6sYcWsedWX4LkhzkJkAje4CHdd5nj
         69AzkM3pHFUXGpDUgC5TnHkSRSaJtI6tL9OrE3NzjFwbUvJnVzfR16FwUAieSpFiLXEW
         JifZxSOfsPv3wW43J2bJXxKK4Rj8EliTIf7LMN7C7mQfWe2nufuHVQI486ruVrqqkHwX
         sI5fo8YgOEwO3rT3zBl6CXIciJDxGcP9R5WSentydcAFWSUgnzC13K0OFMbXrgwrUr84
         q1KamFjuRVgv04BYu1azD9iiXIfORkwDCuhw0L3vQ4xa7q7kucLRDMvopnVCprOweFot
         GLhA==
X-Forwarded-Encrypted: i=1; AFNElJ8wYpzzAbY3Y1kYoKewwXkjdrGvyxKikBNpv3+feUjTQSTDIKP5m1jmvqVPbAtW8fsW0us4uRr3V2Be7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMKDQAlt8XbGzumDiyFcoeXqLgyGRDwV9VyD9EbQVs5Vn2fc0n
	HHpFwG66IuwtUbGUDWJCUKfv0Si2jbAAGoxgj8VK/CCif40l7u3olWatab5FV65ouxo=
X-Gm-Gg: Acq92OGyjETm1Gup0hUj5QSgxJiPnpAxGRWA9swz+wgZoaiByRJimDASxwGX76pi2xE
	S9SgRcjoKwU1OyHejsfdHIzgbmr9p4hLymzSsutXIpR+b41R8HKh1R3YM7IDe1FdnFJJhHvmZtb
	ZJHpofeX0ia0+oqIEyX9eAzGjsHPrD3J+m+1Rb0gvITk0ul7EhVo9xDB6f5JvhMo4umBFvaXPaf
	ZP+DRRjPW5mzspim/XYi4jLLOL9WqwvyxNM0phz1PrqCglBpcu5sjM67HSTRalnjnBopHIbbVq7
	xwRQUY2YJAVZBJ9vNrzZD8wy/f7/C9r2sYjI3SZEO0y6Cbon5/dIQs50h6mmxUbgNMo42sfC0lD
	1XAv6Nib+TG/UMy81FPM+xfourRUYu2+X4BK6pVasvVegkIEcYWoJaKb56v21b/dRufuNqXV1i0
	6o+erkujqV6zEUpyruewi2F8HrqM3rI2cKPOPzt+abWTmKRQR/J+wkz3Bwi8kPqEEKRd1hSeLMZ
	C45Nf6rf5n48Mm4
X-Received: by 2002:a05:620a:470d:b0:915:6e30:5bdf with SMTP id af79cd13be357-9158a69a617mr50219785a.19.1780425597194;
        Tue, 02 Jun 2026 11:39:57 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3bf5dasm19991085a.36.2026.06.02.11.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 11:39:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUU1r-00000004Ohr-4Bcg;
	Tue, 02 Jun 2026 15:39:56 -0300
Date: Tue, 2 Jun 2026 15:39:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Derek Barbosa <debarbos@redhat.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260602183955.GJ2487554@ziepe.ca>
References: <20260530103004.6fe2ffa7@foz.lan>
 <7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
 <20260530200017.0fe7f685@foz.lan>
 <20260530204945.22ac92c6@foz.lan>
 <20260530205351.19847fc8@foz.lan>
 <ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
 <20260602185115.4b5c4886@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602185115.4b5c4886@foz.lan>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	TAGGED_FROM(0.00)[bounces-63425-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:debarbos@redhat.com,m:roman.gushchin@linux.dev,m:konstantin@linuxfoundation.org,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ziepe.ca:mid,ziepe.ca:from_mime,ziepe.ca:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E4A56312B7

On Tue, Jun 02, 2026 at 06:51:15PM +0200, Mauro Carvalho Chehab wrote:
> On Tue, 2 Jun 2026 11:51:42 -0400
> Derek Barbosa <debarbos@redhat.com> wrote:
> 
> > On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:
> > > 
> > > In time: problematic in the sense that the first project that
> > > picked it is likely the patch "owner": the token will require
> > > maintainership on such project.
> > > 
> > > In practice it would mean that the token used on patchwork instances
> > > with multiple Kernel projects may need maintainers permission on all
> > > such projects, as otherwise patchwork update will fail.
> > > 
> > > Thanks,
> > > Mauro
> > >   
> > 
> > Hi Mauro,
> > 
> > Just to recap the the thread, to confirm that I am following it correctly:
> > 
> > - Patchwork only supports a single URL mask for message-ID lookup (lore or
> >   sashiko). Adding a sashiko link would require diverging from upstream.
> 
> Not sure what you mean.
> 
> AFAIKT, a RFC-822 application can have just one message-ID per message.
> 
> For message lookup, patchwork works using its own patch ID, or via a search
> to the original message ID that contains the patch. So, no, it won't be lore
> nor sashiko, as neither lore nor sashiko write e-mails ;-)

He means the hyperlink patchworks adds, ie look here:

https://patchwork.kernel.org/project/linux-rdma/patch/20260602140453.3542427-1-arnd@kernel.org/

See the near top of the page "Message ID" section 

Message ID	20260602140453.3542427-1-arnd@kernel.org (mailing list archive)
                                                           ^^^^^^^^^^^^^^^^^^

That hyperlink goes to lore, Kostantin set this up

What I suggested as a very basic first step is a second hyperlink to
Sashiko, which I guess needs upstream to adjust how they generate this
html.

Integrating as CI reports and so on would be nice if someone can
manage it for all the kernel.org patchworks :)

Jason

