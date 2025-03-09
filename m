Return-Path: <linux-media+bounces-27928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5FA58E97
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 09:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCCF53AE1BF
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5477F224245;
	Mon, 10 Mar 2025 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMI5kabp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C06435965;
	Mon, 10 Mar 2025 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741596724; cv=none; b=Bsmx8ZwXwQHaeCP9Ljt8DUsQOPCuUibyQBpR1GfzoLe5R8IbsPSHDgNZvWfU3Y4mnon7olgZPhVj5QtPBzUG5a/RjLgkVTa6pBZpeEFLHUXJcWKUu28pitNWt2YyWfQuIDx4OHa++C3IzbIXKXaGBObAPXBoICuVLSD0Mk2/740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741596724; c=relaxed/simple;
	bh=ibPQgH8XfDu2zGZLCYjmbuevwZN82F3K0cabKb7zgls=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=NwUEu2URcp5K4KEFqazueGzaDZwGboybBnSjutgHrcNMq6Ew5QBbFxxmuVzN+/qeiz3/LTubcCUODZLQcVggSFNAvr9Cdl9zh10dyI9fYJBkPRcortVCpCXGOs5Lug7Z0wLQTXQ1TDGnmxEd/+qq8F1bMvankHvHb2Hb6JWNNSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMI5kabp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-547bcef2f96so4124372e87.1;
        Mon, 10 Mar 2025 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741596721; x=1742201521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsfdUyH3zrjTycztjPtzayYh5FQ+lsz4U78oE1AJhhQ=;
        b=FMI5kabp4Hu8ovyfXw8URmsBBESI9PoHBA60b4eRhpc8cPGAHsNok2BSHqlH++JFTx
         nLQqNLmLl1VFq99Rz0rcdD6rs9R76jK8fiyG9sU6AMDnWtBouhCEjF9T/mb7XccWcylP
         EcgfhLb/VsA9Wn5sejOgjf4UswB0+tuWQtV1dNB/nLJ927eCkh+phiuRsFMw+fb5DNjP
         Wyt5AsyXcEzFMp/DMGbT/h/RlZoxtFDrykdUsZqtQrwA0gYVpP7I/Oh4FkzuGYQ2jXPu
         4/CSmIzi6NjeiSVVyxQapmMWef/2WXnSLhBX6XQEuQm9Cd5DpfEd5Y2wuBXsbitBSycu
         u96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741596721; x=1742201521;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsfdUyH3zrjTycztjPtzayYh5FQ+lsz4U78oE1AJhhQ=;
        b=nXeVM6MYJsRX8HU1UKOLeGdKwbWbfkqeP54rQU9L7S3VmQ32ubFno0PIB9nYZvg6bh
         a0Rx7SzxnKBxjvoUEaz84XhqsJmi87jfxHmdeRwN+HZFGrqrSRDeSUG1LCemSwxGVNFE
         7YZyulYSk7ZvNwrJ/gKE7Knmqm9ysh62EhhbWTkalQz39EEQWvWBYswXlUTDcuy0fjE4
         IijWmyU2gbVRY+Awc/VTh0ZaTiHfpkcIk5hj0M+1W85QWGvKJdISlaREFLOrMHQKgu/8
         70qTeDOaZTl1ksnhtCHYb/kB9WENmFw94yKkVb+Z+7fe6EYr/8vxSi7HGGz643jgE19e
         hyGw==
X-Forwarded-Encrypted: i=1; AJvYcCUpLKtr1mqI40smYW1cNVjO1nh3kXcAPwImVkUD+fiVs0zZIZO4jhI5pcaZGP4ebKisfZTnqchKcNOr09A=@vger.kernel.org, AJvYcCVNYYqu2o5+s0FxT6E4llsbXIXOIdcws0EpKOy9m8odltn/VqzBpLqiyaUqqTk9PHB8FCALa24aLCopl50=@vger.kernel.org, AJvYcCWi9dvugAxhp4YUuat9x/dFUpxBmhT5TXoEMtx/rLXW8ibokglEg/6m3roynBQ+UqH+gr1ZtaTq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyat1+gHLYfUWixAZubd9pe89PYvBr35A+M5Mqwh8A+4YepZH9
	QUwkiHy5+BXWF89VK/AVFm0ViniAca/RU2aULtutZKIZyPiqIsw/4Z9UlVeB
X-Gm-Gg: ASbGncsWAO/ArqXM4nHzirmap+YevaVX/JnWgeyF9XFA2r1zzRRzTE+TxKlSw2cs410
	H1FZQ89CB6AYfrLEyM2o4ljKyVzSlT5Umcp8Lv5xEAZPqmTiQ/sCYuarUV4e5Y0AqltkRjoeFwV
	VNt5koAMw9YT2m8lNengF0+U6AXsB3QsAKwaSST5ED6R5IFLNShYv8Ig2JdTZ8GBNSJiVKaH+PD
	+xKZCws9XLranHHL1Dcz2u8tnaHHxxd+P+7wYkpFL6VG1sEeEirFtn9GJtlgGIh6pZtprG6cUkZ
	z/+sniZU7yzQCUFkm+K6/XQ59+kWczq5Jk/SdRKkdJBOHwnC6x0M5hd4jPo4V0p0EVtdQh01ZSz
	SpUUEr2X41KECqmTC7FDxSjev65A4tuhY
X-Google-Smtp-Source: AGHT+IFDQsKgJjn1vFKF2s3Fxd3y5bXHQKgGDaupCdFC2qHxM/nNEqPRZZXYMIGlgyqsvYZzWa3pXA==
X-Received: by 2002:a05:6512:3da4:b0:545:f4b:ed58 with SMTP id 2adb3069b0e04-54990e5d442mr4212084e87.18.1741596720469;
        Mon, 10 Mar 2025 01:52:00 -0700 (PDT)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bc48dsm1369280e87.187.2025.03.10.01.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 01:51:59 -0700 (PDT)
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
 <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
User-agent: mu4e 1.10.9; emacs 30.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Hans
 Verkuil <hverkuil@xs4all.nl>, Sergey  Senozhatsky
 <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro  Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Date: Sun, 09 Mar 2025 23:18:50 +0300
In-reply-to: <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
Message-ID: <87wmcxs1xw.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Nicolas, Tomasz,

On 2025-03-03 at 10:24 -05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> Hi Mikhail,
>
> Le lundi 03 mars 2025 =C3=A0 14:40 +0300, Mikhail Rudenko a =C3=A9crit=C2=
=A0:
>> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
>> commit 129134e5415d ("media: media/v4l2: remove
>> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
>> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
>> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
>> no-ops, making cache maintenance for non-coherent dmabufs allocated
>> by
>> dma-contig impossible.
>>
>> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
>> {flush,invalidate}_kernel_vmap_range calls to
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
>> buffers.
>>
>> Fixes: c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> ---
>> =C2=A0.../media/common/videobuf2/videobuf2-dma-contig.c=C2=A0 | 22
>> ++++++++++++++++++++++
>> =C2=A01 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> index
>> a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7
>> bc888a84a95d5 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -427,6 +427,17 @@ static int
>> =C2=A0vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>> =C2=A0				=C2=A0=C2=A0 enum dma_data_direction
>> direction)
>> =C2=A0{
>> +	struct vb2_dc_buf *buf =3D dbuf->priv;
>> +	struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +	if (!buf->non_coherent_mem)
>> +		return 0;
>> +
>> +	if (buf->vaddr)
>> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>
> What would make me a lot more confortable with this change is if you
> enable kernel mappings for one test. This will ensure you cover the
> call to "invalidate" in your testing. I'd like to know about the
> performance impact. With this implementation it should be identical to
> the VB2 one.
>

I have re-run my tests on RK3399, with 1280x720 XRGB capture buffers (1
plane, 3686400 bytes). Capture process was pinned to "big" cores running
at fixed frequency of 1.8 GHz. Libcamera was modified to request buffers
with V4L2_MEMORY_FLAG_NON_COHERENT flag. DMA_BUF_IOCTL_SYNC ioctls were
used as appropriate. For kernel mapping effect test, vb2_plane_vaddr
call was inserted into rkisp1_vb2_buf_init.

The timings are as following:

- memcpy coherent buffer: 7570 +/- 63 us
- memcpy non-coherent buffer: 1120 +/- 34 us

without kernel mapping:

- ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_START|DMA_BUF_SYNC_READ}): 42=
8 +/- 15 us
- ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_END|DMA_BUF_SYNC_READ}): 422 =
+/- 28 us

with kernel mapping:

- ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_START|DMA_BUF_SYNC_READ}): 52=
6 +/- 13 us
- ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_END|DMA_BUF_SYNC_READ}): 519 =
+/- 38 us

So, even with kernel mapping enabled, speedup is 7570 / (1120 + 526 + 519) =
=3D 3.5,
and the use of noncoherent buffers is justified -- at least on this platfor=
m.

--
Best regards,
Mikhail Rudenko

