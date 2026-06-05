Return-Path: <linux-media+bounces-63949-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JIF4ALDzImqofgEAu9opvQ
	(envelope-from <linux-media+bounces-63949-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:05:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD8C649947
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:05:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=phnS7lpi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63949-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63949-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 879D53021C81
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 16:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2A537DEAA;
	Fri,  5 Jun 2026 16:03:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657EB33BBC0
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 16:02:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675380; cv=none; b=ixH+GuHtduNv30fs+cTPwaOQ73qr3A+RWFIsttBuHbSJOS/DZcYYSiKo+Xd9iApETJIDM7R8Nv5CGBIAtxp4hr77+iaO0gUi6dQsO/H1hN7k5tR9xaJckHslk34/GEqHzoI5XkWbyNL76f5O/25W3XkQ9BLWkXuckqAuPHjo+SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675380; c=relaxed/simple;
	bh=GMM8rItwjOBKBZTiVFQDKLbinjfJL7SeunmDuhS3L9o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iRCWlSK2lueRQD71SjecV3wdZj8yMl8V6q2cGMJXLDQHIpOdF8n6Sl5X7kl9kBJ91E1HQMzEYSed8v1UH0o72C3uQ/WoGdWSbIm8Ef/jMnoDOlQRNyuvEg7eEt/KZVcvTJzFX6bKUsEvYJc4vOTF4ZBMOhnwHWUhZY/N56k7oOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phnS7lpi; arc=none smtp.client-ip=209.85.222.43
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-963ebce7076so455383241.3
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780675378; x=1781280178; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMM8rItwjOBKBZTiVFQDKLbinjfJL7SeunmDuhS3L9o=;
        b=phnS7lpiu0AgZ4noQy/KYuqfmUif+4T8mkMql9h22PnhP7PSenOVFLBpfAb0c6zmy5
         kzBeHOWO7dT3G2kkKqBFdaENtYgiYQe6LlSM/GKVkYYjjGsIsBgX9ZXYwHFq1lIrukBH
         WGtGQkdzGaTDR+8jAUg1u8zKH2OnpP7O6VwtF54MjibpPByFvjwBNjQk7PYP1z0Hyh1b
         bjzJ/HBveB0DxeGSFmi6aR21VcPBldru/kyKFfgQyGXepHsAV0EjrT45SJOVrhgXL+m0
         hoYvlYGVRBTLb4iETPbcuE1M7RQYgjdrwiUUyrVDlHbHcpwqQxJakhtQt79+DzZFG41j
         i/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675378; x=1781280178;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMM8rItwjOBKBZTiVFQDKLbinjfJL7SeunmDuhS3L9o=;
        b=WMEzFju+QrToyUybNjPCm0OZ0yQA1bp6k6O1rUve/FibcZfJrrRcq1ODJivQc+afkS
         8hEznsETQmFjtkX/lHzVC7nZdvT3rYgSmr9JgHzVhAHDWFChGI1oDM6lHYw4N0LRD7XR
         W7GHn/wEBeK7t1KAEY2a8ssatIWn7HlyzoIe7hxcWoodbAaWLIXlDWsD01DkSNUhbhLV
         q/uFTk5hM6Ezmf8ReQ406GjvZ0TOtv0PfSDFYF5RqWvIzc+5fJWcRHj9hnTU4tHHbtpl
         qGWKwA7tHwE1lP4MyAQTcrxLEh3j+uS51Gl/4af+8nAqLoZsoejaLm/zBt0IDxTLbgTy
         2Deg==
X-Forwarded-Encrypted: i=1; AFNElJ+afvt4nkWwvAqq2nqTwjIEnHqn/SYp+7c1m1Le0b84HQkTqQ9+oiVwBhC8vByBHpQDwgRb0OXKgjqmwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEYCJWr2gS9G5q7QmCKSOTiMVQMh4nlGD06HP1tA6Z29B7CkYC
	B2z2vCGtoIEL9zjLZPdtaZklo91S+6+SGWb7ZKXipygB8Q4j6fC4MF5K
X-Gm-Gg: Acq92OFEp4+hGKgkRhdrVHOQE/08eu0Ifcs2AQox8csiGKV0zpK+hl7GEciejMWvhbs
	XTdM5KBYaeBYqyQDMy7PZ+Bkxt9jwyR/rC/pw8HeXjjIDALEP/xMCQGb7P13v5iOl2bGuxkw3GS
	53zfP9PjCCBgFJH1Kv1NiZsl8XueHQO8Im47nSImjEkNUKlTAlS+95GWSwkfq9iMp7YQPyvRXk+
	kJwAjwddXQ6e5t5TvhjmomCFzV4lFKMmj0Kt6H3eBj3g5s4jdOe7Wlpz0UIJeDD+NRD3HN3rj1L
	ySZ6qmBIS/CoSjBH/fjpina8rpT5bJp1fm//SBeVaCAGxwFIPhu0M+wrD2THTKxFFy4C3U7v/2N
	UFANjmQsB7IInkUjQrb1eE1t+2QaZIoSh/+ThNIgNKvPvX6LpcgNrCxIA7Mb5CmU8EW1vVXIsmp
	fcqvdgRMDcnrx+ppbpLZQiI50j/8VrFyM7FOxWfj9W1Z1IOjY37XbVsQ8WxSN7Z04Q+qVri6Bl
X-Received: by 2002:a05:6122:3d45:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5ac4f952082mr2315135e0c.7.1780675378285;
        Fri, 05 Jun 2026 09:02:58 -0700 (PDT)
Received: from smtpclient.apple ([2804:7f1:c241:abe4:8c1d:3d1b:d7cb:e7e9])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413f9afe7sm6908115241.6.2026.06.05.09.02.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jun 2026 09:02:57 -0700 (PDT)
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
In-Reply-To: <FEFE0522-FD7A-40DE-8B2A-09FE2F33F327@gmail.com>
Date: Fri, 5 Jun 2026 13:02:36 -0300
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
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
Message-Id: <48CE71C8-7A67-4D09-84C2-A0B83C32B169@gmail.com>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-5-phasta@kernel.org>
 <4F8E8E04-5AB5-4E6B-9194-5FC467E2313F@collabora.com>
 <20260603191405.4c75badb@fedora-2.home>
 <09096455-BA79-4E61-AD88-44DA57C5BEA8@gmail.com>
 <20260604101552.4232733b@fedora-2.home>
 <8ff2de94a50ed077a4cfe520a081f2b8b438a375.camel@mailbox.org>
 <FEFE0522-FD7A-40DE-8B2A-09FE2F33F327@gmail.com>
To: phasta@kernel.org
X-Mailer: Apple Mail (2.3826.700.81)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63949-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rcu@vger.kernel.org,m:phasta@kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:
 lists@lfdr.de];
	FORGED_SENDER(0.00)[dwlsalmeida@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DD8C649947


>>=20
>>>=20
>>> So, by passing self by value to the ::callback(), you're basically
>>> telling users "hey, BTW, don't forget to defer the drop to some
>>> workqueue if you think it's not atomic-safe". And how can users know
>>> that the thing they're about to drop can be dropped in atomic =
context?
>>> They basically have to audit the ::drop() of all the resources they
>>> embed in their type implementing FenceCb. Not only that, but they =
also
>>> have to design the thing so the deferral of this ::drop() doesn't
>>> allocate, because, obviously, allocating in atomic context is
>>> tricky/fallible. AFAIK, none of this can be spot at compile-time (I
>>> remember Gary/Danilo mentioning that we could teach the klint about
>>> some of these rules). This would leave us with runtime checks like
>>> might_sleep(), but most of the C putters (xxx_put(object)) don't =
have
>>> might_sleep() in the path where the decref doesn't lead to a =
refcnt=3D0
>>> situation.
>>>=20
>>> TLDR; Call this PTSD if you want, but this is the sort of bugs I
>>> struggled with on the C side, and I can predict that the exact same
>>> will happen in rust drivers if we expose the FenceCb as it is =
designed
>>> here and we don't have a way to check the soundness of the FenceCb
>>> implementations at compile time.
>>=20
>> My guess would be that the existence of unsafe-traits is the =
admission
>> of Rust that this just cannot be guaranteed by design.
>>=20
>> If a driver cannot know whether this or that is safe to drop, then it
>> would have to defer it's dropping. Or would there be cases where this
>> also doesn't work?
>=20
>=20
> Although I totally understand where Boris is coming from here, and I =
agree with
> him, the reality is that the current &mut self design doesn=E2=80=99t =
solve this. An
> unsafe trait could work as a pinky-promise by drivers, which is =
half-way there.
>=20
> What we ideally would like to have is a bound though, something like:
>=20
> T: !Drop
>=20
> If I recall correctly there were people working to get support for =
that on
> Rust? I think there are two things here: !Trait, which is not =
supported except
> for !Sized IIRC, and having an auto trait that represents types that =
implement
> Drop, similar to Send and Sync.
>=20


In fact, ping the pin-init people here, i.e.: Benno, Gary, etc.=20

What is the magic behind =E2=80=9CMustNotImplDrop=E2=80=9D? Perhaps we =
could apply that here?

=E2=80=94 Daniel=

