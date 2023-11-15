Return-Path: <linux-media+bounces-418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BC7ED84C
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 00:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7AD2281052
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 23:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896252EB19;
	Wed, 15 Nov 2023 23:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NKxxqgsi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000711B9
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 15:45:42 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cc411be7e5so25675ad.1
        for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 15:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700091942; x=1700696742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIH2dT5rBnZFjhKTkiDOQvxWWMxsCvDK0b0vzyQ0+X8=;
        b=NKxxqgsiQH2IDHPVm0sTRwOKQMSN8I8yMg1G1hPQ1fFBDYD1GLq/eM7om3nW+FMBKD
         m5RiE8HRh2LJKrfsyiUxlpfEGGuFXK/JDxtcyO9Hd8+DkPufNmwqBiHmhRo23ExmgSjA
         4pmwiDUHNOfWUgj3LXe3m7ZLOqcdKo1HQyWivMlxW/a+mF8qH70CRUxd7AXk/BmjeslX
         7mJsrObmsJ6LxADzpfpnNyP7IiSCI9aoJUYMnvWQX8BJJLyb2LPOp7hmv+2edKiQJ+T3
         DlGwX9rlajocDTIPfhbKC0Ch4svzdDl+WCR+xTUVr7JNdlhmtmB9J8GEKy917MJxyWYc
         r5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700091942; x=1700696742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIH2dT5rBnZFjhKTkiDOQvxWWMxsCvDK0b0vzyQ0+X8=;
        b=hPe4ZdJy6P6H+kzoherCzHgbuPZdP3LiqO5mVhSOwN9N4QIF9upesvCr7S74UAfmTM
         +FSEMSyMkfcC2RhLJzjnQUaSnWgR+L4Lea+3JvOPW/hTIlWYFhjVKpcBcLPVkHLDujjP
         cwgGxkFMr9q0WsQ6rJb+LQKDK5pGPO0tqjA51IjKiedlbMMhVtixGGg+BwFbnJ8wzPam
         pMA9qDxbSymNqjPOauN5nJD+7K56G8L+24lA5k1EYVZ1LAT7Q/TRhW56rBsi+663uPcV
         zPM7/WuBDIP6gcL/RNTf3wDftDzhMSbEIKUJIX1cFE8pdnkwCl7etIatQNuzz/ZKfZMo
         9fnQ==
X-Gm-Message-State: AOJu0YxrwmrWtn8P1xKXe6Mh7WOPSB8rnewCxwndUM4Xrv+GPNi+FzcE
	0ZdnazwVtGrAkZZXpr6rpspDW0ioqdcjgGhUfKGF
X-Google-Smtp-Source: AGHT+IFvaq+a3HVgNlcWB8G0UvgbXEFSxTfLrN/9hWim6vKKnIqWcSHLeWYNY3t7rR2xLuNg/XZcLVowUmtLGfVqu6Q=
X-Received: by 2002:a17:902:db0b:b0:1c2:446:5259 with SMTP id
 m11-20020a170902db0b00b001c204465259mr67088plx.19.1700091941779; Wed, 15 Nov
 2023 15:45:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <20231111111559.8218-9-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-9-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:45:30 -0800
Message-ID: <CA+ddPcNLbyS1WRANo7fm13pYyibD_DS3uAxc6ouULWS+kBxNHQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] dma-buf: heaps: secure_heap: Add normal CMA heap
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

You should drop this patch completely.

On Sat, Nov 11, 2023 at 3:18=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add a normal CMA heap which use the standard cma allocate.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> Hi Vijay and Jaskaran,
>
> For this heap,
> 1) It uses sec_heap_buf_ops currently. I guess we cann't use the
> cma_heap_buf_ops. since if it is secure buffer, some operations such
> as mmap should not be allowed.
> 2) I didn't add how to protect/secure the buffer.
>
> Please feel free to change to meet your requirements.
> Thanks.
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 38 ++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index f8b84fd16288..8989ad5d03e9 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -43,6 +43,8 @@ enum secure_buffer_tee_cmd { /* PARAM NUM always is 4. =
*/
>  };
>
>  enum secure_memory_type {
> +       /* CMA for the secure memory, Use the normal cma ops to alloc/fre=
e. */
> +       SECURE_MEMORY_TYPE_CMA          =3D 0,
>         /*
>          * MediaTek static chunk memory carved out for TrustZone. The mem=
ory
>          * management is inside the TEE.
> @@ -65,6 +67,7 @@ struct secure_buffer {
>          * a value got from TEE.
>          */
>         u32                             sec_handle;
> +       struct page                     *cma_page;
>  };
>
>  #define TEE_MEM_COMMAND_ID_BASE_MTK    0x10000
> @@ -287,6 +290,33 @@ const struct secure_heap_prv_data mtk_sec_mem_data =
=3D {
>         .unsecure_the_memory    =3D secure_heap_tee_unsecure_memory,
>  };
>
> +static int cma_secure_memory_allocate(struct secure_heap *sec_heap,
> +                                     struct secure_buffer *sec_buf)
> +{
> +       if (!sec_heap->cma)
> +               return -EINVAL;
> +
> +       sec_buf->cma_page =3D cma_alloc(sec_heap->cma, sec_buf->size >> P=
AGE_SHIFT,
> +                                     get_order(PAGE_SIZE), false);
> +       if (!sec_buf->cma_page)
> +               return -ENOMEM;
> +
> +       memset(page_address(sec_buf->cma_page), 0, sec_buf->size);
> +       return 0;
> +}
> +
> +static void cma_secure_memory_free(struct secure_heap *sec_heap,
> +                                  struct secure_buffer *sec_buf)
> +{
> +       cma_release(sec_heap->cma, sec_buf->cma_page, sec_buf->size >> PA=
GE_SHIFT);
> +}
> +
> +const struct secure_heap_prv_data cma_sec_mem_data =3D {
> +       .memory_alloc   =3D cma_secure_memory_allocate,
> +       .memory_free    =3D cma_secure_memory_free,
> +       /* TODO : secure the buffer. */
> +};
> +
>  static int secure_heap_secure_memory_allocate(struct secure_heap *sec_he=
ap,
>                                               struct secure_buffer *sec_b=
uf)
>  {
> @@ -496,6 +526,11 @@ static const struct dma_heap_ops sec_heap_ops =3D {
>  };
>
>  static struct secure_heap secure_heaps[] =3D {
> +       {
> +               .name           =3D "secure_cma",
> +               .mem_type       =3D SECURE_MEMORY_TYPE_CMA,
> +               .data           =3D &cma_sec_mem_data,
> +       },
>         {
>                 .name           =3D "secure_mtk_cm",
>                 .mem_type       =3D SECURE_MEMORY_TYPE_MTK_CM_TZ,
> @@ -522,7 +557,8 @@ static int __init secure_cma_init(struct reserved_mem=
 *rmem)
>         }
>
>         for (i =3D 0; i < ARRAY_SIZE(secure_heaps); i++, sec_heap++) {
> -               if (sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_MTK_CM_CMA=
)
> +               if (sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_MTK_CM_CMA=
 &&
> +                   sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_CMA)
>                         continue;
>
>                 sec_heap->cma =3D sec_cma;
> --
> 2.25.1
>

