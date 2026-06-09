Return-Path: <linux-media+bounces-64294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OGE4JXL8J2qU6gIAu9opvQ
	(envelope-from <linux-media+bounces-64294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 13:43:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B1165F94F
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 13:43:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tk5HlD4L;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64294-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64294-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 033133062449
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 11:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF4C401495;
	Tue,  9 Jun 2026 11:39:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A03FFFA7;
	Tue,  9 Jun 2026 11:39:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005160; cv=none; b=baUzmybH6s8mfHZ5LzF1/Ybdnf5VWwQYDm1/3XUPJCvntrxuuCNnbqSUYGY++k+eQ2mum9of+uNJRSJ6Mea23y4abszCLuKBjPE4M3y7jx5cnWjHvqTMy2Vgb7r+WgfMqF0zCBpxgt2aOMpRTPIeWOiKcqY8LdYTU+TwS7OCRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005160; c=relaxed/simple;
	bh=G22FCbzMoMSFXLB/+ltVXi9K/ZR8hGAzPX5+k2w2/ds=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N+lUHEeaoaWCoJt2UqIldE1qvrrbhewdkxEtot+rkKWev7M3RfsFsu989IJTxsUEnyvfJqZ7ppo+ea3ZcfXmDS1ULU/I4tCNCnYCvsEB3g9qgFZXRWM3tQVRWMZKyj/iBGRTqzzfPbPMPtQkPzNzR17rq/1/U70UXNfBhSZnqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tk5HlD4L; arc=none smtp.client-ip=80.241.56.151
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gZRl52q1Fz9tr7;
	Tue,  9 Jun 2026 13:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781005153; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eluLLDgP42hnm6jSqwzWJSIrEMLWAxnFr1RN8X6YAUo=;
	b=tk5HlD4L9kqxIDcZlFhew/dR8jEsftGQ+wCMkGLdLOrCCkOVQ7Bho2T2WQIaP67moDgwxv
	9dm3zNzGOrb8PPnNNBIcoad6erBNpY9vEe5TF9JVbYHvkWunfu6DwBOkPjc09Y54oF5BhM
	GazDZiH7A9GLSK1KTnQiUTZWNoDO4aXuVtmpY2We1Vw1U85LkZlA2mhqO8QKEGlzxKq1on
	FuTpHQ1DIwrOiJM7fP58UAcNf/yqXvtGHH94umZXFnxv4YOJ6U7KydRony9llLW6nCKW8j
	xgj8QwnlCU2QOtSVFMqPh7H6h6RpfhRYr90IhSvl7aI0mU57YJlHya6eTc4oOA==
Message-ID: <ced850f9e421d6549c25c27d50a99111bddb2db2.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>, Tvrtko
 Ursulin	 <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 13:39:09 +0200
In-Reply-To: <1bb5efeb-a5d3-4d0b-ae69-8dc8620604d4@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
	 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
	 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
	 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
	 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
	 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
	 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
	 <74bd33a06b75c291c3e2eda19e0250fbd280c49b.camel@mailbox.org>
	 <66349a9f-d9dd-498b-b118-1c79d3aa3cca@amd.com>
	 <11d7c83185a18d13760b6e77275e97c110dcddcc.camel@mailbox.org>
	 <1bb5efeb-a5d3-4d0b-ae69-8dc8620604d4@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: f42b8e1ecef5c7e0890
X-MBO-RS-META: ef3tzkx4ydxh7gmaugqom6nkt6ostb57
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64294-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89B1165F94F

On Tue, 2026-06-09 at 12:53 +0200, Christian K=C3=B6nig wrote:
> >=20
> > // driver
> > dma_fence_signal(f); // revokes all accesses to our driver through back=
end_ops
> > // synchronize_rcu() now unnecessary \o/
> > cleanup(f); // We know that all accessors are gone
> > dma_fence_put(f);
>=20
> Yeah and exactly that doesn't work.
>=20
> Just think about the Nouveau case when you have your fences on a double l=
inked list.
>=20
> When the fence lock is independent, e.g. have a separate lock for each fe=
nce then this lock can't protect this double linked list.
>=20
> So your cleanup path needs to take a lock which protects the list, but yo=
u then run into lock inversion.


static bool nouveau_fence_is_signaled(struct dma_fence *f)
{
	struct nouveau_fence *fence =3D to_nouveau_fence(f);
	struct nouveau_fence_chan *fctx =3D nouveau_fctx(fence);
	struct nouveau_channel *chan;
	bool ret =3D false;

	rcu_read_lock();
	chan =3D rcu_dereference(fence->channel);
	if (chan)
		ret =3D (int)(fctx->read(chan) - fence->base.seqno) >=3D
0;
	rcu_read_unlock();

	return ret;
}


AFAICT fctx->read() does not take f->lock. So where is the lock
inversion?


Again, ideally we can get to the point where no one except for the
fence subsystem itself has to take the lock manually anymore.

>=20
> > >=20
> > > So you are left with few options: Either the fence lock is external,
> > > which we don't want because that make the fence non-independent, or
> > > cleanup() defers work to irq_work or work_structs, which creates
> > > numerous lifetime issues.
> >=20
> > Yup, this is uncool and we want to avoid that.
> >=20
> > But these seem to be the options
> >=20
> > 1. Ensure proper synchronization
> > 2. Wait for a grace period in a hot path
> > 3. Defer cleanup() with some delay mechanism
> >=20
> > #1 is by far the cleanest approach. I still cannot see any downside,
> > and quite a few upsides.
> >=20
> > https://elixir.bootlin.com/linux/v7.1-rc6/source/drivers/dma-buf/dma-fe=
nce.c#L1025
> >=20
> > ^ is already racing with the signaled check.
>=20
> Yeah so what? That is just an opportunistic check.=20

What happens if someone signals the fence while the set_deadline()
callback is running?



P.

