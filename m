Return-Path: <linux-media+bounces-30182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EECEA88475
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 838B616F19B
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABC328DF01;
	Mon, 14 Apr 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2UZPjdY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64717A2EA;
	Mon, 14 Apr 2025 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638505; cv=none; b=QdhYyLOHz5x9pPxaR07QnmA7kEur2rS45HTjLL0pRBwcW21lvSR53oZHjNFFHSyz1+0bCiyeEYSXiQ7dx3SzghiFSogPPj5ebrUARq+e1lQzM9iq+ZlDnP8bvbuZ2WmV+CNStpKu6xN1KPG74v9NTgyY6u65VIDMYZJXZeTkusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638505; c=relaxed/simple;
	bh=AWnJELZDlGf9iOY/hMcXqPZQ4dopiqhIlPLaJbM7KdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TsDhRr7b6dooH1q3AOyhtbRr+wThVT/nnQyETPttcwzbm1W8HEboMMFdpBsHjZE/+ImWVFrSaH+Ak93Tb/hm361LVOq7vVdkefwM48wSugQHTkgO7Qj9dRAvya4hhyUX6Tog7qHJ3HjJh7tZl2Uv5g6YIx572mUuvu/Ko9bx6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2UZPjdY; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-523f5836aaeso215059e0c.3;
        Mon, 14 Apr 2025 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744638503; x=1745243303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gg6c9JaP3fAvNMBtbYiSQTaF78FsgYOrIyM/tQBJqE=;
        b=U2UZPjdYdIkb9hRU0jwvGIdFbWexA3pCAKCGMecU7CrVYllUtaUF6f1qQFSqVe+tLC
         WIlPWIC/RqWoA8WbTcXcQRB/gPqUmLeMnXHeu0MyFA3mjIBfpZOXQjblzpgpFBtWFtbJ
         AnEHmqe7hjnNMOL5nuL+HaCJ0cebCF5yHIeTMTywieWHKZukKa87t/u0/7nMlacGzFRm
         3ZYWoQ6vYQrmLFLBy7F2Xv96rPaD1NPJrM2g8pcvs2nQxYCfTpoR8VFVUttmdvvsj2i9
         i0TcS0O5kaU3fpsR7NMzrWlhr2ieDGqi2v03jlcv6D1d/uoKk31rHm7cVy7X6xsU7Xp+
         jtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638503; x=1745243303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gg6c9JaP3fAvNMBtbYiSQTaF78FsgYOrIyM/tQBJqE=;
        b=uAsgdT0k9MpmIuOZRaBeWILoe3720OpDG5EMBMfzOlWPEeZfjgalR4809qnDVnuAxV
         HLxg6H54FSgx/cygiwIc4DxIGFOTyLSRow0xxFVOTZQVjPpbgdyLlIHR/0FXLRVxpX6t
         SxmTNvyEmLHGh+TixDO7AOCmQaaNmpWcStgdNrI7JH+mz2iWVX8l/WMzvJowGsA8cIlx
         djO3mXyqJHfsUiuurz2kj2PhM5T7CU/EUYTH60heFo+9etjMJjjSREAUqgN4YjaheE1H
         FMTujDUumD0NbhCD9jAfhQN7fEMlSyTc/+IwgDy0GD/RcaPmaxvW4zMkC4KAdqV2J3ce
         Qr8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVSbLck0dKSG6eu/FljSEo8P6d3l7Vnqk9Ubygq7oebYAXWMGPKn5g3f8aF3z93e4vetnMDf0y@vger.kernel.org, AJvYcCXRtoKrZFAt/k3LzDfmLhi1dlI9Z7TxYwV3QROLU3qQMT5RSwr/QKZz2eE0i/Bc+bqL4EtYfrKzJJH+7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdKyZmBxaC5FlBtptNiA1mUSp8zqeGC7wy24GgGaVtvanp3pMq
	o/9GXaQcZMEbdlls1NdNObTGxskeqHkJ8jCm+XHYS1fkVKW1udeo52EenYXBJlIejmvB50+ebxa
	pV48bDL0XtOlvCxoLjMOVg5wRYSI=
X-Gm-Gg: ASbGncv/ZhlgptJChdPW+FncxHzIwgIMCEvHfOnu5pM5AyYNBaL0CjGjH+Zlb+j+VYa
	yObxxCdfLB5ksgRcS+F/TN+UyG/1+yeQ9dsrzhdRNaE/5ci+qA5sayQVDtJFhEhsxzsM4i2h2Yv
	HiKjyk7vog8ovAfa7cpb8Gvg==
X-Google-Smtp-Source: AGHT+IFZNxc/KHoZDwFGFG6I1MTEwTJWg8WdgpWDyKSrkajFA9wV/Z9DP3VoJO9ODfnboEI+ZztudNXfilRisu5rbL8=
X-Received: by 2002:a05:6122:daa:b0:520:5400:ac0f with SMTP id
 71dfb90a1353d-527c35b6a41mr2823390e0c.3.1744638502640; Mon, 14 Apr 2025
 06:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414132729.679254-1-sashal@kernel.org> <20250414132729.679254-15-sashal@kernel.org>
In-Reply-To: <20250414132729.679254-15-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 09:48:10 -0400
X-Gm-Features: ATxdqUGsIVkJwostdQs5byeooJDamJZ9S8mgOlW4xpayrB_LVHSmjP3XNtx4Yaw
Message-ID: <CADnq5_OyrpJL3fnbyiueyddkNZ2B-uRO9pyrRVqBTeY5AnepYw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH AUTOSEL 6.13 15/34] drm/amdgpu: allow
 pinning DMA-bufs into VRAM if all importers can do P2P
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Felix Kuehling <felix.kuehling@amd.com>, 
	Pak Nin Lui <pak.lui@amd.com>, Alex Deucher <alexander.deucher@amd.com>, simona@ffwll.ch, 
	sumit.semwal@linaro.org, Yunxiang.Li@amd.com, tvrtko.ursulin@igalia.com, 
	matthew.auld@intel.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 9:28=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
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
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

