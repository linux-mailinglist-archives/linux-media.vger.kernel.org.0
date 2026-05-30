Return-Path: <linux-media+bounces-63139-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIJIAAj9GmpX+QgAu9opvQ
	(envelope-from <linux-media+bounces-63139-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:06:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775660DA64
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC96A3026740
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 15:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DEA3002AB;
	Sat, 30 May 2026 15:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKIGo7Ad"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF163093C6
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153585; cv=none; b=ndDsoAeHezxb3RnSOL78CYCONL57OwbwcM+L1shiWtxVl6YMWIPewdQPk9r3dYpscEADNjqNG0LpNayrOH/NnE4/w2jGkleVhpHE49G/Yr3okmHTZUF1MwuBGTj4oVcuBHezUhzdzlaxKW5Nwc/OvVGjmX489xoha66MHiRNJMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153585; c=relaxed/simple;
	bh=HIyWHxYLXZNg/c6l1z/0l9ommiZTcuYmF4H/53c+uHk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PBkEWkEZrcm/n/EyItbfg2r9WIiABh8HOYHG4dGVM6o1tMUPYUQ4eCjWHpilepEK7g4ZGhTljdOMSBE9ZYLFL1ShecGNY8FFIq6jj6jOIWPgJVzbPemO9BUTPaTT2/CM4fBQCFQsJk2kT/zV707ZykRt7CZYz20eVEdGvaV4+64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKIGo7Ad; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393FC1F00893;
	Sat, 30 May 2026 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780153582;
	bh=VAqIyrmvuzHHk9D3eLJaA8Psc/ewn49nLxW/zDyacQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PKIGo7AdAUvY7wUHTwS1TGm8w6AhA4GxnavDdA2sKSSrrnpiGFPjtJ82tsnEE9QxP
	 /iq5SAbSUStnG34XtK+FmJpUtAqZpyWXomrHQ2TpjLHNftuELWymhRsr08/8R41wkc
	 Xq9iwziVFyAzyboddVcmo7/tQJUpI5UyHczHm+KnNmvbwK0kWzcu9cZk0K2u0pfHxB
	 AQxxHqL9qBpirlujkUWLt9Z+fIdeblHQLS3P4LgAKePz9S/85NwBGz7PLU1jgmq/c+
	 /fKwS4Yq0r8M7hwwlTOC4dXOxUs0lmykcnDcKl3ikMmslA++zwqqpxJFX63Fn0l6ac
	 ha2F4aWzDLQOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Philipp Stanner" <phasta@kernel.org>
Cc: linux-media@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260530143541.229628-5-phasta@kernel.org>
References: <20260530143541.229628-5-phasta@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 15:06:21 +0000
Message-Id: <20260530150622.393FC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63139-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: 4775660DA64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] DriverFence::drop eagerly drops FenceCtx and user data before =
the C dma_fence refcount reaches 0, leading to a Use-After-Free.
- [High] FenceCtx::drop unconditionally calls rcu_barrier(), causing a 'sch=
eduling while atomic' panic when a DriverFence is dropped from an interrupt=
 handler or under a spinlock.
- [High] DriverFence::drop() passes a positive error code (ECANCELED) to dm=
a_fence_set_error(), triggering a WARN_ON and misconfiguring the error stat=
e.
- [High] DriverFence::as_raw and DriverFenceBorrow::as_raw create exclusive=
 mutable references (&mut) to actively shared data, causing Rust aliasing U=
ndefined Behavior.
--

commit bf1d1a15337629cfe74eaeb7d34f6878de552428
Author: Philipp Stanner <phasta@kernel.org>
Subject: rust: Add dma_fence abstractions

This commit introduces Rust abstractions for the dma_fence framework. It
provides DriverFence, Fence, and FenceCtx types to decouple fence issuers
from consumers and safely manage synchronization primitives required by
GPU drivers.

> diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_f=
ence.rs
> new file mode 100644
> --- /dev/null
> +++ b/rust/kernel/dma_buf/dma_fence.rs

[ ... ]

> +#[pinned_drop]
> +impl<F: Send + Sync, C: Send + Sync> PinnedDrop for FenceCtx<F, C> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: `rcu_barrier()` is always safe to be called.
> +        unsafe { bindings::rcu_barrier() };

[Severity: High]
Does calling rcu_barrier() here risk a scheduling-while-atomic panic?

Since DriverFence::signal() consumes self, the DriverFence will be dropped
at the end of the method. If this happens in an atomic context (such as an
interrupt handler or under a spinlock), and it holds the last reference to
the FenceCtx, dropping it triggers FenceCtx::drop().

Because rcu_barrier() blocks and sleeps until all pending RCU callbacks
complete, this could attempt to sleep in atomic context.

> +    }
> +}

[ ... ]

> +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> +    fn as_raw(&self) -> *mut bindings::dma_fence {
> +        // SAFETY: Valid because `self` is valid.
> +        let fence_data =3D unsafe { &mut *self.data.as_ptr() };

[Severity: High]
Does this create an exclusive mutable reference to actively shared memory?

DriverFenceData can be accessed concurrently by other threads holding Fence
references (for instance, when checking if the fence is signaled). Creating
a mutable reference (&mut) in Rust asserts exclusive access and violates
aliasing rules, which allows the compiler to make invalid optimization
assumptions.

Could this use an immutable reference &*self.data.as_ptr() instead?

> +
> +        fence_data.inner.inner.get()
> +    }

[ ... ]

> +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> +    fn as_raw(&self) -> *mut bindings::dma_fence {
> +        // SAFETY: Valid because `self` is valid.
> +        let fence_data =3D unsafe { &mut *self.data.as_ptr() };

[Severity: High]
Similar to DriverFence::as_raw(), does this also incorrectly create a
mutable reference to shared data?

> +
> +        fence_data.inner.inner.get()
> +    }

[ ... ]

> +impl<F: Send + Sync, C: Send + Sync> Drop for DriverFence<F, C> {
> +    fn drop(&mut self) {
> +        let fence =3D self.as_raw();
> +        let mut fence_flags: usize =3D 0;
> +        let flag_ptr =3D &raw mut fence_flags;
> +
> +        // SAFETY: Once a `DriverFence` is initialized, the inner `fence=
` is
> +        // valid and initialized. It is valid until the refcount drops
> +        // to 0, which can earliest happen once the `DriverFence` has be=
en dropped.
> +        unsafe {
> +            bindings::dma_fence_lock_irqsave(fence, flag_ptr);
> +            #[allow(unused_unsafe)]
> +            if warn_on!(!bindings::dma_fence_is_signaled_locked(fence)) {
> +                bindings::dma_fence_set_error(fence, ECANCELED as i32);

[Severity: High]
Is it intentional to pass a positive error code here?

bindings::ECANCELED evaluates to a positive integer, but
dma_fence_set_error() expects a negative error code (and triggers a WARN_ON
for positive values). A positive value might also be interpreted as success
by callers checking for values < 0.

Should this be - (bindings::ECANCELED as i32)?

> +                bindings::dma_fence_signal_locked(fence);
> +            }
> +            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> +        }
> +
> +        // SAFETY: `self.data` is owned by the DriverFence, but could be=
 accessed
> +        // through some dma_fence callbacks right now. Access is being r=
evoked
> +        // above by signalling the fence. The DriverFenceAllowedData tra=
it
> +        // ensures that the data either does not need drop, or if it doe=
s it
> +        // lives in a RcuBox which will delay dropping by one grace peri=
od, hence
> +        // ensuring that all readers have disappeared.
> +        unsafe { drop_in_place(self.data.as_ptr()) };

[Severity: Critical]
Could this eagerly drop FenceCtx and user data before the C dma_fence
refcount reaches 0?

The C dma_fence object can remain alive as long as consumers (like sync_file
or the GPU scheduler) hold references to it. If the backend later invokes
callbacks like ops->get_driver_name(), FenceCtx::get_driver_name() would
attempt to read fctx.driver_name from the already-dropped FenceCtx:

FenceCtx::get_driver_name() {
    ...
    fctx.driver_name.as_char_ptr()
}

Can this result in a use-after-free?

> +
> +        // SAFETY: Once a `DriverFence` is initialized, the inner `fence=
` is
> +        // valid and initialized. It is valid until the refcount drops
> +        // to 0, which can earliest happen once the `DriverFence` has be=
en dropped.
> +        unsafe {
> +            bindings::dma_fence_put(fence);
> +        }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530143541.2296=
28-2-phasta@kernel.org?part=3D3

