Return-Path: <linux-media+bounces-32022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21EAAF677
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 11:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C52A43BC59A
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 09:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A57325EFAA;
	Thu,  8 May 2025 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gJ/JbHnh"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0548525394C;
	Thu,  8 May 2025 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695636; cv=none; b=uwAZ1G7271VU2NH9St8niCsUhaUSMkbmZhI9kkJE33zKI84eXqFmL/tr8kWOidghuLwlq7SEV1f0jy+ZB+M+yG91zSx6usLChxzt6nmuAfjMJRjB23A1BeRu8TJdqOpV71BQe1/1gDV/do8haGwkkYPekdf9G8uo7PEbH/wjRAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695636; c=relaxed/simple;
	bh=Kmv/lHRIoA3PmPchQXSACm772FtK6lyq0jTVglYQ/60=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ua2aY/JtRf0M6+YQdvrRDjI1Q56sqwO7qFQrNIj76fFNkl2lcFI052jk/6tCGyjAassO22HKd/+p3vgh6oIpkm8Fmc0Or3Z6uTjUdLlxc57M/b11wTip4h4fZn59oVpGakTPcXtqpSAKRzaDh/XJKUajg8EvNWi/USH/11+HHXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gJ/JbHnh; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZtRJT2S05z9st4;
	Thu,  8 May 2025 11:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1746695625; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSaQ2U9dW1z6yZyF5dUSbdQvElX9UoQjbIz44faGFp4=;
	b=gJ/JbHnhScbQ4Qk0oLgM+A7P95WHA3lTu44PlG/MGylK4qssRALzG8tg3nn6ymiLnRl3kU
	8fUflr1Bvx/gFqoMy+xZ+b1mB2fMrXNODojdEA0I0UYxMzHOPXsDZm7oYztDLOqVvPeM5A
	8Ih/Gl6V7AkDRmZr+bc0EMhAjCChnTyIrtZ8HfQqUOl0Jngt/dD3jgfa/jZtXuvhty0M1C
	EUc1uIUn1NKfJdxOdCgKsVpuY2g5kDZz3gh/h/57EQ9mUe43waNj6batdScEw/DGyqbkyl
	HRRaIjFJc87NoNpZTyPur6g6oiyccnaRufAN18rVDsI0k0iLVieYMruiTAGePw==
Message-ID: <3b64a3e0659dbfa2c5f819f40f9f0624309d24ed.camel@mailbox.org>
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Date: Thu, 08 May 2025 11:13:39 +0200
In-Reply-To: <9793bfc7-5309-4e19-a0e4-5e298720aa9e@amd.com>
References: <20250424130254.42046-2-phasta@kernel.org>
	 <20250424130254.42046-6-phasta@kernel.org>
	 <9793bfc7-5309-4e19-a0e4-5e298720aa9e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 2f653366805965cb815
X-MBO-RS-META: 9rdhgij9nsbopajeda3zjr5fzy3oh5ip

On Mon, 2025-04-28 at 16:45 +0200, Christian K=C3=B6nig wrote:
> On 4/24/25 15:02, Philipp Stanner wrote:
> > In nouveau_fence_done(), a fence is checked for being signaled by
> > manually evaluating the base fence's bits. This can be done in a
> > canonical manner through dma_fence_is_signaled().
> >=20
> > Replace the bit-check with dma_fence_is_signaled().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
>=20
> I think the bit check was used here as fast path optimization because
> we later call dma_fence_is_signaled() anyway.

That fast path optimization effectively saves one JMP instruction to
the function.

I'm increasingly of the opinion that we shall work towards all DRM
users only ever using infrastructure through officially documented API
functions, without touching internal data structures.

> Feel free to add my acked-by, but honestly what nouveau does here
> looks rather suspicious to me.

:)


P.

>=20
> Regards,
> Christian.
>=20
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index fb9811938c82..d5654e26d5bc 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
> > =C2=A0	struct nouveau_channel *chan;
> > =C2=A0	unsigned long flags;
> > =C2=A0
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > >base.flags))
> > +	if (dma_fence_is_signaled(&fence->base))
> > =C2=A0		return true;
> > =C2=A0
> > =C2=A0	spin_lock_irqsave(&fctx->lock, flags);
>=20


