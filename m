Return-Path: <linux-media+bounces-63921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MgRLENjUImqreAEAu9opvQ
	(envelope-from <linux-media+bounces-63921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:53:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5822E648A96
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:53:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RfJBG7+A;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63921-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63921-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DC8430459EE
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE14730E0F2;
	Fri,  5 Jun 2026 13:49:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5097440E8DB
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 13:49:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780667377; cv=none; b=sX1d8aRLsNFuJv0e5sL8LYlzkV73ppPTCPw2j0FPf4ScZrerGKxEbiL9u1jEv8hAd2T0lklqULktqCwTXV7Iachby/NOlCXi9oW9LyNv43pEb/WFJ4olL1BbtfjC4v5JC455h0pDlabtkmIDEYU+BBVXejNQYjQfKH+Pdwqqhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780667377; c=relaxed/simple;
	bh=KTXS4bSniXv1T9Lpl7LThf2fu0ztGfgBSEx3Oe+rZRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NaWlmh2fKWLjaplrqejUQ2lf1tnad+t0u+6p4Tg4+6qLE1PlXlbU1s+gsHclg+vqxDggRNClk+xdcuDrHehHgivOa/bk6L7EuJZafF3rLnkUkSf2eiYkyu1cvxBWHe0lLiY9Wffg6ZbCZFvIDQGJyEsYhekAwnpu0OHCObs6eAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfJBG7+A; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C0E1F00893;
	Fri,  5 Jun 2026 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780667375;
	bh=NOPCHrzvq5CVQ0Mcn5Bk28yhps2kKyAdDW4GC+Kd1wE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RfJBG7+AKc4vFm0yolWSn6ut3MzqJ/i+zK+QagG1WD0OEeDNux64PFP5Fjr352I/9
	 UehLP4Ft8uwgK9MlwAJ9OgwBflybZZb0Ze/yVgJ+7pL6wyGPWQhDjmF6DCcvFAB9i6
	 9Ckn00rSWP8DeR+gT43utpRsc15S1bzR3mKGH/PgqThZtME/ifD0O3/1PvFkP5Jwg4
	 GwZxrIyac14aj8wmhjJ5TRPK8/8BVhOGYtfCLYOqAbi9hp7iDsW7Tqf8dcQ3NxI10a
	 5+P3w/0fQzjbBslaXhd6dpXvI4ZpebxeplcOrOjQuKihM27qkIjP87/yZDukz46deT
	 X7KIXbdh15W+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] rust: rcu: add RcuBox type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Boqun Feng" <boqun@kernel.org>
Cc: ojeda@kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
In-Reply-To: <20260605133541.22569-2-boqun@kernel.org>
References: <20260605133541.22569-2-boqun@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 13:49:35 +0000
Message-Id: <20260605134935.B6C0E1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63921-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boqun@kernel.org,m:ojeda@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5822E648A96

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] RcuBox::into_foreign drops `self` instead of forgetting it, ca=
using a guaranteed Use-After-Free.
- [High] RcuBox::drop bypasses the custom Allocator A and hardcodes kvfree_=
call_rcu() for types that do not require dropping, causing undefined behavi=
or for non-kvfree compatible allocators.
--

commit f69c06884595bb68a76f4f1dd4014ee9e2c9e31c
Author: Alice Ryhl <aliceryhl@google.com>

rust: rcu: add RcuBox type
   =20
This adds an RcuBox container, which is like Box except that the value
is freed after waiting for one grace period (via {kvfree_,}call_rcu()).
To allow containers to rely on the RCU properties of RcuBox, an
extension of ForeignOwnable is added.

> diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/rcu_b=
ox.rs
> new file mode 100644
> index 0000000000000..943fe3e8974e0
> --- /dev/null
> +++ b/rust/kernel/sync/rcu/rcu_box.rs

[ ... ]

> +// SAFETY:
> +// * The `RcuBoxInner<T>` was allocated with `A`.
> +// * `NonNull::as_ptr` returns a non-null pointer.
> +unsafe impl<T: Send + 'static, A: Allocator> ForeignOwnable for RcuBox<T=
, A> {
> +    const FOREIGN_ALIGN: usize =3D <Box<RcuBoxInner<T>, A> as ForeignOwn=
able>::FOREIGN_ALIGN;
> +
> +    type Borrowed<'a> =3D &'a T;
> +    type BorrowedMut<'a> =3D &'a T;
> +
> +    fn into_foreign(self) -> *mut c_void {
> +        self.0.as_ptr().cast()
> +    }

[Severity: Critical]
Since `self` is consumed by value here without being wrapped in `ManuallyDr=
op`
or passed to `core::mem::forget()`, won't it be dropped at the end of this
method?

This seems like it would immediately schedule the memory for RCU free, caus=
ing
a use-after-free for the foreign code when it later accesses the pointer.

> +
> +    unsafe fn from_foreign(ptr: *mut c_void) -> Self {

[ ... ]

> +impl<T: Send, A: Allocator> Drop for RcuBox<T, A> {
> +    fn drop(&mut self) {
> +        // SAFETY: The `rcu_head` field is in-bounds of a valid allocati=
on.
> +        let rcu_head =3D unsafe { &raw mut (*self.0.as_ptr()).rcu_head };
> +        if core::mem::needs_drop::<T>() {
> +            // SAFETY: `rcu_head` is the `rcu_head` field of `RcuBoxInne=
r<T>`. All users will be
> +            // gone in an rcu grace period. This is the destructor, so w=
e may pass ownership of the
> +            // allocation.
> +            unsafe { bindings::call_rcu(rcu_head, Some(drop_rcu_box::<T,=
 A>)) };
> +        } else {
> +            // SAFETY: All users will be gone in an rcu grace period.
> +            // TODO: We are luckily since `kvfree_call_rcu()` works on b=
oth kmalloc and vmalloc,
> +            // maybe a new `Allocator` method is needed.
> +            unsafe { bindings::kvfree_call_rcu(rcu_head, self.0.as_ptr()=
.cast()) };

[Severity: High]
Since `RcuBox` is generic over any custom `A: Allocator`, wouldn't calling
`kvfree_call_rcu()` here break for allocators other than kmalloc or vmalloc?

Does this need to always route through `A::free()` via `drop_rcu_box`, or
should `A` be explicitly bounded to an allocator trait that supports
`kvfree_rcu`?

> +        }
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605133541.2256=
9-1-boqun@kernel.org?part=3D1

