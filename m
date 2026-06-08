Return-Path: <linux-media+bounces-64220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MELOCDb2JmpaowIAu9opvQ
	(envelope-from <linux-media+bounces-64220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:04:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A24916590DD
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:04:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=eOqVfl0Y;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64220-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64220-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B3C83223904
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853A43CCFB2;
	Mon,  8 Jun 2026 15:31:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94343CC31A;
	Mon,  8 Jun 2026 15:31:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932668; cv=none; b=NToAum91m75p9xI6oHHTbKC4oBgAeUyacL4ohTrdklMJpmgLf1OPpt5m79BbwQxTAjjCOUXBepPE38R2NmZrc0s7hQG8pzWGWZcDXJ+FMoepCG/sBPhsZrrI7/slg8vTaMfO61u9gDxRc8qRz55HobfCrHbIyPVo7cmEJVsR3yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932668; c=relaxed/simple;
	bh=3Ao1Wm5PqdN/lgeuaIxzpYEmwYvieq0bEQkDXHd6KJE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M4PrFBFsWt6FSRBVbDWXgUw3RfB6UTCmplprWKrA9qZ6V/rX70ld+HXflrk/cKsxcWTGPW6wRbiV7SHg2JAw1SSDVQXjgfXpLy8c7pifa2lfY3PtNbSqsdJ4IcPtXFUiHrek4ZU04RCc0jJT6g05XcYc5gRfZukAuQVMWnSoAh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eOqVfl0Y; arc=none smtp.client-ip=80.241.56.151
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gYwx151nsz9tSP;
	Mon,  8 Jun 2026 17:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780932661; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wn7yLxLm8kmCdN7adnHk3oLnLkZt7t/zPoim3PIkgr0=;
	b=eOqVfl0YD2dNt7u6nIK03/7OdlTIHMnSU1dWs33nGjnD/qHnPtne5qwyK4k0w4v4fs6Uhp
	pjoP1fyR3l6yMmI70LyoZkRMjFn4hiW1tkknL0QicSvCKcGsQYZr7YRYW4Lm/dasu/jJTI
	42L58/aGXdROgytemZAS3jt7YS3PcmW0ClR3l6tYTU1dtrUm6rXPbCO1EUqNGVoasFqZ6w
	4ZFqlyiXqvwGMutSAgl7iB/Kxwhl1mDWG49zVAxoAdOkEQNdG7rIwvvXYGqhm+7lixkFH6
	MeUe8Y4khaNJzVrQ9Bg2d2nGtPM3G3gzHrNJGNaCBjCdnt8DgWA9tPBCx6xKFA==
Message-ID: <256dc5ae3529e2548c4151af34a540476ac928c1.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>,  Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Date: Mon, 08 Jun 2026 17:30:58 +0200
In-Reply-To: <DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <20260608170112.24fd92df@fedora-2.home>
	 <6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
	 <DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 728debd615e70e6d046
X-MBO-RS-META: q9xpqdt4tjm3ihj87tj9qjpfrc5uhntn
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64220-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,amd.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,bootlin.com:url,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A24916590DD

On Mon, 2026-06-08 at 17:23 +0200, Danilo Krummrich wrote:
> On Mon Jun 8, 2026 at 5:17 PM CEST, Philipp Stanner wrote:
> > On Mon, 2026-06-08 at 17:01 +0200, Boris Brezillon wrote:
> > > On Mon,=C2=A0 8 Jun 2026 16:24:37 +0200
> > > Philipp Stanner <phasta@kernel.org> wrote:
> > >=20
> > > > @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > =C2=A0void dma_fence_set_deadline(struct dma_fence *fence, ktime_t =
deadline)
> > > > =C2=A0{
> > > > =C2=A0	const struct dma_fence_ops *ops;
> > > > +	unsigned long flags;
> > > > =C2=A0
> > > > =C2=A0	rcu_read_lock();
> > > > =C2=A0	ops =3D rcu_dereference(fence->ops);
> > > > -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> > > > +	if (!ops || !ops->set_deadline) {
> > > > +		rcu_read_unlock();
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	dma_fence_lock_irqsave(fence, flags);
> > > > +	if (!dma_fence_is_signaled_locked(fence))
> > > > =C2=A0		ops->set_deadline(fence, deadline);
> > >=20
> > > You can't take the fence lock around ->set_deadline(), otherwise you'=
ll
> > > deadlock here [1] or here [2].
> > >=20
> > > > +
> > > > +	dma_fence_unlock_irqrestore(fence, flags);
> > > > =C2=A0	rcu_read_unlock();
> > > > =C2=A0}
> > >=20
> > >=20
> > > [1]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/dma-buf/sw=
_sync.c#L182
> > > [2]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/gpu/drm/ms=
m/msm_fence.c#L139

Oh, MSM actually doesn't btw, that's a false positive. That's a
distinct spinlock on their fence context object.


But yes, before we could upstream this, we would go through all the
implementors like Danilo did, to find all the others.

P.

> >=20
> >=20
> > If we'd port these (and maybe some we have overlooked) simultaneously,
> > they could completely drop their separate locking.
> >=20
> > The fact that other parties were forced to take the fence lock in their
> > callbacks (and even 100% of the functions' code) actually proves that
> > this RFC is probably a good idea and callback-calls should be guarded
> > by the fence lock :]
>=20
> I think I looked into this recently and IIRC it indeed seems like all
> implementors of set_deadline() take the lock within their callback.

