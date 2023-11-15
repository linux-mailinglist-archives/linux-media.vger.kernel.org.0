Return-Path: <linux-media+bounces-414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BCB7ED816
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 00:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E04311C20935
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 23:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F70945BEF;
	Wed, 15 Nov 2023 23:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S74D+7Ff"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9FA195
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 15:23:19 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc79f73e58so23835ad.1
        for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 15:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700090598; x=1700695398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovisp4W0+ERVnEpLBxErrb/LVokI42Qjeftj4bEI+VQ=;
        b=S74D+7FfJ7XTBUp6ye76T2ArSqbsR1v5Xz00Ad+m3RkkcquFwYPhSknMHnvqBWugG8
         UDbWSKFaqQ7qDgc+Fy1ecc6shaJskeGdANAdyueTR/w7/vgc10h0iudWn/lmWmPWLo0E
         1DpPosVgGLP89qMbX88m/uB26wsRx5liI4iM+9mL38/3P6dJiOUKM0cmUmX+1pS4a94j
         ohGsF2+aTyKrBLN6FcARJxx/OT5ULuB8Nc8I9KSZZ6JZ8ODxje1dQ94JZYdpilCOgMNK
         2EjxJ/3B3MQPd1bvX5KWfUxs4bWNNPMvKBuUnAFGkZXNnmd8hUJH6D1nt+Lyl0S6vmF7
         gBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700090598; x=1700695398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovisp4W0+ERVnEpLBxErrb/LVokI42Qjeftj4bEI+VQ=;
        b=hAabAYkQCw1ai5diVHwspZJd9JVqhX7A756tHrwIqxQioitmVKhkWMc2Bnd+x2bEaq
         Mc2uJf5Ew6OZTltUT1mJxGF9P/JDPgayXxElXBpihOG4sPa6CwCgRI9CinAK4VjuE4pg
         TiVnqtlLTtyIz6/RtSwikLSjY/40g7dDAx8yvBvSw2TV/TCGsmZgJEcizKtpKcj9Ke3+
         z2pGpcBveuAoUdqYic+qI8QFwWYd/BYFIKO+BeR94eZXq4ZE5VHOmgLhGevpQFJcbSCn
         X+2wVcFlfl/F4jVxAGyRMizcUjtX1bwpagK/7ZI1ytnJ54snJz+GN1p3KYXGNk3vCyd3
         KkyA==
X-Gm-Message-State: AOJu0YyKukhpidsJ2Qt0bBAusqcMdEwbAaraROhU1Tw2K2CWH1NkmYDK
	a2GV6Jn+9hE2xsi6SOMXsJ8Afd73+MRrjmGmX2q9
X-Google-Smtp-Source: AGHT+IErsHMGbRATNNKpz2Dt8JZ8b5ED9aDbgRj3Xs2d6cY3G6zsC74jYP7/fSZp+oEGV6/LrmKC5ZGMy/uRFCzoFYI=
X-Received: by 2002:a17:902:e74f:b0:1bd:9c78:8031 with SMTP id
 p15-20020a170902e74f00b001bd9c788031mr69374plf.9.1700090598298; Wed, 15 Nov
 2023 15:23:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <20231111111559.8218-4-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-4-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:23:06 -0800
Message-ID: <CA+ddPcON2gBOsFk4KZS-tEFLKWxg6jH8Kf_xDObXMKbR=N+gzg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dma-buf: heaps: secure_heap: Initialize tee session
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

Everything in this patch set should move into the MTK specific
implementation I suggested in patch 1 (secure_heap_mtk.c)

On Sat, Nov 11, 2023 at 3:17=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't work
> here since this is not a platform driver, therefore initialize the TEE
> context/session while we allocate the first secure buffer.
>
> Add our special UUID and tee type in the private data.
>
> If the uuid is zero, it means that it doesn't enter TEE to protect the
> buffer, there may be other ways to protect the buffer.
>
> All the MTK chrome projects use this UUID. The UUID is only used in the
> kernelspace while userspace never use it. The userspace could allocate th=
e
> secure memory via the existing dma-buf ioctl.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 75 +++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index 87ac23072e9e..2a037fc54004 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -10,6 +10,12 @@
>  #include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +
> +#define TZ_TA_MEM_UUID_MTK             "4477588a-8476-11e2-ad15-e41f1390=
d676"
> +
> +#define TEE_PARAM_NUM                  4
>
>  enum secure_memory_type {
>         /*
> @@ -27,6 +33,9 @@ struct secure_buffer {
>  struct secure_heap;
>
>  struct secure_heap_prv_data {
> +       const char                      *uuid;
> +       const int                       tee_impl_id;
> +
>         int     (*memory_alloc)(struct secure_heap *sec_heap, struct secu=
re_buffer *sec_buf);
>         void    (*memory_free)(struct secure_heap *sec_heap, struct secur=
e_buffer *sec_buf);
>
> @@ -39,9 +48,62 @@ struct secure_heap {
>         const char                      *name;
>         const enum secure_memory_type   mem_type;
>
> +       struct tee_context              *tee_ctx;
> +       u32                             tee_session;
> +
>         const struct secure_heap_prv_data *data;
>  };
>
> +static int tee_ctx_match(struct tee_ioctl_version_data *ver, const void =
*data)
> +{
> +       const struct secure_heap_prv_data *d =3D data;
> +
> +       return ver->impl_id =3D=3D d->tee_impl_id;
> +}
> +
> +static int secure_heap_tee_session_init(struct secure_heap *sec_heap)
> +{
> +       struct tee_param t_param[TEE_PARAM_NUM] =3D {0};
> +       struct tee_ioctl_open_session_arg arg =3D {0};
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
> +       uuid_t ta_mem_uuid;
> +       int ret;
> +
> +       sec_heap->tee_ctx =3D tee_client_open_context(NULL, tee_ctx_match=
, data, NULL);
> +       if (IS_ERR(sec_heap->tee_ctx)) {
> +               pr_err_once("%s: open context failed, ret=3D%ld\n", sec_h=
eap->name,
> +                           PTR_ERR(sec_heap->tee_ctx));
> +               return -ENODEV;
> +       }
> +
> +       arg.num_params =3D TEE_PARAM_NUM;
> +       arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> +       ret =3D uuid_parse(data->uuid, &ta_mem_uuid);
> +       if (ret)
> +               goto close_context;
> +       memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
> +
> +       ret =3D tee_client_open_session(sec_heap->tee_ctx, &arg, t_param)=
;
> +       if (ret < 0 || arg.ret) {
> +               pr_err_once("%s: open session failed, ret=3D%d:%d\n",
> +                           sec_heap->name, ret, arg.ret);
> +               ret =3D -EINVAL;
> +               goto close_context;
> +       }
> +       sec_heap->tee_session =3D arg.session;
> +       return 0;
> +
> +close_context:
> +       tee_client_close_context(sec_heap->tee_ctx);
> +       return ret;
> +}
> +
> +/* The memory allocating is within the TEE. */
> +const struct secure_heap_prv_data mtk_sec_mem_data =3D {
> +       .uuid                   =3D TZ_TA_MEM_UUID_MTK,
> +       .tee_impl_id            =3D TEE_IMPL_ID_OPTEE,
> +};
> +
>  static int secure_heap_secure_memory_allocate(struct secure_heap *sec_he=
ap,
>                                               struct secure_buffer *sec_b=
uf)
>  {
> @@ -84,11 +146,23 @@ secure_heap_allocate(struct dma_heap *heap, unsigned=
 long size,
>                      unsigned long fd_flags, unsigned long heap_flags)
>  {
>         struct secure_heap *sec_heap =3D dma_heap_get_drvdata(heap);
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
>         struct secure_buffer *sec_buf;
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>         struct dma_buf *dmabuf;
>         int ret;
>
> +       /*
> +        * If uuid is valid, It requires enter TEE to protect buffers. Ho=
wever
> +        * TEE probe may be late. Initialize the secure session the first=
 time
> +        * we request the secure buffer.
> +        */
> +       if (data->uuid && !sec_heap->tee_session) {
> +               ret =3D secure_heap_tee_session_init(sec_heap);
> +               if (ret)
> +                       return ERR_PTR(ret);
> +       }
> +
>         sec_buf =3D kzalloc(sizeof(*sec_buf), GFP_KERNEL);
>         if (!sec_buf)
>                 return ERR_PTR(-ENOMEM);
> @@ -127,6 +201,7 @@ static struct secure_heap secure_heaps[] =3D {
>         {
>                 .name           =3D "secure_mtk_cm",
>                 .mem_type       =3D SECURE_MEMORY_TYPE_MTK_CM_TZ,
> +               .data           =3D &mtk_sec_mem_data,
>         },
>  };
>
> --
> 2.25.1
>

