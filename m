Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494EF7C6553
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 08:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347067AbjJLGTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 02:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347066AbjJLGTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 02:19:40 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B4BDB
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 23:19:38 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-45767f1482cso228104137.1
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 23:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697091577; x=1697696377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLM4xkY5G5L1mZIDRFqUS5SrNnKzFAKa0pa3/SYT/44=;
        b=ckujpouajMNNKZmCQ7fTW4KB+6vy74LUt4oWzW0chCUTMQAWQQwtF4D2WFbgZ6v7g5
         +za6D7ye1H+4xGHDEWxpE1yxgxWkmNsUaNSim/LA86g4BHSq2BC+1NxrI5XbSif/S4dC
         7IIhluTBEWu1ikQ8+rgpLUrhfv27y4JyibDWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697091577; x=1697696377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLM4xkY5G5L1mZIDRFqUS5SrNnKzFAKa0pa3/SYT/44=;
        b=b4UogT4kwfxX0dk9PB11rojYHG4doZgYHeOg3Z/qtT/ZDA244v158VZdEd5W/Pxegz
         pVDrraa7yWtdksfAMA5uhI+w/KX6I/dK85IaQtAwd8HPt0sRtZjlEkcrAW94xSm0l2dr
         n6RMjz5Tqw4KWEipi5THwVMbb0/nlpu0cX+sz6YnghgdxBdVQFqGfPnUJpfsq1d3Gd+3
         oh+irksJm8Vuaf0aCNnoX9zK4OgPcutQ0JaEbeJuY4hVmgnGfZY+b/J/vNv+mwYHatyV
         NIAthKjtY+YHpoLGow2VRUvUle+7Xlx10JLmzr8M4OqLPPeZuTSNdzZBIy15ehwvUe5c
         F+xw==
X-Gm-Message-State: AOJu0Yxoviiqawy7XwbA1y8RTg72dYZrVqxvoXRzS2AXT340sIY1hZ6j
        1AxGpC+jyeGPs0CplPd8joef1uPrE+QC7PVCHfOiBg==
X-Google-Smtp-Source: AGHT+IGYlTfXVRedGeXmMNTLpHTqkDg6pe4MbkemUsR1u2GuA2VGzrSg5uJ3CaUseMHtKgJlkQYyqQ==
X-Received: by 2002:a67:f58a:0:b0:452:7eb8:f452 with SMTP id i10-20020a67f58a000000b004527eb8f452mr15909152vso.18.1697091576808;
        Wed, 11 Oct 2023 23:19:36 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id o8-20020a67e148000000b00452539f5ea8sm317430vsl.19.2023.10.11.23.19.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 23:19:36 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-49abb53648aso229218e0c.0
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 23:19:36 -0700 (PDT)
X-Received: by 2002:a1f:c305:0:b0:49a:b737:4df7 with SMTP id
 t5-20020a1fc305000000b0049ab7374df7mr17368863vkf.5.1697091575791; Wed, 11 Oct
 2023 23:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231003092329.3919828-1-make_ruc2021@163.com>
In-Reply-To: <20231003092329.3919828-1-make_ruc2021@163.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 12 Oct 2023 15:19:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AgK0ZmOABxnvtUHLJ7nPzPL7cZp_ezUifpSJWEDVFHWQ@mail.gmail.com>
Message-ID: <CAAFQd5AgK0ZmOABxnvtUHLJ7nPzPL7cZp_ezUifpSJWEDVFHWQ@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: Fix IS_ERR checking in vb2_dc_put_userptr()
To:     Ma Ke <make_ruc2021@163.com>
Cc:     m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 3, 2023 at 6:23=E2=80=AFPM Ma Ke <make_ruc2021@163.com> wrote:
>
> In order to avoid error pointers from frame_vector_pages(), we could
> use IS_ERR() to check the return value to fix this. This checking
> operation could make sure that vector contains pages.
>
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  .../media/common/videobuf2/videobuf2-dma-contig.c   | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/driv=
ers/media/common/videobuf2/videobuf2-dma-contig.c
> index 2fa455d4a048..5001f2a258dd 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -542,13 +542,14 @@ static void vb2_dc_put_userptr(void *buf_priv)
>                  */
>                 dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
>                                   DMA_ATTR_SKIP_CPU_SYNC);
> -               pages =3D frame_vector_pages(buf->vec);
> -               /* sgt should exist only if vector contains pages... */
> -               BUG_ON(IS_ERR(pages));
>                 if (buf->dma_dir =3D=3D DMA_FROM_DEVICE ||
> -                   buf->dma_dir =3D=3D DMA_BIDIRECTIONAL)
> -                       for (i =3D 0; i < frame_vector_count(buf->vec); i=
++)
> -                               set_page_dirty_lock(pages[i]);
> +                   buf->dma_dir =3D=3D DMA_BIDIRECTIONAL){

Missing space between ) and { .

Otherwise:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> +                       pages =3D frame_vector_pages(buf->vec);
> +                       /* sgt should exist only if vector contains pages=
... */
> +                       if (!WARN_ON_ONCE(IS_ERR(pages)))
> +                               for (i =3D 0; i < frame_vector_count(buf-=
>vec); i++)
> +                                       set_page_dirty_lock(pages[i]);
> +               }
>                 sg_free_table(sgt);
>                 kfree(sgt);
>         } else {
> --
> 2.37.2
>
