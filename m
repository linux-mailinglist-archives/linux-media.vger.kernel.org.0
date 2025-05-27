Return-Path: <linux-media+bounces-33470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E7AC50F2
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 16:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB31F1BA10B7
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5769A27814A;
	Tue, 27 May 2025 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0+NSg1j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B20B2AE99
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356386; cv=none; b=kxhODAfPtwUhmzlhcQFtspdXj61LmLZhuAUdvYi0keoGAGvQvuIIP8GxxdKtlszII1mVnKOCxX/DT18KVCGXah1foPaRCgdSNczJ68AqSrHMD6k58XxsRYmIYV1DyGUH/z5RmnD4pHZR+Uu8mu4AgX2VvtvOhjZUwBWqRvU+7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356386; c=relaxed/simple;
	bh=s+3Vk9WFAT05g8lRaeeDQOJGk6XsJsn5lqXjRugeDIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0aB8YYnE0bC7MYzmWd25DbiLtcXflcAI84ZvoMVRfsrKnifsDwHMvlE+Ch14lXmyn6f5kz0rXbVPsgY3N9sV5jl02E2e7mOA3MLEQ24QWGUssKwJqK6UsAE50fTi3L6zt3IeNxYkhFINk3lLGoef1S6DajJoCH/jtIn6M8umvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z0+NSg1j; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3114560d74aso2292272a91.0
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748356384; x=1748961184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRDZ/LCrpqxKUX7yBP1lPoeGMYrX58ozdV1M2xTcqr0=;
        b=z0+NSg1jHjYzE2u6/GSM4OU/JT/LBJDw8n5r9h0hnMs8ukI6le8mKOnCcCgk/Rggih
         4eNZAAEVWtDeeUtZYgLELCmys1XWh3uVkcCeXMNPByICQOkdTr9qfewO0bEy5320Yb26
         Hhbo90crxmvsfYg6ulQlZPYNLrBK2U8/+0b76rQXlgyUa4Z0PrDRUQyIAD0FH+4Qytyz
         L4xyRb9ARBFgmGqwYqlYfgdrQTOGRWS7ITiSQoM/tKI01vpQsjIvrTBVX4aaJsjxpLs1
         4MWKRtQMsy2fuCrQRWX25bdvK3SoFfuaeOEyR/RjqPOi08ReXlJtj6JHg6nLhC3EkzWO
         d4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748356384; x=1748961184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRDZ/LCrpqxKUX7yBP1lPoeGMYrX58ozdV1M2xTcqr0=;
        b=qFQyhjuVrSi6R1AAre5ev/DgVB11ZBVFg2NiDp1JqXUkxl8Ek5dMN8JjmQ30pkYLOV
         8T0/wbDDs8kB3dF+EGujoAJc1EUiaVQQvqG3oNcSOnsPkR8OSLcB7dMqA/AAjWD+ticz
         0/O+o3PgUwqJ3YXjEIg65UURl9jFykJmrc+B7yDWzmWbx2Ima4xt7gOHoYJ43y3dSZum
         VsO9WaH3kPe32rAANiuvvgZCXEf1FttG+9QQGOFD0acI4anohicIoWYUYkbKtTb9O/RZ
         3mHhm18KRozBAi9jKQjSg860igNcAJnMtHfHVrFNPEcICwGlYkqbU4GNdVhchnFt6qlt
         O8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Q71poTF6qWLYkR8x9g7lLd3vZUekCZFcD9fHZKaFlJ+cM9T3CB9klYpl9TBx8daDWHwRYSs6BJxd3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+A95bV10/MeKsKZ8KxrWC9F1N/MAmcpUNrN2VrC3sLZU9Pd0E
	+f06NrH7Sxf5QPboapD30IdZwqOcvtsxyDAvONAxd3XlaMkuD/vq0ytWsltDSHCgb6hHGLuKBW5
	4j/kXjPVXshFvC58K5s40DTvpg8RXLMvaOXYSPrEDNM27y29wEylY
X-Gm-Gg: ASbGncuXz+eBZQ/XR86miuGZOv7ZOwVZPABRIbJ2exmcKpGFLOha2r7zz+VlqzphRJG
	sjM6yRCaYph+92IUdf57Lh+W0flfbNxPvCc6Xr2j1C/L6Veq3D8F9VTzm9qNqAuYrMqapdvjrX1
	vLa59xe25KPy5rAN5YIqTx0/U0VJMR4BdmPw==
X-Google-Smtp-Source: AGHT+IG+kMuaBsaWSffxs+4dopBi6c2UidFw8vqj94comKMts1HGzvEPJpkPt4sT0Oi5flOvsO/w4xlAVEH4ZILhoBI=
X-Received: by 2002:a05:6808:6c93:b0:403:35ba:f91a with SMTP id
 5614622812f47-406468ba8c7mr7824256b6e.34.1748356373410; Tue, 27 May 2025
 07:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-8-jens.wiklander@linaro.org> <aDQZN-frPnr1_N5I@sumit-X1>
In-Reply-To: <aDQZN-frPnr1_N5I@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 16:32:42 +0200
X-Gm-Features: AX0GCFtCRIMnpa06u8yxs_HtV-u6PU01-LbWY3-lo5Z1TuKmqqUniPvzQcB1mdY
Message-ID: <CAHUa44FHav67VAQK7o-S3Xhx-j_VypAX9Ya0dATty7RhdCbgJA@mail.gmail.com>
Subject: Re: [PATCH v9 7/9] optee: support protected memory allocation
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 9:33=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 05:16:50PM +0200, Jens Wiklander wrote:
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
> >  drivers/tee/optee/core.c          | 10 +++++++
> >  drivers/tee/optee/optee_private.h |  2 ++
> >  drivers/tee/optee/smc_abi.c       | 45 +++++++++++++++++++++++++++++--
> >  3 files changed, 55 insertions(+), 2 deletions(-)
> >
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
> > index f0c3ac1103bb..f3cae8243785 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1584,6 +1584,42 @@ static inline int optee_load_fw(struct platform_=
device *pdev,
> >  }
> >  #endif
> >
> > +static int optee_protmem_pool_init(struct optee *optee)
> > +{
> > +     enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_protmem_pool *pool;
> > +     int rc;
> > +
> > +     if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
> > +             union {
> > +                     struct arm_smccc_res smccc;
> > +                     struct optee_smc_get_protmem_config_result result=
;
> > +             } res;
> > +
> > +             optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, =
0, 0,
> > +                                  0, 0, 0, &res.smccc);
> > +             if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
> > +                     pr_err("Secure Data Path service not available\n"=
);
> > +                     return 0;
> > +             }
> > +             rc =3D optee_set_dma_mask(optee, res.result.pa_width);
> > +             if (!rc)
> > +                     pool =3D tee_protmem_static_pool_alloc(res.result=
.start,
> > +                                                          res.result.s=
ize);
> > +             if (IS_ERR(pool))
> > +                     return PTR_ERR(pool);
> > +
> > +             rc =3D tee_device_register_dma_heap(optee->teedev, heap_i=
d, pool);
> > +             if (rc)
> > +                     goto err;
> > +     }
> > +
> > +     return 0;
> > +err:
> > +     pool->ops->destroy_pool(pool);
> > +     return rc;
> > +}
> > +
> >  static int optee_probe(struct platform_device *pdev)
> >  {
> >       optee_invoke_fn *invoke_fn;
> > @@ -1679,7 +1715,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
> >       if (!optee) {
> >               rc =3D -ENOMEM;
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >
> >       optee->ops =3D &optee_ops;
> > @@ -1752,6 +1788,10 @@ static int optee_probe(struct platform_device *p=
dev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > +     rc =3D optee_protmem_pool_init(optee);
>
> Here we should do a Kconfig check for CONFIG_DMABUF_HEAPS so that we
> don't proceed any further with initialization.

Why? If OP-TEE is configured for protected memory but the kernel
isn't, something isn't right, and a print could be useful.

Cheers,
Jens

>
> Rest looks good to me.
>
> -Sumit
>
> > +     if (rc)
> > +             goto err_notif_uninit;
> > +
> >       /*
> >        * Ensure that there are no pre-existing shm objects before enabl=
ing
> >        * the shm cache so that there's no chance of receiving an invali=
d
> > @@ -1787,6 +1827,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               optee_disable_shm_cache(optee);
> >       optee_smc_notif_uninit_irq(optee);
> >       optee_unregister_devices();
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >  err_notif_uninit:
> >       optee_notif_uninit(optee);
> >  err_close_ctx:
> > @@ -1803,7 +1844,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       tee_device_unregister(optee->teedev);
> >  err_free_optee:
> >       kfree(optee);
> > -err_free_pool:
> > +err_free_shm_pool:
> >       tee_shm_pool_free(pool);
> >       if (memremaped_shm)
> >               memunmap(memremaped_shm);
> > --
> > 2.43.0
> >

