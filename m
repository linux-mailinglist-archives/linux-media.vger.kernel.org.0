Return-Path: <linux-media+bounces-33116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A980CAC0B84
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C8B3B07C3
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 12:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FB028A41C;
	Thu, 22 May 2025 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X/GzKpRL"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213C11527B1;
	Thu, 22 May 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916413; cv=none; b=LwTT73tfKzHd85dYi0iSsFuGAKxyHfVeBmeUF/CGQkZuZ6axYiypnxZcFFEAkDnFDn/chfTOkjI0FJgCGdGjVw3LCWgURJG0bNy+V1mrJyxNSLtZcOpmCbS1UpXnRkmyVdatojQP17RdVEZ6QpDaGviTeVBUTgtMeWtJ8B8I4y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916413; c=relaxed/simple;
	bh=YI91srHAMj3/Oy5dKrg+3P4dqnfkB1tY5iSNetIzTRQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VwhtZBDdh4ZIdTirRZAtnfzF1ZntWnM+IWmigG7Zgw8vg/ELQFEpixSomUVNp5FiOpAI6ip18ZpOTQBpdNW+4iU/k3Ab1RBvgEbSIYRtRu1j2uL048Mgt4+veV8JEi2oC3oBDvuyepHzIh8Xx1a1++Rb0ngLlkW7kqEgBuwGu8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X/GzKpRL; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b36n42b4Fz9smv;
	Thu, 22 May 2025 14:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747916408; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6les8TOi5wRq0T8kDR8xQDFeOUCbVRDYJE8WXeCcMbk=;
	b=X/GzKpRLGoUU1TIQgiCFE33WMIXEgo2bOzU2gD+5YBWIA+Xch5he0PNQ5L4B9c50ClsLa0
	AjpL/vNQ5PL/0zlPieZL2EAYcfWWP/bIBv6d89Kf0PWtotOHOLZ7ZA8biPCX8dC56KGSWG
	Y8/2y9AWnSS5zLtZUQOBfdXZA7jwqGKTIEP+HeIOzkSQ0921vADAkAE3w233nXJohb09hu
	uJpNHTUx13lSzntM5QICqUvDqMwqDt5Ci8pzqtl+FIhYpTiocEwbz+lkwNoKYktLfXSIB/
	o8JOG2n2ugalDzKQawb+80VuNMOtXViSR9pY7rlEHNP0KKrhN7lq2T06KRtSWg==
Message-ID: <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 22 May 2025 14:20:03 +0200
In-Reply-To: <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
References: <20250522112540.161411-2-phasta@kernel.org>
	 <20250522112540.161411-3-phasta@kernel.org>
	 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 081f752363f695d129f
X-MBO-RS-META: zq69kf63muzfjptq7ehgdi67s8374jom

On Thu, 2025-05-22 at 14:06 +0200, Christian K=C3=B6nig wrote:
> On 5/22/25 13:25, Philipp Stanner wrote:
> > dma_fence_is_signaled_locked(), which is used in
> > nouveau_fence_context_kill(), can signal fences below the surface
> > through a callback.
> >=20
> > There is neither need for nor use in doing that when killing a
> > fence
> > context.
> >=20
> > Replace dma_fence_is_signaled_locked() with
> > __dma_fence_is_signaled(), a
> > function which only checks, never signals.
>=20
> That is not a good approach.
>=20
> Having the __dma_fence_is_signaled() means that other would be
> allowed to call it as well.
>=20
> But nouveau can do that here only because it knows that the fence was
> issued by nouveau.
>=20
> What nouveau can to is to test the signaled flag directly, but that's
> what you try to avoid as well.

There's many parties who check the bit already.

And if Nouveau is allowed to do that, one can just as well provide a
wrapper for it.

That has the advantage of centralizing the responsibility and
documenting it.

P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index d5654e26d5bc..993b3dcb5db0 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
> > nouveau_fence_chan *fctx, int error)
> > =C2=A0
> > =C2=A0	spin_lock_irqsave(&fctx->lock, flags);
> > =C2=A0	list_for_each_entry_safe(fence, tmp, &fctx->pending, head)
> > {
> > -		if (error && !dma_fence_is_signaled_locked(&fence-
> > >base))
> > +		if (error && !__dma_fence_is_signaled(&fence-
> > >base))
> > =C2=A0			dma_fence_set_error(&fence->base, error);
> > =C2=A0
> > =C2=A0		if (nouveau_fence_signal(fence))
>=20


