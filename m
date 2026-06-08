Return-Path: <linux-media+bounces-64246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 603xDR0XJ2r6rQIAu9opvQ
	(envelope-from <linux-media+bounces-64246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 21:25:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B44F65A0A2
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 21:25:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ivb9agvl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64246-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64246-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8336F3021D0D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 19:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C813E5EF9;
	Mon,  8 Jun 2026 19:25:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3138CFE8;
	Mon,  8 Jun 2026 19:25:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946713; cv=none; b=PiHBoiLSJmCwizSihouBCqE+kkencQ5j9HJrsNz4anEbOAw2bTv7GlbzvC/gc/iGbXEpVyDm3SPtRnnSlSoi5VZ/7O60bI8SH1Rdv89qqOUy5JpWwYyGnLOYZMgH2EkarHWrp7t6o9qqW9rfeBwBCej0Fwr/t4SbyDQ1Jni+FsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946713; c=relaxed/simple;
	bh=auX2HM5NtgXhputsYT5ZWLFsqVm2QhV7YdbEijkwlEc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=j+RiyjHFr0cgnr3bAJCHCA9gwsSzksuvr1VHBrrnJEO7Y5INwxkP/0xHaF0EFkhPjAfIw4Mqj6VPrciUoxKbhvFCr1+F/544HTQU9yMOK1G7xDqVCmYdhbWpv8nnhxcBMMbbsghdvxKSPRCdeGEX845wyBPhdiQCmm6Efevnfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ivb9agvl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6956A1F00893;
	Mon,  8 Jun 2026 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780946712;
	bh=WJz3MJPOE1lOzWxCcqng0uNSK7MugGP6R4j3ZEdICks=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Ivb9agvlec8d9jxRo8VNahEC44WFPL9pcV8rn6L1jq9FcZGXFENHvDRTxFwA+yiSR
	 V2S6MXY86sYOC19/RWtm6syAfMbAIXlI4TXW28mBqEQV+jaCUNcVdXpUj8jD33y0lL
	 DoAoQb9lxhjRuex3+wvjMTtCAaQyuvzPcORLpY/BZqtjgCAaNrLGfTYOLxLF88Ya8G
	 UGa7YmoBZ+53x4GzFu76skUNjua5W9XRF2PmWqoMtivHl7dqrduSQaBxtki7IcT7HF
	 ejcKuwC4DUfoL5ZDNyQuYTk8kLXevFdZH/j07gX+xbr+yuX4NHzhMSmCu/djjdnmZ/
	 OaP1awiRj9RHA==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 21:25:08 +0200
Message-Id: <DJ3WX3B6MYBN.2L8NIJ1ELIYJ8@kernel.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
Cc: <phasta@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <dwlsalmeida@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
In-Reply-To: <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-64246-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B44F65A0A2

On Mon Jun 8, 2026 at 8:47 PM CEST, Christian K=C3=B6nig wrote:
> On 6/8/26 20:39, Danilo Krummrich wrote:
>> On Mon Jun 8, 2026 at 8:32 PM CEST, Christian K=C3=B6nig wrote:
>>> On 6/8/26 19:59, Danilo Krummrich wrote:
>>>> On Mon Jun 8, 2026 at 7:34 PM CEST, Christian K=C3=B6nig wrote:
>>>>> That's why we need the RCU grace period to make sure that nobody is
>>>>> referencing the driver stuff any more.
>>>>
>>>> Right, and that's what Philipp tries to address, the requirement to wa=
it for an
>>>> RCU grace period is perfectly fine if it is only about freeing memory,=
 but it
>>>> can become painful if the fence private data contains data also needs =
to be
>>>> destructed in some way.
>>>
>>> Yeah that makes sense.
>>>
>>>> IOW, if a driver signals a fence, it is lifecycle-wise reasonable to d=
estruct
>>>> the private data that is no longer needed (remaining users only deal w=
ith struct
>>>> dma_fence) and having to wait for a full grace period adds sublety and
>>>> complication that can be avoided with the proposed approach.
>>>
>>> Yeah, I've run into that when I tried to make the amdgpu fences indepen=
dent as well.
>>>> That said, I'd like to ask the opposite question: What are the concern=
s with the
>>>> proposed approach over (pure) RCU?
>>>
>>> Well a) locking inversions and b) performance.
>>>
>>> For example the reason why we have the dma_fence_is_signaled() and
>>> dma_fence_is_signaled_locked() variants is because there is a measurabl=
e
>>> difference in some specific use cases for not grabbing the locks.
>>=20
>> I checked for this as well, but couldn't find a case where
>> dma_fence_is_signaled() is used in a way where it would be performance c=
ritical
>> to avoid the lock in any way.
>>=20
>> Note that the lock is only bypassed when the fence is signaled already (=
this
>> would be preserved) and if signaled() returns false, i.e. dma_fence_sign=
al()
>> will take the lock anyways.
>>=20
>>> I personally find those micro-optimizations rather questionable, but th=
e
>>> community agreement is that we should have them.
>>=20
>> I agree, it is rather questionable. So, I wouldn't make this the decidin=
g factor
>> unless someone can present a valid case where it actually matters.
>>=20
>>> So my take would rather be that the dma_fence_is_signaled_locked() vari=
ant
>>> goes away and we consistently call the ops pointers without holding the
>>> dma_fence lock and the driver implementations can then optionally take =
it if
>>> necessary.
>>=20
>> How did you get to this conclusion considering that you run into what I
>> mentioned above as well and the fact that we seem to agree that the perf=
ormance
>> concern is rather questionable?
>
> Quite simple, it's the cleaner approach.

I would maybe agree iff the RCU read side critical section wouldn't be need=
ed
and we wouldn't need to deal with the consequences of having to defer
everything.

And so far it seems to me that there isn't really any other reason that the
performance concern we both don't buy into.

> Calling callbacks with locks held is rather questionable even putting the
> performance issue aside.

In general, I don't think that more flexibility for drivers is automaticall=
y
always superior.

Also, before we keep calling it a performance issue, I'd really love to kno=
w
where dma_fence_is_signaled() is called in a case where it returns false an=
d the
spinlock causes such an overhead that it actually matters.

(As mentioned above, none of the cases where it returns true would change.)

> In detail calling the callbacks without holding locks allows all
> implementations who need it to explicitly take locks in the order they wa=
nt.

I don't think this is true in this case.

  1) The existence of dma_fence_is_signaled_locked() already mandates that =
all
     such callbacks must work properly if called with the fence lock held.

  2) The RCU read side critical section already mandates that driver must n=
ot
     sleep within the callback.

> If you call it with the lock held you enforce the fence lock the be the
> outermost lock.

That's practically already the case, due to dma_fence_is_signaled_locked().

