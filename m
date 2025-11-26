Return-Path: <linux-media+bounces-47754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB4C89F35
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 14:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E92C4345A3E
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 13:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A952121CA0D;
	Wed, 26 Nov 2025 13:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0l/5TvTw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED60244675
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162773; cv=none; b=JT3NbBg88p9mBlEahtxO+kfRquHZAYjM2mk8FznRMkxT4eSxHAJtSUdRfv0Tav8JH/pqWyVdJmIu7ld888UrBfCmbhEp7F/dShP75kwTQXFhPDcVzKiFWomvbuu1geymMy8gd5ztU4wRrRNJTQSL/yvYZOBgYz2GU/BmYbRYP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162773; c=relaxed/simple;
	bh=Jo1hwBQ1OAKjPw3AJMr/P9Kbq4e9sCgCina51O06nNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=finB+m5AvrhPK93QVwXEehGxz1JtKFJvslV8S+Vs8wtwVZBfr2nEpc5Yw9qLIKf5r7utxJTBrEsoA223ym5J6YNB6pwUsjgE1FPVnMv12BUob7xmc2nVAGXiATaUBAYmYEnIFDDcJ5MXcfWJRplJbrp/B3w1GjDsrJEvxSf4SGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0l/5TvTw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-295c64cb951so203045ad.0
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 05:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764162771; x=1764767571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v7j/p6bUr5Xuh7DTD99aQLTt37H/gN4j/r6C1+HVuuw=;
        b=0l/5TvTwMZVpkD0BWtEXg5dW5N9AUKyXKn2OXl7vYSfXG6M2yRr080jIEYwyfqPEAd
         wMne3IxRGt0ErWDHmNsGn+LmXZfG3rqsj6HwxmqzPKf7n+FLOE5HFn2X4l77O3MBtID7
         vxzpILnpr5BHrOJ8XTP74p5zo6lEEpNddTzRqW5Hl91ynh57gDKQUzAB/nt28L6UGsSc
         8VwkNrMdvHKhMj+OxH5o55l/r0P3RLOZAdClLg7x54zjjEMeqTfpkk20+lzJpOUOQ1ei
         tQ9ByWrlYY3io0pKAa4iAp1bTao94cm4S95Fi1Ta0s2+MgqcGmY6ZV+u6TQ3AT19Xpib
         TGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764162771; x=1764767571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7j/p6bUr5Xuh7DTD99aQLTt37H/gN4j/r6C1+HVuuw=;
        b=P8CKsVo9TPqSm/tibWVSqx+qT4xgtYwen0stTJS7wjHdBLMFY+XH//DYuZbl406pz6
         ae0Utv7MrLFKWh5mT4apB7ZSUE8w+/llQ9umw7b5Zpy2/i26sKWHpuu354vfDk6tLOEB
         Nc5giJ/VpCNUsleZvOBQWgzH2wOoogJ/V+FpSYf59QL4joqxPNQ6HJTYljD+HuHjzRiP
         6Zm6VbqGv1iUOYDNplWNeyPn2jYzhgxuUfoEQI6akS4tcix5I6/a3iXBww4ldG5972sU
         4oAvPSJYXg+RX5wE0i/DqhvH/uiohcyIs+ZjpMmtbIm9cmXI220Bnmcq7A+VdjHyf5ni
         M3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzritReCKB+ZQdRie99CQYHkVLiwTL7BkYrs3ntUSenHQxRX2I3RUQ5kUZmJ038eKslGQMPazOoO1E1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMaNfRNQzz/ma7/M8GhY02/riZ+AtWhlTBEFtZfs40l379DwFf
	p2HNG4Eb2ugVMZQGcsrXxkNkX+DzZ4V9DerBB0IVQ/Bq0e2BGNx2c+rVwEHY+MV3cA==
X-Gm-Gg: ASbGncuWr+6dT3T9lFjG4uc8XfJRCjFTRQUeESRAbAlxpRHFsLy4YM5VQGHEkIv6yGm
	fhKKRucgjag/XbNHUSoRpF9TxCvAxRNDxeN9oyavlp3CLz42KXgTZe6DTuUSR8YeivxgE2vdsmk
	LX4FZ1OIFVcLYNv2OTAluIDtCqCOjoSSRVi+uF9iRpSlWmr7h9wKyt2HgzBtsKXdQPXZEcqUZao
	jGbMvnRhnaFinY+VuZ9+mSm58kb/Cz9Roy3M8VoN6fwFfz/3gN755HKd+ODF6rD3ef1lDo2I18b
	QYFLhMlCWED+tJUDgLjmXAAzja/xBqmcdatA2KuTFiu6Tonp812Kgam6buOwnIdrRsHGNQhloV7
	pfTSHAiBRAhflNh98oSVqicqIjVTzOfq5eFPhYTouhtIMGoznVM+aGlOV7tLDHaRMfhoH27ERIA
	nqfOZjYtkdCcI9OONc2reNfbPb2Hn6otYRw7SMmC+9K5AxDFjN
X-Google-Smtp-Source: AGHT+IHJIOBgKlL+CS0ZpKtYX5Djx07PEo4PrDI8k+TVBWbcqpi0p7MakMMReKQUlItaKRJKERuBaA==
X-Received: by 2002:a17:902:cf07:b0:26d:72f8:8cfa with SMTP id d9443c01a7336-29bba9e8a00mr1709325ad.13.1764162769984;
        Wed, 26 Nov 2025 05:12:49 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b105e4csm194769895ad.2.2025.11.26.05.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 05:12:49 -0800 (PST)
Date: Wed, 26 Nov 2025 13:12:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Alex Mastro <amastro@fb.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v9 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <aSb8yH6fSlwk1oZZ@google.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com>
 <aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com>

On Tue, Nov 25, 2025 at 04:18:03PM -0800, Alex Mastro wrote:
> On Thu, Nov 20, 2025 at 11:28:25AM +0200, Leon Romanovsky wrote:
> > +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
> > +					 dma_addr_t addr)
> > +{
> > +	unsigned int len, nents;
> > +	int i;
> > +
> > +	nents = DIV_ROUND_UP(length, UINT_MAX);
> > +	for (i = 0; i < nents; i++) {
> > +		len = min_t(size_t, length, UINT_MAX);
> > +		length -= len;
> > +		/*
> > +		 * DMABUF abuses scatterlist to create a scatterlist
> > +		 * that does not have any CPU list, only the DMA list.
> > +		 * Always set the page related values to NULL to ensure
> > +		 * importers can't use it. The phys_addr based DMA API
> > +		 * does not require the CPU list for mapping or unmapping.
> > +		 */
> > +		sg_set_page(sgl, NULL, 0, 0);
> > +		sg_dma_address(sgl) = addr + i * UINT_MAX;
> 
> (i * UINT_MAX) happens in 32-bit before being promoted to dma_addr_t for
> addition with addr. Overflows for i >=2 when length >= 8 GiB. Needs a cast:
> 
> 		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
> 
> Discovered this while debugging why dma-buf import was failing for
> an 8 GiB dma-buf using my earlier toy program [1]. It was surfaced by
> ib_umem_find_best_pgsz() returning 0 due to malformed scatterlist, which bubbles
> up as an EINVAL.
>

Thanks a lot for testing & reporting this!

However, I believe the casting approach is a little fragile (and
potentially prone to issues depending on how dma_addr_t is sized on
different platforms). Thus, approaching this with accumulation seems
better as it avoids the multiplication logic entirely, maybe something
like the following (untested) diff ?

--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -252,14 +252,14 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 	nents = DIV_ROUND_UP(length, UINT_MAX);
 	for (i = 0; i < nents; i++) {
 		len = min_t(size_t, length, UINT_MAX);
-		length -= len;
 		/*
 		 * DMABUF abuses scatterlist to create a scatterlist
 		 * that does not have any CPU list, only the DMA list.
 		 * Always set the page related values to NULL to ensure
 		 * importers can't use it. The phys_addr based DMA API
 		 * does not require the CPU list for mapping or unmapping.
 		 */
 		sg_set_page(sgl, NULL, 0, 0);
-		sg_dma_address(sgl) = addr + i * UINT_MAX;
+		sg_dma_address(sgl) = addr;
 		sg_dma_len(sgl) = len;
+
+		addr += len;
+		length -= len;
 		sgl = sg_next(sgl);
 	}

Thanks,
Praan

