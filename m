Return-Path: <linux-media+bounces-67675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WRZgI9x8V2q7GAAAu9opvQ
	(envelope-from <linux-media+bounces-67675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:28:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DAF75E1B4
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xs4all.nl header.s=xs4all01 header.b=bPc2cuUF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67675-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67675-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=xs4all.nl;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEDF83146DF2
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 12:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8634657CD;
	Wed, 15 Jul 2026 12:22:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB1246AF31
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 12:22:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118127; cv=none; b=KV+gUxPhA9dQA30LFJCZeYhRrW5xxpT/Egvbj+HUaitK/5gLObSUCYhVRQFyIWhfb5vgpwDx3KcZobyrRtxyE3s9OwdE+mYCM4pvXVGq05Ng6hDWZnw/7HEe4w8w9CjZU7XhgdkewLpaLOBUfuiDavWlIwW2L+cR8PB9AZyxFDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118127; c=relaxed/simple;
	bh=EpCHWV0olXe0wUelxA2UAaQozT+OYybA3dAhFQQCzrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6dOIukk9K1Qt4NiXJvBKJVDqNuhxOt4ulYUpPcBcYuut++49XG2s+pD77qiKAhijW5fipNZQklzzExaxO86cqRbj6yMLwIiuvhBp5agf0Hl6JWqwlcxUS+RqAx0S1gIP2pvdGLLJYbg69Id2pq2X2S8gdjkKFhux84zpWcxGQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=bPc2cuUF; arc=none smtp.client-ip=195.121.94.183
X-KPN-MessageId: c4717bad-8047-11f1-8f54-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id c4717bad-8047-11f1-8f54-005056992ed3;
	Wed, 15 Jul 2026 14:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:message-id:subject:to:from:date;
	bh=ACuDjH6V6ZFZvxXsTLLdWRzTZpjelx8D5GbB2E6qNHs=;
	b=bPc2cuUF/CJtCwg48smMS06Bng5mYwBwvcRz6QYhW5UFv5BHCFz9VL9meMlHzcYCGRDMokRqL8clt
	 2wztxqlHR3BYPHoxm/k5AXEYKWSWfoN5zaHB6RDuSQqTxQhzbVozLhpApQlT2Clfivv2dv39i8+qiH
	 qmRcDJx/gIwSgz2At8vPxPeXMseH4/e+cDrCEwf1giYrtjtdotmyE43Vob+P9mJHggaT1u0+BA0lj7
	 /gDD5yDcQc4/IcezRjbJBDwvNhYeK6V3//EgpIM9blJRnS9UlK+T2HijEcW/WO4zkyNEjWOtOp9BQS
	 4NjkhPIB0JyzUBXV4f9LWlgp+vjz6LA==
X-KPN-MID: 33|h+ebhVMRrqeBn9FwLcqL+eoE9/rvo0QQIsFElRyWNi49euCmseTmTKzFypMasjr
 SsJv8UjDFjCaR+FNK+7GXP3MvoR7BwEagfXzzmwFrwc8=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|t1y7h1nAy4pFKDkx30lZayWmErW4iv8tbS5cwng0an/0+KfaP45pa4XNrzJUIY1
 vEJwpLifj71Cxyn+sc9eObg==
Received: from localhost (142-169-144-85.ftth.glasoperator.nl [85.144.169.142])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id c41b22cc-8047-11f1-8084-005056998788;
	Wed, 15 Jul 2026 14:21:55 +0200 (CEST)
Date: Wed, 15 Jul 2026 14:21:48 +0200
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Derek Barbosa <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <aldx9KiAHM4CRI0m@lt-jori.localdomain>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[xs4all.nl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[xs4all.nl:s=xs4all01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67675-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linuxfoundation.org,m:roman.gushchin@linux.dev,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[xs4all.nl];
	FORGED_SENDER(0.00)[jkoolstra@xs4all.nl,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[xs4all.nl:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[195.121.94.183:received,172.234.253.10:from,10.31.155.7:received,100.90.174.1:received,85.144.169.142:received];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkoolstra@xs4all.nl,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.31.155.7:received,85.144.169.142:received];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[xs4all.nl:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,lt-jori.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0DAF75E1B4
X-Rspamd-Action: no action

On Tue, Jul 14, 2026 at 08:06:14PM -0700, Linus Torvalds wrote:
> On Tue, 14 Jul 2026 at 19:01, Roman Gushchin <roman.gushchin@linux.dev> wrote:
> >
> > I think it makes the point of sashiko - helping maintainers - unachievable. If the point to not use
> > LLMs in general, let’s discuss this, not how to make each use case more complex.
> >
> > It seems like [1]  expresses a very anti-LLM position in general
> 
> Yes.
> 
> And no, that's not the position of the Linux kernel.
> 
> I realize that some people really dislike AI, but this is an area
> where I'm willing to absolutely put my foot down as the top-level
> maintainer.
> 
> Linux is not one of those anti-AI projects, and if somebody has issues
> with that, they can do the open-source thing and fork it.
> 
> Or just walk away.
> 
> AI is a tool, just like other tools we use.  And it's clearly a useful one.
> 
> It may not have been that "clearly" even just a year ago, but it's no
> longer in question today.
> 
> There are other questions around AI (like what the economy of it will
> actually look like in the end), but "is it useful" is no longer one of
> those questions. Anybody who doubts that clearly hasn't actually used
> it.
> 
> Yes, it can also be a somewhat painful tool, both for maintainer
> workloads and just from a "it keeps finding embarrassing bugs"
> standpoint.
> 
> But the solution is not to put your head in the sand and sing "La La
> La, I can't hear you" at the top of your voice like some people seem
> to do.
> 
> The solution is to make sure those LLM tools _help_ maintainers
> instead of just causing them pain. There's no question on that side.
> 
> We're not forcing anybody to use it, but I will very loudly ignore
> people who try to argue against other people from using it.
> 
> And no, AI isn't perfect. But Christ, anybody who points to the
> problems at AI had better be looking in the mirror and pointing at
> themselves at the same time.
> 
> Because it's not like natural intelligence is always all that great either.
> 
> The kernel project has been and will continue to be about the technology.
> 
> Sure, the social angle of working on open source is important and
> often a very motivating part of the project, but in the end that's a
> side benefit, not the _point_ of the project.
> 
> This is *NOT* some kind of "social warrior" project, never has been,
> and never will be.
> 
> In the kernel community we do open source because it results in better
> technology, not because of religious reasons.
> 
> And so we make decisions primarily based on technical merit. Not fear
> of new tools.

While there is some truly ridiculous anti-LLM brigading in some open
source projects, I feel like saying it is just another tool does not do
justice to some of the harm that is done by that industry. Also,
precisely because of the usefulness of LLMs, I worry about creating an
uneven playing field, where new contributors can't keep up if they can't
afford the needed tools (something that is not as much the case with
compilers.)

These are not arguments that others should not use LLMs, and I find LLMs
to be tremendously useful for reviewing code and understanding context.
But maybe the community could think about these concerns at the same
time, even if its not the main focus. Maybe it is a good side topic for
the Maintainter summit? (or perhaps it is not process-related enough.)

Best,
Jori.

> 
>               Linus

