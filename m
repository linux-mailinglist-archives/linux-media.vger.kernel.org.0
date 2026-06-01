Return-Path: <linux-media+bounces-63233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOt0KBthHWojZwkAu9opvQ
	(envelope-from <linux-media+bounces-63233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 12:38:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB061DA96
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 12:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50B0630ABCFB
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 10:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50203955F5;
	Mon,  1 Jun 2026 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pd8ZT5BK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D040A3921C8;
	Mon,  1 Jun 2026 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308830; cv=none; b=o0HFocX1lzG3AZtyDqSl/PIsQo97SiBvhThdIE3ndMgChXyhg2zivrfa7o7GfF5UP7JzVMTmq0uzSMcG20qefkGVYY7HZNQAFN7rR+KWuCv/tbXt2S/WDAhl5utcWLGk0ZCsv/9PIZTQAQfDoIeYima0ARKLq6k9skLYYr/si+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308830; c=relaxed/simple;
	bh=3Ts6lB+NKnhLtXYHmT257yvnWMD6Ph1yqe+TlwPK+oM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=frsNnGB7SecOVnuRe8E6saSjU1EQNZkmhrk2ttIzOZ3clsZL0kxaKtEoVg4HpV3LrOAPegR6Z7kbtUNV/zfM1gjUkPWitesURuJ6f87gpus/nlkq1JiIrBhdq+A6JrNzh9Po4zja4QR9jRZBN1Uu3+yDTog6JMcyehqM93BFHOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pd8ZT5BK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425C21F00893;
	Mon,  1 Jun 2026 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780308827;
	bh=3Ts6lB+NKnhLtXYHmT257yvnWMD6Ph1yqe+TlwPK+oM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Pd8ZT5BK2RvzgTUlsXOQVBEiMwZGkMyUoMd8Lx5ODzTdFIWZswBajI/tODyqROqWT
	 to5Yfm2ruJGsFd7Aaqg5YI78s6jRh8vdyPShR3BzPDi0KAtBFul22aTc8Gw2fRrPyU
	 415n2lb7D2q/yed7aDWBBAXuFXxW8frBXPM1v6tiAg9tphhbwFI8zO4a0Z8dtR2zDI
	 vsoh7J7e32jR6yQKssPu7IRwWXZNZ3yCtIwpB4nto02HbgaYuXtIWLC5SNmvl/u1eu
	 Nw//bc5n+3e3w5IED5m33qGD9XEW0gruuh669lKpNd15WbUaIAG0a70JOKA5dT7gd8
	 VGaNX/Kx7TrDg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 12:13:38 +0200
Message-Id: <DIXMT0KKU8D9.2XLDHIGBCM1PZ@kernel.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Cc: <phasta@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Frederic Weisbecker" <frederic@kernel.org>, "Neeraj Upadhyay"
 <neeraj.upadhyay@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Josh Triplett" <josh@joshtriplett.org>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "Lai Jiangshan"
 <jiangshanlai@gmail.com>, "Zqiang" <qiang.zhang@linux.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Igor Korotin" <igor.korotin@linux.dev>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Krishna Ketan Rai" <prafulrai522@gmail.com>, "Shankari Anand"
 <shankari.ak0208@gmail.com>, <manos@pitsidianak.is>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <rcu@vger.kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-5-phasta@kernel.org>
 <DIW3ZK5NLKU3.1QYMQB0ISHFBG@kernel.org>
 <08b87b07279e7774c76c0267b1d6c337f705acda.camel@mailbox.org>
In-Reply-To: <08b87b07279e7774c76c0267b1d6c337f705acda.camel@mailbox.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63233-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 21CB061DA96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Jun 1, 2026 at 10:46 AM CEST, Philipp Stanner wrote:
> On Sat, 2026-05-30 at 17:16 +0200, Danilo Krummrich wrote:
>> (Not a full review, but a few drive-by comments.)
>>=20
>> On Sat May 30, 2026 at 4:35 PM CEST, Philipp Stanner wrote:
>> > +#[allow(unused_unsafe)]
>>=20
>> What is this needed for?
>
> You know that :-P

I don't, it's a serious question.

>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Once a `DriverF=
ence` is initialized, the inner `fence` is
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // valid and initialized. =
It is valid until the refcount drops
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // to 0, which can earlies=
t happen once the `DriverFence` has been dropped.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bi=
ndings::dma_fence_lock_irqsave(fence, flag_ptr);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 !bindings::dma_fence_is_signaled_locked(fence) {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if let Err(err) =3D res {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_set_error=
(fence, err.to_errno());
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_signal_locked(fence);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bi=
ndings::dma_fence_unlock_irqrestore(fence, flag_ptr);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>=20
>> Please use a single unsafe block per unsafe function call, here and in a=
 few
>> other places.
>
> Is that an official rule? If so, the linters should inform about it.
>
> At first glance, I don't see any advantage to it and the disadvantage
> of greatly reducing readability.

The advantage is that it separates the safety justifications per unsafe cal=
l,
which increases the chances of catching a bug, makes it easier for the read=
er to
match requirements against justifications and potentially allows tooling to
perform checks of the justification against the requirement.

For the specific case above, there's no documented requirements in the sens=
e of
Rust safety requirements of course, as they are all FFI calls, but
dma_fence_signal_locked() for instance has the obvious requirement that it =
must
only be called with the fence lock held and dma_fence_set_error() must only=
 be
called when the fence is actually signaled.

Besides that, since this pattern seems to occur at least twice, you could a=
lso
consider adding a lock guard.

