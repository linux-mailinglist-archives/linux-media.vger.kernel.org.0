Return-Path: <linux-media+bounces-63244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI9hC198HWrEbAkAu9opvQ
	(envelope-from <linux-media+bounces-63244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:34:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B1A61F510
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F180B300BB98
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F652379C22;
	Mon,  1 Jun 2026 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mWjm3v8R"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130631A5BAE
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317275; cv=none; b=OcrQg52Lfkz7NXKbL7/pd4W75SK3BoxeEzktHuOWMVLQpX5T1NEYtncgsSUXI8cOv7oPREb/s7Yk1CrpERtjxEgTzctb2EUoA054iMNDOGWn2NzZn8FTL7BnNgXllTh3q/9dNlJsDQelYjLBikB3VSvv6U1sal90JP10r2RsboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317275; c=relaxed/simple;
	bh=G8naQnX023xiVBLy1JQKVDfF0uybstBTRqKw+rwEUTo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t43IB+5I/S3TagIgrsfc/quCUAjjkX/4ZCh60fV4qGX+8vB8AlawBZHAcDz3k4htCC2OVfOfVrl1eByWdE7O6KamqQWHBAKXJUiyL0pQ0TM50h0UHgh2jPen+sYIn2oz9BmvTwWnn0bvnfheTZ/iMOj5shgECjU5rh7RQVVXpd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mWjm3v8R; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gTYLb0TH0z9smK;
	Mon,  1 Jun 2026 14:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780317271; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8naQnX023xiVBLy1JQKVDfF0uybstBTRqKw+rwEUTo=;
	b=mWjm3v8RnB+2HYcWS922Nri0DnXhY9T4A/8M8nRY7edHycPPpGgZ93N+SyLiRiGkXsTILd
	YUdLZ9qqxgEG4bUYjq4Xm9n4skpD1BbBPjFrVLZv+/1/T05ohnmuBDzRlg5j+OLekNQHLr
	zZJ64PEZSbBXjUL3VGC9yLG+qDonV1cmV1WYNKrYr9r9YJYK1G3V/0zkPgXDmW+PP5dxQg
	ebQw5kGS5EcOF7MQxXSGoyxS8zpxpWtkmrmdQ9gpw4yMIkXsZCLRO5kuiqK8jvaR3IPdnZ
	Xx3D1kVu6UA2UAOJYWagMsMypd3jRa1ocmfvRqkSl0Kn73b2VF894zF9Se6XRA==
Message-ID: <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, sashiko-reviews@lists.linux.dev
Cc: Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	ojeda@kernel.org
Date: Mon, 01 Jun 2026 14:34:28 +0200
In-Reply-To: <ah1c3NSU-4UkdUhb@google.com>
References: <20260530143541.229628-5-phasta@kernel.org>
	 <20260530150622.393FC1F00893@smtp.kernel.org> <ah1c3NSU-4UkdUhb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 5ehn3g8iqgwxdmdpf7gws67zosda7f1s
X-MBO-RS-ID: 343d67c74a38ac11746
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mailbox.org:mid,mailbox.org:dkim];
	TAGGED_FROM(0.00)[bounces-63244-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: C4B1A61F510
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.org=C2=A0wro=
te:
> > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fence {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid because =
`self` is valid.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D unsafe=
 { &mut *self.data.as_ptr() };
> >=20
> > [Severity: High]
> > Does this create an exclusive mutable reference to actively shared memo=
ry?
> >=20
> > DriverFenceData can be accessed concurrently by other threads holding F=
ence
> > references (for instance, when checking if the fence is signaled). Crea=
ting
> > a mutable reference (&mut) in Rust asserts exclusive access and violate=
s
> > aliasing rules, which allows the compiler to make invalid optimization
> > assumptions.
> >=20
> > Could this use an immutable reference &*self.data.as_ptr() instead?
>=20
> Yes, please use an immutable reference here.
>=20
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.inner.inner.ge=
t()
> > > +=C2=A0=C2=A0=C2=A0 }
> >=20
> > [ ... ]
> >=20
> > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fence {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid because =
`self` is valid.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D unsafe=
 { &mut *self.data.as_ptr() };
> >=20
> > [Severity: High]
> > Similar to DriverFence::as_raw(), does this also incorrectly create a
> > mutable reference to shared data?
>=20
> Here as well.

`data` is not shared. By design there is only ever one DriverFence, and
the driver's data (`data.data`) is `Sync`.

But I guess an immutable one should do the trick, too.

>=20
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.inner.inner.ge=
t()
> > > +=C2=A0=C2=A0=C2=A0 }
> >=20
> > [ ... ]
> >=20
> > > +impl<F: Send + Sync, C: Send + Sync> Drop for DriverFence<F, C> {
> > > +=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence =3D self.as_raw=
();
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut fence_flags: usiz=
e =3D 0;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let flag_ptr =3D &raw mut=
 fence_flags;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Once a `Driver=
Fence` is initialized, the inner `fence` is
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // valid and initialized.=
 It is valid until the refcount drops
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // to 0, which can earlie=
st happen once the `DriverFence` has been dropped.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
indings::dma_fence_lock_irqsave(fence, flag_ptr);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #=
[allow(unused_unsafe)]
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f warn_on!(!bindings::dma_fence_is_signaled_locked(fence)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_set_error(fence, ECANCELED as =
i32);
> >=20
> > [Severity: High]
> > Is it intentional to pass a positive error code here?
> >=20
> > bindings::ECANCELED evaluates to a positive integer, but
> > dma_fence_set_error() expects a negative error code (and triggers a WAR=
N_ON
> > for positive values). A positive value might also be interpreted as suc=
cess
> > by callers checking for values < 0.
> >=20
> > Should this be - (bindings::ECANCELED as i32)?
>=20
> Please use ECANCELED.to_errno(). Do not import these from bindings.
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_signal_locked(fence);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
indings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.data` is=
 owned by the DriverFence, but could be accessed
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through some dma_fence=
 callbacks right now. Access is being revoked
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above by signalling th=
e fence. The DriverFenceAllowedData trait
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures that the data =
either does not need drop, or if it does it
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lives in a RcuBox whic=
h will delay dropping by one grace period, hence
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that all read=
ers have disappeared.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_place(se=
lf.data.as_ptr()) };
> >=20
> > [Severity: Critical]
> > Could this eagerly drop FenceCtx and user data before the C dma_fence
> > refcount reaches 0?
> >=20
> > The C dma_fence object can remain alive as long as consumers (like sync=
_file
> > or the GPU scheduler) hold references to it. If the backend later invok=
es
> > callbacks like ops->get_driver_name(), FenceCtx::get_driver_name() woul=
d
> > attempt to read fctx.driver_name from the already-dropped FenceCtx:
> >=20
> > FenceCtx::get_driver_name() {
> > =C2=A0=C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0 fctx.driver_name.as_char_ptr()
> > }
> >=20
> > Can this result in a use-after-free?
>=20
> Hmm, I don't know about what sahisko said, but I don't think this is the
> right way to do rcu freeing. I think the type's destructor should be
> reserved for cases where the value becomes immediately unusable.

We could guard the strings with RcuBox, but we could not then guard the
FenceCtx code against code UAF if we don't have the rcu_barrier().

Or could we?

If a rust module unloads, module::remove() should contain an
rcu_barrier() (right??). Would that be enough to guard against the
FenceCtx code being unloaded?

>=20
> For example, let's say I'm using RcuBox<_> here. Yes, the data you get
> from dereferencing the RcuBox will stay alive for a grace period, but
> IMO once you run the destructor of the box itself, the *pointer* becomes
> immediately unusable.

I don't know why you're stressing the pointer?

The trick above is simply that drop / dealloc *and* code unloading is
delayed by a grace period.

P.

>=20
> Alice

