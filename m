Return-Path: <linux-media+bounces-63877-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NHN1MBuCImpZZQEAu9opvQ
	(envelope-from <linux-media+bounces-63877-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:00:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAFE64636A
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:00:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ud9TN26i;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63877-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63877-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B572C304704F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 07:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B713481A8F;
	Fri,  5 Jun 2026 07:57:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A591C2EEE6F;
	Fri,  5 Jun 2026 07:57:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646236; cv=none; b=ZRicP4v5cMIT3e1gaA/meg9fmsPx95VL4+vo7z3Au4cagLuSh/bkQGLpmB89CKnxtKLmdw9ZoDqkrSo+jg1eTHEDbA2zoNDi3Ly/45LTjHhZdyYofDI+4ouhJuOK37YCvD4UVUT9uPi+WaS8pFsCNCvqNTeGyzb0etcHybhY3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646236; c=relaxed/simple;
	bh=YZscO3yakbHdZc4j0RGnCdnyy50smezrqiuIpDYbTeI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BFFc7ZMJBSEFbO+uMpE4cge1hFxhObmg/77+hHGw3qh4BViAF1lkKY/pVDwYeQMo8KqXgbr+FKZUR46SJV85o/Cfe5xDv1g//tFkF37e3EONdoHwbSdWdRchFi11O5q+CMftzGXOIRgnjYI66wfZ59mD+ZlR6vA3XbpcJo+2lJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ud9TN26i; arc=none smtp.client-ip=80.241.56.151
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gWv0c3R1Bz9tgY;
	Fri,  5 Jun 2026 09:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780646224; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZscO3yakbHdZc4j0RGnCdnyy50smezrqiuIpDYbTeI=;
	b=ud9TN26ikC4TheW87sW5sBb0y2fqqKzew5ee3W2uJP7eL0IRSx/XGRTNn5y9pkOecyS/RA
	K/7g4n+Do9YA3XS5TTP7T+S4TLlVSPWnYnOzde5LcsMROQMe90Tm96LylDf2b8x9VuQkZp
	qN3vsiXI30/uRjCLIoblFdNRbR2frgMsipUZg8qVTRTY8whn5tDu8Jq1sVSNwtq8ZCVnou
	CRNyO4ketnaWtSzGeGYji4nJfM/n4irESZmSi/vosa12sTW4nCsmiXR8qGjWrqAsWV5PHR
	W2uKePhv2y5CPa6GuTTA6MKwDkB/s/bhnE71Z8HtFvVpqmS2fMwJCQMne/9ECw==
Message-ID: <8ff2de94a50ed077a4cfe520a081f2b8b438a375.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Daniel Almeida
	 <dwlsalmeida@gmail.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
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
 Zqiang <qiang.zhang@linux.dev>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Igor Korotin	 <igor.korotin@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, Alexandre Courbot	 <acourbot@nvidia.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>, Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is, 	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, 	linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linaro-mm-sig@lists.linaro.org,
 rcu@vger.kernel.org
Date: Fri, 05 Jun 2026 09:56:51 +0200
In-Reply-To: <20260604101552.4232733b@fedora-2.home>
References: <20260530143541.229628-2-phasta@kernel.org>
		<20260530143541.229628-5-phasta@kernel.org>
		<4F8E8E04-5AB5-4E6B-9194-5FC467E2313F@collabora.com>
		<20260603191405.4c75badb@fedora-2.home>
		<09096455-BA79-4E61-AD88-44DA57C5BEA8@gmail.com>
	 <20260604101552.4232733b@fedora-2.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: a672bee9a7bdcd496a0
X-MBO-RS-META: 5yqks91n4urtritwsng9kaxh7prq1gie
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63877-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:dwlsalmeida@gmail.com,m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:sha
 nkariak0208@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,mailbox.org:mid,mailbox.org:from_mime,mailbox.org:dkim,vger.kernel.org:from_smtp,dma_fence.rs:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FAFE64636A

On Thu, 2026-06-04 at 10:15 +0200, Boris Brezillon wrote:
> On Wed, 3 Jun 2026 21:43:05 -0300
> Daniel Almeida <dwlsalmeida@gmail.com> wrote:
>=20
> > > On 3 Jun 2026, at 14:14, Boris Brezillon <boris.brezillon@collabora.c=
om> wrote:
> > >=20
> > > On Wed, 3 Jun 2026 13:41:02 -0300
> > > Daniel Almeida <dwlsalmeida@gmail.com> wrote:
> > > =C2=A0=20
> > > > > +=C2=A0=C2=A0=C2=A0 /// Called when the fence is signaled.
> > > > > +=C2=A0=C2=A0=C2=A0 ///
> > > > > +=C2=A0=C2=A0=C2=A0 /// This is called from the fence signaling p=
ath, which may be in interrupt
> > > > > +=C2=A0=C2=A0=C2=A0 /// context or with locks held, which is why =
`self` is only borrowed, so that
> > > > > +=C2=A0=C2=A0=C2=A0 /// it cannot drop. Implementations must not =
sleep or perform
> > > > > +=C2=A0=C2=A0=C2=A0 /// long-running operations.
> > > > > +=C2=A0=C2=A0=C2=A0 ///
> > > > > +=C2=A0=C2=A0=C2=A0 /// An implementation likely wants to inform =
itself (e.g., through a work item)
> > > > > +=C2=A0=C2=A0=C2=A0 /// within this callback that the associated =
[`FenceCbRegistration`] can now be
> > > > > +=C2=A0=C2=A0=C2=A0 /// dropped.
> > > > > +=C2=A0=C2=A0=C2=A0 fn called(&mut self);=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > This is a central point. We ideally would want this to consume self=
, because we
> > > > may want to move things out of the callback.=C2=A0=C2=A0=C2=A0=20
> > >=20
> > > This one comes from me. The rationale being that ::called() is called
> > > from an atomic context, and the resources attached to the callback da=
ta
> > > might require acquiring other sleeping locks to be released, and
> > > sometimes you don't even notice immediately because said resources ar=
e
> > > refcounted, and the lock is only acquired when you happen to be the
> > > last owner. Yes, those can be caught at runtime if the C side is
> > > properly annotated with might_sleep(), but that's not always the case=
.
> > >=20
> > > If we defer the drop of the data only when the FenceCb is
> > > dropped/recycled, we're at least not constrained by this "runs in
> > > atomic context" thing.
> > > =C2=A0=20
> >=20
> > This design does not solve it, because one can quite trivially get arou=
nd this
> > restriction using Option<T> as I said. If your point is =E2=80=9Cdon=E2=
=80=99t run any drop() here=E2=80=9D,
> > then &mut self doesn=E2=80=99t do it.
>=20
> My bad, I thought you were talking about some Option<T> in
> FenceCbRegistration<T> (there was one at some point, but it's gone now),
> but you're talking about having an Option<X> inside the T. Yes, there's
> indeed nothing preventing a drop on X in that path, and it's just as
> bad as passing the fence back as value to the callback in that case.

Then maybe we should just pass it by value and require implementation
of an unsafe trait on `T`, whose safety-requirements demand that this
must be save to drop from atomic context.

>=20
> >=20
> > > >=20
> > > > Consider a fence design where signal() consumes self. Now consider =
this:
> > > >=20
> > > > ```
> > > > impl FenceCb for MyCallback {
> > > > fn called(&mut self) {
> > > > =C2=A0 // Can't move the fence out, so we have to put an Option<T> =
just to be able
> > > > =C2=A0 // to move.
> > > > =C2=A0 if let Some(f) =3D self.some_fence.take() {
> > > > =C2=A0=C2=A0=C2=A0 f.signal();
> > > > =C2=A0 }
> > > > }
> > > > ```
> > > >=20
> > > > This used to be the case when our version of the job queue used the=
 "proxy
> > > > fence" design:
> > > >=20
> > > >=20
> > > > ```
> > > > // Callback on the hw fence
> > > > impl FenceCb for MyCallback {
> > > > fn called(&mut self) {
> > > > =C2=A0 if let Some(f) =3D self.submit_fence.take() {
> > > > =C2=A0=C2=A0=C2=A0 f.signal();
> > > > =C2=A0 }=C2=A0=20
> > >=20
> > > I'm pretty sure lockdep won't like it anyway, because this is nested
> > > locking of the same lock class. For such proxies, we'll need to teach
> > > lockdep about the nesting like has been recently done on
> > > dma_fence_array & co. But I'm digressing.=C2=A0=20
> >=20
> > Yeah, but this is more about resource transfer in general, not
> > this pattern specifically.
> >=20
> > I agree that this has issues, and yes, lockdep complained back
> > then :)
>=20
> The thing is, there's so many aspects that could go wrong because of the
> context this callback is called in. Nested locking is one of them,
> the fact we can't sleep is another. And with rust it's even worse,
> because of the implicit drops that will happen when you take ownership
> of resources (taking sleeping locks to remove resources from a dataset
> for instance).

Doesn't that have to be a problem for much of Rust infrastructure? How
do other parties solve that?

>=20
> So, by passing self by value to the ::callback(), you're basically
> telling users "hey, BTW, don't forget to defer the drop to some
> workqueue if you think it's not atomic-safe". And how can users know
> that the thing they're about to drop can be dropped in atomic context?
> They basically have to audit the ::drop() of all the resources they
> embed in their type implementing FenceCb. Not only that, but they also
> have to design the thing so the deferral of this ::drop() doesn't
> allocate, because, obviously, allocating in atomic context is
> tricky/fallible. AFAIK, none of this can be spot at compile-time (I
> remember Gary/Danilo mentioning that we could teach the klint about
> some of these rules). This would leave us with runtime checks like
> might_sleep(), but most of the C putters (xxx_put(object)) don't have
> might_sleep() in the path where the decref doesn't lead to a refcnt=3D0
> situation.
>=20
> TLDR; Call this PTSD if you want, but this is the sort of bugs I
> struggled with on the C side, and I can predict that the exact same
> will happen in rust drivers if we expose the FenceCb as it is designed
> here and we don't have a way to check the soundness of the FenceCb
> implementations at compile time.

My guess would be that the existence of unsafe-traits is the admission
of Rust that this just cannot be guaranteed by design.

If a driver cannot know whether this or that is safe to drop, then it
would have to defer it's dropping. Or would there be cases where this
also doesn't work?

>=20
> The other option (the one I've been advocating for from the start), is
> to not let drivers implement FenceCb (make it private), but instead
> have a bunch of implementations that we know are safe. Here's a list of
> implementations that I think would unblock most of the drivers use
> cases:
>=20
> - wakeup a thread
> - complete a completion object
> - schedule a WorkItem
> - schedule a kthread_worker (once we get a proper rust abstraction for
> =C2=A0 that)
>=20
> It doesn't mean we can't have optimized FenceCb implementations that do
> a lot more in the callback() path instead of deferring to a
> workqueue/thread, but at least those would have to be implemented in
> dma_fence.rs, and the dma_fence.rs maintainers can then carefully audit
> the code as part of the review process, which we know is not really the
> case when changes touch drivers code only.

Pragmatically speaking, if the common cases are trivial, then the
drivers will get them right, because those critical primitives are
already atomic-safe.

And a non-common case will have to be implemented in the driver
anyways, so we'd have to allow for that.



P.

