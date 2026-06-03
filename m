Return-Path: <linux-media+bounces-63641-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y6R8BhpgIGpy2AAAu9opvQ
	(envelope-from <linux-media+bounces-63641-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 19:10:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF863A0F8
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 19:10:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TfteH+Qo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63641-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63641-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B59930485FD
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 17:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C63D44BCAE;
	Wed,  3 Jun 2026 17:07:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7DA2D1907;
	Wed,  3 Jun 2026 17:07:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506466; cv=none; b=syZ0/MDr+kyGEhHn47MEKCMD0CufUY13uRWjCfXkAW7J2K6h+OWD8cBprO9+Cc6o3FmBfoyFh0iiTgHGGEKw6XrjjeVoL0ALf/gntOSAGpjCwQ/rp3NtSBGB4rOBj+CkALUnLEIsfdmRWsHObmvYgFOT5L6XSOjgjqZDsBZxKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506466; c=relaxed/simple;
	bh=EOkTGYKrSDYsCnFKice6l3hCAuTmWmjGp248dNODPBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iy378m2aMhYj6mUeVFNYaZQeRwRCD+PUoeQPCbmvOpSC8GDmWBEoVBRmjcyLYTb76pWvFda+Gc1WABucXoE/urQvvZTjR8wsFAgKWtVMAIqIwDPA09SnW0HMypfbC27NZJ0uMN6desX2QugEG9nHE3oDz5AFZHPX8a3c8EantN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfteH+Qo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178941F00899;
	Wed,  3 Jun 2026 17:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780506465;
	bh=SUUl90bBxGO1B6lX433etgqNanyhS7+oA+suoDDsSXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TfteH+Qoi2UJLhzosqfIIf8mQyokOx+B8Df6uoEQj5ZZIk6zmhrL3qeq7M1pQW4ed
	 RWhqwiZTinfwLqDbDa1CzHhZUKrpaF7MJjFBWmtjfc/Q2aXYMDhwYIipNjCtGlo3lR
	 EukoiPXnVwFzvDcVqd8vgIj1HGSO5prweDlFuMXcZU8BKPym4/gTWElsXRuZSQe2Ii
	 Hhn9v7R2wlM3pwkjaWwFRz+iDIi3Y3sW8xPimYi5z3JTuTZQvEONwqYU/L+Lq7TMEa
	 Vj62kj/kmRDbd0+BSV1CtTV0WLoKJ/2cB8iSQjPnsELiZQHoqTG1wqgXDVomZ3uZMN
	 yHczZCfpUoC8g==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5A4D3F4006B;
	Wed,  3 Jun 2026 13:07:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 03 Jun 2026 13:07:43 -0400
X-ME-Sender: <xms:X18gasfGP5WcJmRki7zFq4so53It1xccZCfFWaT6Hq0XZ34UEyTeMQ>
    <xme:X18gaq-Wl0hSECTaITk6GuiIZbduhh51691-7DSbdeHhFvd6Zdn-mRNl2j24Lebpb
    9dkKH0SKrAW0qvnbdi53a9kuk-pB2n8lR57AiuiYRyfK9L7aqFUBg>
X-ME-Received: <xmr:X18gatEsYo1r8PORpvF8kmnRVvAJFelUrbFYvXTODfyPckwQxL6CAWlnPro>
X-ME-Proxy-Cause: dmFkZTEmLONpDl4bNrf+o6zh7xRwbhEQE5eD6c9jTYvZefMuZUkAi41AL8/OImTsC5i9Mv
    FCCYs9wuRgz0cwFVweEieedbLvtPWT2IVkFzHB8M2gC2apblN7NZFhdha5TasqrGtLE0qy
    uIFSFmNz9Lwt+qCdl/hUIX47wQGCUJhI/PqG3lSm+S3E8T/HrzvKYpzCKB5a5bEtK9KZcE
    CMnNtMh8kbiM+DSZG5zwYSR8lQ1de20HcPwXFuxABzYpPX+w4AEioZfxRDq1QUiV6eAz25
    vHt34XXB4KaYPV9tPS+WT9MlsKuCFZ8Tp5uyQHVL4WDmpYCj9OUyEoAu750SBIL33RqdVI
    sGjIp7TDKYLDYzMPP87uaKBHVSrVdlm6LSToUW8e8AVbRZpj3y+rIe931HDmtONaaVHNPF
    zTTnO0fWMvmfjPAgFCd/f5aGuNUVrt5pBf3AhH4whkLI9eRP8qA8n4Ru4N62/JUgZMMYny
    zKViaMAMl/LmRM77fir82u82yv30qb0yXfSxdhtv/TukBnU6HY6ocUrPvw8GbvH/VmOjs4
    11wKcORvSUIGO9DJ8pePVF0iEM1hwLzIq2gh+FIDAaGMg+BCNI8fFB2ROY+gZDGUL9T5V5
    IH7JT93x17OaMC4zb7LSu/152uWJE89gBIskOFls7Blfaf9fadIdVj3GlhUw
X-ME-Proxy: <xmx:X18gaqk1IckXChj5H7pyCrpWGmMYXi6l9in6aRoJhVAUPQ-IVthOcA>
    <xmx:X18gas8RkAZTqd-KhhEdJVsrJlLE_83qQCncY9M_wUolG19Dnvb0dg>
    <xmx:X18gaoDTBH01zwmcDY87i6AY1xqFm5jTBn2C5urzdrN0C96Y5_PGlw>
    <xmx:X18gat37pIGsmg_BM76LACgIPSu_9Jn-z63Wk_HEhhqd_rXmnJWMbw>
    <xmx:X18gavp0e1F0JueB3GAC1kMjwesAjWRRJwfxQz-_ruRYPzj-DJCcDKAa>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 13:07:42 -0400 (EDT)
Date: Wed, 3 Jun 2026 10:07:41 -0700
From: Boqun Feng <boqun@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Igor Korotin <igor.korotin@linux.dev>,	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, rcu@vger.kernel.org
Subject: Re: [PATCH 2/4] rust: rcu: add RcuBox type
Message-ID: <aiBfXXnD0MA-7p2F@tardis-2.local>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-4-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530143541.229628-4-phasta@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63641-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@
 gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,tardis-2.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77FF863A0F8

On Sat, May 30, 2026 at 04:35:10PM +0200, Philipp Stanner wrote:
> From: Alice Ryhl <aliceryhl@google.com>
> 

A few minor things below:

[...]
> diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/rcu_box.rs
> new file mode 100644
> index 000000000000..2508fdb609ec
> --- /dev/null
> +++ b/rust/kernel/sync/rcu/rcu_box.rs
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2026 Google LLC.
> +
> +//! Provides the `RcuBox` type for Rust allocations that live for a grace period.
> +
> +use core::{ops::Deref, ptr::NonNull};
> +
> +use kernel::{

Let's use `crate::` here since RcuBox is part of the kernel crate.

> +    alloc::{self, AllocError},
> +    bindings,
> +    ffi::c_void,
> +    prelude::*,
> +    sync::rcu::{ForeignOwnableRcu, Guard},
> +    types::ForeignOwnable,
> +};
> +
> +/// A box that is freed with rcu.
> +///
> +/// The value must be `Send`, as rcu may drop it on another thread.
> +///
> +/// # Invariants
> +///
> +/// * The pointer is valid and references a pinned `RcuBoxInner<T>` allocated with `kmalloc`.
> +/// * This `RcuBox` holds exclusive permissions to rcu free the allocation.
> +pub struct RcuBox<T: Send>(NonNull<RcuBoxInner<T>>);
> +
> +struct RcuBoxInner<T> {
> +    value: T,
> +    rcu_head: bindings::callback_head,

Probably should reorder these fields.

> +}
> +
> +// Note that `T: Sync` is required since when moving an `RcuBox<T>`, the previous owner may still
> +// access `&T` for one grace period.
> +//
> +// SAFETY: Ownership of the `RcuBox<T>` allows for `&T` and dropping the `T`, so `T: Send + Sync`
> +// implies `RcuBox<T>: Send`.
> +unsafe impl<T: Send + Sync> Send for RcuBox<T> {}
> +
> +// SAFETY: `&RcuBox<T>` allows for no operations other than those permitted by `&T`, so `T: Sync`
> +// implies `RcuBox<T>: Sync`.
> +unsafe impl<T: Send + Sync> Sync for RcuBox<T> {}

@Alice, we have `T: Send` mostly because `RcuBox` itself has the `T:
Send` bound? I.e. the to be `Sync` we actually don't need `T` being
`Send`, right?

Regards,
Boqun

[...]

