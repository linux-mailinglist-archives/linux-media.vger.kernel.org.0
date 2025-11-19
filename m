Return-Path: <linux-media+bounces-47373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245CC6EFC2
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 14:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4829D35CDC2
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 13:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0B435A151;
	Wed, 19 Nov 2025 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Q0A2KJ7+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505C7350D57
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559334; cv=none; b=t76AzqekoBLz11O1ex74vWVCQ9bvJ5HmONYMPiUvq/lmXSMKpqUL+uWLqZwM74CJtEg9Swup5hDKugviJH6tHKQJQjyPKZf5KKzM4dbpzWfYisvTIkMmuJ/2Aq/divi8+7bPYIUOj4ZQ6D77chW6p6PqBXZ8TK8XHoKjTVDO5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559334; c=relaxed/simple;
	bh=JbbhmQiTlI31d28XPGRBqj9eq2p7XGaOpuCDuXLlBNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABinw5B/kUvhOhKEqy+opI24sUlBtdHlDTZroQJg8C21xkk3rMos0wbZoE5eUyCgyz8bt4C2FUGzOBRdQcOVrXxuRiClD5nsKsfHwwk283zc0isOVe9wLXeCCBjv6ikAz96UgpqUerZV2vk//0KL9+MWHRYYKRMZLpIqmSqZ8P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Q0A2KJ7+; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b1b8264c86so659640985a.1
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763559331; x=1764164131; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72A2miNlT6HYTvn6gfrMP1LsN3+/rcjlJPwocEiTvrs=;
        b=Q0A2KJ7+QNz7Du+Iu0DMoQYF9BPquUCs/jIMwr6j8yjAJYCoUd2gtuG8vQUjR8XFmz
         BWU0OXFasN+uYXzui5ccF9deC4HtKGvvT+DRuxn1jSOtubFSQSTLMDOCI0v+OkrmnQo9
         j30dh3Ui+99KMkOenB22DloIr/bkj7hqXrn/VjYcH8e78vnEJUMWflxtjGpc5bOYPhAo
         KXmcPuwjhRA8P5J/K6B3nGGLubDNoWabMG9R/EXoYaFsaHe68biGjnve1stMiZBlv7Em
         nn9dpCi4NhEsLSnTb4JJW9K645HB/HQBjJ/ZBpJ8CfKLpA3GNs2AkNnBXK9kcFhw5d1U
         l8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763559331; x=1764164131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72A2miNlT6HYTvn6gfrMP1LsN3+/rcjlJPwocEiTvrs=;
        b=Ozw/cfUz7m74aNmC/DtTREHyHWqCBczk+3Zw4FzDXs0NiMX0VuTO9YzaeIICEfHG9n
         iwN3sOxX5yGejMysibxMnGbiZuy5EYlTa/zEu9Vnz3pMIUltz2PS5as01K+0rUJum1qB
         0bed9nwknhPZ1uAiqLUbUdh1jERGrmpAeF6DBPo0S5yAj07xnVA6YEpzEHTJiCG+qfAr
         Oz6y/8oct+HRGh/okwn7mb4eMpTzeZrdhDxlBtVS5qPHLzbYaopThHagjXo7bYt4tUF+
         oVSGLJgO+CiUeTDpfgyJw9wZYNROv0aYrRFzJj1AK8WC+FLQPwe32Gt8hqDJrj0xSXyQ
         DG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXK3W57MGGrPpHYt9hHl4NtDgwFDepPysowIdpExPxrzYZJ8Z6vBtBDqhr6QyabNh2C1r+sPJOVf9N1tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5sIrTiK5Fqo0YrsnZepYoeyEF0okDbrVCanhwzuRwUNPojk/m
	BIePs9L7OetOZimgwZeirfONabTa8wtxlnUGIk14+zskopFeYS0AwYdz1QA2KF7IB8c=
X-Gm-Gg: ASbGncv5aqFJ2nkGFAPqmvFfsAr4ePOX4Cg7rlOqAufe6lZGT8GY5rkK2pssjyy1w+r
	/Y8aCMBs41ciY1mcHnOTFr45V9xZzANzdNREdjJOWjkQBniWRmdkE/4Hm0JyRMg3Ai3I8+mI/Yc
	slhRvuHOW1+mWtFc5QybOQisafxVOjj8bx4h9iO8EQ+lImo7dzrqxZmVLqiPIWj9uSyc8kXK3Sj
	f7uMCx7sat+m1Dymau6LWjXKPkATdCrq512lXT22CkGeVBCWKTCAthraqMX7NxRS2TkoV3f22kh
	b2kOUPEINfvAhbSbSuZ85TYYuN9U+T5PHTvqYetCimpGBn8ZQhYxE07sAGyNB3kiNghkYjGpn74
	9n93eBV/mnc05uelssdy5zki/YrqxLFClgVs/8sV+5ZrjW4icKDjkV9qnDcPhhSh6TVOHBfwxvm
	UsJxh6NE/E3bmVsCuevVK2DUJPFvBLnh0KB+53r0nK+MT0+0LI9WC3eJht
X-Google-Smtp-Source: AGHT+IE7dgToIwQMvgHU78QddWp+ZiJRe5Ch8SPXRMVN2DOwf2T1NT7zeC+YapS6FYUcpx8f/T/2tw==
X-Received: by 2002:a05:622a:256:b0:4ee:16a8:dd0 with SMTP id d75a77b69052e-4ee16a8d595mr193299331cf.53.1763559331028;
        Wed, 19 Nov 2025 05:35:31 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ede86b376dsm127986771cf.7.2025.11.19.05.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:35:30 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLiLJ-00000000Z9b-1C3G;
	Wed, 19 Nov 2025 09:35:29 -0400
Date: Wed, 19 Nov 2025 09:35:29 -0400
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
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v8 05/11] PCI/P2PDMA: Document DMABUF model
Message-ID: <20251119133529.GL17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-5-fd9aa5df478f@nvidia.com>
 <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>

On Wed, Nov 19, 2025 at 10:18:08AM +0100, Christian König wrote:
> > +As this is not well-defined or well-supported in real HW the kernel defaults to
> > +blocking such routing. There is an allow list to allow detecting known-good HW,
> > +in which case P2P between any two PCIe devices will be permitted.
>
> That section sounds not correct to me. 

It is correct in that it describes what the kernel does right now.

See calc_map_type_and_dist(), host_bridge_whitelist(), cpu_supports_p2pdma().

> This is well supported in current HW, it's just not defined in some
> official specification.

Only AMD HW.

Intel HW is a bit hit and miss.

ARM SOCs are frequently not supporting even on server CPUs.

> > +At the lowest level the P2P subsystem offers a naked struct p2p_provider that
> > +delegates lifecycle management to the providing driver. It is expected that
> > +drivers using this option will wrap their MMIO memory in DMABUF and use DMABUF
> > +to provide an invalidation shutdown.
> 
> > These MMIO pages have no struct page, and
> 
> Well please drop "pages" here. Just say MMIO addresses.

"These MMIO addresses have no struct page, and"

> > +Building on this, the subsystem offers a layer to wrap the MMIO in a ZONE_DEVICE
> > +pgmap of MEMORY_DEVICE_PCI_P2PDMA to create struct pages. The lifecycle of
> > +pgmap ensures that when the pgmap is destroyed all other drivers have stopped
> > +using the MMIO. This option works with O_DIRECT flows, in some cases, if the
> > +underlying subsystem supports handling MEMORY_DEVICE_PCI_P2PDMA through
> > +FOLL_PCI_P2PDMA. The use of FOLL_LONGTERM is prevented. As this relies on pgmap
> > +it also relies on architecture support along with alignment and minimum size
> > +limitations.
> 
> Actually that is up to the exporter of the DMA-buf what approach is used.

The above is not talking about DMA-buf, it is describing the existing
interface that is all struct page based. The driver invoking the
P2PDMA APIs gets to pick if it uses the stuct page based interface
described above or the lower level p2p provider interface this series
introduces.

> For the P2PDMA API it should be irrelevant if struct pages are used or not.

Only for the lowest level p2p provider based P2PDMA API - there is a
higher level API family within P2PDMA's API that is all about creating
and managing ZONE_DEVICE struct pages and a pgmap, the above describes
that family.

Thanks,
Jason

