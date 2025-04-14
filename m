Return-Path: <linux-media+bounces-30174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E15D8A883AA
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7F931888981
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223E6274FFC;
	Mon, 14 Apr 2025 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqCQmNUp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD03274FF1;
	Mon, 14 Apr 2025 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637481; cv=none; b=kk3uCkjfph0GKzrynRzHV/0PfxjIrYnX4ENcT/O/sVvidjEc+sFx5Ae35QHO4MU3oUQeFF0RNrhUwNRmM0ErqXci11BLoSvn3SqXTvHrJ6J2+NHpl/MakCzIXFg0MfYbPenyUzTNpnwkgcQFPnuxICmiq9hbfj1AXKpqW7x8uH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637481; c=relaxed/simple;
	bh=/DKLPkP/kE/SbdXBpzy9/+/hp24aY6BC85SDxh/CeVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cziraSP+8D/TIARdKfUF2+hyCAQmLEcApqPh1Tw03Gl2fj3CesdAflxbJLtBalVkCKnJihUn+XsfWhkVRC7Cx4FX6YA8rKYpPpeLgW+ATdDo62ua2d1UKewv8/VpCsK449KWVG3ipQRsO4pjqV4m3g0h1JWfz9hxBqEUauWHLK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqCQmNUp; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5241abb9655so230326e0c.0;
        Mon, 14 Apr 2025 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744637474; x=1745242274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYko5P0Uj9dxBvgZY4N+74k0M8yvQGkjvUrVryWcOYM=;
        b=kqCQmNUpxTZ/ex7jhtWwqWAJBQ+Mtx3ANNxmVUCZdjhl8jamHCwvHLiI5QHDDJp1Wu
         yFOKZWj8/IxbxMKGTDr33W24FGjz4h+ZO3JwQAVVnyIiw4crgzpYkPcmksuK9qg+zlIu
         YpVGBSc7cj6/1Ki5EYRaB4COMZxgoJbCDibQ/x/2O9dIdCWvhIPA+T/BlTlKcOCynYis
         c7ln9ep8dlaSaMS3lOrCps6D1zvffScchdARrDhvZatcrTcQJIvk1TLtErgsRB6Vcl+8
         u754A9n4Sx/7ZP1+PMuplLj99CLDHL53Fhu+8Llh8Objf/ZuWXnQwHY0tjiMqt3GbQlX
         tNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744637474; x=1745242274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYko5P0Uj9dxBvgZY4N+74k0M8yvQGkjvUrVryWcOYM=;
        b=iw6X0JEA1yUFwlxxT/x2vEw1AFyTtkvxtMxmVNtZN5faVFMQzABZmGT4FycDcVbQFQ
         ZU0k+oDbGui8xzWtJ5BTdHGVE6dqgiN0Ou7I0WxRRmqTv6CYM1psMbwceAPqieTNZfPK
         Y5+01PQhE8u7atSXC7hh/5QObVmEUR+X3zJp5ULY9HRY4yLeGr+sNsLkZfRdqc9VGIPo
         KGbDQFTDpSuFjVnAzBy3i3zuf21e+sgbENejL05xXB5in8Az4AFiwtDY6mkf722m41mk
         GxXjm5Kl79+BJcbFXkcAKbFB2ZboA5zEvll5J32oOA+w0uGVOf7rVvw4J9XdF3+IeLVH
         dtkw==
X-Forwarded-Encrypted: i=1; AJvYcCUKRqg0KmZ7Ot1tT/0ydTpTVIPDXAGlqJtRqTy1eK+/rwj12rlplIwM77HP9p7Una+hKEhRiYRWDOV3qA==@vger.kernel.org, AJvYcCWJB21x1SEMdUqsPbKNib38SoTW7J90RH0x23WaQnIcJs2ENuvSgqHkQyox7DyyGGzx3nMZFaCy@vger.kernel.org
X-Gm-Message-State: AOJu0YyVb+vnf/SQJRL3vEhYeoBl0eKIzKYyTYCi2t6gdggVKXCv7NSW
	KT2Ko7ogwMFLwQcVYWK5F4bNAer30eaSRqD7S8UAbqgmYKSn5NoV3/pS6D+0JY/eUTS7cKli6OG
	d7kzOo0DOsOxLbYuTwUUSmtuAiMw=
X-Gm-Gg: ASbGncsp7L8Yq9e6p23WQDndRH4hqyBKtRD2P/q/+FieYvU20VtxxsVJ0zNB0jRsugh
	0b34dFWbcQ1ylJXz3U4s7Lm2nqlOqbcG7IL2tmMTle3spwXNP7V86/iqrQm6l/JUphVtXEfrN0r
	MrhWk3DQ6HrI1e5qJJJhDmpA==
X-Google-Smtp-Source: AGHT+IHU9FwQkANqVWq6HB4deVY97gLIMf5+FLJTdy75WKChAzk9OeMBEaB4Pi9kHLb3C3nJNsVYA0qgr7byQiE5wXc=
X-Received: by 2002:a05:6122:da1:b0:516:20fe:d5d8 with SMTP id
 71dfb90a1353d-527c359ccf4mr1741010e0c.2.1744637474078; Mon, 14 Apr 2025
 06:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414132848.679855-1-sashal@kernel.org> <20250414132848.679855-11-sashal@kernel.org>
In-Reply-To: <20250414132848.679855-11-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 09:31:01 -0400
X-Gm-Features: ATxdqUHGTxjstZXt6MENE-PXqnTQyUOB_COxTyDCeu_fpv9Pwmta6iiK5pHbslw
Message-ID: <CADnq5_PqqY07uBERuSGC--+=dsffxydrPrvzt7pw6SfmmqbDjw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.12 11/30] drm/amdgpu: allow pinning DMA-bufs
 into VRAM if all importers can do P2P
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Felix Kuehling <felix.kuehling@amd.com>, 
	Pak Nin Lui <pak.lui@amd.com>, Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com, 
	simona@ffwll.ch, sumit.semwal@linaro.org, Yunxiang.Li@amd.com, 
	matthew.auld@intel.com, tvrtko.ursulin@igalia.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 9:29=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> [ Upstream commit f5e7fabd1f5c65b2e077efcdb118cfa67eae7311 ]
>
> Try pinning into VRAM to allow P2P with RDMA NICs without ODP
> support if all attachments can do P2P. If any attachment can't do
> P2P just pin into GTT instead.
>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> Tested-by: Pak Nin Lui <pak.lui@amd.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This should not go to stable.  It depends on dmem groups.


Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 25 +++++++++++++++------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index 8e81a83d37d84..83390143c2e9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -72,11 +72,25 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmab=
uf,
>   */
>  static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
>  {
> -       struct drm_gem_object *obj =3D attach->dmabuf->priv;
> -       struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> +       struct dma_buf *dmabuf =3D attach->dmabuf;
> +       struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(dmabuf->priv);
> +       u32 domains =3D bo->preferred_domains;
>
> -       /* pin buffer into GTT */
> -       return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
> +       dma_resv_assert_held(dmabuf->resv);
> +
> +       /*
> +        * Try pinning into VRAM to allow P2P with RDMA NICs without ODP
> +        * support if all attachments can do P2P. If any attachment can't=
 do
> +        * P2P just pin into GTT instead.
> +        */
> +       list_for_each_entry(attach, &dmabuf->attachments, node)
> +               if (!attach->peer2peer)
> +                       domains &=3D ~AMDGPU_GEM_DOMAIN_VRAM;
> +
> +       if (domains & AMDGPU_GEM_DOMAIN_VRAM)
> +               bo->flags |=3D AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> +
> +       return amdgpu_bo_pin(bo, domains);
>  }
>
>  /**
> @@ -131,9 +145,6 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma=
_buf_attachment *attach,
>                 r =3D ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>                 if (r)
>                         return ERR_PTR(r);
> -
> -       } else if (bo->tbo.resource->mem_type !=3D TTM_PL_TT) {
> -               return ERR_PTR(-EBUSY);
>         }
>
>         switch (bo->tbo.resource->mem_type) {
> --
> 2.39.5
>

