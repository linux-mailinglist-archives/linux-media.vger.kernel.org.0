Return-Path: <linux-media+bounces-63919-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y/qbOMDTImqNeAEAu9opvQ
	(envelope-from <linux-media+bounces-63919-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:48:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF31648A65
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:48:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="dsGoe/F9";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63919-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63919-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4046A30073CC
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042972DECD3;
	Fri,  5 Jun 2026 13:46:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1EF2EEE9E
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 13:46:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780667197; cv=none; b=HyTtOBOvr86+KHio2V75QtbO0POx4NfPNI+KvcCw8zg/taMa2vVz4SZ40jMAseH6goKxwLzP7yJADKEoXNyJE0k+L8Xd/6T9AZd8kSDe0lQE+kZkDxopujK2MNOXzdPz0KhI6wtj7t9PdA//cjZspxbg0tcWZzffWQOsZ5QdYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780667197; c=relaxed/simple;
	bh=hazMjH21gzXsxR5LG/OTrpQAOiBsDu1Fdl437I7YAdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y6ICcQvxWavOfZ0ca03uy8x9YaxVlJfbBsiyZjn0b+GYgu4Fp6t7o3ga2V+9mfLVt+xlAx8gKonyjFruTpG0ARwUDa5+fEmIHTwUGuJPcSO7IAJD619rfffdmgFnVmbogncQmRiGq8PO2js+k2HO820GnzxxNeq3MfQS5FmaTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsGoe/F9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A8A1F00893;
	Fri,  5 Jun 2026 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780667194;
	bh=fDg43M2B9PlNWHiDy1AMMtGyAjwDnQ27B4JUT5jEEZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dsGoe/F9w9ptQ3CBgBk5aWhc6h4s3+Efel29SxbZNJ0/YLXAbkJ5seI4oKo3xxFiI
	 pp5wRSpjhbHe7OwY+YUjs19bTbd7zsM9XIezIgihDOPb2dHYKBxrSS9ZmMLNN04LiG
	 C1wSLLu6y5tXCJmg1aFOU7gNnYs/r4tAl0q3ctJ3xVVLfabIwKqQf3/ZyLQtqyytXb
	 LBAwSwQ8aE/Xt6NreB+6dMKrHqHzP/qEgaWZJQhmFjw0yoY7fVxqP7FJoWFsWTNhVo
	 WyeK9RujJycOvM5sK0hpIpMSBJzr/kuwUADvNx0HqAYfno9ETk6WrE4WJk5X2fvnIS
	 WNUulBYdxdmlA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] rust: rcu: Introduce RcuFreeBox
Reply-To: sashiko-reviews@lists.linux.dev
To: "Boqun Feng" <boqun@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260605133541.22569-6-boqun@kernel.org>
References: <20260605133541.22569-6-boqun@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 13:46:33 +0000
Message-Id: <20260605134633.D5A8A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63919-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boqun@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CF31648A65

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Pointer cast bypasses struct field offset, causing `drop_befor=
e_gp` to operate on `rcu_head` instead of `value`.
- [High] `RcuFreeBox::drop` creates a mutable reference (`&mut T`) before t=
he RCU grace period elapses, violating Rust's strict aliasing rules.
- [High] `RcuFreeBox` wraps `T` in `ManuallyDrop<T>`, bypassing its destruc=
tor and creating an unresolvable leak or Use-After-Free dilemma.
- [Low] Missing `#[inline]` annotations on small/forwarding functions in th=
e new abstraction.
- [Low] Multiple spelling errors in the code comments.
--

commit 78e35ac6ad00fb0c6ab7802573453596f9ee6134
Author: Boqun Feng <boqun@kernel.org>

rust: rcu: Introduce RcuFreeBox

The current RcuBox calls the drop function after a grace period inside an R=
CU
callback. To support a pattern where an object is cleaned up, unshared, and
freed after a grace period without readers, RcuFreeBox is introduced.

> diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/rcu_b=
ox.rs
> index 943fe3e8974e0..8f52bb472daf9 100644
> --- a/rust/kernel/sync/rcu/rcu_box.rs
> +++ b/rust/kernel/sync/rcu/rcu_box.rs

[ ... ]

> @@ -205,6 +207,50 @@ fn drop(&mut self) {
>      drop(unsafe { Box::<_, A>::from_raw(box_inner) });
>  }
> =20
> +/// A box that is freed with RCU.
> +///
> +/// Currently we require T being Send because of an implementation limit=
ation. In theory we can
> +/// support T being !Send, since the RCU callback is only used to free t=
he memory, not dropping
> +/// T.
> +pub struct RcuFreeBox<T: Send + RcuFreeSafe, A: Allocator>(RcuBox<Manual=
lyDrop<T>, A>);
> +
> +impl<T: Send + RcuFreeSafe, A: Allocator> RcuFreeBox<T, A> {
> +    /// Create a new RcuFreeBox.
> +    pub fn new(x: T, flags: alloc::Flags) -> Result<Self, AllocError> {

[Severity: Low]
Does this function need an inline annotation? The Rust subsystem guidelines
mention that small or forwarding functions in abstractions should be
annotated with #[inline].

> +        Ok(Self(RcuBox::new(ManuallyDrop::new(x), flags)?))
> +    }
> +
> +    /// Access the value for a grace period.
> +    pub fn with_rcu<'rcu>(&self, read_guard: &'rcu Guard) -> &'rcu T {

[Severity: Low]
Should this small forwarding function also have an #[inline] annotation?

> +        self.0.with_rcu(read_guard)
> +    }
> +}
> +
> +impl<T: Send + RcuFreeSafe, A: Allocator> Deref for RcuFreeBox<T, A> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &T {

[Severity: Low]
Would an #[inline] annotation be appropriate for this Deref implementation
as well, since it is a simple forwarding call?

> +        self.0.deref()
> +    }
> +}
> +
> +impl<T: Send + RcuFreeSafe, A: Allocator> Drop for RcuFreeBox<T, A> {
> +    fn drop(&mut self) {
> +        // CAST: ManuallyDrop<T> is transparet to T, adn RcuBox owns the=
 object per type

[Severity: Low]
There are a couple of typos here: transparet instead of transparent, and adn
instead of and.

> +        // invariants.
> +        let ptr =3D self.0 .0.as_ptr().cast::<T>();

[Severity: Critical]
Is this pointer cast skipping the struct field offset?

self.0.0.as_ptr() returns a pointer to RcuBoxInner<ManuallyDrop<T>>. The
RcuBoxInner struct starts with an rcu_head field, meaning the actual value
field is located at a non-zero offset.

Casting this pointer directly to *mut T will point to the rcu_head memory
instead of the value.

Could calling drop_before_gp() on this pointer corrupt memory by treating
the internal rcu_head structure bytes as if they were of type T?

> +
> +        // SAFETY: Per the invariants of RcuBox, ptr owns the pointed ob=
ject. And we are not
> +        // going to move it.
> +        let pin =3D unsafe { Pin::new_unchecked(&mut *ptr) };

[Severity: High]
Does creating a mutable reference here violate Rust's strict aliasing rules?

When an RcuFreeBox is dropped, it is typically removed from the shared data
structure, but the RCU grace period has not yet elapsed. Concurrent readers
might still hold shared references (&T) obtained via with_rcu.

Creating an exclusive mutable reference (&mut T) using Pin::new_unchecked
while shared references may still exist is immediate undefined behavior in
Rust.

> +
> +        pin.drop_before_gp();
> +
> +        // needs_drop::<ManuallyDrop>() returns false, hence kvfree_call=
_rcu() will be called

[Severity: High]
Could bypassing the destructor using ManuallyDrop<T> create an unresolvable
leak or use-after-free regression?

Since needs_drop::<ManuallyDrop<T>>() evaluates to false, it skips dropping
the internals of T. If T holds owned resources like a Box or Vec, they are
never freed after the grace period, which leaks memory.

Conversely, if a user tries to work around this by manually freeing
resources inside drop_before_gp(), could that trigger a use-after-free
since drop_before_gp() runs before the RCU grace period ends while
concurrent readers might still be accessing those resources?

> +        // and free the underlying data after a gracer period.

[Severity: Low]
There is a typo here: gracer instead of grace.

> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605133541.2256=
9-1-boqun@kernel.org?part=3D3

