Return-Path: <linux-media+bounces-33479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE42AC519D
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 17:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 569777A5B0C
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 15:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C457727A124;
	Tue, 27 May 2025 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITMeFhf7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A0419D092
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358456; cv=none; b=E/UKZTbWx3dbEMa8pwnkTr8+aQwI+3XEbJ5U29Ep97Lm13ofmOFKr46a40Dzb0cyEGQPL45xthCPYSM9nx+XG6Z6h6yjtJzAP5B4+fL//UrSf7/LqgmtfUH8ZHhPQZLfaigH7fBC+Lj9KLqxNpVJ/9cxQvPc4/XTPZS6gMGTkNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358456; c=relaxed/simple;
	bh=pUaNeTHTCwKFPAoMIgJmb5zAeyUnC0gPJ5nIg5WMFEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnL3RNyRFzK/6ZpegCrMbQeco8PO5BvvWA1BEm+JYhcHG1x/DA+laJujrqgKgsMP6/gJKFS6B84o3Iicybgzf8EUUlPLxpjqZnvCOo2frL7E8xTcx6p9f6Zisy8E5MYz0+Ky2sLCwtSbQ4OgRdxF6SBhYij9+gQ/ZdnJusm6LdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ITMeFhf7; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6065803ef35so715833eaf.1
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748358452; x=1748963252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HvNpqBKFOVDi+Mx9KGaepBPynHnQJMRXklI5JhKtbg=;
        b=ITMeFhf7EM7SPiwjbX3ys37gJh1R3yyljtbFwVkWbQzSFHKLzrwV8RFHeFQTUu5KHp
         30TMmrTu6ooC5GLUBA3BV8pkUcHTdeV1vSap4BAtdnSL3IBB4D/jGzjx5WOFltnoeECB
         YsfpEn3FGD+oFm4b4bwDeZHG0EmkNDfrPc7BkZHR4pdVy/WFMSHCgkkxuoh41887oQ9V
         jBUcmQ86o7HQOZZbLWSs2t48OB16eO0lkL7+jCLO6q1t/LO63v4zEuwGuIlRxM+18BTr
         X05yYFJs+08cd9t3MSM+KTH56Wr1K7x9IBBN+LG00SdPWBKR6wdntS5rK/0kEd1kImWx
         uapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358452; x=1748963252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HvNpqBKFOVDi+Mx9KGaepBPynHnQJMRXklI5JhKtbg=;
        b=wRNV9EZC251y01v4yDF/IzcRM8H8ZyVD0bY8n7NUwCmDnwsUE+F7GYdlle4CjNU9vb
         LdqpQtzFG/JT0THDk5mJjhpaPjpyjUzpmPkNEfrLs0Ns2SuQ9wTNd8XZeKGrrhgaS0jZ
         VySGW9bY7R4yd5WNSDKXo75aaGxqAJtQ/OSBOUrqFdpUa4bt0vNCr8fXsqQn5DOkCxaH
         EotDb0SlRXlSeVSW1oSa3wIOti/+k11WV+By9nY3njF7qBreiSCq37eNv7XL4zvPnQuB
         QrySfYGXhivjSuH2qwYY6FE7vkiyi/YOqzIUAYc00G6WNV/m3W8er60GvtuOZeuM0bAA
         HlLw==
X-Forwarded-Encrypted: i=1; AJvYcCWeXr6kAYD+0DTRi45WxakzRz4WQbM/gYqxQNx6MIJ9ZZAlI7oUrHWPfnnqJz70TfNs6MtpFXxEqc841g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfanEnhkylXPcxLo5tcOWPOoxespdl2yI2u1dUrCaVUJGBwzr6
	0aEmIzg8HzFhwwUK1s9NuXO/gsObVGL0NKUXXzyWRygmx0xUKySh36Fm3QB4PqtUOSUt+Rcss4N
	ib6F/9ngL1ihLlK7lNVaQvd4QTG+95kyvTj4fGdihfw==
X-Gm-Gg: ASbGncuzh2m4Yi+3vkLXkD62RjDC92OVEb/KLmGu4Xev7wRUPhFXYWKpcIrM2a3rB6q
	R9DAJw5BOzaTgsFQg7EJmpP0iqSyavZXlVNlFuMDYqUck9h++Lw31BnYMtaam1UJySZoJYoosrd
	lZZa4o21ycHDpWOFQS85iLxBp1Z5rPHrn3IA==
X-Google-Smtp-Source: AGHT+IHcnwyoLk78Sdyqna09vDLwno8N4DKtCoMRIDEgmxMn5EJ8+I+135oFuaEbt0jukPgDX+G63PqFO04gyL6xVSo=
X-Received: by 2002:a05:6820:2610:b0:5fe:9edb:eafe with SMTP id
 006d021491bc7-60b9fba1696mr6694046eaf.5.1748358452253; Tue, 27 May 2025
 08:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-9-jens.wiklander@linaro.org> <aDQhn9_fezC42GwS@sumit-X1>
In-Reply-To: <aDQhn9_fezC42GwS@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 17:07:18 +0200
X-Gm-Features: AX0GCFv4xwxS381XBNqHvZmFreXW7Y4SbgNJb3O8wPMOP2rKatTJj8xDdz14iuA
Message-ID: <CAHUa44HFPu87JCHDxu6HWAp6YaXrHFwi55JHTb9X=JvTz30XpA@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] optee: FF-A: dynamic protected memory allocation
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

On Mon, May 26, 2025 at 10:09=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Tue, May 20, 2025 at 05:16:51PM +0200, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver dynamic protected memory
> > allocation with FF-A.
> >
> > The protected memory pools for dynamically allocated protected memory
> > are instantiated when requested by user-space. This instantiation can
> > fail if OP-TEE doesn't support the requested use-case of protected
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
[...]
> > +static int optee_ffa_protmem_pool_init(struct optee *optee, u32 sec_ca=
ps)
> > +{
> > +     enum tee_dma_heap_id id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_protmem_pool *pool;
> > +     int rc =3D 0;
> > +
> > +     if (sec_caps & OPTEE_FFA_SEC_CAP_PROTMEM) {
> > +             pool =3D optee_protmem_alloc_dyn_pool(optee, id);
> > +             if (IS_ERR(pool))
> > +                     return PTR_ERR(pool);
> > +
> > +             rc =3D tee_device_register_dma_heap(optee->teedev, id, po=
ol);
> > +             if (rc)
> > +                     pool->ops->destroy_pool(pool);
> > +     }
> > +
> > +     return rc;
> > +}
> > +
> >  static int optee_ffa_probe(struct ffa_device *ffa_dev)
> >  {
> >       const struct ffa_notifier_ops *notif_ops;
> > @@ -918,7 +1057,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >                                 optee);
> >       if (IS_ERR(teedev)) {
> >               rc =3D PTR_ERR(teedev);
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >       optee->teedev =3D teedev;
> >
> > @@ -965,6 +1104,9 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >                              rc);
> >       }
> >
> > +     if (optee_ffa_protmem_pool_init(optee, sec_caps))
>
> Let's add a Kconfig check for DMABUF heaps support here as well.

I prefer complaining in the log if there's something wrong with the
configuration.

>
> > +             pr_info("Protected memory service not available\n");
> > +
[...]
> > +static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
> > +{
> > +     int rc;
> > +
> > +     rp->protmem =3D tee_shm_alloc_dma_mem(rp->optee->ctx, rp->page_co=
unt);
> > +     if (IS_ERR(rp->protmem)) {
> > +             rc =3D PTR_ERR(rp->protmem);
> > +             goto err_null_protmem;
> > +     }
> > +
> > +     /*
> > +      * TODO unmap the memory range since the physical memory will
> > +      * become inaccesible after the lend_protmem() call.
>
> Let's ellaborate this comment to also say that unmap isn't strictly
> needed here in case a platform supports hypervisor in EL2 which can
> perform unmapping as part for memory lending to secure world as that
> will avoid any cache pre-fetch of memory lent to secure world.
>
> With that I can live with this as a ToDo in kernel which can be
> implemented once we see platforms requiring this change to happen.

OK, I'll add something.

[...]
> > +
> > +struct tee_protmem_pool *optee_protmem_alloc_dyn_pool(struct optee *op=
tee,
> > +                                                   enum tee_dma_heap_i=
d id)
> > +{
> > +     struct optee_protmem_dyn_pool *rp;
> > +     u32 use_case =3D id;
>
> Here we can get rid of redundant extra variable with s/id/use_case/.

OK, I'll update.

Cheers,
Jens

