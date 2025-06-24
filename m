Return-Path: <linux-media+bounces-35720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8296AE5E29
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 09:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D6E64041BD
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 07:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38A225A34B;
	Tue, 24 Jun 2025 07:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XbcMuy9Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4876D25A340
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750738; cv=none; b=ARoylSNAw0PHTCGm19q3uuc5CSQPk5uth0eNWDIt9uIMfHk2Rdekx981PpHVsEvHu5Ya86EjqRoaPT8sP3OtDffyrUDlmI/D9Wx0Xj5RlvcwRd2zva+ki7BvGzxwaJF6N1RILgeFgJs4h6ncxj1VQsZI5UVbBhN+HnzKvV+mDeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750738; c=relaxed/simple;
	bh=8fj/oUwMtTF2Mspr2mukXzNLf16c16beDBXK21JYaHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhWlw2aQhfugGikPg/Qzchji9wV8b9bfD9iu6Fp1mK+y2LytQj/Y9r3034lcekg7nQQrA16dVIK04ZZN0L6pJRbeZpqOuD0DRapSj7FakRBrvVdddMi7Rk5KxNIK8lIAIEEnzTMk5SFqIEiU5gXjxiEbHu0REa5mtHq/Kf0nGyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XbcMuy9Y; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6118c1775dbso26873eaf.1
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 00:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750750735; x=1751355535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/btdfiDxU5+NfLXwgveKgggXqAGO0bFMTRE67tAX7B4=;
        b=XbcMuy9YSJVccDAVAhk9TetnDSScMNfgYdHm+FJDdkVMbjI1ChS7W2G3Vu7LZ2EvRg
         wD5ypJwZlJbACUKSzd7UFr0fIaYesbRfqf56fqKxekyVpgtcmtDAJQmmJFVi1bTPqDYn
         JXrKLLxJ1ReaK1vi52x8XNi0tT7eklCftBCIIzY7lRXa4VLn2W2Swdr9rZ1HNDiVW1u+
         aAKdcmGYYkEJm0T0Gs3Gde9fMX71o2VIHyh+lhumoByLmrEB/XSV/OIJ2+2hfwpvfITO
         NIUQHngmS9EuroIMtqF7XmwCVd6BixXjldngXPUfMpWbwOqA8mjGnsw2JibRBOrGT0h+
         4uQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750735; x=1751355535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/btdfiDxU5+NfLXwgveKgggXqAGO0bFMTRE67tAX7B4=;
        b=Cw0bJYgau1sqKfZpgE7dqc40iT3Li4LdtYzTlbEaoLBZNEFTZuPxSbKkUhkjzrT7YX
         tGjkCX8nzsv/iWvFGryUBRae12mku8uB2vLDBjK70766CqMCS+6t+LoyUdD5BmDvOzsm
         kTuQTk3MydJf9F4+havg0bxN/wIbySJqt16QJiQmNsxZCeVK1RimDH+hRs7upzrv8ORi
         vOQgElryY+n8BobhnRuC9+X3umXFJW1tG0eTyCL9TdHyCUgTA54w4lbpJ33NeyB1lYw4
         XU1NbzDYF7UUc/Yuey5Ugob5KlU14nVChZNqkK6cVV8uCX+XPKUBdMp88FcFUviC6wdr
         iJUg==
X-Forwarded-Encrypted: i=1; AJvYcCWj2SS1XTw+KFcavv3elERKGYEOUpsxVTJUW9WPchVfhWHvVwDM22vdD+MgyLimDcJ6WJktQLRGprQHqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX4itAbxzq06mh5SXlJjgqmN8Np4CB96+OsFjThKwpfMt7jmwm
	lxX4xxt651qRCQdI1onamRqP9zcQT87VulCSp3YmUkPxYHpn9w33ZY7nCkfBb7q8jCxioC+L7Nt
	gk8bRtGhvT7uGweuI8NpJIzb/wD86EZgV/l9DWbsaWA==
X-Gm-Gg: ASbGncv7EcIt9wFPATHoUyVFMrw8NTaBxkRfa0DRpueYsO98Ai5Yn5AFqSwrlseFem0
	8tI64GF2bCgYB74N9N1CAnApDCPyWnutN8pd/Ctupcjwy3+BSUzePjyLGPWoRtk1YOr5A6b2Kad
	jv2dYLz8K4My8Sj2knxeOpGhP153kBKKqF9pPMIi1xHFzV
X-Google-Smtp-Source: AGHT+IFv5Vd9I2g8ShfadWNai4MGcPsTVNYM9JBJbAh0Rl83gxR175ZIBNF3BJDM4El7jyE4KTKddR9JG2+zTp5dAx4=
X-Received: by 2002:a05:6820:f08:b0:611:4042:bcfa with SMTP id
 006d021491bc7-6115ba3be83mr13813272eaf.6.1750750735187; Tue, 24 Jun 2025
 00:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-8-jens.wiklander@linaro.org> <2d93ee96-0c36-4651-b6ad-9fddd0f6ad88@oss.qualcomm.com>
In-Reply-To: <2d93ee96-0c36-4651-b6ad-9fddd0f6ad88@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 24 Jun 2025 09:38:43 +0200
X-Gm-Features: AX0GCFuM5JcuB2movGdmuDiMPV5NoYMd-NK6xp4w95s0PznpYBirMN1LlHfC1B8
Message-ID: <CAHUa44GXCVaShPhw_Yw0+CWovX+pi7=UOXXGr5dKKSXz4JppeA@mail.gmail.com>
Subject: Re: [PATCH v10 7/9] optee: support protected memory allocation
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amir,

On Tue, Jun 24, 2025 at 8:54=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi Jens,
>
> On 6/10/2025 11:13 PM, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver for protected memory
> > allocation. The support is limited to only the SMC ABI and for secure
> > video buffers.
> >
> > OP-TEE is probed for the range of protected physical memory and a
> > memory pool allocator is initialized if OP-TEE have support for such
> > memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/Kconfig         |  5 +++
> >  drivers/tee/optee/core.c          | 10 +++++
> >  drivers/tee/optee/optee_private.h |  2 +
> >  drivers/tee/optee/smc_abi.c       | 70 ++++++++++++++++++++++++++++++-
> >  4 files changed, 85 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> > index 7bb7990d0b07..50d2051f7f20 100644
> > --- a/drivers/tee/optee/Kconfig
> > +++ b/drivers/tee/optee/Kconfig
> > @@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
> >
> >         Additional documentation on kernel security risks are at
> >         Documentation/tee/op-tee.rst.
> > +
> > +config OPTEE_STATIC_PROTMEM_POOL
> > +     bool
> > +     depends on HAS_IOMEM && TEE_DMABUF_HEAPS
> > +     default y
> > diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> > index c75fddc83576..4b14a7ac56f9 100644
> > --- a/drivers/tee/optee/core.c
> > +++ b/drivers/tee/optee/core.c
> > @@ -56,6 +56,15 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf=
, unsigned long action,
> >       return 0;
> >  }
> >
> > +int optee_set_dma_mask(struct optee *optee, u_int pa_width)
> > +{
> > +     u64 mask =3D DMA_BIT_MASK(min(64, pa_width));
> > +
>
> nit: Why not dma_coerce_mask_and_coherent() instead of bellow?

Good point, I'll update in the next version.

Thanks,
Jens

>
> - Amir
>
> > +     optee->teedev->dev.dma_mask =3D &optee->teedev->dev.coherent_dma_=
mask;
> > +
> > +     return dma_set_mask_and_coherent(&optee->teedev->dev, mask);
> > +}
> > +
> >  static void optee_bus_scan(struct work_struct *work)
> >  {
> >       WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
> > @@ -181,6 +190,7 @@ void optee_remove_common(struct optee *optee)
> >       tee_device_unregister(optee->supp_teedev);
> >       tee_device_unregister(optee->teedev);
> >
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >       tee_shm_pool_free(optee->pool);
> >       optee_supp_uninit(&optee->supp);
> >       mutex_destroy(&optee->call_queue.mutex);
> > diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/opte=
e_private.h
> > index dc0f355ef72a..5e3c34802121 100644
> > --- a/drivers/tee/optee/optee_private.h
> > +++ b/drivers/tee/optee/optee_private.h
> > @@ -272,6 +272,8 @@ struct optee_call_ctx {
> >
> >  extern struct blocking_notifier_head optee_rpmb_intf_added;
> >
> > +int optee_set_dma_mask(struct optee *optee, u_int pa_width);
> > +
> >  int optee_notif_init(struct optee *optee, u_int max_key);
> >  void optee_notif_uninit(struct optee *optee);
> >  int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index f0c3ac1103bb..cf106d15e64e 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1584,6 +1584,68 @@ static inline int optee_load_fw(struct platform_=
device *pdev,
> >  }
> >  #endif
> >
> > +static struct tee_protmem_pool *static_protmem_pool_init(struct optee =
*optee)
> > +{
> > +#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
> > +     union {
> > +             struct arm_smccc_res smccc;
> > +             struct optee_smc_get_protmem_config_result result;
> > +     } res;
> > +     struct tee_protmem_pool *pool;
> > +     void *p;
> > +     int rc;
> > +
> > +     optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
> > +                          0, 0, 0, &res.smccc);
> > +     if (res.result.status !=3D OPTEE_SMC_RETURN_OK)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     rc =3D optee_set_dma_mask(optee, res.result.pa_width);
> > +     if (rc)
> > +             return ERR_PTR(rc);
> > +
> > +     /*
> > +      * Map the memory as uncached to make sure the kernel can work wi=
th
> > +      * __pfn_to_page() and friends since that's needed when passing t=
he
> > +      * protected DMA-buf to a device. The memory should otherwise not
> > +      * be touched by the kernel since it's likely to cause an externa=
l
> > +      * abort due to the protection status.
> > +      */
> > +     p =3D devm_memremap(&optee->teedev->dev, res.result.start,
> > +                       res.result.size, MEMREMAP_WC);
> > +     if (IS_ERR(p))
> > +             return p;
> > +
> > +     pool =3D tee_protmem_static_pool_alloc(res.result.start, res.resu=
lt.size);
> > +     if (IS_ERR(pool))
> > +             devm_memunmap(&optee->teedev->dev, p);
> > +
> > +     return pool;
> > +#else
> > +     return ERR_PTR(-EINVAL);
> > +#endif
> > +}
> > +
> > +static int optee_protmem_pool_init(struct optee *optee)
> > +{
> > +     enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_protmem_pool *pool =3D ERR_PTR(-EINVAL);
> > +     int rc;
> > +
> > +     if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
> > +             return 0;
> > +
> > +     pool =3D static_protmem_pool_init(optee);
> > +     if (IS_ERR(pool))
> > +             return PTR_ERR(pool);
> > +
> > +     rc =3D tee_device_register_dma_heap(optee->teedev, heap_id, pool)=
;
> > +     if (rc)
> > +             pool->ops->destroy_pool(pool);
> > +
> > +     return rc;
> > +}
> > +
> >  static int optee_probe(struct platform_device *pdev)
> >  {
> >       optee_invoke_fn *invoke_fn;
> > @@ -1679,7 +1741,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
> >       if (!optee) {
> >               rc =3D -ENOMEM;
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >
> >       optee->ops =3D &optee_ops;
> > @@ -1752,6 +1814,9 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > +     if (optee_protmem_pool_init(optee))
> > +             pr_info("Protected memory service not available\n");
> > +
> >       /*
> >        * Ensure that there are no pre-existing shm objects before enabl=
ing
> >        * the shm cache so that there's no chance of receiving an invali=
d
> > @@ -1787,6 +1852,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               optee_disable_shm_cache(optee);
> >       optee_smc_notif_uninit_irq(optee);
> >       optee_unregister_devices();
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >  err_notif_uninit:
> >       optee_notif_uninit(optee);
> >  err_close_ctx:
> > @@ -1803,7 +1869,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       tee_device_unregister(optee->teedev);
> >  err_free_optee:
> >       kfree(optee);
> > -err_free_pool:
> > +err_free_shm_pool:
> >       tee_shm_pool_free(pool);
> >       if (memremaped_shm)
> >               memunmap(memremaped_shm);
>

