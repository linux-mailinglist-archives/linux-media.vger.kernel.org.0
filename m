Return-Path: <linux-media+bounces-3463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FF9829A83
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 13:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB8832875B8
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 12:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F5E47A55;
	Wed, 10 Jan 2024 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mmXrVwgj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F29E48780
	for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2821884a09so328276166b.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 04:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704890495; x=1705495295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IHux4kEY0E6OoP+H6wK9dpZky0j7ZodV26PwHsv72I=;
        b=mmXrVwgj4VTEAXKWKV51WxEb+JHijZ3pu9Ok/WgXHIWwVeVwOLIM4GFC5F2kBQLt4n
         fJjqjvZp7x9l4Toxrv0HJNrRVCQm8/sCqIQM1DHP4arqu3eH5MbQcxWKIVi4aJz+gTgY
         g9dtlYEoZB2/OT1WZwutulPFg+3+pqXspc2b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704890495; x=1705495295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IHux4kEY0E6OoP+H6wK9dpZky0j7ZodV26PwHsv72I=;
        b=K4crUzP8RAsarRTIiqsmycw8UjqagYfxezESZMRwS/aiciG7K+l17DDymo6/JwIj7J
         8XfEkaLpPo4iqc1tGMxFVoMcApEaWEroCPZwGAnrTln0tidmKigzESSzd4ECD2fSr1oQ
         5lEYglVYRkgg3NH4eQaBZTIJMICsZ8z5QaWowOc0ur7mEuPiCMan4okUDerzsgPBmJ1R
         B2OhUTWNxLNvgIde/t32YOR/VKTAO6fyxMCba159BlZN4n2aPUUd53zNqCoadwOpO6fD
         cXY4uHlpDV+yGeJFQRWDssdTCCAUheDiAyyO5aE56c/cjkTiGZI0ECnlNFooIzCQwZWv
         6eQQ==
X-Gm-Message-State: AOJu0YyGVryFJ6XA6JT8eEeI8BoQjOFrGzKqqAtg5yfb7By1Y8wbu530
	EfeLSG8lMILM0C5iZbrYWCRVSB3zNX6CGK4Vkfiof+QWCN1C
X-Google-Smtp-Source: AGHT+IGTpuZT7iPzAEJBTbVwQM3GtsyR5oW4zwhim6qk/IKGSVzrrb0g2TCmtxLwfCARyuwgrLA3NA==
X-Received: by 2002:a17:906:4698:b0:a28:a36e:98ac with SMTP id a24-20020a170906469800b00a28a36e98acmr636193ejr.68.1704890495427;
        Wed, 10 Jan 2024 04:41:35 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id m21-20020a170906235500b00a26ade46618sm2073934eja.99.2024.01.10.04.41.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 04:41:34 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so3745839f8f.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 04:41:34 -0800 (PST)
X-Received: by 2002:adf:fe02:0:b0:336:b937:3d0e with SMTP id
 n2-20020adffe02000000b00336b9373d0emr554897wrr.14.1704890494510; Wed, 10 Jan
 2024 04:41:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105134020.34312-1-andrzej.p@collabora.com>
In-Reply-To: <20240105134020.34312-1-andrzej.p@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 10 Jan 2024 21:41:13 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DEfvaGVLdPzjpfRwFMJcrXstp2QyTp-BJqzncXOxTvRQ@mail.gmail.com>
Message-ID: <CAAFQd5DEfvaGVLdPzjpfRwFMJcrXstp2QyTp-BJqzncXOxTvRQ@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: Add missing doc comment for waiting_in_dqbuf
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 10:40=E2=80=AFPM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> While at it rearrange other comments to match the order of struct members=
.
>
> Fixes: d65842f7126a ("media: vb2: add waiting_in_dqbuf flag")
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  include/media/videobuf2-core.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-cor=
e.h
> index e41204df19f0..5020e052eda0 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -72,6 +72,10 @@ struct vb2_buffer;
>   *              argument to other ops in this structure.
>   * @put_userptr: inform the allocator that a USERPTR buffer will no long=
er
>   *              be used.
> + * @prepare:   called every time the buffer is passed from userspace to =
the
> + *             driver, useful for cache synchronisation, optional.
> + * @finish:    called every time the buffer is passed back from the driv=
er
> + *             to the userspace, also optional.
>   * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operat=
ion;
>   *                used for DMABUF memory types; dev is the alloc device
>   *                dbuf is the shared dma_buf; returns ERR_PTR() on failu=
re;
> @@ -86,10 +90,6 @@ struct vb2_buffer;
>   *             dmabuf.
>   * @unmap_dmabuf: releases access control to the dmabuf - allocator is n=
otified
>   *               that this driver is done using the dmabuf for now.
> - * @prepare:   called every time the buffer is passed from userspace to =
the
> - *             driver, useful for cache synchronisation, optional.
> - * @finish:    called every time the buffer is passed back from the driv=
er
> - *             to the userspace, also optional.
>   * @vaddr:     return a kernel virtual address to a given memory buffer
>   *             associated with the passed private structure or NULL if n=
o
>   *             such mapping exists.
> @@ -484,7 +484,6 @@ struct vb2_buf_ops {
>   *             caller. For example, for V4L2, it should match
>   *             the types defined on &enum v4l2_buf_type.
>   * @io_modes:  supported io methods (see &enum vb2_io_modes).
> - * @alloc_devs:        &struct device memory type/allocator-specific per=
-plane device
>   * @dev:       device to use for the default allocation context if the d=
river
>   *             doesn't fill in the @alloc_devs array.
>   * @dma_attrs: DMA attributes to use for the DMA.
> @@ -550,6 +549,7 @@ struct vb2_buf_ops {
>   *             @start_streaming can be called. Used when a DMA engine
>   *             cannot be started unless at least this number of buffers
>   *             have been queued into the driver.
> + * @alloc_devs:        &struct device memory type/allocator-specific per=
-plane device
>   */
>  /*
>   * Private elements (won't appear at the uAPI book):
> @@ -571,6 +571,8 @@ struct vb2_buf_ops {
>   * @waiting_for_buffers: used in poll() to check if vb2 is still waiting=
 for
>   *             buffers. Only set for capture queues if qbuf has not yet =
been
>   *             called since poll() needs to return %EPOLLERR in that sit=
uation.
> + * @waiting_in_dqbuf: set whenever vb2_queue->lock is released while wai=
ting for
> + *             a buffer to arrive so that -EBUSY can be returned when ap=
propriate

Appreciate documentation improvements. Thanks!

Just one comment: Could we make it more clear who sets it? For example:

    Set by the core for the duration of a blocking DQBUF, when it has
to wait for
    a buffer to become available with vb2_queue->lock released. Used to pre=
vent
    destroying the queue by other threads.

WDYT?

Best regards,
Tomasz

