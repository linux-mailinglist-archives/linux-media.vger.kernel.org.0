Return-Path: <linux-media+bounces-30950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A25A9AF13
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D90821B672F7
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFB0187876;
	Thu, 24 Apr 2025 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UKBU989q"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F5E156236;
	Thu, 24 Apr 2025 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501628; cv=none; b=bqN/fQSXBNTbrvsX/s/vxDOkGmTjDUMs+AFYv02ajTHexzvGVer/SnWE6v//hajFxc4Rxe/RywH0ioW+rNPCKT8ftLUp132SAfnLShdIGTz37VqqaQK6EDC/KVEObC7VFW9Pbp+5ldCMV3CSVL2f+hI0OeXd46YhSs7AGfSrFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501628; c=relaxed/simple;
	bh=yiIi9m5Qq5eztVzi9plxeanIGlyzwuqNDdUA4h3ehcw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EheCRPuxGJAaqJ0+YEAxA1vkZ30btm1XkKexLTVkakFBb5gLwNis5oEEl8PLeO+Glwmg6wvej6UZopbveKXrobefDvsgLJclgiTqnrF3C/vlb5uXOZ+/4IGBwm3KY62KbmtfF1H/n3BX1VsRQKgTMwffnpEUeQyFpCUrhjsmU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UKBU989q; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZjxYz24PCz9spL;
	Thu, 24 Apr 2025 15:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745501159; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fKyBAXY4h0YZsHpQmmZLPNawFEm0LQITaKXAZVu5Xr0=;
	b=UKBU989qA9gUKlvGOsr9ynylYvx1uO/wprmjoclW9BEwCSjjnVmmzjDZUhQBCVaT4QnCnC
	ORbl7bU/cf7Sbv3DdAEusQ/Ji5TVyFKQbR+TgqmM/xb1qzLwCn8wLafBuXtO8L/XSkc1g7
	PYX5tJXmg20m7l40mM7lBqlYnujts51Kit0lxgkYjH34Nx7wiEo2E0RFvF5yfQ7rkH2Iym
	r8LTboTaanJ2Gj816s2yLjyn/1AUgiptWr+FtjdfO6LoxkOfUkTvkh+y2VsBXQrYUayJ0a
	NdKC0HKKnrJFuy9+Q4wMRZwklxvHET0IOGPRE0lxHXItxnVcKVwL6iB3MpwUlQ==
Message-ID: <a27a0a01fa2bf5f328ee762b7dd84dffd18fa664.camel@mailbox.org>
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 24 Apr 2025 15:25:55 +0200
In-Reply-To: <609c8b1a-d7a9-4667-bd6c-1455c639fcd0@kernel.org>
References: <20250424130254.42046-2-phasta@kernel.org>
	 <20250424130254.42046-6-phasta@kernel.org>
	 <609c8b1a-d7a9-4667-bd6c-1455c639fcd0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 4sjhmd8518k1j7h9y85ob19dku96umzr
X-MBO-RS-ID: 26ac357924729e237f5

On Thu, 2025-04-24 at 15:24 +0200, Danilo Krummrich wrote:
> On 4/24/25 3:02 PM, Philipp Stanner wrote:
> > In nouveau_fence_done(), a fence is checked for being signaled by
> > manually evaluating the base fence's bits. This can be done in a
> > canonical manner through dma_fence_is_signaled().
> >=20
> > Replace the bit-check with dma_fence_is_signaled().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index fb9811938c82..d5654e26d5bc 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
> > =C2=A0=C2=A0	struct nouveau_channel *chan;
> > =C2=A0=C2=A0	unsigned long flags;
> > =C2=A0=20
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > >base.flags))
> > +	if (dma_fence_is_signaled(&fence->base))
>=20
> This is only correct with commit bbe5679f30d7 ("drm/nouveau: Fix
> WARN_ON in
> nouveau_fence_context_kill()") from drm-misc-fixes, correct?

Yup. Otherwise, this series can't be merged anyways, because patch 1
depends on it.

The cover letter says so: "This series is based on this partially
merged series: [1]"

P.

