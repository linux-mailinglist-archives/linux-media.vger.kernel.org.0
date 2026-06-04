Return-Path: <linux-media+bounces-63764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mIorCPw0IWrAAwEAu9opvQ
	(envelope-from <linux-media+bounces-63764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:19:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8763DF1F
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:19:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=ZNinGa1J;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63764-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63764-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27696303101B
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 08:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F5039DBE1;
	Thu,  4 Jun 2026 08:16:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1052DA762;
	Thu,  4 Jun 2026 08:16:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560966; cv=none; b=TpJbur0qGI6vt/VCa8N4emm7DLnE8lCdpw+J76x/CuN05Ml+nDcDli1oWraSaxMp88PkvQdNT4XPiA7kU3XDC26jNLH5ZXa/CQGJoP9KhhC9DHv8uU9MYk+j+j3RRkT7+FX5vzumRNQAoCNgo61ybhZRkndpPiuLzdKPgEVivSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560966; c=relaxed/simple;
	bh=0Y7Wgjd+88mbx6eBRrnHlgMIRq18/ldRsZrp3x6grII=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FaG6k6JQ3AxWM6f0PDxEltVbacQAfewowTPDLxPQL9LZN65S3bN+o/DLc+6Bp1O2IidNDIu2DVrGW8NQRPviPZyAdgnm6cF/8Uk6QXEdaystXH764vMnfEmsX3kN4fsfuW2y7oBrLDoynZjK26VLgkLprc51elCbLPFsPhly4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZNinGa1J; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780560963;
	bh=0Y7Wgjd+88mbx6eBRrnHlgMIRq18/ldRsZrp3x6grII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZNinGa1J0lLXQYyrBJR0buj+EVTZ80+2Uuh9nZXqO5DlLo5sEXIgohmA8VDsKAtoz
	 UvCqtRX47RtYpxgOHrWo8+vktVHLFvnBvDW+E8Ko4K+xhPvTaH/nI/lejQf80lbqWm
	 Qf9POeDLzHkMsjucLQavTvPNYR8Tr3Jlr6KSD2or4e8PqPTGjgy6DrUgHQIuUL3B+q
	 JzkgS9DOAEszq/R8nHmx76Yu6iVGRNez/yOJPiT4sseUIitOTj/fezTTaeFWg6GsAc
	 oMAUvO7JH3MpB05Q9sDx1vkCEmwLYRlQG801pUppqED/pS+btzqljwhf8djFJ1x0NG
	 eZyz35pp1VL0A==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E820317E0979;
	Thu,  4 Jun 2026 10:16:01 +0200 (CEST)
Date: Thu, 4 Jun 2026 10:15:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <dwlsalmeida@gmail.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, Uladzislau
 Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Igor Korotin
 <igor.korotin@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, Shankari Anand
 <shankari.ak0208@gmail.com>, manos@pitsidianak.is,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, rcu@vger.kernel.org
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Message-ID: <20260604101552.4232733b@fedora-2.home>
In-Reply-To: <09096455-BA79-4E61-AD88-44DA57C5BEA8@gmail.com>
References: <20260530143541.229628-2-phasta@kernel.org>
	<20260530143541.229628-5-phasta@kernel.org>
	<4F8E8E04-5AB5-4E6B-9194-5FC467E2313F@collabora.com>
	<20260603191405.4c75badb@fedora-2.home>
	<09096455-BA79-4E61-AD88-44DA57C5BEA8@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dwlsalmeida@gmail.com,m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:lists@lf
 dr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63764-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,dma_fence.rs:url,vger.kernel.org:from_smtp,fedora-2.home:mid,collabora.com:dkim,collabora.com:from_mime,collabora.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15C8763DF1F

On Wed, 3 Jun 2026 21:43:05 -0300
Daniel Almeida <dwlsalmeida@gmail.com> wrote:

> > On 3 Jun 2026, at 14:14, Boris Brezillon <boris.brezillon@collabora.com=
> wrote:
> >=20
> > On Wed, 3 Jun 2026 13:41:02 -0300
> > Daniel Almeida <dwlsalmeida@gmail.com> wrote:
> >  =20
> >>> +    /// Called when the fence is signaled.
> >>> +    ///
> >>> +    /// This is called from the fence signaling path, which may be i=
n interrupt
> >>> +    /// context or with locks held, which is why `self` is only borr=
owed, so that
> >>> +    /// it cannot drop. Implementations must not sleep or perform
> >>> +    /// long-running operations.
> >>> +    ///
> >>> +    /// An implementation likely wants to inform itself (e.g., throu=
gh a work item)
> >>> +    /// within this callback that the associated [`FenceCbRegistrati=
on`] can now be
> >>> +    /// dropped.
> >>> +    fn called(&mut self);   =20
> >>=20
> >> This is a central point. We ideally would want this to consume self, b=
ecause we
> >> may want to move things out of the callback.   =20
> >=20
> > This one comes from me. The rationale being that ::called() is called
> > from an atomic context, and the resources attached to the callback data
> > might require acquiring other sleeping locks to be released, and
> > sometimes you don't even notice immediately because said resources are
> > refcounted, and the lock is only acquired when you happen to be the
> > last owner. Yes, those can be caught at runtime if the C side is
> > properly annotated with might_sleep(), but that's not always the case.
> >=20
> > If we defer the drop of the data only when the FenceCb is
> > dropped/recycled, we're at least not constrained by this "runs in
> > atomic context" thing.
> >  =20
>=20
> This design does not solve it, because one can quite trivially get around=
 this
> restriction using Option<T> as I said. If your point is =E2=80=9Cdon=E2=
=80=99t run any drop() here=E2=80=9D,
> then &mut self doesn=E2=80=99t do it.

My bad, I thought you were talking about some Option<T> in
FenceCbRegistration<T> (there was one at some point, but it's gone now),
but you're talking about having an Option<X> inside the T. Yes, there's
indeed nothing preventing a drop on X in that path, and it's just as
bad as passing the fence back as value to the callback in that case.

>=20
> >>=20
> >> Consider a fence design where signal() consumes self. Now consider thi=
s:
> >>=20
> >> ```
> >> impl FenceCb for MyCallback {
> >> fn called(&mut self) {
> >>   // Can't move the fence out, so we have to put an Option<T> just to =
be able
> >>   // to move.
> >>   if let Some(f) =3D self.some_fence.take() {
> >>     f.signal();
> >>   }
> >> }
> >> ```
> >>=20
> >> This used to be the case when our version of the job queue used the "p=
roxy
> >> fence" design:
> >>=20
> >>=20
> >> ```
> >> // Callback on the hw fence
> >> impl FenceCb for MyCallback {
> >> fn called(&mut self) {
> >>   if let Some(f) =3D self.submit_fence.take() {
> >>     f.signal();
> >>   } =20
> >=20
> > I'm pretty sure lockdep won't like it anyway, because this is nested
> > locking of the same lock class. For such proxies, we'll need to teach
> > lockdep about the nesting like has been recently done on
> > dma_fence_array & co. But I'm digressing. =20
>=20
> Yeah, but this is more about resource transfer in general, not
> this pattern specifically.
>=20
> I agree that this has issues, and yes, lockdep complained back
> then :)

The thing is, there's so many aspects that could go wrong because of the
context this callback is called in. Nested locking is one of them,
the fact we can't sleep is another. And with rust it's even worse,
because of the implicit drops that will happen when you take ownership
of resources (taking sleeping locks to remove resources from a dataset
for instance).

So, by passing self by value to the ::callback(), you're basically
telling users "hey, BTW, don't forget to defer the drop to some
workqueue if you think it's not atomic-safe". And how can users know
that the thing they're about to drop can be dropped in atomic context?
They basically have to audit the ::drop() of all the resources they
embed in their type implementing FenceCb. Not only that, but they also
have to design the thing so the deferral of this ::drop() doesn't
allocate, because, obviously, allocating in atomic context is
tricky/fallible. AFAIK, none of this can be spot at compile-time (I
remember Gary/Danilo mentioning that we could teach the klint about
some of these rules). This would leave us with runtime checks like
might_sleep(), but most of the C putters (xxx_put(object)) don't have
might_sleep() in the path where the decref doesn't lead to a refcnt=3D0
situation.

TLDR; Call this PTSD if you want, but this is the sort of bugs I
struggled with on the C side, and I can predict that the exact same
will happen in rust drivers if we expose the FenceCb as it is designed
here and we don't have a way to check the soundness of the FenceCb
implementations at compile time.

The other option (the one I've been advocating for from the start), is
to not let drivers implement FenceCb (make it private), but instead
have a bunch of implementations that we know are safe. Here's a list of
implementations that I think would unblock most of the drivers use
cases:

- wakeup a thread
- complete a completion object
- schedule a WorkItem
- schedule a kthread_worker (once we get a proper rust abstraction for
  that)

It doesn't mean we can't have optimized FenceCb implementations that do
a lot more in the callback() path instead of deferring to a
workqueue/thread, but at least those would have to be implemented in
dma_fence.rs, and the dma_fence.rs maintainers can then carefully audit
the code as part of the review process, which we know is not really the
case when changes touch drivers code only.

FWIW, I think the FenceProxy design you were describing falls into
this "must be carefully audited" bucket, and should be implemented in
dma_fence.rs.

>=20
> >  =20
> >> }
> >> ```
> >>=20
> >> Although this is not the case anymore, since we phased out this design=
 given
> >> Christian's recent work. Still, we should ideally not require Option<T=
> here in
> >> general just to make resource transfer possible. =20
> >=20
> > I see. OTOH, don't we need to make this inner data movable if we want
> > to cancel the FenceCb before the fence is signaled anyway? And that's
> > most certainly a case we have in the teardown path. =20
>=20
> Can you expand a bit on what you mean here?

Never mind, I was confusing two different iterations of the code here.
I thought the Option<T> you were mentioning was in
FenceCbRegistration<T>, with some explicit ::cancel() function that
would return Option<T> so the user can get its resources back when it
cancels the registration, and also know whether the callback was called
or not. But this is all gone now, and all we can do is drop the
registration, which will automatically drop the inner T.

