Return-Path: <linux-media+bounces-1064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A27F97FE
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 04:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7D51C20902
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 03:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0115846A3;
	Mon, 27 Nov 2023 03:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iTKdWMDK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B64D127
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 19:46:32 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54b07ba599fso2770260a12.0
        for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 19:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701056790; x=1701661590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snVMIApfbCCQ5357llYuGgzTSJ1SSM+A71pqHnL+F+4=;
        b=iTKdWMDKP5PFv+Do6Vir67uOoial9YHEWicvMDk8d7rbfTTV2WR88eGdI4+H8o1fmj
         nSmQ37l5wPQbZfOC7aguY8MFtC4A3mg5IWnMmfT2H8y6mAcxSgtBHJdDCLZQ+nRVTo+J
         SLqdzytC0EpoIKjRd0Zf3UjSt4eDRvWAWetZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701056790; x=1701661590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snVMIApfbCCQ5357llYuGgzTSJ1SSM+A71pqHnL+F+4=;
        b=gokJBSDAcYQ8JVvNP3ewYs79OWUMKi0MuITqThdsdMTLfgZ/4oA/EoiEaEjuWVvgmM
         u9V3QvGaS3UNGArjjtiOtnYhl8ydmr6xEyfGp5Q+5Gz7w/DWW/pWoHJky4NhQYSuy0ri
         CtrOIXEsd65rI8x+22o3HJ2hX1/7KPL1RxBC5VfQzBjoyz8zepPv684bZDerqgY9YQpV
         246cPLSaVBcqHwDbkr85C+Hy7C98D9ph5mrCzp6MsMfjNLrNGlQmHeYgjdlW1OWN90R/
         dSdpeXUSUcA2N5xlnFrhddGqEqk8TOT6BrG0qXaf7GiY7U0Mb3G1x6o4He9gOQuDIAhR
         pm7Q==
X-Gm-Message-State: AOJu0Yxt1ogT2FFCxGX4COhTO5DM9Qe8CB1ybrenZ5luyIfu4uXKZ81m
	puLEDW0p62WLek2+Pyr/WrO9cHYyO0bnVfRHSAKVV4sp
X-Google-Smtp-Source: AGHT+IELjsjQiZAjDS7xVgiEpi7icXndATy/3h35JWMJUrvlCEFLgmkAlFJCLHFDb/DUMrEJAUyWlg==
X-Received: by 2002:a05:6402:b12:b0:54a:eeae:a63 with SMTP id bm18-20020a0564020b1200b0054aeeae0a63mr6788197edb.21.1701056790071;
        Sun, 26 Nov 2023 19:46:30 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id d11-20020a056402000b00b0054851cd28d2sm4736954edu.79.2023.11.26.19.46.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 19:46:29 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-332c7d4a6a7so2503479f8f.2
        for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 19:46:29 -0800 (PST)
X-Received: by 2002:adf:f6d1:0:b0:321:6005:8979 with SMTP id
 y17-20020adff6d1000000b0032160058979mr6523124wrp.17.1701056788758; Sun, 26
 Nov 2023 19:46:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAFQd5AHdWS9zMSyG83LSQOMeGL852xq6APZm0ibiCJ3eMgtNQ@mail.gmail.com>
 <20231123223205.1425234-1-m.grzeschik@pengutronix.de>
In-Reply-To: <20231123223205.1425234-1-m.grzeschik@pengutronix.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 27 Nov 2023 12:46:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AZy1bFw3FnBVGFiRcAcf7V4un5d_O0+6f4xTU_psM40w@mail.gmail.com>
Message-ID: <CAAFQd5AZy1bFw3FnBVGFiRcAcf7V4un5d_O0+6f4xTU_psM40w@mail.gmail.com>
Subject: Re: [PATCH v4] media: videobuf2-dma-sg: fix vmap callback
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, m.szyprowski@samsung.com, 
	mchehab@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	kernel@pengutronix.de, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 7:32=E2=80=AFAM Michael Grzeschik
<m.grzeschik@pengutronix.de> wrote:
>
> For dmabuf import users to be able to use the vaddr from another
> videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
> vb2_dma_sg_dmabuf_ops_vmap callback. This patch adds vmap on map if
> buf->vaddr was not set.
>
> Cc: stable@kernel.org
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
> ---
> v3 -> v4: drop vunmap function and make use of vb2_dma_sg_vaddr in vmap c=
allback
> v2 -> v3: resend as a single patch
> v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram
>
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/=
media/common/videobuf2/videobuf2-dma-sg.c
> index 28f3fdfe23a298..6975a71d740f6d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -487,9 +487,15 @@ vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf =
*dbuf,
>  static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
>                                       struct iosys_map *map)
>  {
> -       struct vb2_dma_sg_buf *buf =3D dbuf->priv;
> +       struct vb2_dma_sg_buf *buf;
> +       void *vaddr;
> +
> +       buf =3D dbuf->priv;
> +       vaddr =3D vb2_dma_sg_vaddr(buf->vb, buf);
> +       if (!vaddr)
> +               return -EINVAL;
>
> -       iosys_map_set_vaddr(map, buf->vaddr);
> +       iosys_map_set_vaddr(map, vaddr);
>
>         return 0;
>  }
> --
> 2.39.2
>

Thanks for addressing the comments.

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

