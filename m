Return-Path: <linux-media+bounces-28717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F3A702ED
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 14:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D9407A3EB1
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 13:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A96C258CFA;
	Tue, 25 Mar 2025 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2d+gLWk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED87A1DBB13
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910947; cv=none; b=adbgzUXskKUxW6ELrQSk9AkZzXWMTePFy/vYyM6Mw2QbTT4OIL17xk2loIv1/WJXvoGloKyal91Ue3x7gZMdO8sp9pOlm6uSxmGgTwp9Dwy7TJy/o1XMJYTbkAzUA3J/K0dPtAewCS1ImvUSAandqY+KEloITfbTZSDOLjqp7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910947; c=relaxed/simple;
	bh=Xo2iU9kz5ZfSUKvwoiTyRsIWDgU8IAHazUbpND4gTAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmdYVWx1+aPBtgVpRjQiCxTnCK4Ep+k+AQxLAZQNmhi3M8ln2kt+npnG1njGKSVK2pHiB5wVh8ZcTiQAQqUBvghmxM/7Gs9RvMVhf+lvsXrAfj6IVz6UqqeO7NatEdPJDDxEh9oc3h9ZcaDSdvqi34tyQwR39UXLkyYHxECNLy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2d+gLWk; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2b2b6019a74so2799323fac.0
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742910944; x=1743515744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfXW1tINyjybFH59i2/tceSOuMsWCGxf0dWvSOQSE9Q=;
        b=C2d+gLWk22FLZ8ZVj8d1UndfkHSdlMSq7NycPwbOQ4vVkRQNh7us1PYmBdugOXnZox
         yXAUWLotljI1Kip5ido+6/pdWWFYsW6aKPWXPMYb1ik5Td34BwibBeSEVSAuq7CNcv7g
         8nWVUg2iOD6AMevche/2rVhEYe5ThJSj0OKCm7D1a33i4ZACN24Be3+MFhr57RVFr/0Y
         PSQNY2JhuQfLdF85DUIc8x5jDFhrTyxFv1i83bGETZbUj24bD5tnUUm37MM1Ta1uhxj5
         e99daG2CyyhO4kghQCTsqzQb2wH0hrj7i1tl9j3bnWOGJwYJKnALBIfq+YbAN8rqaC0l
         6R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910944; x=1743515744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfXW1tINyjybFH59i2/tceSOuMsWCGxf0dWvSOQSE9Q=;
        b=sB9mUGACN04zTMy7nYXZf9lNuyB2LrygQq/8z74CU5YVUBkE6vTb/EfGETvF55Ygqu
         /KmA4xcf9Ez0Sn1UiRWA1fmcaHwsTwka2TxHjwbk6Ip1MZWn8wZpNVj5lJABnDzSkwvX
         F22D3enjv4xqPpfaejJpSHtXiwMimV4wWtOh3+ydH9JQYxHUjvV72C7HNR3trdqlzIC9
         WBeqCWv8ENHm4IBCWUi2Joj4vE/8Xwmf9Od7g4ZDhZurmvlhIxTmyk6lgg+6sl+eHNeH
         um/UIphUj4zAJ4os/1KGCGlsUwjUXVrZ2LD4ljI9/RgzHQ3TtNxTMGkrnHLuMVMju7QO
         4xOA==
X-Forwarded-Encrypted: i=1; AJvYcCWG0lu6OzQzZ+jDFiCn4jpTWuMAy0B2mhlcIeZrX2QX7H22e71bNUlEEK6+QVU40ul25stXBDXSG1M4Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE3dXDxmG7u6YXGfOrEocZ4YdgPP3DUY44vzYFgTpw/1YPVyDa
	2wQaIbBUaYvsgCTMwsZWByxsxyriiCNWGt1ARs+M9K95anRsuTAJllGux4ShysI109Y1FEqadRl
	O3uwTmbsHYzD8RcadmcV5id4Ai+h7i4OE88uhfg==
X-Gm-Gg: ASbGncsbxrxnQLLReCV9DHtN0Nf8WAfRGyZrPM7ltDTSOpmCag8Jo/74nnvo9DN8kuF
	ZAxgjDRPPm7aLqVd53Iu6wipB84ex7QXTIomCMkAH9ktRKlMSoLCt61eJzAJtqDGPQiaBvMR1Jy
	kQv6Z8EQBK0zhceUU4anZLjYctrSs=
X-Google-Smtp-Source: AGHT+IEwBPPwUVoRos1sVNedvDmYTl2oPMhg6qa7EWRFlVhYT0/1fPMMFcZLaxlXCLhryoazT9mEtzOs9FsiBb8tVPo=
X-Received: by 2002:a05:6870:f80b:b0:296:bbc8:4a82 with SMTP id
 586e51a60fabf-2c780495379mr12124356fac.27.1742910943713; Tue, 25 Mar 2025
 06:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-9-jens.wiklander@linaro.org> <Z-JWIyd8cKyXQR0H@sumit-X1>
In-Reply-To: <Z-JWIyd8cKyXQR0H@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 14:55:32 +0100
X-Gm-Features: AQ5f1Jp3D7eSeWP8gWeTN_I1pHWpPzOxKysZVMBSQkU1nox7ff2kFajLYyiQcek
Message-ID: <CAHUa44FXjG1hC9v18Yx1ENPX_Bc9sZW1Z2=+m6+KUsxPMvDE+w@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] optee: support restricted memory allocation
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
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 8:07=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Wed, Mar 05, 2025 at 02:04:14PM +0100, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver for restricted memory
> > allocation. The support is limited to only the SMC ABI and for secure
> > video buffers.
> >
> > OP-TEE is probed for the range of restricted physical memory and a
> > memory pool allocator is initialized if OP-TEE have support for such
> > memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/core.c    |  1 +
> >  drivers/tee/optee/smc_abi.c | 44 +++++++++++++++++++++++++++++++++++--
> >  2 files changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> > index c75fddc83576..c7fd8040480e 100644
> > --- a/drivers/tee/optee/core.c
> > +++ b/drivers/tee/optee/core.c
> > @@ -181,6 +181,7 @@ void optee_remove_common(struct optee *optee)
> >       tee_device_unregister(optee->supp_teedev);
> >       tee_device_unregister(optee->teedev);
> >
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >       tee_shm_pool_free(optee->pool);
> >       optee_supp_uninit(&optee->supp);
> >       mutex_destroy(&optee->call_queue.mutex);
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index cfdae266548b..a14ff0b7d3b3 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_=
device *pdev,
> >  }
> >  #endif
> >
> > +static int optee_sdp_pool_init(struct optee *optee)
> > +{
> > +     enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_rstmem_pool *pool;
> > +     int rc;
> > +
> > +     if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
>
> Is this SDP capability an ABI yet since we haven't supported it in
> upstream kernel? If no then can we rename it as
> OPTEE_SMC_SEC_CAP_RSTMEM?

No problem. We can rename it.

>
> > +             union {
> > +                     struct arm_smccc_res smccc;
> > +                     struct optee_smc_get_sdp_config_result result;
> > +             } res;
> > +
> > +             optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0=
, 0, 0,
> > +                                  0, &res.smccc);
> > +             if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
> > +                     pr_err("Secure Data Path service not available\n"=
);
> > +                     return 0;
> > +             }
> > +
> > +             pool =3D tee_rstmem_static_pool_alloc(res.result.start,
> > +                                                 res.result.size);
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
> > @@ -1715,7 +1750,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
> >       if (!optee) {
> >               rc =3D -ENOMEM;
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >
> >       optee->ops =3D &optee_ops;
> > @@ -1788,6 +1823,10 @@ static int optee_probe(struct platform_device *p=
dev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > +     rc =3D optee_sdp_pool_init(optee);
>
> s/optee_sdp_pool_init/optee_rstmem_pool_init/

OK

Cheers,
Jens

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
> > @@ -1823,6 +1862,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               optee_disable_shm_cache(optee);
> >       optee_smc_notif_uninit_irq(optee);
> >       optee_unregister_devices();
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >  err_notif_uninit:
> >       optee_notif_uninit(optee);
> >  err_close_ctx:
> > @@ -1839,7 +1879,7 @@ static int optee_probe(struct platform_device *pd=
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

