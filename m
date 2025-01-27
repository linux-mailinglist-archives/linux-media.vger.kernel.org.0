Return-Path: <linux-media+bounces-25318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9B1A1DCC9
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 20:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB735165A9C
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 19:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881DF19307F;
	Mon, 27 Jan 2025 19:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPYX+578"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23D1F60A;
	Mon, 27 Jan 2025 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738006511; cv=none; b=bdE75XhfbdxT2QbyYvtR+m3rCNSABc2FqWiHCqEHZQifc6w+7ZlxxEvWG934mpemYyKPRVasLrVvO5nthajW/Pto4xeB/syJKMRUBTyHJUwC6L8ubmCA4OV6aN2u/IMA0C3KPyUxzCRVUW/15rP+7lUOFN2tXsvEwCjfzUnHBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738006511; c=relaxed/simple;
	bh=BIWVjHdNz7VNY347CSutS5VBJas2rckQb2jBlK566Qk=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=NppuYS65k4cZEW4huBY7NCzMNaxR7Senrcp0s4Fm5n5IaftYHQUiMsG6l41B0xhfxz77WFiNaWs21Ck7PhshwQMoO1dvh8+8BMOsMiVD71l7KAXyWHI43p2sUjubyrtoQUdmUJMCvmuHhy46pLvRwM4s+PhTDvuNSd9T9ZJvQa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPYX+578; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-303548a933aso44780851fa.3;
        Mon, 27 Jan 2025 11:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738006507; x=1738611307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VUoGCwfVNYXwKgXNKkHD5VpTMGwmKU++/GyIsT0nn8=;
        b=WPYX+578o6hlhafZqnIlmvS2MGXS1u9Xe7vHt9tmJYoacqFZR8SKNYZdYmvGk3tyjD
         aq9X6Om2x7nYE+cJBSL4+25CeeDdOA6D2fTnW8jab93qoEy04YY0EMEmF4qZbQ+y3O90
         A9aTZZJsU7teRp+mP6AgAizocL5FwJBe3w8FlyD+mWKDJLpxkVCoCPh+ECieAXEtcCos
         8qpVpC+b+nP0Me1QiyfYJwxRzt7fyo1ShUrSDCV22zjpNn5c/IZkMP/Yt0X3GGCGgUWx
         GZR+ABwAKnHw+okj+QPPDMw7zW7/2J8G3c9rXu+fPTSKtHhYWAiqZoT/P4v3Ceaz2qBx
         R2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738006507; x=1738611307;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5VUoGCwfVNYXwKgXNKkHD5VpTMGwmKU++/GyIsT0nn8=;
        b=czJTZr6+e+oytVgFG1RmxJCDaUqIPuaxot56DOT13Dxvs97pzKwclOwaiA9UDXgtys
         ERzXIjLpDlXttIWg4nxbwS5JmMrKZtrINwpejZxjdh0fPPctIJ4MiAoBjYWu2FUddTWw
         hip1uS3mGRD4RloTDj95HYycU2FL2zhyLCJrEHNSlkV0buLWdnqDCQJkDB5qlh/ED3iS
         gOfst4kD4Xo7mz8Kj3mrKL7SeLBgHcAk7CmLrAAeLyae5FiWfGGzgF9O2KSYE7dOIVi3
         H0pVkl1H/ougr1GDFs89CfQvUUcTWl1QTqgDfaHZ6fSSGn1DtZaCYUGXyBvu+hH+033b
         GoDA==
X-Forwarded-Encrypted: i=1; AJvYcCWDuM/F4ir5FpN2cCopy2yd7wxEFAnkXlfOKPR/BjsTcB6bM5rx6fFBEZutwymOddhpmDRvJ/nnbi3CEyA=@vger.kernel.org, AJvYcCWrfPvQoN+LwNagch/c3zcaK7yHbbnlcIII6I8PAroluDP5qCLMVMrV9++VpoDuCVNUDLpzowjX@vger.kernel.org, AJvYcCXqfy8wzNbzRZAtJf1TFz4KWchz0HYmxoR6IBF4JfcdRbwRHku4q8SPcKHG2l8c0NtSTxLP48CLxa3nW0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPjQWCGCHK0aekK6AIV5Gmsnwdcgl17sbrB7Y2kiK8RJILvpdb
	f/00HerggNWJPvTUyyR23YPE5aXzDVL/fzU7z9aF3iJ8R4ZTdrrPxqb4hmMG
X-Gm-Gg: ASbGncvA4IPUWfZY1RlWHPcVWDmQ+UZ56/Eh1gzsUwiFKENAqLW3lASMYGbI1QGlva6
	jU2FNiYcClKXGN6LgvwG2CnC3Krn0GyJKdJtrPz0UQarmvfHYj3MPpqj763p1wvHzXpYbOiLMRD
	foL3vXRRe92mJFhCXuUjkZbftSUMERuvglz+HCr2MwHU6wren8391QvBBJ1GMUt5vjtyA9QivN3
	feJ0VoyWhpDBwXc4ZhUVRAFCMBEkAR+eF+a5ph3foUvg4nv7BCRT4dhnQvuyGi+OOpdyhvAukRO
	646DhXEKzaRiicZ/GSOaSufX7VqiNz57e+mTS4tVUM/LgZJidhAVjHD0PnbJsski+M80
X-Google-Smtp-Source: AGHT+IGYlUkHvv8II3ZmzjPYZOyuE8bYVugVsv3AwxgDWrxCyoTSMTVmYGtMCYbLyZ+vF5rQMN00+g==
X-Received: by 2002:a05:6512:1247:b0:542:98e0:7c67 with SMTP id 2adb3069b0e04-5439c27d401mr15203413e87.51.1738006506652;
        Mon, 27 Jan 2025 11:35:06 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8381772sm1375919e87.249.2025.01.27.11.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 11:35:05 -0800 (PST)
References: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
 <20250115-b4-rkisp-noncoherent-v2-1-0853e1a24012@gmail.com>
 <CAAFQd5DFuw9e85X-UhVfonb5C9F0tG6xyn9RUGitKDQXifcUyA@mail.gmail.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Date: Mon, 27 Jan 2025 22:25:51 +0300
In-reply-to: <CAAFQd5DFuw9e85X-UhVfonb5C9F0tG6xyn9RUGitKDQXifcUyA@mail.gmail.com>
Message-ID: <87jzag82zd.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Tomasz,

and thanks for your review!

On 2025-01-27 at 20:18 +09, Tomasz Figa <tfiga@chromium.org> wrote:

> Hi Mikhail,
>
> On Thu, Jan 16, 2025 at 2:25=E2=80=AFAM Mikhail Rudenko <mike.rudenko@gma=
il.com> wrote:
>>
>> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
>> commit 129134e5415d ("media: media/v4l2: remove
>> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
>> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
>> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
>> no-ops, making cache maintenance for non-coherent dmabufs allocated by
>> dma-contig impossible.
>>
>> Fix this by reintroducing dma_sync_sg_for_{cpu,device} calls to
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
>> buffers.
>>
>> Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHE=
RENT flag")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> ---
>>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 14 ++++++++++++=
++
>>  1 file changed, 14 insertions(+)
>>
>
> Thanks a lot for the patch!
> Sorry, for the delay. Ended up being sick with some nasty cold that
> took quite a while to recover.
> Please take a look at my comments inline.
>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/dri=
vers/media/common/videobuf2/videobuf2-dma-contig.c
>> index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..889d6c11e15ab5cd4b4c317e=
865f1fef92df4b66 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -427,6 +427,13 @@ static int
>>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>>                                    enum dma_data_direction direction)
>>  {
>> +       struct vb2_dc_buf *buf =3D dbuf->priv;
>> +       struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +       if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_finish)
>
> skip_cache_sync_on_finish shouldn't apply to this function, because
> the buffer was shared with an external DMA-buf importer and we don't
> know in what state it is at this point.
>

Ack, will fix in v3.

>> +               return 0;
>> +
>
> We should also take care of the kernel mapping if it exists, because
> on some platforms it may not be coherent with the userspace one -
> using flush_kernel_vmap_range(). Please check how
> vb2_dc_prepare()/vb2_dc_finish() do it.
>

Thanks for the pointer, will do so in v3.

>> +       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir=
);
>
> We can use the dma_sync_sgtable_*() variant here so we can just pass
> the entire sgt to it.
>

Will do so.

>>         return 0;
>>  }
>>
>> @@ -434,6 +441,13 @@ static int
>>  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>>                                  enum dma_data_direction direction)
>>  {
>> +       struct vb2_dc_buf *buf =3D dbuf->priv;
>> +       struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +       if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_prepar=
e)
>> +               return 0;
>> +
>> +       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_=
dir);
>>         return 0;
>
> Overall the same comments here as for
> vb2_dc_dmabuf_ops_begin_cpu_access() +/- flush would change to
> invalidate.

Ack.

> Best regards,
> Tomasz


--
Best regards,
Mikhail Rudenko

