Return-Path: <linux-media+bounces-30062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0670AA865A3
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 20:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4343218882FD
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 18:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF022269836;
	Fri, 11 Apr 2025 18:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="YmkBkvMy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924612690F8
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 18:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396875; cv=none; b=OkXe7cq4aKubie4V4qbn92znIb0y+/nHEqjdJDmhUI7cFgoKLzUnZfHUqyExerVEQd109lMwlerq5OyUAXxwG1QQsJC5Vphw5HGGInMCuRwEV6Oz8Gt1xkce1rizglfszqokBAmGiPeVbm77Tt41NGyBj1ksBvq97xaT1QTTfSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396875; c=relaxed/simple;
	bh=uNSZ1QZVDenoJV10IwufIgPQGUCNINq4xlIGG/RUYT4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JPZME8cjfdkpxFqcpcEQE6APQjWXhXhWqRv+sh1PnDHpg2cpZd9c8nPZ4l04zynHRowkoQ5VmmqTas/LY9n2OE0CYXbeLw9aebyEeu85vqjk+YUIWhow1uyzdH43Tii7KWLRfss9yl+kxmk9V1I3JQi+vVDT0JN11FDu4GGROBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=YmkBkvMy; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8f6970326so22211846d6.0
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 11:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744396872; x=1745001672; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l0WkjI1RT93u5XgdiSSA60ZXeKfvXZmRgF+shu9tTxQ=;
        b=YmkBkvMy+qfNX9+xZ7jMjm74vBeMt9BCIwcSXxecCnP9M4hDLl7F2FBTul8Iy+5MLS
         DqUZHr7iLLpzpcqBCsfOV2CQzC1reEM8d+ssx2i8nbs5MFCuTaq1F2MLI24KCIYZg1JE
         0IxYoZTkJ2RCa4F1hdApPG3uscLVz+FK0v0WFFO/8B5EPm6KggE3n6vQaTfntxOtb+qr
         1mL8hKRJkdILMRKzzONjohyX+oJMET8Xu4FOyZMtlkSP028LsmcVLP70RJHZO8JDxiK1
         8lFDxTF4GSm2cKt5Tv0sRdnokvhc7CZ4MIT2qBoHwUCAxV0GYJSZoehp3QJDdoKV/lma
         oU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396872; x=1745001672;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0WkjI1RT93u5XgdiSSA60ZXeKfvXZmRgF+shu9tTxQ=;
        b=mh9YGkFUmIdMMbr9Qdwn18OMpEAuE0UheaMPwiJ6Hy3vP89Veqf1mVpSrfSxMPm0B/
         9lqwG2vxStCFPPUwlt4Uu8373r6bLrdrdQ2ffKCWOC02VoBUDR37Poa1xrGLEraksygO
         3Jc0lnlUt7GwoBasaDX09L3DmcI1sHaudLXv/YfWigzvYv1n1Gt50tNgfNxtvGvJg7Yj
         sAIpL8MiCpnyDizzXmpbL0fhQ4UwLBKZ+Q2YgQsjkcROkJW0BBJ4f7b7aTByz8g4UOhk
         DEm4uTv15y7HE6rac8DCNq29QVla7T2z29jaEpeAQatDzAl0TafiUs4GIEVEfy8/zoOX
         fU8w==
X-Forwarded-Encrypted: i=1; AJvYcCU1FGGK/siW+w0Vkc7SNzk/7BQKAmb4lBWusE5JGkgqdbZTy+OlHW37xMLj6s7QcJ/SGYu+Kh2cox+s2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDMmm5670QKEDsSjYBLCXB7nb20ikgXpaFtJUelnFZYAjPGwY
	BF4kl7pUuCXEQH90P+Gy1Yt9fkMxEDuwOZ+fb7RD6Tsgm6Hx8Z5/LAK/JBWVrng=
X-Gm-Gg: ASbGncu7G/hY6nimmCit6ZeAImdNPM/LyMMQA2ZcqjLjbGqXVOhwhTW3uee1pv8i5z9
	cA/IKlJ2bHbGFwbRDHnZpTkE0h1SXWNQ2DW+dCKlyfD9t9lvj3xqDXLipi8UJ9b0QbBX7a2YZTs
	AENtgTfRaJ8HwCfxeoPw4/Nct5Y50aOO1zrWp4vccg0kkT63JjsDLfC5s7ar+kYj1vMJ0JOubVN
	biqANJcc2oZxEeKwH3gSkduVbM/hQOhcq6iPKXNNbJaVLmy4ee7L+BQRQFC/9u1P+eAXkGQru45
	8ulfSlXwndIMWcT9bmBQonxIKPe7NK5YTvglUbgUdxKF2Q==
X-Google-Smtp-Source: AGHT+IEm1bKOCQM0tpYs4mhMv4OIhRqLjtx6rGPCZPT/jI6AVdN/7xOTd3xITbioxVcVFqr64gbv6w==
X-Received: by 2002:ad4:5d63:0:b0:6e8:f4e2:26d9 with SMTP id 6a1803df08f44-6f23f14adb0mr60576306d6.35.1744396872420;
        Fri, 11 Apr 2025 11:41:12 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de95f862sm40376636d6.15.2025.04.11.11.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:41:11 -0700 (PDT)
Message-ID: <100a275a1d5a01f72372666b21b68ad7fc4d5eb9.camel@ndufresne.ca>
Subject: Re: [PATCH 3/3] uio: Add UIO_DMABUF_HEAP
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Apr 2025 14:41:11 -0400
In-Reply-To: <20250410-uio-dma-v1-3-6468ace2c786@bootlin.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
	 <20250410-uio-dma-v1-3-6468ace2c786@bootlin.com>
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
> Some UIO users need to access DMA addresses from userspace to be able to
> configure DMA done by the UIO device. Currently there is no way of doing
> this.
>=20
> Add a UIO_DMABUF_HEAP Kconfig option. When selected, a dma-heap
> allocator is created for every new UIO device. This allocator only
> implements 4 basic operations: allocate, release, mmap and get_dma_addr.
> The buffer allocation is done through dma_alloc_coherent().

This is quite redundant with the CMA heap. I believe a better design is
to make UIO devices dmabuf importers. This will make your UIO dmabuf
implementation a lot more useful.

As for the physical addresses, everywhere you currently pass a physical
address, you should be able to add ioctl to pass a DMABuf FD, or a
handle to an UIO specific object (similar to buffer objects in DRM) and
hide these.

regards,
Nicolas

>=20
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
> =C2=A0drivers/uio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 9 ++++
> =C2=A0drivers/uio/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0drivers/uio/uio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 4 ++
> =C2=A0drivers/uio/uio_heap.c=C2=A0=C2=A0=C2=A0=C2=A0 | 120 ++++++++++++++=
+++++++++++++++++++++++++++++++
> =C2=A0include/linux/uio_driver.h |=C2=A0=C2=A0 2 +
> =C2=A05 files changed, 136 insertions(+)
>=20
> diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
> index b060dcd7c6350191726c0830a1ae7b9a388ca4bb..2f3b1e57fceb01354b65cc4d3=
9f342f645a238db 100644
> --- a/drivers/uio/Kconfig
> +++ b/drivers/uio/Kconfig
> @@ -164,4 +164,13 @@ config UIO_DFL
> =C2=A0	=C2=A0=C2=A0=C2=A0 opae-sdk/tools/libopaeuio/
> =C2=A0
> =C2=A0	=C2=A0 If you compile this as a module, it will be called uio_dfl.
> +
> +config UIO_DMABUF_HEAP
> +	bool "DMA-BUF UIO Heap"
> +	select DMABUF_HEAPS
> +	help
> +	=C2=A0 Choose this option to enable DMA-BUF UIO heap. It will create a =
new
> +	=C2=A0 heap allocator under /dev/dma_heap/ for every UIO device. This
> +	=C2=A0 allocator allows userspace applications to allocate DMA buffers =
and
> +	=C2=A0 access their DMA addresses thanks to the DMA_BUF_IOCTL_GET_DMA_H=
ANDLE
> =C2=A0endif
> diff --git a/drivers/uio/Makefile b/drivers/uio/Makefile
> index 1c5f3b5a95cf5b681a843b745a046d7ce123255d..f6696daa36567a4e5d18b1b89=
ba688057e758400 100644
> --- a/drivers/uio/Makefile
> +++ b/drivers/uio/Makefile
> @@ -11,3 +11,4 @@ obj-$(CONFIG_UIO_MF624)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +=3D uio_mf624.o
> =C2=A0obj-$(CONFIG_UIO_FSL_ELBC_GPCM)	+=3D uio_fsl_elbc_gpcm.o
> =C2=A0obj-$(CONFIG_UIO_HV_GENERIC)	+=3D uio_hv_generic.o
> =C2=A0obj-$(CONFIG_UIO_DFL)	+=3D uio_dfl.o
> +obj-$(CONFIG_UIO_DMABUF_HEAP) +=3D uio_heap.o
> diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
> index d93ed4e86a174b5bad193a61aa522cd833fe7bb5..f31936a897805a284165cccfe=
e3d66e96acd4b39 100644
> --- a/drivers/uio/uio.c
> +++ b/drivers/uio/uio.c
> @@ -1046,7 +1046,11 @@ int __uio_register_device(struct module *owner,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +#if defined(CONFIG_UIO_DMABUF_HEAP)
> +	return add_uio_heap(idev);
> +#else
> =C2=A0	return 0;
> +#endif
> =C2=A0
> =C2=A0err_request_irq:
> =C2=A0	uio_dev_del_attributes(idev);
> diff --git a/drivers/uio/uio_heap.c b/drivers/uio/uio_heap.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2e836b503458e280babba0e0a=
dc4f6d8344efc82
> --- /dev/null
> +++ b/drivers/uio/uio_heap.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/uio_driver.h>
> +
> +struct uio_heap {
> +	struct dma_heap *heap;
> +	struct device *dev;
> +};
> +
> +struct uio_heap_buffer {
> +	struct uio_heap *heap;
> +	dma_addr_t dma_addr;
> +	unsigned long len;
> +	void *vaddr;
> +};
> +
> +static int uio_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *=
vma)
> +{
> +	struct uio_heap_buffer *buffer =3D dmabuf->priv;
> +
> +	return dma_mmap_coherent(buffer->heap->dev, vma, buffer->vaddr,
> +				 buffer->dma_addr, buffer->len);
> +}
> +
> +static void uio_heap_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct uio_heap_buffer *buffer =3D dmabuf->priv;
> +
> +	dma_free_coherent(buffer->heap->dev, buffer->len, buffer->vaddr,
> +			=C2=A0 buffer->dma_addr);
> +	kfree(buffer);
> +}
> +
> +static int uio_heap_get_dma_addr(struct dma_buf *dmabuf, u64 *addr)
> +{
> +	struct uio_heap_buffer *buffer =3D dmabuf->priv;
> +
> +	*addr =3D buffer->dma_addr;
> +	return 0;
> +}
> +
> +static const struct dma_buf_ops uio_heap_buf_ops =3D {
> +	.mmap =3D uio_heap_mmap,
> +	.release =3D uio_heap_dma_buf_release,
> +	.get_dma_addr =3D uio_heap_get_dma_addr,
> +};
> +
> +static struct dma_buf *uio_heap_allocate(struct dma_heap *heap,
> +					 unsigned long len,
> +					 u32 fd_flags,
> +					 u64 heap_flags)
> +{
> +	struct uio_heap *uio_heap =3D dma_heap_get_drvdata(heap);
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct uio_heap_buffer *buffer;
> +	struct dma_buf *dmabuf;
> +
> +	buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
> +	if (!buffer)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dma_set_coherent_mask(uio_heap->dev, DMA_BIT_MASK(32));
> +
> +	buffer->heap =3D uio_heap;
> +	buffer->len =3D len;
> +	buffer->vaddr =3D dma_alloc_coherent(uio_heap->dev, buffer->len,
> +					=C2=A0=C2=A0 &buffer->dma_addr, GFP_KERNEL);
> +	if (IS_ERR(buffer->vaddr))
> +		goto free_buf;
> +
> +	exp_info.exp_name =3D dma_heap_get_name(heap);
> +	exp_info.ops =3D &uio_heap_buf_ops;
> +	exp_info.size =3D buffer->len;
> +	exp_info.flags =3D fd_flags;
> +	exp_info.priv =3D buffer;
> +	dmabuf =3D dma_buf_export(&exp_info);
> +	if (IS_ERR(dmabuf))
> +		goto free_dma;
> +
> +	return dmabuf;
> +
> +free_dma:
> +	dma_free_coherent(uio_heap->dev, buffer->len, buffer->vaddr, buffer->dm=
a_addr);
> +free_buf:
> +	kfree(buffer);
> +
> +	return ERR_PTR(-ENOMEM);
> +}
> +
> +static const struct dma_heap_ops uio_heap_ops =3D {
> +	.allocate =3D uio_heap_allocate,
> +};
> +
> +int add_uio_heap(struct uio_device *uio)
> +{
> +	struct dma_heap_export_info exp_info;
> +	struct uio_heap *uio_heap;
> +
> +	uio_heap =3D kzalloc(sizeof(*uio_heap), GFP_KERNEL);
> +	if (!uio_heap)
> +		return -ENOMEM;
> +
> +	uio_heap->dev =3D &uio->dev;
> +
> +	/* Use device name as heap name */
> +	exp_info.name =3D uio_heap->dev->kobj.name;
> +	exp_info.ops =3D &uio_heap_ops;
> +	exp_info.priv =3D uio_heap;
> +
> +	uio_heap->heap =3D dma_heap_add(&exp_info);
> +	if (IS_ERR(uio_heap->heap)) {
> +		int ret =3D PTR_ERR(uio_heap->heap);
> +
> +		kfree(uio_heap);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/include/linux/uio_driver.h b/include/linux/uio_driver.h
> index 18238dc8bfd356a20996ba6cd84f1ff508bbb81c..f8b774d2fa1c7de4b6af881f1=
e53dfa9f25b3dbf 100644
> --- a/include/linux/uio_driver.h
> +++ b/include/linux/uio_driver.h
> @@ -143,6 +143,8 @@ extern int __must_check
> =C2=A0				=C2=A0=C2=A0 struct device *parent,
> =C2=A0				=C2=A0=C2=A0 struct uio_info *info);
> =C2=A0
> +extern int add_uio_heap(struct uio_device *uio);
> +
> =C2=A0/* use a define to avoid include chaining to get THIS_MODULE */
> =C2=A0
> =C2=A0/**

