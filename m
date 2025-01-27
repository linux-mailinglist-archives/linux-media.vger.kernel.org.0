Return-Path: <linux-media+bounces-25310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBE8A1D536
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 12:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9282188747B
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 11:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565671FECD0;
	Mon, 27 Jan 2025 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A0gvtBZx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F721FCFF1
	for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737976748; cv=none; b=JrEwdnuVJoA/YKZidiTzpUmyloxvcQPZ3casCjdTNy0CHCIL9y9R3S9bJf6U4zlnfiE18mgLzOvdHkmcwTxrdAQI9mn+gJrO3iDlcXcRuUBdPOlZJpw/UJGkZI2A1LRbomns5DHyjGLLgrLK3VKenxxnKZXQZKIOoSDyLrNNSfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737976748; c=relaxed/simple;
	bh=5F6uSRVC3kc2d2TPQ/hsrGAUqJkivNawdY+eXrPoi50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcbhbTDh+HtKKTyJhrastC50xfL+5O1K+2gEcDUuWIiFYx2pLt5AwO5Lqy6J0xYaqp7scx0Vt8qDmHGxfGHu9BbFfJ1Rqzhp1/TmHSYHWPmZIFCXyAm+vf2fGLFSMsLEnVwputbOFIuBAughY6C5OZGySiAJCYse8ZRiJtROSPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A0gvtBZx; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dbfab8a2b0so8556601a12.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 03:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737976745; x=1738581545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj/btp7iB/WVExe7HRHgQ+HsqxBZyERYlUan4lSFhKQ=;
        b=A0gvtBZx8rD6FlOzeniJOg0/phYNgs/LMEp3OOhLBL+amkvgTpoxBBABrFg+VDDkZn
         fi0PBlZbm8Jgm32M8tG2vB48FWZJj8ajLO9R0YPECRkaqhEGyAEm4ZUGwkgkGMSsDZAZ
         uCjT02/Sswjume4MtCTjNgk2VpbloTjPI6Z28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976745; x=1738581545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bj/btp7iB/WVExe7HRHgQ+HsqxBZyERYlUan4lSFhKQ=;
        b=JOwTmUnl+CI9kvq5p5ilo1AFI4M32lbD+Ug9oqU5KmPiZvUzvtMs2zs0sicnFPscnv
         v99iFvkkfHQHhvs+Fn8ciCRFaPvGj+JKNQoGISv1FxOeRgmRN4WFInnGXNVfllGf2OPj
         I6oMlScnVtv44zxsg1y7LUF8KH4On9qOI6NApssUraKVPa3zWML3L+p63qMvbFQjb0f7
         c1W9j4weV3Xkh+19Bno2mzUkLdeh/yr9K+YvtpTL9nVRQjyWFsA3HsG4W6YWdN2GjGeu
         +VZm3TcpB72UyTW20WzR9I0AMb5oMu5pcPRqdf1stQ6M7udkQ+X6QKxmh6hJHLBzSW9b
         1P/A==
X-Forwarded-Encrypted: i=1; AJvYcCWMsgtnJEMJKT3IuJNVde3RmqYl3bRZi8PRGuLmj3oa6EwiuWmoPkPpnTxPljTxqgdXBdDbGEwKsb5F8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrisGO/n9VnB4ZzCBUhoF8BLIWHZXnNyWLcw9cyM6QcsIXQAVu
	OWzkQd5Y79SCxMmW9RtMOffTFtH4XBXC048QbVuW1GmFcs8DKoM1LT7nvbFud3Dyw9hGNU4Xw8t
	aRg==
X-Gm-Gg: ASbGncvlJWK/UahR7jT0y1Q5cBwQmM9jAE3nz7QjeV1KGluRnrijq4sz5bpq9CfmZ5o
	9UdEhPLDA+hLQolA5ijs9GKkB3zFrYreNqbwy9N46GVub1oAo/zReSaaCUx3byBlWxoj8+2G7Lr
	v/2QcYo74BvJchU68/8a7wyoKtYkD6SQ+njw91Mq2HzVI9MQ4XhAjR2W8JKuLl/uVB04ZwcQf4M
	aGsBIxSW+M7dQQZjEBHu+nMC5nDuNY8DqtFtyu3L0nU0tEaQFK6i5vHfoHlNDIYEDjZHxmRF+kI
	EeJyk5rSFyllJZUW4lLWBqls5MUy+X7hlURXiasF
X-Google-Smtp-Source: AGHT+IE2LKPvDB2CR8oSP17vQm9EVNIEhQ7VQfx4N7ZgIjCJ8srK1MseMW6eTweK6GlRDGG0yJzp6A==
X-Received: by 2002:a05:6402:210c:b0:5d9:cde9:2b7f with SMTP id 4fb4d7f45d1cf-5db7d3550d5mr33373490a12.23.1737976744827;
        Mon, 27 Jan 2025 03:19:04 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863a1fasm5239639a12.37.2025.01.27.03.19.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 03:19:03 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so8119a12.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 03:19:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNBKUcjPpmOnVurTbrzFeBYmwGoy90DyKzUC9c0ZqiXsbt/8AP6EaV7XU2kcidXtPM9n72pcVAEnJ9zw==@vger.kernel.org
X-Received: by 2002:a50:8a8e:0:b0:5d9:693e:346 with SMTP id
 4fb4d7f45d1cf-5dc243b84e8mr130774a12.4.1737976741062; Mon, 27 Jan 2025
 03:19:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com> <20250115-b4-rkisp-noncoherent-v2-1-0853e1a24012@gmail.com>
In-Reply-To: <20250115-b4-rkisp-noncoherent-v2-1-0853e1a24012@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 27 Jan 2025 20:18:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DFuw9e85X-UhVfonb5C9F0tG6xyn9RUGitKDQXifcUyA@mail.gmail.com>
X-Gm-Features: AWEUYZn0_AfnNbH4PuJVO5cenPSqx6huf_K_307ofmg4I9T9Tf9BB4t2frTysv0
Message-ID: <CAAFQd5DFuw9e85X-UhVfonb5C9F0tG6xyn9RUGitKDQXifcUyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikhail,

On Thu, Jan 16, 2025 at 2:25=E2=80=AFAM Mikhail Rudenko <mike.rudenko@gmail=
.com> wrote:
>
> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
> commit 129134e5415d ("media: media/v4l2: remove
> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
> no-ops, making cache maintenance for non-coherent dmabufs allocated by
> dma-contig impossible.
>
> Fix this by reintroducing dma_sync_sg_for_{cpu,device} calls to
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> buffers.
>
> Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHER=
ENT flag")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 14 +++++++++++++=
+
>  1 file changed, 14 insertions(+)
>

Thanks a lot for the patch!
Sorry, for the delay. Ended up being sick with some nasty cold that
took quite a while to recover.
Please take a look at my comments inline.

> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/driv=
ers/media/common/videobuf2/videobuf2-dma-contig.c
> index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..889d6c11e15ab5cd4b4c317e8=
65f1fef92df4b66 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -427,6 +427,13 @@ static int
>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>                                    enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_finish)

skip_cache_sync_on_finish shouldn't apply to this function, because
the buffer was shared with an external DMA-buf importer and we don't
know in what state it is at this point.

> +               return 0;
> +

We should also take care of the kernel mapping if it exists, because
on some platforms it may not be coherent with the userspace one -
using flush_kernel_vmap_range(). Please check how
vb2_dc_prepare()/vb2_dc_finish() do it.

> +       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir)=
;

We can use the dma_sync_sgtable_*() variant here so we can just pass
the entire sgt to it.

>         return 0;
>  }
>
> @@ -434,6 +441,13 @@ static int
>  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>                                  enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_prepare=
)
> +               return 0;
> +
> +       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_d=
ir);
>         return 0;

Overall the same comments here as for
vb2_dc_dmabuf_ops_begin_cpu_access() +/- flush would change to
invalidate.

Best regards,
Tomasz

