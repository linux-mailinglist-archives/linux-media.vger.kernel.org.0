Return-Path: <linux-media+bounces-33476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2012EAC511E
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 16:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACD391BA1829
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9782797B4;
	Tue, 27 May 2025 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNWhymBY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ECF3209
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357039; cv=none; b=PvTJzTKkmBc3OYstRs3MQjQDMSrPo3/jICJpkXRKmKXEN+KBOu72XCE/jKvHWUEjrNi2xUcGFHkEHFrYWt7mDWN2GWhnrQh1FQDxuVlY6ophSjVeHiyE9qEPzX+m84TdMaIVNijd1OK2YveIAGJBbtbdkfZdtz5wxpoWBh6fMdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357039; c=relaxed/simple;
	bh=NcHpXxTOV7lxe0Br6GDtv1Xwjlkejzd3tO8+v713i8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QegTJdTpWDIbKmcXqo7E0o4HjaI1OxqUo+dOwj/SIbsekNXjQfXOv6hJBKT9tqKNbCIlkWxsBu8QgTOJesofiys1uVy3vB5ft7TzuhzGYOD/N+vU/VQtpb9L+78/Ia7J4GaLZoerOBIE1dQrV58vEYhmwFB6+pkqIy1LWm/2QU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNWhymBY; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f94b7bd964so1977097b6e.1
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748357037; x=1748961837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95DgJLZjEvQybIlPP+VCo5ApfOw6ewx9PjK94wls/Kk=;
        b=RNWhymBY7M2CBFav0CuXizK8wVg8Z2WWKxHJwO91F0Mptl8i2rzWTthJD5n/w1QMTi
         wb7n9TtlMSKwLqc/wShGZ3B9Nk4Rs94/O2GZjjytkZ3PaT1rOco00jueDrNmsf0lyO+N
         S2a/oNKqkp/5AGCL8heTJlLa0QwEfPGeZoblz1GKL+otamSZvaS8lxvDwBIW6O1TBglJ
         EyRcD+jVC5Zbwhwz6ikg3A1E4HGrqr6Fo31yDyWzbgVF0FSW8bwC5VosFUgS3XFFKSQg
         vTckSkqMUogxyOEbOLI597u9l1avmtxMVYeu8iWfuv3w7ZQdscM3DhEC/X0PHggcdU3S
         4trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748357037; x=1748961837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95DgJLZjEvQybIlPP+VCo5ApfOw6ewx9PjK94wls/Kk=;
        b=Y3X9xDV2SMMRpdgTk2zdGVdsQpwbN2IRwp9Ju/bBVRDZ1WdDQczHkzJFXREuDoSsfH
         TKwMliezJuA/td+l7/F+UuGpejOOII6QRmacoEPdnH8Ky28+iX7vLVWtQYiJTP16UczK
         kEwhj5nMykE536MZGLNA5HGQ5fdLX+KPbZQsLxNPTZgLNGslp5UWtI1mXI2YVAyRWV8E
         2ngWBKoekwBJskL4UQgwEYZpPM0tXKnvNqsul8HhLmUqnrGFO6tDQjeSG9119R8PvYp/
         3N4h4kHMkwWaGFdMNik5Bm+LmEGPmWIFSzi/1UV7XwIArtZgJupsSpKcaPExy7LdlwGy
         ixdw==
X-Forwarded-Encrypted: i=1; AJvYcCWy9xb+xpvIesUeBk5l8omueOkTZ15S6uKkN/1YRuDMhBCgRYNUfPPztvd/d4WvHu8wvGOd8yfucYWgyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPWFJKgARGMdf6EEh9oAQwOP6DwW7kgeviU9iuVBFciKLRUZm
	2er2nxTsQ8i5I3o79x1Fgqn7tC6OdpP61yGZkr1IO6r5ekYi8EToNfsezL7MuLXV8W5NJETEzmR
	hSfWoM9+f5lfqs08dNrmCRh42Qt9G0a5nRLNy4rscMg==
X-Gm-Gg: ASbGncuYeNn2U1dumuTZo7MRbE4KOLNLscVCV05fCXV+coKwvkjwXuYb56VwkBHXgC9
	qXEHwgPKzezRUnMpkYQ53GgIRQqlIedRj5FseTg0Wrvw84H1qRQ/R5/3ckVPJJLrc+WTEvHUclL
	r77u9vw6rzExhHMtTGtGrfl5nE0IEgEAj3/A==
X-Google-Smtp-Source: AGHT+IHpSqYMZnJIwMvd/4lAF+O9cYNaktKk9pOe7eLVIejN5m7i3i+I+Kqp9vE8g8yw+eb4yKgrKppgkbkYaaS4u4c=
X-Received: by 2002:a05:6808:3a19:b0:403:3195:58cf with SMTP id
 5614622812f47-406467f6a5emr7481831b6e.1.1748357036861; Tue, 27 May 2025
 07:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-10-jens.wiklander@linaro.org> <aDQitSd27Z4qC0xT@sumit-X1>
In-Reply-To: <aDQitSd27Z4qC0xT@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 16:43:44 +0200
X-Gm-Features: AX0GCFsAg3SlBrsMFYU7wBuZbNCOqXi00PEfamwreFmZfzirEP5JjBZls3rnlgg
Message-ID: <CAHUa44E=FKAGWk-pjq176b9ri7kgL8PqN6rpBeoPKgfj5EuWTA@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] optee: smc abi: dynamic protected memory allocation
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

On Mon, May 26, 2025 at 10:13=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Tue, May 20, 2025 at 05:16:52PM +0200, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver for dynamic protected memory
> > allocation using the SMC ABI.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/smc_abi.c | 102 ++++++++++++++++++++++++++++++------
> >  1 file changed, 85 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index f3cae8243785..6b3fbe7f0909 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_c=
ontext *ctx,
> >       return rc;
> >  }
> >
> > +static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm =
*protmem,
> > +                               u16 *end_points, unsigned int ep_count,
> > +                               u32 use_case)
> > +{
> > +     struct optee_shm_arg_entry *entry;
> > +     struct optee_msg_arg *msg_arg;
> > +     struct tee_shm *shm;
> > +     u_int offs;
> > +     int rc;
> > +
> > +     msg_arg =3D optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs)=
;
> > +     if (IS_ERR(msg_arg))
> > +             return PTR_ERR(msg_arg);
> > +
> > +     msg_arg->cmd =3D OPTEE_MSG_CMD_LEND_PROTMEM;
> > +     msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> > +     msg_arg->params[0].u.value.a =3D use_case;
> > +     msg_arg->params[1].attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> > +     msg_arg->params[1].u.tmem.buf_ptr =3D protmem->paddr;
> > +     msg_arg->params[1].u.tmem.size =3D protmem->size;
> > +     msg_arg->params[1].u.tmem.shm_ref =3D (u_long)protmem;
> > +
> > +     rc =3D optee->ops->do_call_with_arg(optee->ctx, shm, offs, false)=
;
> > +     if (rc)
> > +             goto out;
> > +     if (msg_arg->ret !=3D TEEC_SUCCESS) {
> > +             rc =3D -EINVAL;
> > +             goto out;
> > +     }
> > +     protmem->sec_world_id =3D (u_long)protmem;
> > +
> > +out:
> > +     optee_free_msg_arg(optee->ctx, entry, offs);
> > +     return rc;
> > +}
> > +
> > +static int optee_smc_reclaim_protmem(struct optee *optee,
> > +                                  struct tee_shm *protmem)
> > +{
> > +     struct optee_shm_arg_entry *entry;
> > +     struct optee_msg_arg *msg_arg;
> > +     struct tee_shm *shm;
> > +     u_int offs;
> > +     int rc;
> > +
> > +     msg_arg =3D optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs)=
;
> > +     if (IS_ERR(msg_arg))
> > +             return PTR_ERR(msg_arg);
> > +
> > +     msg_arg->cmd =3D OPTEE_MSG_CMD_RECLAIM_PROTMEM;
> > +     msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> > +     msg_arg->params[0].u.rmem.shm_ref =3D (u_long)protmem;
> > +
> > +     rc =3D optee->ops->do_call_with_arg(optee->ctx, shm, offs, false)=
;
> > +     if (rc)
> > +             goto out;
> > +     if (msg_arg->ret !=3D TEEC_SUCCESS)
> > +             rc =3D -EINVAL;
> > +
> > +out:
> > +     optee_free_msg_arg(optee->ctx, entry, offs);
> > +     return rc;
> > +}
> > +
> >  /*
> >   * 5. Asynchronous notification
> >   */
> > @@ -1216,6 +1280,8 @@ static const struct optee_ops optee_ops =3D {
> >       .do_call_with_arg =3D optee_smc_do_call_with_arg,
> >       .to_msg_param =3D optee_to_msg_param,
> >       .from_msg_param =3D optee_from_msg_param,
> > +     .lend_protmem =3D optee_smc_lend_protmem,
> > +     .reclaim_protmem =3D optee_smc_reclaim_protmem,
> >  };
> >
> >  static int enable_async_notif(optee_invoke_fn *invoke_fn)
> > @@ -1586,11 +1652,14 @@ static inline int optee_load_fw(struct platform=
_device *pdev,
> >
> >  static int optee_protmem_pool_init(struct optee *optee)
> >  {
> > +     bool protm =3D optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
> > +     bool dyn_protm =3D optee->smc.sec_caps &
> > +                      OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
> >       enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > -     struct tee_protmem_pool *pool;
> > -     int rc;
> > +     struct tee_protmem_pool *pool =3D ERR_PTR(-EINVAL);
> > +     int rc =3D -EINVAL;
> >
> > -     if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
> > +     if (protm) {
> >               union {
> >                       struct arm_smccc_res smccc;
> >                       struct optee_smc_get_protmem_config_result result=
;
> > @@ -1598,26 +1667,26 @@ static int optee_protmem_pool_init(struct optee=
 *optee)
> >
> >               optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, =
0, 0,
> >                                    0, 0, 0, &res.smccc);
> > -             if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
> > -                     pr_err("Secure Data Path service not available\n"=
);
> > -                     return 0;
> > -             }
> > -             rc =3D optee_set_dma_mask(optee, res.result.pa_width);
> > +             if (res.result.status =3D=3D OPTEE_SMC_RETURN_OK)
> > +                     rc =3D optee_set_dma_mask(optee, res.result.pa_wi=
dth);
>
> This change should be folded in patch 7/9.

OK

>
> >               if (!rc)
> >                       pool =3D tee_protmem_static_pool_alloc(res.result=
.start,
> >                                                            res.result.s=
ize);
> > -             if (IS_ERR(pool))
> > -                     return PTR_ERR(pool);
> > +     }
> >
> > +     if (dyn_protm && IS_ERR(pool))
> > +             pool =3D optee_protmem_alloc_dyn_pool(optee, heap_id);
> > +
> > +     if (!IS_ERR(pool)) {
> >               rc =3D tee_device_register_dma_heap(optee->teedev, heap_i=
d, pool);
> >               if (rc)
> > -                     goto err;
> > +                     pool->ops->destroy_pool(pool);
> >       }
> >
> > +     if (protm || dyn_protm)
> > +             return rc;
> > +
> >       return 0;
> > -err:
> > -     pool->ops->destroy_pool(pool);
> > -     return rc;
> >  }
> >
> >  static int optee_probe(struct platform_device *pdev)
> > @@ -1788,9 +1857,8 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > -     rc =3D optee_protmem_pool_init(optee);
> > -     if (rc)
> > -             goto err_notif_uninit;
> > +     if (optee_protmem_pool_init(optee))
> > +             pr_info("Protected memory service not available\n");
>
> This change can be folded in patch 7/9.

Yes, that makes sense.

Cheers,
Jens

>
> Rest looks good to me.
>
> -Sumit
>
> >
> >       /*
> >        * Ensure that there are no pre-existing shm objects before enabl=
ing
> > --
> > 2.43.0
> >

