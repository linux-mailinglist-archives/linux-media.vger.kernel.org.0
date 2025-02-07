Return-Path: <linux-media+bounces-25817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82299A2C889
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 17:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D4233AAEFE
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 16:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1886918C00B;
	Fri,  7 Feb 2025 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OHKHZfH7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BD457C9F
	for <linux-media@vger.kernel.org>; Fri,  7 Feb 2025 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945351; cv=none; b=DpKWLHCURDaDYn7IlVZC6oAJf5Xke/cL5wDVNeKJoWyY9lfnovQ2bTxfA5usr7xp+x2dYpbE6LFaaNytkJHs8yTApndzvVcuYz641GBmZ3oaEjIFFJ9w3ntUzrsT86C+EbhIcBwN4tsxI/BWEPvmsUdqTN5gOGeRm1XukUphgb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945351; c=relaxed/simple;
	bh=iTsuxyEIymohulJzY7JTD8IGPdVLrm5BWF6T6qQbtUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMkH1F7DEKUA3ocjfSpLd5R6VM3hGA5J/Yu3IxxAOn70wVJnRSkmntABvMr9rKdPWPF/13fjOTShYuaznv3RvZHumBiY1iUI5sc6VVwWsQEAMYg9w+SWlZByudZ983qPlZvgOl3j+5QuMhSzDz79ppn64BqqIJVnN5KhVQpKSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OHKHZfH7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dcef27deecso3325264a12.1
        for <linux-media@vger.kernel.org>; Fri, 07 Feb 2025 08:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738945347; x=1739550147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCn5Dk3vMVo7X1t68AtKlpToAukuif5wkQVCcdE+FHY=;
        b=OHKHZfH7+GSnutS2il90RCys5tE6eom85D+MnWz0Qq//8CLMVtPOmViPjLB/czpnMT
         n41b3adIAzWrS+WLAegm/s4xW9XytOnbdkzzs5kvHmz+9ViWyXrl++ZBx7ElhySNEK/y
         e9txjRDmJCEw4JXUC8vJf+LwdggQLEMJZD3j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945347; x=1739550147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCn5Dk3vMVo7X1t68AtKlpToAukuif5wkQVCcdE+FHY=;
        b=cmHR9pAkk1sbQrYxX4iEjwH+Xi+4zw+acPe1lxgfM6yiirepqthemRHibhYv/seBoZ
         UBguW12nUq6kYnOZdUhCp4Oo02dCApzpcXhVY4fD1LeQKyBkLTHC1gI9o2FzmUygs5Nz
         DtuRCtLy1m/UY59kyt/9spYXl5MIqWzgtDsEqCfb557jS2gmxTiN0HS8iYOAXq9c547h
         UvRB0/MCYK52Vwwva4ckvmEymbuFUQBYfImwTMVQNDdbw1ENRcUgSXK4IHgwFmH8b9VS
         ns52E3N5UKm6U9whawSxr65FrL/bPpFdM+XjPjxrHFZfZY6tuEPNvgSciE2LTskBycjz
         P2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVPaOI9Yaeh5v57U8dQJemIJ6jn+XBuYBU8EiO0XlLfzT3tof2vIM141YiTqRVLfsKMTLBvxi85U89TrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjART+hwPo5PpBZsRdSX/IhfLmyOfU+GLnLfgmFfEnM3sjnC8r
	aLOKIBvbj+dzrdUylr+xkOjnayV1/2nFDlqKsRQWC0ooAOMXP6MvWpwxIJYQI7Ob/z4u2rwSLAb
	VrkoT
X-Gm-Gg: ASbGncveU7dvzjE0ZgMvX17XDUrY4j7SHtcTGi4z2+h76K+eVBvTaiTIDdx4zkfZQLi
	firZk0+ZjylmTndBpySDGhw2yOMRlZH+jHYwt2toOC7R6rfiYfH4uVTrPdZ6EjDB+NQV3RKy4wn
	dJwCVNOui4RRaZcejnFf3GzaKorLOLYP8JE2Y39NTMpwWcNTvGX3kGNP769uWzYVgUnMl8zkxcq
	QoOxMYJl7rRaRSKHpEov4q+eK0b97/7kca7sTYEMGijo+v2b/Pz/FXlDZsj2OQNg1T3XjkYJWah
	HF29bZjiCrFa98GZNkRT+uF0rwrYqggqwmZrtgsAfkp+xA0wP48=
X-Google-Smtp-Source: AGHT+IGVoDQS5Ca/HM7aFZrp9oDjITCtorUemjbLHIg4a7n6XOQnaQIwQLf4vYZvCOdUiwBP1B/vxQ==
X-Received: by 2002:a05:6402:5409:b0:5dc:8ed9:6bc3 with SMTP id 4fb4d7f45d1cf-5de450734d3mr3948067a12.26.1738945346749;
        Fri, 07 Feb 2025 08:22:26 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de3f04ae59sm1767165a12.1.2025.02.07.08.22.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:22:25 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so8037a12.1
        for <linux-media@vger.kernel.org>; Fri, 07 Feb 2025 08:22:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXC619f33VpGFcAhFx2OAkFCny1SHTOALSOhDs4sdVvQCuLDPgVDF/88k68xD85qoPI9MwBszj5lnscQg==@vger.kernel.org
X-Received: by 2002:a50:ee16:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5de46901c8dmr116990a12.4.1738945344498; Fri, 07 Feb 2025
 08:22:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com> <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
In-Reply-To: <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 7 Feb 2025 17:22:08 +0100
X-Gmail-Original-Message-ID: <CAAFQd5BkbJz4VJOvj8P5gBtbi=VCgsgebw12PnepLj6Qn6C_AQ@mail.gmail.com>
X-Gm-Features: AWEUYZkLRr1JxCvNI8JDDZBOdbLkP21kufM0wZUw4Akj7bxs1aInWlFMBNe_a0o
Message-ID: <CAAFQd5BkbJz4VJOvj8P5gBtbi=VCgsgebw12PnepLj6Qn6C_AQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
To: Mikhail Rudenko <mike.rudenko@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 9:36=E2=80=AFPM Mikhail Rudenko <mike.rudenko@gmail=
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
> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
> {flush,invalidate}_kernel_vmap_range calls to
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> buffers.
>
> Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHER=
ENT flag")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/driv=
ers/media/common/videobuf2/videobuf2-dma-contig.c
> index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f2=
8ce0641fe726e63 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -427,6 +427,17 @@ static int
>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>                                    enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem)
> +               return 0;
> +
> +       if (buf->vaddr)
> +               invalidate_kernel_vmap_range(buf->vaddr, buf->size);
> +
> +       dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> +
>         return 0;
>  }
>
> @@ -434,6 +445,17 @@ static int
>  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>                                  enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem)
> +               return 0;
> +
> +       if (buf->vaddr)
> +               flush_kernel_vmap_range(buf->vaddr, buf->size);
> +
> +       dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> +
>         return 0;
>  }

I took some time (over)thinking the kernel vmap range synchronization,
because these functions can be called both from the kernel space using
respective dma_buf_*() kAPI and also from the user space using the
DMA_BUF_SYNC IOCTLs, so we could in theory have the multiple
invocations racing with each other, but then I realized that we don't
really provide any guarantees for concurrent writes and reads from the
CPU, so I believe this should work fine. Sorry for the delay.

Acked-by: Tomasz Figa <tfiga@chromium.org>

Let me add @Christoph Hellwig and @Robin Murphy just in case I'm wrong
on that, though... Hans, let's give them some time to take a look
before applying this.

Best regards,
Tomasz

