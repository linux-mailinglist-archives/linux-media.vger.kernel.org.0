Return-Path: <linux-media+bounces-63465-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LJy3BlBsH2pHlwAAu9opvQ
	(envelope-from <linux-media+bounces-63465-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:50:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F9B632FE5
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:50:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GYStn1q4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63465-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63465-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B34F300690C
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 23:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4DE3B583E;
	Tue,  2 Jun 2026 23:50:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3A233C536
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 23:50:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780444216; cv=none; b=ft4dv+fmwOx3xk9nGOozJYxnAa94rcjAZwWy/yeQ+7YBVX3j2iFQBUQms2t4VwGymj0dxUN6cfymFV4rH3Abw5c4yNey0rUMzZ6kbR1v2YhwAhBVMF+LMEfbdkD1oh2y022LTq/2Rt5dI9RAmIK2OCMUza9tFjqMPIBb+3FOsdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780444216; c=relaxed/simple;
	bh=rWFigjDrxJfCgzl49qn6eUjt31eNpqdcNra83mCTNUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfhSh3o6vsXbnr1nrC2UhvaO0wSXkEHPq6KVvbfw15+q4tRf0L1NjgiY576gHbzb4Ytt16YC8DbVsIXURN4HzKEyUv33hDm7gqupVs+4G78ZCEwVZZl3PCuQAGa/3FUYWnVSrPk8IvacfF+80ye7QL4mlVXtp1KR6soVMV9ulQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYStn1q4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058271F00893;
	Tue,  2 Jun 2026 23:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780444213;
	bh=3IqRxDAkddu61neJEMl6auaWlDXpUdQtTUioaFgJU9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GYStn1q4RKaSqaAM3EKSJKeshpuzx9scqo+DUQVUwBnfRVos/fes8OXbAZgysFc0R
	 RePeiZ9Lu30KXwD7XfOta+oiAgTD/Yu8HIDY9ZY7MDCpj7ucCGb07u5DtLQ7/S7cDk
	 pDzILyNMiRqeNR0jLYA5Kc9S+ImOw0IO4QjA5cTSMNnYYIJLK2OJqU62ztokkE8qmX
	 LJzP69IQB4y46gKmO7Gq8PveWr6OQHSet2IdiEekZyWZdkaOJPwSDAtE0RElnhebHq
	 Gy+mfkqeQlU78Rypk9R6tSK59x+7IYFb4i/SyJ9DpzO9/rakbBy7U60UNTyM4clQa8
	 Ol2BSeKk5ffHQ==
Message-ID: <b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
Date: Wed, 3 Jun 2026 09:50:06 +1000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: Linking Patchwork with Sashiko?
Content-Language: fr
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Derek Barbosa <debarbos@redhat.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20260530103004.6fe2ffa7@foz.lan>
 <7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
 <20260530200017.0fe7f685@foz.lan> <20260530204945.22ac92c6@foz.lan>
 <20260530205351.19847fc8@foz.lan>
 <ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
 <7ia4tsrkn1k4.fsf@castle.c.googlers.com> <20260602223936.27def657@foz.lan>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20260602223936.27def657@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://github.com/multipath-tcp/mptcp_net-next/blob/0c8d473f43cfab0ed926d694c77cb7824893af04/.github/workflows/tests.yml#L528-L596];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63465-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:debarbos@redhat.com,m:roman.gushchin@linux.dev,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[matttbe@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matttbe@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sashiko.dev:url,vger.kernel.org:from_smtp,patchwork.readthedocs.io:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15F9B632FE5

Hi Mauro, Derek, Roman,

On 03/06/2026 06:39, Mauro Carvalho Chehab wrote:
> On Tue, 02 Jun 2026 20:13:15 +0000
> Roman Gushchin <roman.gushchin@linux.dev> wrote:
>> Derek Barbosa <debarbos@redhat.com> writes:
>>> On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:  

(...)

>>> - pw_tools is a workaround solution to get/set status on patchwork via bot-mail
>>>   parsing. pw tokens also have broad permission scope.
>>>
>>> which that leaves us with two "methods" of integration:
>>>
>>> 1. The Sashiko daemon calls the pw_tools script directly to update the status.
>>> 2. Sashiko sends a single-per-patch-email with parseable "status" to a mailing
>>> list, where some running daemon will pickup the mail.  
>>
>> This feels a bit hacky.
> 
> The alternative that would be acceptable, at least on media, is if 
> one would add support on patchwork to have a separate permission just
> for checks update.

Indeed. It looks like there is an old feature request about that:

  https://github.com/getpatchwork/patchwork/issues/14

Linked to Mauro's email from Dec 2015 :)

> Granting full maintainership control to external bots sounds too risky 
> for my taste.

Even if I agree that's not idea, I would trust Roman's and his team not
to mess-up with the project I maintain in Patchwork. I don't know when
permissions will be more modular on Patchwork. That would be different
for other services like access to the Git repo.

My current workaround is similar to Mauro: pulling Sashiko's results,
and publish them on Patchwork, e.g.

https://github.com/multipath-tcp/mptcp_net-next/blob/0c8d473f43cfab0ed926d694c77cb7824893af04/.github/workflows/tests.yml#L528-L596

But sometimes the pull timeouts, and that's not ideal, plus it needs to
be updated when Sashiko has new features, etc.


I guess Sashiko doesn't need pw_tools script if it has the permissions
to publish some results on Patchwork directly. It's just one HTTP POST
request once on the correct 'check' route, e.g.

  check_url=$(curl ${CURL_OPT} -A "${PW_AGENT}" \
      "${PW}/api/1.3/patches/?project=${PROJECT}&msgid=${MID}" |
       jq '.[].checks')

  curl ${CURL_OPT} \
      -A "${PW_AGENT}" \
      -X POST \
      -H "Authorization: Token ${PW_TOKEN}" \
      -F "state=${state}" \
      -F "target_url=https://sashiko.dev/#/patchset/${MID}" \
      -F "context=sashiko" \
      -F "description=${desc}" \
      "${check_url}"

See: https://patchwork.readthedocs.io/en/latest/usage/overview/#checks
API:
https://patchwork.readthedocs.io/en/latest/api/rest/schemas/v1.3/#post--api-1.3-patches-patch_id-checks
Ref: https://github.com/sashiko-dev/sashiko/issues/50

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.


