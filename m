Return-Path: <linux-media+bounces-63249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDIcBZ5/HWotbQkAu9opvQ
	(envelope-from <linux-media+bounces-63249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:48:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F25A161F855
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30DC93021D1E
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3583793CA;
	Mon,  1 Jun 2026 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JG6hvLtd"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2628287E;
	Mon,  1 Jun 2026 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318075; cv=none; b=LFhCG9mXJ7g3OfDWmN4qs5EE9sqDSOe6YoA7+2FT9BEeMcPk6qrFji+j309uGfzd3SHoGSHPzj7ss6pLfAurJK4yciFPdOZrzqgq2JUK1VM7115mSCtuGKMZ0x1euW+qmzStXYltL1hgZAKTX1Z9RLYk+Xmuvtb939McBK1knbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318075; c=relaxed/simple;
	bh=5YOffrb6TuISTmHSo0qRYfjsVC3kJaH+9CwYeMAL1Oc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cXODelSXf5kqFXrTfSHnW5fsrIlhAuywlzgVI4xGPBa6tOsNpkWgvgmvheAuylJe5cLOqAGW68QfmSzyXcM3Ikk6372lwEASA4xohh31fVCK0jEqVOz8zP1h74Q5QeDCJLxvP9BJ9v/VcCc73wy3tGFIYISWLo6vBLj0pGy8GU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JG6hvLtd; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gTYdx5kN3z9svK;
	Mon,  1 Jun 2026 14:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780318069; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YOffrb6TuISTmHSo0qRYfjsVC3kJaH+9CwYeMAL1Oc=;
	b=JG6hvLtdgAJuiXUOzLhugnRCckVKHn4IG120YlvzT92cVxFT5/AynE7XGq4r1kGzAAE8mq
	SJVoCZJ/wt05vCn324jWIGjDg6Xs32LVjBKk+scs4B1Rv2UXckNg/ZBgUNK2JsrQz9XpFo
	nhYaeXhmvi7qhCjAcNx+nQFXm4DnmJr5mfbyhiZ06oaK2RTSPliLhsvH66i8ba8DJahHo+
	5xXrVvEZogcNtJRjwmVq9Qd1FKhKI/ZxBo3ZIiDQLGOkskEfse3i7Q99dTCQYJ3aHguTtE
	FzDxZeXbI8StRbe6a5MXWLP//c+SgmyEO9imq7DCxco4h0IaCTbpD7iQwZKmhg==
Message-ID: <3b216f24afb406b797b8bbb73b3f5c0eec2fdc6c.camel@mailbox.org>
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
Date: Mon, 01 Jun 2026 14:47:37 +0200
In-Reply-To: <ah19ZVkr7b3m7V_u@google.com>
References: <20260530143541.229628-2-phasta@kernel.org>
	 <20260530143541.229628-5-phasta@kernel.org> <ah1glmXDM-OAKa5h@google.com>
	 <0ea6b6fdd1e3f1e07445f17c0bf672524938dc85.camel@mailbox.org>
	 <ah19ZVkr7b3m7V_u@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: bspshuqdn1yjkm5ampzssxemt6wdpphn
X-MBO-RS-ID: 3aa08b834777349d892
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
	TAGGED_FROM(0.00)[bounces-63249-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,zulipchat.com:url]
X-Rspamd-Queue-Id: F25A161F855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-06-01 at 12:39 +0000, Alice Ryhl wrote:
> On Mon, Jun 01, 2026 at 02:26:17PM +0200, Philipp Stanner wrote:
> > On Mon, 2026-06-01 at 10:36 +0000, Alice Ryhl wrote:
> > > On Sat, May 30, 2026 at 04:35:11PM +0200, Philipp Stanner wrote:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 bindings::dma_fence_remove_callback(self.fence.as_raw(), self.cb.get());
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > Formatting nit: Usually the ; goes outside the unsafe block.
> >=20
> > I could have sworn that it was rustfmt who did that? Maybe because the
> > ; was inside to begin with.
>=20
> Indeed, rustfmt will not change whether the ; is inside or outside the
> unsafe block.
>=20
> > > > +/// A trait to enforce that all data in a [`DriverFence`] either d=
oes not need
> > > > +/// drop, or lives in a [`RcuBox`].
> > > > +pub trait DriverFenceAllowedData: private::Sealed {}
> > > > +
> > > > +mod private {
> > > > +=C2=A0=C2=A0=C2=A0 pub trait Sealed {}
> > > > +}
> > > > +
> > > > +impl<F: Copy> DriverFenceAllowedData for F {}
> > > > +impl<F: Send> DriverFenceAllowedData for RcuBox<F> {}
> > > > +
> > > > +impl<F: Copy> private::Sealed for F {}
> > > > +impl<F: Send> private::Sealed for RcuBox<F> {}
> > >=20
> > > Why sealed? Just make the trait unsafe and require the things you
> > > require from the user.
> >=20
> > This is far better. We definitely only allow the user to pass A or B,
> > and only then it compiles.
>=20
> What if I have another type that I want to use here? For example, maybe
> I have a struct containing a copy field and an RcuBox. Or maybe I have
> an ARef<_> of some C type that uses rcu for cleanup. Then I must edit
> this file to add support for it?
>=20
> > The unsafe implementation could be messed up.
> >=20
> > I thought that's what Sealed is for. Or isn't it?
>=20
> Sealed is for making 100% sure that downstream crates/drivers cannot
> provide their own implementations. But I don't see why you need that.
> All you require is that the value remains valid for one grace period
> after cleanup begins. As long as the type satisfies that, you are happy.
> An unsafe trait can require that sort of requirement from the user.
>=20
> I think what you want is expressed well by `RcuFreeSafe` from this
> thread:
> https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/topic=
/Consolidate.20.60PollCondVarBox.60.20into.20.60Rcu.2ABox.60/near/598726724
>=20

I guess this is a question of design principles. If you demand an
RcuBox, you have a guarantee that it's safe.

If you demand an unsafe trait, you open the possibility for people
messing up.

Due to the unsafe-contract you'd have moved the responsibility for the
soundness to the driver.

I would not want to block your suggestion, but I am not sure whether
that's really the better design idea.

> > >=20

P.

