Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1102A704B10
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 12:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbjEPKue (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 06:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjEPKud (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 06:50:33 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D141FC2
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 03:50:31 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-61b5a6865dfso106669946d6.3
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 03:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684234231; x=1686826231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nKodtrkKNPI7NZ407yPp+4TxNTfcgvO9M875sFCC10=;
        b=gST+Lv377vScfJ0GC0SLVvugi1VCug9qThYTxEYxJpee1UotWEBzKnNhjxJqTbPvwu
         +Dby63YBdpaR8BTGzFz1aKgLChdtKWhNStvsuWrbs1l3QTnuJBXcgb+YGpYles9klB2o
         IT44ojJctNq/I1grjxYZH2rYI0AMkMsQNltfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684234231; x=1686826231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nKodtrkKNPI7NZ407yPp+4TxNTfcgvO9M875sFCC10=;
        b=PGHrJ9i6dle1+ay6mT99e/rfAyvlUpgduUT1RArmFbCFehrtJS8iINGiBceIJLNvTB
         WmyLyzFO+b9qPByeOq/Y02cIfQlKdsN7+QcrGr4rL7utVpH746pr98aaSDrSefA6I5bY
         Xo4hzH4T+/O5ABN1cpTekHu9/2OCfk2RNS6PWMB8lFET23DkuChBJpr9VnRGRj/JMFZf
         S97N29YGS1zfiH07SY9Je8MM55TQ/vV4vcUxW5WmCRl33F4krfZ/+BR9wHc3GHvQrEXh
         L+y5VGwCO8JNbNY7pGCd3kWsNwXV+kCwsZ5Tv/HQ8UlfH/Y2Wrm2zmg2XIZFkI/5dUTd
         rTtg==
X-Gm-Message-State: AC+VfDwKhPhNqlJiBn8//BK/lyYRoD5RM1s2guDUdGa8EqsQqXpFNoC2
        +RimMGAUmhJ9tUtvpV2RXXtpsQ6yOz6uljvkAt5OYCgC
X-Google-Smtp-Source: ACHHUZ5TnHWnHR/7UkeKiEf2demmhxh3ufJvlyjIWttSKIH4+6K0/bRURoh85/GBnu2XS2UnCU3jbw==
X-Received: by 2002:ad4:594e:0:b0:623:74d2:8750 with SMTP id eo14-20020ad4594e000000b0062374d28750mr4108025qvb.17.1684234230781;
        Tue, 16 May 2023 03:50:30 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id n7-20020a056214008700b005ef5f8dc89esm5554459qvr.88.2023.05.16.03.50.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 03:50:30 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-61b5a6865dfso106669826d6.3
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 03:50:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5011:b0:5ef:56e4:f629 with SMTP id
 jo17-20020a056214501100b005ef56e4f629mr63259728qvb.38.1684234229567; Tue, 16
 May 2023 03:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221120234441.550908-1-m.grzeschik@pengutronix.de>
 <5e585a78-15c8-fd17-bc34-96f7ed18f592@xs4all.nl> <CAAFQd5Aicurw-pjYpWJK_qNemy1qszvN4rL=TfAuxhOdAOTGNg@mail.gmail.com>
 <20230510142509.GA14356@pengutronix.de>
In-Reply-To: <20230510142509.GA14356@pengutronix.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 16 May 2023 19:50:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AmVBc6LQ1eyZ=WrvtLR4oSD4K0mMeszcuY12CK7djiUA@mail.gmail.com>
Message-ID: <CAAFQd5AmVBc6LQ1eyZ=WrvtLR4oSD4K0mMeszcuY12CK7djiUA@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2-dma-sg: use v{un,}map instead of vm_{un,}map_ram
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com, kernel@pengutronix.de,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Wed, May 10, 2023 at 11:25=E2=80=AFPM Michael Grzeschik <mgr@pengutronix=
.de> wrote:
>
> Sorry for the late comeback, however here are some thoughts.
>
> On Fri, Dec 02, 2022 at 06:01:02PM +0900, Tomasz Figa wrote:
> >On Thu, Nov 24, 2022 at 10:35 PM Hans Verkuil <hverkuil@xs4all.nl> wrote=
:
> >>
> >> On 21/11/2022 00:44, Michael Grzeschik wrote:
> >> > The comments before the vm_map_ram function state that it should be =
used
> >> > for up to 256 KB only, and video buffers are definitely much larger.=
 It
> >> > recommends using vmap in that case.
> >> >
> >> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> >> > ---
> >> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 7 ++++---
> >>
> >> drivers/media/common/videobuf2/videobuf2-vmalloc.c uses it as well,
> >> probably also incorrectly. It makes sense to change that one as well.
> >
> >Comparing vm_map_ram() and vmap(..., VM_MAP, PAGE_KERNEL), for blocks
> >bigger than VMAP_MAX_ALLOC they're equivalent and for smaller blocks
> >the former should be faster, so I don't see what's wrong with the
> >current code.
>
> I got another comment on this from Andrzej Pietrasiewicz
> where he expands the comment on the use of vmap over vm_map_ram.
>
> https://lore.kernel.org/linux-media/64375ff4-dbbb-3d5b-eaf6-32d6780fd496@=
collabora.com
>
> As I understand this, we should probably update the vm_map_ram to vmap,
> due to the expectation that video buffers are long-living objects.
>
> Since there are some more places that would probably need to be updated
> if we should decide to use vmap over vm_map_ram in the whole
> videbuf2-* users, I would like to clarify on this before making
> a series.

Ah, I see. Thanks for the pointer.

VB2 buffers would usually require long-lived mappings, so based on
that, we should switch to vmap() indeed.

As a side note, not directly related to this patch, I wonder if we
should also call invalidate/flush_kernel_vmap_range() in
vb2_dma_sg_prepare/finish(). (In principle we shouldn't, but so far
our drivers don't explicitly call begin/end_cpu_access() and rely on
prepare/finish to handle the cache maintenance of the kernel
mapping...) Let me also add Sergey on CC for visibility.

Best regards,
Tomasz

>
> Regards,
> Michael
>
> >> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/dri=
vers/media/common/videobuf2/videobuf2-dma-sg.c
> >> > index dcb8de5ab3e84a..e86621fba350f3 100644
> >> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >> > @@ -188,7 +188,7 @@ static void vb2_dma_sg_put(void *buf_priv)
> >> >               dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> >> >                                 DMA_ATTR_SKIP_CPU_SYNC);
> >> >               if (buf->vaddr)
> >> > -                     vm_unmap_ram(buf->vaddr, buf->num_pages);
> >> > +                     vunmap(buf->vaddr);
> >> >               sg_free_table(buf->dma_sgt);
> >> >               while (--i >=3D 0)
> >> >                       __free_page(buf->pages[i]);
> >> > @@ -289,7 +289,7 @@ static void vb2_dma_sg_put_userptr(void *buf_pri=
v)
> >> >              __func__, buf->num_pages);
> >> >       dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_C=
PU_SYNC);
> >> >       if (buf->vaddr)
> >> > -             vm_unmap_ram(buf->vaddr, buf->num_pages);
> >> > +             vunmap(buf->vaddr);
> >> >       sg_free_table(buf->dma_sgt);
> >> >       if (buf->dma_dir =3D=3D DMA_FROM_DEVICE ||
> >> >           buf->dma_dir =3D=3D DMA_BIDIRECTIONAL)
> >> > @@ -312,7 +312,8 @@ static void *vb2_dma_sg_vaddr(struct vb2_buffer =
*vb, void *buf_priv)
> >> >                       ret =3D dma_buf_vmap(buf->db_attach->dmabuf, &=
map);
> >> >                       buf->vaddr =3D ret ? NULL : map.vaddr;
> >> >               } else {
> >> > -                     buf->vaddr =3D vm_map_ram(buf->pages, buf->num=
_pages, -1);
> >> > +                     buf->vaddr =3D vmap(buf->pages, buf->num_pages=
, VM_MAP,
> >> > +                                       PAGE_KERNEL);
> >> >               }
> >> >       }
> >> >
> >>
> >
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
