Return-Path: <linux-media+bounces-47374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF19C6EF2C
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 14:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 4ABF729605
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 13:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FE23624C0;
	Wed, 19 Nov 2025 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fbXe4Vjx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B1E31ED96
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559434; cv=none; b=QVPibt4+GXaTLCno/ivq1nF3c98xEoJismESkI7J6aKrc9W3E4ISepOnfABvBFVBPNrFc+36nKBYKmPMXMuiv43BWEtc7uZtX5g5bM94MOoeihj5E3NJOMJU4+Wy4pgltsI7I8jk7OH7qpj8QX9xa3qlgAu8x2QRaXv4SSGK7VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559434; c=relaxed/simple;
	bh=xHij0HoeROljwYVIzlugVWfpQyDCueEmuef+LW2XwsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nlu/Sr/MSoLEMB0EHLu3hh7C6bfC9tSUAdfK4fkOeGeI9EcOwV7YDoirLgPBRT45sL5bBE+sdAPiCIuKkroXE8Zfj++Jdb4XoXFFSwB+iTpC4Ov93FvPSGg1iMHVGrbNJs9zoEchIO6DsTKAqe0GBaZhNlp5vOwAL+q8w7Nv/I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fbXe4Vjx; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-882475d8851so71033586d6.2
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 05:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763559430; x=1764164230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bEA8ekCp1nrcWXcrdpDKlGp67cbKmmAmKoKYvVWnAsI=;
        b=fbXe4VjxC23iYkeLY6whMHNkkabBkvJIbJP5uWEZ9VyfGmzFQGzB51LkWHp8IJDAfy
         bc+eLn4USPmSpsqj3w8yzTCbSWrINyQaCzhx2fEyFsGqHQot9GoulHgvevmJK/p+6YJe
         uuqgBjlYy9SZ2oFV1DyKPu/HDjlNaS7AdAB3/WXAttezKn3TRJQih2HNbzrWUBTHOeu0
         UJ2OeI0gafI/ERIzGOe9pXUqUOsEzFQpKb1VF8JKgbox0izii7oPTuI8eo/HdU9yTM8m
         sWOXfMhDn1cdFkJBrCL78GFZ1KRdezr14MAtsv1TRUBQrZyIN8Rm6LRdR8ltbAsYsTUe
         42Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763559430; x=1764164230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEA8ekCp1nrcWXcrdpDKlGp67cbKmmAmKoKYvVWnAsI=;
        b=GH4FI6fzjPzWqy/D/Zv4RifdrPlJlYWYVV43P1d3SCjPzRfRvH1rG7gBrLToXJbzke
         4aTVRTe5OHLXKIlsv+Oh+rJs1R3nIadTUazQD7oHjHoPB05JKlpFua2VP0cGtTIbYQU1
         YNRr16m1vwlsOlBc3e+BqyZr1O9JXv5KtQlzJf83IIQKXhpvMyJyUfqVIo7kP9F8+iKG
         2liKAtgjoxvbb06TDwsIf9OdG9Wh54d0BwNoVas9tbuVL1boYlkyFNaSpLzrKWe0UdD3
         cCLjLn1+LWNkU9A8+rhabWlhOTcE2QFoDj/2EykBuI3PO0nF2jN1Oc6hjvz6OsaA8NwP
         r97w==
X-Forwarded-Encrypted: i=1; AJvYcCUH+iscjVc06lnVogkD8ZLTCNMmpwQomp+6nm1HZWR2SlhLO0pXafi6dzzG3tqbvwD5a6hPAUCnsXvpJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZLe33QgNt79hnyZEwZO2K5HgfupDC/bjJ3/OLt6xpzmJHSSh
	asQxMvMSCNEsa4w14iDicCvtvACjHRKmL2SEfDaUaZNn9POvcqzziVt29eCenbqgKkk=
X-Gm-Gg: ASbGncuH8PRY5SavEGvyoczYtVlHxQG7YXBsC/hhZRGVEtu5fUfKoewPIFvN5l3zsDm
	sDki82hG0HL6Mo+2CLLOQcdPNc8Ui2D/DOhwOG8V86FnFDZMErRqVfKKH03yCZ4YH7dfirvzj8b
	+UJkBJ4CadCyGFjKWBbMtNx835eEuX86anjzXV25qSQAKYXbmKwm8IYeyfths8dQ+6z9YuQNPMl
	ao9XYShYrrdWMRB+uICuzwaBUAtt+3SCii3KFlfPNzvx/o6StzRDPVjDJUjbMW3Ft8havWD7w7a
	BhyRegyM7FDdp2PEfjATBU13zH+rtM+TNnJdZABaZuDElcRDSZYwAIrVbY6H/IDon2VgKQhv/9N
	Fz4cHWhpL6uJrJXEUTLT+XsywwM4X/ZVT2yqfDnkcS/nfiuQOPtC7jAHdrBkVb4VoOCfyoaLBWA
	qTzJhhV8NM6RZQbm4mo/LPgEgCxYZeg0r506UhBu6CpvNlBhZi0R6/dmIdV58bCtYJgWU=
X-Google-Smtp-Source: AGHT+IGopBrMkEkq4/9KDO3x1qdzFmkcFO+Cz6Is5DlvxN8PyWRrz38DMZOLki2k1pBf80D+Z8AYkg==
X-Received: by 2002:a05:6214:419f:b0:880:22f3:3376 with SMTP id 6a1803df08f44-8845fc3e0f0mr26190076d6.10.1763559429603;
        Wed, 19 Nov 2025 05:37:09 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828613962esm135128356d6.0.2025.11.19.05.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:37:09 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLiMu-00000000ZAY-2EdI;
	Wed, 19 Nov 2025 09:37:08 -0400
Date: Wed, 19 Nov 2025 09:37:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v8 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <20251119133708.GM17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <BN9PR11MB5276BC3C0BDA85F0259A35058CD7A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20251119133000.GB18335@unreal>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119133000.GB18335@unreal>

On Wed, Nov 19, 2025 at 03:30:00PM +0200, Leon Romanovsky wrote:
> On Wed, Nov 19, 2025 at 05:54:55AM +0000, Tian, Kevin wrote:
> > > From: Leon Romanovsky <leon@kernel.org>
> > > Sent: Tuesday, November 11, 2025 5:58 PM
> > > +
> > > +	if (dma->state && dma_use_iova(dma->state)) {
> > > +		WARN_ON_ONCE(mapped_len != size);
> > 
> > then "goto err_unmap_dma".
> 
> It never should happen, there is no need to provide error unwind to
> something that you won't get.

It is expected that WARN_ON has recovery code, if it is possible and
not burdensome.

Jason

