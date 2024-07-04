Return-Path: <linux-media+bounces-14618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C692702A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 09:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5513B23797
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 07:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA381A0AED;
	Thu,  4 Jul 2024 07:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gpg3nJdH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C3E146A70;
	Thu,  4 Jul 2024 07:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720076525; cv=none; b=p5daZf8R8cbWIH48rkVueGwNHOU7RPV4WM/tBsrfKeVLW3U2PiUYjylUdd3TiGzgeG5h8/yj55GPG9TMhnUwH7aAlySZ98hx09bskWpCmYPR3H3LbjjwDYEDzk3q9DmKqWWGjUYNbyRF2eE1IHFSD/RyQxj+uqsk8KAnzHj//DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720076525; c=relaxed/simple;
	bh=nyWNxViiwALsERwQ9nojUZ5qQSyykv/r8vPqJF9JqL0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=k1p7bI3JU0QNZYTRtWstyC/4WMfHPR3AS52uWRZGysfABOL072ZsgRutDLjdEJtchyoqzvuqdSoLH4i64QS0XvqQnMQwpMEwHKwFiARiPtEoIlUcmJe9ZOcsLp2eHRpsuu8gRj2hZ/UqMR2lDY+JdMvUZtg9rFkn8+fmQf7Gbgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gpg3nJdH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720076524; x=1751612524;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nyWNxViiwALsERwQ9nojUZ5qQSyykv/r8vPqJF9JqL0=;
  b=Gpg3nJdHBADn6TwuAFlqFW0f0zbbiobbUILs8k7qRxX7ZCQ0zlv8/pgX
   njO5WqEMDgtnGo1esloc8evjI4rnZ2ND0B1msKYiFqAKsH0/E/p3Ecl3I
   W14PT9fAIYZN0RvW5ilDEH86dvgUWZZwzivvR2lzEl47bIbuVfqk8Gkdh
   pNN0vtlbgEHFxcXEn/7LIu1kuxWup4mHUYm46LpUXsotswspiFajLYUk7
   K/C9TkZYK3THlPJtBoSSx0UeF6qs9sZeN6RewQjCMSZ7iHrwL8RmwRcEA
   6XM9EZgXbhBAOgJm8PxWFjbqen3oDgRQ3BiISQmX/q6YK46C87BRMvtPD
   w==;
X-CSE-ConnectionGUID: QJkerVuXSrmNtsSqEzxGXA==
X-CSE-MsgGUID: K8FJGRouTt26hwHEMOxVaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27953962"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="27953962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 00:02:03 -0700
X-CSE-ConnectionGUID: 0iFJ5pprS0a1eYhTS3kPPg==
X-CSE-MsgGUID: WflacbwXTkKXRJH6ZAxpLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51462679"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa005.jf.intel.com with ESMTP; 04 Jul 2024 00:02:00 -0700
Subject: Re: [PATCH v1 3/3] staging: media: ipu3: Stop streaming in inverse
 order of starting
To: Max Staudt <mstaudt@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240620145820.3910239-1-mstaudt@chromium.org>
 <20240620145820.3910239-4-mstaudt@chromium.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <e6ff8ad5-933d-fbbb-0c4b-ae19c65e8439@linux.intel.com>
Date: Thu, 4 Jul 2024 15:03:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240620145820.3910239-4-mstaudt@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Max,

Thanks for your patch.

On 6/20/24 10:45 PM, Max Staudt wrote:
> imgu_vb2_stop_streaming() did not order shutdown items in the inverse
> order and count of what imgu_vb2_start_streaming() does. Consequently,
> v6.7's new WARN_ON in call_s_stream() started screaming because it was
> called multiple times on the entire pipe, yet it should only be called
> when the pipe is interrupted by any first node being taken offline.
> 
> This reorders streamoff to be the inverse of streamon, and uses
> analogous conditions to decide when and how often to call additional
> teardown functions.
> 
> v4l2_subdev_call(s_stream, 0) remains outside the streaming_lock,
> analogously to imgu_vb2_start_streaming().
> 
> Signed-off-by: Max Staudt <mstaudt@chromium.org>
> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 36 +++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 3ff390b04e1a..e7aee7e3db5b 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -535,29 +535,51 @@ static void imgu_vb2_stop_streaming(struct vb2_queue *vq)
>  		container_of(vq, struct imgu_video_device, vbq);
>  	int r;
>  	unsigned int pipe;
> +	bool stop_streaming = false;
>  
> +	/* Verify that the node had been setup with imgu_v4l2_node_setup() */
>  	WARN_ON(!node->enabled);
>  
>  	pipe = node->pipe;
>  	dev_dbg(dev, "Try to stream off node [%u][%u]", pipe, node->id);
> -	imgu_pipe = &imgu->imgu_pipe[pipe];
> -	r = v4l2_subdev_call(&imgu_pipe->imgu_sd.subdev, video, s_stream, 0);
> -	if (r)
> -		dev_err(&imgu->pci_dev->dev,
> -			"failed to stop subdev streaming\n");

I guess the subdev streams API can help us on this, but current fix
looks fine for me.

>  
> +	/*
> +	 * When the first node of a streaming setup is stopped, the entire
> +	 * pipeline needs to stop before individual nodes are disabled.
> +	 * Perform the inverse of the initial setup.
> +	 *
> +	 * Part 1 - s_stream on the entire pipeline

stream on or off? it is a little confusing.

> +	 */
>  	mutex_lock(&imgu->streaming_lock);
> -	/* Was this the first node with streaming disabled? */
>  	if (imgu->streaming) {
>  		/* Yes, really stop streaming now */
>  		dev_dbg(dev, "IMGU streaming is ready to stop");
>  		r = imgu_s_stream(imgu, false);
>  		if (!r)
>  			imgu->streaming = false;
> +		stop_streaming = true;
>  	}
> -
>  	mutex_unlock(&imgu->streaming_lock);
>  
> +	/* Part 2 - s_stream on subdevs
> +	 *
> +	 * If we call s_stream multiple times, Linux v6.7's call_s_stream()
> +	 * WARNs and aborts. Thus, disable all pipes at once, and only once.
> +	 */
> +	if (stop_streaming) {

> +		for_each_set_bit(pipe, imgu->css.enabled_pipes,
> +				 IMGU_MAX_PIPE_NUM) {
> +			imgu_pipe = &imgu->imgu_pipe[pipe];
> +
> +			r = v4l2_subdev_call(&imgu_pipe->imgu_sd.subdev,
> +					     video, s_stream, 0);
> +			if (r)
> +				dev_err(&imgu->pci_dev->dev,
> +					"failed to stop subdev streaming\n");
> +		}

Is it possible to move this loop into 'if (imgu->streaming)' above?

> +	}
> +
> +	/* Part 3 - individual node teardown */
>  	video_device_pipeline_stop(&node->vdev);
>  	imgu_return_all_buffers(imgu, node, VB2_BUF_STATE_ERROR);
>  }
> 

-- 
Best regards,
Bingbu Cao

