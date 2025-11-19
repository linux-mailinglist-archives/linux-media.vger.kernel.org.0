Return-Path: <linux-media+bounces-47398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A6C70D40
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6EF2E2BD08
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053B1371DF1;
	Wed, 19 Nov 2025 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XdlJDak+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6855A3090FD
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580688; cv=none; b=KgVrHWbjL1aiQbhZAduDg/rErsEhP10R3A1v0amxMt+krESakepmolUYPkQ/+u7KsKMomT4MZHnR1T0biC99ecK0JbpLU716oLYlLT97hmsMFybiHzO2OgfdxleQbNcDGQxN53HtK9XTe6Zy4ajMCL8wBqc6GM4L2Vz2HEfeU7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580688; c=relaxed/simple;
	bh=31o43Jiq7+42iBKuCHD0EJijctYU11Xzmoh7F9+p7aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfDp8bMZ8jOkQhngyE+IAe9zRliocJ8y840qQRF60Xe0dJbtCCE1TEIo8+SvBLuVqWeOfl73L7lvDxxmgRfQoNWbZwyHknbJOy8o0SsnZQ+p2mKhGtFPWzsAC/XzsfexFTinYJkIMjg5PGeJU6VQUnACPHMlDTdk6YLXuFyRU7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XdlJDak+; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4eddfb8c7f5so806801cf.1
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763580676; x=1764185476; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h7MnLKcAx1SQL4BtR2OdhLpsdZ14wJj1fNMBVXMaHpI=;
        b=XdlJDak+5BK913SU3JuefgTys0Pu3jagmK7yJRyg0hso6vBbEnNWrP/4T4ol0frYeQ
         v72slbgWiUzUkvc5J9nruxngr4U8bjd49BPaZVmvFk3nVkQeWMFAA9u86tKqv9X1hNhK
         MlqYYLa9OWUP32XsBcZxKrfLx3/P5R6PJ+h5hBO1AY350/0bZcNA4a3VB+Mm2EZq+tuy
         2zW8VsnOjICqJWrFFskAlkKYKVrHI+m3LVPh9ZWULCzK0B6ii9jOvGUvNr+rAbET5gKT
         aIqFqtGZMVR1/oWhdLlQH/aHK4RI3YFZ+ToY0lGX/NpOTOSRqsVtdilqIlqws45I3kGI
         vpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763580676; x=1764185476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7MnLKcAx1SQL4BtR2OdhLpsdZ14wJj1fNMBVXMaHpI=;
        b=p9RyDi6tUoA7ssVzThgfOkSF676Dh6Cz4oYvFqteWY1KjfUulTkbjURg58Ou4OkH/P
         w2CVIoTbt1bzOvSkqtz/55ksmi6Nc0+RWvmQt2tc8g2V3POY0FFcxdJ3tSpZE3HQXY+p
         9SOQcL0Uc7TLOVYibjHqM3qBoC0gArZysr/K8F2a3gZ0/GcF8B8LeWICRMrVGOxeAYyX
         GXqF3sICaLXOAf7FWq4Bc+X3R5VRmhnZDRPFufplK6ZFR0qNqTFo4oh99cyUX8ESOxp/
         kVe03Qy68o85yBdlqttks0/NNJ2XWf/IWHdtT3bDNR/BdGpYpWgpOuJP0JY8DELvyV66
         1INA==
X-Forwarded-Encrypted: i=1; AJvYcCVmQSwJkRrb4ywhMXJSofYE1pvSjyB0wVwSQs3Wom5+oVJj54Lb6SaG9jPfXDXxFzk8S6jlvLex+CtT0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp8i6dgzvi/NMeqEvsbQ/mFFAK7mHLTPZ+/KtfguJUnSutmqmp
	WtnXqInHSRDgml1lA+8z3s15Fe1G/GhUIIHDxyXA8cLKLYessrEmdZQHQ7Zu8LKfAfI=
X-Gm-Gg: ASbGnctTgJYTb0aw7lXiNd2jCK8BeDXc9Xs6V4iG4v+ZQ/IPDiwPXMcDVa6utOFOwj6
	SxFWVV6w1MIAv1ddPcuLbMjudOc5pru3JXS9rKYj0SAyxk9/muJnJH03k1GftoRXVcU5tYPdgG0
	Mjxxlnnu5Jb+lh5m0qW8MLA1hxEpXk/IqlOi0y353VFIUZivlFWnyHUeYmGHXBf+qleUUHgnCSX
	rkHSMcSQcwcfB1IA+59Hm536rB9f671M3Z4uRjqS5FZvyI8r0Uk+J7LQD/3ZF0qoKiBPhtnGYOH
	SyVOm4mINzKPXs8oGWbbfB4CNb2BsUL1yu8OVARVMZa3+/5Yapm5GgqMCtodvgH8zEArvvqR54A
	HRkx+JZ6R5Z2PBuywyH+8oLwhl00hy4vV5M/mbxMp4EE6lFaDus166OusboaqiQz/ZKuOc4hUdp
	Y1n5D1UcpND5HzV65PKtWZPIUq0PrDwdmSFhDK7SsK9BB+mMvN2MM78Ujgoccjh1PSb24=
X-Google-Smtp-Source: AGHT+IH0hpvR5twkqRmVGMRtAcrCxesRIOb4Xizv2z5I0TXHRJV8nSPA0Y9PLt873fJAl178vHWixw==
X-Received: by 2002:ac8:7e4c:0:b0:4ee:4a3a:bd18 with SMTP id d75a77b69052e-4ee4a3abe64mr1136891cf.76.1763580675980;
        Wed, 19 Nov 2025 11:31:15 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e46ed0sm2807721cf.20.2025.11.19.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:31:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLnta-00000000bWq-3r3x;
	Wed, 19 Nov 2025 15:31:14 -0400
Date: Wed, 19 Nov 2025 15:31:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
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
	linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251119193114.GP17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>

On Wed, Nov 19, 2025 at 02:42:18PM +0100, Christian König wrote:

> >>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> >>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
> >>> +		if (!dma->state) {
> >>> +			ret = -ENOMEM;
> >>> +			goto err_free_dma;
> >>> +		}
> >>> +
> >>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
> >>
> >> Oh, that is a clear no-go for the core DMA-buf code.
> >>
> >> It's intentionally up to the exporter how to create the DMA
> >> addresses the importer can work with.
> > 
> > I can't fully understand this remark?
> 
> The exporter should be able to decide if it actually wants to use
> P2P when the transfer has to go through the host bridge (e.g. when
> IOMMU/bridge routing bits are enabled).

Sure, but this is a simplified helper for exporters that don't have
choices where the memory comes from.

I fully expet to see changes to this to support more use cases,
including the one above. We should do those changes along with users
making use of them so we can evaluate what works best.

> But only take that as Acked-by, I would need at least a day (or
> week) of free time to wrap my head around all the technical details
> again. And that is something I won't have before January or even
> later.

Sure, it is alot, and I think DRM community in general should come up
to speed on the new DMA API and how we are pushing to see P2P work
within Linux.

So thanks, we can take the Acked-by and progress here. Interested
parties can pick it up from this point when time allows.

We can also have a mini-community call to give a summary/etc on these
topics.

Thanks,
Jason

