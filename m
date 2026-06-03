Return-Path: <linux-media+bounces-63474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OTlzElOhH2pHoQAAu9opvQ
	(envelope-from <linux-media+bounces-63474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 05:36:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FBF634037
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 05:36:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DP73ama0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63474-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63474-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 326D5305452F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 03:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2973E95B3;
	Wed,  3 Jun 2026 03:35:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4CC357D08
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 03:35:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457740; cv=none; b=iAyKHNwtIZv9MyvIIoAg7jBXqlXV0JI+5xL7Ia+C+emkHhPp2AAwcGK1pSfLGboxU8k5dcPylwo80iy3SJzVokL32logpAyfc9rBmgkfJtm8oZMBpY9gnZEjUpCc+lpFl8vvNsyiCI5vMRhkYLaPtZSRK275QTq/X/lQpEqcfng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457740; c=relaxed/simple;
	bh=F4wvLyRBm23xRXokHX6Ygz/wLjvEFyyUD1dX5FXNfQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iuha7VLW+r3n0eO9o4T/NwQZrU5xj3lQZ5lClMIJE3qF3cfGawOag6HzaO6n4r873Jg6I+4DW9AonsUMND2xY7CQ4F160onZR4tBeZr/JM/TnY0na8DA30NEEVZPjgFqj+3SNjVGrrIwKAYNtVqSQT8N9ggX/S+dac011k43VuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DP73ama0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A58B1F00893;
	Wed,  3 Jun 2026 03:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780457738;
	bh=XT8Wr+QlK04M1Z89ezbWEdnYU34GODf+GIiOtgZhJ98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DP73ama0EgxIyZrkdVFnuTyFnUEDOuwl36L6/3tAMbF99xk2dQ7AmiCAuDKQyPJDS
	 pRT2+aX9f4QcN3aXBNaCTlqyUq7UYC0cokL/cv3YXqOeHPL3lUU5ZEYX2AM090nQtU
	 dZRen4WEdsIZHsmWPm4bD36e+HkKaEMUw2GEY9n40uwnMdJwiOvt7pGL4HC/0YdTvq
	 y+i/Z7wKuJf2ZRgLZccSUlfN/YjM7e+o5y8uVZPNC4co4t/jGnQo2oC2MNl+SUlekH
	 JUrK8dScFnBfx1LGrN/S8mEZWuNhQbt32D/z/q5DDV0z0o/z2xDzEKV8ZjXvo1IWza
	 jFn++ot0MHqIw==
Date: Wed, 3 Jun 2026 05:35:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Derek Barbosa <debarbos@redhat.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260603053534.46452263@foz.lan>
In-Reply-To: <b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
	<20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
	<7ia4tsrkn1k4.fsf@castle.c.googlers.com>
	<20260602223936.27def657@foz.lan>
	<b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	URI_HIDDEN_PATH(1.00)[https://github.com/multipath-tcp/mptcp_net-next/blob/0c8d473f43cfab0ed926d694c77cb7824893af04/.github/workflows/tests.yml#L528-L596];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63474-lists,linux-media=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matttbe@kernel.org,m:debarbos@redhat.com,m:roman.gushchin@linux.dev,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,linux.dev:email,foz.lan:mid,patchwork.readthedocs.io:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91FBF634037

On Wed, 3 Jun 2026 09:50:06 +1000
Matthieu Baerts <matttbe@kernel.org> wrote:

> Hi Mauro, Derek, Roman,
> 
> On 03/06/2026 06:39, Mauro Carvalho Chehab wrote:
> > On Tue, 02 Jun 2026 20:13:15 +0000
> > Roman Gushchin <roman.gushchin@linux.dev> wrote:  
> >> Derek Barbosa <debarbos@redhat.com> writes:  
> >>> On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:    
> 
> (...)
> 
> >>> - pw_tools is a workaround solution to get/set status on patchwork via bot-mail
> >>>   parsing. pw tokens also have broad permission scope.
> >>>
> >>> which that leaves us with two "methods" of integration:
> >>>
> >>> 1. The Sashiko daemon calls the pw_tools script directly to update the status.
> >>> 2. Sashiko sends a single-per-patch-email with parseable "status" to a mailing
> >>> list, where some running daemon will pickup the mail.    
> >>
> >> This feels a bit hacky.  
> > 
> > The alternative that would be acceptable, at least on media, is if 
> > one would add support on patchwork to have a separate permission just
> > for checks update.  
> 
> Indeed. It looks like there is an old feature request about that:
> 
>   https://github.com/getpatchwork/patchwork/issues/14
> 
> Linked to Mauro's email from Dec 2015 :)

Yes, this is an old request, and, as on most projects, feature 
development takes precedence over security. On that time, we wanted to 
have non-maintainer permissions to allow patch delegation. There were
more recent discussions during some Linux Media summits a couple of 
years ago, when we started implementing media-ci.

> > Granting full maintainership control to external bots sounds too risky 
> > for my taste.  
> 
> Even if I agree that's not idea, I would trust Roman's and his team not
> to mess-up with the project I maintain in Patchwork. I don't know when
> permissions will be more modular on Patchwork. That would be different
> for other services like access to the Git repo.

The problem is not trusting on people: it is trusting on a bot and
on its infra.

> My current workaround is similar to Mauro: pulling Sashiko's results,
> and publish them on Patchwork, e.g.
> 
> https://github.com/multipath-tcp/mptcp_net-next/blob/0c8d473f43cfab0ed926d694c77cb7824893af04/.github/workflows/tests.yml#L528-L596
> 
> But sometimes the pull timeouts, and that's not ideal, plus it needs to
> be updated when Sashiko has new features, etc.

That's why my model is simpler:

- handle feedback when e-mail arrives on an user's account(s) using the
  same infra that patchwork has to add patches on it. If e-mails are
  failing, patchwork won't work anyway, so there aren't any new timeout
  risks than what we had before;
- if an e-mail arrives, don't parse its content: just open a new
  context, marking as warning, so someone can later check.

---

Btw, looking on your code, you're trusting that Sashiko is properly
classifying issues.

When I was testing my new tool, I produced a broken patch by purpose,
to see if my patch would properly handle CI e-mail output:

	https://patchwork.linuxtv.org/project/linux-media/patch/9050789262f583cef777eb3a9c3e07948faf18c3.1780141190.git.mchehab+huawei@kernel.org/

If you look there, you'll see how Sashiko considered a broken
compilation patch:

	Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
	- [Low] Intentional compilation breakage via an invalid syntax token at global scope.

e.g. instead of classifying it as "High", it classified the issue
as "Low".

That's probably because, at the patch description, I mentioned that
the breakage was for testing purposes, as I didn't want devels to
waste time on it: I just wanted to pick bot answers.

In any case, the point is that one of the weakness of LLMs is that
misguided (or malicious) patch descriptions or comments can make it
do a wrong analysis and/or classification.

So, at least from my side, the best is to handle all non-success
analysis from LLM tools and from static analysis tools as warnings,
letting a human to look on it, considering the tool classification as 
just a hint.

> I guess Sashiko doesn't need pw_tools script if it has the permissions
> to publish some results on Patchwork directly. It's just one HTTP POST
> request once on the correct 'check' route, e.g.
> 
>   check_url=$(curl ${CURL_OPT} -A "${PW_AGENT}" \
>       "${PW}/api/1.3/patches/?project=${PROJECT}&msgid=${MID}" |
>        jq '.[].checks')
> 
>   curl ${CURL_OPT} \
>       -A "${PW_AGENT}" \
>       -X POST \
>       -H "Authorization: Token ${PW_TOKEN}" \
>       -F "state=${state}" \
>       -F "target_url=https://sashiko.dev/#/patchset/${MID}" \
>       -F "context=sashiko" \
>       -F "description=${desc}" \
>       "${check_url}"
> 
> See: https://patchwork.readthedocs.io/en/latest/usage/overview/#checks
> API:
> https://patchwork.readthedocs.io/en/latest/api/rest/schemas/v1.3/#post--api-1.3-patches-patch_id-checks
> Ref: https://github.com/sashiko-dev/sashiko/issues/50

Indeed it doesn't. The advantages of the script is that:
- the same script can handle different bots;
- no need to grant token maintainer's permissions to all CI
  bots;
- more control about how such token will be used, as the ones
  responsible for patchwork infra will be the ones that would be
  setting the e-mail account that will be used to update patchwork,
  and eventually storing all changes on some log.

Thanks,
Mauro

