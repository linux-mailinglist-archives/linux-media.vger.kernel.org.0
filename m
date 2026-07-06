Return-Path: <linux-media+bounces-66759-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vZBKOXOrS2oQYQEAu9opvQ
	(envelope-from <linux-media+bounces-66759-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:19:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C97112AA
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:19:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=YslEi+dT;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66759-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66759-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A7593059D0E
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001283DDB0B;
	Mon,  6 Jul 2026 13:08:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22E3DDB00;
	Mon,  6 Jul 2026 13:08:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343290; cv=pass; b=fJpbD5x7zjGvhhGMqvd2MppDQoOEj9lsnTRnuLxk20psFkgpe6Pq6Shn84LWqvHrfHLvDIA69+h2cjyqCXitK7HGXiUEHCgQO6wPwsxh7LNIM0d29UqHFc1kiERR6096JuFBr37fa1ggEnzHQvuwX8EHrJLAZUZmlluCsF+iyFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343290; c=relaxed/simple;
	bh=fq+0+QAwH1F1vUj2lriyPwJetwSFj9l9LeDiU9FTbPk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Z/SOn9SWX/TYNDYtx+Xu7kGI959+4wgOM5NW0rpGC23RlJFvfLZQTAI0o67UkmMQMJ2+SUJ8c/qK9JGZ3sIZ9ZWL3yqFAhbjiK/a64nsPgtfjGKEOwGTzuopyiXxztwG9EG+WygbJcVkKSJvwwoVhGQFJWgzPjnq19h96Jiy0Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=YslEi+dT; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal: i=1; a=rsa-sha256; t=1783343253; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IE14LecyLTUD2lB/rBI/sQhw9JBIkK+/rC9JEiYegJEji4MhbEKA/hjc5n77dQrUvSPeRvymwPEJmld5wm7FOvD4Z+MlulH0VRCNHUttb7gdHb0W1/JgtEHiA5g9WCk39Cz7J24S2HmN5LvOyjwHyF5xPr+OMpGYaR8Rdi24IjU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783343253; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FMhFvIHqiFILIt2aMFGo+C0rD75x3q8QTjXzqy1UcXQ=; 
	b=gdbWFRB9Z+gyfIwYta2iE7fxgB47WxzAO1LCZyiTWCZxU5GxbP7baazddwpnBDwm7bnmjzWoh25cBtw5RpMHV99koLtDXT1Rg0LZdYdZOE+MNSIBYnYq99n6jgbCWswzdG8qhf64vSjjBmcUOVYrXfJZJWi6AF84RJguwy5643I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783343253;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=FMhFvIHqiFILIt2aMFGo+C0rD75x3q8QTjXzqy1UcXQ=;
	b=YslEi+dTSX0IlNbI9il2u9Yi6zXml0wF5x/6fFpVl/9w/1+CIhvK0D3QKNV4ggM3
	e2bmLV/Fi1c9IljRZ+VVdC05nYbHDTOlvoeOqRZxftJp4lsyB2VmX1L6rZsrJZR4U7h
	/xC6OafhWGrHde+rcf35M+tBLJj6KgPnljltiYEc=
Received: by mx.zohomail.com with SMTPS id 1783343250580972.9098538800296;
	Mon, 6 Jul 2026 06:07:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 0/5] rust / dma_buf: Add abstractions for dma_fence
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260703073141.3962604-2-phasta@kernel.org>
Date: Mon, 6 Jul 2026 10:07:10 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Burak Emir <bqe@google.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Mirko Adzic <adzicmirko97@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B9872CAD-C4F4-40C6-86FF-26559732419F@collabora.com>
References: <20260703073141.3962604-2-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66759-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:gregkh@linuxfoundation.org,m:lina+kernel@asahilina.net,m:bqe@google.com,m:ljs@kernel.org,m:joelagnelf@nvidia.com,m:acourbot@nvidia.com,m:prafulrai522@gmail.com,m:tamird@kernel.org,m:adzicmirko97@gmail.com,m:alistair.francis@wdc.com,m:work@onurozkan.dev,m:shankari.ak0208@gmail.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:phasta@kernel.org,m:lina@asahilina.net,m:shankariak0208@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,linuxfoundation.org,asahilina.net,nvidia.com,gmail.com,wdc.com,onurozkan.dev,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	APPLE_MAILER_COMMON(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 619C97112AA



> On 3 Jul 2026, at 04:31, Philipp Stanner <phasta@kernel.org> wrote:
>=20
> Changes since v4:
>  - Fix an uninitialized memory bug for FenceCbRegistration with
>    ManuallyDrop.
>  - Return FenceCtx as impl PinInit
>  - Make FenceCtx return an impl PinInit<T, Error> (Danilo)
>  - Reformat some comments
>  - Adjust the docu for rcu_barrier(), so that it matches the C side's
>    docu and our docu for rcu::synchronize_rcu().
>=20
> Changes since v3:
>  - Add a FIXME for an encountered Rust compiler bug. (Gary)
>  - Add new Rust files also to DRM drivers & common infrastructure
>    MAINTAINERS file. (Danilo)
>  - Reposition ECANCELED error code. (Miguel)
>  - Replace refcounted FenceCtx in DriverFenceData with a reference =
plus
>    life time. (Boris)
>  - Re-add rcu_barrier() patch, since we now can use it for dropping =
the
>    fence context. (Danilo)
>  - Add forgotten R-b from Alice, and Acks for MAINTAINERS from
>    Christian and Sumit.
>=20
> Changes since v2:
>  - Don't drop DriverFenceData as a whole, but only the members we
>    really want to drop. Gives more robustness. (Gary).
>  - Break apart large pin_init_from_closure(). (Danilo, Onur)
>  - Remove rcu_barrier() and synchronize_rcu() from FenceCtx::drop().
>    FenceCtx might drop in atomic context, where you must not perform
>    those operations. With the current way C dma_fence is designed, the
>    driver must wait for a grace period manually until it unloads.
>  - Repair the DriverFenceBorrow implementation, properly injecting a
>    life time into it. (Danilo)
>  - Fix memory layout bug for rcu_head. (Onur)
>  - Drop RCU patches, since this series doesn't need them anymore.
>=20
> Changes since v1:
>  - Remove unnecessary mutable references (Alice)
>  - Split up unsafe comments where possible (Danilo)
>  - Remove PhantomData + implement FenceCtx ops trait (Boris)
>  - Consistently call FenceCtx generic data `T`. FenceDataType is
>    derived from that. (Boris)
>  - Add abstractions for call_rcu() and synchronize_rcu() (Danilo)
>  - Add ECANCELED error code in Rust (Alice)
>  - Remove the rcu_barrier() from FenceCtx::drop() =E2=80=93 because we =
now use
>    call_rcu(), there can be no UAF access to the FenceCtx anymore. In
>    any case, it is illegal to use either call_rcu() or
>    synchronize_rcu() in FenceCtx::drop(), because our new
>    drop_driver_fence_data() can run in atomic context and might put =
the
>    last fence_ctx reference.
>    So we now only have to guard against module unload, which it seems
>    either the driver or Rust driver-core / module unload =
infrastructure
>    must solve.
>  - Minor formatting etc. changes
>  - Add C helpers to MAINTAINERS. (Danilo)
>  - Ensure that `Fence::is_signaled()` is fully synchronized, i.e., all
>    callbacks really have run. See [1] and [2]. (Myself, Christian
>    K=C3=B6nig)
>=20
> Changes since the RFCs:
>  - Include support for ForeignOwnable for ARef, so that a Fence can be
>    stuffed into an XArray et al. (Code by Danilo)
>  - Implement ForeignOwnable (with new borrow type) for DriverFence, so
>    that it can be stuffed into an XArray.
>  - Include the rcu::RcuBox data type to defer dropping data with RCU
>    (Cody by Alice)
>  - Port DmaFence to RcuBox to make UAF bugs through later, new =
dma_fence
>    callbacks (backend_ops) impossible.
>  - Force users to pass their fence data in an RcuBox (or have it not
>    need drop()) through a Sealed trait.
>  - Document the rules for the user's DriverFence::data's drop
>    implementation very clearly (deadlock danger).
>  - rustfmt, Clippy.
>  - Various style suggestions, safety comments, etc. (=C3=96nur)
>  - Add __rust_helper prefix to helper functions. (=C3=96nur)
>=20
> Changes in RFC v3:
>  - Omit JobQueue patches for now
>  - Completely redesign the memory layout: Instead of a Fence
>    refcounting a DriverFence, both now live in the same allocation to
>    allow for future support the dma_fence backend_ops callbacks which
>    need to do container_of. (mostly Boris's feedback)
>  - Allow for pre-allocating fences to avoid deadlocks when submitting
>    jobs to a GPU. (Boris)
>  - Simultaneously, allow for pre-preparing fence callback objects, so
>    the driver can allocate them when it sees fit. (code largely stolen
>    and inspired by Daniel).
>  - Signal fences on drop, ensure synchronization.
>  - Force users to set an error code when signalling.
>  - Write more documentation
>  - A ton of minor other changes.
>=20
>=20
> [1] =
https://lore.kernel.org/dri-devel/20260608142436.265820-2-phasta@kernel.or=
g/
> [2] =
https://lore.kernel.org/dri-devel/20260612104251.2264707-2-phasta@kernel.o=
rg/
>=20
>=20
> Alright, so since the last RFCs did not reveal significant design
> issues, I decided to transition this series to a v1 and hope that we =
can
> get it upstream.
>=20
> This now includes code for more common infrastructure that dma_fence
> needs, contributed by Danilo and Alice.
>=20
> ---
>=20
> Old cover letter for RFC:
>=20
> So, this is the spiritual successor of the first / second RFC [1]. v2
> also contained code for drm::JobQueue, but mostly to show how the =
fence
> code would be used. JobQueue is under heavy rework right now, so I =
don't
> want to bother your eyes with it. The docstring examples should show =
how
> Rust fences are supposed to be used, though.
>=20
> This v3 contains a huge amount of highly valuable feedback from a
> variety of people, notably Boris, but also from Alice, Gary and =
Danilo.
>=20
> There are some TODOs open (a better trait for fence backend_ops and =
RCU
> support), but my hope is that this effort is now finally approaching =
its
> end.
>=20
> I would greatly appreciate feedback and especially more information
> about what might be missing to make this usable, which is obviously
> where Daniel's and Boris's feedback will be valuable once more.
>=20
> Please regard this patch just as what it's titled: an RFC, to discuss =
a
> bit more and to inform a broader community about what the current =
state
> is and where this is heading at.
>=20
> Many regards,
> Philipp
>=20
> [1] =
https://lore.kernel.org/rust-for-linux/20260203081403.68733-2-phasta@kerne=
l.org/
>=20
> Danilo Krummrich (1):
>  rust: types: implement ForeignOwnable for ARef<T>
>=20
> Philipp Stanner (4):
>  rust: error: Add ECANCELED error code
>  rust: sync: Add abstraction for rcu_barrier()
>  rust: Add dma_fence abstractions
>  MAINTAINERS: Add entry for Rust dma-buf
>=20
> MAINTAINERS                      |   5 +
> rust/bindings/bindings_helper.h  |   1 +
> rust/helpers/dma_fence.c         |  48 ++
> rust/helpers/helpers.c           |   1 +
> rust/kernel/dma_buf/dma_fence.rs | 894 +++++++++++++++++++++++++++++++
> rust/kernel/dma_buf/mod.rs       |  14 +
> rust/kernel/error.rs             |   1 +
> rust/kernel/lib.rs               |   1 +
> rust/kernel/sync/aref.rs         |  40 ++
> rust/kernel/sync/rcu.rs          |  20 +
> 10 files changed, 1025 insertions(+)
> create mode 100644 rust/helpers/dma_fence.c
> create mode 100644 rust/kernel/dma_buf/dma_fence.rs
> create mode 100644 rust/kernel/dma_buf/mod.rs
>=20
>=20
> base-commit: a73a398a68ca9b9e5116a617562471f16b8310c4
> --=20
> 2.54.0
>=20

This works on Tyr :)

For the whole series:

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>=

