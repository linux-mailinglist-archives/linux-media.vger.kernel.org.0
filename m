Return-Path: <linux-media+bounces-37938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D21B08482
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 08:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C27703A76FD
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 06:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95A02045B5;
	Thu, 17 Jul 2025 06:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JXSP8YNo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB702E41E
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 06:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752732280; cv=none; b=DEag3a8jE62DNpQApTfZoK7rKmvSm3v2Q/k9j+uIX6GVw71FWmybKiMzQtQtF8SSY3QbUQgkIm/MNl8VeOdiEnbHPJUQ/MNB/zrBhvGN/25mKXdWfQOXgvvl0RiCj8A6pxM1B+Jn5RY593iuWobcJJaH1xuShxEAAy8Wh8M1UPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752732280; c=relaxed/simple;
	bh=P3S2zvRoo7lQJ0ChcHfU5Ea5iDRhwpVODl4UsA4zdsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVfgcebTkTymgVH3HtbV5U87pBSsM42xIGUymGtOUUlqvcJHlYde6jkQVcI2/h37IQBp/A2sO/2uMQTJmAfz45NfBDr+lxupYr7Z+rvQ6W6M4+8x6C+9CoIbMEEYp4LL3lBxZ++eM2SwY8yPBtygRapUzXeRty4CA3Io+BYg0L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JXSP8YNo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752732277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tUkb4nCGAHcNyByaHU5iCpVWleaJyNw90ZAtHNo4HkE=;
	b=JXSP8YNo+m+8ITdVBAnBAa6UYBcS6tBAsn1hFa5PjIq2PsdPVmS3FuPRzCYinuj+biQ2P7
	O7N2WxA8y6SBRa23a95nCwz5q465KEzGNRDKr/GwV5BYDYeqmgnm9/1HMdarGF2dUoSgPX
	hd/EKrpK6NuYmXVMlsUG4sfowDS7sTM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-iwMOnDq3PgG_akO1CulaAw-1; Thu, 17 Jul 2025 02:04:36 -0400
X-MC-Unique: iwMOnDq3PgG_akO1CulaAw-1
X-Mimecast-MFC-AGG-ID: iwMOnDq3PgG_akO1CulaAw_1752732275
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-455f79a2a16so5254045e9.2
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 23:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752732275; x=1753337075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUkb4nCGAHcNyByaHU5iCpVWleaJyNw90ZAtHNo4HkE=;
        b=gqN4ugCF+j9I4Shw4Kgd7XF18ZNzhRGF0jX0a4Myxp9SoMZmT7c5lHpnnKFBclwmu9
         wGNXGeiT1tW/fqmYGCWZqG1gY1eQbBgNf5+qxvBPbs47mJ9RQBkTuXjJEDfoIl94U+Nc
         ojV2Vsa87GyWzmO7I/BIY03vmcXb2KQ2yNV2/omKdnMA7tXaHGCl6ZMH89/HF3Xmx6dK
         HAO9KXC8PhPJMnsYhvSRDvm9g3MXJRHEvAxjNVGWFHOsjutwVeLhcj3cef18xCtAf3cn
         IbwMoxwedzgCz6pWlscH7RCNUONLYApB1idoWlBI7T1eRlbeH0YR+NgWz44P5D2g3Gcg
         0/7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxNpNON5vMMiCBVD2KIFjsuW6b2D+4DS2pAH3CWCSNhNpcP+VWph+xFsJmwj3Iwz9xIp0b4uNsWZBEcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDIzOTrrQ1iUraB/EUxIAZrnKYbslgLjAqNWCusXxBzIOCSa1
	FpdgN1AZMucLDRmvht+qO2ghYGN9TWMh5WMYhC6shZf0LafsryQpWLUwfEFgIiLHsGs/IpoxRvL
	GZosgUWOGOhKZNYeIWDw9jCvl9EnUv5QLkxncrazcSTguh8YQKyNLLvQlMUbXHlE+
X-Gm-Gg: ASbGncvWBCj6LHist+N/vi3quZNA+8wqTeG/1F4xG24Nr1PDUoo+vkiR/xYZu8Q1E7T
	Y4DGlH8xAVqybputuRUPQnxcHXwp+NdyTkPuPzjsR1iGn67NOmNmNes9X5b1vRz9+dlBSO50Zhn
	o3aD8tfC9Eq3RuJy0yepFxokhjlgjTVVrG4Vb3czWZd0YCeEm3CR5/Zgu94i8vCQt7yFSSwc88j
	3VnCcs34NGxiH8ipTVXyXfGSMTQNAw0uGBS5eshaexJw49uyIUGG+2wUIjCvQrHCbMY/EDRKNYn
	0kyoQBKGSys6ey6uJfg4QwaruGnoEg6T
X-Received: by 2002:a05:600c:a55:b0:456:1442:854 with SMTP id 5b1f17b1804b1-4562e28616amr46679055e9.24.1752732274619;
        Wed, 16 Jul 2025 23:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjrUfFCvAdm/MUeAz0hpuBCDwLEyQ3RVRuTxAsQFHlPQhXRkgs7ZoZlJruFXtXCDIWxuHA8Q==
X-Received: by 2002:a05:600c:a55:b0:456:1442:854 with SMTP id 5b1f17b1804b1-4562e28616amr46678735e9.24.1752732274082;
        Wed, 16 Jul 2025 23:04:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f5ea01sm11589685e9.14.2025.07.16.23.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:04:33 -0700 (PDT)
Date: Thu, 17 Jul 2025 02:04:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: jiang.peng9@zte.com.cn
Cc: jasowang@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	xu.xin16@zte.com.cn, yang.yang29@zte.com.cn
Subject: Re: [PATCH v3] virtio: Update kerneldoc in
 drivers/virtio/virtio_dma_buf.c
Message-ID: <20250717015524-mutt-send-email-mst@kernel.org>
References: <202507171041593886W7pGra5n2hPMaT1j17NV@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507171041593886W7pGra5n2hPMaT1j17NV@zte.com.cn>

On Thu, Jul 17, 2025 at 10:41:59AM +0800, jiang.peng9@zte.com.cn wrote:
> From: Peng Jiang <jiang.peng9@zte.com.cn>
> 
> Fix kernel-doc descriptions in virtio_dma_buf.c to fix W=1 warnings:
> 
> drivers/virtio/virtio_dma_buf.c:41 function parameter 'dma_buf' not described in 'virtio_dma_buf_attach'
> drivers/virtio/virtio_dma_buf.c:41 function parameter 'attach' not described in 'virtio_dma_buf_attach'
> 
> Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>
> ---
>  drivers/virtio/virtio_dma_buf.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> index 3fe1d03b0645..986cc73c503f 100644
> --- a/drivers/virtio/virtio_dma_buf.c
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -16,6 +16,8 @@
>   * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
>   * for an virtio exported object that can be queried by other virtio drivers
>   * for the object's UUID.
> + *
> + * Returns: dma-buf pointer on success, ERR_PTR on failure.

Most people write "dmabuf".


>   */
>  struct dma_buf *virtio_dma_buf_export
>         (const struct dma_buf_export_info *exp_info)
> @@ -36,6 +38,14 @@ EXPORT_SYMBOL(virtio_dma_buf_export);
> 
>  /**
>   * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> + * @dma_buf: DMA buffer being attached to a device

And here it's different for some reason.

> + * @attach: Attachment metadata for the device-dma_buf association

and here in a third form.

> + *
> + * Allows virtio devices to perform device-specific setup when a DMA buffer
> + * is attached to a device. This is part of the DMA-BUF sharing mechanism
> + * that enables virtio devices to interoperate with other subsystems.

I'm sorry this is just empty of content.
I can not shake the feeling this is AI written.
If we wanted AI to document all APIs in this way, I'd just script it.

> + *
> + * Returns: 0 on success, negative on failure.

This one is ok.

>   */
>  int virtio_dma_buf_attach(struct dma_buf *dma_buf,
>                           struct dma_buf_attachment *attach)
> -- 
> 2.25.1


