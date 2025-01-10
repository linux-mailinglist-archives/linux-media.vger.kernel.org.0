Return-Path: <linux-media+bounces-24631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A18FA09BCD
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 20:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32B1E1886E10
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 19:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539D2214A78;
	Fri, 10 Jan 2025 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ULCkposT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBC6212FB9
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 19:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736537068; cv=none; b=SfrS5TYIpZQNVo+IRWWVh/o70OXBRoOopGgwyHTcSvkgFkwumoM05c4wp4dE7+mMiUzaTi9B6nBzb7BqLsQwlhpmrVToenBNRqPS0v4UyPypwjKP9T42ihRPeEQHJPt/uqb82Vlp6oAC38f+569x+M/AneHPtR37d95cB8HnBao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736537068; c=relaxed/simple;
	bh=GAXiVwRl5hX0nr5x2c6GDMtUgYBmYNxhBnIp/PYb1FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUZzgP84Vjbf3dS9m81N/vvvtjKBpT26oCa7imBFgZrhuc1Rz/idX69R+oGX0/RJxebT4Wy5vYZwYRW+I/AvvcVDLYQuOBnFs/She6Ljwq09U55/UpsiMAQUzLHiH6pfIsUuDBAJLPeBOTX3jooEJ2IFOAPE6ChFEt8VU4ZG29I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ULCkposT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4363ae65100so26133935e9.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736537065; x=1737141865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ACopzyajfJRcuBL6kkHr9KV+I23S42u7LRA+BIOf1M=;
        b=ULCkposT/Gm25LgersU71BEgkzgTyUegXvreUI6kRtUy0RkZ/aQGSFkVbIfktpsygl
         1OlM6J+tyMQeqX0c86M6SVJT+O1+L6VI+wyjRPs8v6+Ip7cM+ZrZ177hSGcNNc/4R/t9
         Xj+2sID7HgJMgmlxUNDIBxWUoQxIFlxUp1Cws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736537065; x=1737141865;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ACopzyajfJRcuBL6kkHr9KV+I23S42u7LRA+BIOf1M=;
        b=Mn3ALQMFaShMDZjkSrZjm0AV/RTUO31wqpnZtcGsAiTDsYYGEYFOKdP/IP2rsReIRI
         rBN6oIJzPheAsv44L1Fh12vUZ6JyVelmN1fYIwQuEvoL4vcTxQpB45PF5TFAoa+VsMES
         PpoXAzXEIoR7Fti9GOBhsS7lSLxIE2k/HByddt7B+niOjRCGyEG7Wf1Klge3hr7E+f+U
         nK1byMqdgwRmzakz6Xvva8NX6WtJ5wrB7jLpJtdHGvDz0Ad3dRYvfTWpFBIFm8PXcz9t
         YW1QYybHJ3lHcUCFLgd0YQCFvh5pWQGUYJFM1GnsKomhA92BsZ/wytSRFzyLHaOShi3s
         o5ng==
X-Forwarded-Encrypted: i=1; AJvYcCWdf2QdILfcGYI/441hdjzftqSw4oZMNf0Sq9ltT37h3QMuXdhan5pI+l+sLg6T4xxKz74hCyZe0Wa1fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWXus+36PJmSypWeX2J+WcQ1GtUllEVwmztGdgg/iIjHu3O99p
	69AtYT02QhapU326TEZQySFyjAObOqEN8g9ssUItLLGZXGutJHyd8B2beGQgTpI=
X-Gm-Gg: ASbGncul8kOliS+2QG1CLkSTR6tkxgyzGk98+dAQ/9aenf+y6OhCrlFbKeX+1qmV1pM
	8NmSjfDl8bLtpjk4oUlYsqUvMzHh6E1poZvajeezk9VBKyrZ0jB0sjj7yOwmC3OZ1ddGpreLj1o
	QiSYKMs4x3sVEFpAD61LXaJaIyhR5F9eS+Y7tGeY7sW1XQycQv5Hy0pBcC3GIocIjLhOoboQA3H
	IXVlBsZy+QzX3xuGO6TFhTrSOhBkFDKzgoArhYTjZ8m9iPu5lOJaSbKYC79FQVLvY8/
X-Google-Smtp-Source: AGHT+IGQsKQI4LrL1qdpFjuY9ZWEttHxIv9pv69yZaLOwftdrmmCEXmYM32sp7WuieWtkMyPIHFCuw==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436e25548e3mr2817985e9.0.1736537065429;
        Fri, 10 Jan 2025 11:24:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d11csm5313117f8f.16.2025.01.10.11.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 11:24:24 -0800 (PST)
Date: Fri, 10 Jan 2025 20:24:22 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
	kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
	alex.williamson@redhat.com, vivek.kasireddy@intel.com,
	dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z4Fz5oiia1JGWIgG@phenom.ffwll.local>
Mail-Followup-To: Xu Yilun <yilun.xu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
	kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
	alex.williamson@redhat.com, vivek.kasireddy@intel.com,
	dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z368Mmxjqa4U0jHK@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z368Mmxjqa4U0jHK@yilunxu-OptiPlex-7050>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Thu, Jan 09, 2025 at 01:56:02AM +0800, Xu Yilun wrote:
> > > > 5) iommufd and kvm are both using CPU addresses without DMA. No
> > > > exporter mapping is possible
> > > 
> > > We have customers using both KVM and XEN with DMA-buf, so I can clearly
> > > confirm that this isn't true.
> > 
> > Today they are mmaping the dma-buf into a VMA and then using KVM's
> > follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
> > dma-buf must have a CPU PFN.
> 
> Yes, the final target for KVM is still the CPU PFN, just with the help
> of CPU mapping table.
> 
> I also found the xen gntdev-dmabuf is calculating pfn from mapped
> sgt.

See the comment, it's ok because it's a fake device with fake iommu and
the xen code has special knowledge to peek behind the curtain.
-Sima
 
> From Christion's point, I assume only sgl->dma_address should be
> used by importers but in fact not. More importers are 'abusing' sg dma
> helpers.
> 
> That said there are existing needs for importers to know more about the
> real buffer resource, for mapping, or even more than mapping,
> e.g. dmabuf_imp_grant_foreign_access()
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

