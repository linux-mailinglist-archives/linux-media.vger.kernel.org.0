Return-Path: <linux-media+bounces-67601-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BO8tCfvpVmp/CwEAu9opvQ
	(envelope-from <linux-media+bounces-67601-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 04:01:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D4759FF7
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 04:01:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b="OmO6nFT/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67601-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67601-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E00033008FC2
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 02:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EB33A7F4A;
	Wed, 15 Jul 2026 02:01:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ACD248F72
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 02:01:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784080881; cv=none; b=pmE1El4ReMJhyMeGN1/QqWlEM/MTtQBCJLtdsjKbkTymVWSM27MI+e0myz0HL73vwnjas4whxPPGwxzbJKQGqk74ptYb+izxjMM6S8sueL1cw6QZtBbyg/P9SK9C3XvUKx0YykypM43teraZDfCYx37L2BGm5VZBNVdm6qKrX34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784080881; c=relaxed/simple;
	bh=LuY9Woj7vg6OFzyEQ/cvcRhhFIwWWxux59p5kDq/WGQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lHQtgTMQyok6dL9Ny32aNlAhj6bcBCx30S25gLxuZ4UxwcTV5IEnP4pesxVioWcIgFLIilMcz345VnUZJLLEmXxrst60SeSbohk2MSImob7qzxNnQI+jhDzPDK9mAn8P41TgU0FikHhPhsHXK15HAPz3L0KmFo0wU3XAx2QbQdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OmO6nFT/; arc=none smtp.client-ip=95.215.58.176
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784080876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6Tcdlk2KlrDTQ1RDFsVKwRtZ+KLI5HKlmjbyt9hjoA=;
	b=OmO6nFT/wFryomjx/ULZbtTgOvz2/pQJZ7nbD75FYLsn4pqtfcOFff3TuMyKODrLZvGz+d
	nhODDfSh79VqJXlYZSVTaeX3tLlhJq3Dlbwwg0Y8Y5KlfeYWVXP+VwPk/88ug2ooh7N9On
	M7a4Zb1Sayh0vNPriwbTfZcIdpC06zo=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Linking Patchwork with Sashiko?
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <20260715005909.GF1656185@killaraus.ideasonboard.com>
Date: Tue, 14 Jul 2026 19:00:54 -0700
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Derek Barbosa <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>
Message-Id: <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67601-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:dkim,linux.dev:mid,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA7D4759FF7

> On Jul 14, 2026, at 5:59=E2=80=AFPM, Laurent Pinchart <laurent.pinchart@id=
easonboard.com> wrote:
>=20
> =EF=BB=BFOn Tue, Jul 14, 2026 at 10:55:42PM +0000, Roman Gushchin wrote:
>> Mauro Carvalho Chehab writes:
>>>> On Mon, 13 Jul 2026 12:41:20 +0300 Laurent Pinchart wrote:
>>>>>>> Individuals can set their
>>>>>>> spam filters up if they don't want to get these emails, I can't cont=
rol
>>>>>>> it. Providing individual authors an option "I don't want my patches
>>>>>>> to be reviewed" sound strange to me. It's like "I don't want my patc=
hes
>>>>>>> to be tested by unit tests". =20
>>>>>>=20
>>>>>> I agree with you, and, on my head, not sending e-mails to the author
>>>>>> is a clear violation to one of the most basic net etiquette rule on
>>>>>> mailing lists: any replies to posts there should reach the author. =20=

>>>>>=20
>>>>> I don't know where that one comes from.
>>>>>=20
>>>>> What happened to this other "most basic rule" that subscription to
>>>>> services that deliver e-mails should be opt-in ?
>>>=20
>>> Replying to an e-mail is not subscribing to a service. It is the
>>> author's right to know if one replies publicly to his e-mails.
>>> Explicitly removing him from the C/C of such replies is a violation
>>> of his rights.
>>>=20
>>> On other words, it is implicit that, if you post an e-mail, you'll be
>>> expecting actions or answers to it.
>>>=20
>>> Now, if one really doesn't really want to receive e-mails from a
>>> particular sender, a block list solves it. Alternatively, a way to
>>> opt-out is welcomed.
>>>=20
>>> See, this is different than adding someone to a mailing list without
>>> his consent: On such case, people receive e-mails unrelated to their
>>> preferences. For those, opt-in is the right net etiquette.
>>=20
>> I agree with this.
>>=20
>> But also just practically: if someone who opted out from sashiko emails
>> posts a patch and sashiko finds say a critical issue, do we expect the
>> maintainer to go and manually check each time whether the author opted
>> out and forward the review?
>=20
> I expect maintainers who want to act on sashiko reviews to triage and
> verify them first before bothering authors, yes. I believe we should
> follow the first two recommendations of the Software Freedom Conservancy
> on using LLM-backed generative AI systems for FOSS contributions ([1]).
>=20
> [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommen=
dations.html

I think it makes the point of sashiko - helping maintainers - unachievable. I=
f the point to not use
LLMs in general, let=E2=80=99s discuss this, not how to make each use case m=
ore complex.

It seems like [1]  expresses a very anti-LLM position in general, which I ca=
n understand and I agree=20
with some of concerns. But I think it=E2=80=99s up to project leaders to dec=
ide if Linux in general  takes this=20
position and my take so far is that the answer is not.

Thanks=

