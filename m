Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC08378C1EA
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 12:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbjH2KDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 06:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234604AbjH2KDW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 06:03:22 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E9F10E
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 03:03:19 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a850f07fadso3075835b6e.2
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693303398; x=1693908198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLWqkTlNXuRNXbpkTdz35i9a7RBHR+eFx1IjM/IAypg=;
        b=LdCMcbSsZ3UvW8tljVi3UYEYPSPI3Bew8q6SSIOdgpfPDu3meW0/W5+Ove7WSddYDL
         CewHmiAHxoacy8hoxqnLXGc95BR03EWAWibLuwrffvQVITvYUbTz9auDy5tuv0pPNYha
         bjTrFjDB951+U+zWooqc1/XIlj6lmb7my++5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693303398; x=1693908198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLWqkTlNXuRNXbpkTdz35i9a7RBHR+eFx1IjM/IAypg=;
        b=U71k7lnP83CQoHuXgjdCE7/7P2ohXvSy9uHSd2yEcpS6778FHbPojFMxVM8/1zdeJz
         Zt6C3PBbSJaVMeozeUT1k6wVU7CwZfL1ZWySGRZEOEU9yAXVIHgeeAGtEFucGAVAXsZc
         LWplNFEKuAT4t6UGwnk2lunyJ3ybOGTDiU1OMsQk83j/pkV/vP3Hv7/aR77a603xuP3J
         WmzvAfhTFU3Tj//xS8A5RKY2EY+YL+021fStCpEYftbtiRwCz7l21jhvD5s4kuremWCi
         akJJFWdz2kKMGFwqGW/fVzEjz7oyRhope9XObZbNUGb3J50fsibykhZ0KpWPqVn3hUc6
         O77g==
X-Gm-Message-State: AOJu0YyDaT4EEcQ/16FCk+vlKa3hLU9m6qprHivfIsVnbbpcLMJMKBpb
        35Jm9zc57h1Rdak9ex8UqatHf0lCIb6xNncFan0=
X-Google-Smtp-Source: AGHT+IFjiaU5u4bg4l1+itR65nYgM4wxHW/ppk955gBbDs933SW54doNj3qsMNKoYqp5hfwdbUIN9Q==
X-Received: by 2002:a05:6808:1316:b0:3a7:4878:235a with SMTP id y22-20020a056808131600b003a74878235amr15715790oiv.29.1693303397879;
        Tue, 29 Aug 2023 03:03:17 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id bl3-20020a056808308300b003a7a422cb6asm4289840oib.37.2023.08.29.03.03.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 03:03:17 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a7d7de894bso3075843b6e.3
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 03:03:17 -0700 (PDT)
X-Received: by 2002:a05:6808:2022:b0:3a8:5133:483b with SMTP id
 q34-20020a056808202200b003a85133483bmr15064159oiw.31.1693303396856; Tue, 29
 Aug 2023 03:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230828075420.2009568-1-anle.pan@nxp.com>
In-Reply-To: <20230828075420.2009568-1-anle.pan@nxp.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 29 Aug 2023 19:03:00 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cn3xQroyYtC+m+pk1jOE5i3H+FGr-y8zqhaf0Yo5p-1Q@mail.gmail.com>
Message-ID: <CAAFQd5Cn3xQroyYtC+m+pk1jOE5i3H+FGr-y8zqhaf0Yo5p-1Q@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2-dma-sg: limit the sg segment size
To:     Anle Pan <anle.pan@nxp.com>, Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hui.fang@nxp.com
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

Hi Anle,

On Mon, Aug 28, 2023 at 8:57=E2=80=AFAM Anle Pan <anle.pan@nxp.com> wrote:
>
> When allocating from pages, the size of the sg segment is unlimited and
> the default is UINT_MAX. This will cause the DMA stream mapping failed
> later with a "swiotlb buffer full" error.

Thanks for the patch. Good catch.

> The default maximum mapping
> size is 128 slots x 2K =3D 256K, determined by "IO_TLB_SEGSIZE".
> To fix the issue, limit the sg segment size according to
> "dma_max_mapping_size" to match the mapping limit.
>
> Signed-off-by: Anle Pan <anle.pan@nxp.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/=
media/common/videobuf2/videobuf2-dma-sg.c
> index fa69158a65b1..b608a7c5f240 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -105,6 +105,7 @@ static void *vb2_dma_sg_alloc(struct vb2_buffer *vb, =
struct device *dev,
>         struct sg_table *sgt;
>         int ret;
>         int num_pages;
> +       size_t max_segment =3D 0;
>
>         if (WARN_ON(!dev) || WARN_ON(!size))
>                 return ERR_PTR(-EINVAL);
> @@ -134,8 +135,12 @@ static void *vb2_dma_sg_alloc(struct vb2_buffer *vb,=
 struct device *dev,
>         if (ret)
>                 goto fail_pages_alloc;
>
> -       ret =3D sg_alloc_table_from_pages(buf->dma_sgt, buf->pages,
> -                       buf->num_pages, 0, size, GFP_KERNEL);
> +       if (dev)
> +               max_segment =3D dma_max_mapping_size(dev);
> +       if (max_segment =3D=3D 0)
> +               max_segment =3D UINT_MAX;
> +       ret =3D sg_alloc_table_from_pages_segment(buf->dma_sgt, buf->page=
s,
> +               buf->num_pages, 0, size, max_segment, GFP_KERNEL);

One thing that I'm not sure about here is that we use
sg_alloc_table_from_pages_segment(), but we actually don't pass the
max segment size (as returned by dma_get_max_seg_size()) to it.
I'm also not exactly sure what's the difference between "max mapping
size" and "max seg size".
+Robin Murphy +Christoph Hellwig I think we could benefit from your
expertise here.

Generally looking at videobuf2-dma-sg, I feel like we would benefit
from some kind of dma_alloc_table_from_pages() that simply takes the
struct dev pointer and does everything necessary.

Best regards,
Tomasz
