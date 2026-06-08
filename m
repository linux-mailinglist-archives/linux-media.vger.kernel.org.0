Return-Path: <linux-media+bounces-64219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qn6/JvrkJmpJmgIAu9opvQ
	(envelope-from <linux-media+bounces-64219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:51:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAE36585A0
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:51:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=VZPWXCOg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64219-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64219-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E22D030D31EB
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF85330D29;
	Mon,  8 Jun 2026 15:30:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2FB322B6D;
	Mon,  8 Jun 2026 15:30:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932653; cv=none; b=KjnnfTDhbQdOelhAmvgkWV3fllxzG5XndrqpzFQKfxtoKRMJjbrqVgYoz5jvOpDBHCDwjh6zvttrXuhwD4zwjrsngXbwKocR5WcNNEzy/62Uj87nlsG2CpwWFICcfuskXX5TgVZ2LpJXnvnTAXg1kXwm5dRZKneGVray7rnRP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932653; c=relaxed/simple;
	bh=tMpgAvxMGxIQmpSssq6c7l771FlFeNKZ7wj1qvYxYkc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gUxoek9o8jzu7qPmkt5Q9dUcsBc5RqIrPVhZMO8wVg1la3lUR97rJVDIpbtHQaNKNNpQYCp1JZXs4o/O718q3P8heYNtHFYuf6+bk3VUhgMMcQGxhSQzlAnJdbAJ48tInZkxO2y03akdVMXn7my0/MXZt4avOlAIAYvPK2OwRY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VZPWXCOg; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780932650;
	bh=tMpgAvxMGxIQmpSssq6c7l771FlFeNKZ7wj1qvYxYkc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VZPWXCOgwkC3VZzov1sGksk+CvMBsdtLCiZ+xRkCQwHzxxZpS17Wvqye9Ze+LgxRw
	 48Jv3SLLmItV8OpNrqDRLFn6sFfyjbd3jedurPs1NMK3XY6FnqtW8ofWpxZytBeYFD
	 y8wP633LR58+zzxfQpm9jFWGvl0wKWmh0lpAoI0T4TrfKuBOr7bL+liYiKJnTkfjeE
	 /S0Rj4hnDrTogjGcxZIAsMzfzLHhPV/MukhkkT6ktzRpJyHda9TnsbEHyguoZV5MoS
	 LQLOO1EUyAXvAqTwBpUsiJBzxqik697EBsSBv3VYsuVBe3O28u9XmzsaW2y0MmsFiJ
	 b/DVOfaoZ2vEg==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5BC917E011B;
	Mon,  8 Jun 2026 17:30:49 +0200 (CEST)
Date: Mon, 8 Jun 2026 17:30:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <dwlsalmeida@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
Message-ID: <20260608173045.70bee7ad@fedora-2.home>
In-Reply-To: <DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
	<20260608170112.24fd92df@fedora-2.home>
	<6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
	<DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64219-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:phasta@mailbox.org,m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,linaro.org,amd.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:from_mime,fedora-2.home:mid,bootlin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CAE36585A0

On Mon, 08 Jun 2026 17:23:06 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Jun 8, 2026 at 5:17 PM CEST, Philipp Stanner wrote:
> > On Mon, 2026-06-08 at 17:01 +0200, Boris Brezillon wrote: =20
> >> On Mon,=C2=A0 8 Jun 2026 16:24:37 +0200
> >> Philipp Stanner <phasta@kernel.org> wrote:
> >>  =20
> >> > @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> >> > =C2=A0void dma_fence_set_deadline(struct dma_fence *fence, ktime_t d=
eadline)
> >> > =C2=A0{
> >> > =C2=A0	const struct dma_fence_ops *ops;
> >> > +	unsigned long flags;
> >> > =C2=A0
> >> > =C2=A0	rcu_read_lock();
> >> > =C2=A0	ops =3D rcu_dereference(fence->ops);
> >> > -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> >> > +	if (!ops || !ops->set_deadline) {
> >> > +		rcu_read_unlock();
> >> > +		return;
> >> > +	}
> >> > +
> >> > +	dma_fence_lock_irqsave(fence, flags);
> >> > +	if (!dma_fence_is_signaled_locked(fence))
> >> > =C2=A0		ops->set_deadline(fence, deadline); =20
> >>=20
> >> You can't take the fence lock around ->set_deadline(), otherwise you'll
> >> deadlock here [1] or here [2].
> >>  =20
> >> > +
> >> > +	dma_fence_unlock_irqrestore(fence, flags);
> >> > =C2=A0	rcu_read_unlock();
> >> > =C2=A0} =20
> >>=20
> >>=20
> >> [1]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/dma-buf/sw_=
sync.c#L182
> >> [2]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/gpu/drm/msm=
/msm_fence.c#L139 =20
> >
> >
> > If we'd port these (and maybe some we have overlooked) simultaneously,
> > they could completely drop their separate locking.
> >
> > The fact that other parties were forced to take the fence lock in their
> > callbacks (and even 100% of the functions' code) actually proves that
> > this RFC is probably a good idea and callback-calls should be guarded
> > by the fence lock :] =20
>=20
> I think I looked into this recently and IIRC it indeed seems like all
> implementors of set_deadline() take the lock within their callback.

dma-fence-{chain-array}.c don't, but that's probably okay if they are
called with the container fence lock held, because we already have a
separate lockdep-class assigned to deal with the nested-locking of
dma_fence::inline_lock in the signal path.

