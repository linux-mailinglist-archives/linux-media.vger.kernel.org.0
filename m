Return-Path: <linux-media+bounces-28136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF81A5F1A2
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A81019C1CB9
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D779266B64;
	Thu, 13 Mar 2025 10:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dby8HQMc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F1265CAF
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741863346; cv=none; b=RlVorILAYU1VMpavthldH35msB2OVJJtI7Fz43wIpq5zHEAQrAQPZGGbcuWFemQ7t/YQKUNUptGgENg4a5l62exGjqluqN0pEwLVLbCZDudNEuS7BGykqb9lUIqcbk198A42FOQsxIpLA0Kw6+A0ZPb0FZGNMm54dMQqPQ3hckI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741863346; c=relaxed/simple;
	bh=zbPIOXWNI6dFz2nOmkbaFIdbFhmYytUaZQ/7a1cQOAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EM+1QUCkLqPxuaAU48VuIXh6hmALjQkfpeYP5DUFQR5DnXktws8Yhhy3k/O64rEusFgZE/xuB16wQ2zocb8ifdC2cI8CnSFasfs2ea8BefCvzWYKCHTDlnbMfqelfYIBhZKHCDmB12Gete6ufJjdrhEYfyJoIuxDW1m/lvFIm24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dby8HQMc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741863345; x=1773399345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zbPIOXWNI6dFz2nOmkbaFIdbFhmYytUaZQ/7a1cQOAI=;
  b=dby8HQMcCuDgCzmKx1F59DxwCLS7KuX4SA6JEmVGRh+d7S4+GxZ93Uf9
   gBMXB/FkMHYXw0cxOImyd5AZneVwos71QhD93Y1/4xw9MyaaeuiTZq0Pm
   zEJ4msPV9BpNoJwv8tkbHrmh7sK7uiBmYytYBbaujh2n4nn3NK55n99Iy
   WaPlm3bD0+uuaL9o+mheKj1QYU90Q1b5J1VlJCzeyjYHCy97wJCVcdc+s
   Cgq8IdY8o/R3CP1udCxIlHAYdKlet0CWhTYg91edKoPKmBdPjE8K3yAtG
   r2hkAFdm7i1D16Cv/YTie448aWyfKL2ufFWm65W6gL7vMoA04peTndFg5
   A==;
X-CSE-ConnectionGUID: 6xCnO7ykRD6zut4SgWgPPQ==
X-CSE-MsgGUID: gR6j7bgISrWLDdew8FjKaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53178819"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="53178819"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:55:44 -0700
X-CSE-ConnectionGUID: HbTVLjd5Stuk2dezweDU/g==
X-CSE-MsgGUID: KHt2XQZrSqqo4PRQ+/VA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="125996369"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:55:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 28FDE1202E6;
	Thu, 13 Mar 2025 12:55:41 +0200 (EET)
Date: Thu, 13 Mar 2025 10:55:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 4/5] media: intel/ipu6: Abstart buf ready function
Message-ID: <Z9K5rXs0-YO_gr-d@kekkonen.localdomain>
References: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
 <20250313102427.131832-5-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313102427.131832-5-stanislaw.gruszka@linux.intel.com>

On Thu, Mar 13, 2025 at 11:24:26AM +0100, Stanislaw Gruszka wrote:
> Extract values needed by ipu6_queue_buf_ready() function from fw abi
> structure. This will allow to reuse same buf ready code when fw abi
> change.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 28 ++++++++++++-------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index c68dc577daf0..c7f302df2dcc 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -734,10 +734,11 @@ static void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
>  	}
>  }
>  
> -void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
> -			       struct ipu6_fw_isys_resp_info_abi *info)
> +static void
> +ipu6_stream_buf_ready(struct ipu6_isys_stream *stream, u8 pin_id, u32 addr,
> +		      u64 time, bool error_check)
>  {
> -	struct ipu6_isys_queue *aq = stream->output_pins[info->pin_id].aq;
> +	struct ipu6_isys_queue *aq = stream->output_pins[pin_id].aq;
>  	struct ipu6_isys *isys = stream->isys;
>  	struct device *dev = &isys->adev->auxdev.dev;
>  	struct ipu6_isys_buffer *ib;
> @@ -745,7 +746,6 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
>  	unsigned long flags;
>  	bool first = true;
>  	struct vb2_v4l2_buffer *buf;
> -	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
>  
>  	spin_lock_irqsave(&aq->lock, flags);
>  	if (list_empty(&aq->active)) {
> @@ -757,23 +757,22 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
>  	list_for_each_entry_reverse(ib, &aq->active, head) {
>  		struct ipu6_isys_video_buffer *ivb;
>  		struct vb2_v4l2_buffer *vvb;
> -		dma_addr_t addr;
> +		dma_addr_t dma_addr;
>  
>  		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
>  		vvb = to_vb2_v4l2_buffer(vb);
>  		ivb = vb2_buffer_to_ipu6_isys_video_buffer(vvb);
> -		addr = ivb->dma_addr;
> +		dma_addr = ivb->dma_addr;
>  
> -		if (info->pin.addr != addr) {
> +		if (addr != dma_addr) {
>  			if (first)
>  				dev_err(dev, "Unexpected buffer address %pad\n",
> -					&addr);
> +					&dma_addr);
>  			first = false;
>  			continue;
>  		}
>  
> -		if (info->error_info.error ==
> -		    IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO) {
> +		if (error_check) {
>  			/*
>  			 * Check for error message:
>  			 * 'IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO'
> @@ -800,6 +799,15 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
>  	spin_unlock_irqrestore(&aq->lock, flags);
>  }
>  
> +void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
> +			       struct ipu6_fw_isys_resp_info_abi *info)
> +{
> +	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
> +	bool err = (info->error_info.error == IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO);

Redundant parentheses.

> +
> +	ipu6_stream_buf_ready(stream, info->pin_id, info->pin.addr, time, err);
> +}
> +
>  static const struct vb2_ops ipu6_isys_queue_ops = {
>  	.queue_setup = ipu6_isys_queue_setup,
>  	.buf_init = ipu6_isys_buf_init,

-- 
Sakari Ailus

