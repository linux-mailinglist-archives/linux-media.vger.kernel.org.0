Return-Path: <linux-media+bounces-63255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF6CIRyFHWqjbQkAu9opvQ
	(envelope-from <linux-media+bounces-63255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:11:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D833E61FDA6
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1C84301ECEA
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D4F39D6E8;
	Mon,  1 Jun 2026 13:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hvmyb9+a"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E2372B50
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319400; cv=none; b=YLB+bxbvAWt/SBj9lZcMZ1X41C1yVUcCSN72D3LDFGL45o8kQEO9CtDalWYmMaH7kO+UF/tsJCHbFUBa2HyEs4pLSCXqx8vV9OXKwV0DtAwZY+kYZX0ipj9hS58tu7IjUpZvhzJ3DKGw2Gh0bYp9sss1RHts48ZpgFS53+IpBbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319400; c=relaxed/simple;
	bh=y1qthJVZiBKj676hYK58SLxoY8rPkB7gN0+ra9SKSZI=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:To:Subject; b=DyjnX983qmyrkXhSwIK71oGKPkR1cyQovPs3STSaI+SlgpRbarUL9P5hm3otMBNAHRXBkaRurvWIPywMlxj7AeHQ5CfztKiWIkOsRxy25LLGlk7UfL948nfJjezKvphYL4H8rND015Cf0lCaCa7a4vyEK2TYv4t6kQTwlXCOeWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hvmyb9+a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B211F00898;
	Mon,  1 Jun 2026 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780319399;
	bh=uQ5tlIjCCfWd6QxsEA3OeqB5s0PDbB69RcmXjvdliXk=;
	h=Date:From:To:Subject;
	b=Hvmyb9+a960s7yi6FEv66YFw3pIEraC7fBpgl5CFkv7HXO8vLHaqAuTmkFmLMiLLc
	 MSxBuE+N4vLk0EP9rXYKQsGu24XXdO5jxLQWFHm+l2ZA8BpQORTbkTEfjh2ge2pxgQ
	 VmD/P6bl50Ij6MGCex1F+9UA1UO8meieN3qROy5fI5Iy0ZzXqP+cuYRUKr6eX3kgOF
	 3vch+vgeMoAeTIGTKP2it2ISIpFOkrcApvRsE9zsB9gLSwOFEZQz/K3Hpc9dUH1wco
	 Mqg0RIAVsOhnA+og8RV4zX8nmOmmGBrq9QOOrRyn3wt2wlFy1yuXyABd2HqufLtp3K
	 VDrbhAjwRq2Bg==
Content-Type: multipart/mixed; boundary="------------L5PxckFDv5a7OHrX0bpuCRFY"
Message-ID: <18d5b476-72d0-4a1b-9004-1669866f0d28@kernel.org>
Date: Mon, 1 Jun 2026 15:09:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
To: media-committers@linuxtv.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Fixes and CC to stable: proposal
X-Spamd-Result: default: False [-0.46 / 15.00];
	MIME_BAD_ATTACHMENT(1.60)[sh:application/x-shellscript];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	MIME_UNKNOWN(0.10)[application/x-shellscript];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63255-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D833E61FDA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------L5PxckFDv5a7OHrX0bpuCRFY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

I talked to Greg K-H about whether or not a CC to stable is needed for a patch with a Fixes:
tag, and yes, if you want to get it into stable, then such a CC is required.

Since we never did that he just went through those patches himself and picked which should
go to stable, but obviously that's not how it should work.

There is no need for a CC to stable for fixes to patches that are not yet in the stable tree.
There is also typically no need for a CC to stable for e.g. Documentation fixes, or other
minor fixes.

In general in all other cases you do need to add a CC to stable.

So I propose that media CI just warns if there is no CC to stable for a patch with a Fixes
tag and if that tag points to a patch in the stable tree. And that it is the responsibility
of the media committers to check if the CC to stable is missing and add it.

Now, one problem is that it is very easy to fail to check the Media CI output if it passes.

I use a small check script (attached) that runs checkpatch and performs a bunch of sanity checks.
I run it over the patches I am about to push to gitlab and go through the results. First are the
checkpatch results, then at the end are the extra sanity checks. This avoids mixing the sanity
checks with the checkpatch results, which would make it easy to miss warning like a missing CC
to stable.

It's very efficient to be able to do these checks locally before you pass it to the CI.

You probably need to edit the script a bit since it checks if my Signed-off-by is present (I'm
embarrassed to admit I've forgotten that once or twice...). Obviously, as committer that
should change to your name.

Comments/questions?

Regards,

	Hans

--------------L5PxckFDv5a7OHrX0bpuCRFY
Content-Type: application/x-shellscript; name="checkp.sh"
Content-Disposition: attachment; filename="checkp.sh"
Content-Transfer-Encoding: base64

c2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tc3RyaWN0ICQqCgplY2hvCmVjaG8gJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLScKCmZhaWw9ZmFsc2UKCmZvciBwIGlu
ICQqOyBkbwoJaWYgISBgZ3JlcCAtcWkgJ15TaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwg
PGh2ZXJrdWlsK2Npc2NvQGtlcm5lbC5vcmc+JyAkcGAgOyB0aGVuCgkJZWNobwoJCWVjaG8g
IkVSUk9SOiAkcDogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJr
dWlsK2Npc2NvQGtlcm5lbC5vcmc+IgoJCWZhaWw9dHJ1ZQoJZmkKCWlmICEgYGdyZXAgLXFp
ICdeU3ViamVjdDouKk1BSU5UQUlORVJTJyAkcGAgOyB0aGVuCgkJaWYgISBgZ3JlcCAtcWkg
J15TdWJqZWN0Oi4qW15hLXpBLVowLTlfXW1lZGlhOicgJHBgIDsgdGhlbgoJCQllY2hvCgkJ
CWVjaG8gIldBUk5JTkc6ICRwOiBNaXNzaW5nICdtZWRpYTonIHByZWZpeCBpbiBTdWJqZWN0
IgoJCQlmYWlsPXRydWUKCQlmaQoJZmkKCWlmIGBncmVwIC1xaSAnXkNoYW5nZS1JZDonICRw
YCA7IHRoZW4KCQllY2hvCgkJZWNobyAiRVJST1I6ICRwOiBEb24ndCB1c2UgQ2hhbmdlLUlk
IgoJCWZhaWw9dHJ1ZQoJZmkKCWlmICEgYGdyZXAgLXFpICdeTGluazogaHR0cHM6Ly9wYXRj
aC5tc2dpZC5saW5rLycgJHBgIDsgdGhlbgoJCWlmIGBncmVwIC1xaSAnXkxpbms6JyAkcGAg
OyB0aGVuCgkJCWVjaG8KCQkJZWNobyAiV0FSTklORzogJHA6IFVzZSBvZiBMaW5rIHRhZyIK
CQkJZmFpbD10cnVlCgkJZmkKCWZpCglpZiBgZ3JlcCAtcWkgJ15DYzouKmxpbnV4LW1lZGlh
JyAkcGAgOyB0aGVuCgkJZWNobwoJCWVjaG8gIkVSUk9SOiAkcDogRG9uJ3QgQ2MgbGludXgt
bWVkaWEiCgkJZmFpbD10cnVlCglmaQoJaWYgYGdyZXAgLXFpICdeQ2M6LipodmVya3VpbCcg
JHBgIDsgdGhlbgoJCWVjaG8KCQllY2hvICJXQVJOSU5HOiAkcDogRG9uJ3QgQ2MgSGFucyBW
ZXJrdWlsIgoJCWZhaWw9dHJ1ZQoJZmkKCWlmIGBncmVwIC1xaSAnXkNjOi4qbWNoZWhhYicg
JHBgIDsgdGhlbgoJCWVjaG8KCQllY2hvICJXQVJOSU5HOiAkcDogRG9uJ3QgQ2MgTWF1cm8g
Q2FydmFsaG8gQ2hlaGFiIgoJCWZhaWw9dHJ1ZQoJZmkKCWlmICEgYGdyZXAgLXFpICdeRml4
ZXM6JyAkcGAgOyB0aGVuCgkJaWYgYGdyZXAgLXFpICdeY2M6LipzdGFibGUnICRwYCA7IHRo
ZW4KCQkJZWNobwoJCQllY2hvICJFUlJPUjogJHA6IENjIHRvIHN0YWJsZSwgYnV0IG5vIEZp
eGVzOiB0YWciCgkJCWZhaWw9dHJ1ZQoJCWZpCglmaQoJaWYgISBgZ3JlcCAtcWkgJ15jYzou
KnN0YWJsZScgJHBgIDsgdGhlbgoJCWlmIGBncmVwIC1xaSAnXkZpeGVzOicgJHBgIDsgdGhl
bgoJCQllY2hvCgkJCWVjaG8gIldBUk5JTkc6ICRwOiBGaXhlczogdGFnLCBidXQgbm8gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmciCgkJCWZhaWw9dHJ1ZQoJCWZpCglmaQoJaWYgYGdy
ZXAgLXFpICJeZGlmZiAuKi9ib290L2R0cy8iICRwYCA7IHRoZW4KCQllY2hvCgkJZWNobyAi
V0FSTklORzogJHA6IERldmljZSB0cmVlIGNoYW5nZXMgc2hvdWxkIG5vdCBiZSBwYXJ0IG9m
IHRoZSBtZWRpYSBzdWJzeXN0ZW0iCgkJZmFpbD10cnVlCglmaQpkb25lCgppZiAkZmFpbDsg
dGhlbgoJZWNobwoJZWNobyAnLS0tLS0tLS0tLS0tIEZBSUxVUkVTISAtLS0tLS0tLS0tLS0t
LS0tJwpmaQo=

--------------L5PxckFDv5a7OHrX0bpuCRFY--

