Return-Path: <linux-media+bounces-31256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F377AA038A
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 08:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4036461C73
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 06:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D770F274FED;
	Tue, 29 Apr 2025 06:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="NcSMrq7N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A873253335
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 06:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908794; cv=none; b=MHT+2QpkrNz6skVMEkjdisfCL+RGIJrm3qmLHx6te2eOtU5Xxj3mB5Zh/gCnBrNp5WlVmVYJ415LdT63VWJB2H7E/ASmlP91OtbwgMsNo1V1q3BDzRgaULwJFjk74W2qwX9sDn4OijC0cFP+rKvVYVULGI+p5Tb4SlFAEwq6EMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908794; c=relaxed/simple;
	bh=Q4MFxQ1b5hyIUADs7F23SNrs4EXqMR7h2OEnLhGptJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJSWkg454d7JBK+Oi7X7J8qeuNMpXLOkQ8nW3iJtwTlNGbjYuVyKhRSggsOrmhNkPYit8Va6gOvEJQlbkSYWMcjoLpCygg6ZE4Zg/2KEhOndNpTI8Lvuotyr1M7zn1SvLMawsLliCyUeVsmJ6/wueTvUT3PByRDj3Ki1rQbs+z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=NcSMrq7N; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3655538f8f.0
        for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 23:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1745908791; x=1746513591; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmaMquKVbkqrdz7O/vFtN+XFN9bHTd9TRRszvZLMxPs=;
        b=NcSMrq7N9xGbDwD1GLWPwt6cFU7DhbL3Ji4e8uDmrNX9LfHLt2No12Es0UhP3v3pE8
         A2aIaosaB6faD73GV9bnuZKcquM3E4Ny7NPCCea7CBVKCZEaazPunodBueOccn9eCi3X
         LDUIrQ4AlqWOGzhKipKlw0X0Z4Z6yX/Vl/tU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745908791; x=1746513591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmaMquKVbkqrdz7O/vFtN+XFN9bHTd9TRRszvZLMxPs=;
        b=aP7YGoUiK9zyfD38XNbmJbdM8xyGO3x+V6A8HxUj5RTaUsIWcQSIRZeS/JNnaWXJdz
         X4ZSMbngjTnNiM/TbSY3nW8WsXkCmcocDMNilDXUrq/ovgXzqtG1JibeZ7qC1Ky9FZre
         G8xVSIVANXTbqvjGubLphPeWJ/i+zcv6fyk0K3gn/bg0lqEY+wTOJVcHr4v/iStiq6tm
         LvUugH6GIRsLJHEpHBOVbrLxQQ77wWWbtHhSvTWtFdFxrmnPhPaz8wcWIyX8WqDgGs4r
         4kI+taJdE5p1HBfsrAoiufwPBixe5C1rct933Ri9/xaF8oUhc1MInLbpABHK0CaxSETI
         KY9w==
X-Forwarded-Encrypted: i=1; AJvYcCWgzpvdlpXRNUwO5iW1sLVvRdTgIICoGQrshxMPST98n1xx2h6LLNKoOGH2iZ9nx5857SYeoOE6m/AcEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygV4zymoDQQ+VG9obQZCGNaASv/C6zL0sv4f3H4JW+1swpiLNX
	8VE34uJo28ftDOBd/pcwogNIFCItc7upv3Cnt+vMXOEsnfk9eJqY/lX3onjJ/pA=
X-Gm-Gg: ASbGnctOpqrgUy+yR+Va5k3X4DVwTQ9ZFH8iw3OYBYrKlOD/v2IPkAP/OxKVONVfr4Y
	D+NyCBIIJCWA1BXApIbE0aF1D/6iXfXCPoD/DQvpAGTmcLv0oS5qR9IVRab5PoM+dYQ9Fjh7u7P
	nodnoiGkrj5BL6skWwvPOAJlo4pv549MLXpH4GYAW7DF7+BnJ2/6n7+fnuKmhZ5bvVzT5acLqzP
	Ma3gW5SjE8MOKq2XDrbVg7GuY8lzclRvSPagUF1TNzdy0pnXCg4JpEvcOwkaYld/vBW6kh550gl
	9q/L2XR3zIKHkUH6ANr0TIJwPkoDPu/XXJVGonFcORSUWd3DBVMroJ3S22RwvAg=
X-Google-Smtp-Source: AGHT+IHwDLEforyaEPgu6TBT5wWPx90SoLfgZtqFkKilgThze+4gFBhTHCsNx8uagGoqZwbUon3ChQ==
X-Received: by 2002:a5d:64a3:0:b0:3a0:7a7c:2648 with SMTP id ffacd0b85a97d-3a07aa75959mr9169353f8f.27.1745908790599;
        Mon, 28 Apr 2025 23:39:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a07dbd6ea1sm8976087f8f.7.2025.04.28.23.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:39:49 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:39:48 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dma-buf: Add DMA_BUF_IOCTL_GET_DMA_ADDR
Message-ID: <aBB0NNOg47XHIjpq@phenom.ffwll.local>
Mail-Followup-To: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <20250410-uio-dma-v1-2-6468ace2c786@bootlin.com>
 <d19639fb0fbe5c0992a69d7783e6fad91c50561b.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d19639fb0fbe5c0992a69d7783e6fad91c50561b.camel@ndufresne.ca>
X-Operating-System: Linux phenom 6.12.22-amd64 

Catching up after spring break, hence the late reply ...

On Fri, Apr 11, 2025 at 02:34:37PM -0400, Nicolas Dufresne wrote:
> Le jeudi 10 avril 2025 à 16:53 +0200, Bastien Curutchet a écrit :
> > There is no way to transmit the DMA address of a buffer to userspace.
> > Some UIO users need this to handle DMA from userspace.
> 
> To me this API is against all safe practice we've been pushing forward
> and has no place in DMA_BUF API.
> 
> If this is fine for the UIO subsystem to pass around physicial
> addresses, then make this part of the UIO device ioctl.

Yeah, this has no business in dma-buf since the entire point of dma-buf
was to stop all the nasty "just pass raw dma addr in userspace" hacks that
preceeded it.

And over the years since dma-buf landed, we've removed a lot of these,
like dri1 drivers. Or where that's not possible like with fbdev, hid the
raw dma addr uapi behind a Kconfig.

I concur with the overall sentiment that this should be done in
vfio/iommufd interfaces, maybe with some support added to map dma-buf. I
think patches for that have been floating around for a while, but I lost a
bit the status of where exactly they are.

Cheers, Sima

> 
> regards,
> Nicolas
> 
> > 
> > Add a new dma_buf_ops operation that returns the DMA address.
> > Add a new ioctl to transmit this DMA address to userspace.
> > 
> > Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> > ---
> >  drivers/dma-buf/dma-buf.c    | 21 +++++++++++++++++++++
> >  include/linux/dma-buf.h      |  1 +
> >  include/uapi/linux/dma-buf.h |  1 +
> >  3 files changed, 23 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index
> > 398418bd9731ad7a3a1f12eaea6a155fa77a22fe..cbbb518981e54e50f479c3d1fcf
> > 6da6971f639c1 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -454,6 +454,24 @@ static long dma_buf_import_sync_file(struct
> > dma_buf *dmabuf,
> >  }
> >  #endif
> >  
> > +static int dma_buf_get_dma_addr(struct dma_buf *dmabuf, u64 __user
> > *arg)
> > +{
> > +	u64 addr;
> > +	int ret;
> > +
> > +	if (!dmabuf->ops->get_dma_addr)
> > +		return -EINVAL;
> > +
> > +	ret = dmabuf->ops->get_dma_addr(dmabuf, &addr);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (copy_to_user(arg, &addr, sizeof(u64)))
> > +		return -EFAULT;
> > +
> > +	return 0;
> > +}
> > +
> >  static long dma_buf_ioctl(struct file *file,
> >  			  unsigned int cmd, unsigned long arg)
> >  {
> > @@ -504,6 +522,9 @@ static long dma_buf_ioctl(struct file *file,
> >  		return dma_buf_import_sync_file(dmabuf, (const void
> > __user *)arg);
> >  #endif
> >  
> > +	case DMA_BUF_IOCTL_GET_DMA_ADDR:
> > +		return dma_buf_get_dma_addr(dmabuf, (u64 __user
> > *)arg);
> > +
> >  	default:
> >  		return -ENOTTY;
> >  	}
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index
> > 36216d28d8bdc01a9c9c47e27c392413f7f6c5fb..ed4bf15d3ce82e7a86323fff459
> > 699a9bc8baa3b 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -285,6 +285,7 @@ struct dma_buf_ops {
> >  
> >  	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >  	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map
> > *map);
> > +	int (*get_dma_addr)(struct dma_buf *dmabuf, u64 *addr);
> >  };
> >  
> >  /**
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-
> > buf.h
> > index
> > 5a6fda66d9adf01438619e7e67fa69f0fec2d88d..f3aba46942042de6a2e3a4cca3e
> > b3f87175e29c9 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
> >  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
> >  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2,
> > struct dma_buf_export_sync_file)
> >  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct
> > dma_buf_import_sync_file)
> > +#define DMA_BUF_IOCTL_GET_DMA_ADDR	_IOR(DMA_BUF_BASE, 4, __u64
> > *)
> >  
> >  #endif

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

