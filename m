Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3166402D3
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 10:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbiLBJDB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 04:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiLBJCf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 04:02:35 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0751BA5547
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 01:01:18 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id d14so676438edj.11
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 01:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h1PhHVJDCPesM0eSe7QS2h9aMSCkj9RwwRvR8uVR9ak=;
        b=BFx6vCU2CppoVCXkV4YQexNF1QP8spHFTPu7wmmLJltE8DHrTnQay43YkMz/gO7Ic7
         UvGUlk1CAxqXtX0js2Rth7vgmaf5mZPqzncAkUGc4JA02K3Vu4C3WrU6NbGK+oWDDO0v
         v1rxVjAyiPoyo8SmG3qz7vAh98U+n2+kKrLCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1PhHVJDCPesM0eSe7QS2h9aMSCkj9RwwRvR8uVR9ak=;
        b=vv20g7Q5aLOAvSfNw1VzoY/oevedWzmzuHstZcC/A6m4PyOp/z+wwV7oxanPFOhFDi
         vLU8fgvtrcZpM5X79rjzNTEmxLXGNAjgVUBYarwbEYyEYEdLgLBpZFxVjRvtAyT8GVuH
         ml3FMa8u5tRbxbg2wRFUe99QnXQQStAEbNsLLz3VGcGespXgPZ3tPK47UUHqe/W+GZeb
         3No/8Zfun52j6Xvr6PqYSdkZIp/Ja80sKfhL4y75ORk16wiHIoZ4VNe1zgL7n9y79KJd
         XY3InjahLf6aHVj7/w4qrCp+CBm4NKaTPNd85TcCQDgz82RwxxC9xW9Jl/+Q7Fa05ejv
         /9Dw==
X-Gm-Message-State: ANoB5pnkF/4AMcn9yh0TBjqihVDgazSogPotUO15rYlQ+9DK78fXxcze
        pYse0zP0x4VD+b4P6xQapR6B+CjrfsG28JND
X-Google-Smtp-Source: AA0mqf7mHVfZ7YOTOy/w3hXBlAh/aWKATDzE+wM5WzbZv63B7jedi0X3elklondqD+06UurNAMcsQQ==
X-Received: by 2002:a50:9fc3:0:b0:46c:3a7c:9ee7 with SMTP id c61-20020a509fc3000000b0046c3a7c9ee7mr999011edf.208.1669971676280;
        Fri, 02 Dec 2022 01:01:16 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id v1-20020a50a441000000b0046b4e0fae75sm2715210edb.40.2022.12.02.01.01.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 01:01:15 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id b2so10046588eja.7
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 01:01:15 -0800 (PST)
X-Received: by 2002:a17:906:a019:b0:7be:e774:5aad with SMTP id
 p25-20020a170906a01900b007bee7745aadmr9769204ejy.426.1669971675189; Fri, 02
 Dec 2022 01:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20221120234441.550908-1-m.grzeschik@pengutronix.de> <5e585a78-15c8-fd17-bc34-96f7ed18f592@xs4all.nl>
In-Reply-To: <5e585a78-15c8-fd17-bc34-96f7ed18f592@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 2 Dec 2022 18:01:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Aicurw-pjYpWJK_qNemy1qszvN4rL=TfAuxhOdAOTGNg@mail.gmail.com>
Message-ID: <CAAFQd5Aicurw-pjYpWJK_qNemy1qszvN4rL=TfAuxhOdAOTGNg@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2-dma-sg: use v{un,}map instead of vm_{un,}map_ram
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-media@vger.kernel.org, m.szyprowski@samsung.com,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 24, 2022 at 10:35 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 21/11/2022 00:44, Michael Grzeschik wrote:
> > The comments before the vm_map_ram function state that it should be used
> > for up to 256 KB only, and video buffers are definitely much larger. It
> > recommends using vmap in that case.
> >
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 7 ++++---
>
> drivers/media/common/videobuf2/videobuf2-vmalloc.c uses it as well,
> probably also incorrectly. It makes sense to change that one as well.

Comparing vm_map_ram() and vmap(..., VM_MAP, PAGE_KERNEL), for blocks
bigger than VMAP_MAX_ALLOC they're equivalent and for smaller blocks
the former should be faster, so I don't see what's wrong with the
current code.

Best regards,
Tomasz

>
> Regards,
>
>         Hans
>
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > index dcb8de5ab3e84a..e86621fba350f3 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > @@ -188,7 +188,7 @@ static void vb2_dma_sg_put(void *buf_priv)
> >               dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> >                                 DMA_ATTR_SKIP_CPU_SYNC);
> >               if (buf->vaddr)
> > -                     vm_unmap_ram(buf->vaddr, buf->num_pages);
> > +                     vunmap(buf->vaddr);
> >               sg_free_table(buf->dma_sgt);
> >               while (--i >= 0)
> >                       __free_page(buf->pages[i]);
> > @@ -289,7 +289,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
> >              __func__, buf->num_pages);
> >       dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> >       if (buf->vaddr)
> > -             vm_unmap_ram(buf->vaddr, buf->num_pages);
> > +             vunmap(buf->vaddr);
> >       sg_free_table(buf->dma_sgt);
> >       if (buf->dma_dir == DMA_FROM_DEVICE ||
> >           buf->dma_dir == DMA_BIDIRECTIONAL)
> > @@ -312,7 +312,8 @@ static void *vb2_dma_sg_vaddr(struct vb2_buffer *vb, void *buf_priv)
> >                       ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
> >                       buf->vaddr = ret ? NULL : map.vaddr;
> >               } else {
> > -                     buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
> > +                     buf->vaddr = vmap(buf->pages, buf->num_pages, VM_MAP,
> > +                                       PAGE_KERNEL);
> >               }
> >       }
> >
>
