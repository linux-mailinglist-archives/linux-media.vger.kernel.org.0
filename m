Return-Path: <linux-media+bounces-28822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D4A72B18
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 09:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B2573B8178
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 08:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3207200126;
	Thu, 27 Mar 2025 08:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2iqYdbw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0601FF7DB
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062870; cv=none; b=XRBLNB1oQKDr6WoNiHLkwElU7965myLCGy06/SyWvbLGpiD5a2Ndu9nMLx/q2Gbl6pD6igLz0mGCr2OIUE3WUKlikHugEJ3u0bzGO5pIi4o6vXIo+NdxlC5ryxOtb1SFIBHIl6z3uuOA6wicq/ZY6m8hfu9P1+UZW97iPI8i2WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062870; c=relaxed/simple;
	bh=Ku5L5a7CxnKu2uHm16MJPm5TOjwcdGIsYjch+SV+/CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ii5mThTC4Q2B0yEceX9fl1PokZ6KNKxwM+KT7ob+irpWBY4XCPZoDuAQLCPIiVCH98puN8t2H80zgJ4snr74Tr27t5umd2uP6PZhNYlU+jDG/38gfJAg8x4DviQppuUzXeyccM8w12mdGAd4gEXoID2YqQ9dhoZdZEnqoRV35YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2iqYdbw; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2c1caacc1f7so352436fac.3
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 01:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743062867; x=1743667667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW/rPqMaQYO++Jra95+GXZ4ryGXVI5xEVfUlInzZyQk=;
        b=u2iqYdbwFnQQ6sJeKmwUnGnl5PA3mh+EaFGxqSWiiiJvJrwtnI760QkCdxy8glTcl4
         SRfJczRuEA/I8kkGnWXJE8qY2xYzIWHL569SrDtG5znZUtlLJSOb9LZMsgxt/hDFnbF3
         +FqAivq0B+tODSpOlQzem9eEzT1OS+1LkZM/GwDxzTd1q4IXdz/vfq4W5c8JTktGGrbj
         iYdIf+soxTyPAXKt9VPWnBrRsq6vQAhasSd0D5I61jqi96Q41v3dhZolsluWQ4lnK78p
         C4MOhq+mYTELvtlrIbJhbRMVeL3m5hNqTFlTsES8vH2N2/8iG/zQ1YHG/oxQpFIyp6L4
         9Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062867; x=1743667667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yW/rPqMaQYO++Jra95+GXZ4ryGXVI5xEVfUlInzZyQk=;
        b=WS81AhmuTSHOoTzI8Oqj3Jykg7I3ZsB0HTc8MUoKQJT8FeIiqYINJCU8omsElaLQhZ
         PDctf/1zQA/ocnICYVuAcGjLsrCrk+VxLy43t/u3d/ZlTkr8hYojjhZEY1ut/uUHNm4P
         u3BGaKhIfNjMSlUA6/VXkPC0lLVp3e2gz1h1FW384xKEa22ywv+LvyYEcgCDgxvRzD57
         H6Uxuo7GHtSeLQQTwZefa36lhyMnLKlndSjZpTxXbA5HAZlg3iqW/jfCEC1JVX1ofUHK
         5MxiiKW+darmz9+DLP2dxaaSky+XKNOGZz6d2jaOISHERi+kGeJfIvlfYoL+7E6XnRE9
         6rfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt6WKyOOmDmqph72LzODuzknRPEX5SfDEQNUWZHap3UOodNNPicewDPdjeXuTL49ZIXbVV/LRG1xD4RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzawviTArsLG81JSpXPNgijIQo88AU8yP4NBearihzSxQtPYPzt
	hTQr2NwVMnhSvTgyzSlQPvYYxmwPO/mGr6cxqfJB6EryedSMICY8fohrOyW5UoOJDsPKCHblywy
	cXESSvCMEUJNVyijdy0h+yRpfz3M5bXywKDDiOQ==
X-Gm-Gg: ASbGncsYJreQtCmYSBaZj0l/DldvuCdxZw51z0EJPejszTz1EgvKeeumSvROkL/qawG
	vQgVa7JZM3ahUfQsL7J//c37KY3M2NQfhLQ2BOgXfX+yUN3KvIG3c/SBVPNbegSv3b0pDty1PVw
	ozUqx8nm8Vs4metaclU+8JByOTd00=
X-Google-Smtp-Source: AGHT+IFpKxFdXa+dS7JJc6lYypDPPv/a/m6scvVyvApT1Xkg3JGdzmY/q1ztXjPj4LI2rQZ5U/ap6G4ataIX4XSi6Wg=
X-Received: by 2002:a05:6870:1686:b0:296:5928:7a42 with SMTP id
 586e51a60fabf-2c848018a60mr1410260fac.22.1743062866656; Thu, 27 Mar 2025
 01:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-10-jens.wiklander@linaro.org> <Z-JePo6yGlUgrZkw@sumit-X1>
In-Reply-To: <Z-JePo6yGlUgrZkw@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 27 Mar 2025 09:07:34 +0100
X-Gm-Features: AQ5f1Jp54lVrnE022cU59o4vbCIVjjmsLFsi6lr1wKrHBavH3SciHiNwg4RqH28
Message-ID: <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] optee: FF-A: dynamic restricted memory allocation
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

Hi Sumit,

On Tue, Mar 25, 2025 at 8:42=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Wed, Mar 05, 2025 at 02:04:15PM +0100, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver dynamic restricted memory
> > allocation with FF-A.
> >
> > The restricted memory pools for dynamically allocated restrict memory
> > are instantiated when requested by user-space. This instantiation can
> > fail if OP-TEE doesn't support the requested use-case of restricted
> > memory.
> >
> > Restricted memory pools based on a static carveout or dynamic allocatio=
n
> > can coexist for different use-cases. We use only dynamic allocation wit=
h
> > FF-A.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/Makefile        |   1 +
> >  drivers/tee/optee/ffa_abi.c       | 143 ++++++++++++-
> >  drivers/tee/optee/optee_private.h |  13 +-
> >  drivers/tee/optee/rstmem.c        | 329 ++++++++++++++++++++++++++++++
> >  4 files changed, 483 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/tee/optee/rstmem.c
> >
> > diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> > index a6eff388d300..498969fb8e40 100644
> > --- a/drivers/tee/optee/Makefile
> > +++ b/drivers/tee/optee/Makefile
> > @@ -4,6 +4,7 @@ optee-objs +=3D core.o
> >  optee-objs +=3D call.o
> >  optee-objs +=3D notif.o
> >  optee-objs +=3D rpc.o
> > +optee-objs +=3D rstmem.o
> >  optee-objs +=3D supp.o
> >  optee-objs +=3D device.o
> >  optee-objs +=3D smc_abi.o
> > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> > index e4b08cd195f3..6a55114232ef 100644
> > --- a/drivers/tee/optee/ffa_abi.c
> > +++ b/drivers/tee/optee/ffa_abi.c
> > @@ -672,6 +672,123 @@ static int optee_ffa_do_call_with_arg(struct tee_=
context *ctx,
> >       return optee_ffa_yielding_call(ctx, &data, rpc_arg, system_thread=
);
> >  }
> >
> > +static int do_call_lend_rstmem(struct optee *optee, u64 cookie, u32 us=
e_case)
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
> > +     msg_arg->cmd =3D OPTEE_MSG_CMD_ASSIGN_RSTMEM;
> > +     msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> > +     msg_arg->params[0].u.value.a =3D cookie;
> > +     msg_arg->params[0].u.value.b =3D use_case;
> > +
> > +     rc =3D optee->ops->do_call_with_arg(optee->ctx, shm, offs, false)=
;
> > +     if (rc)
> > +             goto out;
> > +     if (msg_arg->ret !=3D TEEC_SUCCESS) {
> > +             rc =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +out:
> > +     optee_free_msg_arg(optee->ctx, entry, offs);
> > +     return rc;
> > +}
> > +
> > +static int optee_ffa_lend_rstmem(struct optee *optee, struct tee_shm *=
rstmem,
> > +                              u16 *end_points, unsigned int ep_count,
> > +                              u32 use_case)
> > +{
> > +     struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
> > +     const struct ffa_mem_ops *mem_ops =3D ffa_dev->ops->mem_ops;
> > +     const struct ffa_msg_ops *msg_ops =3D ffa_dev->ops->msg_ops;
> > +     struct ffa_send_direct_data data;
> > +     struct ffa_mem_region_attributes *mem_attr;
> > +     struct ffa_mem_ops_args args =3D {
> > +             .use_txbuf =3D true,
> > +             .tag =3D use_case,
> > +     };
> > +     struct page *page;
> > +     struct scatterlist sgl;
> > +     unsigned int n;
> > +     int rc;
> > +
> > +     mem_attr =3D kcalloc(ep_count, sizeof(*mem_attr), GFP_KERNEL);
> > +     for (n =3D 0; n < ep_count; n++) {
> > +             mem_attr[n].receiver =3D end_points[n];
> > +             mem_attr[n].attrs =3D FFA_MEM_RW;
> > +     }
> > +     args.attrs =3D mem_attr;
> > +     args.nattrs =3D ep_count;
> > +
> > +     page =3D phys_to_page(rstmem->paddr);
> > +     sg_init_table(&sgl, 1);
> > +     sg_set_page(&sgl, page, rstmem->size, 0);
> > +
> > +     args.sg =3D &sgl;
> > +     rc =3D mem_ops->memory_lend(&args);
> > +     kfree(mem_attr);
> > +     if (rc)
> > +             return rc;
> > +
> > +     rc =3D do_call_lend_rstmem(optee, args.g_handle, use_case);
> > +     if (rc)
> > +             goto err_reclaim;
> > +
> > +     rc =3D optee_shm_add_ffa_handle(optee, rstmem, args.g_handle);
> > +     if (rc)
> > +             goto err_unreg;
> > +
> > +     rstmem->sec_world_id =3D args.g_handle;
> > +
> > +     return 0;
> > +
> > +err_unreg:
> > +     data =3D (struct ffa_send_direct_data){
> > +             .data0 =3D OPTEE_FFA_RELEASE_RSTMEM,
> > +             .data1 =3D (u32)args.g_handle,
> > +             .data2 =3D (u32)(args.g_handle >> 32),
> > +     };
> > +     msg_ops->sync_send_receive(ffa_dev, &data);
> > +err_reclaim:
> > +     mem_ops->memory_reclaim(args.g_handle, 0);
> > +     return rc;
> > +}
> > +
> > +static int optee_ffa_reclaim_rstmem(struct optee *optee, struct tee_sh=
m *rstmem)
> > +{
> > +     struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
> > +     const struct ffa_msg_ops *msg_ops =3D ffa_dev->ops->msg_ops;
> > +     const struct ffa_mem_ops *mem_ops =3D ffa_dev->ops->mem_ops;
> > +     u64 global_handle =3D rstmem->sec_world_id;
> > +     struct ffa_send_direct_data data =3D {
> > +             .data0 =3D OPTEE_FFA_RELEASE_RSTMEM,
> > +             .data1 =3D (u32)global_handle,
> > +             .data2 =3D (u32)(global_handle >> 32)
> > +     };
> > +     int rc;
> > +
> > +     optee_shm_rem_ffa_handle(optee, global_handle);
> > +     rstmem->sec_world_id =3D 0;
> > +
> > +     rc =3D msg_ops->sync_send_receive(ffa_dev, &data);
> > +     if (rc)
> > +             pr_err("Release SHM id 0x%llx rc %d\n", global_handle, rc=
);
> > +
> > +     rc =3D mem_ops->memory_reclaim(global_handle, 0);
> > +     if (rc)
> > +             pr_err("mem_reclaim: 0x%llx %d", global_handle, rc);
> > +
> > +     return rc;
> > +}
> > +
> >  /*
> >   * 6. Driver initialization
> >   *
> > @@ -833,6 +950,8 @@ static const struct optee_ops optee_ffa_ops =3D {
> >       .do_call_with_arg =3D optee_ffa_do_call_with_arg,
> >       .to_msg_param =3D optee_ffa_to_msg_param,
> >       .from_msg_param =3D optee_ffa_from_msg_param,
> > +     .lend_rstmem =3D optee_ffa_lend_rstmem,
> > +     .reclaim_rstmem =3D optee_ffa_reclaim_rstmem,
> >  };
> >
> >  static void optee_ffa_remove(struct ffa_device *ffa_dev)
> > @@ -941,7 +1060,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >                                 optee->pool, optee);
> >       if (IS_ERR(teedev)) {
> >               rc =3D PTR_ERR(teedev);
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >       optee->teedev =3D teedev;
> >
> > @@ -988,6 +1107,24 @@ static int optee_ffa_probe(struct ffa_device *ffa=
_dev)
> >                              rc);
> >       }
> >
> > +     if (IS_ENABLED(CONFIG_CMA) && !IS_MODULE(CONFIG_OPTEE) &&
>
> The CMA dependency should be managed via Kconfig.

Yes, I'll fix it.

>
> > +         (sec_caps & OPTEE_FFA_SEC_CAP_RSTMEM)) {
> > +             enum tee_dma_heap_id id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLA=
Y;
> > +             struct tee_rstmem_pool *pool;
> > +
> > +             pool =3D optee_rstmem_alloc_cma_pool(optee, id);
> > +             if (IS_ERR(pool)) {
> > +                     rc =3D PTR_ERR(pool);
> > +                     goto err_notif_uninit;
> > +             }
> > +
> > +             rc =3D tee_device_register_dma_heap(optee->teedev, id, po=
ol);
> > +             if (rc) {
> > +                     pool->ops->destroy_pool(pool);
> > +                     goto err_notif_uninit;
> > +             }
> > +     }
> > +
> >       rc =3D optee_enumerate_devices(PTA_CMD_GET_DEVICES);
> >       if (rc)
> >               goto err_unregister_devices;
> > @@ -1001,6 +1138,8 @@ static int optee_ffa_probe(struct ffa_device *ffa=
_dev)
> >
> >  err_unregister_devices:
> >       optee_unregister_devices();
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> > +err_notif_uninit:
> >       if (optee->ffa.bottom_half_value !=3D U32_MAX)
> >               notif_ops->notify_relinquish(ffa_dev,
> >                                            optee->ffa.bottom_half_value=
);
> > @@ -1018,7 +1157,7 @@ static int optee_ffa_probe(struct ffa_device *ffa=
_dev)
> >       tee_device_unregister(optee->supp_teedev);
> >  err_unreg_teedev:
> >       tee_device_unregister(optee->teedev);
> > -err_free_pool:
> > +err_free_shm_pool:
> >       tee_shm_pool_free(pool);
> >  err_free_optee:
> >       kfree(optee);
> > diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/opte=
e_private.h
> > index 20eda508dbac..faab31ad7c52 100644
> > --- a/drivers/tee/optee/optee_private.h
> > +++ b/drivers/tee/optee/optee_private.h
> > @@ -174,9 +174,14 @@ struct optee;
> >   * @do_call_with_arg:        enters OP-TEE in secure world
> >   * @to_msg_param:    converts from struct tee_param to OPTEE_MSG param=
eters
> >   * @from_msg_param:  converts from OPTEE_MSG parameters to struct tee_=
param
> > + * @lend_rstmem:     lends physically contiguous memory as restricted
> > + *                   memory, inaccessible by the kernel
> > + * @reclaim_rstmem:  reclaims restricted memory previously lent with
> > + *                   @lend_rstmem() and makes it accessible by the
> > + *                   kernel again
> >   *
> >   * These OPs are only supposed to be used internally in the OP-TEE dri=
ver
> > - * as a way of abstracting the different methogs of entering OP-TEE in
> > + * as a way of abstracting the different methods of entering OP-TEE in
> >   * secure world.
> >   */
> >  struct optee_ops {
> > @@ -191,6 +196,10 @@ struct optee_ops {
> >                             size_t num_params,
> >                             const struct optee_msg_param *msg_params,
> >                             bool update_out);
> > +     int (*lend_rstmem)(struct optee *optee, struct tee_shm *rstmem,
> > +                        u16 *end_points, unsigned int ep_count,
> > +                        u32 use_case);
> > +     int (*reclaim_rstmem)(struct optee *optee, struct tee_shm *rstmem=
);
> >  };
> >
> >  /**
> > @@ -285,6 +294,8 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u3=
2 func, size_t num_params,
> >  void optee_supp_init(struct optee_supp *supp);
> >  void optee_supp_uninit(struct optee_supp *supp);
> >  void optee_supp_release(struct optee_supp *supp);
> > +struct tee_rstmem_pool *optee_rstmem_alloc_cma_pool(struct optee *opte=
e,
> > +                                                 enum tee_dma_heap_id =
id);
> >
> >  int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_param=
s,
> >                   struct tee_param *param);
> > diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rstmem.c
> > new file mode 100644
> > index 000000000000..ea27769934d4
> > --- /dev/null
> > +++ b/drivers/tee/optee/rstmem.c
> > @@ -0,0 +1,329 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2025, Linaro Limited
> > + */
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/errno.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <linux/tee_core.h>
> > +#include <linux/types.h>
> > +#include "optee_private.h"
> > +
> > +struct optee_rstmem_cma_pool {
> > +     struct tee_rstmem_pool pool;
> > +     struct gen_pool *gen_pool;
> > +     struct optee *optee;
> > +     size_t page_count;
> > +     u16 *end_points;
> > +     u_int end_point_count;
> > +     u_int align;
> > +     refcount_t refcount;
> > +     u32 use_case;
> > +     struct tee_shm *rstmem;
> > +     /* Protects when initializing and tearing down this struct */
> > +     struct mutex mutex;
> > +};
> > +
> > +static struct optee_rstmem_cma_pool *
> > +to_rstmem_cma_pool(struct tee_rstmem_pool *pool)
> > +{
> > +     return container_of(pool, struct optee_rstmem_cma_pool, pool);
> > +}
> > +
> > +static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > +{
> > +     int rc;
> > +
> > +     rp->rstmem =3D tee_shm_alloc_cma_phys_mem(rp->optee->ctx, rp->pag=
e_count,
> > +                                             rp->align);
> > +     if (IS_ERR(rp->rstmem)) {
> > +             rc =3D PTR_ERR(rp->rstmem);
> > +             goto err_null_rstmem;
> > +     }
> > +
> > +     /*
> > +      * TODO unmap the memory range since the physical memory will
> > +      * become inaccesible after the lend_rstmem() call.
> > +      */
>
> What's your plan for this TODO? I think we need a CMA allocator here
> which can allocate un-mapped memory such that any cache speculation
> won't lead to CPU hangs once the memory restriction comes into picture.

What happens is platform-specific. For some platforms, it might be
enough to avoid explicit access. Yes, a CMA allocator with unmapped
memory or where memory can be unmapped is one option.

>
> > +     rc =3D rp->optee->ops->lend_rstmem(rp->optee, rp->rstmem, rp->end=
_points,
> > +                                      rp->end_point_count, rp->use_cas=
e);
> > +     if (rc)
> > +             goto err_put_shm;
> > +     rp->rstmem->flags |=3D TEE_SHM_DYNAMIC;
> > +
> > +     rp->gen_pool =3D gen_pool_create(PAGE_SHIFT, -1);
> > +     if (!rp->gen_pool) {
> > +             rc =3D -ENOMEM;
> > +             goto err_reclaim;
> > +     }
> > +
> > +     rc =3D gen_pool_add(rp->gen_pool, rp->rstmem->paddr,
> > +                       rp->rstmem->size, -1);
> > +     if (rc)
> > +             goto err_free_pool;
> > +
> > +     refcount_set(&rp->refcount, 1);
> > +     return 0;
> > +
> > +err_free_pool:
> > +     gen_pool_destroy(rp->gen_pool);
> > +     rp->gen_pool =3D NULL;
> > +err_reclaim:
> > +     rp->optee->ops->reclaim_rstmem(rp->optee, rp->rstmem);
> > +err_put_shm:
> > +     tee_shm_put(rp->rstmem);
> > +err_null_rstmem:
> > +     rp->rstmem =3D NULL;
> > +     return rc;
> > +}
> > +
> > +static int get_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > +{
> > +     int rc =3D 0;
> > +
> > +     if (!refcount_inc_not_zero(&rp->refcount)) {
> > +             mutex_lock(&rp->mutex);
> > +             if (rp->gen_pool) {
> > +                     /*
> > +                      * Another thread has already initialized the poo=
l
> > +                      * before us, or the pool was just about to be to=
rn
> > +                      * down. Either way we only need to increase the
> > +                      * refcount and we're done.
> > +                      */
> > +                     refcount_inc(&rp->refcount);
> > +             } else {
> > +                     rc =3D init_cma_rstmem(rp);
> > +             }
> > +             mutex_unlock(&rp->mutex);
> > +     }
> > +
> > +     return rc;
> > +}
> > +
> > +static void release_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > +{
> > +     gen_pool_destroy(rp->gen_pool);
> > +     rp->gen_pool =3D NULL;
> > +
> > +     rp->optee->ops->reclaim_rstmem(rp->optee, rp->rstmem);
> > +     rp->rstmem->flags &=3D ~TEE_SHM_DYNAMIC;
> > +
> > +     WARN(refcount_read(&rp->rstmem->refcount) !=3D 1, "Unexpected ref=
count");
> > +     tee_shm_put(rp->rstmem);
> > +     rp->rstmem =3D NULL;
> > +}
> > +
> > +static void put_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > +{
> > +     if (refcount_dec_and_test(&rp->refcount)) {
> > +             mutex_lock(&rp->mutex);
> > +             if (rp->gen_pool)
> > +                     release_cma_rstmem(rp);
> > +             mutex_unlock(&rp->mutex);
> > +     }
> > +}
> > +
> > +static int rstmem_pool_op_cma_alloc(struct tee_rstmem_pool *pool,
> > +                                 struct sg_table *sgt, size_t size,
> > +                                 size_t *offs)
> > +{
> > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool);
> > +     size_t sz =3D ALIGN(size, PAGE_SIZE);
> > +     phys_addr_t pa;
> > +     int rc;
> > +
> > +     rc =3D get_cma_rstmem(rp);
> > +     if (rc)
> > +             return rc;
> > +
> > +     pa =3D gen_pool_alloc(rp->gen_pool, sz);
> > +     if (!pa) {
> > +             rc =3D -ENOMEM;
> > +             goto err_put;
> > +     }
> > +
> > +     rc =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > +     if (rc)
> > +             goto err_free;
> > +
> > +     sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
> > +     *offs =3D pa - rp->rstmem->paddr;
> > +
> > +     return 0;
> > +err_free:
> > +     gen_pool_free(rp->gen_pool, pa, size);
> > +err_put:
> > +     put_cma_rstmem(rp);
> > +
> > +     return rc;
> > +}
> > +
> > +static void rstmem_pool_op_cma_free(struct tee_rstmem_pool *pool,
> > +                                 struct sg_table *sgt)
> > +{
> > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool);
> > +     struct scatterlist *sg;
> > +     int i;
> > +
> > +     for_each_sgtable_sg(sgt, sg, i)
> > +             gen_pool_free(rp->gen_pool, sg_phys(sg), sg->length);
> > +     sg_free_table(sgt);
> > +     put_cma_rstmem(rp);
> > +}
> > +
> > +static int rstmem_pool_op_cma_update_shm(struct tee_rstmem_pool *pool,
> > +                                      struct sg_table *sgt, size_t off=
s,
> > +                                      struct tee_shm *shm,
> > +                                      struct tee_shm **parent_shm)
> > +{
> > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool);
> > +
> > +     *parent_shm =3D rp->rstmem;
> > +
> > +     return 0;
> > +}
> > +
> > +static void pool_op_cma_destroy_pool(struct tee_rstmem_pool *pool)
> > +{
> > +     struct optee_rstmem_cma_pool *rp =3D to_rstmem_cma_pool(pool);
> > +
> > +     mutex_destroy(&rp->mutex);
> > +     kfree(rp);
> > +}
> > +
> > +static struct tee_rstmem_pool_ops rstmem_pool_ops_cma =3D {
> > +     .alloc =3D rstmem_pool_op_cma_alloc,
> > +     .free =3D rstmem_pool_op_cma_free,
> > +     .update_shm =3D rstmem_pool_op_cma_update_shm,
> > +     .destroy_pool =3D pool_op_cma_destroy_pool,
> > +};
> > +
> > +static int get_rstmem_config(struct optee *optee, u32 use_case,
> > +                          size_t *min_size, u_int *min_align,
> > +                          u16 *end_points, u_int *ep_count)
>
> I guess this end points terminology is specific to FF-A ABI. Is there
> any relevance for this in the common APIs?

Yes, endpoints are specific to FF-A ABI. The list of end-points must
be presented to FFA_MEM_LEND. We're relying on the secure world to
know which endpoints are needed for a specific use case.

Cheers,
Jens

>
> -Sumit
>
> > +{
> > +     struct tee_param params[2] =3D {
> > +             [0] =3D {
> > +                     .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT,
> > +                     .u.value.a =3D use_case,
> > +             },
> > +             [1] =3D {
> > +                     .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT=
,
> > +             },
> > +     };
> > +     struct optee_shm_arg_entry *entry;
> > +     struct tee_shm *shm_param =3D NULL;
> > +     struct optee_msg_arg *msg_arg;
> > +     struct tee_shm *shm;
> > +     u_int offs;
> > +     int rc;
> > +
> > +     if (end_points && *ep_count) {
> > +             params[1].u.memref.size =3D *ep_count * sizeof(*end_point=
s);
> > +             shm_param =3D tee_shm_alloc_priv_buf(optee->ctx,
> > +                                                params[1].u.memref.siz=
e);
> > +             if (IS_ERR(shm_param))
> > +                     return PTR_ERR(shm_param);
> > +             params[1].u.memref.shm =3D shm_param;
> > +     }
> > +
> > +     msg_arg =3D optee_get_msg_arg(optee->ctx, ARRAY_SIZE(params), &en=
try,
> > +                                 &shm, &offs);
> > +     if (IS_ERR(msg_arg)) {
> > +             rc =3D PTR_ERR(msg_arg);
> > +             goto out_free_shm;
> > +     }
> > +     msg_arg->cmd =3D OPTEE_MSG_CMD_GET_RSTMEM_CONFIG;
> > +
> > +     rc =3D optee->ops->to_msg_param(optee, msg_arg->params,
> > +                                   ARRAY_SIZE(params), params,
> > +                                   false /*!update_out*/);
> > +     if (rc)
> > +             goto out_free_msg;
> > +
> > +     rc =3D optee->ops->do_call_with_arg(optee->ctx, shm, offs, false)=
;
> > +     if (rc)
> > +             goto out_free_msg;
> > +     if (msg_arg->ret && msg_arg->ret !=3D TEEC_ERROR_SHORT_BUFFER) {
> > +             rc =3D -EINVAL;
> > +             goto out_free_msg;
> > +     }
> > +
> > +     rc =3D optee->ops->from_msg_param(optee, params, ARRAY_SIZE(param=
s),
> > +                                     msg_arg->params, true /*update_ou=
t*/);
> > +     if (rc)
> > +             goto out_free_msg;
> > +
> > +     if (!msg_arg->ret && end_points &&
> > +         *ep_count < params[1].u.memref.size / sizeof(u16)) {
> > +             rc =3D -EINVAL;
> > +             goto out_free_msg;
> > +     }
> > +
> > +     *min_size =3D params[0].u.value.a;
> > +     *min_align =3D params[0].u.value.b;
> > +     *ep_count =3D params[1].u.memref.size / sizeof(u16);
> > +
> > +     if (msg_arg->ret =3D=3D TEEC_ERROR_SHORT_BUFFER) {
> > +             rc =3D -ENOSPC;
> > +             goto out_free_msg;
> > +     }
> > +
> > +     if (end_points)
> > +             memcpy(end_points, tee_shm_get_va(shm_param, 0),
> > +                    params[1].u.memref.size);
> > +
> > +out_free_msg:
> > +     optee_free_msg_arg(optee->ctx, entry, offs);
> > +out_free_shm:
> > +     if (shm_param)
> > +             tee_shm_free(shm_param);
> > +     return rc;
> > +}
> > +
> > +struct tee_rstmem_pool *optee_rstmem_alloc_cma_pool(struct optee *opte=
e,
> > +                                                 enum tee_dma_heap_id =
id)
> > +{
> > +     struct optee_rstmem_cma_pool *rp;
> > +     u32 use_case =3D id;
> > +     size_t min_size;
> > +     int rc;
> > +
> > +     rp =3D kzalloc(sizeof(*rp), GFP_KERNEL);
> > +     if (!rp)
> > +             return ERR_PTR(-ENOMEM);
> > +     rp->use_case =3D use_case;
> > +
> > +     rc =3D get_rstmem_config(optee, use_case, &min_size, &rp->align, =
NULL,
> > +                            &rp->end_point_count);
> > +     if (rc) {
> > +             if (rc !=3D -ENOSPC)
> > +                     goto err;
> > +             rp->end_points =3D kcalloc(rp->end_point_count,
> > +                                      sizeof(*rp->end_points), GFP_KER=
NEL);
> > +             if (!rp->end_points) {
> > +                     rc =3D -ENOMEM;
> > +                     goto err;
> > +             }
> > +             rc =3D get_rstmem_config(optee, use_case, &min_size, &rp-=
>align,
> > +                                    rp->end_points, &rp->end_point_cou=
nt);
> > +             if (rc)
> > +                     goto err_kfree_eps;
> > +     }
> > +
> > +     rp->pool.ops =3D &rstmem_pool_ops_cma;
> > +     rp->optee =3D optee;
> > +     rp->page_count =3D min_size / PAGE_SIZE;
> > +     mutex_init(&rp->mutex);
> > +
> > +     return &rp->pool;
> > +
> > +err_kfree_eps:
> > +     kfree(rp->end_points);
> > +err:
> > +     kfree(rp);
> > +     return ERR_PTR(rc);
> > +}
> > --
> > 2.43.0
> >

