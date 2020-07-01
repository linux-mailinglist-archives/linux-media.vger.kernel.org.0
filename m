Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5439D210B16
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 14:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730529AbgGAMdk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 08:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729959AbgGAMdj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 08:33:39 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9174AC03E979
        for <linux-media@vger.kernel.org>; Wed,  1 Jul 2020 05:33:39 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id w17so13398702otl.4
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2020 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0/gKTgSPNiK1GV7dg8cAvLDkoEQTeqakLc9QEbntdl8=;
        b=fbdbTMw6Tb5X5nBvth0KPuKI856tB9W1ecb/TeVlGM2Sh2CqgtwD+f0+jNkWeSyzLX
         CueKuadzdH8A/E895sVW/RkBioxsTo6P8FV+JOyviJQqSzwSbOwhqm/xetV4x9suSlV3
         vC4pOo4pcTtuXA3sBZzFzPyFUD7Y0x+JWf4Vbc+FzL+4bbXUjXGTsVEUD3tMIe46a87p
         JTc/HkEikxDv68bmtcm4+7ds+RsM/qNi1u1Q1DKQE0jzkD6jJCiCBpay5zV/hyL4y1R8
         /Ng/L3vunJT7DVpBN8OYlPNPkRlXZoefjAfuUx3H8OF06JFdM8304vUFQp9baB4nm8Fx
         apaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0/gKTgSPNiK1GV7dg8cAvLDkoEQTeqakLc9QEbntdl8=;
        b=uTqkszDNHVKaqrwwQFIt317XRVmh+msxpTf3tQ2dYAmouh60Ld9pSDqBJlKiaUZdGe
         Xn90NzvOhODlZqo37Op48TNTovAp8xRS6EnxLLvAuj12Lqk6PsliUYWLRqZ/vQT1nsAo
         abXFXjE/GdZH+ckwOggah683rSIvUDuhxvWPw/KeuuHcj4TdYPq8kMzJzaIQhKDEb7/U
         xo4/nT3CRcNkI/8U3MfM+xslfSF+kGpK5y6RZ+jAHk5K4eAB9kHjmYNiAIHczhYur+DD
         bIsDD56dr4fyo2tZeBm6HRso92lhYxAKhJl8jXHbjm1jaWS1pMV9c+Ine6M6TP0KvY7Y
         o5pw==
X-Gm-Message-State: AOAM532W6GVPANNNGtORN0GE9niFAe63GliCx780cOPGXyf97zlECCzK
        WY2JfXth0YaxPPH2eec0XsUYciBf5acJnixgQJoOxA==
X-Google-Smtp-Source: ABdhPJx/rWPPNwXFCHG8PvPxNDYMqAHV8vIuxP4r0bLP3udJYhyRjrkyu0A1QaxqcR0enaXl2VCUcwVxaN76M1jvyJI=
X-Received: by 2002:a05:6830:2405:: with SMTP id j5mr22837641ots.371.1593606818955;
 Wed, 01 Jul 2020 05:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200701112559.22669-1-christian.koenig@amd.com> <CAKMK7uHqNaQPwATQf=Jfs6oQ=YEemHSHTEtC2=VqvNf+bMh_sQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHqNaQPwATQf=Jfs6oQ=YEemHSHTEtC2=VqvNf+bMh_sQ@mail.gmail.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 1 Jul 2020 18:03:27 +0530
Message-ID: <CAO_48GGh2zir-hszCv4Mp36REEKPwhcOmwj93kF5otFmkf8cOw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as DMA-buf maintainer
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for all the good work here, Christian!

On Wed, 1 Jul 2020 at 17:20, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 1, 2020 at 1:26 PM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > As discussed on the list.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 40474982a21d..5d7130f8d342 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5089,6 +5089,7 @@ F:        fs/dlm/
> >
> >  DMA BUFFER SHARING FRAMEWORK
> >  M:     Sumit Semwal <sumit.semwal@linaro.org>
> > +M:     Christian K=C3=B6nig <christian.koenig@amd.com>
> >  L:     linux-media@vger.kernel.org
> >  L:     dri-devel@lists.freedesktop.org
> >  L:     linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> > --
> > 2.20.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


Best,
Sumit
