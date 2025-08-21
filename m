Return-Path: <linux-media+bounces-40584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E1B2FA02
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED0251C27D99
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C859322DA4;
	Thu, 21 Aug 2025 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk1yosFL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2507F2D3746;
	Thu, 21 Aug 2025 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782026; cv=none; b=Vjg8PNCu0lncDATffA8Qylsl27E2Nkti7D5kc7D4it3j6J7GwKfu85L1+ISetgNe9IGUd4+JmDdMKmsNt8glOzhfTkpXnWx2oxpHunHDjhkh8iJBggmLbsbbucefhM3hWqIzi7uRijWXuOYQeQZXQ73eMQaJ+fQZlw4ILSEPNQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782026; c=relaxed/simple;
	bh=h1wFWUgS/Vt5RA6AHrG9mpa09KiJE2AIbpPehlEGnkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5RHjZ9y7nIY9rWEkI1yjl/3c1KrSzZTPy8330Hja4YbKp8qJa4mT8aFcX2QS7rEWUcJkLQmywxVZQqg9XC01FWlfINk9gDJZYdfnPReB3B3y74VrSDtKhZ8oqxEnlEE0d7SrNkeVwEizHyqeroEaNQIJS+QHulexNjYsZ1XqyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk1yosFL; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-324e2c12f43so71488a91.3;
        Thu, 21 Aug 2025 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755782024; x=1756386824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0ntcUfwQYZElkssDT+Zc1ph10VSWKrgVIAaGKrNC8c=;
        b=Gk1yosFL/HQl2xAEC/MWri88Ods6XEnJbnlz2tNC1iNKMj2TWJAZ0rDzRZ6kSVajpU
         FdKGe6CfDOKaVGvEMQjzvgw1JVhmDSlY5udrYg3hWcg5MB264zOQiGz8b6ctdxWnEsVU
         o8abDXcq2f7HxOazgxlMULf6ZA8nPEApqMSnk6S//2foprOibciBS27w6EZKDMqFEs3+
         dxHsb2Yg8yzj8Y9DDgIJV0FIbrLgfzAu5uXHQQOnE+3fp+kX2SSAoX90IFLD/knkqIQ1
         F6BeNsq+oRlnSnP9Y++0ohj0/v7EULcL8wTr97AoPje4AF2wGowhDcDRIRqRCFiFqa35
         iFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755782024; x=1756386824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0ntcUfwQYZElkssDT+Zc1ph10VSWKrgVIAaGKrNC8c=;
        b=fBuc/JWwDQq3nq9kpAP/wzWzzxnSD15bXYND+B+7d+WCJRgltV97N82tj6s4Od9n2c
         oZwNrVGs8lvHLqvXl8ZITzjHiXCWHe94iSTsNpAF1U9fQf1jbecdYR3LwN2+ot+PRT8d
         VPxY7U1ggUgyhJjfdXEcrWOJx5vW/EpBVoHZwUb/5MU4yI6pzAssvmPnkQmRBiEWKbMS
         BQAtOsJcMhjGIRVWoAGheSNTnI/z5mZICbsx7MpyuqQau//KWkiKLQQE41uD+n4etZlP
         fNVOV59CQj4CjM6scCGcsqMjinmBou1YXX6Toj/39ljLj0axllSaC3eEJtdpbIRVVi2y
         jOHw==
X-Forwarded-Encrypted: i=1; AJvYcCWA4YDchg+uAFH/j/CzWuq4KEmUYjf04sbLqQBBccUCc8W7Fjs7+39/JoAnbZkIrQWwbI1Z3Gw51MiV7CU=@vger.kernel.org, AJvYcCXif1MEPDVg+ymiG3DOy2BO3liU8jmT6+ussCBj8Zl1ize73Wdrvc/jALIS129ODnrCUSEqpc96BJ6Xgj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDT5H2hakKdN2xNY4aHtf10D+N6/f/W1LqMj5z1uEUFNJuWwex
	Fgq5x3ImxLVySApcHNUGw2sAL9OBFrLC2AFgOjGjz4Ub5K09GviaOr1ozFr3ZjLQyVswJL28MRl
	ys7Kh/qgQgwDERZUSfdTzZ/4i4O3MqS0IFw==
X-Gm-Gg: ASbGncvK4MLt272HgYb24JErLgOD7N54W51wTKrjNEefxAE5ZVjpkmDobEHs7T4N/6/
	WqcJl9LuFVFuT1m7IPLBFoB2c87A3rKTV9UjCHZ8rz5kCD4wFzGBkOiWoNU403fWtr8Nz0R2VL/
	NIlT/bqhq5tUWtUc3uN281cR2VIk5ENtlqux/ntRb4tiF9EaSyCUx8JyimWe5T9RTZyOyWH7BTr
	dYLSNg=
X-Google-Smtp-Source: AGHT+IGoPLySy4CQlyi2yceJUhRDa389vWBpVwrjGS5LP44+dqCLoo64cKkkz+zBdVLQR8Keth1GycSBjmtAvY8xvC4=
X-Received: by 2002:a17:90b:4b87:b0:31e:7f76:c123 with SMTP id
 98e67ed59e1d1-324ed1c269cmr1753231a91.4.1755782024179; Thu, 21 Aug 2025
 06:13:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821064031.39090-1-tzimmermann@suse.de> <b92c072b-a302-47c8-b2c2-f4b2e3954165@amd.com>
In-Reply-To: <b92c072b-a302-47c8-b2c2-f4b2e3954165@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Aug 2025 09:13:32 -0400
X-Gm-Features: Ac12FXx0qAFooaBAgLtQfQOhqXHxanKSBn5_Pvj3vkfwVoVyKwY0WZ6xYzS_0G4
Message-ID: <CADnq5_PxpsXkzzpa8KJoZL-pBaM2ViVBOaXuYkYyd_xHBNLt9A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v3] drm/amdgpu: Pin buffers while
 vmap'ing exported dma-buf objects
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, sumit.semwal@linaro.org, oushixiong@kylinos.cn, 
	alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 4:52=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 21.08.25 08:40, Thomas Zimmermann wrote:
> > Current dma-buf vmap semantics require that the mapped buffer remains
> > in place until the corresponding vunmap has completed.
> >
> > For GEM-SHMEM, this used to be guaranteed by a pin operation while crea=
ting
> > an S/G table in import. GEM-SHMEN can now import dma-buf objects withou=
t
> > creating the S/G table, so the pin is missing. Leads to page-fault erro=
rs,
> > such as the one shown below.
> >
> > [  102.101726] BUG: unable to handle page fault for address: ffffc90127=
000000
> > [...]
> > [  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> > [...]
> > [  102.243250] Call Trace:
> > [  102.245695]  <TASK>
> > [  102.2477V95]  ? validate_chain+0x24e/0x5e0
> > [  102.251805]  ? __lock_acquire+0x568/0xae0
> > [  102.255807]  udl_render_hline+0x165/0x341 [udl]
> > [  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
> > [  102.265379]  ? local_clock_noinstr+0xb/0x100
> > [  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
> > [  102.274246]  ? mark_held_locks+0x40/0x70
> > [  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl=
]
> > [  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x1=
0 [udl]
> > [  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> > [  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
> > [  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
> > [  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
> > [  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0=
x200
> > [  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
> > [  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
> > [  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
> > [  102.333622]  commit_tail+0x204/0x330
> > [...]
> > [  102.529946] ---[ end trace 0000000000000000 ]---
> > [  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> >
> > In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
> > dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidating =
the
> > mapping.
> >
> > Provide a custom dma-buf vmap method in amdgpu that pins the object bef=
ore
> > mapping it's buffer's pages into kernel address space. Do the opposite =
in
> > vunmap.
> >
> > Note that dma-buf vmap differs from GEM vmap in how it handles relocati=
on.
> > While dma-buf vmap keeps the buffer in place, GEM vmap requires the cal=
ler
> > to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf cod=
e
> > instead of its GEM code.
> >
> > A discussion of various approaches to solving the problem is available
> > at [1].
> >
> > v3:
> > - try (GTT | VRAM); drop CPU domain (Christian)
> > v2:
> > - only use mapable domains (Christian)
> > - try pinning to domains in preferred order
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping i=
ts sg_table")
> > Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0=
511c702@suse.de/
> > Cc: Shixiong Ou <oushixiong@kylinos.cn>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19b1=
53e21@suse.de/ # [1]
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thomas did you want to take this through drm-misc or do you want me to
pick this up?

Thanks,

Alex

>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 34 +++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_dma_buf.c
> > index 5743ebb2f1b7..ce27cb5bb05e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > @@ -285,6 +285,36 @@ static int amdgpu_dma_buf_begin_cpu_access(struct =
dma_buf *dma_buf,
> >       return ret;
> >  }
> >
> > +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_m=
ap *map)
> > +{
> > +     struct drm_gem_object *obj =3D dma_buf->priv;
> > +     struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> > +     int ret;
> > +
> > +     /*
> > +      * Pin to keep buffer in place while it's vmap'ed. The actual
> > +      * domain is not that important as long as it's mapable. Using
> > +      * GTT and VRAM should be compatible with most use cases.
> > +      */
> > +     ret =3D amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT | AMDGPU_GEM_DOMA=
IN_VRAM);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D drm_gem_dmabuf_vmap(dma_buf, map);
> > +     if (ret)
> > +             amdgpu_bo_unpin(bo);
> > +
> > +     return ret;
> > +}
> > +
> > +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosy=
s_map *map)
> > +{
> > +     struct drm_gem_object *obj =3D dma_buf->priv;
> > +     struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> > +
> > +     drm_gem_dmabuf_vunmap(dma_buf, map);
> > +     amdgpu_bo_unpin(bo);
> > +}
> > +
> >  const struct dma_buf_ops amdgpu_dmabuf_ops =3D {
> >       .attach =3D amdgpu_dma_buf_attach,
> >       .pin =3D amdgpu_dma_buf_pin,
> > @@ -294,8 +324,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops =3D {
> >       .release =3D drm_gem_dmabuf_release,
> >       .begin_cpu_access =3D amdgpu_dma_buf_begin_cpu_access,
> >       .mmap =3D drm_gem_dmabuf_mmap,
> > -     .vmap =3D drm_gem_dmabuf_vmap,
> > -     .vunmap =3D drm_gem_dmabuf_vunmap,
> > +     .vmap =3D amdgpu_dma_buf_vmap,
> > +     .vunmap =3D amdgpu_dma_buf_vunmap,
> >  };
> >
> >  /**
>
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

