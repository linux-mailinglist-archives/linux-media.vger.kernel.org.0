Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53CE15911E4
	for <lists+linux-media@lfdr.de>; Fri, 12 Aug 2022 16:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239069AbiHLOGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Aug 2022 10:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239057AbiHLOGu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Aug 2022 10:06:50 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E128688E
        for <linux-media@vger.kernel.org>; Fri, 12 Aug 2022 07:06:48 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id e205so1436074ybb.2
        for <linux-media@vger.kernel.org>; Fri, 12 Aug 2022 07:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=pSu8Kjm/fihhCIXfYC+CuIWh9/DlaOL8dRMg2tu64OM=;
        b=A9lPY5LCR1TYRw7DkPGkLdvuq2g7Gfy3fQuRdekHGzE8c6lvXfu37807KQcdLUtEsc
         kJsMHthWtfSon7x27RlQ/yd7nQeshaRNTLmeMPKxerD6u3QqE7nUTPZsInGFEUCG4Kgb
         08cxjUg8hXceyjnbv5ReHWr3idkmW1kK7J8RzU4AE1n6vmrsK4Tf9D0Xc/Cr6y3NpYLP
         OlDHPFXXzl8v8U/8UTNu5+KmtTKUVx45w7jswvhlr/J41C6rsgpN033x7k6RGrzW+36F
         pJcFQhdEv+Cb/j8fvpZgDtKIPvZ3e7elyw/K62dNjwj+QZ2H5glkDkojXlgxzDyg5A+P
         Ek3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=pSu8Kjm/fihhCIXfYC+CuIWh9/DlaOL8dRMg2tu64OM=;
        b=N3usXQY1R61cyL64CuX+f/B2WCmn+rTDF4yy1CRKbazD9eJS3YBJSHSNPOryFoz0wS
         S8fnjJY20Ror5DarYAfIQNCC9io6fLOriACfs5vIbMnyZqRMVDQu3JJlzpHA9Rkc7xmG
         1okZFu4o2U94q+KIQZynd/Y3a5M14QetW68Opw0NOFHWVdkCcOhR8+GHnUbhpWirzlZ8
         2/vQyBHE9rZ4K5kD6cPLdOA6wXYjSY97RX2ekIJRmQIruAhW0ojgkaYrQag6NN1aC22a
         Ir0HvOoaXaijEgTxA4HLbhzPaY9161TIYx3W5nfqETL8xPtmieAHnES5xF9/YHeVwN4d
         F88g==
X-Gm-Message-State: ACgBeo0IqRkbn0Z5yInByhYtodBFyV+IyjYAgYe+Zb6k3hcDjKNRSCcL
        lfPWBNyW+v/KEeq7M2AW2bImyWlJBCEZqDdJGPH+8Q==
X-Google-Smtp-Source: AA6agR6dvCSD7HujjdFoq8w/6KGzzI0CIw9QzucT95PolYphZEEa4kOh3CWiPNVv74C1yw42HoxRjrY2+sz68gBV0Pg=
X-Received: by 2002:a25:4e07:0:b0:67c:1b3e:9fb6 with SMTP id
 c7-20020a254e07000000b0067c1b3e9fb6mr3487602ybb.549.1660313207266; Fri, 12
 Aug 2022 07:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220811135637.6332-1-olivier.masse@nxp.com> <20220811135637.6332-2-olivier.masse@nxp.com>
In-Reply-To: <20220811135637.6332-2-olivier.masse@nxp.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Fri, 12 Aug 2022 19:36:36 +0530
Message-ID: <CAFA6WYOKW8=HQbWRRZfvYXXyzN6wov3KLmUiBCFzxz8=+tpenQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tee: new ioctl to a register tee_shm from a dmabuf
 file descriptor
To:     Olivier Masse <olivier.masse@nxp.com>
Cc:     jens.wiklander@linaro.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, op-tee@lists.trustedfirmware.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        clement.faure@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Olivier,

On Thu, 11 Aug 2022 at 19:26, Olivier Masse <olivier.masse@nxp.com> wrote:
>
> From: Etienne Carriere <etienne.carriere@linaro.org>
>
> This change allows userland to create a tee_shm object that refers
> to a dmabuf reference.
>
> Userland provides a dmabuf file descriptor as buffer reference.
> The created tee_shm object exported as a brand new dmabuf reference
> used to provide a clean fd to userland. Userland shall closed this new
> fd to release the tee_shm object resources. The initial dmabuf resources
> are tracked independently through original dmabuf file descriptor.
>
> Once the buffer is registered and until it is released, TEE driver
> keeps a refcount on the registered dmabuf structure.
>
> This change only support dmabuf references that relates to physically
> contiguous memory buffers.

What limits you to extend this feature to non-contiguous memory
buffers? I believe that should be possible with OP-TEE dynamic shared
memory which gives you the granularity to register a list of pages.

-Sumit

>
> New tee_shm flag to identify tee_shm objects built from a registered
> dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged with
> TEE_SHM_EXT_DMA_BUF.
>
> Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> From: https://github.com/linaro-swg/linux.git
> (cherry picked from commit 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> ---
>  drivers/tee/tee_core.c   | 38 +++++++++++++++
>  drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
>  include/linux/tee_drv.h  | 11 +++++
>  include/uapi/linux/tee.h | 29 ++++++++++++
>  4 files changed, 175 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 8aa1a4836b92..7c45cbf85eb9 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
>         return ret;
>  }
>
> +static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
> +                                    struct tee_ioctl_shm_register_fd_data __user *udata)
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
> +       shm = tee_shm_register_fd(ctx, data.fd);
> +       if (IS_ERR(shm))
> +               return -EINVAL;
> +
> +       data.id = shm->id;
> +       data.flags = shm->flags;
> +       data.size = shm->size;
> +
> +       if (copy_to_user(udata, &data, sizeof(data)))
> +               ret = -EFAULT;
> +       else
> +               ret = tee_shm_get_fd(shm);
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
>  static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>                             size_t num_params,
>                             struct tee_ioctl_param __user *uparams)
> @@ -829,6 +865,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>                 return tee_ioctl_shm_alloc(ctx, uarg);
>         case TEE_IOC_SHM_REGISTER:
>                 return tee_ioctl_shm_register(ctx, uarg);
> +       case TEE_IOC_SHM_REGISTER_FD:
> +               return tee_ioctl_shm_register_fd(ctx, uarg);
>         case TEE_IOC_OPEN_SESSION:
>                 return tee_ioctl_open_session(ctx, uarg);
>         case TEE_IOC_INVOKE:
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 836872467dc6..55a3fbbb022e 100644
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
> @@ -12,6 +13,14 @@
>  #include <linux/uio.h>
>  #include "tee_private.h"
>
> +/* extra references appended to shm object for registered shared memory */
> +struct tee_shm_dmabuf_ref {
> +     struct tee_shm shm;
> +     struct dma_buf *dmabuf;
> +     struct dma_buf_attachment *attach;
> +     struct sg_table *sgt;
> +};
> +
>  static void shm_put_kernel_pages(struct page **pages, size_t page_count)
>  {
>         size_t n;
> @@ -71,7 +80,16 @@ static void release_registered_pages(struct tee_shm *shm)
>
>  static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>  {
> -       if (shm->flags & TEE_SHM_POOL) {
> +       if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> +               struct tee_shm_dmabuf_ref *ref;
> +
> +               ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> +               dma_buf_unmap_attachment(ref->attach, ref->sgt,
> +                                        DMA_BIDIRECTIONAL);
> +
> +               dma_buf_detach(ref->dmabuf, ref->attach);
> +               dma_buf_put(ref->dmabuf);
> +       } else if (shm->flags & TEE_SHM_POOL) {
>                 teedev->pool->ops->free(teedev->pool, shm);
>         } else if (shm->flags & TEE_SHM_DYNAMIC) {
>                 int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
> @@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size)
>   * tee_client_invoke_func(). The memory allocated is later freed with a
>   * call to tee_shm_free().
>   *
> - * @returns a pointer to 'struct tee_shm'
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
>   */
>  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
>  {
> @@ -229,6 +247,83 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
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
> +       ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> +       if (!ref) {
> +               rc = -ENOMEM;
> +               goto err_put_tee;
> +       }
> +
> +       refcount_set(&ref->shm.refcount, 1);
> +       ref->shm.ctx = ctx;
> +       ref->shm.id = -1;
> +
> +       ref->dmabuf = dma_buf_get(fd);
> +       if (IS_ERR(ref->dmabuf)) {
> +               rc = PTR_ERR(ref->dmabuf);
> +               goto err_put_dmabuf;
> +       }
> +
> +       ref->attach = dma_buf_attach(ref->dmabuf, &ref->shm.ctx->teedev->dev);
> +       if (IS_ERR(ref->attach)) {
> +               rc = PTR_ERR(ref->attach);
> +               goto err_detach;
> +       }
> +
> +       ref->sgt = dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONAL);
> +       if (IS_ERR(ref->sgt)) {
> +               rc = PTR_ERR(ref->sgt);
> +               goto err_unmap_attachement;
> +       }
> +
> +       if (sg_nents(ref->sgt->sgl) != 1) {
> +               rc = PTR_ERR(ref->sgt->sgl);
> +               goto err_unmap_attachement;
> +       }
> +
> +       ref->shm.paddr = sg_dma_address(ref->sgt->sgl);
> +       ref->shm.size = sg_dma_len(ref->sgt->sgl);
> +       ref->shm.flags = TEE_SHM_EXT_DMA_BUF;
> +
> +       mutex_lock(&ref->shm.ctx->teedev->mutex);
> +       ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> +                               1, 0, GFP_KERNEL);
> +       mutex_unlock(&ref->shm.ctx->teedev->mutex);
> +       if (ref->shm.id < 0) {
> +               rc = ref->shm.id;
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
> +       dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL);
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
>  static struct tee_shm *
>  register_shm_helper(struct tee_context *ctx, unsigned long addr,
>                     size_t length, u32 flags, int id)
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index 911cad324acc..40ddd5376c2d 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -25,6 +25,7 @@
>  #define TEE_SHM_USER_MAPPED    BIT(1)  /* Memory mapped in user space */
>  #define TEE_SHM_POOL           BIT(2)  /* Memory allocated from pool */
>  #define TEE_SHM_PRIV           BIT(3)  /* Memory private to TEE driver */
> +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf handle */
>
>  struct device;
>  struct tee_device;
> @@ -276,6 +277,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
>  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
>                                             void *addr, size_t length);
>
> +/**
> + * tee_shm_register_fd() - Register shared memory from file descriptor
> + *
> + * @ctx:       Context that allocates the shared memory
> + * @fd:                Shared memory file descriptor reference
> + *
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
> + */
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> +
>  /**
>   * tee_shm_is_dynamic() - Check if shared memory object is of the dynamic kind
>   * @shm:       Shared memory handle
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 25a6c534beb1..6f84060ad005 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
>  #define TEE_IOC_SHM_ALLOC      _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, \
>                                      struct tee_ioctl_shm_alloc_data)
>
> +/**
> + * struct tee_ioctl_shm_register_fd_data - Shared memory registering argument
> + * @fd:                [in] File descriptor identifying the shared memory
> + * @size:      [out] Size of shared memory to allocate
> + * @flags:     [in] Flags to/from allocation.
> + * @id:                [out] Identifier of the shared memory
> + *
> + * The flags field should currently be zero as input. Updated by the call
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
> + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file descriptor
> + *
> + * Returns a file descriptor on success or < 0 on failure
> + *
> + * The returned file descriptor refers to the shared memory object in kernel
> + * land. The shared memory is freed when the descriptor is closed.
> + */
> +#define TEE_IOC_SHM_REGISTER_FD        _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 8, \
> +                                    struct tee_ioctl_shm_register_fd_data)
> +
>  /**
>   * struct tee_ioctl_buf_data - Variable sized buffer
>   * @buf_ptr:   [in] A __user pointer to a buffer
> --
> 2.25.0
>
