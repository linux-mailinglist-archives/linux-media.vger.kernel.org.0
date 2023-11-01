Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E3C7DDBA7
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 04:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbjKADss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 23:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbjKADsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 23:48:47 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B077A4
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 20:48:42 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c3c8adb27so948420366b.1
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 20:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698810519; x=1699415319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq4yHDhKduckzAzodqUeZQr6ErYtU7ghLT5uB093qmA=;
        b=HYRHWi8L7GzhLpP+sNzNMbunP46RbJzwZXd0nvHMOdoLHB44yUdkt10o1LiUELWEQE
         ue+AGzxUcy5E90EZMJVN2pTPcV5m1oG0sIXMOs2B9lwx+d8aWXdKCvqcZzYLhShs+ppY
         Bt2xTz7NoWFafK1ncAz/G8znzUWuOjML/k/PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698810519; x=1699415319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq4yHDhKduckzAzodqUeZQr6ErYtU7ghLT5uB093qmA=;
        b=R8dnY0fyIIaT9uYIpS3uchn3pWLgPz/gdLQWSC/8+HoCSbxbbfCx0sBs4Gj3/QJ0Mq
         2wkOvRh60oNllTWWGUKms2pIvQt37elOJWQekQR31mRh/ay/O8HbnUVw/40diWX06g+q
         MyCqXcZ6yKJg3IdPHCz12uCyRTzjBQWQi6jYdo5q574JU1hfYjLf+hsHuf9kf0Yy5Qia
         KPs59OC4cM+nY+UBHK3MDPfTo43xAcqL9UoNhlDxlQ1+8EjhrteCmWqn+ZL3+HGLXZ17
         s2R9F1g35ZVhFpraeyNblF/ewEXY/g5hoODn5UZUQkC5+Z4BEqBV8mj3ey2Ew630Omxt
         ciKA==
X-Gm-Message-State: AOJu0YwfT0tgZTYIO08A2xLd6R4ra/+wBY+tceDodxFGjFgGNguCKBuN
        QvBLgTj38Fk/O/u/xTjCala0t5+jcTuEX4Yo+mzuKg==
X-Google-Smtp-Source: AGHT+IGtcgheoun0DsJW3PFFw/nCVe9EKs4MgZYNO7vQdRENi1BcsnU1IRaj7B+IkwXP9BVsHXYw0g==
X-Received: by 2002:a17:907:1ca3:b0:9c7:5437:841e with SMTP id nb35-20020a1709071ca300b009c75437841emr893833ejc.11.1698810519306;
        Tue, 31 Oct 2023 20:48:39 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id j20-20020a170906411400b009ae69c303aasm1874195ejk.137.2023.10.31.20.48.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 20:48:38 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-307d58b3efbso3948544f8f.0
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 20:48:38 -0700 (PDT)
X-Received: by 2002:a5d:47af:0:b0:32f:8085:73f8 with SMTP id
 15-20020a5d47af000000b0032f808573f8mr7300010wrb.18.1698810518283; Tue, 31 Oct
 2023 20:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231031230435.3356103-1-m.grzeschik@pengutronix.de>
In-Reply-To: <20231031230435.3356103-1-m.grzeschik@pengutronix.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 1 Nov 2023 12:48:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CCr0ivS8REcwHwJweCTk29+wVGZVjgL0mnZzPQ47kAVw@mail.gmail.com>
Message-ID: <CAAFQd5CCr0ivS8REcwHwJweCTk29+wVGZVjgL0mnZzPQ47kAVw@mail.gmail.com>
Subject: Re: [PATCH v3] media: videobuf2-dma-sg: fix vmap and vunmap callbacks
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        m.szyprowski@samsung.com, mchehab@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        kernel@pengutronix.de, stable@kernel.org
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

Hi Michael,


On Wed, Nov 1, 2023 at 8:04=E2=80=AFAM Michael Grzeschik
<m.grzeschik@pengutronix.de> wrote:
>
> For dmabuf import users to be able to use the vaddr from another
> videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
> vb2_dma_sg_dmabuf_ops_vmap callback.
>
> This patch adds vmap on map if buf->vaddr was not set, and also
> adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
> afterwards.
>
> Cc: stable@kernel.org
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
> ---
> v2 -> v3: resend as a single patch
> v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram
>

First of all, thanks for the patch!

Please check my comments inline.

>  .../media/common/videobuf2/videobuf2-dma-sg.c    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/=
media/common/videobuf2/videobuf2-dma-sg.c
> index 28f3fdfe23a298..05b43edda94a7e 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -489,11 +489,26 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_bu=
f *dbuf,
>  {
>         struct vb2_dma_sg_buf *buf =3D dbuf->priv;
>
> +       if (!buf->vaddr)
> +               buf->vaddr =3D vmap(buf->pages, buf->num_pages, VM_MAP,
> +                                 PAGE_KERNEL);
> +

Would it make sense to use vb2_dma_sg_vaddr() instead of open coding
the mapping again?

>         iosys_map_set_vaddr(map, buf->vaddr);
>
>         return 0;
>  }
>
> +static void vb2_dma_sg_dmabuf_ops_vunmap(struct dma_buf *dbuf,
> +                                     struct iosys_map *map)
> +{
> +       struct vb2_dma_sg_buf *buf =3D dbuf->priv;
> +
> +       if (buf->vaddr)
> +               vunmap(buf->vaddr);
> +
> +       buf->vaddr =3D NULL;
> +}

This could be potentially dangerous. Please consider the situation
when the exporting V4L2 driver needs the CPU mapping for its own
usage. It would call vb2_dma_sg_vaddr(), which would return the
mapping. Then the importer could call vunmap, which would destroy the
mapping that is still in use by the exporter internally.

The idea of the current implementation is that we just create a kernel
mapping when it's needed first and just keep it around until the
entire buffer is destroyed.

Best regards,
Tomasz
