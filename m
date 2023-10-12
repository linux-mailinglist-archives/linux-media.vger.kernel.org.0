Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57EF7C6543
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 08:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377237AbjJLGRy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 02:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347063AbjJLGRv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 02:17:51 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BA3B8
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 23:17:49 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4197fa36b6aso3721761cf.3
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 23:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697091468; x=1697696268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gosZTOF28yl4wwi+fp2cOIVguAXJ0rCtZc43mP/3F5M=;
        b=lxOQX5jR3Mpykz+9C4LauGfYwquVsjPSGrkSKbPf+VJlZo6QieIqDxfiK541ElETP5
         hK69YDT6angl9A5fbxDXXj5QyRw7L7RAX3TzcCSv2R3MW386fvgVtbWrT4LhiDpHHrnX
         HDe4ulaQI1xz06hMuMkoTCnoXqEwQEhlXxrtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697091468; x=1697696268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gosZTOF28yl4wwi+fp2cOIVguAXJ0rCtZc43mP/3F5M=;
        b=SXrXYuQXPEvfQslihL3GqFizvuRloX//mnOfjhCO2KLa0FCSz6q4aNeS5z+vafRd1P
         7/gvHYIPIG66JPU3eMyLauCWGW3Mt+XQAUBGugb7RiN1drJqhJVrOWaaj2pdu7Zr40y2
         jZIRKqexut+STIMr6TXZh/R+wcQQCL8WQnYqIAExxa5zbc7m5v3kzhiM0Ed89TLNC4Ie
         z03H2SauVs/Dv4amwV809mg5B+KLPFI9ojBQhGaUTxnbdXuVazDA0/e+pz/KHhYKwqqO
         4iN14gwQU3OFySQpvhqNskbnd96a9e0/8arAOSaksw7v1cgJorJeoz+QIqT8g/E0axLX
         GCAA==
X-Gm-Message-State: AOJu0YyX8RjJLzMzc+FZdptJ6EcO7wvjMHCyfKQQKMKmsJctz0WZguID
        JV1etFdf7DE37kHxqSLGCJbJexPWqA5+cx2JcOs=
X-Google-Smtp-Source: AGHT+IGA7p22GR7o/JLt0ybrkwTS1vRr4/ED/62TVQK2qTfmrGEVLf7xWQbftfdV15Fn5GfTvzRtxQ==
X-Received: by 2002:ac8:5a88:0:b0:412:2d22:2aab with SMTP id c8-20020ac85a88000000b004122d222aabmr27901382qtc.53.1697091468184;
        Wed, 11 Oct 2023 23:17:48 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id bb36-20020a05622a1b2400b00403ad6ec2e8sm5933940qtb.26.2023.10.11.23.17.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 23:17:47 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-66cfd35f595so3679136d6.2
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 23:17:47 -0700 (PDT)
X-Received: by 2002:a0c:ef05:0:b0:656:55b0:6f55 with SMTP id
 t5-20020a0cef05000000b0065655b06f55mr20856812qvr.6.1697091466966; Wed, 11 Oct
 2023 23:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231003091315.3919528-1-make_ruc2021@163.com>
In-Reply-To: <20231003091315.3919528-1-make_ruc2021@163.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 12 Oct 2023 15:17:31 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A4w5N4GwdJ0x+Rw=EM_J1Nf=6M2XmUi-ZcoyW5L8J-zg@mail.gmail.com>
Message-ID: <CAAFQd5A4w5N4GwdJ0x+Rw=EM_J1Nf=6M2XmUi-ZcoyW5L8J-zg@mail.gmail.com>
Subject: Re: [PATCH v2] media: videobuf2: Fix IS_ERR checking in vb2_vmalloc_put_userptr()
To:     Ma Ke <make_ruc2021@163.com>
Cc:     m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 3, 2023 at 6:13=E2=80=AFPM Ma Ke <make_ruc2021@163.com> wrote:
>
> In order to avoid error pointers from frame_vector_pages(), we could
> use IS_ERR() to check the return value to fix this. This checking
> operation could make sure that vector contains pages.
>
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers=
/media/common/videobuf2/videobuf2-vmalloc.c
> index 7c635e292106..5aa66305546d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -133,13 +133,15 @@ static void vb2_vmalloc_put_userptr(void *buf_priv)
>
>         if (!buf->vec->is_pfns) {
>                 n_pages =3D frame_vector_count(buf->vec);
> -               pages =3D frame_vector_pages(buf->vec);
>                 if (vaddr)
>                         vm_unmap_ram((void *)vaddr, n_pages);
>                 if (buf->dma_dir =3D=3D DMA_FROM_DEVICE ||
> -                   buf->dma_dir =3D=3D DMA_BIDIRECTIONAL)
> -                       for (i =3D 0; i < n_pages; i++)
> -                               set_page_dirty_lock(pages[i]);
> +                   buf->dma_dir =3D=3D DMA_BIDIRECTIONAL){

Missing space between ) and { .

> +                       pages =3D frame_vector_pages(buf->vec);
> +                       if (!WARN_ON_ONCE(IS_ERR(pages)))

I still think this cannot happen, but the frame vector code is a mess,
so being a bit more defensive here is probably fine, until someone can
clean up that code (probably by removing the PFN-only code path
completely).

> +                               for (i =3D 0; i < n_pages; i++)
> +                                       set_page_dirty_lock(pages[i]);
> +               }
>         } else {
>                 iounmap((__force void __iomem *)buf->vaddr);
>         }
> --
> 2.37.2
>

With that one formatting issue fixed: (Mauro, Hans, maybe it could be
fixed up when applying?)

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
