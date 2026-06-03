Return-Path: <linux-media+bounces-63646-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v3jQIk6EIGpf4gAAu9opvQ
	(envelope-from <linux-media+bounces-63646-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 21:45:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F420663AF4A
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 21:45:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=AaAdScBU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63646-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63646-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FD7E3025E7A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 19:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F0948C415;
	Wed,  3 Jun 2026 19:43:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6F3F4134
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 19:43:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780515829; cv=none; b=hdr3k9rpdVmT9FRql9oqIM/g0hggrybb2iRnsIR0l46NR+MRY0tNztpn1UNvG+T6CpVJ6/M/8/i0rwjyCquu4GYLnI7KW0bAzHTJD3EgmcCdYyKY5c/CI+HJw1nvTlB2tF2qBopePMn3WbO5E9btKO5Peqx3Q+RlPiu2aVr8xpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780515829; c=relaxed/simple;
	bh=3aYo/ev6hWbpdnajg8XRbsQo9rMs3p7erOe9olX+d14=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QIvULsRKg0wO4rz80qw+MfV5jD3Zb4X8CBmrmeDWW6nobqJBYuIjgwfm2+32WxoV8t8JiuRx7TlbT6lAMi3l6z1IT788w/cw/NciYVhhD0zJ1kxteduhmYrvMRDX/yZTdRsLCelVR1rTdTxs2HEauOFwExEBlaVDc7denUJs0Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AaAdScBU; arc=none smtp.client-ip=80.241.56.172
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gVymv7185z9v1m;
	Wed,  3 Jun 2026 21:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780515824; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3aYo/ev6hWbpdnajg8XRbsQo9rMs3p7erOe9olX+d14=;
	b=AaAdScBUQs94C3Bm1VfQ+ASJbsJboa/qPgeCZBvPID+IYAljOKfeOPUn2UxoefHOD7CsQg
	gdFrbtrCeWW/vvuB/Dck5ISSyXhIYJo616keHxzXNdlHDPPurdGYxI8UW1BP5LUt4m/TzP
	MwaIHvsu0+rVtkCLI1dwZZTAIouPs5IzLyftFDi4iSTN1mSBu92FMMvkwrDyHbBSGcv8UW
	H9+bxlJU4T8J5o6NuZTOUC3ckMwm9IWD0Vi1H0sTk6uT6iDvFoa+ERI50KaqhMUCoeu5de
	0qkbP10iUNE5YdenXjSYuTRce7lxW2lpKNh1ynFYxszz4trssMxLMK7rqkFqsQ==
Message-ID: <844b17bf90c3623694c242649878651cb4e19de3.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org,
 ojeda@kernel.org,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Gary Guo <gary@garyguo.net>, Daniel Almeida	
 <daniel.almeida@collabora.com>
Date: Wed, 03 Jun 2026 21:43:40 +0200
In-Reply-To: <20260603183421.06c04082@fedora-2.home>
References: <ah1c3NSU-4UkdUhb@google.com>
		<a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
		<CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
		<24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
		<ah2M2a_4PneZpjTS@google.com>
		<16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
		<ah7CGySkyE7mSM8a@google.com>
		<7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
		<ah7FjDdU6zt65qId@google.com>
		<4bf6e916efe54bab66defda6fffea8c41358b3cc.camel@mailbox.org>
		<ah72Bi2Q5Wpgo2kE@google.com>
		<3c7e4db139df7cea18bc683d6dd33da2d00f0358.camel@mailbox.org>
		<20260603084805.5e0e23ea@fedora-2.home>
		<aa11e74f419b02c0e4fe417face43e7d05e62783.camel@mailbox.org>
		<20260603115247.21ee5d1d@fedora-2.home>
		<20260603115804.29eb8f7d@fedora-2.home>
		<5e710e0bffd21eded77f060ae34e641449325c73.camel@mailbox.org>
		<20260603132259.42184da0@fedora-2.home>
		<DIZJD7DXYF5L.2Z7JGH55EMNU2@kernel.org>
	 <20260603183421.06c04082@fedora-2.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 25f01775bd12ea2495e
X-MBO-RS-META: dif45xwnyzkj7fuqm8ag8utx3o6y9nac
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63646-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:phasta@kernel.org,m:aliceryhl@google.com,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:christian.koenig@amd.com,m:gary@garyguo.net,m:daniel.almeida@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:mid,mailbox.org:from_mime,mailbox.org:dkim,dma_fence.rs:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F420663AF4A

On Wed, 2026-06-03 at 18:34 +0200, Boris Brezillon wrote:
> On Wed, 03 Jun 2026 17:57:16 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>=20
> > On Wed Jun 3, 2026 at 1:22 PM CEST, Boris Brezillon wrote:
> > > Honestly, the more I think about it, the more I believe we should def=
er the
> > > drop unconditionally and call it a day.=C2=A0=20
> >=20
> > I think deferring is fine, a hard synchronization with synchronize_rcu(=
) in
> > DriverFence::drop() seems very undesirable though.
> >=20
> > Another option would be to change dma_fence_is_signaled() to take the f=
ence lock
> > already for signaled(), which should be fine given that drivers should =
only ever
> > check a sequence number.
> >=20
> > It would account for the fact that the same race is possible on the C s=
ide.
> > While the memory allocation is protected by RCU, the contents are not, =
and it
> > seems realistic a driver could invalidate the contents of its private d=
ata after
> > signaling the fence while signaled() callbacks are still in flight.
> >=20
> > Note that there are no new constraints, signaled() is already called wi=
th RCU
> > read lock held, plus there's also dma_fence_is_signaled_locked() which =
also
> > calls signaled() with the fence lock held.
> >=20
> > With this, the problem goes away, as it would guarantee that once we re=
ach
> > drop_in_place() in DriverFence::drop() it is impossible that there are =
still
> > callback in flight.
>=20
> If we can guarantee that no dma_fence_ops we ever consider implementing
> in dma_fence.rs will be called after we've signaled the fence, that's
> even better, but it's not that clear to me that it works just for the
> callbacks we already implement (get_{driver,timeline}_name()). Take
> dma_fence_describe() for instance, with your solution the
> dma_fence_is_signaled() call in there would take/release the fence lock
> unconditionally, but it's still racy, because the fence might be
> signaled just after the lock is released and we would consider it valid
> to call ->get_{driver,timeline}_name() and use the returned strings even
> though the fence was effectively signaled in the meantime. We can of
> course fix that by forcing dma_fence_describe() to take the fence lock
> around the whole section where it's retrieving/using the driver/timeline
> strings, but I'm pretty sure this has been considered and dismissed by
> Christian.

Then I would like to hear the reasons because what Danilo suggests
sounds like an incredible clean thing to do. We'd get a bullet-proof
synchronisation point.

It would solve all our problems regarding UAF. Only thing left to do
would be to ensure atomic-friendly dropping of data.


P.

>=20
> I think we can't have it all, either we consider RCU deferral cheap
> enough that we can live with the scheduling overhead + the fact we
> might hold on system resources a bit longer. Or we consider DriverFence
> release a hot-path where resources should be returned as soon as
> possible, and we need to protect dma_fence::ops with a dedicated
> rwlock_t.

