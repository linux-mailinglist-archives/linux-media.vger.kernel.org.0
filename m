Return-Path: <linux-media+bounces-38525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE68B1354C
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E25F1746B1
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 07:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CA922331B;
	Mon, 28 Jul 2025 07:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="AWDtd8nq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2C5220F5B
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753686284; cv=none; b=FjG0L2wHAjmhe+olLiT6yaRw58L55DXSsaTJyEVGBN1iVCNrpYf+1d4O4SWo5WQZoLwuM61GlsLxomU7p67XVYnWBpG3t3XcVzyRbFTmNAB6lO9kaUBIsTXM/lT2A5f2WKN5VhxCvzIrPXyfe/eCnZmnfmXAfA2PSnzTTyCRS1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753686284; c=relaxed/simple;
	bh=gx2qwJ/1EBl27vpk6NyytTFfopAhDGWK+cGrJfC5nV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruLj8RrGHw3i7iXy8bjMEFlfFHB7NuJ8aiWqyG2Wqf568Rb/wGrDeJH6TnfqtrpmA7eM+O+dgBER8sD8PIBn4/xyTOPjhk18FLQejjK1AW7dvsq0LKvaZ6lQWSpmC46Li4iHr1rdrD48ffDOSS4y61lP9oOTQ3nImOtN/csY9N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=AWDtd8nq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2403df11a2aso2570165ad.0
        for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 00:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753686281; x=1754291081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EZJyuhDRhONqMzqU5e7bbsSLCsS4zD8CKsQZd+K42t0=;
        b=AWDtd8nqQ2J/zHIhzbOCknupGQznOSM2NXx9IBW74i1+UAbJSCDGw25vMQ5gik0Tc9
         S+y4ExPRu6FA2RMURkMZ/kh4ze0eCvh+Y9Eq1uUnZB2C5yEKQn8q+L464Kn1xOmGXY2F
         wUarqzCc8oZJfqvXkliAv1mD/3xrTcf83HxbdxNrpMAnWY3kUqDVusjH110BPuA2a5Ur
         n8E8lKdbxtS2wZ1aUabzBECDb6N5A5IxFboIgQOVPNs6UNCnfgTY3hnz78M7YKexRnS6
         emguXv67hf6ZPY3AEd2S4waEKGhbBgpNyeFA8DMdutQT2Od2bx2Q7qlJBN/GwfBTqGbG
         2XLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753686281; x=1754291081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZJyuhDRhONqMzqU5e7bbsSLCsS4zD8CKsQZd+K42t0=;
        b=Wh/H51lamnUeczZg81/VmvjWCh2u1q82/l3m7kSZI1PHVzJ8sJHD7OcVfnymBDET91
         utRP2ANbdw5bPRH0/e7EFEFhS4ozFrvg14x+i1CYONtp6zQ9ER1HArC7UBuIJ9EB7Z8Z
         mcuxr77QvrAXiP4RYKOst4EWHVGAO7FUHY7WYIjfF+OcjsJbbhtmTCTx48zW98tNt9CD
         mlkukXpH/hzka8KDR54kNhhB5dJbKZ5GXHCTPHdEqM85YQTNS9LX4oR4/fSD+BsIdjCt
         Fep/ScS6YcPktxj9XC+bfyfBM5d8w2FNO/ifChQJBFDRb6zavh8YxtFJxFLIClEiJzaf
         sRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAQ6ZSHtNh9z1KtQrc2gcCdbZ51ZQaBKvmkOVcnRacBjYYoqQXy84A8MrFM6EOHKxsJK++Y7M7+nt+EA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Q0iDs1KdqtA9u19ktFZBPda99hKZo4Gb9vuzhkWQXLmbtoJy
	8N48P3XzCluKqY7VPai3RFYGY4Fka0BrHeTeSgREelW6utOgi4KUJPgrczXxLilpTVAM
X-Gm-Gg: ASbGncukZcqed8++pvjOD0vdZsiOBBbjzuFNtecQiJdnG9m2XZjIG8ye9xshXG+QPyF
	OWiG6yYG3HCCRhWycYvNmyjAFWyt7ns0iu0aDlULSI9RqrZVQVUkVC0rFoe/03i6lIWtwxDrC+0
	ieiDRuJ0d96teBlOjZ9giOqhKCrVx/g5N/kAz+eOfWYhFrWKFSYEg5oBqdMghkyQQa3bsqxx1od
	+Of4gJo/31Fr09awz0aQSU+3wQ+DmQampHVDzKc5LzjkZiFqWnkL4B4CozYoRWopk0W55O1fP8g
	MbFF+7luUQKWZ8zKHvH3+zraTcKCC5Psyjc0bPLNlP7Bst0i/hKQvdnRN49QdY6iO0P5IEwnfCY
	JNArIsnaSV7bmcxcAvjFtvcw=
X-Google-Smtp-Source: AGHT+IHQTIVfBjDvcZpuhp3bBfDaRic6qCYUSTdt0EhO0u7dMOdVBEKjG/OcI2Il9iQeyZ9vp2PFig==
X-Received: by 2002:a17:903:4b4e:b0:240:3ca6:184c with SMTP id d9443c01a7336-2403ca63fcamr21931915ad.48.1753686281382;
        Mon, 28 Jul 2025 00:04:41 -0700 (PDT)
Received: from sultan-box ([79.127.217.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6635efb8sm8734762a91.19.2025.07.28.00.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 00:04:40 -0700 (PDT)
Date: Mon, 28 Jul 2025 00:04:37 -0700
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
Message-ID: <aIchBRdmy48BHl2k@sultan-box>
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

I found more refcounting issues in addition to the ones from my other emails
while trying to make my webcam work:

On Wed, Jun 18, 2025 at 05:19:57PM +0800, Bin Du wrote:
> +static int isp4vid_vb2_mmap(void *buf_priv, struct vm_area_struct *vma)
> +{
> +	struct isp4vid_vb2_buf *buf = buf_priv;
> +	int ret;
> +
> +	if (!buf) {
> +		pr_err("fail no memory to map\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = remap_vmalloc_range(vma, buf->vaddr, 0);
> +	if (ret) {
> +		dev_err(buf->dev, "fail remap vmalloc mem, %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Make sure that vm_areas for 2 buffers won't be merged together
> +	 */
> +	vm_flags_set(vma, VM_DONTEXPAND);
> +
> +	dev_dbg(buf->dev, "mmap isp user bo 0x%llx size %ld refcount %d\n",
> +		buf->gpu_addr, buf->size, buf->refcount.refs.counter);

Use refcount_read() instead of reading the refcount's atomic_t counter directly.
This is done in 3 other places; change those to refcount_read() as well.

This didn't cause any functional problems, but it should still be fixed.

> +
> +	return 0;
> +}

[snip]

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
> +
> +	dev_dbg(buf->dev, "detach dmabuf of isp user bo 0x%llx size %ld",
> +		buf->gpu_addr, buf->size);
> +
> +	if (buf->vaddr)
> +		dma_buf_vunmap_unlocked(buf->dbuf, &map);
> +
> +	// put dmabuf for exported ones
> +	dma_buf_put(buf->dbuf);
> +
> +	kfree(buf);
> +}

As mentioned in the other email, the dma_buf_put() here needs to be removed. But
that's not all: the dma_buf_vunmap_unlocked() needs to be removed too because
vb2 will always unmap the buffer before detaching it. As a result, having the
dma_buf_vunmap_unlocked() call here results in a use-after-free when vb2 calls
the unmap_dmabuf memop.

Change this function to the following:

	static void isp4vid_vb2_detach_dmabuf(void *mem_priv)
	{
		struct isp4vid_vb2_buf *buf = mem_priv;

		kfree(buf);
	}

> +static void isp4vid_qops_buffer_cleanup(struct vb2_buffer *vb)
> +{
> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct isp4vid_vb2_buf *buf = vb->planes[0].mem_priv;
> +
> +	dev_dbg(isp_vdev->dev, "%s|index=%u vb->memory %u",
> +		isp_vdev->vdev.name, vb->index, vb->memory);
> +
> +	if (!buf) {
> +		dev_err(isp_vdev->dev, "Invalid buf handle");
> +		return;
> +	}
> +
> +	// release implicit dmabuf reference here for vb2 buffer
> +	// of type MMAP and is exported
> +	if (vb->memory == VB2_MEMORY_MMAP && buf->is_expbuf) {
> +		dma_buf_put(buf->dbuf);
> +		dev_dbg(isp_vdev->dev,
> +			"put dmabuf for vb->memory %d expbuf %d",
> +			vb->memory,
> +			buf->is_expbuf);
> +	}
> +}
> +

Remove the isp4vid_qops_buffer_cleanup() function. It causes a use-after-free by
doing an extra dma_buf_put(). This function isn't needed now that the refcount
issues are solved.

[snip]

> +static const struct vb2_ops isp4vid_qops = {
> +	.queue_setup = isp4vid_qops_queue_setup,
> +	.buf_cleanup = isp4vid_qops_buffer_cleanup,

Remove the .buf_cleanup hook too.

> +	.buf_queue = isp4vid_qops_buffer_queue,
> +	.start_streaming = isp4vid_qops_start_streaming,
> +	.stop_streaming = isp4vid_qops_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +};

[snip]

Along with the changes from my other emails, I believe this finally fixes all of
the refcounting issues. No more UaF or leaks here. :-)

Sultan

