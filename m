Return-Path: <linux-media+bounces-12093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0D8D1DC4
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 15:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1445283349
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 13:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481A216F28D;
	Tue, 28 May 2024 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMHF84Sz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555E816ABD5
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716904723; cv=none; b=vA3/Q70pb6l1SvlpJk93Ya/dwupgn9WZjrw+5fJ6lpwNZDb817JI5kdzzIPUXDOVRqJhDJXQZ2RMixG2k1AHHzbc/eLT5x/Ejvu3wt7xeitjg6PXeCUhapcwA3ja5wS7O7LwoTMr3YAtkjdRuY6rIcTiZ7+DWdAOBHIYP04j76Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716904723; c=relaxed/simple;
	bh=TKnCfkAVaoR5k11Y8L0f97Y9/r4L5dww9OcYJvQwv/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDkLd+ZLR76ymBgkB1cJXyNyxUeAhDaAvKmqkcWElitzak7KMFxcJjzf+Pg7OKaJ5X5U+6+hC5TgVnYcbaqz9cyCfF2OSE4xIEJb059MxcrD3DxFgp+Kz4Qu/B3nkPuJORGB469/T9lUweTtTymyTh9xRYDsy92gQs0XSpHirRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMHF84Sz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716904721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54PHYlJ0PDEnDWhop/PaR+jnOIH2PsxLKNR7Lww/RKs=;
	b=VMHF84Szi7wSXjM9HU8RbBOhYLezt1AQtx5BkQ38lg+9tMI2fQJDpZ1faS/U8TqgKB35LY
	qbQbdgysOkeKafhStWvk8/qYtxNGrPy4Fw7jSI2Lil3pPLFC6B4oGjz4/uYY1kiSTQz9n9
	q+YXEGW4RINCI3HAkgfJZFUjwY/j55s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-J2JRXQn8Pwu6lj8pRZMygA-1; Tue, 28 May 2024 09:58:39 -0400
X-MC-Unique: J2JRXQn8Pwu6lj8pRZMygA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a62b36bc187so51742866b.3
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 06:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716904718; x=1717509518;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54PHYlJ0PDEnDWhop/PaR+jnOIH2PsxLKNR7Lww/RKs=;
        b=oZzRWg7U1VfGZZDI7MvDeqDBNQYDfCLvBPPTbehsy1QTUjzvY5OWekNyYcyDhU4F60
         EYzoWpuj0zidoHSv9VWdd2JkeZKq4b5eV4WSAQov2akfi57Pr5zQgwJFHgk8kWi6Hw5E
         Tk+HnHs2flBtO71sJ3mNlNe/WPReZgEwHlUC45lfz5OxFOaEuinpT4l1fTAcBWn3fkCe
         RuLNHbmVpmToZBEX2iwfvnFeD9UyhkzD96H7OOOZS0ciundV1nwlLBHLE5eLIsuAVUM5
         0yOnbBvlm74pXA29MtjXIJTuLj+GinBH6ZcQx+Tm/rgzMaTvBVl6p2pmHtqreKwPUTuU
         /DwA==
X-Forwarded-Encrypted: i=1; AJvYcCU+PmJ57xu7mjMHJUviqfUu1d7vaxMvLgGQ+0pFEKvwb1LMVEU0m/ML5c8trvnHt44thMKvixTXQ5AJqK9T963e0txk8aV7485UXJE=
X-Gm-Message-State: AOJu0YxYuWWjF8nDtAVsbetYe01a40h0KHIUzQdGDqzx378DtgjlHGmn
	mgjq7HhW9a/PEb3CFtpb9LDRVWPZszuqFoM/SOGPeE31ftpMbz6kii2zHCdZLjgcI8VX2iVITvC
	slHbnA3flknKtYvugs4uV3YvoZck8g/CnMJny664qr949rKUYWJfR2lTgB2uf
X-Received: by 2002:a17:906:bc42:b0:a62:3c94:3bd2 with SMTP id a640c23a62f3a-a6265011270mr904384766b.73.1716904718494;
        Tue, 28 May 2024 06:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQIR74emKom8ATw+snuAUy13d6llophtQiniGptcCuWj8oFnstnUM6NEvnixIbkTAxpA1/sA==
X-Received: by 2002:a17:906:bc42:b0:a62:3c94:3bd2 with SMTP id a640c23a62f3a-a6265011270mr904382466b.73.1716904718020;
        Tue, 28 May 2024 06:58:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:4600:d3a7:6c26:54cf:e01e? (p200300d82f284600d3a76c2654cfe01e.dip0.t-ipconnect.de. [2003:d8:2f28:4600:d3a7:6c26:54cf:e01e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c818362sm617978566b.34.2024.05.28.06.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 06:58:37 -0700 (PDT)
Message-ID: <93ee4e04-bdc7-4ac6-b93b-b6cf1b3311af@redhat.com>
Date: Tue, 28 May 2024 15:58:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] udmabuf: add CONFIG_MMU dependency
To: Arnd Bergmann <arnd@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20240528133138.2237237-1-arnd@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
In-Reply-To: <20240528133138.2237237-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 28.05.24 um 15:31 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is no !CONFIG_MMU version of vmf_insert_pfn():
> 
> arm-linux-gnueabi-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
> udmabuf.c:(.text+0xaa): undefined reference to `vmf_insert_pfn'
> 
> Fixes: f7254e043ff1 ("udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/dma-buf/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index e4dc53a36428..b46eb8a552d7 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -35,6 +35,7 @@ config UDMABUF
>   	default n
>   	depends on DMA_SHARED_BUFFER
>   	depends on MEMFD_CREATE || COMPILE_TEST
> +	depends on MMU
>   	help
>   	  A driver to let userspace turn memfd regions into dma-bufs.
>   	  Qemu can use this to create host dmabufs for guest framebuffers.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


