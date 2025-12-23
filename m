Return-Path: <linux-media+bounces-49411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C7CCD96C5
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D589301A1CF
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 13:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC30B339875;
	Tue, 23 Dec 2025 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0yjRfuQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577F820B7ED
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496130; cv=none; b=NyE8TQas+bAd4dNoNKbay8nEZga0/srcLl9tODqBE3/SnCkKjaqrNYqCzU4r4zu3aoFHWr9Kgg5sEvjE6+YiL/raqbu/q0WuHJxRXmNvVfHP5L9Oapf6t6JNDUY6HdASDSDHP4mCxVX0/rcEYpzYPzAO7eQZG1hqkWWitWCKrp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496130; c=relaxed/simple;
	bh=9qRw+HMuZEHVRFuMq/n6aRWFax3B9EnFb3/Kbjr1rEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1aCox1aqoDfZjM6dx8E/jww53COU7UqBe9YIV7f7WTxysN5BhBkKpkMPZc8CJ/Z19p8eGrbsEbf5lqcga2nHUOZiAVzsM+aO+Q6sJr7u//hX9cFIoXdPkrDONnyUhyKB5v3ugG7bnrMxY+z5YVvuTRH8Vwf0diBAbp35/EL5AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0yjRfuQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766496129; x=1798032129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9qRw+HMuZEHVRFuMq/n6aRWFax3B9EnFb3/Kbjr1rEY=;
  b=L0yjRfuQ5r3qA5Su/16vaLraryfG/IxLBAxV0QcraiNRnfR8fmu2IxuE
   26Wg1X+k0jkEcmlrFjM+aAiDFJqTSMDjjoZvtJrw+5ykJkk1PY8fy+ndC
   OZqWyY+9FWmzb5JRajwsMWGg4Wygq+dbtURfkfRclx+PdX0Hk1+hdyz2y
   zcRsYqKq1WK4JXVgzhrhme/edj2/ocAM6qTiMF/0oO0R4h1ZIOm9zHLtc
   l+n2L/Xmg23Gj023ASuobd3KiT/OCGXKHCx4PSKKvNh4b4dNpQKMrvIHG
   McPkYpzT93MiIuGPyHg/VdgIgWvRYkddaDik77Hm4+XSAORubX+X6yFY5
   g==;
X-CSE-ConnectionGUID: mssQCa5HQrKqD4wavaIVeg==
X-CSE-MsgGUID: DSrQc1KgQbaK8JagkG24zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="70920360"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="70920360"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:22:08 -0800
X-CSE-ConnectionGUID: muMvvcSOQbuVvFYLT3neVg==
X-CSE-MsgGUID: Js6ds1J2T6esMbDuDdDTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204838329"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.87])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:22:05 -0800
Date: Tue, 23 Dec 2025 14:21:55 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com, 
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH 05/13] media: ipu6: Remove redundant streaming start via
 buffer queueing
Message-ID: <2xjdratyqnvko4lhrggv7ywia3hrpq36755mxyamriw55s7leq@zrmpywjm5owg>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
 <20251219095829.2830843-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219095829.2830843-6-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch!

On Fri, Dec 19, 2025 at 11:58:21AM +0200, Sakari Ailus wrote:
> The videobuf2 framework will ensure buffers are queued before streaming is
> started. Remove the support for starting streaming based on queued
> buffers.

I find the last sentence a bit confusing when looking at the if
condition removed.

Maybe something like: Remove the support for stream starting in the
buf_queue() callback ?

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index 8f05987cdb4e..fdf41b3cf60e 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -408,13 +408,6 @@ static void buf_queue(struct vb2_buffer *vb)
>  	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
>  	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
>  
> -	if (!stream->streaming) {
> -		ret = ipu6_isys_stream_start(av, &bl, true);
> -		if (ret)
> -			dev_err(dev, "stream start failed.\n");
> -		goto out;
> -	}
> -
>  	/*
>  	 * We must queue the buffers in the buffer list to the
>  	 * appropriate video buffer queues BEFORE passing them to the
> -- 
> 2.47.3
> 

--
Kind Regards
Mehdi Djait

