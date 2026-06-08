Return-Path: <linux-media+bounces-64242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LS4RGn4MJ2okqwIAu9opvQ
	(envelope-from <linux-media+bounces-64242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:39:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06516659CB3
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:39:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VdtPmKqP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64242-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64242-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C26AB3007B9C
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 18:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FB53E4C68;
	Mon,  8 Jun 2026 18:39:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84AB3E3C73;
	Mon,  8 Jun 2026 18:39:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943992; cv=none; b=mtwbI5W6oBiElIaLjcCNPAldR+c/AaPug19nFsYfqTsw/5OckXlVHzrYe6JtZpBpBYMfB8Qi0VR01rweM5IBRWjDsox8dTw/RM98+58XvgzFHSEZDOpwfL3mpYy0jxu6q/IDx2I9e2SZNTIjgKqnNZ7QphtT7Xjb2CMQ3lg1CXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943992; c=relaxed/simple;
	bh=eDl99UMrerAAIsjDTb3KiIZXC+bsyxC+y8sPtmMFhKE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=P6tpPS/zTLKYrGAK2tyLHnqiwbZqbILSwKOb/JVrCZnve9H7XyDb4oHtYl8IiW1RrRtbBf/rzvHFHC//10TbyqavHmDwLep3bnTwOlHXVg+wWt1Ux/ohwsC5Qi/1/iOukP9A3eIbOaq+ggFOn+Js3WSDS6HjcV0kXSWQmi8rNfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdtPmKqP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353A01F00893;
	Mon,  8 Jun 2026 18:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780943991;
	bh=eDl99UMrerAAIsjDTb3KiIZXC+bsyxC+y8sPtmMFhKE=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=VdtPmKqP6b8oZT4A4Gon6mW790XcP9ycKqa04vNMBeznenfKSbsOiXASTvfGX1lJz
	 0oI/XrGuDPxzpC4M8wAH41KNZWD7lioRxwGFdG2KExZyqavlgUqa9G1XKz2smqrrlJ
	 cFfTp5epVC48j8S4KPt7z6PZOD0/VI858lrPxW6fPUQemJzYA0hyBJPOgFsNwmLr2Q
	 SkDEfZB+Pu0VkdU6McQpDjhKAS+njLkg/9RSjblPNjNbOVHcHSisFD7D4XZflKSnuG
	 kTp6ZUV8/ekkPb2w01wH2wZCc/mAw8FtVfPEpczgg+G2CGEJdVUeZdTRDt2HaVbTqN
	 SvqxuR0lpUPog==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 20:39:47 +0200
Message-Id: <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
Cc: <phasta@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <dwlsalmeida@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
In-Reply-To: <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-64242-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06516659CB3

On Mon Jun 8, 2026 at 8:32 PM CEST, Christian K=C3=B6nig wrote:
> On 6/8/26 19:59, Danilo Krummrich wrote:
>> On Mon Jun 8, 2026 at 7:34 PM CEST, Christian K=C3=B6nig wrote:
>>> That's why we need the RCU grace period to make sure that nobody is
>>> referencing the driver stuff any more.
>>=20
>> Right, and that's what Philipp tries to address, the requirement to wait=
 for an
>> RCU grace period is perfectly fine if it is only about freeing memory, b=
ut it
>> can become painful if the fence private data contains data also needs to=
 be
>> destructed in some way.
>
> Yeah that makes sense.
>
>> IOW, if a driver signals a fence, it is lifecycle-wise reasonable to des=
truct
>> the private data that is no longer needed (remaining users only deal wit=
h struct
>> dma_fence) and having to wait for a full grace period adds sublety and
>> complication that can be avoided with the proposed approach.
>
> Yeah, I've run into that when I tried to make the amdgpu fences independe=
nt as well.
>> That said, I'd like to ask the opposite question: What are the concerns =
with the
>> proposed approach over (pure) RCU?
>
> Well a) locking inversions and b) performance.
>
> For example the reason why we have the dma_fence_is_signaled() and
> dma_fence_is_signaled_locked() variants is because there is a measurable
> difference in some specific use cases for not grabbing the locks.

I checked for this as well, but couldn't find a case where
dma_fence_is_signaled() is used in a way where it would be performance crit=
ical
to avoid the lock in any way.

Note that the lock is only bypassed when the fence is signaled already (thi=
s
would be preserved) and if signaled() returns false, i.e. dma_fence_signal(=
)
will take the lock anyways.

> I personally find those micro-optimizations rather questionable, but the
> community agreement is that we should have them.

I agree, it is rather questionable. So, I wouldn't make this the deciding f=
actor
unless someone can present a valid case where it actually matters.

> So my take would rather be that the dma_fence_is_signaled_locked() varian=
t
> goes away and we consistently call the ops pointers without holding the
> dma_fence lock and the driver implementations can then optionally take it=
 if
> necessary.

How did you get to this conclusion considering that you run into what I
mentioned above as well and the fact that we seem to agree that the perform=
ance
concern is rather questionable?

