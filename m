Return-Path: <linux-media+bounces-30019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A753A85DA2
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 14:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C09519E2F00
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 12:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC0E2367A9;
	Fri, 11 Apr 2025 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YnvjuG45"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667B22367A2;
	Fri, 11 Apr 2025 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375470; cv=none; b=BITIjBIaI0m3wlln3/xwpWvLRoE7ydL0ed6SmsTUrshAs90N40TE+uF17iVv5T3XfiFULs+hE5lgRc3KbtSgcvW5EW36IosI0coq8luvRSJuZzlMHSFOOcudwgaYdnt5ZDVvpOAbDKLZUyP4oOhEkqZS00ErFTaqO0H+/1wKOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375470; c=relaxed/simple;
	bh=AXcAHh4A99ApfSw7e1FE0t9CbPKh5z2rMgIkiKLkgjQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TaDyl1yRe/ku5iDuSjyEKjfCLGIAV6A2Uy0KXqPSpDdTNADPUVgcqGruwnmPgMFrIuimIJ5QcG95Im915ud0qBzLZAcBsEsfy8jCR0dmlEWqEyNZd+tfMKUop/htUur2LQAPCVKBfaSKofFbWgQoCaYeRmPNCZHSM6tRxb+j7YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YnvjuG45; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZYxG02S0Mz9snx;
	Fri, 11 Apr 2025 14:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744375464; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Du4qqvATMM8DpLvGgTuHF9F5VvpdjpJA6n9DJyaGPRs=;
	b=YnvjuG45lTJrdSA3FlIcRfV0ksiDBOXoKjJN0mjnLaQUNzPuBAjcFfot2/hiu3vR8zsgTe
	ZWsGvPf36O008LxYT3JtfR5ONeTc3yK+XD4fYXqo0kE0CGZIl0vvL4vN3MTQEvEZV4fObB
	NM+Q6dSFX5aiVEQQ8M5KQfRn+9g/dMezD+Kx+ChA7HJgHBc3W6ISY7hyPbR98IOCjjjYZ0
	Qmv+6lcQBHKVPlTf8W2iIwg7d7axNo0Ynk8HBrj6EgRF8OXZ3MWUCdCR3X33XgG02Ggiz5
	wj23pZUS5kKeHJ9842CTJVfibOv40lTZ8Ca8AiW4oBZ4gCow7hBqCqK4Fz6TRw==
Message-ID: <aca00cb25b813da4fd2f215829f02337f05642f3.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
	 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
	 <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>, Sumit Semwal
	 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	stable@vger.kernel.org
Date: Fri, 11 Apr 2025 14:44:18 +0200
In-Reply-To: <81a70ba6-94b1-4bb3-a0b2-9e8890f90b33@amd.com>
References: <20250410092418.135258-2-phasta@kernel.org>
	 <20250410092418.135258-3-phasta@kernel.org>
	 <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
	 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
	 <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
	 <1a73e5fe4350d6ee4b7d807612264eb637c4f2a9.camel@mailbox.org>
	 <d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org>
	 <81a70ba6-94b1-4bb3-a0b2-9e8890f90b33@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: i96m4o7hgfmzjg76chu9n7jme4bognqy
X-MBO-RS-ID: f5ad7dea73dd44f5d10

On Fri, 2025-04-11 at 13:05 +0200, Christian K=C3=B6nig wrote:
> =C2=A0Am 11.04.25 um 11:29 schrieb Philipp Stanner:
> =C2=A0
> > [SNIP]
> > =C2=A0
> > It could be, however, that at the same moment
> > nouveau_fence_signal() is
> > removing that entry, holding the appropriate lock.
> >=20
> > So we have a race. Again.
> > =C2=A0
> =C2=A0
> =C2=A0Ah, yes of course. If signaled is called with or without the lock i=
s
> actually undetermined.
> =C2=A0
> =C2=A0
> > =C2=A0
> > You see, fixing things in Nouveau is difficult :)
> > It gets more difficult if you want to clean it up "properly", so it
> > conforms to rules such as those from dma_fence.
> >=20
> > I have now provided two fixes that both work, but you are not
> > satisfied
> > with from the dma_fence-maintainer's perspective. I understand
> > that,
> > but please also understand that it's actually not my primary task
> > to
> > work on Nouveau. I just have to fix this bug to move on with my
> > scheduler work.
> > =C2=A0
> =C2=A0
> =C2=A0Well I'm happy with whatever solution as long as it works, but as
> far as I can see the approach with the callback simply doesn't.
> =C2=A0
> =C2=A0You just can't drop the fence reference for the list from the
> callback.
> =C2=A0
> =C2=A0
> > =C2=A0
> > So if you have another idea, feel free to share it. But I'd like to
> > know how we can go on here.
> > =C2=A0
> =C2=A0
> =C2=A0Well the fence code actually works, doesn't it? The problem is
> rather that setting the error throws a warning because it doesn't
> expect signaled fences on the pending list.
> =C2=A0
> =C2=A0Maybe we should fix that instead.

The fence code works as the author intended, but I would be happy if it
were more explicitly documented.

Regarding the WARN_ON: It occurs in dma_fence_set_error() because there
is an attempt to set an error code on a signaled fence. I don't think
that should be "fixed", it works as intended: You must not set an error
code of a fence that was already signaled.

The reason seems to be that once a fence is signaled, a third party
might evaluate the error code.

But I think this wasn't wat you meant with "fix".

In any case, there must not be signaled fences in nouveau's pending-
list. They must be removed immediately once they signal, and this must
not race.

> =C2=A0
> =C2=A0
> > =C2=A0
> > I'm running out of ideas. What I'm wondering if we couldn't just
> > remove
> > performance hacky fastpath functions such as
> > nouveau_fence_is_signaled() completely. It seems redundant to me.
> > =C2=A0
> =C2=A0
> =C2=A0That would work for me as well.

I'll test this approach. Seems a bit like the nuclear approach, but if
it works we'd at least clean up a lot of this mess.


P.


> =C2=A0
> =C2=A0
> > =C2=A0
> >=20
> > Or we might add locking to it, but IDK what was achieved with RCU
> > here.
> > In any case it's definitely bad that Nouveau has so many redundant
> > and
> > half-redundant mechanisms.
> > =C2=A0
> =C2=A0
> =C2=A0Yeah, agree messing with the locks even more won't help us here.
> =C2=A0
> =C2=A0Regards,
> =C2=A0Christian.
> =C2=A0
> =C2=A0
> > =C2=A0
> >=20
> >=20
> > P.
> >=20
> > =C2=A0
> > > =C2=A0
> > >=20
> > > P.
> > >=20
> > > =C2=A0
> > > > =C2=A0
> > > > Regards,
> > > > Christian.
> > > >=20
> > > > =C2=A0
> > > > > =C2=A0
> > > > > P.
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > =C2=A0
> > > > > > =C2=A0
> > > > > > Regards,
> > > > > > Christian.
> > > > > >=20
> > > > > > =C2=A0
> > > > > > > =C2=A0
> > > > > > > Replace the call to dma_fence_is_signaled() with
> > > > > > > nouveau_fence_base_is_signaled().
> > > > > > >=20
> > > > > > > Cc: <stable@vger.kernel.org> # 4.10+, precise commit not
> > > > > > > to
> > > > > > > be
> > > > > > > determined
> > > > > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > > > > ---
> > > > > > > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > > > > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > > > > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > > > > index 7cc84472cece..33535987d8ed 100644
> > > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > > > > > @@ -274,7 +274,7 @@ nouveau_fence_done(struct
> > > > > > > nouveau_fence
> > > > > > > *fence)
> > > > > > > =C2=A0			nvif_event_block(&fctx->event);
> > > > > > > =C2=A0		spin_unlock_irqrestore(&fctx->lock,
> > > > > > > flags);
> > > > > > > =C2=A0	}
> > > > > > > -	return dma_fence_is_signaled(&fence->base);
> > > > > > > +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > > > > &fence-
> > > > > > > =C2=A0
> > > > > > > > =C2=A0
> > > > > > > > base.flags);
> > > > > > > > =C2=A0
> > > > > > > =C2=A0
> > > > > > > =C2=A0}
> > > > > > > =C2=A0
> > > > > > > =C2=A0static long
> > > > > > > =C2=A0
> > > > > > =C2=A0
> > > > > =C2=A0
> > > > =C2=A0
> > > =C2=A0=C2=A0
> > =C2=A0=C2=A0
> =C2=A0
> =C2=A0


