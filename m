Return-Path: <linux-media+bounces-30177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24198A88432
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99A87561B66
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3082DDD03;
	Mon, 14 Apr 2025 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDLJMdmT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD17C2DE46E;
	Mon, 14 Apr 2025 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637547; cv=none; b=GHgeu/mzeDFsakWiwuJHKDtYd8NukGwp91WrNg8LO6JF5vyMxMgqdk0bXsNbh3CSaCZskwPkh3+wGQzR+I6z+2WL6WcHxS6C8uiazUUpBBc3qugSNXb9EeTjDVohTiyM8jmf+7TYDLBikZIJp6/vLSZr4MqiBAyEwFiXnEYx0QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637547; c=relaxed/simple;
	bh=qeCo5tJHjlnsicgY1mQNPgm/y9a3xr1aR/wt7b9mQVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hclf1nGTlfBD3LmPF4NoZznR8teE/ZJ1TnaeVgSluG5YdYZTNp6nOl14WwxX/b6fh2OWzkfnVE4lt4pSSdJbuIP9/VDaLyeRdK34sO0uDSXBT8PkNJSNcudNoiiAQcAAbrUCwCQb9ddnN12eSLZaygE3HMiEkFJD4iMPfl52zgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDLJMdmT; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d4cb6c401so236110241.1;
        Mon, 14 Apr 2025 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744637544; x=1745242344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLbWjqIEu3IvN7/Kn44+Q64WEI5oH2m78Com7pvnOMU=;
        b=bDLJMdmTbMaTKjCQWQMmC2WyS8e/k59QTrrezhKnr/pBhSZhPKqjhGbtH2Yt1IvdJW
         lhnzsohClXnJids2nbHBu3UHIfSHoDnNLU6LLNMaBXDYapNqJ7fcPf+O9OC2eOVpN2ZY
         QvKQlEYleHpBeWpL8RGc1ZHTgYNvNTMzhwF+X6MUm2AFnLRMseZy56iTMgv3WziPA4g7
         azE6vXa2pr2XpZkFNVRdBCjlY9/vaiqR5FOJ8UiEAr19pOFE/l5QV/cqZPIajJ8M156V
         iSozNae4s444wNB12rvGHCcplghwFMJyQErMgVAnDaH5j1NJYoAh86FkV1gGGFNVzztJ
         N2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744637544; x=1745242344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLbWjqIEu3IvN7/Kn44+Q64WEI5oH2m78Com7pvnOMU=;
        b=KHrBb1Xbh0ks8wT7541mntLbJHnbu+14JV9jEh5B4F347HnpsrZnNQ40PUlN1Gjtov
         eMarExzkdIzYISMDZf0m0TjfP23d91xK8Gqv2NYqD0FwD9GBJ1Mhw/ywllOsTe6l6z74
         TxHCA87ub1MCrv/uYhzlMof9+/hfvoacHFUHsiNW/8n0MOczGsPmF5I8j2yLtKeN6wc4
         mdlXjV27j+YvIV7i7moQFUiCT5MjugvNuApGwe6P/+7Hdcbef3Fe8NxtFBx9XHw+Dsd5
         gyOHI63ZxfU2sRG27beinKWEAE7g8HR/SOvCjija//gWkWvkZNopQjpNUTDicZezTm0i
         n/vg==
X-Forwarded-Encrypted: i=1; AJvYcCV9UFp1LbdgdsXH+SGQKgLaLzaqDZ9tJ9eMXfGf8RHiemDbdeUq3aymGmHE3eQdW8CzIDyTlQUZqCdwWw==@vger.kernel.org, AJvYcCXr0qJ8yDvnrNecY+e26E9gtk6K10A3KzdeYvqKoLkpopSJ+c55OfczD1TLOxnvBrQypaX0j6IB@vger.kernel.org
X-Gm-Message-State: AOJu0YwJBSBlbHihIkVWUKyvLB6DPgR23fWRdpRztbHf/OSywL7PZpmX
	I1c8jSrv/URIRSKgXFupHNWf5bXCFfHi+BT9HIQhb+//kUk0UOBjQv6+2sfMUZPGPTnN4XrcJ6j
	pbX+8CIYEzgEPksBkqxkRU71vPyc=
X-Gm-Gg: ASbGnctKqj28EVlKqS96eJmzWfFLd9kilx67h4YRSmVJ+ELVyz7r9ZKHFTJOTLQZWQw
	Q7TwpUXlV+//8q0eMn/7n76iWAVTYqfn8V/kgk9XLf5LySgVejz2UftZjEui/oEm8PfBD/b3QQY
	rI3pRUUOyCIH3TnPMA6uVEdw==
X-Google-Smtp-Source: AGHT+IF7IOfl7G3RHuUMkW9G3NUZ1c6AeYBhcFA/0srYwHNBMQNbCBke1d4i0DzNdtUmmahoewD0PR3r989Z7nXMJeg=
X-Received: by 2002:a05:6102:1526:b0:4c1:7646:714b with SMTP id
 ada2fe7eead31-4c9e509f68dmr2714727137.8.1744637544260; Mon, 14 Apr 2025
 06:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414132610.677644-1-sashal@kernel.org> <20250414132610.677644-15-sashal@kernel.org>
In-Reply-To: <20250414132610.677644-15-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 09:32:12 -0400
X-Gm-Features: ATxdqUHJqYR9htHgMYIluI0e4GkanXvhCUfhX9nDEKqwCQY5PEKlQtBXD_SK1DY
Message-ID: <CADnq5_MFOtBZ0_UtRbZ2fRGzgdr5+2ZkNwY-Ot_V2qo1wUPaYw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.14 15/34] drm/amdgpu: allow pinning DMA-bufs
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

On Mon, Apr 14, 2025 at 9:26=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
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

This should not go to stable.  It depends on dmem cgroups.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 25 +++++++++++++++------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index 9f627caedc3f6..ee47f239c8c12 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -75,11 +75,25 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmab=
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
> @@ -134,9 +148,6 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma=
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

