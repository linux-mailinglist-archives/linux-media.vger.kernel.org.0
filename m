Return-Path: <linux-media+bounces-31711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E3BAA9540
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 16:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2417316D358
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 14:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CB019885F;
	Mon,  5 May 2025 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5BEKhSV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0CD8C1F;
	Mon,  5 May 2025 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454546; cv=none; b=t8L/Yvm4VM641+EqrJlDV20nQ8c/BVwI7sdUWvUUBW5AUCksTkGwD3Z238clR8s1dGkk64hj8X5CKh2bPET3gnYhlu7uvdy92Rw8CzNZwYaNlU2Qfs3ooOw3j3OwWbDV1n21TGyHEhcS3f6VKWEQp0en7cedhPUVYk5GGjYD7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454546; c=relaxed/simple;
	bh=LI6RW5bmSOFSpxmPsHXcfPxSuirVMxkS1mzCy8G8RWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IgfmFv63PfxMtFFp/UAYK4fK44+XgtOS+/mgNG4qAIvWF5+TlzBM7+94cb1YxdiCZN5WuIQniMvTVpuCYRZhCpqHcRJ4OjxLDk7KYAzUU3+qRhP+WMZ98z3lW1A4ak2aWv9Az6q23/wVCdixcRwYDFSfunQQZC7V/FQ8+bTu5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5BEKhSV; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85ea482e3adso177099639f.0;
        Mon, 05 May 2025 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746454543; x=1747059343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmFv/eGqP8BUD+cO2vw/j1sQpK2CcTzLRBctQj23AcA=;
        b=H5BEKhSV+tSPZo+xYk9wTEwp8HCFntfDrac90v01nI/zCllL6KwyP99fVWbt77rbmg
         sbyJKCUf4YAAplwuyCMO/+f0xPZhU82BnKR44PE2tPuAkZYmYfyUybsdYnETj/jadXtc
         bxM58mfzKjMWDIolLGJkHMBoRnfnyTBX3o5ZWG/femYibCjVnWFj732EXnUJTyipLAxs
         j1+cMTPHm1dM2gJcvhrVTVPkLd13r8brIXNdr1xvrFVDkSiPYB8XcTzkK4HQ8cmQUIHc
         7TzfTcgF9tPuHpCtUWxLlxzwuYwxYalNxj84isBblIXJrELHZt8ah8EHE5lWcAA07lvE
         SbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454543; x=1747059343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmFv/eGqP8BUD+cO2vw/j1sQpK2CcTzLRBctQj23AcA=;
        b=Ut65wPKx8HzQaVpWKLTy6h8DQL7uVi1vUgaXTJoMlymi0xE9Pcz8c/9ouBEBLTAIac
         j+uv1G6+kGbaWBHJ39FS6GC8K+FZ+7aL1fA74UJ8BoWV47EKUH3q2dHHPMIm/tiglX9U
         5tY20lHMjIPPcR3NBh5lFMR0cIs7gzFMIHFri/t6iwUOse5xAmBNVi6WMjgo63/Q1UEZ
         sUeu+wFMsw7tpJT9ESaUlKzTGTlhmVKTssRM7DDDw7Lvrnc+P+JiudbddoXwAQUuKFLT
         ekjV54qlrft18AvLMkb9KjKC43DIaANlAbFQEwtK4KHe69732t7fdIP98AWC1sBJ61c4
         XazQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFutD2laDeOwLWeD7EcwPL1n/NEPP9JMKBy9aFiV5DM3dR4g8WMpPRwUdvUnzAd6lLy+tYmQcv9J+1E+2c@vger.kernel.org, AJvYcCUxSei7oV6E4tVpdXj9LyrScFu4FcYz+AJxjwtuxW0HfrvxJmrX7M7hEXttLNVv1V6vdBKXd872M6tWLs0=@vger.kernel.org, AJvYcCWFiQdoB5+pPZFrD+St6aZPn9senUmExt3bFpLhXVSr2Eunw6P+4i76knt7SRsU1TfjRfJEJU1EsmLVSMCw@vger.kernel.org
X-Gm-Message-State: AOJu0YxRv1CcaoPrss1CvKIMYtH3JTIDwVoUxqndT79nfeIBvYVkPgdh
	jwFZ8om/GxlqbjuHsrH930x34+zpw9mbVkMO+xy1VUx2e7BqtGV5gC129CxuNJdTiz71fLSTBIH
	w0AgDicyLXaKEdJr90QeY8fibL0E=
X-Gm-Gg: ASbGncuKmrFOfhmWKPEuzzrr1iew6xDU/V1UiSDB6MyiXTCHwG40UDykJAKGo4a2huX
	oSYLwFhTAz2+ekx9ZAv94TzFaYH46oc43ZAXFcyzRfGvvJacMHHUgrmPG3nvU+0exnM3tfj7p11
	BqmNsgE1RkJeR7nGZ1ITmqwIwO3QDn3NEkKiHUlGXJY3Kt8EURtK/y
X-Google-Smtp-Source: AGHT+IFqHcvzGD+XM74JPejK+dbntF5020jCymJ7lyVu5UGKNSp+Ot20Fw3HKkPY3VchZDwZUCgEVCgtr4nWezOVrRA=
X-Received: by 2002:a05:6e02:156c:b0:3d9:43fe:8e34 with SMTP id
 e9e14a558f8ab-3d97ad891bamr126880165ab.1.1746454543182; Mon, 05 May 2025
 07:15:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502165831.44850-1-robdclark@gmail.com> <20250502165831.44850-22-robdclark@gmail.com>
 <3a4297fd-4554-4727-ab05-feaddaf63ea5@amd.com>
In-Reply-To: <3a4297fd-4554-4727-ab05-feaddaf63ea5@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 5 May 2025 07:15:31 -0700
X-Gm-Features: ATxdqUEENrcJUZ0hEKbuQkuJkiW3wko3qimL5agF-KRqx4_9Igop8VKUWG8b1zM
Message-ID: <CAF6AEGtmjLM-tK9Y=gT5XupW62X_eY2fiBJCYUnKqO9A9C4xFg@mail.gmail.com>
Subject: Re: [PATCH v4 21/33] drm/msm: Add _NO_SHARE flag
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal <sumit.semwal@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 12:54=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/2/25 18:56, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Buffers that are not shared between contexts can share a single resv
> > object.  This way drm_gpuvm will not track them as external objects, an=
d
> > submit-time validating overhead will be O(1) for all N non-shared BOs,
> > instead of O(n).
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.h       |  1 +
> >  drivers/gpu/drm/msm/msm_gem.c       | 23 +++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
> >  include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
> >  4 files changed, 53 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_dr=
v.h
> > index b77fd2c531c3..b0add236cbb3 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -246,6 +246,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, =
struct iosys_map *map);
> >  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map=
 *map);
> >  struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device=
 *dev,
> >               struct dma_buf_attachment *attach, struct sg_table *sg);
> > +struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int f=
lags);
> >  int msm_gem_prime_pin(struct drm_gem_object *obj);
> >  void msm_gem_prime_unpin(struct drm_gem_object *obj);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index 3708d4579203..d0f44c981351 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -532,6 +532,9 @@ static int get_and_pin_iova_range_locked(struct drm=
_gem_object *obj,
> >
> >       msm_gem_assert_locked(obj);
> >
> > +     if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
> > +             return -EINVAL;
> > +
> >       vma =3D get_vma_locked(obj, vm, range_start, range_end);
> >       if (IS_ERR(vma))
> >               return PTR_ERR(vma);
> > @@ -1060,6 +1063,16 @@ static void msm_gem_free_object(struct drm_gem_o=
bject *obj)
> >               put_pages(obj);
> >       }
> >
> > +     if (msm_obj->flags & MSM_BO_NO_SHARE) {
> > +             struct drm_gem_object *r_obj =3D
> > +                     container_of(obj->resv, struct drm_gem_object, _r=
esv);
> > +
> > +             BUG_ON(obj->resv =3D=3D &obj->_resv);
> > +
> > +             /* Drop reference we hold to shared resv obj: */
> > +             drm_gem_object_put(r_obj);
> > +     }
> > +
> >       drm_gem_object_release(obj);
> >
> >       kfree(msm_obj->metadata);
> > @@ -1092,6 +1105,15 @@ int msm_gem_new_handle(struct drm_device *dev, s=
truct drm_file *file,
> >       if (name)
> >               msm_gem_object_set_name(obj, "%s", name);
> >
> > +     if (flags & MSM_BO_NO_SHARE) {
> > +             struct msm_context *ctx =3D file->driver_priv;
> > +             struct drm_gem_object *r_obj =3D drm_gpuvm_resv_obj(ctx->=
vm);
> > +
> > +             drm_gem_object_get(r_obj);
> > +
> > +             obj->resv =3D r_obj->resv;
> > +     }
> > +
> >       ret =3D drm_gem_handle_create(file, obj, handle);
> >
> >       /* drop reference from allocate - handle holds it now */
> > @@ -1124,6 +1146,7 @@ static const struct drm_gem_object_funcs msm_gem_=
object_funcs =3D {
> >       .free =3D msm_gem_free_object,
> >       .open =3D msm_gem_open,
> >       .close =3D msm_gem_close,
> > +     .export =3D msm_gem_prime_export,
> >       .pin =3D msm_gem_prime_pin,
> >       .unpin =3D msm_gem_prime_unpin,
> >       .get_sg_table =3D msm_gem_prime_get_sg_table,
> > diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/=
msm_gem_prime.c
> > index ee267490c935..1a6d8099196a 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> > @@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct dr=
m_gem_object *obj)
> >       struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> >       int npages =3D obj->size >> PAGE_SHIFT;
> >
> > +     if (msm_obj->flags & MSM_BO_NO_SHARE)
> > +             return ERR_PTR(-EINVAL);
> > +
> >       if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
> >               return ERR_PTR(-ENOMEM);
> >
> > @@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table=
(struct drm_device *dev,
> >       return msm_gem_import(dev, attach->dmabuf, sg);
> >  }
> >
> > +
> > +struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int f=
lags)
> > +{
> > +     if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
> > +             return ERR_PTR(-EPERM);
> > +
> > +     return drm_gem_prime_export(obj, flags);
> > +}
> > +
> >  int msm_gem_prime_pin(struct drm_gem_object *obj)
> >  {
> >       struct page **pages;
> > @@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
> >       if (obj->import_attach)
> >               return 0;
> >
> > +     if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
> > +             return -EINVAL;
> > +
> >       pages =3D msm_gem_pin_pages_locked(obj);
> >       if (IS_ERR(pages))
> >               ret =3D PTR_ERR(pages);
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index b974f5a24dbc..1bccc347945c 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -140,6 +140,19 @@ struct drm_msm_param {
> >
> >  #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
> >  #define MSM_BO_GPU_READONLY  0x00000002
> > +/* Private buffers do not need to be explicitly listed in the SUBMIT
> > + * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
> > + * buffers may NOT be imported/exported or used for scanout (or any
> > + * other situation where buffers can be indefinitely pinned, but
> > + * cases other than scanout are all kernel owned BOs which are not
> > + * visible to userspace).
>
> Why is pinning for scanout a problem with those?
>
> Maybe I missed something but for other drivers that doesn't seem to be a =
problem.

I guess _technically_ it could be ok because we track pin-count
separately from dma_resv.  But the motivation for that statement was
simply that _NO_SHARE buffers share a resv obj with the VM, so they
should not be used in a different VM (in this case, the display, which
has it's own VM).

BR,
-R

> Regards,
> Christian.
>
>
> > + *
> > + * In exchange for those constraints, all private BOs associated with
> > + * a single context (drm_file) share a single dma_resv, and if there
> > + * has been no eviction since the last submit, there are no per-BO
> > + * bookeeping to do, significantly cutting the SUBMIT overhead.
> > + */
> > +#define MSM_BO_NO_SHARE      0x00000004
> >  #define MSM_BO_CACHE_MASK    0x000f0000
> >  /* cache modes */
> >  #define MSM_BO_CACHED        0x00010000
> > @@ -149,6 +162,7 @@ struct drm_msm_param {
> >
> >  #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
> >                                MSM_BO_GPU_READONLY | \
> > +                              MSM_BO_NO_SHARE | \
> >                                MSM_BO_CACHE_MASK)
> >
> >  struct drm_msm_gem_new {
>

