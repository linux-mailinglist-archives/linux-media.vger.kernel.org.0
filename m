Return-Path: <linux-media+bounces-67628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ACyABQ/V2pFIAEAu9opvQ
	(envelope-from <linux-media+bounces-67628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:04:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE3B75BB4D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:04:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=QgPxBMCJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67628-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67628-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A2EE306AEBF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319A63C5855;
	Wed, 15 Jul 2026 08:00:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F803B7769
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 08:00:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102411; cv=none; b=eTBtMkeQBeXNUb8t9/dm3IEIRMSQl02IuKrop82xYbsfLucb3FUiIpjTVggE4jEZEgU+HqMT6Nak45EJfZn+SGzjBOBup3c2bq93GJgim2AZEeosmLIp/e1ip/fOu87/9FtK96ZqaRG53TbyOLTDXvlM7wFQOG19SR7OlpkKxfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102411; c=relaxed/simple;
	bh=aGZbtUuBkoHZ3MAiW7ZdWe10h1VjA7JCip+nkcJtWw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+81/1PjPkLqAGwcRTDZV2Lvz4ZhgP4PB5w3AT9BE2ue1XvAKweCan11tv/uYJY/g/ndD9QD0Pxp3SaE0qwJk7rdlucG490e1p2JuSoofp2ZRIR0qtowzLKB3GIvf18T4s3SuFH9d6DvCmwjGkkL4WnHTDKcStykdqealTCAqvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QgPxBMCJ; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DB71104C;
	Wed, 15 Jul 2026 09:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784102346;
	bh=aGZbtUuBkoHZ3MAiW7ZdWe10h1VjA7JCip+nkcJtWw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgPxBMCJZlRwQnLSbxfwQVA5VH4LB0G06ioG5gNxksxZxkNFcyGBS7SYH/5p7/a6y
	 Tu0SaPfqCGMvmQzNTlW4CLZg6k6I5J01NTriWT1n75YU6Ql5WDF4/0rBYhw3yyWspr
	 k/gTQoIx2VbiVsLlFv0pc7fqVVZGJTn10p6AQjA8=
Date: Wed, 15 Jul 2026 09:59:57 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>, users@kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <alc3gAJfAkG5DULJ@zed>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67628-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:roman.gushchin@linux.dev,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CE3B75BB4D

Hi Roman

On Tue, Jul 14, 2026 at 07:00:54PM -0700, Roman Gushchin wrote:
> > On Jul 14, 2026, at 5:59 PM, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> >
> > ﻿On Tue, Jul 14, 2026 at 10:55:42PM +0000, Roman Gushchin wrote:
> >> Mauro Carvalho Chehab writes:
> >>>> On Mon, 13 Jul 2026 12:41:20 +0300 Laurent Pinchart wrote:
> >>>>>>> Individuals can set their
> >>>>>>> spam filters up if they don't want to get these emails, I can't control
> >>>>>>> it. Providing individual authors an option "I don't want my patches
> >>>>>>> to be reviewed" sound strange to me. It's like "I don't want my patches
> >>>>>>> to be tested by unit tests".
> >>>>>>
> >>>>>> I agree with you, and, on my head, not sending e-mails to the author
> >>>>>> is a clear violation to one of the most basic net etiquette rule on
> >>>>>> mailing lists: any replies to posts there should reach the author.
> >>>>>
> >>>>> I don't know where that one comes from.
> >>>>>
> >>>>> What happened to this other "most basic rule" that subscription to
> >>>>> services that deliver e-mails should be opt-in ?
> >>>
> >>> Replying to an e-mail is not subscribing to a service. It is the
> >>> author's right to know if one replies publicly to his e-mails.
> >>> Explicitly removing him from the C/C of such replies is a violation
> >>> of his rights.
> >>>
> >>> On other words, it is implicit that, if you post an e-mail, you'll be
> >>> expecting actions or answers to it.
> >>>
> >>> Now, if one really doesn't really want to receive e-mails from a
> >>> particular sender, a block list solves it. Alternatively, a way to
> >>> opt-out is welcomed.
> >>>
> >>> See, this is different than adding someone to a mailing list without
> >>> his consent: On such case, people receive e-mails unrelated to their
> >>> preferences. For those, opt-in is the right net etiquette.
> >>
> >> I agree with this.
> >>
> >> But also just practically: if someone who opted out from sashiko emails
> >> posts a patch and sashiko finds say a critical issue, do we expect the
> >> maintainer to go and manually check each time whether the author opted
> >> out and forward the review?
> >
> > I expect maintainers who want to act on sashiko reviews to triage and
> > verify them first before bothering authors, yes. I believe we should
> > follow the first two recommendations of the Software Freedom Conservancy
> > on using LLM-backed generative AI systems for FOSS contributions ([1]).
> >
> > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html
>
> I think it makes the point of sashiko - helping maintainers - unachievable. If the point to not use
> LLMs in general, let’s discuss this, not how to make each use case more complex.
>

Having been in the discussion within the media group, let me try to
re-express here the point I made within that circle already.

The decision to not send Sashiko replies to developers but rather have
them sent to a different mailing list, has been suggested because,
after a brief interim period where Sashiko reviews has been sent to
the main mailing list, it has caused more load for maintainers, not
less.

Far-fetched review comments, very convincing word salads mixed with
valuable findings have often been escalated by authors to maintainers
to have them distil the good from the bad.

This might have merits: analyzing 3 false reports to find a bug is
still worth it, but has so far caused more load for maintainers and
reviewers, not less. Considering reviewers are the most scarce
resource we have, analyzing Sashiko reports has been made an opt-in
feature by sending its review to a dedicated mailing list where
maintainers can (optionally) decide if something's worth acting upon.

This would also give some buffer time to evaluate Sashiko and maybe
reconsider later on.

> It seems like [1]  expresses a very anti-LLM position in general, which I can understand and I agree
> with some of concerns. But I think it’s up to project leaders to decide if Linux in general  takes this
> position and my take so far is that the answer is not.
>

All discussions around AI inevitably ends being about principles and
good vs bad. I'm surprised Linus and Ted had to weight in to re-state
the "we're not against AI!" principle while I would like to discuss
signal-to-noise metrics instead.

Maybe you have number I've not seen yet.

Thanks
   j

> Thanks

