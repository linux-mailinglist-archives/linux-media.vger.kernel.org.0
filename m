Return-Path: <linux-media+bounces-32040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B711AAFD86
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 16:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47E067BEE1F
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 14:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB9F275106;
	Thu,  8 May 2025 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="joPXtsfm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEC12741CB
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715352; cv=none; b=h7xL2nHoxYN8soDEfSmM+udhpIF0DiJ2fOwh+RH1kOasCL7hn9MMZMl+Kx5btjwz0wF2CNuP8DvSjTmVmuPf7rb2drWXzKme19cTIiPaiwdk4qVm3/xJph9mxEBmcyWZbAhgQryYrjcV5VB/4ApnD1dq/TfULdKFIBYAtsXVbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715352; c=relaxed/simple;
	bh=HgapASh5XA8oVv/Lz/V7hhXc6nFQHYF1VgUr9bgNK50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOU466ZR4uPST6ukiaUezk8KLXGoziGSTOtf8doRqZItMgfBkFFc4vbofimlNPnkn1D5aY8ikpKrH8fz+qrzaNA6gEvGZeribJ6hE0K+I+7Y8emZ7Fgj7mTJCbVLCFFljxmMCAxG512SYgj3ywbgpF2KMe40GGgYkMgGp14edTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=joPXtsfm; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso2266219a12.1
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 07:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746715348; x=1747320148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrrj7tzRV0HSot50MsrZe31qPKZT2X3/IHla60zHnEo=;
        b=joPXtsfmTt4r3RRG+PHu+ZVZv3tF5wk8iVc38n0njzje4Hrhhkj4Bd5OSAvCTE/q/w
         U1dxRtno7XBPhfZSf4IlU1srcFjYDijE+d++dUxBwywqV+zg79MJqHQlqyihVOxBj/pd
         8+/PtQFXYXHLr+vSiHrpqY2UYpzofsn6c7/QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715348; x=1747320148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrrj7tzRV0HSot50MsrZe31qPKZT2X3/IHla60zHnEo=;
        b=oOWU8MeIPIfSs2O4ZFZ6vph4IDz14bkx3+SOjBAYmC0T/j0sKfucrI1eHWdy8az5PE
         AYsxahoOGqOEUaCnSqVgc+/zfrW0fvWliQT42U4xPRD6qESrcjbHdAwQeOU2PdkmsOO/
         4FcvXwqc5kpzVAluz4IQAqBJNC9Wy1T5x/TxldF24kdyFqYFHTOvf/IMj7cJgs+IwR1I
         id8hmKUagNvXc3UZ188xbVzfHh7dLBEVusl5LBJjjZOr+I7khZ9bg49yfR+HpKdeG5ps
         lkNIdIxu6yoZALyZKAjqn0Cwng3uSmvJVwI75S6PF7bKPUWEvJSi2ClEgFVI69KvIbC6
         wkew==
X-Gm-Message-State: AOJu0Yz8ONef7D+w+UOzah0MH14RWfddsWatXofTOu0gdsihLRi2bj9j
	lWtHxtFR+pos6HIvpFcE/jbNBzDXofbGGqD1aw/1G0LizmHdXUW/KTN2cyllJSRZf98UYwjqvY4
	=
X-Gm-Gg: ASbGncsRI0RTupPxcnR0CBOt2AqMP7Mqq0B/feyQIs/ijhomx7sTwgpAo6ryVs2B/NU
	jqlU/ONlLW/EQNPGYcogU7VjeMtNrhBzF8JktfngwHgu6CORK40C3N/2KJ/C5IqiGGnWU9jJRy7
	a/OEJmtNkStlxE0weYmtKbHjYfvH2Tvl76DkYvAin0H+cnN0OmRWpgMQh8b6m3hHJdonAQdoZ2R
	BS6lvliiHGkA9SsQ4safNmgvGLFUvdt7LVDRbnkVXu4jxdFeArFlrDOl4yn8Zzcp5B6LAoCf3Fs
	SDS34Nh3MydEFburyaWpqm4Nf1yRYd7qU5CF090dVsuGtJMsLYPI3YdsASg6ACDGY8e6smQj/i/
	X
X-Google-Smtp-Source: AGHT+IG+WJB4ad7Z8ACKdDjkg0Ivni6p71Fl85uVPCd+Sj2zEyz/837QROt3sjIK0MEeWBhXj7wVzA==
X-Received: by 2002:a05:6402:270f:b0:5f7:29af:efad with SMTP id 4fb4d7f45d1cf-5fc34c46c83mr3193677a12.5.1746715347891;
        Thu, 08 May 2025 07:42:27 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77bf3ec0sm11250777a12.79.2025.05.08.07.42.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:42:26 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso11909a12.0
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 07:42:26 -0700 (PDT)
X-Received: by 2002:a50:8e57:0:b0:5fb:f573:78fe with SMTP id
 4fb4d7f45d1cf-5fc6d3df3d1mr75346a12.1.1746715346027; Thu, 08 May 2025
 07:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250507160921eucas1p2aa77e0930944aadaaa7c090c8d3d0e73@eucas1p2.samsung.com>
 <20250507160913.2084079-1-m.szyprowski@samsung.com> <20250507160913.2084079-2-m.szyprowski@samsung.com>
In-Reply-To: <20250507160913.2084079-2-m.szyprowski@samsung.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 8 May 2025 23:42:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CUOJJ_fpzXrihtqxRiAZfWBNtCxkaDi6GeZk0rc+XKvA@mail.gmail.com>
X-Gm-Features: ATxdqUGjYbxgU6zpFJMZMGQW-VMwakmlnKiG_rNSxR-mybkfMglw3-_t5QXxPAE
Message-ID: <CAAFQd5CUOJJ_fpzXrihtqxRiAZfWBNtCxkaDi6GeZk0rc+XKvA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: videobuf2: use sgtable-based scatterlist wrappers
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 1:09=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Use common wrappers operating directly on the struct sg_table objects to
> fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
> functions have to be called with the number of elements originally passed
> to dma_map_sg_*() function, not the one returned in sgt->nents.
>
> Fixes: d4db5eb57cab ("media: videobuf2: add begin/end cpu_access callback=
s to dma-sg")
> CC: stable@vger.kernel.org
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/=
media/common/videobuf2/videobuf2-dma-sg.c
> index c6ddf2357c58..b3bf2173c14e 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -469,7 +469,7 @@ vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf=
 *dbuf,
>         struct vb2_dma_sg_buf *buf =3D dbuf->priv;
>         struct sg_table *sgt =3D buf->dma_sgt;
>
> -       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir)=
;
> +       dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>         return 0;
>  }
>
> @@ -480,7 +480,7 @@ vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *=
dbuf,
>         struct vb2_dma_sg_buf *buf =3D dbuf->priv;
>         struct sg_table *sgt =3D buf->dma_sgt;
>
> -       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_d=
ir);
> +       dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>         return 0;
>  }
>
> --
> 2.34.1
>

Thanks for the fix!

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

