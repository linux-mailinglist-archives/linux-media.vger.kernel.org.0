Return-Path: <linux-media+bounces-13499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C790C65B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4D8F1C213D7
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 10:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AFC178378;
	Tue, 18 Jun 2024 07:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oCoLP7pr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F24018EBF
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696904; cv=none; b=upIYf3jacpudyE5X/jXQgw0ulDuV+at9Zc+Ujyq/aaf3Q1ZooVEFZ4+KFMuF9czCvvr0dcDJ1uNTRpaRc1w6z18TwCVdDxptkhNX+5Jy6GQTfoZFrPe5q47mrAf1FpN2SGCbygtu6kQOmz9Nek8aEHxNGWSa2grBNEVCEbHLLnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696904; c=relaxed/simple;
	bh=+i2usPNZNgsyG7GktfYMCH5Ks0ugtDc9juyqEc/9YzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2+8+emIpo2FscZiUYxX7X3TIt1Bt5ZOUWu4SQemZRzaEYB8uU4fdLn0eHy2w4GlXnT7qRpuhqCyGTQqTKJ4Q/ngoMWFRNJ38Hk2fox52h+VteKt67hrLDJXwOGozcyW8zbYWoCHSAiq+9KpfoNOO2lbH/crTqHtAXBsyfiu0nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oCoLP7pr; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6ef793f4b8so527084266b.1
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718696901; x=1719301701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCxa0N6a/etTSTm358fxjAycnT2MNf/L62aewqr2SjQ=;
        b=oCoLP7preiduLiZUSmEIU0D9PNWQdD3yaKWarnveFckNSTypHuBLHGGF2JVIQRiYRG
         LnDKJat3Mvf9U96C3jiSERM9wcjtR8o6REaC17p8wtjVPFsd+F0VNDAbNDmrWkSCxZMk
         h2J54ZFBXbiFGTARopi4NHQVOHdwHAMEIO8qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718696901; x=1719301701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCxa0N6a/etTSTm358fxjAycnT2MNf/L62aewqr2SjQ=;
        b=hW5qTDfZ2bC47BPjTAJIsO1F5sZBxgV9gfyjpKkc6v7YJ5i3i+vnR0dOuORP6R0X6k
         eACwSslUrszNW8Lqydmg5Rkie7IOV43CmaLLT/ArtrSkKPUsaYOGxhOYYRTF5sLA/apx
         +NW1lCn0Y80aY9k06WAgprDOQ1dQJ2bMQEcNJbRMFYulzP2GpdkWZp4TxAhx3vFmWRw7
         cf2uUu5LNGOcr6ChqjA+mKGMas1Utv3RWrEL9NQQYjknniD23PIlAxG8ioAjw2tDJO5f
         vlCCxP0PDctEV38vfqxuZsrKOWqgBaf+fACb1+d1+wutcx2xE8hiOTx9ofs8yW0VdhZM
         hRUw==
X-Forwarded-Encrypted: i=1; AJvYcCVhAsd03lsSU5w/GLTO5CSWefkUNIiwyWHlWJLsAA4wbzFz3OT+D9vNNbgq7zQof6PufYtXJ5r5MAaOpVhS5WhcJJ4y8u+ETFZSP/s=
X-Gm-Message-State: AOJu0YzURKT46+l2KRMILDcvZeYPoFdYxwVPqQZYrdW+ioPtu5hkLtwK
	grotRNUpw1Jz6ZWP8oSg7HHfdtNs3tEEyrHcbjoSbHomAqX8IryQXVaSdIPcGQ8qoSpnx/OHnXm
	tpe5/
X-Google-Smtp-Source: AGHT+IGYfNBheOLalYMrH0h053+GIg0ZtIDijg2ENrFA2Xw/9tawbAEey1+JMmEUPYbIh0ixJx00YA==
X-Received: by 2002:a17:907:3f03:b0:a6f:5fe2:56e9 with SMTP id a640c23a62f3a-a6f60d2b9a7mr968802266b.17.1718696900859;
        Tue, 18 Jun 2024 00:48:20 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ed3585sm592901666b.117.2024.06.18.00.48.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 00:48:20 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a63359aaaa6so764200466b.2
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 00:48:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeX53hBid+Fqt3jxt+E3pynbOLmdpdGUFSMr/30eL7/jfqm+Cdauwjn8JQ5/L/fcDyUHa/MXk86TbSJuOUHy37k1vrxsUc7jruHEY=
X-Received: by 2002:a17:906:ca0d:b0:a6f:fbc:b3f3 with SMTP id
 a640c23a62f3a-a6f60dc89cbmr680235166b.47.1718696899670; Tue, 18 Jun 2024
 00:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
In-Reply-To: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 18 Jun 2024 16:47:45 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
Message-ID: <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
To: TaoJiang <tao.jiang_2@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, 
	shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, ming.qian@oss.nxp.com, 
	imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Ming Qian <ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi TaoJiang,

On Tue, Jun 18, 2024 at 4:30=E2=80=AFPM TaoJiang <tao.jiang_2@nxp.com> wrot=
e:
>
> From: Ming Qian <ming.qian@nxp.com>
>
> When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
> whether the dma buffer is coherent or synchronized.
>
> The videobuf2-core will skip cache syncs as it think the DMA exporter
> should take care of cache syncs
>
> But in fact it's likely that the client doesn't
> synchronize the dma buf before qbuf() or after dqbuf(). and it's
> difficult to find this type of error directly.
>
> I think it's helpful that videobuf2-core can call
> dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
> cache syncs.
>
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>

Sorry, that patch is incorrect. I believe you're misunderstanding the
way DMA-buf buffers should be managed in the userspace. It's the
userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
signal start and end of CPU access to the kernel and imply necessary
cache synchronization.

[1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls

So, really sorry, but it's a NAK.

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index 358f1fe42975..4734ff9cf3ce 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer =
*vb)
>         vb->synced =3D 1;
>         for (plane =3D 0; plane < vb->num_planes; ++plane)
>                 call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
> +
> +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> +               return;
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> +
> +               if (!dbuf)
> +                       continue;
> +
> +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> +       }
>  }
>
>  /*
> @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *=
vb)
>         vb->synced =3D 0;
>         for (plane =3D 0; plane < vb->num_planes; ++plane)
>                 call_void_memop(vb, finish, vb->planes[plane].mem_priv);
> +
> +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> +               return;
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> +
> +               if (!dbuf)
> +                       continue;
> +
> +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> +       }
>  }
>
>  /*
> --
> 2.43.0-rc1
>

