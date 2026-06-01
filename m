Return-Path: <linux-media+bounces-63259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNw+C0iJHWrAbQkAu9opvQ
	(envelope-from <linux-media+bounces-63259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:29:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2486200B2
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 041623056691
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059EC3A71B6;
	Mon,  1 Jun 2026 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gPF45CLn"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306D63546EA;
	Mon,  1 Jun 2026 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320259; cv=none; b=PZi+0gDxso5Rvw+FNsjOBWEih6Hk3aVPzxsSCUKFYU7QmIrhM7Bg7FXIeYpUsgJP35ow/w7DFdB4ShhrK8MYaCRBr8D5+ekBeZlEYFinrVmCBDCtoWKGXI2ERLGavTuw5YoQPak/lb7MZegxiNyFCwFq1CWPWWyVL6RD39AfJa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320259; c=relaxed/simple;
	bh=JS+OPS7x1cO1PMKz8ZECCil0lEgdhEJIwO7HESt43MI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FAKzUFejhXM9fq72tz47PiEwCi6TczBYg5BBWj7MDohcStei1f47OLkuurSBCsxpTlbdbiHrsyEdlAqlH54J8z1oon5F10Fq/hAOjMwBmudXkumggX2XxeW7rqnABVj8hfi4HmxgxAi8s3S1ZVphRihpzF58Gdov+sdOdcukSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gPF45CLn; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gTZRx32g1z9t5q;
	Mon,  1 Jun 2026 15:24:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780320253; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JS+OPS7x1cO1PMKz8ZECCil0lEgdhEJIwO7HESt43MI=;
	b=gPF45CLnID21mTvUj8xYxRxQ4VVX63G+B/lBvLd79ubtNLtcW6sG3MBSAarTv0CJdDN4ia
	zxJh+aMNgCiC9PPihcVEtfE8QTdvHIDxquNne/sF9K+r1knfcjpHjMlCe3PADwg5/8iNb6
	2xuLHV35z+m1/IsS/rDoleuarPBUeDC3d9AQaj00AGVosGnwof08MGPHJlP/y5koXJq+PN
	4KzwD3KZqzalMOFuS6wfcvZUs9dLqoBCzCpidBaEBstyuBDJwUfKRKHLqBTFqPVml2RTxH
	fQpc6XSn5xXaKpZ5aIJ85yQDOfuwHvVh0qTCR/H4ts6fnHMOz081InXbqqcjpA==
Message-ID: <3829028571be1886b99018040782ef94369b9523.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich	 <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, "Paul E.
 McKenney" <paulmck@kernel.org>,  Frederic Weisbecker	
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki	 <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>,  Zqiang <qiang.zhang@linux.dev>, Daniel Almeida
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>,
 Lorenzo Stoakes	 <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 FUJITA Tomonori	 <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>,  Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is, Boris Brezillon <boris.brezillon@collabora.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, rcu@vger.kernel.org
Date: Mon, 01 Jun 2026 15:23:58 +0200
In-Reply-To: <CAH5fLgiZb5fqfXGQMicPp+UbBi3JMN8ZNG_Ldt5KiSk+btVCSA@mail.gmail.com>
References: <20260530143541.229628-2-phasta@kernel.org>
	 <20260530143541.229628-5-phasta@kernel.org> <ah1glmXDM-OAKa5h@google.com>
	 <0ea6b6fdd1e3f1e07445f17c0bf672524938dc85.camel@mailbox.org>
	 <ah19ZVkr7b3m7V_u@google.com>
	 <3b216f24afb406b797b8bbb73b3f5c0eec2fdc6c.camel@mailbox.org>
	 <CAH5fLgiZb5fqfXGQMicPp+UbBi3JMN8ZNG_Ldt5KiSk+btVCSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 500ef5b9c544510e11b
X-MBO-RS-META: rijzzpg3g9rqd1qiwy9fj7s3yrfy4jry
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63259-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,zulipchat.com:url]
X-Rspamd-Queue-Id: 9C2486200B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-06-01 at 15:22 +0200, Alice Ryhl wrote:
> On Mon, Jun 1, 2026 at 2:47=E2=80=AFPM Philipp Stanner <phasta@mailbox.or=
g> wrote:
> >=20
> > On Mon, 2026-06-01 at 12:39 +0000, Alice Ryhl wrote:
> > > On Mon, Jun 01, 2026 at 02:26:17PM +0200, Philipp Stanner wrote:
> > > > On Mon, 2026-06-01 at 10:36 +0000, Alice Ryhl wrote:
> > > > > On Sat, May 30, 2026 at 04:35:11PM +0200, Philipp Stanner wrote:
> > > > > > +/// A trait to enforce that all data in a [`DriverFence`] eith=
er does not need
> > > > > > +/// drop, or lives in a [`RcuBox`].
> > > > > > +pub trait DriverFenceAllowedData: private::Sealed {}
> > > > > > +
> > > > > > +mod private {
> > > > > > +=C2=A0=C2=A0=C2=A0 pub trait Sealed {}
> > > > > > +}
> > > > > > +
> > > > > > +impl<F: Copy> DriverFenceAllowedData for F {}
> > > > > > +impl<F: Send> DriverFenceAllowedData for RcuBox<F> {}
> > > > > > +
> > > > > > +impl<F: Copy> private::Sealed for F {}
> > > > > > +impl<F: Send> private::Sealed for RcuBox<F> {}
> > > > >=20
> > > > > Why sealed? Just make the trait unsafe and require the things you
> > > > > require from the user.
> > > >=20
> > > > This is far better. We definitely only allow the user to pass A or =
B,
> > > > and only then it compiles.
> > >=20
> > > What if I have another type that I want to use here? For example, may=
be
> > > I have a struct containing a copy field and an RcuBox. Or maybe I hav=
e
> > > an ARef<_> of some C type that uses rcu for cleanup. Then I must edit
> > > this file to add support for it?
> > >=20
> > > > The unsafe implementation could be messed up.
> > > >=20
> > > > I thought that's what Sealed is for. Or isn't it?
> > >=20
> > > Sealed is for making 100% sure that downstream crates/drivers cannot
> > > provide their own implementations. But I don't see why you need that.
> > > All you require is that the value remains valid for one grace period
> > > after cleanup begins. As long as the type satisfies that, you are hap=
py.
> > > An unsafe trait can require that sort of requirement from the user.
> > >=20
> > > I think what you want is expressed well by `RcuFreeSafe` from this
> > > thread:
> > > https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/t=
opic/Consolidate.20.60PollCondVarBox.60.20into.20.60Rcu.2ABox.60/near/59872=
6724
> > >=20
> >=20
> > I guess this is a question of design principles. If you demand an
> > RcuBox, you have a guarantee that it's safe.
> >=20
> > If you demand an unsafe trait, you open the possibility for people
> > messing up.
> >=20
> > Due to the unsafe-contract you'd have moved the responsibility for the
> > soundness to the driver.
> >=20
> > I would not want to block your suggestion, but I am not sure whether
> > that's really the better design idea.
>=20
> Yes, it's a design principle. You are saying that if someone needs to
> do X but might get it wrong, we should take away the ability to do X?
> I fundamentally disagree with that principle. Unsafe traits is the
> tool Rust created for the exact problem you have; marking places where
> you should be careful is the entire point of 'unsafe'.

I mean, fine by me if the others don't disagree.

But when then do you ever really want a Sealed trait?

P.

>=20
> Alice

