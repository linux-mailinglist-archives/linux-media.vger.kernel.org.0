Return-Path: <linux-media+bounces-47500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA24C743B2
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ACF2134B5A7
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747E532C94A;
	Thu, 20 Nov 2025 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jMJVlNB8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C833A70C
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644850; cv=none; b=tX1kwildz6MHw1dTgegl1Dy9nLiUeJLQbprdns9v6+64Sr+/fCtr/I+n6OiLV+AT2lsFyWP3WzMdzHgxIaip6NLNvAI/Net3l7Zcr/C7W9GagWDlNw8RPvkxzz9EwjuXqAw95qmvtENgGSEIP6Dvgbl5BxweVWFjdq1WW3Cn/cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644850; c=relaxed/simple;
	bh=FAIy2u4gJscDNGUshiInImCPqOKl3iOKQJH6e6Bc4JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j73Is1L1y/hYZPTLGyM2b1FX5oE11NPoP8+GHXxjSWSqBJH27j8ZTcBuYQpTPxx8s89sj6hK9gFFbTcg/VLnnJyL8Sm+PsBYyh31534V6ZvDQGhhe6Qsa3um+YLkIJDjJAjQLj+dnsHS2VnMEcHVUFzESOclAKx5+ex52iYODVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jMJVlNB8; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b2dcdde698so116999685a.3
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763644847; x=1764249647; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaI8T1P9V7HUSR5GC1P83jhUObFww+4fRanAKkUJgJM=;
        b=jMJVlNB8LyM4AYZyl088cBiSIlJ90Q1dm2hb+qOJix1EHdJs4siUbnVhSfjdoo+d8b
         CpJ6KfO7u7JniZDhdoBs1zVrqavLhdwn31rKFf/kVN8vkyxieUH5wcPJTih/9lZw+PEX
         fzdm1aYuxKCanV8/aYUVsuP51mR3HV9FaHggDK4qYX5m3Eht6ufYvvO9vptn0SOijTOl
         cfmQgVoxaFFQaCv0MtR3VFkL7VdP7LsWZJMB5e2tkAY+4CqMtLl57rP2UzUjo5ld0ad3
         Ew7cnRVtQJOT76Gc3wbQzgtVC/yQSTJ4MullMwUuBOCRwifmwR9JypsEhj+RRVt4akF1
         VX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763644847; x=1764249647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GaI8T1P9V7HUSR5GC1P83jhUObFww+4fRanAKkUJgJM=;
        b=L1AZzk7f4vtQv2m8XoVvPbOUHZcfzGtS0XQlw8BHLq+nH+tKuG7j1TOFy00qeVDExr
         7k6su5Vtz79gzNYS6wuJ+id9I5qNsPDFxe8hIrwzOmL0e/4POesOAketSLqhBk63nHVO
         rG8c3G1PlfJR8KNgKRYggk6kr6y50dR6lH+ZVQ47lW3V1OMXwRomb3Go8/fNMuuvmLmw
         JzPUQt5uEoo8h89YRkoKPbpVOeAtOD6fG6NKUNeGdtFKRKZjANQwiphdGuwn6XTcj5Lg
         SzK8f8OIA3DvS2ML6e503GNlYqR98CvFl5jl0WzWTEqabouIHO8c5F0r1brrVVxe6ZXa
         XnSw==
X-Forwarded-Encrypted: i=1; AJvYcCWDrZEOlDR00+fNViq6dO4bdV5OLb0g0Js0lRotrIrnsdJeu7ENU2zfewVXd+WTz+mD0CAFfyU96TRlUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLBIvFdByegpU/Oredy/LMx9cqlPLXUMf9KCcNSYEfNmgWUqo9
	eAITQ6E7bSTQWEKFJVSab0FuK0sGNn6g1LcR3DEXzuVlbrU73sRyqmOb5QdK17sEKSM=
X-Gm-Gg: ASbGncu6Lrzt+w66tBKUBWQVC5uP1C5NuGK42lYFlafbKOskeelyMlMUCQCn1UWW2Y7
	SrD5r38b5KsAs33+qWsYM0cbapBm5wtF6MKX2RaorzlEfBhQ6VY+rFWrAJMOaJwnb+Vg0TREhPf
	iJTbShQSopLaNZavhZ+fwFm+KYZF5aPGv0nd+Z6Cv2fjUwiRHkabpIyftDYRwRXlsAK9CUsALgc
	LcuT0ElnH0LPI0zeAuBg1bSX74NRmbs48E1At92kWb6B/7BSHD8GxS5AwIP4QgUerMH7MZ4VZsb
	giJ9S/GkVlNBjgdoZdNkpk6XSenZxld5T9EgV3Z6oA3h8018lPQqLBbWSOwilEMivgs1tPdDXWP
	d+NFGQLBiElE46WrbRC/sbohpXVayhoGLe++7UBR0Jb2GhFQCgxX6nVPhvM8n9HsbnoRkSExvSQ
	0kgVB2aAjbenNbk0nrNYFKZ13zC/IXcTxWQcG8cyskn180E1eZt2GgMcT1
X-Google-Smtp-Source: AGHT+IHQ4fmxCAI4/D2tK1B8sYqUFbudidu6PckWMercsX/iRS90WBjHNHkg95yPWC8b179KW1QKQA==
X-Received: by 2002:a05:620a:318a:b0:89f:27dc:6536 with SMTP id af79cd13be357-8b32a193b85mr303322785a.54.1763644847316;
        Thu, 20 Nov 2025 05:20:47 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295c13ccsm148498285a.26.2025.11.20.05.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:20:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vM4ac-00000000gLM-0tBz;
	Thu, 20 Nov 2025 09:20:46 -0400
Date: Thu, 20 Nov 2025 09:20:46 -0400
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
Message-ID: <20251120132046.GU17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
 <20251119193114.GP17968@ziepe.ca>
 <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>

On Thu, Nov 20, 2025 at 08:08:27AM +0100, Christian König wrote:
> >> The exporter should be able to decide if it actually wants to use
> >> P2P when the transfer has to go through the host bridge (e.g. when
> >> IOMMU/bridge routing bits are enabled).
> > 
> > Sure, but this is a simplified helper for exporters that don't have
> > choices where the memory comes from.
> 
> That is extremely questionable as justification to put that in common DMA-buf code.

FWIW we already have patches for a RDMA exporter lined up to use it as
well. That's two users already...

Jason

