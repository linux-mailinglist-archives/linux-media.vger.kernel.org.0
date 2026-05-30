Return-Path: <linux-media+bounces-63143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK+8J/kBG2rk+QgAu9opvQ
	(envelope-from <linux-media+bounces-63143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:27:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B5560DBAD
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89EF830078B8
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 15:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EE732937A;
	Sat, 30 May 2026 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlqV5rtU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C505D2DF717;
	Sat, 30 May 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780154867; cv=none; b=d4OB2N38npwP7t78rMabUaT4egifjWz5NqdbvKCktMZkkXvjIev3hz+cRc1a5ePszAkghxdHHW0TPhFizEppdJf3HV6thjz9fIMotLbAuFgDaNGcd18CWLkQXZ6JTmeYC996JeXxZ29RZA6xC70qVYfEHxDGnEUA2uuPaw2sqnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780154867; c=relaxed/simple;
	bh=JzNwHAlWijeIAaG15DTA2o5Tf9s2L7yI5CPXH7a+wi8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kyCEEemcH2ZlPK80SIxmiIqCbjwtdXNmKVTHH2znmrjpsSalvFECTp3VBwvkFMW5VQ/QEu3zLykkY5rpxl3KygD0X44iaqdKJjdnFHd8HMdJpNFAdDDdnWhV7jrA8gKSW6ooMNiruFdmGdEuKzJXuisTTdiXtHA6/8yT2b5AMak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlqV5rtU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76381F00893;
	Sat, 30 May 2026 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780154866;
	bh=JzNwHAlWijeIAaG15DTA2o5Tf9s2L7yI5CPXH7a+wi8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=PlqV5rtUI6f9pzKL6aAEp+ROgJjj+sh4ZJqNOuJh2RWXEY75/QdgcavEFArDBDdzG
	 qDYr/VmZeRxgIm73QBDrlOHUB1FPPYLqiGCWSNxb7QJD2N6mCTBHEYLNwHHxy0h104
	 UFlAdxA4Oi9LEUnoyuYzscH0IG27O//ciYKe5QMuK/Uyl/KnPP+Qpq57Y2OiGHJP1Y
	 /0NL7Ho0IumfW86Ai2o2W2pBosUBtA6n3EAQQAMThS3PYsniiPVQKVxlr2s3jMg5L7
	 y+LTcjdHivWP2c9vLPNp2/hniUFMFmg86acan+82wKvuxWpsJYdRiJR/kgKa9FbCOw
	 RFql/BO+U+O+g==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 May 2026 17:27:38 +0200
Message-Id: <DIW48C65445Y.1VVD8AEDB35UM@kernel.org>
Subject: Re: [PATCH 2/4] rust: rcu: add RcuBox type
Cc: "Philipp Stanner" <phasta@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
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
To: "Boqun Feng" <boqun@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-4-phasta@kernel.org> <ahr9gtzQLSbPeBx_@tardis.local>
In-Reply-To: <ahr9gtzQLSbPeBx_@tardis.local>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63143-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[37];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 34B5560DBAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat May 30, 2026 at 5:08 PM CEST, Boqun Feng wrote:
> type RcuKBox<T> =3D RcuBox<T, Kmalloc>;
> type RcuVBox<T> =3D RcuBox<T, Vmalloc>;

type RcuKVBox<T> =3D RcuBox<T, KVmalloc>;

> To support RCU-protected vmalloc allocation, we need to make `RcuBox`
> generic over `Allocator`. Currently this works since all `Allocator`s
> are either kmalloc() or vmalloc(), and kvfree_call_rcu() works with both
> allocations.

I think we can add Allocator::free_call_rcu().

