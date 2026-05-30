Return-Path: <linux-media+bounces-63138-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLkxNFX6GmoC+QgAu9opvQ
	(envelope-from <linux-media+bounces-63138-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 16:55:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4964360D96E
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 16:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92D553028F70
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 14:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CC03112BD;
	Sat, 30 May 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpaveJfQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FC13019A9
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780152900; cv=none; b=NeSQfqNlbiwxFRvBzfyPiY6sqSIKKHEu5BblIIvJirMQa6NQH+qV8YGcK63c3ki1Fk+1su6XGyp16+kYztOfFLMoL8GYnQaCMic8RUEZDQHbhqXEhcsU53eJXg3zFCrjFwyWu9XkBQGLfxEEXYBmT8Sb7GEtH05bG1HVqmJwMk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780152900; c=relaxed/simple;
	bh=41iZbpTaYdRqJNutZInkcL+szP9563jC66hvl5BjZhM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gXYNBeKmMcOutCRr8TP0zIMmSWrHnn5WXLQSs1eJ/nqb9iJEcpVae1LgLCCuwil9xt9lZb519Nn/IB3c9FFkFqGdwRgkj1vwwD61nJCfs4O5A5SanQva/P22q5Nv7NFDyGeT/NlSPiwtfnkXmQnjiPMQLCKHAdEB8xShU4CxDX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpaveJfQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FAA1F00893;
	Sat, 30 May 2026 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780152898;
	bh=ogyNf3jiJQaja6gtEM7xgF1i6zflrZsS5mTT96zBiAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JpaveJfQNMmVoyvjbMUyGxkQblyz2mCJ7nSFNVd+ZNt6EilOTVMsY8X4t6rhcGk8I
	 5HNF0kfM1PZe2yN0PsJx6yNBYEmSldygD56cfrTW4NFI1SqsA80VKTjzmC/teVFhmw
	 z7+iHTM9bHqTPqPED62zKXRqyUlQOfPdG0Zma1IZFL9ZPiD8tPm+6ZINAtSAzk54h0
	 K/KwUMf/h7KDps1FZRTQZf07yjV5UAQneHLla9VSSSYCSWJ9K3y/2P3TmD3j/PaK34
	 eQSZeszJ2GLcc0FsDGCi8zXJxKPhjDRpn0W2t4ehfvxVhni5BiZdMqEpNEJ7mEuACA
	 H4bnLmluF6yYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] rust: rcu: add RcuBox type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Philipp Stanner" <phasta@kernel.org>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260530143541.229628-4-phasta@kernel.org>
References: <20260530143541.229628-4-phasta@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 14:54:58 +0000
Message-Id: <20260530145458.81FAA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63138-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4964360D96E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] `RcuBox::into_foreign` consumes `self` by value without preven=
ting its destructor from running, causing immediate RCU freeing of the acti=
ve allocation.
- [High] `RcuBox` defers the execution of the inner value's destructor usin=
g RCU but fails to restrict the value to the `'static` lifetime, allowing u=
se-after-free on stack references.
- [High] `ForeignOwnableRcu` implementation for `RcuBox<T>` does not requir=
e `T: Sync`, allowing data races on `!Sync` types.
--

commit 81791c9c93af881931b7e9c9ed0d885ba31c73cb
Author: Alice Ryhl <aliceryhl@google.com>

rust: rcu: add RcuBox type

This adds an RcuBox container, which is like KBox except that the value
is freed with kfree_rcu. To allow containers to rely on the rcu properties
of RcuBox, an extension of ForeignOwnable is added.

> diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/rcu_b=
ox.rs
> new file mode 100644
> index 0000000000000..2508fdb609ecc
> --- /dev/null
> +++ b/rust/kernel/sync/rcu/rcu_box.rs

[ ... ]

> +/// A box that is freed with rcu.
> +///
> +/// The value must be `Send`, as rcu may drop it on another thread.
> +///
> +/// # Invariants
> +///
> +/// * The pointer is valid and references a pinned `RcuBoxInner<T>` allo=
cated with `kmalloc`.
> +/// * This `RcuBox` holds exclusive permissions to rcu free the allocati=
on.
> +pub struct RcuBox<T: Send>(NonNull<RcuBoxInner<T>>);

[Severity: High]
Does RcuBox need a 'static bound on T here?

RcuBox defers the execution of the inner value's destructor using RCU via
call_rcu, but the definition lacks a 'static bound on T. This means the Rust
compiler would permit short-lived local references (e.g., &'a mut i32) to be
stored inside types wrapped by RcuBox.

Since the actual destructor of T is executed asynchronously in the RCU
callback, it may occur after the local variables it references have been
popped from the stack. If T's destructor accesses those references, it will
read or write to freed stack memory.

[ ... ]

> +// SAFETY:
> +// * The `RcuBoxInner<T>` was allocated with `kmalloc`.
> +// * `NonNull::as_ptr` returns a non-null pointer.
> +unsafe impl<T: Send + 'static> ForeignOwnable for RcuBox<T> {
> +    const FOREIGN_ALIGN: usize =3D <KBox<RcuBoxInner<T>> as ForeignOwnab=
le>::FOREIGN_ALIGN;
> +
> +    type Borrowed<'a> =3D &'a T;
> +    type BorrowedMut<'a> =3D &'a T;
> +
> +    fn into_foreign(self) -> *mut c_void {
> +        self.0.as_ptr().cast()
> +    }

[Severity: Critical]
Does this code inadvertently run the destructor of RcuBox during
into_foreign()?

Since this method takes self by value and doesn't explicitly wrap it in
core::mem::ManuallyDrop or call core::mem::forget(self), the object will
be dropped at the end of the method's scope.

This would invoke RcuBox::drop immediately, enqueuing a call to
bindings::call_rcu or bindings::kvfree_call_rcu before returning the
pointer. Any subsequent access by C code reading the published pointer
would result in a use-after-free, and calling from_foreign() and dropping
it again would cause a double-free.

> +
> +    unsafe fn from_foreign(ptr: *mut c_void) -> Self {

[ ... ]

> +impl<T: Send + 'static> ForeignOwnableRcu for RcuBox<T> {

[Severity: High]
Should this trait implementation also require T: Sync?

The ForeignOwnableRcu trait is designed to allow concurrent RCU readers to
safely borrow the underlying data, with rcu_borrow() returning &'a T.

Because RCU allows multiple threads to execute read-side critical sections
concurrently, multiple CPUs can concurrently call rcu_borrow on the same
pointer. If T is not Sync (e.g., Cell<i32>), this could result in multiple
&T references to a !Sync type across different threads, allowing concurrent
mutation through shared references.

> +    type RcuBorrowed<'a> =3D &'a T;
> +
> +    unsafe fn rcu_borrow<'a>(ptr: *mut c_void) -> &'a T {
> +        // SAFETY: `RcuBox::drop` can only run after `from_foreign` is c=
alled, and the value is
> +        // valid until `RcuBox::drop` plus one grace period.
> +        unsafe { &(*ptr.cast::<RcuBoxInner<T>>()).value }
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530143541.2296=
28-2-phasta@kernel.org?part=3D2

