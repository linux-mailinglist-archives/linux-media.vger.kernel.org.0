Return-Path: <linux-media+bounces-64301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9vpsG1MUKGpX9gIAu9opvQ
	(envelope-from <linux-media+bounces-64301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 15:25:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF1E660870
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 15:25:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nvLL6Ubj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64301-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64301-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2F82305FC20
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 13:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0535280A56;
	Tue,  9 Jun 2026 13:19:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA57426056C;
	Tue,  9 Jun 2026 13:19:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011161; cv=none; b=Kupt0oz8hH4/rhwdXAJHd0yJGjRMaClqk3jWKZLHwxVdt5/ru4z+9mpAQoLZdvSUBslJFuwvfP3ql44V7NEeTfSeI7nLG81ueBHpKyt9NlkoVTWXKXFH1xQzr+8NvSAepLxI3rEyUJIweds5F4yT/ZqeWkUQdNgTjpPwvoUPtBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011161; c=relaxed/simple;
	bh=Zx34jfc6gnUxXIvEa2kpyqTdW5H6JevTfEYWXz/qqO0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MR9B9qwWtqZAHEPlEmWEoPUQmXe2ZL5unXkmjXiXDGTGnSPLcv+tzxzISOrsw01Bb3zIu9P7FxQf+qy1fphM5K5e93gu32kg/EXheNgW8C04B2wtpEziawlkzATUowz+tqV5KI8t/66g3XRA5X6rEqpg0HJUF6vMadI7+ROq/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nvLL6Ubj; arc=none smtp.client-ip=80.241.56.172
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gZTyW2glfz9tnw;
	Tue,  9 Jun 2026 15:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781011155; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPZl402TTzFkEbpsWPx3x9qh63uQoHgvkfTnX6weyHw=;
	b=nvLL6Ubjv+0bH+rIPtjZU8EmZQHHyj2A6D3QdOBuIaXO7Kxs7kjGpEp5ZFuNm/+Lhl/Q9I
	rEKqDsVvwfxsqw7qoqbSfKHjyBaMEfhrPT1N4Xo1yQIGJ71+ahNIexZcy8gl2EVXzOMQYf
	qfVNjQ8jiQs3C7T8d/qXml0ks8sq3NlUWs8V3DbyK8rvYujOieaNHCENP4YG3UIynSduzI
	Ll93dtBD2UVh23Ke3ySj3WLB56fcXxoK69Y7LMQMxpQXXzGNqRhqgEJ15cKY3Tcf8YTtJD
	4KQa8JDlNV9vzFaQVyGhTf7E5DL1bBZDN0dDev5Efyemwp+Q4sbnEluzo4iUQQ==
Message-ID: <aebe759117cd65004510946e39bd02e4c903e1e3.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>, airlied@gmail.com
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Boris
 Brezillon	 <boris.brezillon@collabora.com>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>, Gary Guo
 <gary@garyguo.net>, Tvrtko Ursulin	 <tvrtko.ursulin@igalia.com>,
 linux-media@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 15:19:10 +0200
In-Reply-To: <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
	 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
	 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
	 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
	 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
	 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
	 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: jzpunfkr5bfxqpmxapy8ykety9n455dw
X-MBO-RS-ID: 048a86ff4514b3ea937
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64301-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:dakr@kernel.org,m:airlied@gmail.com,m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAF1E660870

+Cc Dave

On Mon, 2026-06-08 at 20:47 +0200, Christian K=C3=B6nig wrote:
> On 6/8/26 20:39, Danilo Krummrich wrote:
> > How did you get to this conclusion considering that you run into what I
> > mentioned above as well and the fact that we seem to agree that the per=
formance
> > concern is rather questionable?
>=20
> Quite simple, it's the cleaner approach.
>=20
> Calling callbacks with locks held is rather questionable even putting the=
 performance issue aside.


I'm right now going through all fence users to see whether we can
implement my solution.

And look what I found:

static inline bool
nouveau_cli_work_ready(struct dma_fence *fence)
{
	unsigned long flags;
	bool ret =3D true;

	dma_fence_lock_irqsave(fence, flags);
	if (!dma_fence_is_signaled_locked(fence))
		ret =3D false;
	dma_fence_unlock_irqrestore(fence, flags);

	if (ret =3D=3D true)
		dma_fence_put(fence);
	return ret;
}


That looks weird, doesn't it?


We do some git-blame:

c8a5d5ea3ba6a18958f8d76430e4cd68eea33943

and we find that it's Dave who wrote that code, because

"
    My analysis: two threads are running, one in the irq signalling the
    fence, in dma_fence_signal_timestamp_locked, it has done the
    DMA_FENCE_FLAG_SIGNALLED_BIT setting, but hasn't yet reached the
    callbacks.
   =20
    The second thread in nouveau_cli_work_ready, where it sees the fence is
    signalled, so then puts the fence, cleanups the object and frees the
    work item, which contains the callback.
   =20
    Thread one goes again and tries to call the callback and causes the
    use-after-free.
"


So this is a race, caused by lockless speed optimization.

And it would further seem that there is one invention in computer
science that can prevent such races:

Locks.

There is no cleaner, safer synchronization strategy in computer science
than locking.

This race became possible because the lock does not guard the entirety
of dma_fence_is_signaled().

Wouldn't you agree that this is a strong indicator for the great
advantages that consequent and consistent lock-protection grants? IOW,
by using locks more strictly in dma_fence, we can increase its
robustness and reliability.


P.

