Return-Path: <linux-media+bounces-64889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f6MJCvq3L2o9FAUAu9opvQ
	(envelope-from <linux-media+bounces-64889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:29:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C80668487F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:29:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=RTIihpBk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64889-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64889-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AAC73011841
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B3F3C2B8D;
	Mon, 15 Jun 2026 08:29:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7E3C3BEF;
	Mon, 15 Jun 2026 08:29:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512169; cv=none; b=NYlKXLW4qBR2cOsEIyYGTwDDQbHxNltGAeP1/DspdlhUErQNx1oZEC+bbtcK9kFHRaWh8Qg7yzK4trHDEoyaonImDvgQMU3tndZh1u8oEIWPBrSgTj+MYW2LFZvFsGUr0zJI3Yf1a/jweAC6Rh26IFLZCqfHtiVdx1R8068LS88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512169; c=relaxed/simple;
	bh=LdeAvne+KhmvhZwnd+aiNRdbnOqCBrv2knt+ggglgKY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xju1vjH0hDZ4DHK+rqVB2WF1o03vkxPZkUuAUwt7w8vwqafP8qIPBOeUeJdIIXJXQWSP1horW/ptKFnKzL8fxbIWYPP2Gv/q+bF4VuoCnpswaz9LC1x8ckRtOW4fIyNBf1a1J8Epr6CsIxgIKm3HDkV24GHbRMbRnAk5s9myLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RTIihpBk; arc=none smtp.client-ip=80.241.56.161
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gf3FF57wgz9typ;
	Mon, 15 Jun 2026 10:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781512161; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lEvqAeUxKmIsy9wRoec7qShb0uF4BOCSiCsGM2G9nhg=;
	b=RTIihpBk6ax/Q2S0VoCykT/ZViJnQGj7wL4BFDGsfWhUlhcosxiG7WNUOa8r+76CuPc18f
	G9uPrwwTcnGncoMfGxGBSqHduGa8luEZy5U/EBwlV60R8GHEcZzWZRPp8Cr2GV/Oda2rll
	g9CCBtIbdORieG4kvW7QiAYlXjghLFSgO0iafN3c8N+I4cv7fZHEsBnVT+zfK9/CjTu5B6
	nymkSQ1c988SR1N8IvwoiGjo67r/v2RlDSM87mKOigpnoXAjM75gOLL9yLtA4YULayjnjF
	VjaI2G7+QggZkXuKHjbZ4iMzjpxT6z7EQp/mNcNK8o6GrMCF+pwGoaEhqHtm0w==
Message-ID: <fa0dc9757bf8343516c4b156a2b70ec91b64ef8f.camel@mailbox.org>
Subject: Properly synchronize dma_fence->signaled bit (Was: Re: [RFC PATCH]
 dma-fence: Fix races of fence callbacks versus destructors by locking)
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Boris
 Brezillon	 <boris.brezillon@collabora.com>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>, Gary Guo
 <gary@garyguo.net>, Tvrtko Ursulin	 <tvrtko.ursulin@igalia.com>,
 linux-media@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon, 15 Jun 2026 10:29:16 +0200
In-Reply-To: <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
	 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
	 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
	 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
	 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 6086604dc72c2201643
X-MBO-RS-META: 14ux6w14mjcr1uk7qf8nzuyosu8jfsdh
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64889-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:dakr@kernel.org,m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C80668487F

On Mon, 2026-06-08 at 20:32 +0200, Christian K=C3=B6nig wrote:
> On 6/8/26 19:59, Danilo Krummrich wrote:
> > On Mon Jun 8, 2026 at 7:34 PM CEST, Christian K=C3=B6nig wrote:
> > > That's why we need the RCU grace period to make sure that nobody
> > > is
> > > referencing the driver stuff any more.
> >=20
> > Right, and that's what Philipp tries to address, the requirement to
> > wait for an
> > RCU grace period is perfectly fine if it is only about freeing
> > memory, but it
> > can become painful if the fence private data contains data also
> > needs to be
> > destructed in some way.
>=20
> Yeah that makes sense.
>=20
> > IOW, if a driver signals a fence, it is lifecycle-wise reasonable
> > to destruct
> > the private data that is no longer needed (remaining users only
> > deal with struct
> > dma_fence) and having to wait for a full grace period adds sublety
> > and
> > complication that can be avoided with the proposed approach.
>=20
> Yeah, I've run into that when I tried to make the amdgpu fences
> independent as well.
> > That said, I'd like to ask the opposite question: What are the
> > concerns with the
> > proposed approach over (pure) RCU?
>=20
> For example the reason why we have the dma_fence_is_signaled() and
> dma_fence_is_signaled_locked() variants is because there is a
> measurable difference in some specific use cases for not grabbing the
> locks.

Yeah, certainly, not taking locks makes your code go faster. drm_sched
can sing a song about that -.-

>=20
> I personally find those micro-optimizations rather questionable, but
> the community agreement is that we should have them.

Yeah so this is most definitely broken and needs to be removed. Proof
is that various parties already need to work around that issue. You
just never know what drivers do. It's very conceivable that the Nouveau
case will often happen:

if (dma_fence_is_signaled(f))
  dma_fence_put(f);


This fast path check in my mind certainly breaks the intended dma_fence
design:

void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
				      ktime_t timestamp)
{
	const struct dma_fence_ops *ops;
	struct dma_fence_cb *cur, *tmp;
	struct list_head cb_list;

	dma_fence_assert_held(fence);

	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
				      &fence->flags)))
		return;


Modifying the bit is consistently done under lock protection, so
reading must be done, too.

Do you remember who wanted those fast path checks? Who is spinning on
that lock?


In any case, that needs to be repaired. A hacky lockless way might
hypothetically be doable by setting barriers, as I suggest here:

https://lore.kernel.org/dri-devel/20260612104251.2264707-2-phasta@kernel.or=
g/

But note that the ops-decoupling in e.g. dma_fence_timeline_name()
already depends on lockless ordering mechanisms in
dma_fence_signal_timestamp_locked(). So we're already a bit fragile
here.

>=20
> So my take would rather be that the dma_fence_is_signaled_locked()
> variant goes away and we consistently call the ops pointers without
> holding the dma_fence lock and the driver implementations can then
> optionally take it if necessary.

That might work.

>=20
> I think for this we would just need to replace most calls to
> dma_fence_is_signaled_locked() with dma_fence_test_signaled().

That would not fix the cleanup race in Nouveau.

I do get the idealistic idea of fence->signaled really just
representing whether the hardware is done, without any further
guarantees, but having this fast-path lockless magic in functions
checking the signaled state is really asking for trouble.

So it would seem that both dma_fence_is_signaled() and
dma_fence_test_signaled_flag() need to be properly synchronized.


P.

>=20
> In the long term that would also allow cleaning up the container
> handling and simplifying the DRM scheduler a bit.
>=20
> Regards,
> Christian.

