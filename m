Return-Path: <linux-media+bounces-64990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 39j6DDkzMWqUdwUAu9opvQ
	(envelope-from <linux-media+bounces-64990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:27:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D368EC78
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:27:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=A8SrExAT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64990-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64990-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 616B9311A989
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424883BAD94;
	Tue, 16 Jun 2026 11:25:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5A0367B71;
	Tue, 16 Jun 2026 11:25:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609128; cv=none; b=HOfQrlkxsLkd553SS63wjyKgcDFyQFhzXUeXM2qeq044fgmaBWw0xzLsamvjIZQawyr41uaXjHF75IlG15PlDdzj9vSnCqbjLFTMwoAnkwFPnTaBffQQxqAqKfYL/w367nocL2mbkYfji/AxlBrz8uT/hNYxZYcf6INwMe3ejVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609128; c=relaxed/simple;
	bh=Hfjg0zrjMQBMltSDWn2ivlML91s4JlSHhbeBDjuxcHc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XfNiLjvrobFQlqnUjbOQoVmlGTjTAze1UV8LExylRTWD2CnXOxyXNtqg9+JG0e8OypxspJ6A9df/iNcGrkBr3NgUcaQONTXFiBOpFfxIh1nMwqVfN899se/H09rwzTNpZEVFOugtd6f/0kojQEavH+DcwXQKdNcOc/1hLDMWBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=A8SrExAT; arc=none smtp.client-ip=80.241.56.171
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gfl5p0kQgz9v0h;
	Tue, 16 Jun 2026 13:25:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781609118; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQUjR7l8aA+GPoVR7P3niXy4NkEKg0qrVZO94FtcVn4=;
	b=A8SrExATg/qPX2tHOAsQpF6ODXNJd9BKrd7ejRQdac4R2F4wr1xGFb/A9gA9WmXtWTUbWO
	sFJVixvnlEh0gcURLpmRCHmt9cFOBlbsc8WYB/+vufXaAE147jbUlBSYPImeiVCdldHypr
	cqS/ybgNuuqMg+2oDd90HbxNHzfwM+m1+bxk2rQodlOzZ+jAHHwlLve6+H9eITPsaLYjHa
	+nF6ukbml8EreT9GKQ4Zp1BoDzZYYo2SBXIBqVPf5wrEjAAA1PkjqlpFB/6N3ZykWWgaqh
	Mm9S3Mw6vPKkN/XyI7YUowkTPe8QhgUbIDkuc57g2L+jeZilPRlGkSMlt7mPjg==
Message-ID: <630a8a84ee8fdaa634c7b104742e7a28fcfe507c.camel@mailbox.org>
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
Date: Tue, 16 Jun 2026 13:25:11 +0200
In-Reply-To: <6ea6c373-c6cb-4221-ad9d-e60b04d1368f@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
	 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
	 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
	 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
	 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
	 <fa0dc9757bf8343516c4b156a2b70ec91b64ef8f.camel@mailbox.org>
	 <6ea6c373-c6cb-4221-ad9d-e60b04d1368f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: ceea9f921cae1948b1d
X-MBO-RS-META: 9r3ta9drfsrmk436x4gqib4ft6b7s7me
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
	TAGGED_FROM(0.00)[bounces-64990-lists,linux-media=lfdr.de];
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
	DKIM_TRACE(0.00)[mailbox.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 757D368EC78

On Mon, 2026-06-15 at 11:57 +0200, Christian K=C3=B6nig wrote:
> On 6/15/26 10:29, Philipp Stanner wrote:
> >=20
> > This fast path check in my mind certainly breaks the intended dma_fence
> > design:
> >=20
> > void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t timestamp)
> > {
> >  const struct dma_fence_ops *ops;
> >  struct dma_fence_cb *cur, *tmp;
> >  struct list_head cb_list;
> >=20
> >  dma_fence_assert_held(fence);
> >=20
> >  if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> >  return;
> >=20
> >=20
> > Modifying the bit is consistently done under lock protection, so
> > reading must be done, too.
> >=20
> > Do you remember who wanted those fast path checks? Who is spinning on
> > that lock?
>=20
> Simona Vetter and basically the rest of the community.

I did some git-blame and it would seem to me that this fast-path hack
was added in

e941759c74a4 fence: dma-buf cross-device synchronization (v18)

in 2014 A.D.

So it was there from the very beginning and was not added because there
was a performance bottleneck later. It is conceivable that a
performance issue was present from the get go, of course.


>=20
> And I can clearly say even if I don't like them that those
> optimizations are a must have.
>=20
> > In any case, that needs to be repaired.
>=20
> No, see my discussion with Simona on the mailing list. I need to dig
> that up as well, but it was around the time I added the same
> workaround to amdgpu.
>=20
> You are basically trying what I have been suggesting as well, but
> there is a very wide agreement that the current design is a must
> have.

I suggest at least three things:


A.

Very explicitly document all lockless mechanisms and their
justification in both code comments and commit messages.

 * We need to document lockless magic *drastically* better in DRM. I
   see code left and right where there is some barrier with the comment
   simply being "so list_empty() works without a lock".
 * The commit message needs to justify why a lock is missing, why this
   is the preferred solution, why it is correct. The latter also needs
   to be in a code comment.
 * Note that WRITE_ONCE() is not only about volatile, but also about
   "watch out, here is a lockless access!", as Linus pointed out
   repeatedly.


B.

I think rejecting ideas with "we tried this, it >>didn't work<<" is not
a valid reason for refusing an idea. Point A above helps with that. If
your commit message contains measurements or links to tickets with
*real life* performance regressions (microbenchmarks are invalid), that
helps reducing discussion overhead drastically.

Now, in this particular case, I fail to see how taking the spinlock to
check that bit is evil. If it regresses someone's speed that much, it
would mean that someone is heavily punching that lock, like polling
24/7 with dma_fence_is_signaled().

Again, having that use case documented somewhere could save us all time
=E2=80=93 especially for you, Christian, since you wouldn't be forced to ha=
ve
the same discussion over and over again over the years ;-)


C.
Robustness and correctness always trump performance. They especially
trump microbenchmarks.


P.

