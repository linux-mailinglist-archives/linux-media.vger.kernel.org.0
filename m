Return-Path: <linux-media+bounces-35127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6006ADE3F3
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 08:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 638BC7A2BA1
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 06:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACB9213E85;
	Wed, 18 Jun 2025 06:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rroeG5g0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C00F20F09C
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 06:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229286; cv=none; b=Z9igN5x/K4vuYNCjwTzM+MqK2OAO4ZMwDUYXpGI5P6OFqe71BKDu9KhLsm6SxN8hDr5lVAHU5e3PQrJ2YXYuJpurOrZbw+HSQ29V46ZZP7sDxCzmbhMzZZsvmtCSIRtvylTZnLaOTY1pIACsV9zrR57vUg6IX62TNtz7uhbX+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229286; c=relaxed/simple;
	bh=tgCACSjAUK037tofgE+CV10GSdnmAP9aZLkFwg+KQOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ku5l50qJFM+7KuM+QNIKfDf+VM1J2xRhcZIRmMEqaILpHMOTMY8KKzxwuWSFMBjvhtaUzzoDQ6bOyMltn9puWaBVUhumL/04kHRjR6eDCusjTCzQnOnH8b5tFZz8lGLiy5x+bZrTtNNfRWXrUbYWHSgdrP5Cb9v57QjnHpb5iK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rroeG5g0; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-400fa6eafa9so4565156b6e.1
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 23:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750229283; x=1750834083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnsoLmuO3csUx1qg//UCkqDpzxXEFnkU9Btic+XEOTg=;
        b=rroeG5g0zJijRi7JNrvvWOu4hwnJ/fVyZIZw/n+PIW8Q8ndKe5q652zAdSW9RpzRGz
         d7kNd6utEKRsMvgp4Zni5IL45uv1yTSBTNtm50x8JH2sm2c49eCz63t9xc/Gmm4YQRT4
         wTaBZgsQJeb4J0ZOVvT48Uw+66qb/uia10v3ytAPtyj7Ckuwne4TIoZyF2hwTmFm94Ji
         oc5s591Jp9cUKJPiVrk5mGtLR1UgClTWKNCjHVgKFCYT+sn5jhB6Pt+SQLFghH9MZkHC
         8w2+6lOczm/3S5VNJIfIydK3MjXqdxwXgiIQsqNNjp/DH/d6a2AkdhUGVMtVpG0y+xGG
         22SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750229283; x=1750834083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnsoLmuO3csUx1qg//UCkqDpzxXEFnkU9Btic+XEOTg=;
        b=qziAvjUpiccfME74hw+6QuDQjbWnfV4aSi7A5EIvMkoLiDCffz+pIPADC129sKchQQ
         n8JLOIX5UDIujVaaXZUF3aXIaMQiMnHnJqfKosRdeRzjVXxZHLJYo6r/im+6etUyI64e
         CRoOWF/QW0aLxDtWvjbrMQE1x/uPJxaXVfrBvEZ31Anp9vQHdYAGiccOYS2rarAfAnT6
         FbwrPgkeWWq4j7WxGnI04Lb0dGiGpT3LUy9a8PvdJCBi+JmsozTS63O/e/8Vwtp0/clh
         yZsDRObDpga6PK5Af6P5lIbmI73k8pI+TseTmUc5mLz4C8TlDItbH15Wrn1/N9lDYmE0
         ViVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlRWtJqT4vHjPuMG8rZ2QOBuNXyIkM+Kh+1OW+QOqJpBp68MOq5iUiAGOJZezhyMo/fs1KHSFm52mY2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2IVXdByg0yhgfb/+KZSewEYkI3KgIqiHpU+9nSGU39UxOpiwL
	ZM12R5W9UvkcGMWbsWs9VPAAqnvsjVTedFogES3a3j1HJpY+zohgDK8r+vKXnzkforckJsn4U9j
	g+U53Pu+kqGtNo8i9YOMPdDve4AP8/pPQ+F2maBo4Aw==
X-Gm-Gg: ASbGncvsPYFD8LEz8jrmsZSbK7nlz7+oQajXiquME4mBGJ6raXqr8x4oWRND9uIKga6
	hn7xe8szysVSuCb19pWaoh5Jpe7N/NclRr07wlGHU00WYChSgGQplE57ClCOJnnxVzAXifAdz4x
	7deR/vkApm6PPmqXEMAMSaXK5pgTTV1BRwTkGnKGEPHBA=
X-Google-Smtp-Source: AGHT+IFP9EIG3tj0jAgtNhGjoHkRLBhC6oVQyPRvROrony9d3p9WGI2/mxvN0ZbrFjL6zlrp4PgKd9Szo6hKSr5lv8Q=
X-Received: by 2002:a05:6808:1825:b0:401:e6f0:a8d4 with SMTP id
 5614622812f47-40a7c1b1f7emr11398476b6e.5.1750229283226; Tue, 17 Jun 2025
 23:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-6-jens.wiklander@linaro.org> <aFFIAiU4ZSN1qZXK@sumit-X1>
In-Reply-To: <aFFIAiU4ZSN1qZXK@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 18 Jun 2025 08:47:51 +0200
X-Gm-Features: AX0GCFtpgp_r9JKq4Jq2B8UGDsgmMBvkUILLhZ3AbZwtRAMSoPIAJ1YqJQTR_AI
Message-ID: <CAHUa44E=nHjLf2guoG6LzTKZwTQGjEReKUF01PL31BfJ22e9EQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/9] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 12:48=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Tue, Jun 10, 2025 at 03:13:49PM +0200, Jens Wiklander wrote:
> > From: Etienne Carriere <etienne.carriere@foss.st.com>
> >
> > Add a userspace API to create a tee_shm object that refers to a dmabuf
> > reference.
> >
> > Userspace registers the dmabuf file descriptor as in a tee_shm object.
> > The registration is completed with a tee_shm returned file descriptor.
> >
> > Userspace is free to close the dmabuf file descriptor after it has been
> > registered since all the resources are now held via the new tee_shm
> > object.
> >
> > Closing the tee_shm file descriptor will eventually release all
> > resources used by the tee_shm object when all references are released.
> >
> > The new IOCTL, TEE_IOC_SHM_REGISTER_FD, supports dmabuf references to
> > physically contiguous memory buffers. Dmabuf references acquired from
> > the TEE DMA-heap can be used as protected memory for Secure Video Path
> > and such use cases. It depends on the TEE and the TEE driver if dmabuf
> > references acquired by other means can be used.
> >
> > A new tee_shm flag is added to identify tee_shm objects built from a
> > registered dmabuf, TEE_SHM_DMA_BUF.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_core.c    |  63 +++++++++++++++++++++-
> >  drivers/tee/tee_private.h |  10 ++++
> >  drivers/tee/tee_shm.c     | 106 ++++++++++++++++++++++++++++++++++++--
> >  include/linux/tee_core.h  |   1 +
> >  include/linux/tee_drv.h   |  10 ++++
> >  include/uapi/linux/tee.h  |  31 +++++++++++
> >  6 files changed, 217 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index 5259b8223c27..0e9d9e5872a4 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -353,11 +353,49 @@ tee_ioctl_shm_register(struct tee_context *ctx,
> >       return ret;
> >  }
> >
> > +static int
> > +tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > +                       struct tee_ioctl_shm_register_fd_data __user *u=
data)
> > +{
> > +     struct tee_ioctl_shm_register_fd_data data;
> > +     struct tee_shm *shm;
> > +     long ret;
> > +
> > +     if (copy_from_user(&data, udata, sizeof(data)))
> > +             return -EFAULT;
> > +
> > +     /* Currently no input flags are supported */
> > +     if (data.flags)
> > +             return -EINVAL;
> > +
> > +     shm =3D tee_shm_register_fd(ctx, data.fd);
> > +     if (IS_ERR(shm))
> > +             return -EINVAL;
> > +
> > +     data.id =3D shm->id;
> > +     data.flags =3D shm->flags;
> > +     data.size =3D shm->size;
> > +
> > +     if (copy_to_user(udata, &data, sizeof(data)))
> > +             ret =3D -EFAULT;
> > +     else
> > +             ret =3D tee_shm_get_fd(shm);
> > +
> > +     /*
> > +      * When user space closes the file descriptor the shared memory
> > +      * should be freed or if tee_shm_get_fd() failed then it will
> > +      * be freed immediately.
> > +      */
> > +     tee_shm_put(shm);
> > +     return ret;
> > +}
> > +
> >  static int param_from_user_memref(struct tee_context *ctx,
> >                                 struct tee_param_memref *memref,
> >                                 struct tee_ioctl_param *ip)
> >  {
> >       struct tee_shm *shm;
> > +     size_t offs =3D 0;
> >
> >       /*
> >        * If a NULL pointer is passed to a TA in the TEE,
> > @@ -388,6 +426,26 @@ static int param_from_user_memref(struct tee_conte=
xt *ctx,
> >                       tee_shm_put(shm);
> >                       return -EINVAL;
> >               }
> > +
> > +             if (shm->flags & TEE_SHM_DMA_BUF) {
> > +                     struct tee_shm_dmabuf_ref *ref;
> > +
> > +                     ref =3D container_of(shm, struct tee_shm_dmabuf_r=
ef, shm);
> > +                     if (ref->parent_shm) {
> > +                             /*
> > +                              * The shm already has one reference to
> > +                              * ref->parent_shm so we are clear of 0.
> > +                              * We're getting another reference since
> > +                              * this shm will be used in the parameter
> > +                              * list instead of the shm we got with
> > +                              * tee_shm_get_from_id() above.
> > +                              */
> > +                             refcount_inc(&ref->parent_shm->refcount);
> > +                             tee_shm_put(shm);
> > +                             shm =3D ref->parent_shm;
> > +                             offs =3D ref->offset;
> > +                     }
> > +             }
> >       } else if (ctx->cap_memref_null) {
> >               /* Pass NULL pointer to OP-TEE */
> >               shm =3D NULL;
> > @@ -395,7 +453,7 @@ static int param_from_user_memref(struct tee_contex=
t *ctx,
> >               return -EINVAL;
> >       }
> >
> > -     memref->shm_offs =3D ip->a;
> > +     memref->shm_offs =3D ip->a + offs;
> >       memref->size =3D ip->b;
> >       memref->shm =3D shm;
> >
> > @@ -841,6 +899,8 @@ static long tee_ioctl(struct file *filp, unsigned i=
nt cmd, unsigned long arg)
> >               return tee_ioctl_shm_alloc(ctx, uarg);
> >       case TEE_IOC_SHM_REGISTER:
> >               return tee_ioctl_shm_register(ctx, uarg);
> > +     case TEE_IOC_SHM_REGISTER_FD:
> > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> >       case TEE_IOC_OPEN_SESSION:
> >               return tee_ioctl_open_session(ctx, uarg);
> >       case TEE_IOC_INVOKE:
> > @@ -1300,3 +1360,4 @@ MODULE_AUTHOR("Linaro");
> >  MODULE_DESCRIPTION("TEE Driver");
> >  MODULE_VERSION("1.0");
> >  MODULE_LICENSE("GPL v2");
> > +MODULE_IMPORT_NS("DMA_BUF");
> > diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> > index 6c6ff5d5eed2..308467705da6 100644
> > --- a/drivers/tee/tee_private.h
> > +++ b/drivers/tee/tee_private.h
> > @@ -13,6 +13,16 @@
> >  #include <linux/mutex.h>
> >  #include <linux/types.h>
> >
> > +/* extra references appended to shm object for registered shared memor=
y */
> > +struct tee_shm_dmabuf_ref {
> > +     struct tee_shm shm;
> > +     size_t offset;
> > +     struct dma_buf *dmabuf;
> > +     struct dma_buf_attachment *attach;
> > +     struct sg_table *sgt;
> > +     struct tee_shm *parent_shm;
> > +};
> > +
> >  int tee_shm_get_fd(struct tee_shm *shm);
> >
> >  bool tee_device_get(struct tee_device *teedev);
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index daf6e5cfd59a..e63095e84644 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -4,6 +4,7 @@
> >   */
> >  #include <linux/anon_inodes.h>
> >  #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/idr.h>
> >  #include <linux/io.h>
> >  #include <linux/mm.h>
> > @@ -45,7 +46,21 @@ static void release_registered_pages(struct tee_shm =
*shm)
> >
> >  static void tee_shm_release(struct tee_device *teedev, struct tee_shm =
*shm)
> >  {
> > -     if (shm->flags & TEE_SHM_POOL) {
> > +     void *p =3D shm;
> > +
> > +     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +             struct tee_shm_dmabuf_ref *ref;
> > +
> > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > +             p =3D ref;
> > +             if (ref->attach) {
> > +                     dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > +                                              DMA_BIDIRECTIONAL);
> > +
> > +                     dma_buf_detach(ref->dmabuf, ref->attach);
> > +             }
> > +             dma_buf_put(ref->dmabuf);
> > +     } else if (shm->flags & TEE_SHM_POOL) {
> >               teedev->pool->ops->free(teedev->pool, shm);
> >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> >               int rc =3D teedev->desc->ops->shm_unregister(shm->ctx, sh=
m);
> > @@ -59,7 +74,7 @@ static void tee_shm_release(struct tee_device *teedev=
, struct tee_shm *shm)
> >
> >       teedev_ctx_put(shm->ctx);
> >
> > -     kfree(shm);
> > +     kfree(p);
> >
> >       tee_device_put(teedev);
> >  }
> > @@ -169,7 +184,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_c=
ontext *ctx, size_t size)
> >   * tee_client_invoke_func(). The memory allocated is later freed with =
a
> >   * call to tee_shm_free().
> >   *
> > - * @returns a pointer to 'struct tee_shm'
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on f=
ailure
> >   */
> >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size=
_t size)
> >  {
> > @@ -179,6 +194,91 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct te=
e_context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
> >
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> > +{
> > +     struct tee_shm_dmabuf_ref *ref;
> > +     int rc;
> > +
> > +     if (!tee_device_get(ctx->teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > +     if (!ref) {
> > +             rc =3D -ENOMEM;
> > +             goto err_put_tee;
> > +     }
> > +
> > +     refcount_set(&ref->shm.refcount, 1);
> > +     ref->shm.ctx =3D ctx;
> > +     ref->shm.id =3D -1;
> > +     ref->shm.flags =3D TEE_SHM_DMA_BUF;
> > +
> > +     ref->dmabuf =3D dma_buf_get(fd);
> > +     if (IS_ERR(ref->dmabuf)) {
> > +             rc =3D PTR_ERR(ref->dmabuf);
> > +             goto err_kfree_ref;
> > +     }
> > +
> > +     rc =3D tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
> > +                                       &ref->offset, &ref->shm,
> > +                                       &ref->parent_shm);
> > +     if (!rc)
> > +             goto out;
>
> One odd thing I find here, why do we bail out on success case here?
> Don't we need the DMA buffer attach and map APIs to be invoked on
> success case here?

No, because if tee_heap_update_from_dma_buf() succeeds, we know
everything we need about the buffer. Note that we're returning a valid
pointer below to indicate success.

Cheers,
Jens

>
> -Sumit
>
> > +     if (rc !=3D -EINVAL)
> > +             goto err_put_dmabuf;
> > +
> > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ctx->teedev->dev);
> > +     if (IS_ERR(ref->attach)) {
> > +             rc =3D PTR_ERR(ref->attach);
> > +             goto err_put_dmabuf;
> > +     }
> > +
> > +     ref->sgt =3D dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONA=
L);
> > +     if (IS_ERR(ref->sgt)) {
> > +             rc =3D PTR_ERR(ref->sgt);
> > +             goto err_detach;
> > +     }
> > +
> > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > +             rc =3D -EINVAL;
> > +             goto err_unmap_attachement;
> > +     }
> > +
> > +     ref->shm.paddr =3D page_to_phys(sg_page(ref->sgt->sgl));
> > +     ref->shm.size =3D ref->sgt->sgl->length;
> > +
> > +out:
> > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> > +                             1, 0, GFP_KERNEL);
> > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > +     if (ref->shm.id < 0) {
> > +             rc =3D ref->shm.id;
> > +             if (ref->attach)
> > +                     goto err_unmap_attachement;
> > +             goto err_put_dmabuf;
> > +     }
> > +
> > +     return &ref->shm;
> > +
> > +err_unmap_attachement:
> > +     dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL=
);
> > +err_detach:
> > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > +err_put_dmabuf:
> > +     dma_buf_put(ref->dmabuf);
> > +err_kfree_ref:
> > +     kfree(ref);
> > +err_put_tee:
> > +     teedev_ctx_put(ctx);
> > +     tee_device_put(ctx->teedev);
> > +
> > +     return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > +
> >  /**
> >   * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately s=
hared
> >   *                         kernel buffer
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index 22e03d897dc3..f17710196c4c 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -28,6 +28,7 @@
> >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in user space */
> >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool */
> >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver *=
/
> > +#define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-buf ha=
ndle */
> >
> >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> >  #define TEE_MAX_DEV_NAME_LEN         32
> > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > index a54c203000ed..824f1251de60 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct te=
e_context *ctx, size_t size);
> >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> >                                           void *addr, size_t length);
> >
> > +/**
> > + * tee_shm_register_fd() - Register shared memory from file descriptor
> > + *
> > + * @ctx:     Context that allocates the shared memory
> > + * @fd:              Shared memory file descriptor reference
> > + *
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on f=
ailure
> > + */
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> > +
> >  /**
> >   * tee_shm_free() - Free shared memory
> >   * @shm:     Handle to shared memory to free
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index d0430bee8292..d843cf980d98 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -378,6 +378,37 @@ struct tee_ioctl_shm_register_data {
> >       __s32 id;
> >  };
> >
> > +/**
> > + * struct tee_ioctl_shm_register_fd_data - Shared memory registering a=
rgument
> > + * @fd:              [in] File descriptor identifying dmabuf reference
> > + * @size:    [out] Size of referenced memory
> > + * @flags:   [in] Flags to/from allocation.
> > + * @id:              [out] Identifier of the shared memory
> > + *
> > + * The flags field should currently be zero as input. Updated by the c=
all
> > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD belo=
w.
> > + */
> > +struct tee_ioctl_shm_register_fd_data {
> > +     __s64 fd;
> > +     __u64 size;
> > +     __u32 flags;
> > +     __s32 id;
> > +};
> > +
> > +/**
> > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file desc=
riptor
> > + *
> > + * Returns a file descriptor on success or < 0 on failure
> > + *
> > + * The returned file descriptor refers to the shared memory object in =
the
> > + * kernel. The supplied file deccriptor can be closed if it's not need=
ed
> > + * for other purposes. The shared memory is freed when the descriptor =
is
> > + * closed.
> > + */
> > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE=
 + 8, \
> > +                                  struct tee_ioctl_shm_register_fd_dat=
a)
> > +
> >  /**
> >   * TEE_IOC_SHM_REGISTER - Register shared memory argument
> >   *
> > --
> > 2.43.0
> >

