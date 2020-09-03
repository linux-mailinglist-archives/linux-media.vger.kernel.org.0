Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68FF725C482
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 17:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbgICPLy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 11:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728849AbgICM1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 08:27:31 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17ADAC061251
        for <linux-media@vger.kernel.org>; Thu,  3 Sep 2020 05:22:13 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s205so3425694lja.7
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2020 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AmASOpjxirKUPe5KF2kTy+958y5fGEm2GLzYZrAWmY0=;
        b=i0y2uYMmTvexrD5BT2Rg+2fR0wxA2Yuw2kq4ZFSIPgBWPk+zTIRox7tLo/V7J1IDcg
         /zGL+yZo0kczuHH1lpR6RfLpnpsjbK1Xp0ad2DHuWiTiwIFLLDyXSUCe+EHEXlAi3p/e
         pUr+iDCt5+xuvOEFlzj81oBsxg91JWPrhoQrh/NEf6k/eN5Qg/a80myuftRM/DW9XmNC
         ipV330QqlNcjkmijfbJW8+o9rHOfLN3FmFatTgkTg9EzG5KQ3wG5MwH0rOaFzRGEbvkH
         hEhTtGPWREF3ecaEB8e8krjUDxI3vOI+oVG2I+4TqSvovZEv6c27pjXJC4dege2SgzxD
         u2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AmASOpjxirKUPe5KF2kTy+958y5fGEm2GLzYZrAWmY0=;
        b=udT06ikKWcUWra9z5MD4dj1p2tfPdz1XJjUMYGiWSbXHxVYXei3hEeGQ36dN4RYybq
         oBzbAPKISD8GnkZVhdya2tHFu84c5DuEBc32QcNFGfmAWlrHHucxZ+LxAqXFXn3hA5i0
         zAVFvJeYfUJ7IE09tUVMQtkD/7O1fIjNEu+3rY5sThectM9JBcxvWQlvoLWlPby+p/sf
         SYEVp6RblhHX+ohYGxHzHTb/EGLe8wwPD5vT6RLGrDPaL4BSpkPY35BwdaXy2xl+H02x
         wBx3kKtIqOTAJJobbleoH4Rm46jeSCSN5sUTexDzS8IYbfxNm4/mtpKZaPPqAcsaE5c2
         UvLQ==
X-Gm-Message-State: AOAM531a2Dalqc9OwsGyaxzpMhnGk/8p4QaZI9i68eLApUbE3a+u15SP
        B8LbrYkn1Zb9GNj/6jJlTxnSU0qoydxvndSKMFJaQg==
X-Google-Smtp-Source: ABdhPJwQ0KpxtLPZAseSnphNEoFuICKHObdYRxY2PW9uBsaYw3EIqCfxJnx9Lxv1GfE40giqNWLH6sOOChl2QA2RQ2I=
X-Received: by 2002:a2e:b892:: with SMTP id r18mr1073176ljp.249.1599135731427;
 Thu, 03 Sep 2020 05:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598331148.git.joe@perches.com> <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <d5ea3bc7-bff2-c702-51ed-cb85767824a7@amd.com>
In-Reply-To: <d5ea3bc7-bff2-c702-51ed-cb85767824a7@amd.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 3 Sep 2020 17:51:59 +0530
Message-ID: <CAO_48GGeXrDe9F1S64pf4qeF-2vMMiwOTZXOXDctAdPO5Pn04w@mail.gmail.com>
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Joe,

On Wed, 26 Aug 2020 at 20:38, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 25.08.20 um 06:56 schrieb Joe Perches:
> > Use semicolons and braces.
> >
> > Signed-off-by: Joe Perches <joe@perches.com>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
FWIW,
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

>
> > ---
> >   drivers/dma-buf/st-dma-fence.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fe=
nce.c
> > index e593064341c8..c8a12d7ad71a 100644
> > --- a/drivers/dma-buf/st-dma-fence.c
> > +++ b/drivers/dma-buf/st-dma-fence.c
> > @@ -471,8 +471,11 @@ static int thread_signal_callback(void *arg)
> >                       dma_fence_signal(f1);
> >
> >               smp_store_mb(cb.seen, false);
> > -             if (!f2 || dma_fence_add_callback(f2, &cb.cb, simple_call=
back))
> > -                     miss++, cb.seen =3D true;
> > +             if (!f2 ||
> > +                 dma_fence_add_callback(f2, &cb.cb, simple_callback)) =
{
> > +                     miss++;
> > +                     cb.seen =3D true;
> > +             }
> >
> >               if (!t->before)
> >                       dma_fence_signal(f1);
>
