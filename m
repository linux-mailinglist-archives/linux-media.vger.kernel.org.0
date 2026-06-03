Return-Path: <linux-media+bounces-63638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dDTkEPBdIGoD2AAAu9opvQ
	(envelope-from <linux-media+bounces-63638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 19:01:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B45EF639FF7
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 19:01:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=VgJiAwKR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63638-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63638-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B33F3314CB45
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 16:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DB13EBF15;
	Wed,  3 Jun 2026 16:34:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866213E3C4C
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 16:34:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504469; cv=none; b=SFGxhKghMDEMI4eCR9D0IY7ffWcfYSlGxVK3xbfnVqiRYTjq2fqWN/idhFaNVdY27USJEdaFFZWq7aMaSmxKLvBmUlylac1D0TjGfH3dRx6iAxZyhqUVfDLuazbVu8T8IDgiMuyl1kyW3Av7EdNI/zrBtsWqktxhsHHlMs1V+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504469; c=relaxed/simple;
	bh=RH/ZZwoGUfS6MSyonoD/OyON6LGHRGILLCmTKsLTlL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPE77kpeqN1NtBqLjv54bK674OQS8ZkHxPurWOgCUjrXXCBoxVfIoCbeFDqhLHAt5wn5g/ZcMktbNvxFHnWwTYiAi8+/+8ofC8P3HDrbpipqdQJHhMTPCCE33VKm4E8eC4GRm1xxWjbOBwrQ5TDLy8WnfQgJmukAm5aCqR1HVzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VgJiAwKR; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780504466;
	bh=RH/ZZwoGUfS6MSyonoD/OyON6LGHRGILLCmTKsLTlL4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VgJiAwKRIGyuIX/3K+D5ZO3LshNOZ3WBQ3swbt107gMxYpE5x1cPoQA42+bieUM/E
	 3l8MIRUm1guZJ3e3U92ACEt8JjLCdLh98lUepIHu0YxOAFwoSXdoc5z0TrFJ9iKel+
	 CBJbEc5hf3QBNL3WY+1rf36ORt9R4rJwhdPqjhUzZlFsFF7FWaWnHkXPd24RYgHp2O
	 H1Cq+cXio5Z/BWtTUPke1y0ErYGa+q+m4C+EGLeA9s9cUocrwqngetyyJz1aBSyNAu
	 zbVKN0KxiPSToK6oUxGyFOFghhYOL0IKcyxc4kSrae3hMeQaoFbDiHn5Wd7wsDpJEa
	 VgNF2v3LxsAQw==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 733BE17E05FC;
	Wed,  3 Jun 2026 18:34:26 +0200 (CEST)
Date: Wed, 3 Jun 2026 18:34:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, <sashiko-reviews@lists.linux.dev>,
 <linux-media@vger.kernel.org>, <ojeda@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Gary Guo"
 <gary@garyguo.net>, "Daniel Almeida" <daniel.almeida@collabora.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Message-ID: <20260603183421.06c04082@fedora-2.home>
In-Reply-To: <DIZJD7DXYF5L.2Z7JGH55EMNU2@kernel.org>
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
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:phasta@mailbox.org,m:phasta@kernel.org,m:aliceryhl@google.com,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:christian.koenig@amd.com,m:gary@garyguo.net,m:daniel.almeida@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63638-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:from_mime,collabora.com:dkim,vger.kernel.org:from_smtp,dma_fence.rs:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B45EF639FF7

On Wed, 03 Jun 2026 17:57:16 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Wed Jun 3, 2026 at 1:22 PM CEST, Boris Brezillon wrote:
> > Honestly, the more I think about it, the more I believe we should defer the
> > drop unconditionally and call it a day.  
> 
> I think deferring is fine, a hard synchronization with synchronize_rcu() in
> DriverFence::drop() seems very undesirable though.
> 
> Another option would be to change dma_fence_is_signaled() to take the fence lock
> already for signaled(), which should be fine given that drivers should only ever
> check a sequence number.
> 
> It would account for the fact that the same race is possible on the C side.
> While the memory allocation is protected by RCU, the contents are not, and it
> seems realistic a driver could invalidate the contents of its private data after
> signaling the fence while signaled() callbacks are still in flight.
> 
> Note that there are no new constraints, signaled() is already called with RCU
> read lock held, plus there's also dma_fence_is_signaled_locked() which also
> calls signaled() with the fence lock held.
> 
> With this, the problem goes away, as it would guarantee that once we reach
> drop_in_place() in DriverFence::drop() it is impossible that there are still
> callback in flight.

If we can guarantee that no dma_fence_ops we ever consider implementing
in dma_fence.rs will be called after we've signaled the fence, that's
even better, but it's not that clear to me that it works just for the
callbacks we already implement (get_{driver,timeline}_name()). Take
dma_fence_describe() for instance, with your solution the
dma_fence_is_signaled() call in there would take/release the fence lock
unconditionally, but it's still racy, because the fence might be
signaled just after the lock is released and we would consider it valid
to call ->get_{driver,timeline}_name() and use the returned strings even
though the fence was effectively signaled in the meantime. We can of
course fix that by forcing dma_fence_describe() to take the fence lock
around the whole section where it's retrieving/using the driver/timeline
strings, but I'm pretty sure this has been considered and dismissed by
Christian.

I think we can't have it all, either we consider RCU deferral cheap
enough that we can live with the scheduling overhead + the fact we
might hold on system resources a bit longer. Or we consider DriverFence
release a hot-path where resources should be returned as soon as
possible, and we need to protect dma_fence::ops with a dedicated
rwlock_t.

