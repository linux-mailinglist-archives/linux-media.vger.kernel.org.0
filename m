Return-Path: <linux-media+bounces-30061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45373A8658F
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 20:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 486F99A07BD
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 18:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D445E268C7D;
	Fri, 11 Apr 2025 18:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="qfwW/kI9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977D267B9F
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 18:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396482; cv=none; b=rL1eG3d4fqxIfFQ5c21dKqFpPNboXjUMjNRONpumzv+z0mfvr/4jJ71gDdUmOxjKMTxSkVglBaNpsCZM47vzoo1jGiEmgxTUBPyf2Ri6Udnr8uO2qhIkqdP0JMZ+V0Qtf+jYe9QHOXrmaAwtD2SPaxVOodkNBEScCj/A5HqbWVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396482; c=relaxed/simple;
	bh=tqp7nzWxE4ZwA2tMyN4Ja38wF56pok8OKvqOIWHLRkw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ayyms2lBoP+N3LvoPWvaswH6XRGDDqaVVw8VRx7ujviLUmEb9wxdhCgoAypNsEUKuSW0DnVG9GpNW3Hhw3FzcwBN8gvFMtPMqEDL5vSqlTwyisimzxK1CoGzR6kbhjmL4AGffdETFiXDFm0cIa3qw7QnI+3SmK6X69TM0i7Sf5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=qfwW/kI9; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7be49f6b331so264193585a.1
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744396478; x=1745001278; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N0AWpw5PkEqx4rxzE4AWKI4Octup9SsapRwIoW5iY7A=;
        b=qfwW/kI9Pk9hpux+lAsXc0ZUJ4K5Qo1Y5YKw3y4GbijfH5gxKk7iv7QNtisDHeTI55
         KJHJ66FtWpXlKN+QK8mVbdh6EEuzPZkpR+DbrLOe4OCu9mBkWzYpIg85FN7+MfcdfMfr
         Bia5zcMHySIWp7n6++Wz/z5Eo1GNnMQ76eJTDZ1693KriOp5eS6W6EWs78twtmg0aUHE
         Wvr+az1lRREszTdnornHszEJS6cTWjY2vXJKlf5nX/+Bi5+x6moIiRUBUdQPK8SN37FD
         IPSLIQVkmDFfZxEyTzx8OI1K6mnOneuuslEZT28/JrEe8OZoovC8uFASDViWC7dwWV+z
         GlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396478; x=1745001278;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0AWpw5PkEqx4rxzE4AWKI4Octup9SsapRwIoW5iY7A=;
        b=PtTW1PAkM6D6fg7c9wtrUJFt9NxwlAFpT4cntId0U8C1MSa0jgpP4t3oap+KTol+0R
         w8LCiSkvCWgM3TLA8MOLJj8Iy6gJIGSQ7ktRb15FVNehQeAHuLcWVQzTRtv2yBASvUBs
         Hfb4ZIgZZWZiwYH5ZJM2eurE/repdEadCghMw6Ib8+qQBlBMug5eC345ptOOHjicQMe2
         zOPjInlaMwdDAKwqyiLHaCudYH7+Y6mabbM3gmlo7WMbjZbmlXJP7C6xEb4NXO141KNC
         fqw7CUiPx40yAubRpvUbO69S6zigJJp7GYxz3XwmZUUcLnqcrNdMww7zxHQxg0LgP6R8
         OYPA==
X-Forwarded-Encrypted: i=1; AJvYcCVNSiHhmKRevTpnnPIwipNk5FmGhP9JTyd4EwHH0N/UBGkRX+EgXSByZqm7Vp7kx/rRLtXd4Ti4tNYZ5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDDvSRF0WM1vQkeIdMwgJIQVIi4V0tpB4t/tGq5kpm+MpJ9vdS
	VcoIPjTOiJfch1qNwaTvFpanpVHorPfFu+AQrj4Bpgl7Guv31YqurBVT+qvUsDM=
X-Gm-Gg: ASbGncvMLxVfVmm0R35bzsRKxhL0pUHhcxdlV6JR1kk0WLm8gsQjYIb8b63g9fe8glM
	k/MwzaSK+gm6GXJSB0NVZf1OwMtoGTUdZxKFCkfsWB59BwTnHmAx6LCyRN6LFDFzkRXzKYeQRk0
	cfey5YTNxcJmn4B7dzw2oKqW23WVXpVCLpYaS3etjS44S92ZdG/NsUT6QJ8FV+UyGA9ymgC+jN+
	FZUkxSnRrqlSOygDFxxvHpjHbJbt07knmubnPq6LueT+pDi7DPlGXi6jxLAcR+IOQ4IM2gNq1nc
	IkON0ETWDGVpIOeGX1OxJsyzhqbyOJQtyOfy4/dI6Zfz9g==
X-Google-Smtp-Source: AGHT+IFdO0dOsTvQQgEwYJzn7H07oQLyZuXyp8SlGmVZfE23qvHiI5+GWs8xrNT3RdytwsmGS6VF0w==
X-Received: by 2002:a05:620a:4694:b0:7c7:95ee:77bf with SMTP id af79cd13be357-7c7af0ce3bbmr510403485a.19.1744396478456;
        Fri, 11 Apr 2025 11:34:38 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edd3e7fsm29533341cf.81.2025.04.11.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:34:37 -0700 (PDT)
Message-ID: <d19639fb0fbe5c0992a69d7783e6fad91c50561b.camel@ndufresne.ca>
Subject: Re: [PATCH 2/3] dma-buf: Add DMA_BUF_IOCTL_GET_DMA_ADDR
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Apr 2025 14:34:37 -0400
In-Reply-To: <20250410-uio-dma-v1-2-6468ace2c786@bootlin.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
	 <20250410-uio-dma-v1-2-6468ace2c786@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bastien,

Le jeudi 10 avril 2025 =C3=A0 16:53 +0200, Bastien Curutchet a =C3=A9crit=
=C2=A0:
> There is no way to transmit the DMA address of a buffer to userspace.
> Some UIO users need this to handle DMA from userspace.

To me this API is against all safe practice we've been pushing forward
and has no place in DMA_BUF API.

If this is fine for the UIO subsystem to pass around physicial
addresses, then make this part of the UIO device ioctl.

regards,
Nicolas

>=20
> Add a new dma_buf_ops operation that returns the DMA address.
> Add a new ioctl to transmit this DMA address to userspace.
>=20
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
> =C2=A0drivers/dma-buf/dma-buf.c=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++++++++=
+++
> =C2=A0include/linux/dma-buf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/dma-buf.h |=C2=A0 1 +
> =C2=A03 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index
> 398418bd9731ad7a3a1f12eaea6a155fa77a22fe..cbbb518981e54e50f479c3d1fcf
> 6da6971f639c1 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -454,6 +454,24 @@ static long dma_buf_import_sync_file(struct
> dma_buf *dmabuf,
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> +static int dma_buf_get_dma_addr(struct dma_buf *dmabuf, u64 __user
> *arg)
> +{
> +	u64 addr;
> +	int ret;
> +
> +	if (!dmabuf->ops->get_dma_addr)
> +		return -EINVAL;
> +
> +	ret =3D dmabuf->ops->get_dma_addr(dmabuf, &addr);
> +	if (ret)
> +		return ret;
> +
> +	if (copy_to_user(arg, &addr, sizeof(u64)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> =C2=A0static long dma_buf_ioctl(struct file *file,
> =C2=A0			=C2=A0 unsigned int cmd, unsigned long arg)
> =C2=A0{
> @@ -504,6 +522,9 @@ static long dma_buf_ioctl(struct file *file,
> =C2=A0		return dma_buf_import_sync_file(dmabuf, (const void
> __user *)arg);
> =C2=A0#endif
> =C2=A0
> +	case DMA_BUF_IOCTL_GET_DMA_ADDR:
> +		return dma_buf_get_dma_addr(dmabuf, (u64 __user
> *)arg);
> +
> =C2=A0	default:
> =C2=A0		return -ENOTTY;
> =C2=A0	}
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index
> 36216d28d8bdc01a9c9c47e27c392413f7f6c5fb..ed4bf15d3ce82e7a86323fff459
> 699a9bc8baa3b 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -285,6 +285,7 @@ struct dma_buf_ops {
> =C2=A0
> =C2=A0	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> =C2=A0	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map
> *map);
> +	int (*get_dma_addr)(struct dma_buf *dmabuf, u64 *addr);
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-
> buf.h
> index
> 5a6fda66d9adf01438619e7e67fa69f0fec2d88d..f3aba46942042de6a2e3a4cca3e
> b3f87175e29c9 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
> =C2=A0#define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
> =C2=A0#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2,
> struct dma_buf_export_sync_file)
> =C2=A0#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct
> dma_buf_import_sync_file)
> +#define DMA_BUF_IOCTL_GET_DMA_ADDR	_IOR(DMA_BUF_BASE, 4, __u64
> *)
> =C2=A0
> =C2=A0#endif

