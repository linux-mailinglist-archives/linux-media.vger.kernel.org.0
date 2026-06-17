Return-Path: <linux-media+bounces-65104-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kFhqNw11Mmoa0QUAu9opvQ
	(envelope-from <linux-media+bounces-65104-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 12:21:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE26986C8
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 12:21:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=BkW2iC+s;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65104-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65104-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0F093137972
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 10:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A2C3EC2F7;
	Wed, 17 Jun 2026 10:16:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0493546CC;
	Wed, 17 Jun 2026 10:16:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691393; cv=none; b=p/YV5poaTny6qs1Z8ho8KYKOiy4aV6nHdZWIqsITRk3VTrVLsdWEKq1VA7TjWjv6sF0J3U4J0JuaYfddG/z7XKNBazbLsiVs1XIGgRlQ54Dv6hvT6Vala9w1xc1xYIrtfdaULBRBGfzdO4+cJ5PreiNGggBEsKPFwXg/+WGD98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691393; c=relaxed/simple;
	bh=fDPkcbI+0EFZxysD0GtaYXuRVf4DaqDdyw25QZDgFfs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/mmI6ZbYNqXc3+tIL7g1JvbqVFvBTto2lCKdlrJjmK+arPdrXl78QLMiEsjyXbxBG/+hXC3lZ1LpoXZ4Ee+xgggBWjNMwaod5HQzXVpkuWh3P8QDMgMBmbLCqgfvQKWdtRfOZoAt1XvGw/lYHQ3HVvtyu53CGvWFRrN8P+EU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BkW2iC+s; arc=none smtp.client-ip=80.241.56.172
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ggKWt3Lp3z9tPX;
	Wed, 17 Jun 2026 12:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781691386; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDPkcbI+0EFZxysD0GtaYXuRVf4DaqDdyw25QZDgFfs=;
	b=BkW2iC+syb34VHAAFQhXqRa3M8xuFWb4t6hfs5lHcQEU+ZHYo1+y5xenX/ScF/P0dJIb4w
	hKjuJiIJAP21ayrjvo+Rt0kkr4wzG64JZia5qXeVS1+wsIc9HIurmh6Q3qMOypcFwO/ubq
	toizZDaexV6sA3ZGhnSmm87KjJROvJtOzVK9jA0tlCoW+6OgKZlPaCoNRrDUBmZqMQu68j
	ir5JySokMGJ4ptt8WydSQ1ASM+UvOpXj4lIWZo11SCmlsAP7eia5YIqUv89KXf3VFBG1Iw
	8Qhhpglt6s5mrdjgUoAA82z97QmABA/z+izX9yilE60NJjnKKz1hS68duJaj4Q==
Message-ID: <80734f05e684ed6b8c82abd9f96c93968537d0de.camel@mailbox.org>
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
Date: Wed, 17 Jun 2026 12:16:20 +0200
In-Reply-To: <7ff7dc15-4df5-443c-8d7c-c8e9b2672f2c@amd.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 4601702ea4fe0ffa470
X-MBO-RS-META: jtuwuqyyi7tzm94cpfm88dc8zfef3q86
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
	TAGGED_FROM(0.00)[bounces-65104-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40CE26986C8

On Wed, 2026-06-17 at 11:46 +0200, Christian K=C3=B6nig wrote:
> On 6/16/26 13:25, Philipp Stanner wrote:
> >=20
> > So it was there from the very beginning and was not added because there
> > was a performance bottleneck later. It is conceivable that a
> > performance issue was present from the get go, of course.
>=20
> Not saying that it wasn't there from the beginning, but multiple
> people (including me) have tried to improve the situation and that
> was either immediately reverted or directly rejected.
>=20
> > >=20
> > > And I can clearly say even if I don't like them that those
> > > optimizations are a must have.
> > >=20
> > > > In any case, that needs to be repaired.
> > >=20
> > > No, see my discussion with Simona on the mailing list. I need to dig
> > > that up as well, but it was around the time I added the same
> > > workaround to amdgpu.
> > >=20
> > > You are basically trying what I have been suggesting as well, but
> > > there is a very wide agreement that the current design is a must
> > > have.
> >=20
> >=20
> > =C2=A0* We need to document lockless magic *drastically* better in DRM.=
 I
> > =C2=A0=C2=A0 see code left and right where there is some barrier with t=
he comment
> > =C2=A0=C2=A0 simply being "so list_empty() works without a lock".
> > =C2=A0* The commit message needs to justify why a lock is missing, why =
this
> > =C2=A0=C2=A0 is the preferred solution, why it is correct. The latter a=
lso needs
> > =C2=A0=C2=A0 to be in a code comment.
> > =C2=A0* Note that WRITE_ONCE() is not only about volatile, but also abo=
ut
> > =C2=A0=C2=A0 "watch out, here is a lockless access!", as Linus pointed =
out
> > =C2=A0=C2=A0 repeatedly.
>=20
> Completely agree. Question is who has time for that?

We / the maintainers of the respective systems need to heavily
encourage that :)

The good news btw is that many things are moving towards a good
direction in recent past, as far as I have seen

>=20
> > B.
> >=20
> > I think rejecting ideas with "we tried this, it >>didn't work<<" is not
> > a valid reason for refusing an idea. Point A above helps with that. If
> > your commit message contains measurements or links to tickets with
> > *real life* performance regressions (microbenchmarks are invalid), that
> > helps reducing discussion overhead drastically.
> >=20
> > Now, in this particular case, I fail to see how taking the spinlock to
> > check that bit is evil. If it regresses someone's speed that much, it
> > would mean that someone is heavily punching that lock, like polling
> > 24/7 with dma_fence_is_signaled().
>=20
> I think (but I'm not 100% sure) the the problem is that taking the
> spinlock introduces a write to the cache line it is in.
>=20
> At the moment when a fence is signaled a read is enough to check that
> state, so what happens is that the cache line for the signaled bit
> sooner or later end up in all CPU caches.
>=20
> When you start to use the spinlock the cache line backing that plays
> ping/pong between all the CPU cores and that is something which
> always stalls each CPU when it needs to acquire the cache line. Keep
> in mind that on a modern box you can calculate like a 4x4 matrix in
> the same time you solve a cache miss.
>=20
> This is especially important for the stub fence which is used by
> basically all cores at the same time whenever you need a signaled
> dummy.

Alright, that sort of sounds logical, I guess. So the argument
basically is that if we'd try to lock that, someone would immediately
report real and massive performance regressions leading to a revert.

I think last time you mentioned that memory footprint is less of a
concern for dma_fence than cache lines. Out of interest: has anyone
ever experimented with more padding to prevent spinners from shooting
down other CPUs cache lines?

Since you're the maintainer of dma-buf, what would you wish we do?

Would you be at least OK with the memory barrier approach to make the
API a bit more robust? AFAIU the barriers will not cause a cache line
invalidation.


>=20
> > Again, having that use case documented somewhere could save us all time
> > =E2=80=93 especially for you, Christian, since you wouldn't be forced t=
o have
> > the same discussion over and over again over the years ;-)
>=20
> Well I could also send out all the DMA-buf resilient patches/ideas I came=
 up with over the years once more.

Maybe we could have sort of a wiki in Documentation/ with links to
relevant mail threads and some explanations of why things are the way
they are?

btw, is there a dma-buf TODO list like for DRM in general?

There are many passionate hackers who love challenges. We could
certainly add a few "Difficulty: hard" entries for a few controversial
potential reworks.


P.

