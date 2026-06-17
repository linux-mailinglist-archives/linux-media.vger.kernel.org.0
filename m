Return-Path: <linux-media+bounces-65119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dZkVKR+gMmrA2wUAu9opvQ
	(envelope-from <linux-media+bounces-65119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:24:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081D69A116
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:24:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=c82VYYod;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65119-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65119-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1201F31DFB73
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 13:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066304071FC;
	Wed, 17 Jun 2026 13:21:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE640683C;
	Wed, 17 Jun 2026 13:21:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702489; cv=none; b=aPvec3+atTjQ5kmvcOLKt5cqMvhGs94GZdWllZb32o+FAZqT6KNJP2T/FhgsllFPUqUviax9vahmswcbGjpJ0DCARvS0ASM/bcRE02mE+1jPLDkZ/mgCvLnMU6trVIQ1rexOd2Dksux3QjxXDFkTNZ5ANUKql9XGnjmzmEvvQf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702489; c=relaxed/simple;
	bh=prUokEFk43NrpIUj062xFMC6az0rsRN/2hvFki4bOgM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PxgTBAHeTUeVTQnor9FNuadttxuGKIUEfBdeXEmNdA63v/IMWXx5L29EqQnBJKalSJuIHkIUWRXpWPMwJuNz6zOho61HCjhShReli/x7vSLnHqIG/TShxrYle6+XILY42dD9YvktHp9BsY8mDNC0X21plO8t0suMRPQQOJHCbYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=c82VYYod; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ggPd91JKbz9vGs;
	Wed, 17 Jun 2026 15:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781702477; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eK7RkFumJL5Oy7VSKXa/MXrCkIwCGD86E+ep8HSKHIQ=;
	b=c82VYYods5BLNKVzk5QeqwISf0joFD4kxVVX71UHKn5/nQSyE3ac5Klw9UimIYG/xDv0Gy
	wNYuJ9MnvSUwQjyNPv+n9NcDwumstzhkXPgw4pe2EMyGcEZJL9vaQ/d3o72+pN2b5kJVQ+
	BgDOaB50UWb2PfTJPdv/kPNHy1oj9jpgp+SWbcHgPZVBUtDl359z3lF9EeFoKVz9QjjEiL
	IVouolBb60wyr9huTr2z1JCiOQ2cBa0ulTlRoum/XCiRvMtZKxM9GgpM+7MhvN/B5/hn2L
	cXkIlpxx89aCFXMT2rsBZEuU0+rGHyxw00WLD8YxWFyrSnmY3AChsJT3Rr6cZg==
Message-ID: <012402ed19e3a20952cefca1d709b8fea56e474a.camel@mailbox.org>
Subject: Re: Properly synchronize dma_fence->signaled bit (Was: Re: [RFC
 PATCH] dma-fence: Fix races of fence callbacks versus destructors by
 locking)
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>, Tvrtko
 Ursulin	 <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 17 Jun 2026 15:21:11 +0200
In-Reply-To: <c124270d-bb33-40aa-b633-54832edb7b05@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
	 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
	 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
	 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
	 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
	 <fa0dc9757bf8343516c4b156a2b70ec91b64ef8f.camel@mailbox.org>
	 <6ea6c373-c6cb-4221-ad9d-e60b04d1368f@amd.com>
	 <630a8a84ee8fdaa634c7b104742e7a28fcfe507c.camel@mailbox.org>
	 <7ff7dc15-4df5-443c-8d7c-c8e9b2672f2c@amd.com>
	 <80734f05e684ed6b8c82abd9f96c93968537d0de.camel@mailbox.org>
	 <c124270d-bb33-40aa-b633-54832edb7b05@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: bbb5cad53ca6fc71fe7
X-MBO-RS-META: safgiwic499j5zjcre4hwidwacnbb8cx
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65119-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2081D69A116

On Wed, 2026-06-17 at 15:03 +0200, Christian K=C3=B6nig wrote:
> On 6/17/26 12:16, Philipp Stanner wrote:
> > On Wed, 2026-06-17 at 11:46 +0200, Christian K=C3=B6nig wrote:
> ...
> > >=20
> > > > B.
> > > >=20
> > > > I think rejecting ideas with "we tried this, it >>didn't work<<" is=
 not
> > > > a valid reason for refusing an idea. Point A above helps with that.=
 If
> > > > your commit message contains measurements or links to tickets with
> > > > *real life* performance regressions (microbenchmarks are invalid), =
that
> > > > helps reducing discussion overhead drastically.
> > > >=20
> > > > Now, in this particular case, I fail to see how taking the spinlock=
 to
> > > > check that bit is evil. If it regresses someone's speed that much, =
it
> > > > would mean that someone is heavily punching that lock, like polling
> > > > 24/7 with dma_fence_is_signaled().
> > >=20
> > > I think (but I'm not 100% sure) the the problem is that taking the
> > > spinlock introduces a write to the cache line it is in.
> > >=20
> > > At the moment when a fence is signaled a read is enough to check that
> > > state, so what happens is that the cache line for the signaled bit
> > > sooner or later end up in all CPU caches.
> > >=20
> > > When you start to use the spinlock the cache line backing that plays
> > > ping/pong between all the CPU cores and that is something which
> > > always stalls each CPU when it needs to acquire the cache line. Keep
> > > in mind that on a modern box you can calculate like a 4x4 matrix in
> > > the same time you solve a cache miss.
> > >=20
> > > This is especially important for the stub fence which is used by
> > > basically all cores at the same time whenever you need a signaled
> > > dummy.
> >=20
> > Alright, that sort of sounds logical, I guess. So the argument
> > basically is that if we'd try to lock that, someone would immediately
> > report real and massive performance regressions leading to a revert.
> >=20
> > I think last time you mentioned that memory footprint is less of a
> > concern for dma_fence than cache lines. Out of interest: has anyone
> > ever experimented with more padding to prevent spinners from shooting
> > down other CPUs cache lines?
>=20
> How would that work in this case? I mean as long as you have the same
> variable (spinlock) you have the same cache line no matter how you
> pad.

Ah, gotcha. I was talking more in general. Sometimes you have
situations like:

struct foo {
  spinlock_t lock;
  // place padding to fill up a cache line here?
  u8 data[];
} bar;

// thread A
lock(bar->lock);
do_sth(bar->data); // works on `data`
unlock(bar->lock);

// thread B
lock(bar->lock); // might invalidate the cache line the beginning of `data`=
 lives in

That wouldn't solve the spinlock-issue; but I've been interested in a
while in whether the above has been an observed problem.

>=20
> > Since you're the maintainer of dma-buf, what would you wish we do?
>=20
> Try to improve the documentation by sending out patches. I will send out =
my ideas for resilient improvements and we then discuss on the patches.
>=20
> > Would you be at least OK with the memory barrier approach to make the
> > API a bit more robust? AFAIU the barriers will not cause a cache line
> > invalidation.
>=20
> What exactly do you mean with that? The test_bit() and set_bit() are
> already memory barriers as far as I know.

I'm talking about whether we could enforce that the bit is only set
once the callbacks have completed, so someone who wants to drop his
reference once dma_fence_is_signaled() returns true doesn't cause a
UAF. You didn't answer here:

https://lore.kernel.org/dri-devel/dca171cea556c3f3de3a86f735eeb53335cd3f49.=
camel@mailbox.org/



>=20
> > >=20
> > > > Again, having that use case documented somewhere could save us all =
time
> > > > =E2=80=93 especially for you, Christian, since you wouldn't be forc=
ed to have
> > > > the same discussion over and over again over the years ;-)
> > >=20
> > > Well I could also send out all the DMA-buf resilient patches/ideas I =
came up with over the years once more.
> >=20
> > Maybe we could have sort of a wiki in Documentation/ with links to
> > relevant mail threads and some explanations of why things are the way
> > they are?
>=20
> I think some AI analyzing the mailing list and noting when some ideas
> repeat would help.

Such tools should be used sparingly. Notably they can contribute to
contributor-frustration.

>=20
> At least for me maintaining some kind of Wiki additional to my
> current workload wouldn't be possible at all.

A simple file with some links could be enough. But was just an idea, no
hard feelings about it.

P.

