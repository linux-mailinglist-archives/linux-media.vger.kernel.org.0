Return-Path: <linux-media+bounces-50215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 695EBD025AA
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 12:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74C763097959
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 11:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D672877FC;
	Thu,  8 Jan 2026 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESNfDKUc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA14362156
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860995; cv=none; b=ZI90HtNnafmVywhQZ9dSzDJ/CkOla3SFlTt5c1Ndr444Ar54ZCI1xlJHifxP08lfKXFWmwegF+q5Q9K+xYjLISkhw6Zl+MRUqcMNKs5e9mAnXYfloa80F7+BoxfjWHNBFL6xrlOLMs4LUq8kbA+sJqRxWBJH9x3NekrT/Mvn8Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860995; c=relaxed/simple;
	bh=5sk6/5Nd4/qijmlD8hMIsjpd8UG8ZGftgSPflAQcyf0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WtEBEL8CLTL8yFjCX77uAfpc8MaMcp77fq89BTAqX9XjrK457w/hI/3ygn4/NOT11NhIvDFDpgEWmmmAccbPz4AUMU4jSvMgwNE8AakfVCiZ4NketpTy2yj+iiH2gGIEM6BwtaKLpCPuNBAyv3KELgdU+PcDxLJng+67GTHBVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESNfDKUc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860987; x=1799396987;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=5sk6/5Nd4/qijmlD8hMIsjpd8UG8ZGftgSPflAQcyf0=;
  b=ESNfDKUcSLT9GAN9uL/pC/Mx7HBHuYHEO48qV1q2s62JfuNJNCkgt6Ms
   ZnzlxVgtDsYr0KuTzkpQnB+qcEqadrIbe8vFTS3lpG5zmd79N53eftcn4
   LB27CQMkXK3ur4H1N5+2vxO5is3g3Su0zUU8Sy6/mWCmHjb7LbeVgJjiy
   /pssyc4hYEqI2HB9/+P/q7k+2X3vMSkJo7EAbaYo/QD17BhtTnnBkyU9E
   M8XME7tYadynY+HnzsKKk1hRiOHY9tPCmrmFXqAWKvz+voIh23a4lN2XU
   doscJPybwy97uG4Qf0hg8hVqef791oY+DEKZ6NMaBJs7cGwchC6vHYhin
   w==;
X-CSE-ConnectionGUID: 6JgMosh3Q561DDrtdl99ZA==
X-CSE-MsgGUID: /ReFtaOUTreGt42z+CiDGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86822752"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="86822752"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:29:35 -0800
X-CSE-ConnectionGUID: iWvrST+mQraPhiqTc8n+pQ==
X-CSE-MsgGUID: wQiYtyRYQGyxYxQ3E3nGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="202761210"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:29:33 -0800
Subject: Re: [PATCH v4 09/14] media: ipu6: Drop error argument from
 ipu6_isys_stream_start()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-10-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2150c9e7-b322-45f7-82b5-8553fe9c4ac8@linux.intel.com>
Date: Thu, 8 Jan 2026 16:19:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-10-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:17 PM, Sakari Ailus wrote:
> error argument for ipu6_isys_stream_start() is always false, remove the
> argument. The IPU6_ISYS_BUFFER_LIST_FL_SET_STATE buffer flag also becomes
> redundant as a result, remove it as well.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 12 +++---------
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.h |  1 -
>  2 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index dcad6aafee29..0e9f0025aeb3 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -132,9 +132,6 @@ void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
>  			list_add_tail(&ib->head, &aq->incoming);
>  		spin_unlock_irqrestore(&aq->lock, flags);
>  
> -		if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_SET_STATE)
> -			vb2_buffer_done(vb, state);
> -
>  		if (first) {
>  			dev_dbg(dev,
>  				"queue buf list %p flags %lx, s %d, %d bufs\n",
> @@ -290,7 +287,7 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
>  
>  /* Start streaming for real. The buffer list must be available. */
>  static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
> -				  struct ipu6_isys_buffer_list *bl, bool error)
> +				  struct ipu6_isys_buffer_list *bl)
>  {
>  	struct ipu6_isys_stream *stream = av->stream;
>  	struct device *dev = &stream->isys->adev->auxdev.dev;
> @@ -336,10 +333,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
>  out_requeue:
>  	if (bl && bl->nbufs)
>  		ipu6_isys_buffer_list_queue(bl,
> -					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
> -					    (error ?
> -					    IPU6_ISYS_BUFFER_LIST_FL_SET_STATE :
> -					     0), error ? VB2_BUF_STATE_ERROR :
> +					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING,
>  					    VB2_BUF_STATE_QUEUED);
>  	flush_firmware_streamon_fail(stream);
>  
> @@ -590,7 +584,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
>  		goto out;
>  	}
>  
> -	ret = ipu6_isys_stream_start(av, bl, false);
> +	ret = ipu6_isys_stream_start(av, bl);
>  	if (ret)
>  		goto out_stream_start;
>  
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> index 844dfda15ab6..dec1fed44dd2 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> @@ -39,7 +39,6 @@ struct ipu6_isys_video_buffer {
>  
>  #define IPU6_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
>  #define IPU6_ISYS_BUFFER_LIST_FL_ACTIVE	BIT(1)
> -#define IPU6_ISYS_BUFFER_LIST_FL_SET_STATE	BIT(2)
>  
>  struct ipu6_isys_buffer_list {
>  	struct list_head head;
> 

-- 
Best regards,
Bingbu Cao

