Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0096749EBA
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 16:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbjGFONS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 10:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjGFONR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 10:13:17 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833361BC2
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 07:13:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so957676e87.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jul 2023 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688652794; x=1691244794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yEX9Dwmq9IkMrVkFypkMcFrtVKqN7sxBEMnk/SfYko=;
        b=KIbzE3tBdsBciOOqSRH6/ZZfBehQKzbpLVe1oWyG9ekBBtoqnRWtHPaFa4zHIZkzkG
         TOFHrh+UvfoOV1vfnabddR9BxdOMEAtBmlcSzgEain4XZ7kx1hKTY7BXWIZjLBd47k5R
         nXLVu9RK9ofZQfWoICT9wmFOtHcQ0a9b8zgrGnd4RMEKfPahZD5ul67d/y/AwW26YKbP
         WLqaUtcrBoO+AFwc2zsxOiGq8hKPsYXgPnPO5LkBH4RjehlRPUSl2NXX4ERqCdg40JSt
         c9zmYv1wziwZPoolLx0EHe9SO0jUlyFYY6pAC9ANzRJzhHdJAWsLak6dYIfoanqP7MuE
         u0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688652794; x=1691244794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yEX9Dwmq9IkMrVkFypkMcFrtVKqN7sxBEMnk/SfYko=;
        b=O92o6jaJLLnKQrLZA383zOe4i+HRKS8W7ZagegqtlOLQWbL9JGsxcepmS4kbE4xIYp
         YpOC4yD960K7tBHrOU+9YqEi3FX0tqqIV8uNHvpZqU/VS99+c7b6I1MHqbl3lhF4Pqpk
         arj4hIS3PzgDg2xfUFK/PoeTLGAlDsfTbchKoSBdioGKF32Ads+5bP8bboLKY4YM+Cko
         N89aqo39lAoWXmfg5JriPI4/fWZ/IjuoUKbhH+9DMiAiBucLfTG3WXJORRd9Ere33KhK
         Krtb51FRx/m2OB17hTi7G0lQrfLU/7UOm+UQefrHEftCtn/5kWsYQtk3ABqf2ixwGtB9
         F/sA==
X-Gm-Message-State: ABy/qLaPX+pbpfZ0srPDpzjhh7VURLWBO8Ruy42NhVww0OkNv8rTc0p2
        v3dnTpMJLgLsid2WhGPwB9xOtA8xjIiEtPTwIy3HNg==
X-Google-Smtp-Source: APBJJlF2RWXaT3XjF4XIoYgd+D9lcGt7c9IIXSMJx5LdyPV6oT4nr9r3uapzOVUQJRnkj5wq6GFrBIH0wyFRrEbvlr0=
X-Received: by 2002:a05:6512:3c9f:b0:4fb:829b:196e with SMTP id
 h31-20020a0565123c9f00b004fb829b196emr2526477lfv.2.1688652793506; Thu, 06 Jul
 2023 07:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <b09f1996-3838-4fa2-9193-832b68262e43@moroto.mountain> <ed3ef0ec-140d-59f1-b37e-4731d763a11b@amd.com>
In-Reply-To: <ed3ef0ec-140d-59f1-b37e-4731d763a11b@amd.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 6 Jul 2023 19:43:01 +0530
Message-ID: <CAO_48GF61m4-RtiTEf9a5ntoX6jY66=hLTWe0A1XRUO8PsZkAw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: fix an error pointer vs NULL bug
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 6 Jul 2023 at 18:24, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 06.07.23 um 14:37 schrieb Dan Carpenter:
> > Smatch detected potential error pointer dereference.
> >
> >      drivers/gpu/drm/drm_syncobj.c:888 drm_syncobj_transfer_to_timeline=
()
> >      error: 'fence' dereferencing possible ERR_PTR()
> >
> > The error pointer comes from dma_fence_allocate_private_stub().  One
> > caller expected error pointers and one expected NULL pointers.  Change
> > it to return NULL and update the caller which expected error pointers,
> > drm_syncobj_assign_null_handle(), to check for NULL instead.
> >
> > Fixes: f781f661e8c9 ("dma-buf: keep the signaling time of merged fences=
 v3")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
Thanks for catching this!
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Reviewed-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Should I push that one to drm-misc-fixes?
If you haven't pushed already, I can push it now.
>
> Regards,
> Christian.

Best,
Sumit.
>
> > ---
> > v2: Fix it in dma_fence_allocate_private_stub() instead of
> >     __dma_fence_unwrap_merge().
> >
> >
> >   drivers/dma-buf/dma-fence.c   | 2 +-
> >   drivers/gpu/drm/drm_syncobj.c | 4 ++--
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index ad076f208760..8aa8f8cb7071 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -160,7 +160,7 @@ struct dma_fence *dma_fence_allocate_private_stub(k=
time_t timestamp)
> >
> >       fence =3D kzalloc(sizeof(*fence), GFP_KERNEL);
> >       if (fence =3D=3D NULL)
> > -             return ERR_PTR(-ENOMEM);
> > +             return NULL;
> >
> >       dma_fence_init(fence,
> >                      &dma_fence_stub_ops,
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 04589a35eb09..e592c5da70ce 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -355,8 +355,8 @@ static int drm_syncobj_assign_null_handle(struct dr=
m_syncobj *syncobj)
> >   {
> >       struct dma_fence *fence =3D dma_fence_allocate_private_stub(ktime=
_get());
> >
> > -     if (IS_ERR(fence))
> > -             return PTR_ERR(fence);
> > +     if (!fence)
> > +             return -ENOMEM;
> >
> >       drm_syncobj_replace_fence(syncobj, fence);
> >       dma_fence_put(fence);
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
