Return-Path: <linux-media+bounces-64987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AOJwMU4uMWqgdQUAu9opvQ
	(envelope-from <linux-media+bounces-64987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:06:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C368EA19
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:06:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cQq18BbZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64987-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64987-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74F4A31447DC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD9D42DFE0;
	Tue, 16 Jun 2026 11:02:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5200442981C;
	Tue, 16 Jun 2026 11:02:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607736; cv=none; b=GmPhPTMfn18n8ep4ywpwpD6HvXMAhS5FLSaqW31yWbQAhJimhf0W09h5Wcog4reHDjg/zwpBw8fkfM9S72CGA/EEO7ocA63FvVwG6MYGfZ9ZpaCusxncAxxwPxqNVABPtt59voIVcrvPfF7eCkbhI6oJFK8p71IQgl+TyFTsnkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607736; c=relaxed/simple;
	bh=5d5C3DUtpWx5RhNtKmmckeqo4zoWOKCchVwP5MlaYR8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=eJoJzGSQYvRiD7HWPFqcK8TBU9AhbyyQIUokvpRw9wQVVDd/J1wTY4kaFskS/3hUA+yJYgET63YyhohqlrYt60qv1/1S1CqXtp+4S83geYPJxq9eUi+OmIOeoQTk+oOVF1QvivMkIkfJYvgeG5k/yzDmmndA0oHbff0KDb6N8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQq18BbZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE3B1F000E9;
	Tue, 16 Jun 2026 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781607735;
	bh=FZdmkJa6dqoSyrKuaAVidWmX42dvojCrnG29qH9XCgw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=cQq18BbZC4JXqTwKwf+CBS3TKAMMmefYiM1Ym96bLGdhPIzG7Co8NkIkLjH9MItPx
	 UGCD6xe0cbB2mVyBbPOBRhKMH+kNEYv+T0uZr/bTpYrn7ZhQS/ArXVCWIY9mTf61cG
	 wUV4zW91EJMYL4P0ChI9nnkmPJO6qJDpMiE9soBsKIqhEFk4ftie4xNalLTUp1Lxpi
	 zffNy1CQtg9ngSo/OcREICPqxInKJ34VEzwoBPmAJt/PZYROHgrZaBJ/XtiYB1mPzK
	 HPvLFPyr62rbPgRJdRFpA0hbS0AMG3fMNxH8RtfdasRvEvut+gK64S5hSmJzDtm6zu
	 aboGmQh5BSdbA==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 13:02:07 +0200
Message-Id: <DJAF8AXHRRIX.2E0FNAQP3DOWK@kernel.org>
Subject: Re: [PATCH v2 0/6] rust / dma_buf: Add abstractions for dma_fence
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
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
 <dri-devel@lists.freedesktop.org>, <rcu@vger.kernel.org>
To: "Philipp Stanner" <phasta@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260616082819.2943886-2-phasta@kernel.org>
In-Reply-To: <20260616082819.2943886-2-phasta@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64987-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:rcu@vger.kernel.org,m:phasta@kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B3C368EA19

On Tue Jun 16, 2026 at 10:28 AM CEST, Philipp Stanner wrote:
> Changes since v1:

It seems that some of the comments from v1 [1][2] are not addressed, did yo=
u
forget them?

In particular the pin_init_from_closure() looks unnecessary and can probabl=
y
replaced with something like (untested):

	let mut callback =3D Some(callback);
=09
	try_pin_init!(Self {
	    cb <- Opaque::try_ffi_init(|ptr| {
	        // SAFETY: `fence.inner.get()` is a valid, initialized `struct dma=
_fence`. `ptr`
	        // points to the `struct dma_fence_cb` field within the pinned all=
ocation, so it
	        // remains valid until `dma_fence_remove_callback()` in `PinnedDro=
p` or until the
	        // callback fires.
	        let ret =3D unsafe {
	            to_result(bindings::dma_fence_add_callback(
	                fence.inner.get(),
	                ptr,
	                Some(Self::dma_fence_callback),
	            ))
	        };
	        match ret {
	            Ok(()) =3D> Ok(()),
	            Err(e) =3D> {
	                let cb_back =3D callback.take().expect("success path did n=
ot run");
	                if e =3D=3D ENOENT {
	                    Err(CallbackError::AlreadySignaled(cb_back))
	                } else {
	                    Err(CallbackError::Other(e))
	                }
	            }
	        }
	    }),
	    callback: callback.take().expect("error path did not run"),
	    fence: ARef::from(fence),
	}? CallbackError<T>)

Please also see my previous comments regarding DriverFenceBorrow, it still =
seems
to miss the lifetime and it should probably use ManuallyDrop<DriverFence>.

It also seems the patch series was created without --base, what's the base
revision?

[1] https://lore.kernel.org/all/DIW3ZK5NLKU3.1QYMQB0ISHFBG@kernel.org/
[2] https://lore.kernel.org/all/DIW42TO5HY6H.2RLL8V8H48A5A@kernel.org/

