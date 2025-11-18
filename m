Return-Path: <linux-media+bounces-47301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D7C69FA6
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 15:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 5C14B2BEBA
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 14:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F46335E539;
	Tue, 18 Nov 2025 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="B/WGySyv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DAE2FFF9D
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476209; cv=none; b=GV1fVJCmYI2Vp5z6zCt0J8HnwoZBa3wdP4ipEbsjuZxP+HhdC4NDj5ENrV1ybh6sLxBqKESLZ/FymTKdJ4R7qK1XntSoesUi4oVpLWeOtV/+N59Dw0/2B+RfCXvSRCFpoJKE8niXxf/jn4Nl1TJjSP+zdSojH2dqV7gsDS5tB7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476209; c=relaxed/simple;
	bh=Vzm9kAK03gjq3/EFXB7Lf/qLfrswTurpUBT72P7Q9wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHfA0jdgqB4LSW824FPncC3fDJRDYwWfRUKa8htGvIh6blLOpRMtXlr6F//Cehvkxvn4QnMIFcu4o1EfP1hIS2tuRtcj0BtKGTUQWmSWMrhVIViCPV+Bwbauljc6kljRqbHxPst8I9MO/dk5guzZ46zkAXR1FGTi9IlBnfXtrEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=B/WGySyv; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ee3cec9cc2so857011cf.3
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763476205; x=1764081005; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gAj/lhLwXUkQIe838UyunLw5D1V/iLtJCJGMnOEEnt8=;
        b=B/WGySyvLaU8JIymArDTv5WHkDz63O8yjgtHNuDkhXoWlTVVEPwduRMKJRIl0VF0pt
         8TX3wC2CbRl78X8YvI6a76RvnNUvSap8sF82eEalnIXUMlSH6IQZ2lf/EfXMaqK3D0ge
         X5WIamr7y8ESnWfA/FuSzY5Ur6gzM7VRfSLkcWXG5ZJT1jx/WSECD5qqvvLR/jW4FtK5
         lXAqbLAS2gBp1REviCoz1CfM4ZfT1CkwTYXQnaa+Q+f0AhzEUqD9RCYPP7bMY70mYbIq
         d0nSRxqUw+WlBG8E/FBiGUk4abSaitO3o2hlCXsKqA/G/VWD92vKkCqNV5klizdv4fJN
         4ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476205; x=1764081005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAj/lhLwXUkQIe838UyunLw5D1V/iLtJCJGMnOEEnt8=;
        b=BW3ApaZVxTrwIBJX/tdAILQwOIWtg9TSsJmfV6QDUuY4Fe/cWQsvuCaZ+R7leAf+IB
         h9gTZVddEtmajTO4jlmYqY67sPPq2+aP5qjXO/3+om16ZaF6cjs3pvvfuSgt+18jLCZl
         r8W2YWO3ufTBls+hmMtNPZSvbl/2ESiiL9YUS0iHy/JvTfASQD//99P+2pQPDBnqDFLr
         8BULItS3AE08M0FnN+L4BDhPTJxEWJNvpLE30A6fQCMgE7nY0TG9s9jtNNiDasK2YzRd
         Z0YF6jN84Co68XapmQgI0t5nn1OSpsBzpTTzO8/Ysld+tVSL3nMlMPCc2xudPChOfnge
         xPIA==
X-Forwarded-Encrypted: i=1; AJvYcCX1xhOt9M/30uYyq27xe6Ymw32U7RvvT2zaSF4wANfn03byi/jRcL9VsWJZq/gwHecuu7j8JLadvEj61Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WCp4DMS0Z+u2ooRI+lCM8kAbDoGqn7//0ov71Gd9aEhBLlln
	eKlycKzZO7gnUgoPFjyqKukPSBrWQ1Te/P7jEhU4YM/2AXNrHeL2/CNfw0HSBL+KzOs=
X-Gm-Gg: ASbGncvuRVc+cVVBPCp99eS14eCyQtsw1Zo1tjS/GQQcG47zyMSdN7dmCJleXs4ZOjA
	tzhO+EcfU+dyN/In+dMDYhVToncylhpQ4/jnI6SKk0n2rzMsSy++A+dQEDPCYtNKalhd7TSctuv
	4BDVGGdFusJgcF6hGgg3DoZVRIFQzpaVkaz6XatH0QlwMSAWb3TJFmuIUW6OZKJbuc5xhE87JKf
	45EiYAnkv2JXE11i0tO1Wbwhemf6j7c8rv8pLINnxs8HkqoJ1s8AV8+fZqSd0aEKi0iFgFIWm06
	r2c+sHVTITdeT7elfEwUR8R82vpVOLKVNwJRhCz+I+phUd1u8N0+a2i4NtWcB/pCkPjtkcCkxj4
	yINX8vH0DtBuRV9yHzPLwSflXdbpBM09750RPSgu/e0/ZAV7pLRHTzjQBzX4wig1Yt5QBUpkuX9
	Q5jWaSuh7MzKGneLS40o/yVfYf+6wAWCD5Xhaq6E7nvJbTuQUTQ6XLZaFONzpwV93Ys6E=
X-Google-Smtp-Source: AGHT+IGl2QxjkDkgi5jKGR6lwtLy9hLDUjSd3xhjzd2vh/OGWRtCENW0fUVdt2sQ45uUuO7DIyidjQ==
X-Received: by 2002:a05:622a:4a15:b0:4ed:df82:ca30 with SMTP id d75a77b69052e-4edfc875136mr206770331cf.13.1763476204719;
        Tue, 18 Nov 2025 06:30:04 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882862d0944sm115395396d6.9.2025.11.18.06.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:30:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLMiZ-00000000NFZ-1yj6;
	Tue, 18 Nov 2025 10:30:03 -0400
Date: Tue, 18 Nov 2025 10:30:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
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
Subject: Re: [PATCH v8 11/11] vfio/nvgrace: Support get_dmabuf_phys
Message-ID: <20251118143003.GH17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-11-fd9aa5df478f@nvidia.com>
 <SA1PR12MB7199A8A0D17CDC980F819CC6B0D6A@SA1PR12MB7199.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR12MB7199A8A0D17CDC980F819CC6B0D6A@SA1PR12MB7199.namprd12.prod.outlook.com>

On Tue, Nov 18, 2025 at 07:59:20AM +0000, Ankit Agrawal wrote:
> +       if (nvdev->resmem.memlength && region_index == RESMEM_REGION_INDEX) {
> +               /*
> +                * The P2P properties of the non-BAR memory is the same as the
> +                * BAR memory, so just use the provider for index 0. Someday
> +                * when CXL gets P2P support we could create CXLish providers
> +                * for the non-BAR memory.
> +                */
> +               mem_region = &nvdev->resmem;
> +       } else if (region_index == USEMEM_REGION_INDEX) {
> +               /*
> +                * This is actually cachable memory and isn't treated as P2P in
> +                * the chip. For now we have no way to push cachable memory
> +                * through everything and the Grace HW doesn't care what caching
> +                * attribute is programmed into the SMMU. So use BAR 0.
> +                */
> +               mem_region = &nvdev->usemem;
> +       }
> +
> 
> Can we replace this with nvgrace_gpu_memregion()?

Yes, looks like

But we need to preserve the comments above as well somehow.

Jason

