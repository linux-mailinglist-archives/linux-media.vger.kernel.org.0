Return-Path: <linux-media+bounces-63944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5gNGCrr0ImrlfgEAu9opvQ
	(envelope-from <linux-media+bounces-63944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:09:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C76499E4
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:09:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WVswh1fY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63944-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63944-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFE2C301E443
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18572F7EE1;
	Fri,  5 Jun 2026 15:52:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48063A7F5F
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 15:52:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780674724; cv=none; b=eaMRrKO5qM90h38bOoZkyDQYxqY/u56DxXGmekKWinAbHqCOsGhsrHOlYp39ybJ5tr7kUzPfKuFAkeB6YY+AMBsAX8vjXPp7LIABvhGNWChzpK2jgDqCBV1wCB18VNoro9CTvKbX8XHtoFS0h11oIeLYex6MawcTdt65xpmWBuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780674724; c=relaxed/simple;
	bh=WrF22v7dZaB4Mq26zO/CB+whNeAifS2ZudP3T3DO/Ms=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ir2LPzeFylgAkC9PM56lU/4Vi+CubnR06/m8g4VtpJSjDhG8ST62Co3dn8uCDl2e5GOcqT8jVmKi1pf/IJSe3YXemxv7pRTN4ByvMmDCQjNRt2JrP2tcK9ZrV+XRjZmQOegVEGN3Q+W/aYnQobCD2zoKniJ6MWB2Za1kRr857qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVswh1fY; arc=none smtp.client-ip=209.85.221.172
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso630141e0c.1
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780674720; x=1781279520; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nGKygQkHUwQC80rJNI9ybnw4Obautm/GK0xUhE4dko=;
        b=WVswh1fYeeyUbsNxnThZ7ToV56z2dxbv4tg/Nobg2IMK5aQn+aNJg7CzveuGS9zfgQ
         iAEPvz/iWuHanGjGgGt/1rNy0pFulsHg6YnyMQW7TePLp1xg7mvu3JD0R+qhDmZnrrFd
         7a7DyW8qTacEfCzWTvQif/x5iXFeO0Ae/57zHfjkLQi6JxhT2lMiiGxrT6RNO7hrC3ow
         GsBA+WWOXuX0u7x4idTpUy/AvDBbJx8jOlHyV16QxytISqpT22FKpx8Gos1Gjnc2dZDH
         RT7hUeFVFHRQOgewF040Ng0alDy7ew/J8XJSNT0ktLCLq5J7WnFSRCzzPoBLQS4D5npS
         WwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780674720; x=1781279520;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nGKygQkHUwQC80rJNI9ybnw4Obautm/GK0xUhE4dko=;
        b=DrhDsAAR/R9f66hzXKBa5UZwKNwt24b3hrZIhE9MyI/sqLANTnNCvE+KnQ5729NWC4
         u6hDPRLNUHu16l+p/muvtSSqfnsrW7iVAkzW5TUhv3RHd0E6OOUiMFC0JeIY4id9MX4y
         EbEJ+DyuxCFkr7MiFOLdHYD6bCL1Eyj8UfK45al1no3Og6VOnHX5MuYAe+c/Mp9O6IaE
         qgu/KWNnQ+7d5ZfkhsSgiM4nx9Jp3aEo5AqP6lKvgpic+3Hn8ZErlYupa4vnUKnZDBRr
         0/lMC6KV8bubhitWNefNmre3RzLoU6mzOgpVuVC/6gBPDpCsZBoDTIGCt866UyoxXqlg
         pvdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Qgyg/7m/42soQ6VIItS5oApUE3Vb8SIwbWymdMLlmyQd+tzNr+sCV7u24T3ZHSs1s2QhydpAdQVXQuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqEXsapXkwKgLY5tnyh8QP7AupKznmx7g4myY8A6QGBK1Budr
	IV+0D5hav12fDr+bFeBl+8NxkuQnhwrClYLuWKwhP0vbh1dYm09V+ObA
X-Gm-Gg: Acq92OHGrtjT2S+KDmk23rIj44V68K6a+e+5xwxwEeOZrgfs1M72MFFKwCdjeSOPPkT
	4WZG83B7q69s+zQ9B+obhob7uszF03f3xop4dRpzeP5K36CBz0HJOygMopUhD/iQLRQQkIhbuoi
	d4aGtJ1nUlhoBRA5mH1arBDwzpxeXr2Bu5xfDrYM5JnM70bPt6vl1DMNQ+woTfTPl+vXsJVQenT
	mNqrDBEBRu+0QDir05bhqSWbCCMZlkabUNqeJhKYoqGb+ngxyZ0emYaSerWNR8ojglH1nGtuCd2
	F2s/DeoyUpx4aS8ZSktlQc0sKyJfC+gZ3MjbD6/jfo1L1HzAcYBvGL1vVoFwSFUJSmh1YdvOphx
	xSoQ4CXB+NitUe5JavgoJe9/gjG7/JvOc7t+4OIjnIvigyyK16bU8UJdDGaBCtG+rckQw6afAX1
	kh0mjhjGVceEsSHLfcMNs4SP1PMX8df/N+UicsMMwMED/wmB+yQJonbWFCy+DlAAJQu9WUCXg=
X-Received: by 2002:a05:6122:20a2:b0:59e:b127:fc6f with SMTP id 71dfb90a1353d-5ac53c944c8mr2226236e0c.2.1780674719617;
        Fri, 05 Jun 2026 08:51:59 -0700 (PDT)
Received: from smtpclient.apple ([2804:7f1:c241:abe4:8c1d:3d1b:d7cb:e7e9])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96414115a93sm7095512241.9.2026.06.05.08.51.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jun 2026 08:51:59 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <20260604101552.4232733b@fedora-2.home>
Date: Fri, 5 Jun 2026 12:51:35 -0300
Cc: Philipp Stanner <phasta@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
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
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 rcu@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <82F71A28-076F-4100-A702-840018937D1B@gmail.com>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-5-phasta@kernel.org>
 <4F8E8E04-5AB5-4E6B-9194-5FC467E2313F@collabora.com>
 <20260603191405.4c75badb@fedora-2.home>
 <09096455-BA79-4E61-AD88-44DA57C5BEA8@gmail.com>
 <20260604101552.4232733b@fedora-2.home>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63944-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rcu@vger.kernel.org,m:boris.brezillon@collabora.com,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:
 lists@lfdr.de];
	FORGED_SENDER(0.00)[dwlsalmeida@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwlsalmeida@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,dma_fence.rs:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F4C76499E4


>>=20
>>>>=20
>>>> Consider a fence design where signal() consumes self. Now consider =
this:
>>>>=20
>>>> ```
>>>> impl FenceCb for MyCallback {
>>>> fn called(&mut self) {
>>>>  // Can't move the fence out, so we have to put an Option<T> just =
to be able
>>>>  // to move.
>>>>  if let Some(f) =3D self.some_fence.take() {
>>>>    f.signal();
>>>>  }
>>>> }
>>>> ```
>>>>=20
>>>> This used to be the case when our version of the job queue used the =
"proxy
>>>> fence" design:
>>>>=20
>>>>=20
>>>> ```
>>>> // Callback on the hw fence
>>>> impl FenceCb for MyCallback {
>>>> fn called(&mut self) {
>>>>  if let Some(f) =3D self.submit_fence.take() {
>>>>    f.signal();
>>>>  } =20
>>>=20
>>> I'm pretty sure lockdep won't like it anyway, because this is nested
>>> locking of the same lock class. For such proxies, we'll need to =
teach
>>> lockdep about the nesting like has been recently done on
>>> dma_fence_array & co. But I'm digressing. =20
>>=20
>> Yeah, but this is more about resource transfer in general, not
>> this pattern specifically.
>>=20
>> I agree that this has issues, and yes, lockdep complained back
>> then :)
>=20
> The thing is, there's so many aspects that could go wrong because of =
the
> context this callback is called in. Nested locking is one of them,
> the fact we can't sleep is another. And with rust it's even worse,
> because of the implicit drops that will happen when you take ownership
> of resources (taking sleeping locks to remove resources from a dataset
> for instance).
>=20
> So, by passing self by value to the ::callback(), you're basically
> telling users "hey, BTW, don't forget to defer the drop to some
> workqueue if you think it's not atomic-safe". And how can users know
> that the thing they're about to drop can be dropped in atomic context?


Can=E2=80=99t we create a token type that signals we=E2=80=99re in =
atomic context? If
we pass this token type as an argument, perhaps lockdep can check it for =
us?

Perhaps

enum SomeFancyName {
  Atomic(AtomicToken)
  NotAtomic,
}

signaled(self, atomic: AtomicToken) {
  ..
}

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
>=20
> The other option (the one I've been advocating for from the start), is
> to not let drivers implement FenceCb (make it private), but instead
> have a bunch of implementations that we know are safe. Here's a list =
of
> implementations that I think would unblock most of the drivers use
> cases:
>=20
> - wakeup a thread
> - complete a completion object
> - schedule a WorkItem
> - schedule a kthread_worker (once we get a proper rust abstraction for
>  that)

This can also work too, I guess.

>=20
> It doesn't mean we can't have optimized FenceCb implementations that =
do
> a lot more in the callback() path instead of deferring to a
> workqueue/thread, but at least those would have to be implemented in
> dma_fence.rs, and the dma_fence.rs maintainers can then carefully =
audit
> the code as part of the review process, which we know is not really =
the
> case when changes touch drivers code only.
>=20
> FWIW, I think the FenceProxy design you were describing falls into
> this "must be carefully audited" bucket, and should be implemented in
> dma_fence.rs.
>=20
>>=20
>>>=20
>>>> }
>>>> ```
>>>>=20
>>>> Although this is not the case anymore, since we phased out this =
design given
>>>> Christian's recent work. Still, we should ideally not require =
Option<T> here in
>>>> general just to make resource transfer possible. =20
>>>=20
>>> I see. OTOH, don't we need to make this inner data movable if we =
want
>>> to cancel the FenceCb before the fence is signaled anyway? And =
that's
>>> most certainly a case we have in the teardown path. =20
>>=20
>> Can you expand a bit on what you mean here?
>=20
> Never mind, I was confusing two different iterations of the code here.
> I thought the Option<T> you were mentioning was in
> FenceCbRegistration<T>, with some explicit ::cancel() function that
> would return Option<T> so the user can get its resources back when it
> cancels the registration, and also know whether the callback was =
called
> or not. But this is all gone now, and all we can do is drop the
> registration, which will automatically drop the inner T.



