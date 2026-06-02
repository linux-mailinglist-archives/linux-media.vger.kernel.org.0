Return-Path: <linux-media+bounces-63404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qiS1OPf4HmqgbAAAu9opvQ
	(envelope-from <linux-media+bounces-63404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 17:38:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A6062FDBD
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 17:38:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=WYHZ3Oxq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63404-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63404-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B723031064A2
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 15:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E8D3F58D7;
	Tue,  2 Jun 2026 15:26:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026FA3F4DF3
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 15:26:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413963; cv=none; b=IIRvf5NZ7JB+4xz1iZ0lohE+jZqijZuxbvjaqPebOedlWWkwVwXVwe/frPfRCqLJzP9H4DpRQo1k8XwDssRKNjHl2CbmDdX+b1+mEoMOGH57PLiP8bvOHDkHtT42MNNN7YY/gV+PKVnQGpqD//i0n/Ih0NItwiCKTZzdCEUZJJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413963; c=relaxed/simple;
	bh=y8rEaWZCBEKzanHwnNKGt1CKQ4dZPxVr2FzmU5HEgZc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NK4QPi41nrriJPwUbCff2LVYVBfSHuc5oRirIPLsgTDx8fOSTX8tD0YaCY4IZ9g6ETVhG9qKZx3oKWc0HWXDd0+gA3H4nYh7zq4GPoP4QIRe5OjXIosSrS9F//jeLmAhLIfr0Opc4JdzuXLU0onOnkgfm2H0zBLkOr1yUySQOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WYHZ3Oxq; arc=none smtp.client-ip=209.85.128.73
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso21099375e9.2
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780413960; x=1781018760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yObXopdfsMeNp3bqukMy+yTX5tM6g5h3WqxPPuNrZak=;
        b=WYHZ3Oxq2gHJBohYfNV697Q4JX9Vf8dOCHqdt++BsFq/gkqXvdTYrguLy04fefdcrD
         E7EKhHTtQl1kWqSV1h6sshpIz/fWc8AX7yQqeg7AofFCF47Drjvu50TFntC7IPSeAqww
         PKDvDaMSI3+zWTy46mxx+G9filWvwOrxmvihfLOos8nK/HX9tr7QmQcSdPrRWscNLNmi
         X8Ih9cIIlqu2al/x9CGzbtphZCzeA9SWuXgea7vzfISd22FgkxPs23WFqy/WkbN3G6vY
         hi8ENCMbZC558le01rQYmcQ0IojpwTqgP55lmM/FfrfM+DcqKn8ya5gF/bZKjmOUZsu4
         TAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413960; x=1781018760;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yObXopdfsMeNp3bqukMy+yTX5tM6g5h3WqxPPuNrZak=;
        b=mOvgX/rI0Z6BgLUwPoqjFDGc7uhDzdwEpIEfU6c2IX9dAiW7aOyAihb+Xa1CMuitoP
         s31Pf7Smz5zF6DJ4NpgmQ9kgQGgir8z0uVoraWPI5n6m1dSEimVxkdTQLkkBPDVCqHXf
         MGxWAqkhfzUfmL1uTdMa9b5pFm76UJhx0KAngvhyvaGujRZrXLSfrTfIwdYiuH0i5NAm
         St0fK2POQ2mcKJVYzSehVBD0juXrRgMTywbm9bdHMbgZ/amkHfwtYYz8ZwxxMkOvZvCt
         vnW1oLAuQG1xEU4iGsH0e20E0NMz+b1WBwPykRYLBxwaD8/MAaDZ7wuiKhnGu59B0Bvf
         f2OA==
X-Forwarded-Encrypted: i=1; AFNElJ9PUfIFyaztSgHnmoQoZqVMkY605LPfUf5OLRdES7Xmp0DDixA1bkr67cXNQycrsacD+vS4NAZicHZjqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRgaJ/cKvGx2oNrPhNHJZtqrNKO1yDi/SN+U1y1n4JfWf5yDYi
	M4Thk3cEuCjgFJ9iY7vhDxCL83NAWVg5yEWvO40nmahYauJ390ZecJKPAA8+2nf48RAStab2DmM
	eH/bY1WWoE0qabF3EeA==
X-Received: from wmbjt21.prod.google.com ([2002:a05:600c:5695:b0:490:4995:a7d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5394:b0:490:af90:f9c2 with SMTP id 5b1f17b1804b1-490b5073c0emr3886495e9.12.1780413960230;
 Tue, 02 Jun 2026 08:26:00 -0700 (PDT)
Date: Tue, 2 Jun 2026 15:25:58 +0000
In-Reply-To: <4bf6e916efe54bab66defda6fffea8c41358b3cc.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ah1c3NSU-4UkdUhb@google.com> <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
 <ah2M2a_4PneZpjTS@google.com> <16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
 <ah7CGySkyE7mSM8a@google.com> <7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
 <ah7FjDdU6zt65qId@google.com> <4bf6e916efe54bab66defda6fffea8c41358b3cc.camel@mailbox.org>
Message-ID: <ah72Bi2Q5Wpgo2kE@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63404-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48A6062FDBD

On Tue, Jun 02, 2026 at 02:06:43PM +0200, Philipp Stanner wrote:
> On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote:
> > On=20
>=20
> [=E2=80=A6]
>=20
> > > >=20
> > > > If you don't implement Sync, then DriverFence cannot be stored in a=
n
> > > > Arc. I wouldn't take away that ability unless you have to, and I do=
n't
> > > > see anything in the DriverFence API that would mean you can't do th=
at.
> > >=20
> > > Nope. We explicitly agreed on this design.
> > >=20
> > > Just 1 DriverFence. Just 1 party that can signal it.
> > > Note that we also agreed upon the Driverfence disappearing with
> > > .signal(), which certainly prevents several from existing, unless you
> > > do an Option.take()
> >=20
> > I would like to clarify that I'm not suggesting any changes to the
> > design. Implementing Sync is not the same as having multiple driver
> > fences.
>=20
> I mean, I guess one can do that. But it's up to the driver then to see ho=
w it can signal its fence.

I don't believe Sync changes anything with that regard. The signal
method takes 'self', but the Sync trait only affects how '&self' methods
can be called.

> > > > > > > > =C2=A0so even though
> > > > > > > > the fence context may be valid for another grace period, th=
e *pointer*
> > > > > > > > to the fence context is not. The pointer could have been ze=
roed by the
> > > > > > > > destructor.
> > > > > > >=20
> > > > > > > That particular pointer to the DriverFenceData could have bee=
n zeroed.
> > > > > > > But potential other accessors have already crafted themselves=
 a new
> > > > > > > pointer to the, by the power of RCU, still valid data. That n=
ew pointer
> > > > > > > is container-of-ed from struct dma_fence *f.
> > > > > >=20
> > > > > > I'm not talking about the pointer to DriverFenceData, I'm talki=
ng about
> > > > > > the pointer to the FenceCtx, or the pointer to the data (if F i=
s
> > > > > > RcuBox).
> > > > >=20
> > > > > Yeah, but the backing memory is still alive. And new pointers to =
that
> > > > > memory get crafted by the accessors. If a callback accesses the d=
ata
> > > > > through `container_of(Fence)`, it gets a new pointer.
> > > > >=20
> > > > > So what's the problem?
> > > > >=20
> > > > > Where is the invalid pointer that someone is accessing?
> > > > >=20
> > > > > >=20
> > > > > > The Arc type is not a type that opts-out of &mut =3D=3D exclusi=
ve, so the
> > > > > > second drop_in_place() above is assumed exclusive access to the
> > > > > > Arc<FenceCtx<F,C>> field.
> > > > >=20
> > > > > OK, so I think I see the problem. So the invalid pointer is
> > > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (although=
 we don't have
> > > > > a picture yet as to how that would be accessed through other call=
backs.
> > > > >=20
> > > > > > =C2=A0If another thread obtains a pointer to the
> > > > > > FenceCtx via reading the fctx field of the DriverFence in paral=
lel with
> > > > > > this, then that's not allowed because the drop_in_place() call =
has
> > > > > > exclusive access to that field.
> > > > >=20
> > > > > I think I have been asking in several of our meetings in the past
> > > > > whether it is actually a problem to access data that has been dro=
pped()
> > > > > IF we know that drop does not cause UAF and the answer was kind o=
f like
> > > > > a "well if it does not actually get freed=E2=80=A6"
> > > >=20
> > > > Ok, well, IMO the simplest approach is to say you can't. There may =
be
> > > > roundabout ways to do it, but I would suggest that we just ... don'=
t.
> > >=20
> > > Ack.
> > >=20
> > > >=20
> > > > > Anyways.
> > > > >=20
> > > > > It would seem the way to get this right is then
> > > > >=20
> > > > > synchronize_rcu();
> > > > > drop_in_palace(data);
> > > > >=20
> > > > >=20
> > > > > Agreed?
> > > > >=20
> > > > > This would then mean, however, that every time a fence drops, you=
 have
> > > > > to wait a grace period.
> > > > >=20
> > > > > Or maybe stuff DriverFenceData into an RcuBox, too, and defer its
> > > > > dropping.
> > > >=20
> > > > That would work, but I think we can do better and avoid the
> > > > synchronize_rcu() along these lines:
> > > >=20
> > > > unsafe trait RcuRevocable {
> > > > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr: *mut Self);
> > > > }
> > > >=20
> > > > This trait provides a method that's like drop_in_place(), except th=
at
> > > > when you use this destructor, the value remains usable for one grac=
e
> > > > period. You could implement it for RcuBox, and for any Copy type, a=
nd
> > > > for ARef<T> when T is cleaned up with rcu, and probably also other
> > > > stuff.
> > >=20
> > > I mean, this cannot be magic. It also boils down to executing one RCU
> > > callback per DriverFence dropping.
> > >=20
> > > Is there a significant difference to stuffing DriverFenceData into an
> > > RcuBox?
> >=20
> > Do you mean hard-coding that the user-data of a driver fence is always
> > stored in an RcuBox?
>=20
>=20
> I'm talking about this:
>=20
>=20
>=20
> impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> DriverFence=
Allocation<F, C> {
>     /// Create a new allocation slot that can later be used to create a f=
ully
>     /// initialized [`DriverFence`] without the need to allocate.
>     pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> Result<Self> {
>         let fence_data =3D DriverFenceData {
>             // `inner` remains uninitialized until a [`DriverFence`] take=
s over.
>             inner: Fence {
>                 inner: Opaque::uninit(),
>             },
>             fctx,
>             data,
>         };
>=20
>         // In order to support the C dma_fence callbacks, it is necessary=
 for
>         // a `Fence` and a `DriverFence` to live in the same allocation,
>         // because the C backend passes a dma_fence, from which the drive=
r most
>         // likely wants to be able to access its `data` in `DriverFence`.
>         //
>         // Hence, we need the manage the memory manually. It will be free=
d by the
>         // C backend automatically once the refcount within `Fence` drops=
 to 0.
>         let data =3D RcuBox::new(fence_data, GFP_KERNEL | __GFP_ZERO)?;
>=20
>         Ok(Self { data })
>     }
>=20
>=20
> This way, the entire DriverFenceData will remain valid for an
> additional grace period. I suppose this would solve your pointer-
> invalid concern.
>=20
> However, it appears like overkill to me because the refcounting + C
> backend already ensure that nothing drops too soon, and the backend
> frees with kfree_rcu(), so=E2=80=A6

I agree that it doesn't sound like we want RcuBox here.

What kind of metadata are we actually planning to store in the
DriverFence in practice?

Alice

