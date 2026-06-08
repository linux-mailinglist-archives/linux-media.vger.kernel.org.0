Return-Path: <linux-media+bounces-64216-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WFZ0MbnlJmp+mgIAu9opvQ
	(envelope-from <linux-media+bounces-64216-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:54:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 310A165862A
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:54:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="ZN3TL//e";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64216-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64216-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DBAD35378B2
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8EF3F9296;
	Mon,  8 Jun 2026 15:23:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7623F5BE7;
	Mon,  8 Jun 2026 15:23:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932191; cv=none; b=Wj6sfFDbY+54wqwwLXj391UxlDUTZXjx5uosSdziSzvNxT/wwMBEiblVZzeyRQENh0qaq3wtW1O9MMhFrzcosPQqpZ2dVbQs783oaH8+QVbTmQU5svj83eXpK0i8D3m39FZvgX+j85BdQNUazI6LP7CzBXXaGsqCrK86PEuFyow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932191; c=relaxed/simple;
	bh=4L7ItEH1javTtrHKhZK3KyX6e8JpjNfi2YzsK+EH9/Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=a6VjuaxvP2EebnXb82fYezyVEK5E0/ccp9uf2es5V0bSdiIwQS6oV6af5xtLof0RyEIb3f/4RLJczmXXQmYuzn8U7sKa3sX+6TNuWr2iHdsZ3Rx9INUuI8PUgemstWILZbXeO9J9cVGdJxoPA9fsPsQQYXHb1fjhsrKBeAitLI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZN3TL//e; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291301F00893;
	Mon,  8 Jun 2026 15:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780932190;
	bh=ncrCACTkUNfpMUjm6+cmxSyvVwJrnjrLOEWj6i6HgS0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ZN3TL//euvdAQwQDgxiVPv21Aw4q89ZhitkD/YVtPRSaYl0lSBgj49DySlUYKfJ+n
	 Oqe1OVsOF2J63uXbWvS6giHwvAp86wM9KkINGd4GgzC+Fh8DzTU+dYj6pGqmmEm0Pl
	 ekRS94DBLtMaFVbcTLXkIFIJAjzx0glePdVQgBDPMh7qpTsn92ncyb4FslfbVKNd2z
	 hCq+09a4u9mGttY8IhVw70vZxvJ4ThN9gHiSLfmnvwpOpAMnIqL2iXfS+Ybpr4SvKn
	 q10xOpKfiPbQu5muBc7tSUrAfkMT5en8N6DO2I1F8bui1exLPuTGT4qGy1gCacN6Ej
	 y3V3NCPaQUX7g==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 17:23:06 +0200
Message-Id: <DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
Cc: <phasta@kernel.org>, "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <dwlsalmeida@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
 <20260608170112.24fd92df@fedora-2.home>
 <6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
In-Reply-To: <6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64216-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phasta@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,amd.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 310A165862A

On Mon Jun 8, 2026 at 5:17 PM CEST, Philipp Stanner wrote:
> On Mon, 2026-06-08 at 17:01 +0200, Boris Brezillon wrote:
>> On Mon,=C2=A0 8 Jun 2026 16:24:37 +0200
>> Philipp Stanner <phasta@kernel.org> wrote:
>>=20
>> > @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>> > =C2=A0void dma_fence_set_deadline(struct dma_fence *fence, ktime_t dea=
dline)
>> > =C2=A0{
>> > =C2=A0	const struct dma_fence_ops *ops;
>> > +	unsigned long flags;
>> > =C2=A0
>> > =C2=A0	rcu_read_lock();
>> > =C2=A0	ops =3D rcu_dereference(fence->ops);
>> > -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
>> > +	if (!ops || !ops->set_deadline) {
>> > +		rcu_read_unlock();
>> > +		return;
>> > +	}
>> > +
>> > +	dma_fence_lock_irqsave(fence, flags);
>> > +	if (!dma_fence_is_signaled_locked(fence))
>> > =C2=A0		ops->set_deadline(fence, deadline);
>>=20
>> You can't take the fence lock around ->set_deadline(), otherwise you'll
>> deadlock here [1] or here [2].
>>=20
>> > +
>> > +	dma_fence_unlock_irqrestore(fence, flags);
>> > =C2=A0	rcu_read_unlock();
>> > =C2=A0}
>>=20
>>=20
>> [1]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/dma-buf/sw_sy=
nc.c#L182
>> [2]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/gpu/drm/msm/m=
sm_fence.c#L139
>
>
> If we'd port these (and maybe some we have overlooked) simultaneously,
> they could completely drop their separate locking.
>
> The fact that other parties were forced to take the fence lock in their
> callbacks (and even 100% of the functions' code) actually proves that
> this RFC is probably a good idea and callback-calls should be guarded
> by the fence lock :]

I think I looked into this recently and IIRC it indeed seems like all
implementors of set_deadline() take the lock within their callback.

