Return-Path: <linux-media+bounces-67623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XQzHCLozV2o9HQEAu9opvQ
	(envelope-from <linux-media+bounces-67623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:16:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4472575B5BD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:16:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oK+pJkEV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67623-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67623-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAD333095132
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE0F33893D;
	Wed, 15 Jul 2026 07:14:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C22332EAE
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:13:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099642; cv=none; b=ruNySflf3807H1652q1QqDBYnHg3L+uK2ecltPiX97+auZn3VBKAI9mpIGg60lqM68HcrYB4ktqs90l27iGuXa8am+MOycr78hQ4HAms0tdOK73Oj2+VMr75QPOBFa/8t1bD0dsumVVMjpYDrhD7aHe/W6br9wMlP/PWk6SlW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099642; c=relaxed/simple;
	bh=vAsUHQIBk9hMpVCswzWpxKefvgpPcg7UfLEjcCnVgdw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RGWeQXkuJERdG5sHEaIdxNa3oIjqhynqZA0IBdf0+bYwSeUfSWdn824nR6b8Tjbw9ZpmOvT/zA+L5Y6nOwpNKWVTQbNsCiyI7eQymd7ZL62/BaTeTxKoKVAAe+7yIgFXg/z2j57n702r9N/2jOhWhapHMnFjk4iVJx8ubeGJfIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oK+pJkEV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9351E1F000E9;
	Wed, 15 Jul 2026 07:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784099637;
	bh=T2XIJQvmUx8sB0w66kqI9DV6BHEknBeRrvdEKftcWBA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=oK+pJkEVPOkBR4J+iPJKKLhb14jUfYG1rHcQE5y3U6cIPaLkmOmjt351OokPuVz9k
	 sfSvF4dutVizxk9bM/NJzkSq1ABuHD1TnHUHsMrb38PgH/RK8XvcW9jrD4BdRo0PQX
	 8Y1v5bwj4tOKRM5cPRuLwAVPMPP/FZHWt1To95az8BIKT3LAcnPXtXazWePWGXgihh
	 XyYS+Cr5ajjp1ki3qcVN4ZFgZtjYgdoGd2LElVGB6kx6yEXe6whzgOmSVUqE+VY/Da
	 UOQcVXOh4EEfWszh/L0N86nnA4Vvinf5sl58Sj0NboXi9JS3N8rx+yz3eXI5e9uJr9
	 OfIDCJbUeIcyQ==
Date: Wed, 15 Jul 2026 09:13:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Theodore Tso" <tytso@mit.edu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715091349.2094a0ec@foz.lan>
In-Reply-To: <alcBvuIMEGSjAD1R@mit.edu>
References: <20260607195656.02788791@foz.lan>
	<akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
	<20260710074528.5a6e4457@foz.lan>
	<20260710083845.23c753ca@foz.lan>
	<87wlv2jq4t.fsf@linux.dev>
	<20260713095538.3d5e86f1@foz.lan>
	<20260713094120.GD1127719@killaraus.ideasonboard.com>
	<20260713220427.582b28bf@foz.lan>
	<7ia4mrvtrxjl.fsf@castle.c.googlers.com>
	<20260715005909.GF1656185@killaraus.ideasonboard.com>
	<alcBvuIMEGSjAD1R@mit.edu>
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
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tytso@mit.edu,m:laurent.pinchart@ideasonboard.com,m:roman.gushchin@linux.dev,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67623-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sfconservancy.org:url,linuxtv.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4472575B5BD

On Tue, 14 Jul 2026 23:54:43 -0400
"Theodore Tso" <tytso@mit.edu> wrote:

> On Wed, Jul 15, 2026 at 03:59:09AM -0500, Laurent Pinchart wrote:
> > I believe we should
> > follow the first two recommendations of the Software Freedom Conservancy
> > on using LLM-backed generative AI systems for FOSS contributions ([1]).
> > 
> > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html  
> 
> It's not clear to me that the SFC document is particularly applicable
> for the use of LLM's beyond the use case of generating code which is
> contributed to FOSS projects.

Agreed: the document there is about AI-generated code ("Generative AI"),
not about patch review.

> Things get a lot more complicated when we're considering the use of
> LLM's to (a) review code, (b) automate the analysis of a bug report or
> stack trace, or (c) automate backporting a patch to LTS kernel.
> 
> Consider the first recommendation, "The FOSS community should support,
> not just tolerate, those who outright reject LLM-gen-AI systems."  If
> someone rejects LLM-gen-AI systems, and the LTS kernel contains
> patches which are automated backported, and they object, are we bound
> to forswear the use of automated backport technologies?
> 
> What if someone reports a bug with a kernel stack trace, and someone
> uses an LLM agent to analyze their bug report and find a fix.  What
> does it mean to "support somone who outright rejects the use of
> LLM-gen-AI systems" in that case?
> 
> > I expect maintainers who want to act on sashiko reviews to triage and
> > verify them first before bothering authors  
> 
> As a maintainer, I don't believe I should be forced to rephrase a
> Sashiko report just because a patch author "outright rejects" LLM's.
> For that matter, I don't believe I'm obliged to accept patches from
> someone who forces me to do extra work because they refuse to look at
> Sashiko reviews....

As a maintainer, I won't be doing extra work repeating reviews
from LLM (or from any other bot): if the patch is not ok and
there is a report already explaining why, I would simply tag
the patch as "changes needed" on patchwork, letting patchwork bot
to inform the author about the status change without any further
explanation.

As an author, if I submit a patch, I have the right to receive all
reviews, either done by a human or by a bot. This shouldn't be
something that an e-mail policy should be restricting.

I don't care if a bot uses LLM or not: a review is a review: if
it is right, my duty as an author is to fix the code; if the
review turns to be wrong, I have the right to argue against it.

> How do we balance the needs and time of maintainers with patch
> authors?  I don't think it's obvious that we *MUST* bend over
> backwards to oblige the needs of all patch authors.

Finding the right balance is indeed tricky, but Linux should come
first. As Linus mentioned, AI is clearly an useful tool.
Maintainers should use it wisely.

On my view, a good balance would be if Sashiko would have support
in the future to have an opt-out mechanism, replacing the 
`reply_to_author` e-mail policy from:

	https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_policy.toml

The rationale is that it should not be up to maintainers to decide
that authors will be explicitly excluded from patch reviews.

With an opt-out mechanism, authors can be warned at the opt-out 
interface that maintainers may still to use Sashiko reviews as 
they wish.

-

See, the above is *my view*. Other media developers have different
views. That's why we agreed to start receiving Sashiko reviews at
media-ci@linuxtv.org with reply_to_author disabled for linux-media.

Thanks,
Mauro

