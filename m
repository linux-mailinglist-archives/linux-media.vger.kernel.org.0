Return-Path: <linux-media+bounces-38287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906F6B0F9EA
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 20:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53AC9581462
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 18:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8465C230269;
	Wed, 23 Jul 2025 17:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="kSZRUNY5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D74D21FF35
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 17:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753293354; cv=none; b=fCk17I+WttedEyTvsYxPmYwOoRAjAuTlFXGlhzFpu4QwPqBnP60EesAGgFNHsxlZ1uwUyH2s7ea9mXACTz5GWG9sd8ai6CPvKAcbCTiSxKSC0K/uJ7V/wf+xOr+BmrI+Y46gGiD4zGO4KFIHZdA+UOYzy/ALe73zIqFZhM1sjjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753293354; c=relaxed/simple;
	bh=95sNlDz0OTvKZ64eshKCyfVmxom3y7ATpvJkvzyNago=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoHHBKWYT11UPbtT4HyBHqRhT6yUWgwHO3OI3FOEghDmz0vX+Fm0xfN0fKIIMx5mlT8h3HWLbGBv9TSAsIBttFjwH5YsCDoMDLPvRAk81jTD/AENuDtzEJFhWNrt8HLjhLyLUp5Tm3TzUUUkfpHDTSO8d7ld8KmHM6p/p68+4r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=kSZRUNY5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23649faf69fso898785ad.0
        for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753293352; x=1753898152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aXkdHoOA0Wpc+Obuoc6uaDIvTF45ht80cgBG0g7jGUo=;
        b=kSZRUNY5RKfMrVSzUAHlRxriJ28s1oQoeQ97vtyIIFMvVaDkh7F88YMnGG+uSUB3KY
         1IMCjNerP+1r16X6SI9Faw7+OEWzoKkmE9PC4n73q3lVmX+X6T1Ta35VpZsk2is7Qiyz
         88DKT7UsJXTR6wlv8rJSwned0Fdl9/5uHBgw6K9Zh98IVobn1vk92j+bWpT62mIEpzOm
         NZr+HoVXBciGlK6oaJCQ7kqBTo18fxpBMDrHu1K4sv6/MC+MzXQ1V4kOy3X7ZwE7XR+x
         uYRBmRe22HStwkXM4P4WwXH03hsuEu0YMvJRUC2fA7juv2Ge2jtTWYZpsIPr4a45351P
         j8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753293352; x=1753898152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXkdHoOA0Wpc+Obuoc6uaDIvTF45ht80cgBG0g7jGUo=;
        b=XJSpDH7+OHdG4MpN0pFfXKHlxQb2xjm+/xZV3kfac1GAMDq8kV9bIlf7AyA9c6FF6v
         GAyEaIcG2pGh9R5V7mx3T+sxnUOCFZGUduzmeX2pOerHm2W5iug8JzlzhmzzBX/SpiSz
         dS28uCimKLkqCvjBPQHQDTy2sIxyftnDK622u0xVFOl9gX9ftYxyT262oA5y6cDF5qBe
         ZtjY1vaqayAmwcOW7K61p4IJXr1gnE3ycWPXCZUUHRBjm/y5/jyZC8VMWoBJGvyYTjJ2
         1B+dADB13aM/bqO/zcpQHzsj1A16pZ8nTUq+q7NMKJhUiZxAgyTUp9R/Lwqoqm74imeZ
         cBRw==
X-Forwarded-Encrypted: i=1; AJvYcCUQkX+5SVG0whdlUl7t44NGazuvvsF5vVFtkzjDnZF2ADbAMJia9ZQVnSjY1YBO/NQQZPyHnUTMFlJ8bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+MIt7x6kfThKe26hPKZvcgu29ZE6FtESH2EgM5pl2LJ7NPNdw
	ssnDpKm/UT4nSu7gkAX+AG58T2nWV0TetytOJc+M5QJehmSCiewhB7kmlO4wSZ2KYUKe
X-Gm-Gg: ASbGncvqleabx0D4pevlNA7lae4fDv/0IiiiOYXGDT/aM60Ct/nuVfqubhcxejW/7mK
	oenty21LTqisfrc7ywFyRfj2EjMxjyQ21nfamygMWwvbBiKWWbaDEFDi551YCSRIzfcvAlrbX3T
	19SmKUzeSu++790gs4ZXu7c2imDf/GR8huI9q+F3T3QkkVC6sBwg1yoEt5jN0pvrl/JkTlYcFwA
	fgg7QyB6JksIurGUnemgOS7Vb4vNOYibrP2NB10BkNfIRAbc0ymNtkQMe3AAdkO4hw5QKySeJ79
	tWhoK69C2QAIs4ZQ3/twj7fPG5+UvVMArNgAoP83eqFOOKLjZ50nLrDp8YRbi1fX6BpWDZFut0Y
	R0mUxnXwAaoo5zFk1p7/lsRBu
X-Google-Smtp-Source: AGHT+IGUWDKFo2UwdZm14xMa3nHjHVgSdm87pkoDxPi99OGFfzVlUs+4KESXFTftjBJAMw6jB7L6AQ==
X-Received: by 2002:a17:902:e785:b0:235:880:cf8a with SMTP id d9443c01a7336-23f98149b7bmr52304815ad.15.1753293352013;
        Wed, 23 Jul 2025 10:55:52 -0700 (PDT)
Received: from sultan-box ([142.147.89.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6f2184sm100846545ad.224.2025.07.23.10.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 10:55:51 -0700 (PDT)
Date: Wed, 23 Jul 2025 10:55:48 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <aIEiJL83pOYO8lUJ@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618091959.68293-7-Bin.Du@amd.com>

On Wed, Jun 18, 2025 at 05:19:57PM +0800, Bin Du wrote:
> +static void isp4vid_vb2_detach_dmabuf(void *mem_priv)
> +{
> +	struct isp4vid_vb2_buf *buf = mem_priv;
> +
> +	if (!buf) {
> +		pr_err("fail invalid buf handle\n");
> +		return;
> +	}
> +
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);

Variable declaration mixed with code, move the variable declaration to the top.

> +
> +	dev_dbg(buf->dev, "detach dmabuf of isp user bo 0x%llx size %ld",
> +		buf->gpu_addr, buf->size);
> +
> +	if (buf->vaddr)
> +		dma_buf_vunmap_unlocked(buf->dbuf, &map);
> +
> +	// put dmabuf for exported ones
> +	dma_buf_put(buf->dbuf);

The dmabuf shouldn't be put from the detach_dmabuf memop. Remove this.

> +
> +	kfree(buf);
> +}

[snip]

> +static void isp4vid_vb2_dmabuf_ops_release(struct dma_buf *dbuf)
> +{
> +	struct isp4vid_vb2_buf *buf = dbuf->priv;
> +
> +	/* drop reference obtained in vb2_isp4vid_get_dmabuf */

s/vb2_isp4vid_get_dmabuf/isp4vid_vb2_get_dmabuf/

> +	if (buf->is_expbuf)
> +		isp4vid_vb2_put(dbuf->priv);
> +	else
> +		dev_dbg(buf->dev, "ignore buf release for implicit case");
> +}

[snip]

> +static struct dma_buf *isp4vid_vb2_get_dmabuf(struct vb2_buffer *vb,
> +					      void *buf_priv,
> +					      unsigned long flags)
> +{
> +	struct isp4vid_vb2_buf *buf = buf_priv;
> +	struct dma_buf *dbuf;
> +
> +	if (buf->dbuf) {
> +		dev_dbg(buf->dev,
> +			"dbuf already created, reuse implicit dbuf\n");
> +		dbuf = buf->dbuf;

The dmabuf is reused here without taking a reference to it. When the get_dmabuf
memop is called by vb2_core_expbuf(), it assumes that a reference to the dmabuf
is acquired. So you need to add `get_dma_buf(dbuf)` here.

> +	} else {
> +		dbuf = isp4vid_get_dmabuf(vb, buf_priv, flags);
> +		dev_dbg(buf->dev, "created new dbuf\n");
> +	}
> +	buf->is_expbuf = true;
> +	refcount_inc(&buf->refcount);
> +
> +	dev_dbg(buf->dev, "buf exported, refcount %d\n",
> +		buf->refcount.refs.counter);
> +
> +	return dbuf;
> +}

[snip]

> +static void *isp4vid_vb2_get_userptr(struct vb2_buffer *vb, struct device *dev,
> +				     unsigned long vaddr, unsigned long size)
> +{
> +	struct isp4vid_vb2_buf *buf;
> +	struct frame_vector *vec;
> +	int n_pages, offset, i;
> +	int ret = -ENOMEM;
> +
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	buf->dev = dev;
> +	buf->dma_dir = vb->vb2_queue->dma_dir;
> +	offset = vaddr & ~PAGE_MASK;
> +	buf->size = size;
> +	vec = vb2_create_framevec(vaddr, size,
> +				  buf->dma_dir == DMA_FROM_DEVICE ||
> +				  buf->dma_dir == DMA_BIDIRECTIONAL);
> +	if (IS_ERR(vec)) {
> +		kfree(buf);
> +		return vec;
> +	}

You can combine the error handling here with the error path at the bottom of the
function instead of duplicating the `kfree(buf)`.

> +	buf->vec = vec;
> +	n_pages = frame_vector_count(vec);
> +	if (frame_vector_to_pages(vec) < 0) {
> +		unsigned long *nums = frame_vector_pfns(vec);
> +
> +		/*
> +		 * We cannot get page pointers for these pfns. Check memory is
> +		 * physically contiguous and use direct mapping.
> +		 */
> +		for (i = 1; i < n_pages; i++)
> +			if (nums[i - 1] + 1 != nums[i])
> +				goto err_destroy_free;
> +		buf->vaddr = (__force void *)
> +			     ioremap(__pfn_to_phys(nums[0]), size + offset);
> +	} else {
> +		buf->vaddr = vm_map_ram(frame_vector_pages(vec), n_pages, -1);
> +	}
> +
> +	if (!buf->vaddr)
> +		goto err_destroy_free;
> +
> +	buf->vaddr = ((char *)buf->vaddr) + offset;
> +	return buf;
> +
> +err_destroy_free:
> +	vb2_destroy_framevec(vec);
> +	kfree(buf);
> +	return ERR_PTR(ret);
> +}
> +
> +static void isp4vid_vb2_put(void *buf_priv)
> +{
> +	struct isp4vid_vb2_buf *buf = (struct isp4vid_vb2_buf *)buf_priv;
> +	struct amdgpu_bo *bo = (struct amdgpu_bo *)buf->bo;
> +
> +	dev_dbg(buf->dev,
> +		"release isp user bo 0x%llx size %ld refcount %d is_expbuf %d",
> +		buf->gpu_addr, buf->size,
> +		buf->refcount.refs.counter, buf->is_expbuf);
> +
> +	if (refcount_dec_and_test(&buf->refcount)) {
> +		amdgpu_bo_free_isp_user(bo);
> +
> +		// put implicit dmabuf here, detach_dmabuf will not be called

Comment style (use /**/ instead of //).

> +		if (!buf->is_expbuf)
> +			dma_buf_put(buf->dbuf);
> +
> +		vfree(buf->vaddr);
> +		kfree(buf);
> +		buf = NULL;

`buf = NULL;` here is superfluous; you can remove it.

> +	} else {
> +		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0",
> +			 refcount_read(&buf->refcount));

This refcount_read() is a possible use-after-free because `buf` is accessed
after isp4vid_vb2_put() puts its reference to `buf`. So something else could put
the last reference to `buf` and free it after this refcount dec but before the
refcount_read(). Maybe just remove this dev_warn() entirely?

> +	}
> +}
> +
> +static void *isp4vid_vb2_alloc(struct vb2_buffer *vb, struct device *dev,
> +			       unsigned long size)
> +{
> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct isp4vid_vb2_buf *buf = NULL;
> +	struct amdgpu_bo *bo;
> +	u64 gpu_addr;
> +	u32 ret;
> +
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL | vb->vb2_queue->gfp_flags);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	buf->dev = dev;
> +	buf->size = size;
> +	buf->vaddr = vmalloc_user(buf->size);
> +	if (!buf->vaddr) {
> +		kfree(buf);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	buf->dma_dir = vb->vb2_queue->dma_dir;
> +	buf->handler.refcount = &buf->refcount;
> +	buf->handler.put = isp4vid_vb2_put;
> +	buf->handler.arg = buf;

What is buf->handler for? I don't see it used anywhere in the entire patchset; I
can delete `handler` from `struct isp4vid_vb2_buf` along with these lines and it
compiles. 

> +
> +	// get implicit dmabuf

Comment style.

> +	buf->dbuf = isp4vid_get_dmabuf(vb, buf, 0);
> +	if (!buf->dbuf) {
> +		dev_err(dev, "fail to get dmabuf\n");
> +		return ERR_PTR(-EINVAL);
> +	}

Doesn't free `buf` or `buf->vaddr` on error here. Also, comment style.

> +
> +	// create isp user BO and obtain gpu_addr

Comment style.

> +	ret = amdgpu_bo_create_isp_user(isp_vdev->amdgpu_dev, buf->dbuf,
> +					AMDGPU_GEM_DOMAIN_GTT, &bo, &gpu_addr);
> +	if (ret) {
> +		dev_err(dev, "fail to create BO\n");
> +		return ERR_PTR(-EINVAL);
> +	}

Doesn't free `buf` or `buf->vaddr` or put `buf->dbuf` on error here.

> +
> +	buf->bo = (void *)bo;
> +	buf->gpu_addr = gpu_addr;
> +
> +	refcount_set(&buf->refcount, 1);

This discards the refcount inc triggered from amdgpu_bo_create_isp_user() when
it calls get_dma_buf(), leading to a use-after-free. Move this refcount_set()
up, preferably right after vmalloc_user() or right after `buf` is allocated so
there's no risk of this issue occurring again in the future.

> +
> +	dev_dbg(dev, "allocated isp user bo 0x%llx size %ld refcount %d",
> +		buf->gpu_addr, buf->size, buf->refcount.refs.counter);
> +
> +	return buf;
> +}

[snip]

Sultan

