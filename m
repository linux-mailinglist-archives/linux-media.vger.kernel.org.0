Return-Path: <linux-media+bounces-413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F29147ED811
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 00:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EB1AB20BE1
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 23:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E182045BE6;
	Wed, 15 Nov 2023 23:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F8+ElcVv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4496C196
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 15:21:56 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc209561c3so63415ad.0
        for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 15:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700090516; x=1700695316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNrY+yv6flp09u25YudSqsktgZkCbw+hX4drbUgi3Pw=;
        b=F8+ElcVvm0NX6zwN30341pa5KkUHoO4FmFSeHW2B39gJTuHPIk4RQvIVCPP7PVw55G
         /J6zGU6xft1YnfumvuhML0C2aFex0NZOIiWcvXwtTTfXPuax3WJomqvg+/ek/4/MxrbF
         UyFUYKMK5jcOJeXuZeILkkIjk+g8yzbJOSgpatFFA9XJc+2Up4AuPd/QkkCqCiabJunm
         QiPhx2cxsBxl3BvQ0dTR3g+K5SV48rGBqi0YxmhWSCd2q3Hmxcscj6gCBOLxmSUjUyKo
         LRR0T3Cc3N6em/XAz0PHLh8uMB5vEK2wutPki4I/+8JLMceAzp4PbsJ9wJ6PNqK6GR0P
         dQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700090516; x=1700695316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNrY+yv6flp09u25YudSqsktgZkCbw+hX4drbUgi3Pw=;
        b=SDQxntklJP9tlgHyP36WTcOwbkgsWR/CtmUBtvJlzwL8VPSjMwNbA9PEyzsrqgXTGD
         vGXKWcyZ/mNnx3h1MxhGVvTHj/wU4hW7ON0Pb5I3gSdSLrmYqSx5HyIeT92hle/CnZYx
         2zYRV3obSHz+kyHWMbhzPLB+SQjcSNTHwmRXyPtZ0j6RJ+hWB6TW3t63gmlh+lEVf8WS
         rPuBz5KBstOrm72gPwumMTF/PwoQknP7xx4dyphfLqfTrvMm1nX0Xrt8RoVJrhpQt0p1
         I/6Kte6BFkxs6krg2MyBqi6KwuU+1bvrIi+fKIKehAr94d2ETJ35v2N8aLnvO1RHK/OG
         zHNg==
X-Gm-Message-State: AOJu0Yw6F+zoAcb4M/wgoM6yyLX0kCyiy+IfEFAzbuI/Ox138ytUHRfj
	aB94mMoeuRmKbMKQhe9bJ0+xATABSyYiX9LkSuFM
X-Google-Smtp-Source: AGHT+IGm7zgQJWAfwVDpHCI+ij6qSFWymYieGz93/wfD0nW3TAyf4K67Hy1IrPWOL2RQmlTU4JpJXZoiI0CXMLDcngE=
X-Received: by 2002:a17:902:c942:b0:1cc:2c43:9061 with SMTP id
 i2-20020a170902c94200b001cc2c439061mr61673pla.21.1700090515344; Wed, 15 Nov
 2023 15:21:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <20231111111559.8218-3-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-3-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:21:44 -0800
Message-ID: <CA+ddPcPZJzJXro1ph7tT=Zdk6wyDyncmpPZvO0i0J2zCRauMsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dma-buf: heaps: secure_heap: Add private heap ops
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech <joakim.bech@linaro.org>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 3:16=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> For the secure memory, there are two steps:
> a) Allocate buffers in kernel side;
> b) Secure that buffer.
> Different heaps may have different buffer allocation methods and
> different memory protection methods. Here abstract the memory
> allocation and securing operations.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 58 ++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index a634051a0a67..87ac23072e9e 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -24,15 +24,66 @@ struct secure_buffer {
>         size_t                          size;
>  };
>
> +struct secure_heap;
> +
> +struct secure_heap_prv_data {
> +       int     (*memory_alloc)(struct secure_heap *sec_heap, struct secu=
re_buffer *sec_buf);
> +       void    (*memory_free)(struct secure_heap *sec_heap, struct secur=
e_buffer *sec_buf);
> +
> +       /* Protect/unprotect the memory */
> +       int     (*secure_the_memory)(struct secure_heap *sec_heap, struct=
 secure_buffer *sec_buf);
> +       void    (*unsecure_the_memory)(struct secure_heap *sec_heap, stru=
ct secure_buffer *sec_buf);
> +};
Move these into dma-heap-secure.h per the comments on the prior patch.

> +
>  struct secure_heap {
>         const char                      *name;
>         const enum secure_memory_type   mem_type;
> +
> +       const struct secure_heap_prv_data *data;
>  };
>
> +static int secure_heap_secure_memory_allocate(struct secure_heap *sec_he=
ap,
> +                                             struct secure_buffer *sec_b=
uf)
> +{
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
> +       int ret;
> +
> +       if (data->memory_alloc) {
> +               ret =3D data->memory_alloc(sec_heap, sec_buf);
> +               if (ret)
> +                       return ret;
> +       }
You should probably always require that memory_alloc is defined
(secure_the_memory can be optional, as that may be part of the
allocation).
> +
> +       if (data->secure_the_memory) {
> +               ret =3D data->secure_the_memory(sec_heap, sec_buf);
> +               if (ret)
> +                       goto sec_memory_free;
> +       }
> +       return 0;
> +
> +sec_memory_free:
> +       if (data->memory_free)
> +               data->memory_free(sec_heap, sec_buf);
You should probably always require that memory_free is defined.
> +       return ret;
> +}
> +
> +static void secure_heap_secure_memory_free(struct secure_heap *sec_heap,
> +                                          struct secure_buffer *sec_buf)
> +{
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
> +
> +       if (data->unsecure_the_memory)
> +               data->unsecure_the_memory(sec_heap, sec_buf);
> +
> +       if (data->memory_free)
> +               data->memory_free(sec_heap, sec_buf);
You should probably always require that memory_free is defined.
> +}
> +
>  static struct dma_buf *
>  secure_heap_allocate(struct dma_heap *heap, unsigned long size,
>                      unsigned long fd_flags, unsigned long heap_flags)
>  {
> +       struct secure_heap *sec_heap =3D dma_heap_get_drvdata(heap);
>         struct secure_buffer *sec_buf;
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>         struct dma_buf *dmabuf;
> @@ -45,6 +96,9 @@ secure_heap_allocate(struct dma_heap *heap, unsigned lo=
ng size,
>         sec_buf->size =3D ALIGN(size, PAGE_SIZE);
>         sec_buf->heap =3D heap;
>
> +       ret =3D secure_heap_secure_memory_allocate(sec_heap, sec_buf);
> +       if (ret)
> +               goto err_free_buf;
>         exp_info.exp_name =3D dma_heap_get_name(heap);
>         exp_info.size =3D sec_buf->size;
>         exp_info.flags =3D fd_flags;
> @@ -53,11 +107,13 @@ secure_heap_allocate(struct dma_heap *heap, unsigned=
 long size,
>         dmabuf =3D dma_buf_export(&exp_info);
>         if (IS_ERR(dmabuf)) {
>                 ret =3D PTR_ERR(dmabuf);
> -               goto err_free_buf;
> +               goto err_free_sec_mem;
>         }
>
>         return dmabuf;
>
> +err_free_sec_mem:
> +       secure_heap_secure_memory_free(sec_heap, sec_buf);
>  err_free_buf:
>         kfree(sec_buf);
>         return ERR_PTR(ret);
> --
> 2.25.1
>

