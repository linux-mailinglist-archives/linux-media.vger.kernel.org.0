Return-Path: <linux-media+bounces-65097-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VEkiFUJjMmpwzQUAu9opvQ
	(envelope-from <linux-media+bounces-65097-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:05:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FD9697C0E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:05:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=HSE2mk+x;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65097-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65097-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85A8F303578D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 09:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C1339DBCC;
	Wed, 17 Jun 2026 09:04:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D329839DBC0;
	Wed, 17 Jun 2026 09:04:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687097; cv=none; b=LDLo9PG2EBMrF5amatQOVvQNEEMQDxv3LlR+gHKzQt6dmjUlS57zGNVKVTrXSxa/VZFwPqjrraYDgsWYMAG0N26YKqZNVdJc4Rj4qCMgfdvA8wI59rdb1ArqixevWDjNGdXfkkS2sLyUDXqPTjQKDOsxdAS72KK+WXrIgco6KY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687097; c=relaxed/simple;
	bh=JpDMIE9eGFB6UyskqpSUvcOBKplfPJaAeEzY2PP6sTk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IoNiVTYSNQf+mX3kfh/MARcMZaWpKksRLq9kfUq7hfbk/ZyDneUyfpj8LVb0S3Noz/r49AIK+fx9eBCgKgME7BUMvM97jWBwSN/VmClDjiBLcUqQph7rL1BKUM+QTv7R3q4sPx9e++xMUG+Pq+j7LU8sOnFswwEDK1MIf5by5Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HSE2mk+x; arc=none smtp.client-ip=80.241.56.172
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ggHxF409Zz9sdD;
	Wed, 17 Jun 2026 11:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781687089; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JpDMIE9eGFB6UyskqpSUvcOBKplfPJaAeEzY2PP6sTk=;
	b=HSE2mk+xfXWRZLWOFqEHRknfbUXr4MhEQI+xJvg73z4GYG3dVysTzHz9Rwzwz4wJ0lvVX7
	wdqPu5JpGILM33tDMSHinc544+lZTXIFO9kYxQfCEsyOCWiVHObZd5UiQQD9k5XSOZaqKf
	Fl73GDZl2vN8jnmt3MNwTUOjBBPoURLcqHPQuemxOvUzJjCquousLs3YNAp3pEfSc0t0uW
	H4nxKvDB7soe92SzbhXJSlJfDibsDQ0n6B36OhisXgWtlFvwC79eznXv8XsLUIhEFbluE/
	719v1p9t+eADPYqGLH77AeE5wjl8SgunVKi878w+frMz5z0B4F4yxsNtug7zVw==
Message-ID: <e06228542e663bd8020cc91d7646bb7838a3a273.camel@mailbox.org>
Subject: Re: [PATCH v2 5/6] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker	 <frederic@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Uladzislau Rezki	 <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers	
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Zqiang <qiang.zhang@linux.dev>, Daniel Almeida
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>,
 Lorenzo Stoakes	 <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 FUJITA Tomonori	 <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>,  Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is, Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rcu@vger.kernel.org
Date: Wed, 17 Jun 2026 11:04:32 +0200
In-Reply-To: <20260616082819.2943886-7-phasta@kernel.org>
References: <20260616082819.2943886-2-phasta@kernel.org>
	 <20260616082819.2943886-7-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 1aaf220002f8bf35872
X-MBO-RS-META: 1dehra3zret1uhka4pzj76h5abd51hug
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:li
 sts@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65097-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0FD9697C0E

On Tue, 2026-06-16 at 10:28 +0200, Philipp Stanner wrote:
>=20
>=20

[=E2=80=A6]

> Add abstractions for dma_fence in Rust.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

RFC for one thing I'm worried about below

> ---
> =C2=A0rust/bindings/bindings_helper.h=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0rust/helpers/dma_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 48 ++
> =C2=A0rust/helpers/helpers.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0rust/kernel/dma_buf/dma_fence.rs | 884 ++++++++++++++++++++++++++++=
+++
> =C2=A0rust/kernel/dma_buf/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 14 +
> =C2=A0rust/kernel/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A06 files changed, 949 insertions(+)
> =C2=A0create mode 100644 rust/helpers/dma_fence.c
> =C2=A0create mode 100644 rust/kernel/dma_buf/dma_fence.rs
> =C2=A0create mode 100644 rust/kernel/dma_buf/mod.rs
>=20
>=20
>=20

[=E2=80=A6]

> +
> +/// The receiving counterpart of a [`DriverFence`], designed to register=
 callbacks
> +/// on, check the signalled state etc. A [`Fence`] cannot be signalled.
> +/// A [`Fence`] is always refcounted.
> +pub struct Fence {
> +=C2=A0=C2=A0=C2=A0 /// The actual dma_fence passed to C.
> +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> +}
> +
>=20
>=20

[=E2=80=A6]

> +
> +#[repr(C)] // Necessary to guarantee that `inner` always comes first so =
that we can cast.
> +#[pin_data]
> +struct DriverFenceData<T: Send + Sync + FenceCtxOps> {
> +=C2=A0=C2=A0=C2=A0 /// Callback head for dropping this in a deferred man=
ner through RCU.
> +=C2=A0=C2=A0=C2=A0 rcu_head: bindings::callback_head,
> +=C2=A0=C2=A0=C2=A0 #[pin]
> +=C2=A0=C2=A0=C2=A0 /// The inner fence.
> +=C2=A0=C2=A0=C2=A0 inner: Fence,
> +=C2=A0=C2=A0=C2=A0 /// Pointer to access the FenceCtx. Useful for obtain=
ing name parameters.
> +=C2=A0=C2=A0=C2=A0 fctx: Arc<FenceCtx<T>>,
> +=C2=A0=C2=A0=C2=A0 /// The API user's data. This must either not need dr=
op, or must delay its
> +=C2=A0=C2=A0=C2=A0 /// drop by a grace period. It is essential that the =
data only performs
> +=C2=A0=C2=A0=C2=A0 /// operations legal in atomic context in its [`Drop`=
] implementation.
> +=C2=A0=C2=A0=C2=A0 #[pin]
> +=C2=A0=C2=A0=C2=A0 data: T::FenceDataType,
> +}
> +
>=20
>=20
>=20

[=E2=80=A6]

> +pub struct DriverFence<T: Send + Sync + FenceCtxOps> {
> +=C2=A0=C2=A0=C2=A0 /// The actual content of the fence. Lives in a raw p=
ointer so that its
> +=C2=A0=C2=A0=C2=A0 /// memory can be managed independently. Valid until =
both the [`DriverFence`]
> +=C2=A0=C2=A0=C2=A0 /// and all associated [`Fence`]s have disappeared.
> +=C2=A0=C2=A0=C2=A0 data: NonNull<DriverFenceData<T>>,
> +}
> +
> +
>=20

[=E2=80=A6]

> }
> +
> +impl<T: Send + Sync + FenceCtxOps> Drop for DriverFence<T> {
> +=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence =3D self.as_raw();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut fence_flags: usize =
=3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let flag_ptr =3D &raw mut fen=
ce_flags;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `fence` is valid u=
ntil the `call_rcu()` below. `flag_ptr` is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // merely a pointer to an int=
eger, which lives as long as this function.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_fence_=
lock_irqsave(fence, flag_ptr) };
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Use dma_fence_test_signale=
d_flag() instead of dma_fence_is_signaled_locked()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // because the C backend want=
s to get rid of the latter.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `fence` is valid u=
ntil the `call_rcu()` below.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let signaled: bool =3D unsafe=
 { bindings::dma_fence_test_signaled_flag(fence) };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if warn_on!(!signaled) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: `fence` is valid until the `call_rcu()` below. The fence
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // mu=
st not have been signaled yet, which we check directly above.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsaf=
e { bindings::dma_fence_set_error(fence, ECANCELED.to_errno()) };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: `fence` is valid until the `call_rcu()` below. The lock must
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // be=
 held, which we acquired above.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsaf=
e { bindings::dma_fence_signal_locked(fence) };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `fence` is valid u=
ntil the `call_rcu()` below. `flag_ptr` is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // merely a pointer to an int=
eger, which lives as long as this function.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // The lock must be held, whi=
ch we acquired above.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_fence_=
unlock_irqrestore(fence, flag_ptr) };
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid because `sel=
f` is valid.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let rcu_head_ptr =3D unsafe {=
 &raw mut (*self.data.as_ptr()).rcu_head };
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `DriverFenceData` but coul=
d be accessed through some dma_fence callbacks
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // right now. Access is being=
 revoked in principle above by signalling
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // the fence, but since the C=
 backend does not guarantee perfect full
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // synchronization, we have t=
o wait for one grace period to ensure that
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // all accessors of `DriverFe=
nceData` (through the dma_fence_ops accessible
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through a `Fence`) are gon=
e.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `call_rcu()` is al=
ways safe to be called. `rcu_head_ptr` was created
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // validly above. The module =
must perform a `synchronize_rcu()` or
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `rcu_barrier()` call to gu=
ard against module unload.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::call_rcu(r=
cu_head_ptr, Some(drop_driver_fence_data::<T>)) };
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +// TODO:
> +// The entire call_rcu() mechanism in the drop above and the code below =
would be
> +// unnecessary if C's dma_fence_signal() could be reworked in a way that=
 after it
> +// ran, the caller knows that no fence_ops callbacks can be running anym=
ore.
> +// In other words, if the dma_fence backend would use its spinlock for f=
ull
> +// synchronization.
> +//
> +// Then we could move the drop_in_place() and dma_fence_put() upwards in=
to the
> +// drop() implementation and call it a day.
> +
> +/// Finally really drop this `DriverFence<T>`
> +///
> +/// # Safety
> +///
> +/// `head` references the `rcu_head` field of an `DriverFenceData<T>`. A=
ll
> +/// accessors to that `DriverFenceData<T>` must be gone by now. This mus=
t be
> +/// ensured by signalling the associated `DriverFence<T>` and then waiti=
ng
> +/// for a grace period until calling this function here.
> +unsafe extern "C" fn drop_driver_fence_data<T: Send + Sync + FenceCtxOps=
>(
> +=C2=A0=C2=A0=C2=A0 head: *mut bindings::callback_head,
> +) {
> +=C2=A0=C2=A0=C2=A0 // SAFETY: Caller provides a pointer to the `rcu_head=
` field of a `DriverFenceData<C>`.
> +=C2=A0=C2=A0=C2=A0 let fence_data =3D unsafe { container_of!(head, Drive=
rFenceData<T>, rcu_head) };
> +
> +=C2=A0=C2=A0=C2=A0 // SAFETY: `fence_data` was created validly above. Al=
l the fence's data will
> +=C2=A0=C2=A0=C2=A0 // only drop below, but the raw pointer to the raw C =
`dma_fence` remains
> +=C2=A0=C2=A0=C2=A0 // valid because the reference count is only decremen=
ted at the end of the
> +=C2=A0=C2=A0=C2=A0 // function.
> +=C2=A0=C2=A0=C2=A0 let fence =3D unsafe { (*fence_data).inner.inner.get(=
) };
> +
> +=C2=A0=C2=A0=C2=A0 // SAFETY: A grace period has passed. All accessors t=
o that `DriverFenceData`
> +=C2=A0=C2=A0=C2=A0 // are gone now. We have exclusive access and can now=
 drop it.
> +=C2=A0=C2=A0=C2=A0 unsafe { drop_in_place(fence_data) };


Here we would drop DriverFenceData. We do it like that (RCU delay) now
because of two-fold reasoning:

a) dropping too soon could deallocate the FenceCtx, causing UAF.

b) drop_in_place() invalidates the fctx pointer, so the Rust compiler
could hypothetically write some random data for CPU pipelining etc.
reasons into the pointer, despite it still being used from the backend
functions.


So what I'm wondering about is whether we also solved that problem for
DriverFenceData.inner.inner, i.e., the C dma_fence which resides in
that memory, which can be in use by an arbitrary number of refcounting
Fence's

Does Opaque guarantee that the backing memory within DriverFenceData
will never be interfered with in an undefined behavior way? The
documentation does not explicitly seem to state that.


P.

