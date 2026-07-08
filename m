Return-Path: <linux-media+bounces-66993-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XfM5IPxRTmrBKgIAu9opvQ
	(envelope-from <linux-media+bounces-66993-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:34:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B595D726D77
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:34:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=SJ+FOWX4;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66993-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66993-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 271573064454
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4562D060B;
	Wed,  8 Jul 2026 13:29:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1353451A9;
	Wed,  8 Jul 2026 13:29:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517386; cv=none; b=TExHjemBiFph6QItGJzQ7s9TYelB2iqFxYNPgt7PLd6umSfEYWSF0y/IxdRDhVaNJxMcR7zYLT/R88h/0MzPo0vSuPaK+szyQKoP5oSVBVPrEm2JfdhbBoDMyjexK16OfL7tWng22Z1TXN+grrbQT7rs+nR+fTnyaAlUSN1GNzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517386; c=relaxed/simple;
	bh=fQ4eodHnC2Wd8oYv7fQS19erM8JlDyvxJg/CQU+4uTQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UbqdP9/oJ5q9LEWyEqoLQeo0uEf4v3z2XXqUuv3BeglPGqWS4hShNwtAsx41swxBfzRHyzQ/VY++itlTdygEJLgKLQMirX81hFasqOZKqd/UW+CqbxR+9i5zeOGZq9ODqVD5jDbnaSFiLPSlJKQFmMgMAXt4AOeFwAIBEaWj3ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SJ+FOWX4; arc=none smtp.client-ip=80.241.56.172
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gwJq831JYzMlGX;
	Wed, 08 Jul 2026 15:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783517380; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+QzoStC3POLvanG8ZLxpgomra4Mq3Lf3oEAWOgFql8=;
	b=SJ+FOWX4vFmAla8qj17/+0Pkuugs68BdDuOZbdI9m4etSGdWRvIHqksjIzlS628SASzyNR
	KUPuAEN2F+d2nP5dm5oJmToHAx6/rGkovRSSvuvYNJw4KEipQgNs6ypGI36iGA3OT+v0zP
	ckLJYh2oyXgqaptLNEQ6df75tzywBssmzdoFvUPiqIR80LQnZMii7jWW8fQt2GW5sMbKUQ
	rz5gVk4GXSyyi3WPj18hBS6neyBkRme4/3JrBS4lnJ1LpMb/A5KTfh1XTz/tIDI5KPpgL3
	MSR39yvd7shKThIgh60krfYf4m9FbcKLfIFGGL9Y9R/XmzqC2qTe6QCVdPZi3w==
Message-ID: <099ab4b0fd40c476fcb5fa804800794f11758416.camel@mailbox.org>
Subject: Re: [PATCH v5 4/5] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Asahi Lina
 <lina+kernel@asahilina.net>, Burak Emir <bqe@google.com>,  Lorenzo Stoakes	
 <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Alexandre Courbot
	 <acourbot@nvidia.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, Tamir
 Duberstein <tamird@kernel.org>, Mirko Adzic <adzicmirko97@gmail.com>,
 Alistair Francis	 <alistair.francis@wdc.com>, Onur =?ISO-8859-1?Q?=D6zkan?=
 <work@onurozkan.dev>,  Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Date: Wed, 08 Jul 2026 15:29:29 +0200
In-Reply-To: <20260703073141.3962604-6-phasta@kernel.org>
References: <20260703073141.3962604-2-phasta@kernel.org>
	 <20260703073141.3962604-6-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 58600b92efd2db828a6
X-MBO-RS-META: jonfcbxufdzn7z77mwmxrqxzisg6c981
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-66993-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,collabora.com,linuxfoundation.org,asahilina.net,nvidia.com,gmail.com,wdc.com,onurozkan.dev];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina+kernel@asahilina.net,m:bqe@google.com,m:ljs@kernel.org,m:joelagnelf@nvidia.com,m:acourbot@nvidia.com,m:prafulrai522@gmail.com,m:tamird@kernel.org,m:adzicmirko97@gmail.com,m:alistair.francis@wdc.com,m:work@onurozkan.dev,m:shankari.ak0208@gmail.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:lina@asahilina.net,m:shankariak0208@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B595D726D77

On Fri, 2026-07-03 at 09:31 +0200, Philipp Stanner wrote:
>=20
> +// Necessary to guarantee that `inner` always comes first and can be fre=
ed by C.
> +// Also useful for using casts instead of container_of().
> +#[repr(C)]
> +#[pin_data]
> +struct DriverFenceData<'a, T: Send + Sync + FenceCtxOps> {
> +=C2=A0=C2=A0=C2=A0 #[pin]
> +=C2=A0=C2=A0=C2=A0 /// The inner fence.
> +=C2=A0=C2=A0=C2=A0 // Must always be the first member so that unsafe cas=
ting works; but also
> +=C2=A0=C2=A0=C2=A0 // necessary so that the C backend can free the alloc=
ation (coming from our
> +=C2=A0=C2=A0=C2=A0 // Rust code) with kfree_rcu().
> +=C2=A0=C2=A0=C2=A0 inner: Fence,
> +=C2=A0=C2=A0=C2=A0 /// Callback head for dropping this in a deferred man=
ner through RCU.
> +=C2=A0=C2=A0=C2=A0 rcu_head: bindings::callback_head,
> +=C2=A0=C2=A0=C2=A0 /// Reference to access the FenceCtx. Useful for obta=
ining name parameters.
> +=C2=A0=C2=A0=C2=A0 fctx: &'a FenceCtx<T>,
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
> +pub struct DriverFence<'a, T: Send + Sync + FenceCtxOps> {
> +=C2=A0=C2=A0=C2=A0 /// The actual content of the fence. Lives in a raw p=
ointer so that its
> +=C2=A0=C2=A0=C2=A0 /// memory can be managed independently. Valid until =
both the [`DriverFence`]
> +=C2=A0=C2=A0=C2=A0 /// and all associated [`Fence`]s have disappeared.
> +=C2=A0=C2=A0=C2=A0 data: NonNull<DriverFenceData<'a, T>>,
> +}
> +
> +/// A pre-prepared DMA fence, carrying the user's data and the memory it=
 and the
> +/// fence reside in. Only useful for creating a [`DriverFence`]. Splitti=
ng
> +/// allocation and full initialization is necessary because fences canno=
t be
> +/// allocated dynamically in some circumstances (deadlock).
> +pub struct DriverFenceAllocation<'a, T: Send + Sync + FenceCtxOps> {
> +=C2=A0=C2=A0=C2=A0 /// The memory for the actual content of the fence.
> +=C2=A0=C2=A0=C2=A0 /// Handed over to a [`DriverFence`], or deallocated =
once the
> +=C2=A0=C2=A0=C2=A0 /// [`DriverFenceAllocation`] drops.
> +=C2=A0=C2=A0=C2=A0 data: KBox<DriverFenceData<'a, T>>,
> +}

One issue that I'm only discovering just now is that the request of
deriving the DriverFence's generic through the FenceCtx's generic
causes issues like this:


struct DriverFoo {
  f: DriverFence<()>, // error: must implement FenceCtxOps
}

IOW, all DriverFence::data now must implement the trait. Which is
obviously not what we want.

But I cannot get easily get rid of it. See DriverFenceData.

@Boris: Do you have a suggestion? Otherwise I'd want to default back to
PhantomData, which I still believe is cleaner.


P.

