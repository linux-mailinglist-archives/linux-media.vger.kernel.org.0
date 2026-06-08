Return-Path: <linux-media+bounces-64222-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hsxqDejrJmrXnAIAu9opvQ
	(envelope-from <linux-media+bounces-64222-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:20:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E106E658A44
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:20:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bsqFJjLm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64222-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64222-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12C9A3395E75
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337A6285CAD;
	Mon,  8 Jun 2026 15:41:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9D331E82F;
	Mon,  8 Jun 2026 15:41:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933300; cv=none; b=RuqD0D1CGfnjEO2ALIae5lQ/4nySbUONKYUc5BU5kHGiO1ayzLy6kIGNdMLwEEI37rhohzEoc9Gyk6vCAS2fJIcb/PI/Rb+V5BthK70sTK8gx3Kmw3CgiWjGNxAc8ndTmw+QBFgnDKNdq+PswlBOQtDQqke3WbEzq3kezfC+Ajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933300; c=relaxed/simple;
	bh=/xU9hbVfPJB+rwvbuINmS7R1c202Y2unhqFJULXpl7c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uDIKkvyYpyYgz8f+aRiK5FZI0R75Z0c5uCPuhkb49QnseUimf/kRtlDCBoV626I9OqsuV9RoUdRPCyoQhbUk5IVn7Z6EwoQReak7KvekcDTZKi+Iam+QGuAz5waptmwg/bI2J9pc9mgADjBt1FriM0RsllXgTtmDfvtQ19LTuTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bsqFJjLm; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gYx9C21dnz9tF2;
	Mon,  8 Jun 2026 17:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780933295; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/n93OVN0OBZymLyeMzrxKX1SjKNrjZM+CA4BofRCGM=;
	b=bsqFJjLmtqFvBBDB6Wcseg0z4mPhEmcgVfGtQfoQKknl91tQ/D6BSiYIM1C6oPb3W0o2/l
	uH/fKyfcaI8RVvLYGmGOiFgUvrG7ie/gvbrgAFqWuXI1nzqtBcsYx4vUPWFFcRu5J48At9
	0EErSdFsQsKrAIlmA2oenxlDbQkWWjLpJSyhDq38nJu0/ExvKJK5BXZh7gO+Z1iLoR8M5g
	dEAnGorvQqqXjddiiZHKqB9b+vFKZ0xXQc0UzicJlbJQqbCh7Qg3VyR2qSzdC6nJkLCYJj
	Hd9OBZNk9hKG3FZllPFvElddJXcf/b4+WYTXyW5GOcq1B6RQx5CPCTunerGmBQ==
Message-ID: <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Boris
 Brezillon	 <boris.brezillon@collabora.com>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>, Gary Guo
 <gary@garyguo.net>, Tvrtko Ursulin	 <tvrtko.ursulin@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Date: Mon, 08 Jun 2026 17:41:31 +0200
In-Reply-To: <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 2b0f51029192d8410ea
X-MBO-RS-META: rdqnwfxpr89366ayc8zgswfgsgjb9xod
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64222-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E106E658A44

On Mon, 2026-06-08 at 17:35 +0200, Christian K=C3=B6nig wrote:
> On 6/8/26 16:24, Philipp Stanner wrote:
> > The dma_fence backend_ops can access a fence. Hereby, a driver callback
> > will be running which likely will access driver specific data through
> > container_of(). If now, simultaneously, a driver signals the fence and
> > afterwards expects to run a driver specific destructor (using the same
> > data accessed through container_of()), there can be a race.
> >=20
> > A driver very likely trusts that once it has signaled a fence, no one
> > will be accessing it anymore. Moreover, it might already want to free u=
p
> > resources, making UAF bugs possible.
> >=20
> > The race occurs because there are only pragmatic checks for the signale=
d
> > flag of a fence, without taking the fence lock. RCU guards exist, but
> > their purpose is to guard accesses through the backend_ops callbacks
> > against the driver (which implements the TEXT segment these callbacks
> > live in) from unloading.
> >=20
> > Proper synchronization can be ensured by taking the fence lock. RCU is
> > still simultaneously required to guard against the unload.
> >=20
> > Fix the races by taking the lock for all non-deprecated backend_ops
> > callbacks.
>=20
> That sounds like the fundamentally wrong approach to me.
>=20
> The lock protects the dma_fence signaling state and *NOT* any driver
> state, so it should not be used to protect any driver state.
>=20
> Drivers need to make sure that they protect their driver state with
> separate lock and don't rely on the dma_fence lock for this. This is
> actually the core of why we want to deprecate the shared dma_fence
> spinlock.

It's not so much about protecting data, it's about correctness:

A driver that calls

dma_fence_signal(f)

expects that after signalling, no callback will be running into the
driver again. It's a fix synchronization point.

Only the fence lock can grant such synchronization.

Positive effects would be:

1. Drivers can do their cleanup immediately, without having to wait for
a grace period

2. Drivers could be sure that their driver_fence data, allocated
together with fence and accessed through container_of(fence), is not
being accessed anymore.


I see only advantages. Safer, faster. :)

P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > Conveniently, this also fixes a race where backend_ops->set_deadline()
> > might try to set a deadline for an already signaled fence.
> >=20
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > We discovered this problem through our Rust abstractions, but it can
> > also occur in C.
> >=20
> > The by far cleanest solution seems to be to use the fence lock. This RF=
C
> > serves to discuss whether there is anything preventing that.
> >=20
> > (Patch so far just compile tested, to have some groundlayer for the
> > rough idea, to discuss it first)
> > ---
> > =C2=A0drivers/dma-buf/dma-fence.c | 39 ++++++++++++++++++++++++++++----=
-----
> > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 | 17 ++++++++++++----
> > =C2=A02 files changed, 43 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index c7ea1e75d38a..b74f02f3cca8 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -629,7 +629,8 @@ EXPORT_SYMBOL(dma_fence_free);
> > =C2=A0static bool __dma_fence_enable_signaling(struct dma_fence *fence)
> > =C2=A0{
> > =C2=A0	const struct dma_fence_ops *ops;
> > -	bool was_set;
> > +	bool was_set, success;
> > +	unsigned long flags;
> > =C2=A0
> > =C2=A0	dma_fence_assert_held(fence);
> > =C2=A0
> > @@ -644,7 +645,10 @@ static bool __dma_fence_enable_signaling(struct dm=
a_fence *fence)
> > =C2=A0	if (!was_set && ops && ops->enable_signaling) {
> > =C2=A0		trace_dma_fence_enable_signal(fence);
> > =C2=A0
> > -		if (!ops->enable_signaling(fence)) {
> > +		dma_fence_lock_irqsave(fence, flags);
> > +		success =3D ops->enable_signaling(fence);
> > +		dma_fence_unlock_irqrestore(fence, flags);
> > +		if (!success) {
> > =C2=A0			rcu_read_unlock();
> > =C2=A0			dma_fence_signal_locked(fence);
> > =C2=A0			return false;
> > @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > =C2=A0void dma_fence_set_deadline(struct dma_fence *fence, ktime_t dead=
line)
> > =C2=A0{
> > =C2=A0	const struct dma_fence_ops *ops;
> > +	unsigned long flags;
> > =C2=A0
> > =C2=A0	rcu_read_lock();
> > =C2=A0	ops =3D rcu_dereference(fence->ops);
> > -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> > +	if (!ops || !ops->set_deadline) {
> > +		rcu_read_unlock();
> > +		return;
> > +	}
> > +
> > +	dma_fence_lock_irqsave(fence, flags);
> > +	if (!dma_fence_is_signaled_locked(fence))
> > =C2=A0		ops->set_deadline(fence, deadline);
> > +
> > +	dma_fence_unlock_irqrestore(fence, flags);
> > =C2=A0	rcu_read_unlock();
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(dma_fence_set_deadline);
> > @@ -1166,14 +1179,18 @@ EXPORT_SYMBOL(dma_fence_init64);
> > =C2=A0 */
> > =C2=A0const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
> > =C2=A0{
> > +	const char __rcu *name =3D "detached-driver";
> > =C2=A0	const struct dma_fence_ops *ops;
> > +	unsigned long flags;
> > =C2=A0
> > =C2=A0	/* RCU protection is required for safe access to returned string=
 */
> > =C2=A0	ops =3D rcu_dereference(fence->ops);
> > +	dma_fence_lock_irqsave(fence, flags);
> > =C2=A0	if (!dma_fence_test_signaled_flag(fence))
> > -		return (const char __rcu *)ops->get_driver_name(fence);
> > -	else
> > -		return (const char __rcu *)"detached-driver";
> > +		name =3D ops->get_driver_name(fence);
> > +	dma_fence_unlock_irqrestore(fence, flags);
> > +
> > +	return name;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(dma_fence_driver_name);
> > =C2=A0
> > @@ -1199,13 +1216,17 @@ EXPORT_SYMBOL(dma_fence_driver_name);
> > =C2=A0 */
> > =C2=A0const char __rcu *dma_fence_timeline_name(struct dma_fence *fence=
)
> > =C2=A0{
> > +	const char __rcu *name =3D "signaled-timeline";
> > =C2=A0	const struct dma_fence_ops *ops;
> > +	unsigned long flags;
> > =C2=A0
> > =C2=A0	/* RCU protection is required for safe access to returned string=
 */
> > =C2=A0	ops =3D rcu_dereference(fence->ops);
> > +	dma_fence_lock_irqsave(fence, flags);
> > =C2=A0	if (!dma_fence_test_signaled_flag(fence))
> > -		return (const char __rcu *)ops->get_driver_name(fence);
> > -	else
> > -		return (const char __rcu *)"signaled-timeline";
> > +		name =3D ops->get_driver_name(fence);
> > +	dma_fence_unlock_irqrestore(fence, flags);
> > +
> > +	return name;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(dma_fence_timeline_name);
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index b52ab692b22e..b93c3f7f69fb 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -547,20 +547,29 @@ static inline bool
> > =C2=A0dma_fence_is_signaled(struct dma_fence *fence)
> > =C2=A0{
> > =C2=A0	const struct dma_fence_ops *ops;
> > +	unsigned long flags;
> > +	bool signaled;
> > =C2=A0
> > =C2=A0	if (dma_fence_test_signaled_flag(fence))
> > =C2=A0		return true;
> > =C2=A0
> > =C2=A0	rcu_read_lock();
> > =C2=A0	ops =3D rcu_dereference(fence->ops);
> > -	if (ops && ops->signaled && ops->signaled(fence)) {
> > +	if (!ops || !ops->signaled) {
> > =C2=A0		rcu_read_unlock();
> > -		dma_fence_signal(fence);
> > -		return true;
> > +		return false;
> > =C2=A0	}
> > +
> > +	dma_fence_lock_irqsave(fence, flags);
> > +	signaled =3D ops->signaled(fence);
> > +
> > +	if (signaled)
> > +		dma_fence_signal_locked(fence);
> > +
> > +	dma_fence_unlock_irqrestore(fence, flags);
> > =C2=A0	rcu_read_unlock();
> > =C2=A0
> > -	return false;
> > +	return signaled;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**

