Return-Path: <linux-media+bounces-63368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CMHWL6HKHmqjVAAAu9opvQ
	(envelope-from <linux-media+bounces-63368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 14:20:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C262DF21
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 14:20:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="sQ8Jo/8H";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63368-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63368-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5AA53070CB8
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 12:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F463DDDD8;
	Tue,  2 Jun 2026 12:14:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057B3DC857
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 12:14:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402490; cv=none; b=aSLF9Jxu+jngMu8cPobJT58dhqAb/QxCHuEFFgls1NhDq90bHOQ0rnC9Tw2jGU5sXoU/TuqiUehB7tbjLWGhNkEzcnZI15F7o9t0ors86CpydWEYg3iBKmm1v6izzEG+PtKjANtu+HeGh2KghsEoKLmkMvXWY/y29WvPLenfCjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402490; c=relaxed/simple;
	bh=sNCjBWDNan1FJgCoxcb/iHPwiqPvsLiiHiw/iQ2FqiY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B4X2z9mLCFh7Mol4zHM/bSjNy/aGQZVM4QklUsDGSuVzrwfv6j0HB2mzHpButUq0X4B3kbtiXBstbxXKiQd+MhygTd0oFRTqB7qi2Gr2IJ9j9VIZ+GSwLbGy/6Ysm5Wk156N773HGtolaSzvqDZzMLu9RAmXWOqmoXjbN2sXL1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sQ8Jo/8H; arc=none smtp.client-ip=80.241.56.161
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gV8h63Nfcz9t2R;
	Tue,  2 Jun 2026 14:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780402006; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0TvCuZ8ET2HwW7HOhyfPPGZt6fmcpbq6yTEF8pUxTE=;
	b=sQ8Jo/8HL5dA69lQvsmFAp2DqVnu0b4pZlaCFEIhyG0cPsJPkcCkyoY+YOTLKI2FwBtsn4
	doP37R5cM/Erryd8+aLI8n/t5bsw8Y7JeOvBjjKFXafY66PcBzpf7wz8Un/yoFpUqs6/Zc
	8mRhtAH8A+e/ODLv2F8rdgDluGNPwEejATC4i7A9ejlxPlYMMCSh5NSqdjYuZH7Tc6TadB
	BWbqhdhm8m087QaWYhXBHjZUMtsjHVKcdnxJoZPMwr66X3SQEy0eKlDKCTg75h6hXnrPvg
	LPGYkbHDtEUa+hvF1idvQ5f42iyukuPzVUZb6XKrEZIss5FntJs2BCuh2TdWBw==
Message-ID: <4bf6e916efe54bab66defda6fffea8c41358b3cc.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 02 Jun 2026 14:06:43 +0200
In-Reply-To: <ah7FjDdU6zt65qId@google.com>
References: <20260530143541.229628-5-phasta@kernel.org>
	 <20260530150622.393FC1F00893@smtp.kernel.org> <ah1c3NSU-4UkdUhb@google.com>
	 <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
	 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
	 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
	 <ah2M2a_4PneZpjTS@google.com>
	 <16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
	 <ah7CGySkyE7mSM8a@google.com>
	 <7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
	 <ah7FjDdU6zt65qId@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 52e53dd3c7b68597cf2
X-MBO-RS-META: rx6eka3p495tyg3ufqr7nrpzwutccmgs
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TAGGED_FROM(0.00)[bounces-63368-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:phasta@kernel.org,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 260C262DF21

On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote:
> On=20

[=E2=80=A6]

> > >=20
> > > If you don't implement Sync, then DriverFence cannot be stored in an
> > > Arc. I wouldn't take away that ability unless you have to, and I don'=
t
> > > see anything in the DriverFence API that would mean you can't do that=
.
> >=20
> > Nope. We explicitly agreed on this design.
> >=20
> > Just 1 DriverFence. Just 1 party that can signal it.
> > Note that we also agreed upon the Driverfence disappearing with
> > .signal(), which certainly prevents several from existing, unless you
> > do an Option.take()
>=20
> I would like to clarify that I'm not suggesting any changes to the
> design. Implementing Sync is not the same as having multiple driver
> fences.

I mean, I guess one can do that. But it's up to the driver then to see how =
it can signal its fence.

>=20
> > > > > > > =C2=A0so even though
> > > > > > > the fence context may be valid for another grace period, the =
*pointer*
> > > > > > > to the fence context is not. The pointer could have been zero=
ed by the
> > > > > > > destructor.
> > > > > >=20
> > > > > > That particular pointer to the DriverFenceData could have been =
zeroed.
> > > > > > But potential other accessors have already crafted themselves a=
 new
> > > > > > pointer to the, by the power of RCU, still valid data. That new=
 pointer
> > > > > > is container-of-ed from struct dma_fence *f.
> > > > >=20
> > > > > I'm not talking about the pointer to DriverFenceData, I'm talking=
 about
> > > > > the pointer to the FenceCtx, or the pointer to the data (if F is
> > > > > RcuBox).
> > > >=20
> > > > Yeah, but the backing memory is still alive. And new pointers to th=
at
> > > > memory get crafted by the accessors. If a callback accesses the dat=
a
> > > > through `container_of(Fence)`, it gets a new pointer.
> > > >=20
> > > > So what's the problem?
> > > >=20
> > > > Where is the invalid pointer that someone is accessing?
> > > >=20
> > > > >=20
> > > > > The Arc type is not a type that opts-out of &mut =3D=3D exclusive=
, so the
> > > > > second drop_in_place() above is assumed exclusive access to the
> > > > > Arc<FenceCtx<F,C>> field.
> > > >=20
> > > > OK, so I think I see the problem. So the invalid pointer is
> > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (although w=
e don't have
> > > > a picture yet as to how that would be accessed through other callba=
cks.
> > > >=20
> > > > > =C2=A0If another thread obtains a pointer to the
> > > > > FenceCtx via reading the fctx field of the DriverFence in paralle=
l with
> > > > > this, then that's not allowed because the drop_in_place() call ha=
s
> > > > > exclusive access to that field.
> > > >=20
> > > > I think I have been asking in several of our meetings in the past
> > > > whether it is actually a problem to access data that has been dropp=
ed()
> > > > IF we know that drop does not cause UAF and the answer was kind of =
like
> > > > a "well if it does not actually get freed=E2=80=A6"
> > >=20
> > > Ok, well, IMO the simplest approach is to say you can't. There may be
> > > roundabout ways to do it, but I would suggest that we just ... don't.
> >=20
> > Ack.
> >=20
> > >=20
> > > > Anyways.
> > > >=20
> > > > It would seem the way to get this right is then
> > > >=20
> > > > synchronize_rcu();
> > > > drop_in_palace(data);
> > > >=20
> > > >=20
> > > > Agreed?
> > > >=20
> > > > This would then mean, however, that every time a fence drops, you h=
ave
> > > > to wait a grace period.
> > > >=20
> > > > Or maybe stuff DriverFenceData into an RcuBox, too, and defer its
> > > > dropping.
> > >=20
> > > That would work, but I think we can do better and avoid the
> > > synchronize_rcu() along these lines:
> > >=20
> > > unsafe trait RcuRevocable {
> > > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr: *mut Self);
> > > }
> > >=20
> > > This trait provides a method that's like drop_in_place(), except that
> > > when you use this destructor, the value remains usable for one grace
> > > period. You could implement it for RcuBox, and for any Copy type, and
> > > for ARef<T> when T is cleaned up with rcu, and probably also other
> > > stuff.
> >=20
> > I mean, this cannot be magic. It also boils down to executing one RCU
> > callback per DriverFence dropping.
> >=20
> > Is there a significant difference to stuffing DriverFenceData into an
> > RcuBox?
>=20
> Do you mean hard-coding that the user-data of a driver fence is always
> stored in an RcuBox?


I'm talking about this:



impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> DriverFenceAl=
location<F, C> {
    /// Create a new allocation slot that can later be used to create a ful=
ly
    /// initialized [`DriverFence`] without the need to allocate.
    pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> Result<Self> {
        let fence_data =3D DriverFenceData {
            // `inner` remains uninitialized until a [`DriverFence`] takes =
over.
            inner: Fence {
                inner: Opaque::uninit(),
            },
            fctx,
            data,
        };

        // In order to support the C dma_fence callbacks, it is necessary f=
or
        // a `Fence` and a `DriverFence` to live in the same allocation,
        // because the C backend passes a dma_fence, from which the driver =
most
        // likely wants to be able to access its `data` in `DriverFence`.
        //
        // Hence, we need the manage the memory manually. It will be freed =
by the
        // C backend automatically once the refcount within `Fence` drops t=
o 0.
        let data =3D RcuBox::new(fence_data, GFP_KERNEL | __GFP_ZERO)?;

        Ok(Self { data })
    }


This way, the entire DriverFenceData will remain valid for an
additional grace period. I suppose this would solve your pointer-
invalid concern.

However, it appears like overkill to me because the refcounting + C
backend already ensure that nothing drops too soon, and the backend
frees with kfree_rcu(), so=E2=80=A6


P.


>=20
> Alice

