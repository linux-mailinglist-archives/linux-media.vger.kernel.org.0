Return-Path: <linux-media+bounces-63234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBujMTViHWojZwkAu9opvQ
	(envelope-from <linux-media+bounces-63234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 12:43:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15161DBFE
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 12:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C0C730234FF
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 10:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2777D396B96;
	Mon,  1 Jun 2026 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FZDYr+FU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137F0393DDD
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309218; cv=none; b=p8Z0sntrAIeJZrhugpb/I1ZiLLizBcKLlNv7YdyzjVmGD59lIRy5KpIeehfd7wNspyVzOAx+nNeitvs/Y0xXKuMXCwIhdIy4BuE7UifVp5Nn1FTU6T9+Ilp9vRc2NWt2B8ydGOfAhsR7EqQkurLcE1bwyFGP0tfMwIAqSUUH1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309218; c=relaxed/simple;
	bh=VkHk4No+sn/hTRAoCJ6c2rKomSzgYN5lIjBaYnFIVOE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TVmpUG+jgAzrmWigbund/dUGzLtPO1bddIA5P+hpmFHyg0ZaIwP1JvITdBhU3FfNJPgtvLOJvhIJ9KoKMwgDL11hI3UWd8vQUmazHzbkH8Nc5SY7U1yK1tN8C8aQtDRYHb+Ypl1Nzx3OUmJiaHuQgTBxDGiKoI/BtY6IPWpHIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FZDYr+FU; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-45eec27f5a5so2104783f8f.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780309214; x=1780914014; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPi/JDyDp1v6pzp0p/cJ1JGw5JpKb6KywybUTo910mg=;
        b=FZDYr+FUHuKsPYLQC0jHGy5EOWrcSd607cOf9LP/6wlNW9YPV/dvvq8WpM7J71kKyE
         s7m2L1o/jeGyr+pvdt4IHlYHvPirK6VL+cjWwx7ndH5cpEbw+Oji/3MKC5PKvYJ1zZgA
         QkeHzCkRE6dU6NdMLEwciYenJXayusT7Y8lAL09jlGZkpnRN+qjpPniRM73X/XnbHh4B
         FJxA2ITlrfuh0tCNKMIjsaThzjllv63P7RQVy4p+tkzd5Dh0HCZhE8nNHpvcgJb1IOJ4
         lN3JJMtZ74nGhJ8etSsdJsjouaK6KrETkLkIl7DJI+OaOm3zaLIDOrG4e63FJuFOLJba
         88pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309214; x=1780914014;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPi/JDyDp1v6pzp0p/cJ1JGw5JpKb6KywybUTo910mg=;
        b=FE1Tqi5R0effn+76UKCca2nju6hYd3aEBaaoh1ayLnCN2kxUKSJZasj3jP6/8KrW0O
         m+k4ZUuOaL59Q024OoaG04WwT8KzMM57W0qAleoY3HmR+eS9z7y9nELSDEaMXEAealkW
         vWc+4fyuHZHWuukuULDqIq8bRkCczmBoYVhjDehkIRwthxbmOrbq8O+Xp29K7tCuRJqm
         WRgQnHgiTetlKULZvjCL8p4dX8tpFvB7PionsJOrKcXbScjYf/G35+28zy2NdpkZiSDv
         mPA40yPFAjBf7IqgVBABo0ZCQlmE9avGLtmGi1VPC59q8qAaR3tYzzr+Zm+c0W2Hhrrs
         Nafw==
X-Forwarded-Encrypted: i=1; AFNElJ85fwTXCypXDM39g7vvKpgiydw4mPWU+fvSRSex0GeWu1wkjVSSYJ5eZU8bVzskvanOzbNFE4zBnZ3aZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywls5ZI4P0qkph2MW0fhAsBScVVXj7Nnd3BPhmz5q5QzFu4c2n2
	XeEa1OV6O29FuWhqmSZ73FtcN7J5HykJ9PpV/PQbM62nGq+aBRIvCRAf/x+bOFQF6ndSUEa+zFu
	6czJx1VQyCufl2f507w==
X-Received: from wrmg6.prod.google.com ([2002:adf:e406:0:b0:45e:f121:4e17])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:45d0:0:b0:45e:ea9b:edfb with SMTP id ffacd0b85a97d-45ef6b8b5f5mr15231355f8f.39.1780309213836;
 Mon, 01 Jun 2026 03:20:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:20:12 +0000
In-Reply-To: <20260530150622.393FC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260530143541.229628-5-phasta@kernel.org> <20260530150622.393FC1F00893@smtp.kernel.org>
Message-ID: <ah1c3NSU-4UkdUhb@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63234-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5C15161DBFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.org wrote:
> > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > +    fn as_raw(&self) -> *mut bindings::dma_fence {
> > +        // SAFETY: Valid because `self` is valid.
> > +        let fence_data = unsafe { &mut *self.data.as_ptr() };
> 
> [Severity: High]
> Does this create an exclusive mutable reference to actively shared memory?
> 
> DriverFenceData can be accessed concurrently by other threads holding Fence
> references (for instance, when checking if the fence is signaled). Creating
> a mutable reference (&mut) in Rust asserts exclusive access and violates
> aliasing rules, which allows the compiler to make invalid optimization
> assumptions.
> 
> Could this use an immutable reference &*self.data.as_ptr() instead?

Yes, please use an immutable reference here.

> > +
> > +        fence_data.inner.inner.get()
> > +    }
> 
> [ ... ]
> 
> > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> > +    fn as_raw(&self) -> *mut bindings::dma_fence {
> > +        // SAFETY: Valid because `self` is valid.
> > +        let fence_data = unsafe { &mut *self.data.as_ptr() };
> 
> [Severity: High]
> Similar to DriverFence::as_raw(), does this also incorrectly create a
> mutable reference to shared data?

Here as well.

> > +
> > +        fence_data.inner.inner.get()
> > +    }
> 
> [ ... ]
> 
> > +impl<F: Send + Sync, C: Send + Sync> Drop for DriverFence<F, C> {
> > +    fn drop(&mut self) {
> > +        let fence = self.as_raw();
> > +        let mut fence_flags: usize = 0;
> > +        let flag_ptr = &raw mut fence_flags;
> > +
> > +        // SAFETY: Once a `DriverFence` is initialized, the inner `fence` is
> > +        // valid and initialized. It is valid until the refcount drops
> > +        // to 0, which can earliest happen once the `DriverFence` has been dropped.
> > +        unsafe {
> > +            bindings::dma_fence_lock_irqsave(fence, flag_ptr);
> > +            #[allow(unused_unsafe)]
> > +            if warn_on!(!bindings::dma_fence_is_signaled_locked(fence)) {
> > +                bindings::dma_fence_set_error(fence, ECANCELED as i32);
> 
> [Severity: High]
> Is it intentional to pass a positive error code here?
> 
> bindings::ECANCELED evaluates to a positive integer, but
> dma_fence_set_error() expects a negative error code (and triggers a WARN_ON
> for positive values). A positive value might also be interpreted as success
> by callers checking for values < 0.
> 
> Should this be - (bindings::ECANCELED as i32)?

Please use ECANCELED.to_errno(). Do not import these from bindings.

> > +                bindings::dma_fence_signal_locked(fence);
> > +            }
> > +            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> > +        }
> > +
> > +        // SAFETY: `self.data` is owned by the DriverFence, but could be accessed
> > +        // through some dma_fence callbacks right now. Access is being revoked
> > +        // above by signalling the fence. The DriverFenceAllowedData trait
> > +        // ensures that the data either does not need drop, or if it does it
> > +        // lives in a RcuBox which will delay dropping by one grace period, hence
> > +        // ensuring that all readers have disappeared.
> > +        unsafe { drop_in_place(self.data.as_ptr()) };
> 
> [Severity: Critical]
> Could this eagerly drop FenceCtx and user data before the C dma_fence
> refcount reaches 0?
> 
> The C dma_fence object can remain alive as long as consumers (like sync_file
> or the GPU scheduler) hold references to it. If the backend later invokes
> callbacks like ops->get_driver_name(), FenceCtx::get_driver_name() would
> attempt to read fctx.driver_name from the already-dropped FenceCtx:
> 
> FenceCtx::get_driver_name() {
>     ...
>     fctx.driver_name.as_char_ptr()
> }
> 
> Can this result in a use-after-free?

Hmm, I don't know about what sahisko said, but I don't think this is the
right way to do rcu freeing. I think the type's destructor should be
reserved for cases where the value becomes immediately unusable.

For example, let's say I'm using RcuBox<_> here. Yes, the data you get
from dereferencing the RcuBox will stay alive for a grace period, but
IMO once you run the destructor of the box itself, the *pointer* becomes
immediately unusable.

Alice

