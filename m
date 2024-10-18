Return-Path: <linux-media+bounces-19902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D74309A42DE
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AD5D1F22F4E
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A982022D7;
	Fri, 18 Oct 2024 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sv3ExHbI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F55168488
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729266528; cv=none; b=qNN/kxkYL5EDJhDyDzgwg9fFWTaP76C0/t3FjzMP8bE0vbyBL9JFeUy379fpyNQx414YNdHiXkNIS/9Vu0StUF/G/F3a1rkYzOzv0HBFM3pWmx+9arULWZnlSU3wPGnEZtT3UpW+gWl+B6dJjP/qqP8itVIbTZhSePkOWCbGMU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729266528; c=relaxed/simple;
	bh=ZfMyemBH5/ojP5JSNiE0n/JGtH9ovO9hB3G42LlfGeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbCphOHdGrQRvTh36XtLjCGtH/Jt0dJNjapE6PlEHhzJfyevrIEjpd7tVbZVI2hEoFULWyKKnG5K+7uLAB920rNZ+A0bkvjRiZT7Hm31knth/6uNWjJq3HZ4ZSSJ43+UpJk2tFUzYj8Vb1r4hSfymyFncGImPxGSmntLnxKp7Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sv3ExHbI; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-288661760d3so1215867fac.3
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 08:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729266525; x=1729871325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/oFf/kMLVlgJ0FFtDlxauZft7NM7jeJ0DH4Xii7VwQ=;
        b=Sv3ExHbIOxuqZUiz90+bKCJuqsxA7cYwOlqmd4Pbhx3z82xR6KYtezWG3CZDE/GDl2
         5RWSUh51bCNJRK3MBgyWi99fLlVO6lQen+4yVotXoaPKDlmkWsIhLJ0Meb+9qXWyQDh8
         4/N5qaxm8GKpgI0ppkW0O7XQ4Fx1IrS85DlvdygQThRzVsPpsBTj/NhuoJFu9Cu1Lega
         kNukwyIWr4Cqm40AvuXC+BdeJ5LLUSSVhm/XLgkCMI3sVE9e453bt3TadIE8L5PcofEt
         ik2yVHepW1LH8rqGYt9mrI0yIoHuucKGR81mTDGklIAf/X44hjCKX1d/cHSL/CwOs1+3
         hcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729266525; x=1729871325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/oFf/kMLVlgJ0FFtDlxauZft7NM7jeJ0DH4Xii7VwQ=;
        b=MjVbHn+b6Tex7BAHI7Ntfoa/KpG6yR1Qt8narqhEmyFb4iuwwsHaTydSU3xxjqYWWB
         BpSexvKdRlBv9iDg+EdpLYItRWRbILW2IEYKSICLnI6Pejrxx9MoXPqcgjQDv3PnwtEi
         ZuKNH44ulThbwdyTHgTkG7yNJwxZNxWNQ1MIbLq7zeeQaLtUfu2WADC1AJ/1OkvyOAjC
         CtT5h3hu1cpDDeJM+04uO3Xd94CXK41bKzsBkBsIOY9HfoQGiQVZ5MR039XuebZ+7xSq
         qenrcMJgeSx52eRvhzLhQtyfbEfoGCGTJ2E7k34lyVyIG9clUhfP79n2FIr6xW2n8rYP
         pjzg==
X-Forwarded-Encrypted: i=1; AJvYcCUJFXrotd7jeP5F3gEkuvNVi1J+/hdM9pXzk6m0m1WW6sBmJZ6Mrt28dIYPTCCQLilLa9g0ECuFGlQ0Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws0wdiyAvO1Gl2zZ/1go62S5rOUi8vCdC8s/QWrASZYp+D1bXU
	vwOccVMhtW8GwWaNvhxsq+OcZWr5cRqXd67Q7yPiFfkEXLKaBx6e4RgY2gI++XfxhTaUMcG31z9
	1GiUVI37RXO2ulR0obl9aabhPQTTy6jBVQgbsOA==
X-Google-Smtp-Source: AGHT+IEGFX+TJ21o7W2TsN9T08DevU1B9RUQALluVGZL1MO/rIaqyu7XBSObbywSk2H6T0vDAWl7wSBFO1fraKyz1+A=
X-Received: by 2002:a05:6870:80d4:b0:277:eb79:b4fb with SMTP id
 586e51a60fabf-2892c2678a7mr2454837fac.1.1729266524858; Fri, 18 Oct 2024
 08:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015101716.740829-1-jens.wiklander@linaro.org>
 <20241015101716.740829-3-jens.wiklander@linaro.org> <CAFA6WYMFys_woiF3dzwaXjMy7Y-gTLgHE0PBZtEf6jH-mkc40g@mail.gmail.com>
In-Reply-To: <CAFA6WYMFys_woiF3dzwaXjMy7Y-gTLgHE0PBZtEf6jH-mkc40g@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 18 Oct 2024 17:48:33 +0200
Message-ID: <CAHUa44FtdQ8rVqu2PiQ2Ceje4wu92uO3xEYWZ18CmvuQTuoNqQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] optee: support restricted memory allocation
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

On Thu, Oct 17, 2024 at 1:00=E2=80=AFPM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> Hi Jens,
>
> On Tue, 15 Oct 2024 at 15:47, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
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
> >  drivers/tee/optee/core.c          | 21 +++++++++++++++
> >  drivers/tee/optee/optee_private.h |  6 +++++
> >  drivers/tee/optee/optee_smc.h     | 35 ++++++++++++++++++++++++
> >  drivers/tee/optee/smc_abi.c       | 45 ++++++++++++++++++++++++++++---
> >  4 files changed, 104 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> > index 39e688d4e974..b6d5cbc6728d 100644
> > --- a/drivers/tee/optee/core.c
> > +++ b/drivers/tee/optee/core.c
> > @@ -95,6 +95,25 @@ void optee_release_supp(struct tee_context *ctx)
> >         optee_supp_release(&optee->supp);
> >  }
> >
> > +int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
> > +                      u32 flags, size_t size)
> > +{
> > +       struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> > +
> > +       if (!optee->sdp_pool)
> > +               return -EINVAL;
> > +       if (flags !=3D TEE_IOC_FLAG_SECURE_VIDEO)
> > +               return -EINVAL;
> > +       return optee->sdp_pool->ops->alloc(optee->sdp_pool, shm, size, =
0);
> > +}
> > +
> > +void optee_rstmem_free(struct tee_context *ctx, struct tee_shm *shm)
> > +{
> > +       struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> > +
> > +       optee->sdp_pool->ops->free(optee->sdp_pool, shm);
> > +}
> > +
> >  void optee_remove_common(struct optee *optee)
> >  {
> >         /* Unregister OP-TEE specific client devices on TEE bus */
> > @@ -111,6 +130,8 @@ void optee_remove_common(struct optee *optee)
> >         tee_device_unregister(optee->teedev);
> >
> >         tee_shm_pool_free(optee->pool);
> > +       if (optee->sdp_pool)
> > +               optee->sdp_pool->ops->destroy_pool(optee->sdp_pool);
> >         optee_supp_uninit(&optee->supp);
> >         mutex_destroy(&optee->call_queue.mutex);
> >  }
> > diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/opte=
e_private.h
> > index 424898cdc4e9..1f6b2cc992a9 100644
> > --- a/drivers/tee/optee/optee_private.h
> > +++ b/drivers/tee/optee/optee_private.h
> > @@ -200,6 +200,7 @@ struct optee_ops {
> >   * @notif:             notification synchronization struct
> >   * @supp:              supplicant synchronization struct for RPC to su=
pplicant
> >   * @pool:              shared memory pool
> > + * @sdp_pool:          restricted memory pool for secure data path
> >   * @rpc_param_count:   If > 0 number of RPC parameters to make room fo=
r
> >   * @scan_bus_done      flag if device registation was already done.
> >   * @scan_bus_work      workq to scan optee bus and register optee driv=
ers
> > @@ -218,6 +219,7 @@ struct optee {
> >         struct optee_notif notif;
> >         struct optee_supp supp;
> >         struct tee_shm_pool *pool;
> > +       struct tee_shm_pool *sdp_pool;
> >         unsigned int rpc_param_count;
> >         bool   scan_bus_done;
> >         struct work_struct scan_bus_work;
> > @@ -340,6 +342,10 @@ void optee_rpc_cmd(struct tee_context *ctx, struct=
 optee *optee,
> >  int optee_do_bottom_half(struct tee_context *ctx);
> >  int optee_stop_async_notif(struct tee_context *ctx);
> >
> > +int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
> > +                      u32 flags, size_t size);
> > +void optee_rstmem_free(struct tee_context *ctx, struct tee_shm *shm);
> > +
> >  /*
> >   * Small helpers
> >   */
> > diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_sm=
c.h
> > index 7d9fa426505b..c3b8a1c204af 100644
> > --- a/drivers/tee/optee/optee_smc.h
> > +++ b/drivers/tee/optee/optee_smc.h
> > @@ -234,6 +234,39 @@ struct optee_smc_get_shm_config_result {
> >         unsigned long settings;
> >  };
> >
> > +/*
> > + * Get Secure Data Path memory config
> > + *
> > + * Returns the Secure Data Path memory config.
> > + *
> > + * Call register usage:
> > + * a0   SMC Function ID, OPTEE_SMC_GET_SDP_CONFIG
> > + * a2-6 Not used, must be zero
> > + * a7   Hypervisor Client ID register
> > + *
> > + * Have config return register usage:
> > + * a0   OPTEE_SMC_RETURN_OK
> > + * a1   Physical address of start of SDP memory
> > + * a2   Size of SDP memory
> > + * a3   Not used
> > + * a4-7 Preserved
> > + *
> > + * Not available register usage:
> > + * a0   OPTEE_SMC_RETURN_ENOTAVAIL
> > + * a1-3 Not used
> > + * a4-7 Preserved
> > + */
> > +#define OPTEE_SMC_FUNCID_GET_SDP_CONFIG        20
> > +#define OPTEE_SMC_GET_SDP_CONFIG \
> > +       OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_SDP_CONFIG)
> > +
> > +struct optee_smc_get_sdp_config_result {
> > +       unsigned long status;
> > +       unsigned long start;
> > +       unsigned long size;
> > +       unsigned long flags;
> > +};
> > +
> >  /*
> >   * Exchanges capabilities between normal world and secure world
> >   *
> > @@ -278,6 +311,8 @@ struct optee_smc_get_shm_config_result {
> >  #define OPTEE_SMC_SEC_CAP_ASYNC_NOTIF          BIT(5)
> >  /* Secure world supports pre-allocating RPC arg struct */
> >  #define OPTEE_SMC_SEC_CAP_RPC_ARG              BIT(6)
> > +/* Secure world supports Secure Data Path */
> > +#define OPTEE_SMC_SEC_CAP_SDP                  BIT(7)
> >
> >  #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES 9
> >  #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index 844285d4f03c..05068c70c791 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1164,6 +1164,8 @@ static void optee_get_version(struct tee_device *=
teedev,
> >                 v.gen_caps |=3D TEE_GEN_CAP_REG_MEM;
> >         if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL)
> >                 v.gen_caps |=3D TEE_GEN_CAP_MEMREF_NULL;
> > +       if (optee->sdp_pool)
> > +               v.gen_caps |=3D TEE_GEN_CAP_RSTMEM;
> >         *vers =3D v;
> >  }
> >
> > @@ -1186,6 +1188,8 @@ static const struct tee_driver_ops optee_clnt_ops=
 =3D {
> >         .cancel_req =3D optee_cancel_req,
> >         .shm_register =3D optee_shm_register,
> >         .shm_unregister =3D optee_shm_unregister,
> > +       .rstmem_alloc =3D optee_rstmem_alloc,
> > +       .rstmem_free =3D optee_rstmem_free,
> >  };
> >
> >  static const struct tee_desc optee_clnt_desc =3D {
> > @@ -1202,6 +1206,8 @@ static const struct tee_driver_ops optee_supp_ops=
 =3D {
> >         .supp_send =3D optee_supp_send,
> >         .shm_register =3D optee_shm_register_supp,
> >         .shm_unregister =3D optee_shm_unregister_supp,
> > +       .rstmem_alloc =3D optee_rstmem_alloc,
> > +       .rstmem_free =3D optee_rstmem_free,
> >  };
> >
> >  static const struct tee_desc optee_supp_desc =3D {
> > @@ -1582,6 +1588,32 @@ static inline int optee_load_fw(struct platform_=
device *pdev,
> >  }
> >  #endif
> >
> > +static int optee_sdp_pool_init(struct optee *optee)
> > +{
> > +       struct tee_shm_pool *pool;
> > +       union {
> > +               struct arm_smccc_res smccc;
> > +               struct optee_smc_get_sdp_config_result result;
> > +       } res;
> > +
> > +       if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP))
> > +               return 0;
> > +
> > +       optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0=
, 0,
> > +                            &res.smccc);
>
> IMHO, to put more weight on this proposal we should also include
> allocation from the kernel CMA pool alongside the reserved restricted
> memory pool. The implementation would be quite similar to how we
> support dynamic SHM based on platform specific capability:
> OPTEE_SMC_SEC_CAP_DYNAMIC_SHM. We can have a similar capability for
> dynamic restricted memory as: OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM.
>
> The major reason to support it is to allow mediatek use-case [1] of
> restricting memory dynamically which gets allocated from the CMA pool.
> Although, it won't be something that we can test on Qemu from a
> hardware enforcement perspective, at least we can test it on Qemu
> conceptually. Thoughts?

I don't mind adding that, but I'd appreciate some help from Mediatek.
I have something similar in mind for the FF-A ABI, we can use the
FFA_LEND ABI for exclusive access to OP-TEE. But it doesn't have to
happen all in one patch set.

Cheers,
Jens

>
> [1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-9-yong.=
wu@mediatek.com/
>
> -Sumit
>
> > +       if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
> > +               pr_err("Secure Data Path service not available\n");
> > +               return 0;
> > +       }
> > +
> > +       pool =3D tee_rstmem_gen_pool_alloc(res.result.start, res.result=
.size);
> > +       if (IS_ERR(pool))
> > +               return PTR_ERR(pool);
> > +       optee->sdp_pool =3D pool;
> > +
> > +       return 0;
> > +}
> > +
> >  static int optee_probe(struct platform_device *pdev)
> >  {
> >         optee_invoke_fn *invoke_fn;
> > @@ -1677,7 +1709,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >         optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
> >         if (!optee) {
> >                 rc =3D -ENOMEM;
> > -               goto err_free_pool;
> > +               goto err_free_shm_pool;
> >         }
> >
> >         optee->ops =3D &optee_ops;
> > @@ -1685,10 +1717,14 @@ static int optee_probe(struct platform_device *=
pdev)
> >         optee->smc.sec_caps =3D sec_caps;
> >         optee->rpc_param_count =3D rpc_param_count;
> >
> > +       rc =3D optee_sdp_pool_init(optee);
> > +       if (rc)
> > +               goto err_free_optee;
> > +
> >         teedev =3D tee_device_alloc(&optee_clnt_desc, NULL, pool, optee=
);
> >         if (IS_ERR(teedev)) {
> >                 rc =3D PTR_ERR(teedev);
> > -               goto err_free_optee;
> > +               goto err_sdp_pool_uninit;
> >         }
> >         optee->teedev =3D teedev;
> >
> > @@ -1786,9 +1822,12 @@ static int optee_probe(struct platform_device *p=
dev)
> >         tee_device_unregister(optee->supp_teedev);
> >  err_unreg_teedev:
> >         tee_device_unregister(optee->teedev);
> > +err_sdp_pool_uninit:
> > +       if (optee->sdp_pool)
> > +               optee->sdp_pool->ops->destroy_pool(optee->sdp_pool);
> >  err_free_optee:
> >         kfree(optee);
> > -err_free_pool:
> > +err_free_shm_pool:
> >         tee_shm_pool_free(pool);
> >         if (memremaped_shm)
> >                 memunmap(memremaped_shm);
> > --
> > 2.43.0
> >

