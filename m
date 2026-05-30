Return-Path: <linux-media+bounces-63142-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLQ4G3kAG2qn+QgAu9opvQ
	(envelope-from <linux-media+bounces-63142-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:21:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD04260DB50
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF901302DF82
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 15:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF66325491;
	Sat, 30 May 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lk8OFmb5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A618298991;
	Sat, 30 May 2026 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780154435; cv=none; b=NEmvj/8B1egUcHRhtugfp06Kh2QQT4n40E+263muN4CBGFl06nxaCnHjaz6xHVFL2m7YPKrfoNdRQVLfUvd3s6uYELotdwgkCVyPo8p7N56Ove7gBGNQZzcrvzvpdC7pFBmVp0rAPR9c5+3gK/4V9TgZQ13w0nizKuB7LBaZt9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780154435; c=relaxed/simple;
	bh=AMSHQkmzbYijlbpzL1WWSi7Jnr2RVej2XthBhjRBNT8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=YxgiU9HD4gYoAmmXF43kXbicCxIcS1x8ofL3nJ30aXFXRPq/jp8lF8yLZjygAzhW4PwYrdt8zXPsdI573uZGCZFYru4ayYDCuXnvRLcQUXeCxz9xkQSjM1HUvHv9mur4i7KMJiVO2/l/12E2mjmi9v4uPEYcMzHF3Qx7A7yaCzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lk8OFmb5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3031F00893;
	Sat, 30 May 2026 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780154434;
	bh=+sc/8gqjxXPGiBvIvfD3IGHEnbbWMn6slfVxYS4NsDE=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=Lk8OFmb5QUw2CRzhJufG32U11EnGHWNH/C0HzWLKA/jvmjZe838mBvYadKLJtFXqq
	 zzRhj8RUIYR2wS3J4i7sBa1XwPe9fU+s9n1vBm99BUrZHxYKr+eRl9Lf6AFHMr6RgV
	 5+MaCL9TOxBtcku2/J9XgRMSe1HS6ZKH8izhS0cTidUhU9sPdh1WsGsboOq/q7ltCB
	 RJ58HZLV7thBtBRayXAdRhT86s/05Y3/fIgh0Hm6aW+oukCbXscB6mrbzGaqZGPkDq
	 mA4KdB2jzkHRm/cT6yR/NCRW3tuOm1eywlxCE62osPNM4t+SK2MGoinEALteGeYNOp
	 5ith0jBQvczLw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 May 2026 17:20:26 +0200
Message-Id: <DIW42TO5HY6H.2RLL8V8H48A5A@kernel.org>
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
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <rcu@vger.kernel.org>
To: "Philipp Stanner" <phasta@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add entry for Rust dma-buf
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-7-phasta@kernel.org>
In-Reply-To: <20260530143541.229628-7-phasta@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63142-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[37];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CD04260DB50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat May 30, 2026 at 4:35 PM CEST, Philipp Stanner wrote:
> @@ -7529,6 +7530,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kern=
el.git
>  F:	Documentation/driver-api/dma-buf.rst
>  F:	Documentation/userspace-api/dma-buf-alloc-exchange.rst
>  F:	drivers/dma-buf/
> +F:	rust/kernel/dma_buf/

Please also add rust/helpers/dma_fence.c.

Given that dma-buf goes through drm-misc, we should probably also add those=
 file
to the drm-rust entry.

