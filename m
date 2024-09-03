Return-Path: <linux-media+bounces-17486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13796A5D4
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 19:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EBBB1F226B5
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 17:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199AD190059;
	Tue,  3 Sep 2024 17:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EX7SY8NT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E218E03B
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385803; cv=none; b=eWSgY8xANrTzk0Jb240hmBjqcr+nfhj7qXF3YHuqoRCfWBpZcuWx9RqyYvxtn7OpEJ8Fpb/CxWRGonjhIP/NUlzXhkN+DJhucaRkHNrASm5XBymlQjbiKVp9UVcxo42ix/vfPHTRHwasCRewwgILYYcPTlwFN8tRBg9S/5g9Jvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385803; c=relaxed/simple;
	bh=UKr4xIqUajkJwgniWs5S3/DHPYcDeZQDzVTh6cjQReE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0UpEURfW3UQHU16XX8KTtgbQTShZa5zGOA3WhbzDfUL3PVzTNhA3B5nGH0hMdwd2yd+rhwo11InkKmFlvnup7kXQmY3DASWk5AwFjYWaOpLzXPY7wWYCZXhY4NqVGUkbt6+wY/9ySOUDu1hKFZyDGgfY7G1uL09hPAeH7UOo0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EX7SY8NT; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-457c6389a3aso23321cf.1
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725385800; x=1725990600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=410dK//Q8gNFJcYha80Zwj2EgZWoXsMUD0QY52+7x5g=;
        b=EX7SY8NTwVxLyRm3lLl821l/2pdytr3NQ2GU6NX2dgiDbu2yyRvLvegLj0Un/8RV2o
         tGmNsGDKvz/fn2G7MPKASqcgM0Sa2g9ZFHo0+3wETHZSyVaTP1WsBrq5NRyRljIJn2xl
         yJSuVZM1THYHODg2Uo+r4D1CgJNbfWCG98m1Uj969/8k6wcHO31hqQ1n133vFgTU/uzU
         gyKmjqPtssQk4Axuw1D29ctgB6ZDGARrrjiHxJgnlAh3HUhNKy8xT0Sx06v/a9h+yHwL
         ehoFzWCLmBVulPG0LjkSisTlhSxEJv96bHyq2v1SoDFD5a7ZCL8BYfThTvv6XXx7E+sM
         YHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385800; x=1725990600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=410dK//Q8gNFJcYha80Zwj2EgZWoXsMUD0QY52+7x5g=;
        b=kY/92AcBZTWL3w/5KM5i3LRaprdm5xUmwiXwfzX+QcbQHej50PFoH7Qy9Ya9HykdeB
         QkPqNksOUZziFQr2paaSDJ4yqvBjBP2dGi3q8qGmtJuWRruqsJ7qC+EhZWhB6Dg5yU9l
         N8WxHRoulIPYvHy/Hywnsy8/hRceluPYoJ2R4vn6JHkBnmfy0bZYb8hKhfdKbauQ1sAj
         iCQi8w35+WjEazdTjh0pSLv1CpcIJFlJouHRI4m2yozzBDhh2WBRNREdTYuBX/KddGiV
         Xvvt2ZLvuB7uqP75P8eUQ5L9rvwl6RU29TM6tAaousNXdF6Fa0x5glOsxbf4766ukeNc
         y1YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVSXnEC8V2wmW/hxGWX7kn0ofpdTAUJ2hhyCo2fhPOoU+M66V6tpedNqr4KaT6j/4YxMcw5ktlOOxs3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAtRbTlAdC8bKlEuD2prSKYeSVuUkFAlHn1RDeuS2Htf0EEll+
	KQ3hiPGmZzTXJT16h/RQscXb8JGm4Bhi/CZoZud9LhTD21TljOb9SHrxpb8ADliJQFK6gpYELiM
	djFaVHqY4e/GWm2VM9YE/lBzBXwMrA2dMeukJ
X-Google-Smtp-Source: AGHT+IGLoDHkPBLDX8ZfTm9Z74smEA48QzWbIgbw7Is1VRnj5CYXSnopkAUOG45YOImFSerPd0BuTk2cxqwZI6oJDC4=
X-Received: by 2002:a05:622a:612:b0:44f:9db1:7fca with SMTP id
 d75a77b69052e-457f63b3527mr45261cf.28.1725385799889; Tue, 03 Sep 2024
 10:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org> <20240830070351.2855919-3-jens.wiklander@linaro.org>
In-Reply-To: <20240830070351.2855919-3-jens.wiklander@linaro.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 3 Sep 2024 10:49:46 -0700
Message-ID: <CABdmKX02Zd98euuxvKHuV2C5Cng+4P3_8UL3xn2apMP9to+KOA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> From: Etienne Carriere <etienne.carriere@linaro.org>
>
> Enable userspace to create a tee_shm object that refers to a dmabuf
> reference.
>
> Userspace registers the dmabuf file descriptor as in a tee_shm object.
> The registration is completed with a tee_shm file descriptor returned to
> userspace.
>
> Userspace is free to close the dmabuf file descriptor now since all the
> resources are now held via the tee_shm object.
>
> Closing the tee_shm file descriptor will release all resources used by th=
e
> tee_shm object.
>
> This change only support dmabuf references that relates to physically
> contiguous memory buffers.
>
> New tee_shm flag to identify tee_shm objects built from a registered
> dmabuf, TEE_SHM_DMA_BUF.
>
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c   |  38 ++++++++++++++
>  drivers/tee/tee_shm.c    | 104 +++++++++++++++++++++++++++++++++++++--
>  include/linux/tee_drv.h  |  11 +++++
>  include/uapi/linux/tee.h |  29 +++++++++++
>  4 files changed, 179 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index e59c20d74b36..3dfd5428d58c 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -356,6 +356,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
>         return ret;
>  }
>
> +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> +                                    struct tee_ioctl_shm_register_fd_dat=
a __user *udata)
> +{
> +       struct tee_ioctl_shm_register_fd_data data;
> +       struct tee_shm *shm;
> +       long ret;
> +
> +       if (copy_from_user(&data, udata, sizeof(data)))
> +               return -EFAULT;
> +
> +       /* Currently no input flags are supported */
> +       if (data.flags)
> +               return -EINVAL;
> +
> +       shm =3D tee_shm_register_fd(ctx, data.fd);
> +       if (IS_ERR(shm))
> +               return -EINVAL;
> +
> +       data.id =3D shm->id;
> +       data.flags =3D shm->flags;
> +       data.size =3D shm->size;
> +
> +       if (copy_to_user(udata, &data, sizeof(data)))
> +               ret =3D -EFAULT;
> +       else
> +               ret =3D tee_shm_get_fd(shm);
> +
> +       /*
> +        * When user space closes the file descriptor the shared memory
> +        * should be freed or if tee_shm_get_fd() failed then it will
> +        * be freed immediately.
> +        */
> +       tee_shm_put(shm);
> +       return ret;
> +}
> +
>  static int params_from_user(struct tee_context *ctx, struct tee_param *p=
arams,
>                             size_t num_params,
>                             struct tee_ioctl_param __user *uparams)
> @@ -830,6 +866,8 @@ static long tee_ioctl(struct file *filp, unsigned int=
 cmd, unsigned long arg)
>                 return tee_ioctl_shm_alloc(ctx, uarg);
>         case TEE_IOC_SHM_REGISTER:
>                 return tee_ioctl_shm_register(ctx, uarg);
> +       case TEE_IOC_SHM_REGISTER_FD:
> +               return tee_ioctl_shm_register_fd(ctx, uarg);
>         case TEE_IOC_OPEN_SESSION:
>                 return tee_ioctl_open_session(ctx, uarg);
>         case TEE_IOC_INVOKE:
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 731d9028b67f..a1cb3c8b6423 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -4,6 +4,7 @@
>   */
>  #include <linux/anon_inodes.h>
>  #include <linux/device.h>
> +#include <linux/dma-buf.h>
>  #include <linux/idr.h>
>  #include <linux/mm.h>
>  #include <linux/sched.h>
> @@ -14,6 +15,14 @@
>  #include <linux/highmem.h>
>  #include "tee_private.h"
>
> +/* extra references appended to shm object for registered shared memory =
*/
> +struct tee_shm_dmabuf_ref {
> +       struct tee_shm shm;
> +       struct dma_buf *dmabuf;
> +       struct dma_buf_attachment *attach;
> +       struct sg_table *sgt;
> +};
> +
>  static void shm_put_kernel_pages(struct page **pages, size_t page_count)
>  {
>         size_t n;
> @@ -44,7 +53,16 @@ static void release_registered_pages(struct tee_shm *s=
hm)
>
>  static void tee_shm_release(struct tee_device *teedev, struct tee_shm *s=
hm)
>  {
> -       if (shm->flags & TEE_SHM_POOL) {
> +       if (shm->flags & TEE_SHM_DMA_BUF) {
> +               struct tee_shm_dmabuf_ref *ref;
> +
> +               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> +               dma_buf_unmap_attachment(ref->attach, ref->sgt,
> +               DMA_BIDIRECTIONAL);
> +
> +               dma_buf_detach(ref->dmabuf, ref->attach);
> +               dma_buf_put(ref->dmabuf);
> +       } else if (shm->flags & TEE_SHM_POOL) {
>                 teedev->pool->ops->free(teedev->pool, shm);
>         } else if (shm->flags & TEE_SHM_DYNAMIC) {
>                 int rc =3D teedev->desc->ops->shm_unregister(shm->ctx, sh=
m);
> @@ -56,7 +74,8 @@ static void tee_shm_release(struct tee_device *teedev, =
struct tee_shm *shm)
>                 release_registered_pages(shm);
>         }
>
> -       teedev_ctx_put(shm->ctx);
> +       if (shm->ctx)
> +               teedev_ctx_put(shm->ctx);
>
>         kfree(shm);
>
> @@ -168,7 +187,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_con=
text *ctx, size_t size)
>   * tee_client_invoke_func(). The memory allocated is later freed with a
>   * call to tee_shm_free().
>   *
> - * @returns a pointer to 'struct tee_shm'
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on fai=
lure
>   */
>  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t=
 size)
>  {
> @@ -178,6 +197,85 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_=
context *ctx, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
>
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> +{
> +       struct tee_shm_dmabuf_ref *ref;
> +       int rc;
> +
> +       if (!tee_device_get(ctx->teedev))
> +               return ERR_PTR(-EINVAL);
> +
> +       teedev_ctx_get(ctx);
> +
> +       ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> +       if (!ref) {
> +               rc =3D -ENOMEM;
> +               goto err_put_tee;
> +       }
> +
> +       refcount_set(&ref->shm.refcount, 1);
> +       ref->shm.ctx =3D ctx;
> +       ref->shm.id =3D -1;
> +
> +       ref->dmabuf =3D dma_buf_get(fd);
> +       if (IS_ERR(ref->dmabuf)) {
> +               rc =3D PTR_ERR(ref->dmabuf);
> +               goto err_put_dmabuf;
> +       }

Hi,

Most of the gotos in the errors paths from here on look offset by one
to me. Attempting to put a dmabuf after failing to get, detaching
after failing to attach, unmapping after failing to map, removing an
IDR after failing to allocate one.


> +
> +       ref->attach =3D dma_buf_attach(ref->dmabuf, &ref->shm.ctx->teedev=
->dev);
> +       if (IS_ERR(ref->attach)) {
> +               rc =3D PTR_ERR(ref->attach);
> +               goto err_detach;
> +       }
> +
> +       ref->sgt =3D dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONA=
L);
> +       if (IS_ERR(ref->sgt)) {
> +               rc =3D PTR_ERR(ref->sgt);
> +               goto err_unmap_attachement;
> +       }
> +
> +       if (sg_nents(ref->sgt->sgl) !=3D 1) {
> +               rc =3D PTR_ERR(ref->sgt->sgl);
> +               goto err_unmap_attachement;
> +       }
> +
> +       ref->shm.paddr =3D page_to_phys(sg_page(ref->sgt->sgl));
> +       ref->shm.size =3D ref->sgt->sgl->length;
> +       ref->shm.flags =3D TEE_SHM_DMA_BUF;
> +
> +       mutex_lock(&ref->shm.ctx->teedev->mutex);
> +       ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> +                               1, 0, GFP_KERNEL);
> +       mutex_unlock(&ref->shm.ctx->teedev->mutex);
> +       if (ref->shm.id < 0) {
> +               rc =3D ref->shm.id;
> +               goto err_idr_remove;
> +       }
> +
> +       return &ref->shm;
> +
> +err_idr_remove:
> +       mutex_lock(&ctx->teedev->mutex);
> +       idr_remove(&ctx->teedev->idr, ref->shm.id);
> +       mutex_unlock(&ctx->teedev->mutex);
> +err_unmap_attachement:
> +       dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL=
);
> +err_detach:
> +       dma_buf_detach(ref->dmabuf, ref->attach);
> +err_put_dmabuf:
> +       dma_buf_put(ref->dmabuf);
> +       kfree(ref);
> +err_put_tee:
> +       teedev_ctx_put(ctx);
> +       tee_device_put(ctx->teedev);
> +
> +       return ERR_PTR(rc);
> +}
> +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> +
> +
> +
>  /**
>   * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately sha=
red
>   *                           kernel buffer
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index 71632e3c5f18..6a1fee689007 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -25,6 +25,7 @@
>  #define TEE_SHM_USER_MAPPED    BIT(1)  /* Memory mapped in user space */
>  #define TEE_SHM_POOL           BIT(2)  /* Memory allocated from pool */
>  #define TEE_SHM_PRIV           BIT(3)  /* Memory private to TEE driver *=
/
> +#define TEE_SHM_DMA_BUF                BIT(4)  /* Memory with dma-buf ha=
ndle */
>
>  struct device;
>  struct tee_device;
> @@ -275,6 +276,16 @@ void *tee_get_drvdata(struct tee_device *teedev);
>  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t s=
ize);
>  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t=
 size);
>
> +/**
> + * tee_shm_register_fd() - Register shared memory from file descriptor
> + *
> + * @ctx:       Context that allocates the shared memory
> + * @fd:                Shared memory file descriptor reference
> + *
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on fai=
lure
> + */
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> +
>  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
>                                             void *addr, size_t length);
>
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 23e57164693c..77bc8ef24d3c 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -117,6 +117,35 @@ struct tee_ioctl_shm_alloc_data {
>  #define TEE_IOC_SHM_ALLOC      _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, \
>                                      struct tee_ioctl_shm_alloc_data)
>
> +/**
> + * struct tee_ioctl_shm_register_fd_data - Shared memory registering arg=
ument
> + * @fd:                [in] File descriptor identifying the shared memor=
y
> + * @size:      [out] Size of shared memory to allocate
> + * @flags:     [in] Flags to/from allocation.
> + * @id:                [out] Identifier of the shared memory
> + *
> + * The flags field should currently be zero as input. Updated by the cal=
l
> + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD below.
> + */
> +struct tee_ioctl_shm_register_fd_data {
> +       __s64 fd;
> +       __u64 size;
> +       __u32 flags;
> +       __s32 id;
> +} __aligned(8);
> +
> +/**
> + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file descri=
ptor
> + *
> + * Returns a file descriptor on success or < 0 on failure
> + *
> + * The returned file descriptor refers to the shared memory object in ke=
rnel
> + * land. The shared memory is freed when the descriptor is closed.
> + */
> +#define TEE_IOC_SHM_REGISTER_FD        _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE=
 + 8, \
> +                                    struct tee_ioctl_shm_register_fd_dat=
a)
> +
>  /**
>   * struct tee_ioctl_buf_data - Variable sized buffer
>   * @buf_ptr:   [in] A __user pointer to a buffer
> --
> 2.34.1
>

