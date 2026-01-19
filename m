Return-Path: <linux-media+bounces-51083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A0D3B7C1
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 20:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19A0F301F7D0
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 19:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BCA27A107;
	Mon, 19 Jan 2026 19:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Y8xzswM1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA19F2DEA6F
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 19:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852489; cv=none; b=uJLEx/RN925dhURnxm1VO/0QwywR9iO2G8oHx7BCZEG0TV2DkwhMAkw/ovZaGZEsZIKDHeALbR9+K42zpveDAhIZzvzSv3eMPjF2rCnIhZBqShjl7gMbglhRx0ry1wteCXK0LLAEJvAiBp15OEiGswJffkgs3Wg/PyhR33IdmRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852489; c=relaxed/simple;
	bh=EgdbrvHnoBh/zDpp9ewcIGQxrvWxBBXiNgVYU0RjdCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv+xdsIxg9TrZCTR6SXjKmjFaCva0l3MvNXPoRtjHBVYzfwi6yuXOJF8WyIPylccsXV154IXvqUGVdMKkgpN7KQtDkDqczjzsTbXYFrK7FwP6z7eYPN5QWXs8wFnbBJM2vfiSJcY6b6RVydO+tDwebRHSMqAB7EuGTwRksU/PcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Y8xzswM1; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c537b9fcbfso472547685a.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 11:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768852487; x=1769457287; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zwZ9o3ha19w1BUlcGeJzNZvsy/mlKSz+FRMjn04+Z/c=;
        b=Y8xzswM1blPsOkAhqH9fGcG5IadYE5sQt0vvRXgZTPwAqYIsRh7nfXeu6jNChZ9hKz
         pxh03Sf81TJGk6WYR/8QTTKv0398gWd3wYINx05q1DLlmDzVVk/NEVNNQwO+bPsjiEM+
         DwUUbkbk10s6Fp3bgZ57bQyIFL/QYcj3I6o6+LDJWtvZc2pKLOJKUzT1qPnWdD8nfsB8
         0yCZUa/cLOmqCmhtbTBryPRqR8QJa6sP4qKlGepQD5Upo2SfzMS2mOKHpFphA7+f7C5J
         BP85MmGwAh5gJ4jJ++0ltmFsTXWDGrIdPIsFj8/s8hh9WLBQHyZMI9O4mkorRJ3DA1nv
         FZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852487; x=1769457287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwZ9o3ha19w1BUlcGeJzNZvsy/mlKSz+FRMjn04+Z/c=;
        b=p6VbpWywxWG/HlGZiKg+sn61HsbEwqlCLLOOV7BpGZNW1D7E+79zNrw1Gg4J3WrfAD
         ACCK+kVBMLPGjXa4vGEyrwBliOBzsNLm/vNJi4vlI7wG0A2jLvk/4B/Qn/Ytiw+z7VEN
         XG+Ww5R3Aij+9D0+27PnfZf9IjNYnwDwahzdrFfq7QLuTF7lQt109rfO1H6We33Bk3j5
         SuCVXY/93GL9YxnnDjdXL79Ot4X1R34vXtLBb1Wu2DN/kp7e1opolUMsd62zh2jBIqCC
         /E5dh/W5BaHavo3otWp6eRWbm0JBLr+af9YFIiMw5Q4g3uGot17BEotbE/WzWbVYQgzp
         ffqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1LdALUdO7OAFhcS/c6mYhr14lxtaONDMdEpL9XceTKvXo7F2oJxHY84aDKWaKe3lw9utPr0qttN+yyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6O8BSpZcf+sMlt0b+9pfyLRu6BbP0e60yuGrSBU3xmNy6Pk/
	TQDerjYrMpTP4TWPSbKuPhmiXHKEvH/TbIIHwvdG78VGHgKQzkTB7AwVkm3/Wrv7Q04=
X-Gm-Gg: AY/fxX4+JmFcz79pMsge8elDKTdV3aTv82r9ZrhYcV4XCHXFzcep/+kfzADuv97Xaco
	YnwXlR05PP/ZL+64jOrvLw1U8FyzNvPvjxHBqDYSGH3/trPdDJC+yahVdqxyBnXBPY43ExcdcIS
	FRTViPZqoMUS+yiwILMo1gw6x34tztySFVkNONjit3kAHdStzOSlRcyITdZ30jBLExK0joj68nK
	VXJdwgwdxzyLkt21Si0lE7/vtymJqcZYiIVzg43vq+XBZQiGRcu5oVZ4V9+nGrvP6IiCiEf9Lwk
	WW2N3UMO+DWVrFu2GFpx+nauFIVWlQStcCFFD8A0F+1PwZngnustaZbGEoQubsIPb4C8yWMOub6
	tg7YMY/ArpwQp8SAS65e+5uYeiYDI9S84Ig6oG1xi9xVVslm+WP8sosDAXwosY1IOg1Ygm0Ahce
	rkLJ0JGu8ebp7syy9A2hZPZUmwTRPQ6J6gzIO4E9ods8wC+tIfPW5en1xTjLPIzDXKOFM=
X-Received: by 2002:a05:620a:4606:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8c589b9706emr2117693085a.10.1768852486747;
        Mon, 19 Jan 2026 11:54:46 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6ad75asm86947906d6.31.2026.01.19.11.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:54:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vhvKm-00000005JRT-0mKA;
	Mon, 19 Jan 2026 15:54:44 -0400
Date: Mon, 19 Jan 2026 15:54:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iommufd: Require DMABUF revoke semantics
Message-ID: <20260119195444.GL961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-3-a03bb27c0875@nvidia.com>
 <20260119165951.GI961572@ziepe.ca>
 <20260119182300.GO13201@unreal>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119182300.GO13201@unreal>

On Mon, Jan 19, 2026 at 08:23:00PM +0200, Leon Romanovsky wrote:
> On Mon, Jan 19, 2026 at 12:59:51PM -0400, Jason Gunthorpe wrote:
> > On Sun, Jan 18, 2026 at 02:08:47PM +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > IOMMUFD does not support page fault handling, and after a call to
> > > .invalidate_mappings() all mappings become invalid. Ensure that
> > > the IOMMUFD DMABUF importer is bound to a revoke‑aware DMABUF exporter
> > > (for example, VFIO).
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >  drivers/iommu/iommufd/pages.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> > > index 76f900fa1687..a5eb2bc4ef48 100644
> > > --- a/drivers/iommu/iommufd/pages.c
> > > +++ b/drivers/iommu/iommufd/pages.c
> > > @@ -1501,16 +1501,22 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
> > >  		mutex_unlock(&pages->mutex);
> > >  	}
> > >  
> > > -	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > > +	rc = dma_buf_pin(attach);
> > >  	if (rc)
> > >  		goto err_detach;
> > >  
> > > +	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > > +	if (rc)
> > > +		goto err_unpin;
> > > +
> > >  	dma_resv_unlock(dmabuf->resv);
> > >  
> > >  	/* On success iopt_release_pages() will detach and put the dmabuf. */
> > >  	pages->dmabuf.attach = attach;
> > >  	return 0;
> > 
> > Don't we need an explicit unpin after unmapping?
> 
> Yes, but this patch is going to be dropped in v3 because of this
> suggestion.
> https://lore.kernel.org/all/a397ff1e-615f-4873-98a9-940f9c16f85c@amd.com

That's not right, that suggestion is about changing VFIO. iommufd must
still act as a pinning importer!

Jason

