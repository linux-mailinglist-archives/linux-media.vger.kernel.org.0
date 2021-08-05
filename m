Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D0C3E0D52
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 06:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234675AbhHEEdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 00:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbhHEEdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 00:33:14 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6ACC061765;
        Wed,  4 Aug 2021 21:32:59 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id g5-20020a9d6b050000b02904f21e977c3eso3919208otp.5;
        Wed, 04 Aug 2021 21:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WPmSYKxM3hDxf4j2HGMY4KEBqM5rWpME+JCZGt0gVjw=;
        b=d6lgTlgZ4XtRuTrGFwjnfu6FMANDeGYNkF3HVRgAEz3zNJWeXPay2/77o5xUFwchyy
         fZ+RxFE6PKyFPBCA/PrBqv7fb7Ru/8F66ANYljfjpCZek/EgK9BnwwHV0KtaiOXGOBHC
         awwvqO+5eU4YhGFJjXO4OaZpU6kBceP9x20lc/jksWMCQHnZ8orlDNKyp4wj86imwnCD
         6YKPbF79Crl7D4d2jD8s0rV9wTcK0I3OjHVcLIxaFULDXF9ynJoOKulQ9ZfLCD/pGLv1
         zFEDI6x2G+joB+ZOQckwYoiMZ1LQcX9rian6mNKcuPDevnN7/eoOCrSnqHj1w21TH/v7
         BVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WPmSYKxM3hDxf4j2HGMY4KEBqM5rWpME+JCZGt0gVjw=;
        b=OwLFiVGMaYs2wDyCqgFTesxXRTkK0RCB+Nax1y40ep8X1Fg880NTtYddXvGDPbozet
         iUIifVJRDjG3WwF1pFn426gFY27IK2m2wYYojXuumNpa8/7YcYVZpob4/8tFLPA4D/Ks
         dr7F0lP+Xi+/77TxrvYSyY8vE+r/0NGHyVe+PR30ikvPBtHcYIhT1AlHSp1ecoQss8AH
         LAtk869RYvpanRiYpLOyGQhbQVSz5zJykVbf2s9A/C52vGvQGZvwLUrPOIpjIq0L72UN
         166rzXaaUl06WsMgLbyqba+gFbtXX1GPQGePJJ4NCkL9qHptOPt55y/ruvwRpWp7Z5/a
         SY0Q==
X-Gm-Message-State: AOAM5309XmTxbcm8DhxlzklWmMnfVp3IJ7gSh9JqbpAo4F9055//+dF+
        Uxbgx7j+xgdUVNz17VMbML1lMD+0ct0+e5Zid5k=
X-Google-Smtp-Source: ABdhPJxVoTU6a30brhTf1IeElqkRglO5k+x+tHkN0DLsz3Nd4Duri9Cmng8GzMH9mtkqISPNR9a5gCNiMTCPSizufzw=
X-Received: by 2002:a9d:70c3:: with SMTP id w3mr2216613otj.311.1628137979011;
 Wed, 04 Aug 2021 21:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210804015132.29617-1-islituo@gmail.com> <f515880f-17f8-66b3-20d9-c1a46a252463@amd.com>
In-Reply-To: <f515880f-17f8-66b3-20d9-c1a46a252463@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 5 Aug 2021 00:32:47 -0400
Message-ID: <CADnq5_MSp=PAqbaTrS771ssKJzVpT2LyDTjZCSx2hh-DFo3MXg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: drop redundant null-pointer checks in
 amdgpu_ttm_tt_populate() and amdgpu_ttm_tt_unpopulate()
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Tuo Li <islituo@gmail.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        xinhui pan <Xinhui.Pan@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dave Airlie <airlied@redhat.com>,
        "Kuehling, Felix" <Felix.Kuehling@amd.com>,
        Oak Zeng <Oak.Zeng@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Yang, Philip" <Philip.Yang@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        TOTE Robot <oslab@tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  Thanks!

Alex

On Wed, Aug 4, 2021 at 2:49 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 04.08.21 um 03:51 schrieb Tuo Li:
> > The varialbe gtt in the function amdgpu_ttm_tt_populate() and
> > amdgpu_ttm_tt_unpopulate() is guaranteed to be not NULL in the context.
> > Thus the null-pointer checks are redundant and can be dropped.
> >
> > Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> > Signed-off-by: Tuo Li <islituo@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 3a55f08e00e1..719539bd6c44 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -1121,7 +1121,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_devi=
ce *bdev,
> >       struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
> >
> >       /* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
> > -     if (gtt && gtt->userptr) {
> > +     if (gtt->userptr) {
> >               ttm->sg =3D kzalloc(sizeof(struct sg_table), GFP_KERNEL);
> >               if (!ttm->sg)
> >                       return -ENOMEM;
> > @@ -1146,7 +1146,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_d=
evice *bdev,
> >       struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
> >       struct amdgpu_device *adev;
> >
> > -     if (gtt && gtt->userptr) {
> > +     if (gtt->userptr) {
> >               amdgpu_ttm_tt_set_user_pages(ttm, NULL);
> >               kfree(ttm->sg);
> >               ttm->sg =3D NULL;
>
