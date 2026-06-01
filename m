Return-Path: <linux-media+bounces-63263-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFdZBCiKHWrAbQkAu9opvQ
	(envelope-from <linux-media+bounces-63263-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:33:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65723620150
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 335463092F3B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9723ACF06;
	Mon,  1 Jun 2026 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gB+ixUoO"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B723AC0F3
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320649; cv=none; b=K2duTXtkrDuimBNOkGRM+l6dMVRwvdeG5aou6nqphcU3xF1IVX3UkDEk2ai+Ezc1yFMsvjy1zA4YrEw9fSOWjEGmOgWsFC8VrWUCq8ab5e02yI+5P7GR27UVzihhgYwTC1Ti4cyYTfmjwygw3c8yuTzJ6cnmnPjPnr59+2ssazM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320649; c=relaxed/simple;
	bh=8od38mN8RGoPUTqcetnFeVT6MlcYS3uqlzPU8Aid2DA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E0TahE5KkugdjlLE9OONk0AquMMC004NqJsub2qVdSjo79sAAg39EckjDv1UyYR3elbqy/GgUxvZhgif7yeO4APZbOaBBzQ3vLw0kDXeerEH1m16fxs+AizTAeU4EcDEwo27/IaXCG/IiusQbgBw5jyZq4S+zNXTpZvSj2/bL50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gB+ixUoO; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gTZbR0sV0z9txV;
	Mon,  1 Jun 2026 15:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780320643; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUA6+vSRcRGCo2mXauDXESLTiUY0t5EjlzPqXhMCfaE=;
	b=gB+ixUoOKuA+JLTSFS00U5QDrEUCY9lIEOPtKefgVSgMrvg8gNO7ngRajooDrT5iVLIB3y
	vrOtrfid4GGVl+A6m2Yj4wS23vJKPtHWaRKIBQE/hqpkBa7fIpZPR8qvbtEonvvrdwlolL
	y4ZK3xiINeM6WJkxCCiPn1dnMy+hRbKcKD5GsnhmtEDgKTmm7cAYb0Q4WOukPDjpmGK0Zs
	gXy87bOK2Zjohe2j5MkZdZHlcvI4RrXG1fbvgkm/TLBjGGRhMMLD8LLv8W3bb9jWHP2XOq
	xicmIO/vHlAOKMB0GrRj+DcTBZ2OZzEkZTNuufOzTDuo72sUUAyzi+436myyYw==
Message-ID: <88fa86984dbc8a11bb9f4d1af76a1ba0d942136f.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, 01 Jun 2026 15:30:38 +0200
In-Reply-To: <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
References: <20260530143541.229628-5-phasta@kernel.org>
		 <20260530150622.393FC1F00893@smtp.kernel.org>
	 <ah1c3NSU-4UkdUhb@google.com>
		 <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
		 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
	 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: nh9kcw14h8q57rginwga3c3o9jg1j7z5
X-MBO-RS-ID: 34be4622bcf030201fb
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-63263-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,data.data:url];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: 65723620150
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-06-01 at 15:14 +0200, Philipp Stanner wrote:
> +Cc Boris
>=20
> On Mon, 2026-06-01 at 14:55 +0200, Alice Ryhl wrote:
> > On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@mailbox.=
org> wrote:
> > >=20
> > > On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > > > On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.org=C2=
=A0wrote:
> > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fenc=
e {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid be=
cause `self` is valid.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D =
unsafe { &mut *self.data.as_ptr() };
> > > > >=20
> > > > > [Severity: High]
> > > > > Does this create an exclusive mutable reference to actively share=
d memory?
> > > > >=20
> > > > > DriverFenceData can be accessed concurrently by other threads hol=
ding Fence
> > > > > references (for instance, when checking if the fence is signaled)=
. Creating
> > > > > a mutable reference (&mut) in Rust asserts exclusive access and v=
iolates
> > > > > aliasing rules, which allows the compiler to make invalid optimiz=
ation
> > > > > assumptions.
> > > > >=20
> > > > > Could this use an immutable reference &*self.data.as_ptr() instea=
d?
> > > >=20
> > > > Yes, please use an immutable reference here.
> > > >=20
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.inner.in=
ner.get()
> > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > [ ... ]
> > > > >=20
> > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fenc=
e {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid be=
cause `self` is valid.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D =
unsafe { &mut *self.data.as_ptr() };
> > > > >=20
> > > > > [Severity: High]
> > > > > Similar to DriverFence::as_raw(), does this also incorrectly crea=
te a
> > > > > mutable reference to shared data?
> > > >=20
> > > > Here as well.
> > >=20
> > > `data` is not shared. By design there is only ever one DriverFence, a=
nd
> > > the driver's data (`data.data`) is `Sync`.
> > >=20
> > > But I guess an immutable one should do the trick, too.
> >=20
> > There's only one DriverFence, but I can perform shared access to that
> > one DriverFence from two threads in parallel. You made the type Sync,
> > and this is what you are allowing when you do so.
>=20
> Nope, DriverFence is just Send, not Sync.
>=20
> data.data is Sync, but `data` in the code above is not the actual user
> data, but the memory backing it up.
>=20
> >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_signal_locked(fence);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.da=
ta` is owned by the DriverFence, but could be accessed
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through some dma=
_fence callbacks right now. Access is being revoked
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above by signall=
ing the fence. The DriverFenceAllowedData trait
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures that the=
 data either does not need drop, or if it does it
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lives in a RcuBo=
x which will delay dropping by one grace period, hence
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that al=
l readers have disappeared.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_pl=
ace(self.data.as_ptr()) };
> > > > >=20
> > > > > [Severity: Critical]
> > > > > Could this eagerly drop FenceCtx and user data before the C dma_f=
ence
> > > > > refcount reaches 0?
> > > > >=20
> > > > > The C dma_fence object can remain alive as long as consumers (lik=
e sync_file
> > > > > or the GPU scheduler) hold references to it. If the backend later=
 invokes
> > > > > callbacks like ops->get_driver_name(), FenceCtx::get_driver_name(=
) would
> > > > > attempt to read fctx.driver_name from the already-dropped FenceCt=
x:
> > > > >=20
> > > > > FenceCtx::get_driver_name() {
> > > > > =C2=A0=C2=A0=C2=A0 ...
> > > > > =C2=A0=C2=A0=C2=A0 fctx.driver_name.as_char_ptr()
> > > > > }
> > > > >=20
> > > > > Can this result in a use-after-free?
> > > >=20
> > > > Hmm, I don't know about what sahisko said, but I don't think this i=
s the
> > > > right way to do rcu freeing. I think the type's destructor should b=
e
> > > > reserved for cases where the value becomes immediately unusable.
> > >=20
> > > We could guard the strings with RcuBox, but we could not then guard t=
he
> > > FenceCtx code against code UAF if we don't have the rcu_barrier().
> > >=20
> > > Or could we?
> > >=20
> > > If a rust module unloads, module::remove() should contain an
> > > rcu_barrier() (right??). Would that be enough to guard against the
> > > FenceCtx code being unloaded?
> > >=20
> > > >=20
> > > > For example, let's say I'm using RcuBox<_> here. Yes, the data you =
get
> > > > from dereferencing the RcuBox will stay alive for a grace period, b=
ut
> > > > IMO once you run the destructor of the box itself, the *pointer* be=
comes
> > > > immediately unusable.
> > >=20
> > > I don't know why you're stressing the pointer?
> > >=20
> > > The trick above is simply that drop / dealloc *and* code unloading is
> > > delayed by a grace period.
> >=20
> > Sorry let me try to rephrase. I'm not worried about the stuff behind
> > the pointer. After all, you're using RcuBox to protect that stuff.
> > What I'm worried about is the pointer itself. You invoked
> > drop_in_place() on the pointer to the fence context,
> >=20
>=20
> on the pointer to DriverFenceData, which contains a refcount to the
> FenceCtx, which might then want to drop.
>=20
> > =C2=A0so even though
> > the fence context may be valid for another grace period, the *pointer*
> > to the fence context is not. The pointer could have been zeroed by the
> > destructor.
>=20
> That particular pointer to the DriverFenceData could have been zeroed.
> But potential other accessors have already crafted themselves a new
> pointer to the, by the power of RCU, still valid data.
>=20

correction:
it is refcounting that ensures the memory is still valid.

dma_fence_put() in DriverFence::drop() could earliest free the memory.

P.


>  That new pointer
> is container-of-ed from struct dma_fence *f.
>=20
> >=20
> > Actually maybe I am worried about the strings too. Let's say that one
> > thread does:
> >=20
> > rcu_read_lock()
> > get_driver_name()
> > // .. read the driver name
> > rcu_read_unlock()
> >=20
> > and another thread signals the fence. If there are no queued
> > call_rcu() callbacks right now, then the rcu_barrier() could be a
> > no-op and the rcu reader will UAF on the driver name. It looks like
> > you need synchronize_rcu() rather than rcu_barrier() here?
>=20
> It would seem to me that you are right.
>=20
> Boris, do you have an opinion on that?
>=20
>=20
> P.
>=20
> >=20
> > Alice

