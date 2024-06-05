Return-Path: <linux-media+bounces-12568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F017E8FC7B8
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 11:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124DC1C20FD1
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B7918F2E6;
	Wed,  5 Jun 2024 09:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/P1LCHk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E071946A9
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717579526; cv=none; b=gLezAJWJFukjjp4d7C05Dg89/u97l+gtYrpAQbPemRxuyQtduMTcE+/BIBpV1Tjzx8+cIeXLgw/laWrQDBFc2L1aKe2YgVNhdmECL9k5LIEUSDGgdy3AtWGjy9I/u6RkcCLqXQGv3NbDCVdsDlxiJgA6D57JJ9K71YdfvO3dEgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717579526; c=relaxed/simple;
	bh=jDIMASg0bbSoa59nEMmcvY5ZQPMiGKrt21tWciEt5bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnJxNRtZXN5JPbcRc/nTanqRd2MUARA7PnuvM3A+/ECaOK8mTeCXXshYxis8eq9PsiKxkPfyTo2gi47hXH9pYGMezJqpPwTZySWb1p6I0cP5pOKKkJU5K26a/KF57oAUSsn+2gxRnpy+H5OKqKWqbBeBy2rzGJ/UPZb99zGcOD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/P1LCHk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a690c8e64bdso170151166b.3
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 02:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717579523; x=1718184323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoJWhO/kN/nIDMel5oucInBCEkvezehjU4YBYZFp3Zg=;
        b=F/P1LCHk0wJMEW2LFzaxw6AYQPJWyEM4G27vsBD/rcfdTLk90iSH7KjdPqZSAU0fRp
         Ib0BQgQmywaOI9OzqmXD7W7gEW0d4Ypr5G7GAYFmpGim250B93t6QHCN4IzYyioxI41k
         W0jKttazCsbX28q6S4Q6t2Fka1v5IZ61zAHWVLDQ4lYx1fj00OnEu/adafn2jCXY6B/N
         4FuxGB7koP/iSyyXbKHrqCTUIh71flTAwXGLdL6Vue2mE65zaKhkjBrfPYYlxLS/ugqu
         WAh9zkLjGP5zqofN8iWiKUt3s1psGgqfyRiTSsskucxOWtYoObfwGWc7uUr9DKjCI1Db
         vJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717579523; x=1718184323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoJWhO/kN/nIDMel5oucInBCEkvezehjU4YBYZFp3Zg=;
        b=Fwxdd6cW9k9jH9Bk2H1kxdclrE1W335R+tq3vFKrTWEwHzLNdqek+ZpQC1yHZ/cZI1
         lQrIUxhyLojFy466WB0FX4Zm+haVqaV78XbyI/eMlgBMjWnIVV2nu2u+SQJbdxDatJWn
         YD9+2HZqtJmzBzl/K6qlwSWIdP5D933gbj4191ncOM5MIgm2OAMJ7aEuftCcNSLDcoBd
         ZjL/oXpSf2YVQt2eMsyj22KEYfbuxvtQYv0NSpAOVaqmFb+YoDZLzWasb/Z7kxtkSeE1
         FUmT2V19zYrOo2RaSrAOC2wc1p/9qwSblUtB5JzUF4XyrgVbnY7SWwXlwUSBcsYMVI7I
         IZmg==
X-Forwarded-Encrypted: i=1; AJvYcCWSjiTHciE4gd5svIxtTMt13m0uz/sjCOioaC6CM3I2738yYYHBfQhmDBg4GRlSl1779auPle8ieWwEwCCtkBsjXi7q1ZOaD+Gmlcs=
X-Gm-Message-State: AOJu0Yzq2bR7JDnKdgU7zoTB1EwEk3uBrs92EFXgsathXICQRMLS68nD
	W8sEJVKyx7oUUzyX8K5px4koipWHL/K4VJsYBV1kUK016D/6pMyw/VO6D9uIjxrlSMF5WkkdOI7
	5cRmBLuF1m/i0R2ysKBzHSB1qiI0ztFQMoIPfxg==
X-Google-Smtp-Source: AGHT+IFiP2ByR690BX/p3xTWlgJRgSVR/t1BSJlG5eKWmT1URJ9DvEySnKdhmO6+OqTKFLDZLb8znMZmfpCG8k6SisY=
X-Received: by 2002:a50:ab56:0:b0:57a:9159:df05 with SMTP id
 4fb4d7f45d1cf-57a9159df5fmr1279266a12.36.1717579522861; Wed, 05 Jun 2024
 02:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605012605.5341-1-21cnbao@gmail.com>
In-Reply-To: <20240605012605.5341-1-21cnbao@gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 5 Jun 2024 14:55:11 +0530
Message-ID: <CAO_48GFq0Cd6rkWidN-=irT4kW9pEOqu_YxY9vd2nRRKcEy-tw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: align fd_flags and heap_flags with dma_heap_allocation_data
To: Barry Song <21cnbao@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, 
	Brian.Starkey@arm.com, benjamin.gaignard@collabora.com, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, jstultz@google.com, 
	linux-kernel@vger.kernel.org, tjmercier@google.com, v-songbaohua@oppo.com, 
	hailong.liu@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Barry,


On Wed, 5 Jun 2024 at 06:56, Barry Song <21cnbao@gmail.com> wrote:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> dma_heap_allocation_data defines the UAPI as follows:
>
>  struct dma_heap_allocation_data {
>         __u64 len;
>         __u32 fd;
>         __u32 fd_flags;
>         __u64 heap_flags;
>  };
>
> However, dma_heap_buffer_alloc() casts both fd_flags and heap_flags
> into unsigned int. We're inconsistent with types in the non UAPI
> arguments. This patch fixes it.

Thank you for your patch; I've pushed it to drm-misc-next.

Best,
Sumit.
>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Acked-by: John Stultz <jstultz@google.com>
> ---
>  -v2:
>  collect ack of John, thanks!
>  refine commit message;
>
>  drivers/dma-buf/dma-heap.c    | 4 ++--
>  include/uapi/linux/dma-heap.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 84ae708fafe7..2298ca5e112e 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -50,8 +50,8 @@ static struct class *dma_heap_class;
>  static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>
>  static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> -                                unsigned int fd_flags,
> -                                unsigned int heap_flags)
> +                                u32 fd_flags,
> +                                u64 heap_flags)
>  {
>         struct dma_buf *dmabuf;
>         int fd;
> diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.=
h
> index 6f84fa08e074..a4cf716a49fa 100644
> --- a/include/uapi/linux/dma-heap.h
> +++ b/include/uapi/linux/dma-heap.h
> @@ -19,7 +19,7 @@
>  #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
>
>  /* Currently no heap flags */
> -#define DMA_HEAP_VALID_HEAP_FLAGS (0)
> +#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
>
>  /**
>   * struct dma_heap_allocation_data - metadata passed from userspace for
> --
> 2.34.1
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs

