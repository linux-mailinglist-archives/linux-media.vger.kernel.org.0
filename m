Return-Path: <linux-media+bounces-63922-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FYeFLR3VImq4eAEAu9opvQ
	(envelope-from <linux-media+bounces-63922-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:54:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF8648AC1
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:54:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C3grknss;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63922-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63922-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67B1C3016C9E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CBB3161AB;
	Fri,  5 Jun 2026 13:51:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D9431714B
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 13:51:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780667495; cv=none; b=fQUw4AKWueU1bdylvHom5XPIRYMs8rMqLpCB271UCB+DfVrZb+C3vEKdkxmj8ZRzvxr1C/OZlYlrNmy/R/hRLIBxz6sOoyAs81myfORwcaNAi3bdCozk4SnUFfR9vmPg0gnu82lHFwQSq5JwwzwGJ1nKjm8MgHAYgiVXruSNAV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780667495; c=relaxed/simple;
	bh=OpuFEHuA9Y4/YyygJRYFGi4XiGtu/nwwfihSeYs0ggI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SWl9zTxal0sOVn/SJDiQmuINZ075cNht8GMKep88mfq3PJXLcLQ/oR8eNA5CFqjXsw9eNGxNoTkoAGOMdVwWHHTOrst+fuZh7me+ugRaiHg2yAyLOgL+/08bF6MN438y3vZeL9amzb6v6H4/CXKVPLYFGTS442S36swanBauk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3grknss; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26131F00893;
	Fri,  5 Jun 2026 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780667494;
	bh=WxgnRDgfcaJRPgOkS64o9HIQ9HlQL3SWek+yUpbgbVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C3grknssz/hpe2p8OB9abQyN7IXkuuArntkWOSCD8RlsvQp1Yx4cgz1Z28spmU8RH
	 FGJKEqNvL5BpA+g9wC7W+iSRb9fGkFLeAs0aLUOFc3KvwRATzjqtcVE1WKeD57s+Td
	 Xi6tT1EHSltojJk5eyYz+oEkPEBj+PQPPI34JhTA7A3L+OiIUXKrELT9BRqLbtKBS0
	 t9iC4rd2O8LgwjJPgWubfU9X3rr4I/tL7LVsnnPaRCHXPhUVdVmto0zDjYJZkgOJ/M
	 ITTGXizFEMvpmBF9dw0Cv75xVdMT14v2wibnCaARqEXoB5fSsCD5NyhytwRvI3J4ZO
	 2tYo/tTD0P5xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] rust: maple_tree: add load_rcu()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Boqun Feng" <boqun@kernel.org>
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260605133541.22569-4-boqun@kernel.org>
References: <20260605133541.22569-4-boqun@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 13:51:33 +0000
Message-Id: <20260605135133.D26131F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63922-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boqun@kernel.org,m:dri-devel@lists.freedesktop.org,m:ojeda@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DBF8648AC1

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Lockless traversal in `load_rcu()` causes a use-after-free of =
internal mapletree nodes because the tree is not initialized with `MT_FLAGS=
_USE_RCU`.
- [High] Unsound API: `RcuBox::new` safely allows types with blocking destr=
uctors to execute their `Drop` implementation in RCU softirq context, leadi=
ng to atomic context violations.
--

commit b7609fa7d8f12dc31f5e195b6f4d6155f2a20574
Author: Alice Ryhl <aliceryhl@google.com>

rust: maple_tree: add load_rcu()

This commit adds a load_rcu() method to MapleTree, allowing lookups under an
RCU read lock without taking the spinlock.

> diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
> index 265d6396a78a1..1499191b8935a 100644
> --- a/rust/kernel/maple_tree.rs
> +++ b/rust/kernel/maple_tree.rs

[ ... ]

> @@ -233,6 +237,54 @@ pub fn erase(&self, index: usize) -> Option<T> {
>          unsafe { T::try_from_foreign(ret) }
>      }
> =20
> +    /// Load the value at the given index with rcu.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Read the value under an rcu read lock. Even if the value is remo=
ved, it remains accessible
> +    /// for one rcu grace period.
> +    ///
> +    /// ```ignore
> +    /// use kernel::{
> +    ///     maple_tree::MapleTree,
> +    ///     sync::rcu::{self, RcuBox},
> +    /// };
> +    ///
> +    /// let tree =3D KBox::pin_init(MapleTree::<RcuBox<i32>>::new(), GFP=
_KERNEL)?;
> +    ///
> +    /// let ten =3D RcuBox::new(10, GFP_KERNEL)?;

[Severity: High]
Is it safe to allow arbitrary types to be managed via RcuBox?

RcuBox::new() is a safe function that accepts any T: Send. It lacks trait
bounds to restrict T to types that are safe to drop in atomic contexts.

When an RcuBox is dropped, if T requires dropping, it schedules drop_rcu_bo=
x()
using bindings::call_rcu(). The drop_rcu_box() callback executes in an RCU
softirq context, where sleeping or blocking is strictly forbidden.

If a safe T blocks during its Drop implementation (for example, safely
acquiring a kernel::sync::Mutex on drop), will this execute in softirq
context and cause a scheduling-while-atomic panic?

> +    /// tree.insert(100, ten, GFP_KERNEL)?;
> +    ///
> +    /// let rcu_read_lock =3D rcu::Guard::new();
> +    /// let ten =3D tree.load_rcu(100, &rcu_read_lock);
> +    /// assert_eq!(ten, Some(&10));
> +    ///
> +    /// // Even if the value gets removed, we may continue to access it =
for one rcu grace period.
> +    /// tree.erase(100);
> +    /// assert_eq!(ten, Some(&10));
> +    /// # Ok::<_, Error>(())
> +    /// ```
> +    #[inline]
> +    pub fn load_rcu<'rcu>(
> +        &self,
> +        index: usize,
> +        _rcu: &'rcu rcu::Guard,
> +    ) -> Option<T::RcuBorrowed<'rcu>>
> +    where
> +        T: ForeignOwnableRcu,
> +    {
> +        // SAFETY: `self.tree` contains a valid maple tree.
> +        let ret =3D unsafe { bindings::mtree_load(self.tree.get(), index=
) };

[Severity: Critical]
Does this lockless traversal risk a use-after-free?

Looking at MapleTree::new() and MapleTreeAlloc::new() in
rust/kernel/maple_tree.rs, the tree is initialized with 0 or
bindings::MT_FLAGS_ALLOC_RANGE respectively, without bindings::MT_FLAGS_USE=
_RCU.

If MT_FLAGS_USE_RCU is not set, structural modifications to the tree (like
node splits or merges) will synchronously free the replaced internal tree
nodes directly to the slab allocator via kmem_cache_free(), completely
bypassing call_rcu().

Could a concurrent load_rcu() walking the tree dereference a node pointer
that was just synchronously freed by a writer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605133541.2256=
9-1-boqun@kernel.org?part=3D2

