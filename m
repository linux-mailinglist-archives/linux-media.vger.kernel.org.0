Return-Path: <linux-media+bounces-43364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A3FBAAA1A
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 23:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8190421D25
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 21:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB81253B64;
	Mon, 29 Sep 2025 21:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PRqBoWWm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587D933F9
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759180669; cv=none; b=jD2rO0zUPc4GvWpeBQW0pRp/IR0DyT9EKTtYhg3nf0do3Y7iCd/tMK+Zgyx/7oa6r87cSiL5XNetYRbLxZ6f1TcECkmcaPGxXNt+UL2+mZOYwX97gOnMApbyzqVuDymf82OTmNxPDiPeSZgewlud8ddW5BRuVScYFuFtI4Io1hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759180669; c=relaxed/simple;
	bh=fo8uROp6Yd4p51oNun07BdvS3ckFl/pgBYhRp5v8n58=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUqyDXDIDsPQSVeBDd3cwPpqQCCVDHRSJilElBw2cE7UxWUY/WkJTfs5G9x36ZCh5hb1EHjp3bnPtgskj5pDBN+DWxSZFCTfR3EeZF7MsTYGJzEYv2NDD7PH5WpJS7cEqWeSYC6IgcqH/hs8Z7iH/fyoSMOvetdLyMBK/K9pgyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PRqBoWWm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759180666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvJsfDbbmraa6iCCkjoqVoBB3Mb9XdjPoCcVP3qHFzU=;
	b=PRqBoWWmZf9bx5sAghO/yeCFDa5/DCJV29BNJOZgQLBDdtur8MTCn2aL82tGx5VSg4BjpN
	69uZtADX1TPTW6es+SlAUKdZaSk3Mr+Y0u+HfSpnHONjIflQ46OV0LnGkEzg5hRih9K1EJ
	kugIpO5FE+bgDTpyByJUKJCCmdjd4u8=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-omHsYSqhMo-SQ9eb0O66kQ-1; Mon, 29 Sep 2025 17:17:45 -0400
X-MC-Unique: omHsYSqhMo-SQ9eb0O66kQ-1
X-Mimecast-MFC-AGG-ID: omHsYSqhMo-SQ9eb0O66kQ_1759180664
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-427350656e3so6835455ab.1
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 14:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759180664; x=1759785464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvJsfDbbmraa6iCCkjoqVoBB3Mb9XdjPoCcVP3qHFzU=;
        b=FIOL1lDGLLktZw0k13UxPMWc+GgIf1KZSVL/AWQI1TfNMfTofWzn2noKc3ObkD+A9d
         JhKya+U2gp24+FrjSg70DDp8R+IXFaoubLpwRED8jmnPXT3FtNvb8/ik8Vfe9ZL8TqKh
         LXYSvgX3rXUSMqISu4yybbPpj9FYiiHhwLy2tsjt5V6iMJVIrqObozG23943AV/eEzxl
         xZ2eh7Qt46bNlFf9cqNRiNtm+kXvc2ajF6atj/NR89dBKc0mXLY3QuiHLpwF18/Q7Ua9
         s3H7Lj9oO/9QM3U0HHPfvwLlAUXMuYj7+yK508ucomAh5XjmxXWCX2fr6a6pR/R+UFx9
         Cgew==
X-Forwarded-Encrypted: i=1; AJvYcCX+VSOxtRcO6WyHJXhYpBdXWXM4hwYA2GY9OHomBZiikx8NrBJtb50CFr5oAXtzM5F+OBXmlwkOg5DwRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4JRmt8mPTvqNiUEh3IAb2p3xLXEddChM9F9+DIcF8Y7JDU4su
	JBAbVwf6KvwvjmMTvtQ5xpJofy9Qe6kyaVhiHKtxdK0oKhrUH+2Zo6LM5KNzPMqN4yQ05CuJ4/Y
	4Y6c1TyconkPAPHIKc5nqdL9VwBm1ya6CN/8JBiOw/VU38nVLk/qA+e6yUl06zuwq
X-Gm-Gg: ASbGncta1z1SU68ImNCdA60bH7IxDL5j0IJHDLeo1YiSUQAcRAiaxUjLRqqsCzKA/5p
	AyFv7OTqi9XUYIGX7VEesc1InOBOzYBxjwf/XE3jqNwQYuO5ImyWj4ILqpx3rAfDhOj0bFJkeJw
	kfpgnZ3uUuOo1PJ8cE5mARNFvi6pL4udPCwDlTnhPgNx0/3RU23Vdvmd5Xcs97TbAOAtCyMtEIT
	IaenuHdocB9HNNFsPL27n+TGmynBdA3uIeJc2gpE0qSamT/9xziYLhdO3nFlVYCLF+iU20juQ+c
	HYJvgmyjINYXvkD21YvyUwcqKZ0pwJbUgI/QttJpcv8=
X-Received: by 2002:a05:6e02:1525:b0:408:1624:b2ee with SMTP id e9e14a558f8ab-425955e4f60mr87964815ab.1.1759180664132;
        Mon, 29 Sep 2025 14:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3VrvxaH7k00bkTZJWrxcv/Xeuv7Ik/zOnPnH3ASkfKmA5ptZ34qoyLfGaDXRfunQjFfs8kg==
X-Received: by 2002:a05:6e02:1525:b0:408:1624:b2ee with SMTP id e9e14a558f8ab-425955e4f60mr87964675ab.1.1759180663680;
        Mon, 29 Sep 2025 14:17:43 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57269f5d0c5sm1963571173.13.2025.09.29.14.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 14:17:42 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:17:40 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
 <joro@8bytes.org>, kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 07/10] vfio/pci: Add dma-buf export config for MMIO
 regions
Message-ID: <20250929151740.21f001e3.alex.williamson@redhat.com>
In-Reply-To: <b1b44823f93fd9e7fa73dc165141d716cb74fa90.1759070796.git.leon@kernel.org>
References: <cover.1759070796.git.leon@kernel.org>
	<b1b44823f93fd9e7fa73dc165141d716cb74fa90.1759070796.git.leon@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Sep 2025 17:50:17 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Add new kernel config which indicates support for dma-buf export
> of MMIO regions, which implementation is provided in next patches.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/Kconfig | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 2b0172f54665..55ae888bf26a 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -55,6 +55,26 @@ config VFIO_PCI_ZDEV_KVM
>  
>  	  To enable s390x KVM vfio-pci extensions, say Y.
>  
> +config VFIO_PCI_DMABUF
> +	bool "VFIO PCI extensions for DMA-BUF"
> +	depends on VFIO_PCI_CORE
> +	depends on PCI_P2PDMA && DMA_SHARED_BUFFER
> +	default y
> +	help
> +	  Enable support for VFIO PCI extensions that allow exporting
> +	  device MMIO regions as DMA-BUFs for peer devices to access via
> +	  peer-to-peer (P2P) DMA.
> +
> +	  This feature enables a VFIO-managed PCI device to export a portion
> +	  of its MMIO BAR as a DMA-BUF file descriptor, which can be passed
> +	  to other userspace drivers or kernel subsystems capable of
> +	  initiating DMA to that region.
> +
> +	  Say Y here if you want to enable VFIO DMABUF-based MMIO export
> +	  support for peer-to-peer DMA use cases.
> +
> +	  If unsure, say N.
> +
>  source "drivers/vfio/pci/mlx5/Kconfig"
>  
>  source "drivers/vfio/pci/hisilicon/Kconfig"

This is only necessary if we think there's a need to build a kernel with
P2PDMA and VFIO_PCI, but not VFIO_PCI_DMABUF.  Does that need really
exist?

I also find it unusual to create the Kconfig before adding the
supporting code.  Maybe this could be popped to the end or rolled into
the last patch if we decided to keep it.  Thanks,

Alex


