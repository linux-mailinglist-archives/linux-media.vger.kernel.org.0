Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53AF1571B30
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 15:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbiGLN1T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 09:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbiGLN1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 09:27:18 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E86AE389
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 06:27:16 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ez10so14270566ejc.13
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=omKDGKrDnZ/IkPXT5RBomOOPrYkiPKJbtYb6UMrNSaM=;
        b=TdIaTQTUpJe1Qw/zD95bu1yP1ZupdD6IiMyhad4UyI1OuxFJ2RWEVQXV6yPb0tat+I
         e9KgLx+90JCtfHZgNqv1WXvRgyzvc9Im/j3q1Oy5f+xbPluB41jYJbEVkhte0mN/3Ooh
         X2KSsTRVRO1BR9AS7JvKV6kEPhjiRCBNBcrBlJi1Brn6VqHGN2cYs8WEGumBrNu68GSV
         FpQSMxE9Vn4MYm4KMjvc5V6j7K2rPgJKntgD4zngMfwPBy3F418VvH6n2dFxxa8GQW1n
         QD6NknDzPlnCASKL3zadtNcKd/aC0AYe/w7B+bgTG0B8I1063JlPu9mQbfQpgZTbnxfE
         yTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=omKDGKrDnZ/IkPXT5RBomOOPrYkiPKJbtYb6UMrNSaM=;
        b=0bD6oCaiEH95L/0RaSw/H+ZLHn9yRB5p2Be3aAAuAtHuutQ4AIacGC3jLap1EN3XtG
         Ysm/D660wdagnuyuCGFaOfs1W2Q/UyLQT1FrQohuh3uVLYYQDOZ2iabBn3LUHw4+Wcwv
         T5+MCmGAlLB3Jq/G4M0QdlVFz0tItEgBqDAgeua0dCRTarWQicmeo6cRQ3ZcqZ66IaCH
         crTfVttBeY4GFAiQmyhlAnClmEAcl94CeAoYJjHkQ0TTdp8kRJ6WUnlIGrray7FHBtRi
         x5cWsbkB6BJQuZIxHsQT9X2VKPiSBVLF45CUfp8vklvd0hyEVC0SMTJVj90QXgJCh2rh
         iKAA==
X-Gm-Message-State: AJIora9J+Af4FEIhpJUnQVXXZ52Yooz7D3OUBOYEXhNrI3Tnzy9RmyL/
        AG4RVRCF+0Q/Cz/zoDc9wj4FNmwt3NeZJxW8Xn0=
X-Google-Smtp-Source: AGRyM1vOjvHM7mJAaDS7p1aTNG5U9p4boViVosKcsmm6k5RlVqpv6fPQo4roJps+C/WvQc7z+WABdeKSoMHsgw7D5EY=
X-Received: by 2002:a17:907:2888:b0:72b:8f41:1405 with SMTP id
 em8-20020a170907288800b0072b8f411405mr168023ejc.564.1657632434858; Tue, 12
 Jul 2022 06:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <6570e584-7ddc-4029-0555-276020750dd2@intel.com> <f4804bb1-4f0e-2755-6b00-8aa0ba1c5c90@amd.com>
In-Reply-To: <f4804bb1-4f0e-2755-6b00-8aa0ba1c5c90@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 12 Jul 2022 09:27:03 -0400
Message-ID: <CADnq5_Mv=4G1qb7J7a2nm=7cVWSbRxrRBBNKpaeajKOj_cGp3g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Karolina Drobnik <karolina.drobnik@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 12, 2022 at 8:06 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi Karolina,
>
> Am 12.07.22 um 14:04 schrieb Karolina Drobnik:
> > Hi Christian,
> >
> > On 12.07.2022 12:28, Christian K=C3=B6nig wrote:
> >> This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.
> >>
> >> It turned out that this is not correct. Especially the sync_file info
> >> IOCTL needs to see even signaled fences to correctly report back their
> >> status to userspace.
> >>
> >> Instead add the filter in the merge function again where it makes sens=
e.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > After applying the patch, fence merging works and all sw_sync subtests
> > are passing. Thanks for taking care of this.
> >
> > Tested-by: Karolina Drobnik <karolina.drobnik@intel.com>
>
> can anybody give me an rb or at least an Acked-by as well so that I can
> push this upstream?

Patch makes sense.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Thanks,
> Christian.
>
> >
> >> ---
> >>   drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
> >>   include/linux/dma-fence-unwrap.h   | 6 +-----
> >>   2 files changed, 3 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-fence-unwrap.c
> >> b/drivers/dma-buf/dma-fence-unwrap.c
> >> index 502a65ea6d44..7002bca792ff 100644
> >> --- a/drivers/dma-buf/dma-fence-unwrap.c
> >> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> >> @@ -72,7 +72,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned
> >> int num_fences,
> >>       count =3D 0;
> >>       for (i =3D 0; i < num_fences; ++i) {
> >>           dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> >> -            ++count;
> >> +            if (!dma_fence_is_signaled(tmp))
> >> +                ++count;
> >>       }
> >>         if (count =3D=3D 0)
> >> diff --git a/include/linux/dma-fence-unwrap.h
> >> b/include/linux/dma-fence-unwrap.h
> >> index 390de1ee9d35..66b1e56fbb81 100644
> >> --- a/include/linux/dma-fence-unwrap.h
> >> +++ b/include/linux/dma-fence-unwrap.h
> >> @@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct
> >> dma_fence_unwrap *cursor);
> >>    * Unwrap dma_fence_chain and dma_fence_array containers and deep
> >> dive into all
> >>    * potential fences in them. If @head is just a normal fence only
> >> that one is
> >>    * returned.
> >> - *
> >> - * Note that signalled fences are opportunistically filtered out, whi=
ch
> >> - * means the iteration is potentially over no fence at all.
> >>    */
> >>   #define dma_fence_unwrap_for_each(fence, cursor, head)            \
> >>       for (fence =3D dma_fence_unwrap_first(head, cursor); fence;    \
> >> -         fence =3D dma_fence_unwrap_next(cursor))            \
> >> -        if (!dma_fence_is_signaled(fence))
> >> +         fence =3D dma_fence_unwrap_next(cursor))
> >>     struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences=
,
> >>                          struct dma_fence **fences,
>
