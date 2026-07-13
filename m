Return-Path: <linux-media+bounces-67457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XQS8EMqyVGq8pgMAu9opvQ
	(envelope-from <linux-media+bounces-67457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:41:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E1749692
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:41:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=mP2So+gH;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67457-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67457-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D74B3012547
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E1C3E1D1D;
	Mon, 13 Jul 2026 09:41:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA072AD3C
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:41:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935687; cv=none; b=kgvAE2h1OZUT10JmoUJSzhBVryIOex7HwIiEW2j8fGwWo+bQ+xSo0BC5O2wrA0OL+WbkI2u74WHXVZ1wzqQoMPDdhlsG47JU6NoJIpsW+Wc4mUBP235S0R/Wb2gLArb8Qpr5y/ngNwzr3dDlDk9i0tfFUdLzH6hUmo6S/Ydglfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935687; c=relaxed/simple;
	bh=IECTtZDkQR22mwFuuusgQdqxH0bF3w3Eax0JyKyCCYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSLgP2+sCiSCR5Nc4riFAzLqZhW2buZsRbruOQF3iIEbW7RjSmnivKVXEj5AjyKkj5aB+G6prOE+DiiaB7Flhoe1YX3JFBkp6MNOEtMPDNUPldm8EbRllsMgJo4vMsokb2vgVcsa6BY04OQE5QeU3hWebQQONU+8jCvVaCG+PX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mP2So+gH; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31A4DC1;
	Mon, 13 Jul 2026 11:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783935629;
	bh=IECTtZDkQR22mwFuuusgQdqxH0bF3w3Eax0JyKyCCYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mP2So+gHfcRCbwt56dYxxbex+vPUz4QoyVNiSyPi3gKHLjM5IqFkeLVejP2H913pw
	 gipawKo/G9E4fsa0GTiuj6s0jhH0Wpl4Tcn8FE0TDkXZjoUjISMIX+JwEcafqstjKJ
	 EDiee0VqP6Un+U2KXwYg2UjhjxdTPu8XFNzzTJk0=
Date: Mon, 13 Jul 2026 12:41:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260713094120.GD1127719@killaraus.ideasonboard.com>
References: <7ia4tsrkn1k4.fsf@castle.c.googlers.com>
 <20260602223936.27def657@foz.lan>
 <b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
 <20260604085201.177ad537@foz.lan>
 <20260607195656.02788791@foz.lan>
 <akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
 <20260710074528.5a6e4457@foz.lan>
 <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev>
 <20260713095538.3d5e86f1@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713095538.3d5e86f1@foz.lan>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67457-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:roman.gushchin@linux.dev,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtv.org:url,linuxtv.org:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B35E1749692

On Mon, Jul 13, 2026 at 09:55:38AM +0200, Mauro Carvalho Chehab wrote:
> On Fri, 10 Jul 2026 18:01:38 -0700 Roman Gushchin wrote:
> > Mauro Carvalho Chehab writes:
> > > On Fri, 10 Jul 2026 07:45:28 +0200 Mauro Carvalho Chehab wrote:
> > >> On Tue, 30 Jun 2026 16:32:30 -0400 Derek Barbosa wrote:
> > >> > On Sun, Jun 07, 2026 at 07:56:56PM +0200, Mauro Carvalho Chehab wrote:    
> > >> > > Added both global and per-project permissions to add CI checks:
> > >> > > 
> > >> > > 	https://github.com/getpatchwork/patchwork/pull/653
> > >> > > 
> > >> > > Tested on a docker container created on the top of current
> > >> > > upstream, with the database imported from linuxtv.org and
> > >> > > migrated to the new permissions model.      
> > >> > 
> > >> > Hi Mauro,
> > >> > 
> > >> > Patchwork integration has been cleaned up and the original issues filed against
> > >> > the Sashiko project have been resolved.
> > >> > 
> > >> > Any progress on your work for the permissions modifications (or enabling it for
> > >> > media)?    
> > >> 
> > >> I'd like to have the permission modification changes applied at
> > >> Patchwork upstream before applying it to linux-media instance, as
> > >> this will require a DB change, which can make it harder in the future
> > >> to update linux-media patchwork instance, especially if upstream ends
> > >> with some changes over my proposed patch.
> > >> 
> > >> So, while patchwork doesn't have a separated permission for checks
> > >> addition, we'll keep using my tool to update bots feedback from
> > >> e-mails. To prevent too much noise at linux-media, we have now a
> > >> 
> > >> 	media-ci@linuxtv.org
> > >> 
> > >> mailing list that is meant to receive all bots feedback. The
> > >> e-mail parser is listening to it as well.  
> > >
> > > Btw, we did an inquire among the participants of the latest media
> > > summit, where we discussed Sashiko.
> > >
> > > There is a consensus of receiving Sashiko feedback at 
> > > media-ci@linuxtv.org, where people can opt-in/opt-out.
> > >
> > > With regards to c/c authors, there was a proposal to add a custom 
> > > disclaimer's notice on each patch. Also, several people manifested
> > > that it should be possible for authors to opt-out receiving Sashiko's
> > > e-mails.  
> > 
> > Sorry, I'm not sure how it's supposed to work (opt-in/opt-out).
> > My take is that Sashiko (the sashiko.dev instance, not private/corp
> > instances) is a tool for maintainers, not individual authors.
> 
> IMO, sashiko.dev could have an e-mail interface to enable/disable
> delivers to authors on a similar way to what mailman does. For instance, 
> if an author replies to be "unsubscribed" (or access some web interface),
> a confirm e-mail with an unique token ID would be sent to his e-mail.
> After replying to it, the author would be blacklisted on e-mail
> delivery.
> 
> This is for authors only.
> 
> > I rely on corresponding maintainers decision on whether emails are
> > sent to the corresponding mailing list. 
> 
> Mailing lists is a different case: the decision should be taken by
> maintainers. Only maintainers can change that.
> 
> > Individuals can set their
> > spam filters up if they don't want to get these emails, I can't control
> > it. Providing individual authors an option "I don't want my patches
> > to be reviewed" sound strange to me. It's like "I don't want my patches
> > to be tested by unit tests".
> 
> I agree with you, and, on my head, not sending e-mails to the author
> is a clear violation to one of the most basic net etiquette rule on
> mailing lists: any replies to posts there should reach the author.

I don't know where that one comes from.

What happened to this other "most basic rule" that subscription to
services that deliver e-mails should be opt-in ?

> Unfortunately, some people have too strong opinions against LLM,
> and don't even want to setup filters related to it.
> 
> > > So, at least with the current way, we were unable to reach a
> > > consensus (or a large majority) about c/c the author.  
> > 
> > You can start with cc mailing list only or a set of enthusiasts.
> 
> Yes.
> 
> > > So, what it is a consensus is to receive Sashiko's email via
> > > media-ci@linuxtv.org, evaluating its feedback results for a couple 
> > > of kernel releases. IMO, it is better to receive there also e-mails
> > > if Sashiko didn't find any issue.  
> > 
> > There is such an option, we can enable it.
> > Should I move on and enable reviews to be sent to media-ci@linuxtv.org?
> 
> Yes, please. This way, media developers interested on receiving Sashiko
> reviews may get access to it. It will also feed media patchwork instance
> at:
> 	https://patchwork.linuxtv.org/project/linux-media/list/
> 
> > > One interesting feedback was related to a review from i.MX DTS and DMAEngine 
> > > I3C patch series.
> > >
> > > I guess it could be the start of a custom linux-media prompt.
> > >
> > > The original suggestion is:
> > >
> > > 	"I suggested add some actionable advice.  The below action when I handle
> > > 	i.MX DTS and DMAEngine\I3C sashakio review feedback.  
> > >
> > > 	- "Pre existing issue" \ "not introduce by this patch", can omit this feedback,
> > > 	But encourage fix at following patch
> > > 	- "UAF" or lock issue,  most like is true issue, strongly suggest fix it. Maintainer
> > > 	Most likely double check this type issue.
> > > 	- Small issue like "typo" or "indention",  please fix before maintainer involve
> > > 	Review. 
> > > 	- other identify severity is HIGH issue, suggest reply sashiko email and provide
> > > 	Your judgement when close to land."  
> > 
> > Re disclaimers and addition instructions in emails - we can discuss it,
> > but my personal preference would be to keep the minimal - after getting
> > like 10 emails from Sashiko it will feel like legal disclaimers written
> > in small font - something that nobody reads and it just wastes the
> > screen space. So maybe we can put these subsystem-specific rules
> > somewhere and just provide a link in every email? Just an idea.
> 
> Disclaimers on e-mails are, IMO, important to new contributors. You're
> right that experienced developers will ignore it, but having a simple
> disclaimer's notice informing that bot reviews may make mistakes and
> that, in case of doubt one must consult an experienced developer is a
> good thing. We had some discussions on media to have a prompt similar
> to this:
> 
>     This is an LLM-generated review that can be prone to hallucinations.
>     It is fine to ignore this review.
>     When in doubt about some of the findings, please consult
>     an experienced developer.
> 
> I even tried wrote some code adding it at:
> 	https://github.com/mchehab/sashiko/commit/5e3ec00772e9bc7a9e7d90993674d822a7bc200f
> 	https://github.com/mchehab/sashiko/commit/eff8622fe2828efc56cd38037cb837d28ebd3914
> 
> they are on this branch:
> 	https://github.com/mchehab/sashiko/tree/linux-media
> 
> but this was before the discussions with regards to c/c authors.
> Also, please notice that I never wrote Rust code before, so the
> rust patch is likely not perfect: it is compile-tested only.
> 
> > 
> > > There was also a discussion about a magic number inside a loop:
> > >
> > > 	for (unsigned int i = 0; i < 56; i++) {
> > >
> > > (on such loop, "i" was used to access an array)
> > >
> > > Sashiko didn't pick this one on one of his reviews.  
> > 
> > This is a good candidate for some generic prompt, not subsystem-specific.
> 
> Agreed.
> 
> > > I guess we can start with a custom RAC prompt to make Sashiko
> > > classify its output according with a criteria similar to the
> > > above.
> > >
> > > E.g. maybe linux-media may start with a custom prompt similar to this
> > > (as part of a more complete RAC):
> > >
> > > 	### Classification categories and actions
> > >
> > > 	1. **Pre‑existing issues** - a bug or flaw that already exists in the current code and is *not introduced by this patch*.  
> > > 	   - **Action**: Place at the end, under "Further suggestions". Note that the issue could be addressed on a separate patch  
> > > 	   - Mark as: `classification: PRE_EXISTING`, `action: DEFER_FOLLOWUP`.
> > >
> > > 	2. **UAF / Lock issues** - use‑after‑free, race condition, missing lock, double unlock, deadlock, incorrect refcounting, etc.  
> > > 	   - **Action**: This is almost certainly a true bug. Encourage the author to check or consult an expert if in doubt.
> > > 	   - Mark as: `classification: CRITICAL_LOCKING_UAF`, `action: MUST_FIX`.
> > >
> > > 	3. **Small issues** - typo, indentation, coding‑style, whitespace, missing blank line, comment grammar, overly long line, etc.  
> > > 	   - **Action**: These should be corrected before the maintainer becomes involved in the review.  
> > > 	   - Mark as: `classification: STYLE_TYPO`, `action: FIX_BEFORE_MAINTAINER`.
> > >
> > > 	4. **Magic numbers** - when a numeric literal (like `56`, `128`) is used without a defined constant or obvious connection to an array size. 
> > > 	   - **Action**: These should be corrected before the maintainer becomes involved in the review.  
> > > 	   - Mark as: `classification: MAGIC_NUMBER`, `action: FIX_BEFORE_MAINTAINER`.
> > >
> > > 	5. **Other HIGH severity issues** – any problem that is clearly a functional bug (logic error, NULL deref, buffer overflow, API misuse, incorrect error handling, memory leak, etc.) that does not fall into category 2.  
> > > 	   - **Action**: the authors should provide their own judgment on the issue (e.g., explain why it is a false positive, or confirm the fix).  
> > > 	   - Mark as: `classification: HIGH_OTHER`, `action: REPLY_WITH_JUDGMENT_NEAR_LANDING`.
> > >
> > > 	6. **Low severity / Informational** – anything that does not fit the above (e.g., suggestion, minor question, potential improvement that is not a bug).  
> > > 	   - **Action**: Optional; can be addressed at author’s discretion.  
> > > 	   - Mark as: `classification: LOW_INFO`, `action: OPTIONAL`.
> > >
> > > Please notice that we're not a prompt experts - nor, afaikt, any media
> > > developer tested running Sashiko locally themselves - so you probably can
> > > come up with a better custom prompt than us.  
> > 
> > I'll take a look, thanks!
> 
> Thank you!
> 
> Btw, it occurred to me that we could also pick some things from Media Subsystem 
> profile as well, from its addendum:
> 	https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html#submit-checklist-addendum
> 
> like adding a feedback that new drivers need to pass at the compliance
> tools if the patch series is adding new drivers.

-- 
Regards,

Laurent Pinchart

