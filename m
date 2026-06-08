Return-Path: <linux-media+bounces-64214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v6SwA0flJmpcmgIAu9opvQ
	(envelope-from <linux-media+bounces-64214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:52:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACEF6585DF
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:52:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=t6p5kcq4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64214-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64214-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62B5535097E3
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE9D3F0AAC;
	Mon,  8 Jun 2026 15:18:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399223AA9F4;
	Mon,  8 Jun 2026 15:18:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931887; cv=none; b=bcuMcvy0fNPOpXHKGq7mltOjLI1qtbDqskvDHqjpM+w2ujJVOmWoCu83EqvyZLHPEMVTX+cBvn+zFN4poKNSzaFo2zpDrMy7p9oJ47sgBgN1kzM969udhd5pbLzjtdE10ujbx5ijTSeF8dzEDuBhiiyAPitVIxplL2j0Er3dqJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931887; c=relaxed/simple;
	bh=2prRoDT/nsKKhIt2dQ3M9bNyzIozuR0cCELNvku2q2Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H05eNRyL5pDyFdjQy8Xrpixa0SjbL5rayXfHq2qQ6tPi+KRwRFtbXG1wkM8QxvvpDc8lZ50+WoNryKD/ao7k3cIKQu8v1Blyf4rC3+AIGEfDUkDkPLUsPBYAS9BQihQGUYhKkA6bG3njGbo/k6+8Cim60TctYo7E3oNbX9N3NZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=t6p5kcq4; arc=none smtp.client-ip=80.241.56.151
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gYwf06RW0z9t2V;
	Mon,  8 Jun 2026 17:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780931880; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MvgHNmO3IxC6FXq47XwMRXs/rO7p6vxeZKZs8DURXVw=;
	b=t6p5kcq4GEPZGEBmrYJd5WjDVKQDmd/x+E1K3DdHytPDxNbcqknDyjyuhQHcAfV2NSrBhe
	nSvqr5gFQvWu749rsfgAqGdcLMPphK4gfu3xsTVIQnzP2cOQXcdjvNYUeL6EMyGDx+6I3f
	iEpo/nkHHG70UXXBwkp/YXHUaftkIv3Uqr6iuOIX+D8/CITL5vbIWtLjfjpeON6EORLB2w
	op5eLLM8rRo7vU0aiUn0cSHZPVqTH/V5B8C3VNtmrN8pyFDfmtPSURZmaLDXOaaEvP2lQM
	8hHgZhkSra8TL+1ZswdsGbvGROxZ19ItM4ndpTxwuo/uocUU0gcxWAh2aN018w==
Message-ID: <6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
	 <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida	 <dwlsalmeida@gmail.com>, Gary Guo
 <gary@garyguo.net>, Tvrtko Ursulin	 <tvrtko.ursulin@igalia.com>,
 linux-media@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich	 <dakr@kernel.org>
Date: Mon, 08 Jun 2026 17:17:57 +0200
In-Reply-To: <20260608170112.24fd92df@fedora-2.home>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <20260608170112.24fd92df@fedora-2.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 59bc9e339d8aa4148f6
X-MBO-RS-META: 87wtwfwi7qid9a3otercu8yt7yiyc6zx
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
	TAGGED_FROM(0.00)[bounces-64214-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org,kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7ACEF6585DF

On Mon, 2026-06-08 at 17:01 +0200, Boris Brezillon wrote:
> On Mon,=C2=A0 8 Jun 2026 16:24:37 +0200
> Philipp Stanner <phasta@kernel.org> wrote:
>=20
> > @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > =C2=A0void dma_fence_set_deadline(struct dma_fence *fence, ktime_t dead=
line)
> > =C2=A0{
> > =C2=A0	const struct dma_fence_ops *ops;
> > +	unsigned long flags;
> > =C2=A0
> > =C2=A0	rcu_read_lock();
> > =C2=A0	ops =3D rcu_dereference(fence->ops);
> > -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> > +	if (!ops || !ops->set_deadline) {
> > +		rcu_read_unlock();
> > +		return;
> > +	}
> > +
> > +	dma_fence_lock_irqsave(fence, flags);
> > +	if (!dma_fence_is_signaled_locked(fence))
> > =C2=A0		ops->set_deadline(fence, deadline);
>=20
> You can't take the fence lock around ->set_deadline(), otherwise you'll
> deadlock here [1] or here [2].
>=20
> > +
> > +	dma_fence_unlock_irqrestore(fence, flags);
> > =C2=A0	rcu_read_unlock();
> > =C2=A0}
>=20
>=20
> [1]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/dma-buf/sw_syn=
c.c#L182
> [2]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/gpu/drm/msm/ms=
m_fence.c#L139


If we'd port these (and maybe some we have overlooked) simultaneously,
they could completely drop their separate locking.

The fact that other parties were forced to take the fence lock in their
callbacks (and even 100% of the functions' code) actually proves that
this RFC is probably a good idea and callback-calls should be guarded
by the fence lock :]


P.

