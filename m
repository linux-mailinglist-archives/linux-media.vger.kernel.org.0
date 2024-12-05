Return-Path: <linux-media+bounces-22699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2659E52D4
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 11:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41B5E16AC1F
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1FC1E3796;
	Thu,  5 Dec 2024 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qcd2IMES"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704DA1D8E07
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733395453; cv=none; b=bpqLOb6BeEaZKo2W3329dPXA26Hsso139kqlXp8pWTd5vVZ3D2TA/tRYCEDrk5KwutoX0Po4t/pCxUYVUBVAS2MMobPMu8FG47F+t+gqCXXi24hMOF4deUmhJKY/zqJ0/tm7A0K+awlymkvEosOGFyyYgrGxuZXqgWD8PYAfIFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733395453; c=relaxed/simple;
	bh=2qxJm8zjnH74rgq2TyVtHkxECZLf+nrHuzY2kWw8Rws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrP9xNLkA1v7UQt/mi2U/Vl9rSQcRScHQwRUW+4kmLXt8qfhne58NQaZY/+X3pLgtlysEFpLIpF318/oJJnvlhuvDuOBd+V/9/cJSZ0AmqBwu/gQb/tNfwsHj2KQPjpswDBK91p5OagUeyy/32YcUNe040XornlHWfOBvUSn2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qcd2IMES; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-29e65257182so467763fac.2
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 02:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733395450; x=1734000250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zrpm3XeH+mOs42vBgawvUmt6HS7pncA0m+kxGWfcqJw=;
        b=Qcd2IMESni+2Ty027zQWS98r9ZcemiySsyLq6Vy80I8gEvl6Cl8CUtOx1rRbFr0l9Q
         7jXaAFEMBe09zQJLiDpHht1GApnveRk+rOtrA5s8jYhyN/fIIJd1XydscZnmks30GBYc
         XKC+eOckdRWeq2Jl3qCGhwBoVIMp74+kv8sq3M2Hd1VqCSY0Ut45/8VweTv9Mx2zFV6P
         nsuYMNfYnZUoO3EoUrFYt2c48FQTyCtAOUPikaVYdzgm8mG/GMB5CLdWZBER8jdoGJKp
         8/EOBCHiEwx8LyC308GH+6Pyl4ZSpXZG8SRRPtr2CRyMB90r9NUODCfaDia7Xp8pXzHX
         lk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395450; x=1734000250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zrpm3XeH+mOs42vBgawvUmt6HS7pncA0m+kxGWfcqJw=;
        b=amZGRpjDUFIh47CPLphEBEKMHX658eJky+R4B1YzH3r6l9qXoTvVtTbdbJzs1k3sKv
         nelPUBcHmTztjYd4KnppfbMpaqnJf+OlfW0uAhJsE4wVKJZwHjsg93fmKhOO8tKcjUTC
         fT/SZbiiZeW/PnDkym+hXSZL8/5haUagAasbsYPQGrhUABd6kPj4NaoOoxVcABZoETLV
         zTeApf0z6YgkpB+91y1KVYbjI62lFZlLKYJmBZFZuuXEiSsjndH7jHTwMdoqqLxCcpzI
         BFvd93++S7AxlqzMMhT2b+fk2bjEWb1ooYQJtsVynfE4OW0gRpU8jU9YV45nMAPt0Htj
         u5sA==
X-Forwarded-Encrypted: i=1; AJvYcCVtbqWPZAdk/dCjCpHCIC0KK5Xl3q5UIei4VIvw1srVYwIohQSm1v+l4J6DtPzRKdjqj+D6PqTqROd92Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl5ONh5OvhTYhds803HIBkmtgYex6qgZl0dGfhErPgGpcwF+gS
	hCFhmFlsbZg+0NXbpZb20bPh1HshcB5fiz3HOniBC6oIU8tl0JLPpJ8uqxLQ02wJc73mfDVZKiA
	5nWJsVL+hEPcJs61cJ0iHC0jnl+rTKOYo0dJ5+w==
X-Gm-Gg: ASbGnctb/6TlxIAoGb4DDc6lnUQq6J7qs3l+F4yPc9LnQE1fwcjz0lCVW3RygtIKQg2
	zaK6w6uC5OAxR0TZDSB9Rc/XosTQ01W8=
X-Google-Smtp-Source: AGHT+IEkbgy0HVg9g3FanBbnyR0UrX+I+6OCetArRo5yw3tk0iAyUe69De6WL0TtHdjziJhstql+Sq+aKSTTeC75xNo=
X-Received: by 2002:a05:6870:e310:b0:29e:2bbd:51ba with SMTP id
 586e51a60fabf-29e88560cb3mr10541855fac.9.1733395450323; Thu, 05 Dec 2024
 02:44:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128150927.1377981-1-jens.wiklander@linaro.org>
 <20241128150927.1377981-2-jens.wiklander@linaro.org> <CAFA6WYPVEzNLRL3sFUBgGGF_9m7tqGmg+h4TY5LDCAN5=qgBTg@mail.gmail.com>
In-Reply-To: <CAFA6WYPVEzNLRL3sFUBgGGF_9m7tqGmg+h4TY5LDCAN5=qgBTg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 5 Dec 2024 11:43:57 +0100
Message-ID: <CAHUa44EL-8OH4a9ZvW5v7s3eW14_eYaDJV1HR17exWH5roeUFA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] tee: add restricted memory allocation
To: Sumit Garg <sumit.garg@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sumit,

On Tue, Dec 3, 2024 at 8:58=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> w=
rote:
>
> Hi Jens,
>
> On Thu, 28 Nov 2024 at 20:39, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
> > Add restricted memory allocation to the TEE subsystem. Restricted memor=
y
> > is not be accessible by kernel during normal circumstances. A new ioctl
>
> s/not be accessible/not accessible/
>
> How about if we reword it as follows?
>
>     Restricted memory refers to memory buffers behind a hardware enforced
>     firewall. It is not accessible to the kernel during normal circumstan=
ces but
>     rather only accessible to certain hardware IPs or CPUs executing in h=
igher
>     privileged mode than the kernel itself. This interface allows to
> allocate and
>     manage such restricted memory buffers via interaction with a TEE
>     implementation.

Sure, thanks.

>
> > TEE_IOC_RSTMEM_ALLOC is added to allocate these restricted memory
> > buffers.
> >
> > The restricted memory is allocated for a specific use-case, like Secure
> > Video Playback, Trusted UI, or Secure Video Recording where certain
> > hardware devices can access the memory.
> >
> > More use-cases can be added in userspace ABI, but it's up to the backen=
d
> > drivers to provide the implementation.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/Makefile       |   1 +
> >  drivers/tee/tee_core.c     |  37 ++++++-
> >  drivers/tee/tee_private.h  |   2 +
> >  drivers/tee/tee_rstmem.c   | 201 +++++++++++++++++++++++++++++++++++++
> >  drivers/tee/tee_shm.c      |   2 +
> >  drivers/tee/tee_shm_pool.c |  69 ++++++++++++-
> >  include/linux/tee_core.h   |  15 +++
> >  include/linux/tee_drv.h    |   4 +-
> >  include/uapi/linux/tee.h   |  37 ++++++-
> >  9 files changed, 363 insertions(+), 5 deletions(-)
> >  create mode 100644 drivers/tee/tee_rstmem.c
> >
> > diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
> > index 5488cba30bd2..a4c6b55444b9 100644
> > --- a/drivers/tee/Makefile
> > +++ b/drivers/tee/Makefile
> > @@ -3,6 +3,7 @@ obj-$(CONFIG_TEE) +=3D tee.o
> >  tee-objs +=3D tee_core.o
> >  tee-objs +=3D tee_shm.o
> >  tee-objs +=3D tee_shm_pool.o
> > +tee-objs +=3D tee_rstmem.o
> >  obj-$(CONFIG_OPTEE) +=3D optee/
> >  obj-$(CONFIG_AMDTEE) +=3D amdtee/
> >  obj-$(CONFIG_ARM_TSTEE) +=3D tstee/
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index d113679b1e2d..e81167826002 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -1,12 +1,13 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Copyright (c) 2015-2016, Linaro Limited
> > + * Copyright (c) 2015-2022, 2024, Linaro Limited
> >   */
> >
> >  #define pr_fmt(fmt) "%s: " fmt, __func__
> >
> >  #include <linux/cdev.h>
> >  #include <linux/cred.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/fs.h>
> >  #include <linux/idr.h>
> >  #include <linux/module.h>
> > @@ -815,6 +816,38 @@ static int tee_ioctl_supp_send(struct tee_context =
*ctx,
> >         return rc;
> >  }
> >
> > +static int
> > +tee_ioctl_rstmem_alloc(struct tee_context *ctx,
> > +                      struct tee_ioctl_rstmem_alloc_data __user *udata=
)
> > +{
> > +       struct tee_ioctl_rstmem_alloc_data data;
> > +       struct dma_buf *dmabuf;
> > +       int id;
> > +       int fd;
> > +
> > +       if (copy_from_user(&data, udata, sizeof(data)))
> > +               return -EFAULT;
> > +
> > +       if (data.use_case =3D=3D TEE_IOC_UC_RESERVED)
> > +               return -EINVAL;
> > +
> > +       dmabuf =3D tee_rstmem_alloc(ctx, data.flags, data.use_case, dat=
a.size,
> > +                                 &id);
> > +       if (IS_ERR(dmabuf))
> > +               return PTR_ERR(dmabuf);
> > +       if (put_user(id, &udata->id)) {
> > +               fd =3D -EFAULT;
> > +               goto err;
> > +       }
> > +       fd =3D dma_buf_fd(dmabuf, O_CLOEXEC);
> > +       if (fd < 0)
> > +               goto err;
> > +       return fd;
> > +err:
> > +       dma_buf_put(dmabuf);
> > +       return fd;
> > +}
> > +
> >  static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned lo=
ng arg)
> >  {
> >         struct tee_context *ctx =3D filp->private_data;
> > @@ -839,6 +872,8 @@ static long tee_ioctl(struct file *filp, unsigned i=
nt cmd, unsigned long arg)
> >                 return tee_ioctl_supp_recv(ctx, uarg);
> >         case TEE_IOC_SUPPL_SEND:
> >                 return tee_ioctl_supp_send(ctx, uarg);
> > +       case TEE_IOC_RSTMEM_ALLOC:
> > +               return tee_ioctl_rstmem_alloc(ctx, uarg);
> >         default:
> >                 return -EINVAL;
> >         }
> > diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> > index 9bc50605227c..bf97796909c0 100644
> > --- a/drivers/tee/tee_private.h
> > +++ b/drivers/tee/tee_private.h
> > @@ -23,5 +23,7 @@ void teedev_ctx_put(struct tee_context *ctx);
> >  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t=
 size);
> >  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
> >                                           unsigned long addr, size_t le=
ngth);
> > +struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
> > +                                u32 use_case, size_t size, int *shm_id=
);
> >
> >  #endif /*TEE_PRIVATE_H*/
> > diff --git a/drivers/tee/tee_rstmem.c b/drivers/tee/tee_rstmem.c
> > new file mode 100644
> > index 000000000000..536bca2901e2
> > --- /dev/null
> > +++ b/drivers/tee/tee_rstmem.c
> > @@ -0,0 +1,201 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2024 Linaro Limited
> > + */
> > +#include <linux/device.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/slab.h>
> > +#include <linux/tee_core.h>
> > +#include "tee_private.h"
> > +
> > +struct tee_rstmem_attachment {
> > +       struct sg_table table;
> > +       struct device *dev;
> > +};
> > +
> > +static int rstmem_dma_attach(struct dma_buf *dmabuf,
> > +                            struct dma_buf_attachment *attachment)
> > +{
> > +       struct tee_shm *shm =3D dmabuf->priv;
> > +       struct tee_rstmem_attachment *a;
> > +       int rc;
> > +
> > +       a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> > +       if (!a)
> > +               return -ENOMEM;
> > +
> > +       if (shm->pages) {
> > +               rc =3D sg_alloc_table_from_pages(&a->table, shm->pages,
> > +                                              shm->num_pages, 0,
> > +                                              shm->num_pages * PAGE_SI=
ZE,
> > +                                              GFP_KERNEL);
> > +               if (rc)
> > +                       goto err;
> > +       } else {
> > +               rc =3D sg_alloc_table(&a->table, 1, GFP_KERNEL);
> > +               if (rc)
> > +                       goto err;
> > +               sg_set_page(a->table.sgl, phys_to_page(shm->paddr), shm=
->size,
> > +                           0);
> > +       }
> > +
> > +       a->dev =3D attachment->dev;
> > +       attachment->priv =3D a;
> > +
> > +       return 0;
> > +err:
> > +       kfree(a);
> > +       return rc;
> > +}
> > +
> > +static void rstmem_dma_detach(struct dma_buf *dmabuf,
> > +                             struct dma_buf_attachment *attachment)
> > +{
> > +       struct tee_rstmem_attachment *a =3D attachment->priv;
> > +
> > +       sg_free_table(&a->table);
> > +       kfree(a);
> > +}
> > +
> > +static struct sg_table *
> > +rstmem_dma_map_dma_buf(struct dma_buf_attachment *attachment,
> > +                      enum dma_data_direction direction)
> > +{
> > +       struct tee_rstmem_attachment *a =3D attachment->priv;
> > +       int ret;
> > +
> > +       ret =3D dma_map_sgtable(attachment->dev, &a->table, direction,
> > +                             DMA_ATTR_SKIP_CPU_SYNC);
> > +       if (ret)
> > +               return ERR_PTR(ret);
> > +
> > +       return &a->table;
> > +}
> > +
> > +static void rstmem_dma_unmap_dma_buf(struct dma_buf_attachment *attach=
ment,
> > +                                    struct sg_table *table,
> > +                                    enum dma_data_direction direction)
> > +{
> > +       struct tee_rstmem_attachment *a =3D attachment->priv;
> > +
> > +       WARN_ON(&a->table !=3D table);
> > +
> > +       dma_unmap_sgtable(attachment->dev, table, direction,
> > +                         DMA_ATTR_SKIP_CPU_SYNC);
> > +}
> > +
> > +static int rstmem_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> > +                                          enum dma_data_direction dire=
ction)
> > +{
> > +       return -EPERM;
> > +}
> > +
> > +static int rstmem_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> > +                                        enum dma_data_direction direct=
ion)
> > +{
> > +       return -EPERM;
> > +}
> > +
> > +static int rstmem_dma_buf_mmap(struct dma_buf *dmabuf,
> > +                              struct vm_area_struct *vma)
> > +{
> > +       return -EPERM;
> > +}
> > +
> > +static void rstmem_dma_buf_free(struct dma_buf *dmabuf)
> > +{
> > +       struct tee_shm *shm =3D dmabuf->priv;
> > +
> > +       tee_shm_put(shm);
> > +}
> > +
> > +static const struct dma_buf_ops rstmem_generic_buf_ops =3D {
> > +       .attach =3D rstmem_dma_attach,
> > +       .detach =3D rstmem_dma_detach,
> > +       .map_dma_buf =3D rstmem_dma_map_dma_buf,
> > +       .unmap_dma_buf =3D rstmem_dma_unmap_dma_buf,
> > +       .begin_cpu_access =3D rstmem_dma_buf_begin_cpu_access,
> > +       .end_cpu_access =3D rstmem_dma_buf_end_cpu_access,
> > +       .mmap =3D rstmem_dma_buf_mmap,
> > +       .release =3D rstmem_dma_buf_free,
> > +};
> > +
> > +struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
> > +                                u32 use_case, size_t size, int *shm_id=
)
> > +{
> > +       struct tee_device *teedev =3D ctx->teedev;
> > +       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > +       struct dma_buf *dmabuf;
> > +       struct tee_shm *shm;
> > +       void *ret;
> > +       int rc;
> > +
> > +       if (!tee_device_get(teedev))
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       if (!teedev->desc->ops->rstmem_alloc ||
> > +           !teedev->desc->ops->rstmem_free) {
> > +               dmabuf =3D ERR_PTR(-EINVAL);
> > +               goto err;
> > +       }
> > +
> > +       shm =3D kzalloc(sizeof(*shm), GFP_KERNEL);
> > +       if (!shm) {
> > +               dmabuf =3D ERR_PTR(-ENOMEM);
> > +               goto err;
> > +       }
> > +
> > +       refcount_set(&shm->refcount, 1);
> > +       shm->flags =3D TEE_SHM_RESTRICTED;
> > +       shm->use_case =3D use_case;
> > +       shm->ctx =3D ctx;
> > +
> > +       mutex_lock(&teedev->mutex);
> > +       shm->id =3D idr_alloc(&teedev->idr, NULL, 1, 0, GFP_KERNEL);
> > +       mutex_unlock(&teedev->mutex);
> > +       if (shm->id < 0) {
> > +               dmabuf =3D ERR_PTR(shm->id);
> > +               goto err_kfree;
> > +       }
> > +
> > +       rc =3D teedev->desc->ops->rstmem_alloc(ctx, shm, flags, use_cas=
e, size);
> > +       if (rc) {
> > +               dmabuf =3D ERR_PTR(rc);
> > +               goto err_idr_remove;
> > +       }
> > +
> > +       mutex_lock(&teedev->mutex);
> > +       ret =3D idr_replace(&teedev->idr, shm, shm->id);
> > +       mutex_unlock(&teedev->mutex);
> > +       if (IS_ERR(ret)) {
> > +               dmabuf =3D ret;
> > +               goto err_rstmem_free;
> > +       }
> > +       teedev_ctx_get(ctx);
> > +
> > +       exp_info.ops =3D &rstmem_generic_buf_ops;
> > +       exp_info.size =3D shm->size;
> > +       exp_info.priv =3D shm;
> > +       dmabuf =3D dma_buf_export(&exp_info);
> > +       if (IS_ERR(dmabuf)) {
> > +               tee_shm_put(shm);
> > +               return dmabuf;
> > +       }
> > +
> > +       *shm_id =3D shm->id;
> > +       return dmabuf;
> > +
> > +err_rstmem_free:
> > +       teedev->desc->ops->rstmem_free(ctx, shm);
> > +err_idr_remove:
> > +       mutex_lock(&teedev->mutex);
> > +       idr_remove(&teedev->idr, shm->id);
> > +       mutex_unlock(&teedev->mutex);
> > +err_kfree:
> > +       kfree(shm);
> > +err:
> > +       tee_device_put(teedev);
> > +       return dmabuf;
> > +}
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index daf6e5cfd59a..416f7f25d885 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -55,6 +55,8 @@ static void tee_shm_release(struct tee_device *teedev=
, struct tee_shm *shm)
> >                                 "unregister shm %p failed: %d", shm, rc=
);
> >
> >                 release_registered_pages(shm);
> > +       } else if (shm->flags & TEE_SHM_RESTRICTED) {
> > +               teedev->desc->ops->rstmem_free(shm->ctx, shm);
> >         }
> >
> >         teedev_ctx_put(shm->ctx);
> > diff --git a/drivers/tee/tee_shm_pool.c b/drivers/tee/tee_shm_pool.c
> > index 80004b55628d..ee57ef157a77 100644
> > --- a/drivers/tee/tee_shm_pool.c
> > +++ b/drivers/tee/tee_shm_pool.c
> > @@ -1,9 +1,8 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Copyright (c) 2015, 2017, 2022 Linaro Limited
> > + * Copyright (c) 2015, 2017, 2022, 2024 Linaro Limited
> >   */
> >  #include <linux/device.h>
> > -#include <linux/dma-buf.h>
> >  #include <linux/genalloc.h>
> >  #include <linux/slab.h>
> >  #include <linux/tee_core.h>
> > @@ -90,3 +89,69 @@ struct tee_shm_pool *tee_shm_pool_alloc_res_mem(unsi=
gned long vaddr,
> >         return ERR_PTR(rc);
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_pool_alloc_res_mem);
> > +
> > +static int rstmem_pool_op_gen_alloc(struct tee_shm_pool *pool,
> > +                                   struct tee_shm *shm, size_t size,
> > +                                   size_t align)
> > +{
> > +       size_t sz =3D ALIGN(size, PAGE_SIZE);
> > +       phys_addr_t pa;
> > +
> > +       pa =3D gen_pool_alloc(pool->private_data, sz);
> > +       if (!pa)
> > +               return -ENOMEM;
> > +
> > +       shm->size =3D sz;
> > +       shm->paddr =3D pa;
> > +
> > +       return 0;
> > +}
> > +
> > +static void rstmem_pool_op_gen_free(struct tee_shm_pool *pool,
> > +                                   struct tee_shm *shm)
> > +{
> > +       gen_pool_free(pool->private_data, shm->paddr, shm->size);
> > +       shm->paddr =3D 0;
> > +}
> > +
> > +static struct tee_shm_pool_ops rstmem_pool_ops_generic =3D {
> > +       .alloc =3D rstmem_pool_op_gen_alloc,
> > +       .free =3D rstmem_pool_op_gen_free,
> > +       .destroy_pool =3D pool_op_gen_destroy_pool,
> > +};
> > +
> > +struct tee_shm_pool *tee_rstmem_gen_pool_alloc(phys_addr_t paddr, size=
_t size)
> > +{
> > +       const size_t page_mask =3D PAGE_SIZE - 1;
> > +       struct tee_shm_pool *pool;
> > +       int rc;
> > +
> > +       /* Check it's page aligned */
> > +       if ((paddr | size) & page_mask)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       pool =3D kzalloc(sizeof(*pool), GFP_KERNEL);
> > +       if (!pool)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       pool->private_data =3D gen_pool_create(PAGE_SHIFT, -1);
> > +       if (!pool->private_data) {
> > +               rc =3D -ENOMEM;
> > +               goto err_free;
> > +       }
> > +
> > +       rc =3D gen_pool_add(pool->private_data, paddr, size, -1);
> > +       if (rc)
> > +               goto err_free_pool;
> > +
> > +       pool->ops =3D &rstmem_pool_ops_generic;
> > +       return pool;
> > +
> > +err_free_pool:
> > +       gen_pool_destroy(pool->private_data);
> > +err_free:
> > +       kfree(pool);
> > +
> > +       return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_rstmem_gen_pool_alloc);
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index a38494d6b5f4..608302f494fe 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -26,6 +26,7 @@
> >  #define TEE_SHM_USER_MAPPED    BIT(1)  /* Memory mapped in user space =
*/
> >  #define TEE_SHM_POOL           BIT(2)  /* Memory allocated from pool *=
/
> >  #define TEE_SHM_PRIV           BIT(3)  /* Memory private to TEE driver=
 */
> > +#define TEE_SHM_RESTRICTED     BIT(4)  /* Restricted memory */
> >
> >  #define TEE_DEVICE_FLAG_REGISTERED     0x1
> >  #define TEE_MAX_DEV_NAME_LEN           32
> > @@ -76,6 +77,8 @@ struct tee_device {
> >   * @supp_send:         called for supplicant to send a response
> >   * @shm_register:      register shared memory buffer in TEE
> >   * @shm_unregister:    unregister shared memory buffer in TEE
> > + * @rstmem_alloc:      allocate restricted memory
> > + * @rstmem_free:       free restricted memory
> >   */
> >  struct tee_driver_ops {
> >         void (*get_version)(struct tee_device *teedev,
> > @@ -99,6 +102,9 @@ struct tee_driver_ops {
> >                             struct page **pages, size_t num_pages,
> >                             unsigned long start);
> >         int (*shm_unregister)(struct tee_context *ctx, struct tee_shm *=
shm);
> > +       int (*rstmem_alloc)(struct tee_context *ctx, struct tee_shm *sh=
m,
> > +                           u32 flags, u32 use_case, size_t size);
> > +       void (*rstmem_free)(struct tee_context *ctx, struct tee_shm *sh=
m);
> >  };
> >
> >  /**
> > @@ -229,6 +235,15 @@ static inline void tee_shm_pool_free(struct tee_sh=
m_pool *pool)
> >         pool->ops->destroy_pool(pool);
> >  }
> >
> > +/**
> > + * tee_rstmem_gen_pool_alloc() - Create a restricted memory manager
> > + * @paddr:     Physical address of start of pool
> > + * @size:      Size in bytes of the pool
> > + *
> > + * @returns pointer to a 'struct tee_shm_pool' or an ERR_PTR on failur=
e.
> > + */
> > +struct tee_shm_pool *tee_rstmem_gen_pool_alloc(phys_addr_t paddr, size=
_t size);
> > +
> >  /**
> >   * tee_get_drvdata() - Return driver_data pointer
> >   * @returns the driver_data pointer supplied to tee_register().
> > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > index a54c203000ed..b7ee346e5e44 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -55,6 +55,7 @@ struct tee_context {
> >   * @pages:     locked pages from userspace
> >   * @num_pages: number of locked pages
> >   * @refcount:  reference counter
> > + * @use_case:  defined by TEE_IOC_UC_* in tee.h
> >   * @flags:     defined by TEE_SHM_* in tee_core.h
> >   * @id:                unique id of a shared memory object on this dev=
ice, shared
> >   *             with user space
> > @@ -71,7 +72,8 @@ struct tee_shm {
> >         struct page **pages;
> >         size_t num_pages;
> >         refcount_t refcount;
> > -       u32 flags;
> > +       u16 use_case;
> > +       u16 flags;
>
> Shouldn't we keep them u32 instead to be aligned with user-space inputs?

Sure, that makes sense.

>
> >         int id;
> >         u64 sec_world_id;
> >  };
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index d0430bee8292..cdc8c82c9a38 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -1,5 +1,5 @@
> >  /*
> > - * Copyright (c) 2015-2016, Linaro Limited
> > + * Copyright (c) 2015-2017, 2020, 2024, Linaro Limited
> >   * All rights reserved.
> >   *
> >   * Redistribution and use in source and binary forms, with or without
> > @@ -48,6 +48,7 @@
> >  #define TEE_GEN_CAP_PRIVILEGED (1 << 1)/* Privileged device (for suppl=
icant) */
> >  #define TEE_GEN_CAP_REG_MEM    (1 << 2)/* Supports registering shared =
memory */
> >  #define TEE_GEN_CAP_MEMREF_NULL        (1 << 3)/* NULL MemRef support =
*/
> > +#define TEE_GEN_CAP_RSTMEM     (1 << 4)/* Supports restricted memory *=
/
> >
> >  #define TEE_MEMREF_NULL                (__u64)(-1) /* NULL MemRef Buff=
er */
> >
> > @@ -389,6 +390,40 @@ struct tee_ioctl_shm_register_data {
> >   */
> >  #define TEE_IOC_SHM_REGISTER   _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 9, =
\
> >                                      struct tee_ioctl_shm_register_data=
)
> > +
> > +#define TEE_IOC_UC_RESERVED            0
> > +#define TEE_IOC_UC_SECURE_VIDEO_PLAY   1
> > +#define TEE_IOC_UC_TRUSTED_UI          2
> > +#define TEE_IOC_UC_SECURE_VIDEO_RECORD 3
> > +
> > +/**
> > + * struct tee_ioctl_rstmem_alloc_data - Restricted memory allocate arg=
ument
> > + * @size:      [in/out] Size of restricted memory to allocate
> > + * @flags:     [in/out] Flags to/from allocate
> > + * @use_case   [in] Restricted memory use case, TEE_IOC_UC_*
> > + * @id:                [out] Identifier of the restricted memory
> > + */
> > +struct tee_ioctl_rstmem_alloc_data {
> > +       __u64 size;
> > +       __u32 flags;
> > +       __u32 use_case;
> > +       __s32 id;
> > +};
> > +
> > +/**
> > + * TEE_IOC_RSTMEM_ALLOC - allocate restricted memory
> > + *
> > + * Allocates restricted physically memory normally not accessible by t=
he
> > + * kernel.
>
> Can we elaborate here as well on similar lines as per commit message?

OK, I'll add something.

Thanks,
Jens

>
> -Sumit
>
> > + *
> > + * Returns a file descriptor on success or < 0 on failure
> > + *
> > + * The returned file descriptor is a dma-buf that can be attached and
> > + * mapped for device with permission to access the physical memory.
> > + */
> > +#define TEE_IOC_RSTMEM_ALLOC     _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1=
0, \
> > +                                      struct tee_ioctl_rstmem_alloc_da=
ta)
> > +
> >  /*
> >   * Five syscalls are used when communicating with the TEE driver.
> >   * open(): opens the device associated with the driver
> > --
> > 2.43.0
> >

