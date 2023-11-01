Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECFB37DDBA4
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 04:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbjKADoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 23:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbjKADn4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 23:43:56 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE66A4
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 20:43:48 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507f1c29f25so8786737e87.1
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 20:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698810226; x=1699415026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nql7qkvVnQqjv0jERnZy9lcP0gRZwVp2yGYx0BcAV8c=;
        b=Zooo7XG9TLKqe4AlIOIhS5xHaVLWYsuSGjRG5qz7n4WIDLjr8BTq/h9AV6dlM/sA/H
         l6q6wEw+95ZwdmEBXB3K14plV8aPSgMzWTKrl6yMeVzwo7F3tKIQ7EVsbgVhcGSBArlG
         uVu/JZq7LQ6TQ3UJjBl2eG7cLXSPAq9KtPzx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698810226; x=1699415026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nql7qkvVnQqjv0jERnZy9lcP0gRZwVp2yGYx0BcAV8c=;
        b=tzLRFq7d3MNWyZ2EOhuXFrZiunK+R1KFggd6LyuStVQ5+HU6Mk+5L3Ot0ZnighEDAQ
         MOv2ulTlp1eEpLW18WQlEBQ/Xz8WUtly8iL/fDc5r2lLI1LjRwvB/My80HdpwGG0zKZ5
         5k7ELkfOHHE2GE2FcUeGxumVd9r2L0JphH8QdJgiReZUM53YmGRyzjV48/Zngwun3Lek
         wxjch5KEUntskhQ0GCQ6BkIYmbqr2oo/FWKfPyaMZFRBkAgy9xKSvu2Kx59HofPvUpLf
         sVz7fzmk/BG9AL69pivjGuF36y7Rgo23BKJGZnNypoRMlM12zDPqDHRZw4pzNW0RjPUN
         0YzQ==
X-Gm-Message-State: AOJu0Yyb+2r7rpm7QhUBEKDscLjlDh96xwdO7sJGQCMMDTh6cnYAvZY0
        +kLuhCM3NCIoOAT89NdKmw+g5NmMObJ6cCjkVWjXJA==
X-Google-Smtp-Source: AGHT+IH5WTkeMRqXs+9lMw2wZv8J9Jb3FfacbTn1w3u//eHKhG1NtDMQIgq1h2apnZRdIe5YST9r+w==
X-Received: by 2002:a05:6512:3a8b:b0:509:1207:5e9a with SMTP id q11-20020a0565123a8b00b0050912075e9amr10193528lfu.42.1698810225749;
        Tue, 31 Oct 2023 20:43:45 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id z22-20020aa7cf96000000b0053e8bb112adsm498012edx.53.2023.10.31.20.43.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 20:43:45 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32f87b1c725so2218928f8f.3
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 20:43:45 -0700 (PDT)
X-Received: by 2002:adf:d1e3:0:b0:32f:7cb7:f66 with SMTP id
 g3-20020adfd1e3000000b0032f7cb70f66mr10972974wrd.20.1698810225023; Tue, 31
 Oct 2023 20:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221120234441.550908-1-m.grzeschik@pengutronix.de>
 <5e585a78-15c8-fd17-bc34-96f7ed18f592@xs4all.nl> <CAAFQd5Aicurw-pjYpWJK_qNemy1qszvN4rL=TfAuxhOdAOTGNg@mail.gmail.com>
 <20230510142509.GA14356@pengutronix.de> <CAAFQd5AmVBc6LQ1eyZ=WrvtLR4oSD4K0mMeszcuY12CK7djiUA@mail.gmail.com>
In-Reply-To: <CAAFQd5AmVBc6LQ1eyZ=WrvtLR4oSD4K0mMeszcuY12CK7djiUA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 1 Nov 2023 12:43:25 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D_o3wE98=wFXR2nbWkpCAdCDxz2tP8ssSSYVkZ5iC1Qg@mail.gmail.com>
Message-ID: <CAAFQd5D_o3wE98=wFXR2nbWkpCAdCDxz2tP8ssSSYVkZ5iC1Qg@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2-dma-sg: use v{un,}map instead of vm_{un,}map_ram
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, m.szyprowski@samsung.com,
        kernel@pengutronix.de,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 16, 2023 at 7:50=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> wr=
ote:
>
> Hi Michael,
>
> On Wed, May 10, 2023 at 11:25=E2=80=AFPM Michael Grzeschik <mgr@pengutron=
ix.de> wrote:
> >
> > Sorry for the late comeback, however here are some thoughts.
> >
> > On Fri, Dec 02, 2022 at 06:01:02PM +0900, Tomasz Figa wrote:
> > >On Thu, Nov 24, 2022 at 10:35 PM Hans Verkuil <hverkuil@xs4all.nl> wro=
te:
> > >>
> > >> On 21/11/2022 00:44, Michael Grzeschik wrote:
> > >> > The comments before the vm_map_ram function state that it should b=
e used
> > >> > for up to 256 KB only, and video buffers are definitely much large=
r. It
> > >> > recommends using vmap in that case.
> > >> >
> > >> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > >> > ---
> > >> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 7 ++++---
> > >>
> > >> drivers/media/common/videobuf2/videobuf2-vmalloc.c uses it as well,
> > >> probably also incorrectly. It makes sense to change that one as well=
.
> > >
> > >Comparing vm_map_ram() and vmap(..., VM_MAP, PAGE_KERNEL), for blocks
> > >bigger than VMAP_MAX_ALLOC they're equivalent and for smaller blocks
> > >the former should be faster, so I don't see what's wrong with the
> > >current code.
> >
> > I got another comment on this from Andrzej Pietrasiewicz
> > where he expands the comment on the use of vmap over vm_map_ram.
> >
> > https://lore.kernel.org/linux-media/64375ff4-dbbb-3d5b-eaf6-32d6780fd49=
6@collabora.com
> >
> > As I understand this, we should probably update the vm_map_ram to vmap,
> > due to the expectation that video buffers are long-living objects.
> >
> > Since there are some more places that would probably need to be updated
> > if we should decide to use vmap over vm_map_ram in the whole
> > videbuf2-* users, I would like to clarify on this before making
> > a series.
>
> Ah, I see. Thanks for the pointer.
>
> VB2 buffers would usually require long-lived mappings, so based on
> that, we should switch to vmap() indeed.
>
> As a side note, not directly related to this patch, I wonder if we
> should also call invalidate/flush_kernel_vmap_range() in
> vb2_dma_sg_prepare/finish(). (In principle we shouldn't, but so far
> our drivers don't explicitly call begin/end_cpu_access() and rely on
> prepare/finish to handle the cache maintenance of the kernel
> mapping...) Let me also add Sergey on CC for visibility.

Sorry, I forgot last time, so maybe it wasn't clear I'm good with this patc=
h:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Hans, will you pick it? Thanks!

>
> Best regards,
> Tomasz
>
> >
> > Regards,
> > Michael
> >
> > >> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >> >
> > >> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/d=
rivers/media/common/videobuf2/videobuf2-dma-sg.c
> > >> > index dcb8de5ab3e84a..e86621fba350f3 100644
> > >> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > >> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > >> > @@ -188,7 +188,7 @@ static void vb2_dma_sg_put(void *buf_priv)
> > >> >               dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> > >> >                                 DMA_ATTR_SKIP_CPU_SYNC);
> > >> >               if (buf->vaddr)
> > >> > -                     vm_unmap_ram(buf->vaddr, buf->num_pages);
> > >> > +                     vunmap(buf->vaddr);
> > >> >               sg_free_table(buf->dma_sgt);
> > >> >               while (--i >=3D 0)
> > >> >                       __free_page(buf->pages[i]);
> > >> > @@ -289,7 +289,7 @@ static void vb2_dma_sg_put_userptr(void *buf_p=
riv)
> > >> >              __func__, buf->num_pages);
> > >> >       dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP=
_CPU_SYNC);
> > >> >       if (buf->vaddr)
> > >> > -             vm_unmap_ram(buf->vaddr, buf->num_pages);
> > >> > +             vunmap(buf->vaddr);
> > >> >       sg_free_table(buf->dma_sgt);
> > >> >       if (buf->dma_dir =3D=3D DMA_FROM_DEVICE ||
> > >> >           buf->dma_dir =3D=3D DMA_BIDIRECTIONAL)
> > >> > @@ -312,7 +312,8 @@ static void *vb2_dma_sg_vaddr(struct vb2_buffe=
r *vb, void *buf_priv)
> > >> >                       ret =3D dma_buf_vmap(buf->db_attach->dmabuf,=
 &map);
> > >> >                       buf->vaddr =3D ret ? NULL : map.vaddr;
> > >> >               } else {
> > >> > -                     buf->vaddr =3D vm_map_ram(buf->pages, buf->n=
um_pages, -1);
> > >> > +                     buf->vaddr =3D vmap(buf->pages, buf->num_pag=
es, VM_MAP,
> > >> > +                                       PAGE_KERNEL);
> > >> >               }
> > >> >       }
> > >> >
> > >>
> > >
> >
> > --
> > Pengutronix e.K.                           |                           =
  |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/=
  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
