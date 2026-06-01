Return-Path: <linux-media+bounces-63238-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG/LDGFqHWrqaAkAu9opvQ
	(envelope-from <linux-media+bounces-63238-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 13:17:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B80661E30E
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 13:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA89E300A528
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 11:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63A23A381D;
	Mon,  1 Jun 2026 11:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cPbFnAeS"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF89D38399E;
	Mon,  1 Jun 2026 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312666; cv=none; b=QHEvS+rcnhU01/85qnIGj/XkUcRVuugBKzd6Ql65O5DMuGv0Nc5ujoROl8D0BfUyLkKnXeRamIzgdEz/cPP0NYPaAKhpo1i2uJ647bz17d1D1SwdTf2QqZ4N9zUT3Nu6dgx5VuONADk7Bks4WjcqpGpEG7GIu1E5iSwJbWJzjNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312666; c=relaxed/simple;
	bh=D04O1XsCuuemXbY2YVN0rSer7xhr48HKYGRqzuFlAPQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YRtNcK4iuIbELmcjTw2LfgPebcJ9Ysbmg9EOPYeH0V7B1da5f/3iK+Nu4f3YlKdewNi3inNlJIclTCdJ/1YHt+/vBQT1vVCIaYBxuNafYMtG66sR/otpO+aGyI/5t2zG9fXo25JvWZAPavcSA+H6ohCjbaZFtY3OTAt4vUnenU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cPbFnAeS; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gTWdw0pXfz9tZ4;
	Mon,  1 Jun 2026 13:17:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780312660; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D04O1XsCuuemXbY2YVN0rSer7xhr48HKYGRqzuFlAPQ=;
	b=cPbFnAeSy9iiIQhi43evWGZcVGFHTXNPXi90ZHOokjf+XuWUCknF67LUcSNjDtcSTfW6J0
	M3Q7eVk0KtSZVwvmLiX0nE77hu9cIojWChsZv0J/XTVlU99Bi/9nfwZzkjJU42dVIXyMhG
	ZYdaq1qcoGXROeuiPa1vTaDuI0cgs4L9uEy5Gy9KNcrLJDBMUXa+aCuyBi5IhFo1kcgCfj
	0I8T3aZMcEXrHP4wdyYzMnr4wbIDJPYLp8MoDAuRCFstfuUs7HQb85JEOBjMt2uepu7+oB
	JELjiEK73LfBi3MjC4qn4bGNbFTYTBQtF4ABkbVVGotTOUTaoXz6SH6udW6HmA==
Message-ID: <df2daf200c9a69f497f4285074d2a95425b3dbdd.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Alice Ryhl
	 <aliceryhl@google.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich	 <dakr@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
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
 manos@pitsidianak.is, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Date: Mon, 01 Jun 2026 13:17:27 +0200
In-Reply-To: <20260601125933.17ca4dd5@fedora-2.home>
References: <20260530143541.229628-2-phasta@kernel.org>
		<20260530143541.229628-5-phasta@kernel.org>	<ah1glmXDM-OAKa5h@google.com>
	 <20260601125933.17ca4dd5@fedora-2.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: e4utjoyocfe4p1fqaetun1euskdi8cyn
X-MBO-RS-ID: b921df505de11e783e6
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63238-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9B80661E30E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-06-01 at 12:59 +0200, Boris Brezillon wrote:
> On Mon, 1 Jun 2026 10:36:06 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > > +};
> > > +
> > > +use bindings::ECANCELED;
> > > +
> > > +use kernel::str::CString;
> > > +use kernel::sync::{
> > > +=C2=A0=C2=A0=C2=A0 aref::{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARef,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AlwaysRefCounted, //
> > > +=C2=A0=C2=A0=C2=A0 },
> > > +=C2=A0=C2=A0=C2=A0 Arc,
> > > +=C2=A0=C2=A0=C2=A0 ArcBorrow, //
> > > +};
> > > +
> > > +/// VTable for dma_fence backend_ops callbacks.
> > > +//
> > > +// Mandatory dma_fence backend_ops are implemented implicitly throug=
h
> > > +// [`FenceCtx`]. Additional ones shall get implemented on this trait=
, which then
> > > +// shall be demanded for the fence context data.
> > > +pub trait FenceCtxOps {}=C2=A0=20
> >=20
> > This empty trait is unused.
>=20
> I had initially suggested to add the F type (AKA FenceData) passed
> around in multiple places type as an associated type
>=20
> pub trait FenceCtxOps {
> =C2=A0=C2=A0 type FenceData: Send + Sync;
> }
>=20
> so we don't have to pass both F and C. The reasoning here is that:
>=20
> 1. We expect we'll have to define more methods to the FenceCtxOps trait
> at some point, so adding it now kinda makes sense.
>=20
> 2. In the current design, we've assumed that a Fence can't live/be
> created outside of a given context, so there's no world where the
> FenceData wouldn't be known by the FenceCtx implementation, and forcing
> users to pass F and C around seems needlessly verbose.

I had investigated that, but found that this causes us to write things
like

DriverFence<T> (where T is the FencCtx generic)

and then in the actual implementation use

T::FenceData

which reads very weird IMO. Because now for reasons a fence's own data
are not referred to in its own implementation, but you derive it from
the context.

I do prefer it in a way where the DriverFence generic does appear in
said fence's actual code, on equal rank with the FenceCtx.

I suppose that is actually one use case for which PhantomData does
exist.


P.

