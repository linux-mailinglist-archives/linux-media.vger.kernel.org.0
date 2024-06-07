Return-Path: <linux-media+bounces-12711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 632058FFF6D
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 11:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E459CB267D4
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 09:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A177B15CD79;
	Fri,  7 Jun 2024 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkpyYJ9C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B582315B984;
	Fri,  7 Jun 2024 09:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752466; cv=none; b=aTp8Ox7BslYNzhOOAjxzfsJXXSdW+HQPpp6uJpfDUcy1GBtjJHs4AiAaW5UGBsJBWtgMtzeicU4vqdt2giWF2FIt1yWf8Iw52LBvSzhTW/zb+cIFQ0LGLa6BMvs0e67le38+oJLry81zntVIIS6v5zGlkV/l1TleR2iGDbsT+40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752466; c=relaxed/simple;
	bh=Xl7fXMPVXTqlhn4z2qG29YLP1noIQfbxq2s7381bE74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgceGVrUQHWmWEPXICughAVYCd8IDTW7GwMDzazNF7kSNY6cG9AeXMdXs1CKy66w/xCdniKEFjRWtJ4iHq3HQIVRGTq7faPI1mHlCvIfyjbmMAre7GFqpSZ16AyWTiADwXtmEIRSu/hj7B7YgQkGvAgcJu1h5VD3cNxbBfgdcRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkpyYJ9C; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717752465; x=1749288465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xl7fXMPVXTqlhn4z2qG29YLP1noIQfbxq2s7381bE74=;
  b=bkpyYJ9CXOrdZFknt6vcq83Zh4A8jkMsgoZdo8UjWJV/i0NikK6iYfL5
   eOZ4Kxz0oDwTCOks41wIy1J3yBQhxkFFW4kIal/ZeYTy7tqDN0k9jtLD+
   8/3g4EDOqFToPEXC53TUEI7NPQV2ElxiZFctJblOcx0FZXC1PpdKQqTdc
   pS5EvkYf3PJIcZX76OU9zUD+1MizjFlCpE0wfUsRbWuo8PlT0zWJruqM1
   M1PfskW/x+M1KpkiSqwlyYgkqsnUIyQ4w1WzOPn2vkFacKQKwaI7avU+5
   TLO9zxrkDPuMKx7cjkrUW7VRj1Yszd5PWEs+n9i8fhDVlyqLq8dd4z6Rg
   g==;
X-CSE-ConnectionGUID: 6HpVnJbxR8mvBAx1WDnOMg==
X-CSE-MsgGUID: lv5YfymGQ0OZ56OqDBvVzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="36992327"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="36992327"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 02:27:45 -0700
X-CSE-ConnectionGUID: wxek7R5GQXqBYpe7A0L/jQ==
X-CSE-MsgGUID: funhR6b+T2Ozg3HuTIm4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38937740"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 02:27:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B725412027E;
	Fri,  7 Jun 2024 12:27:39 +0300 (EEST)
Date: Fri, 7 Jun 2024 09:27:39 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hao Ge <hao.ge@linux.dev>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hao Ge <gehao@kylinos.cn>
Subject: Re: [PATCH] media: intel/ipu6: Fix a null pointer dereference in
 ipu6_isys_query_stream_by_source
Message-ID: <ZmLSi6y4cYBplGpN@kekkonen.localdomain>
References: <20240607082542.380166-1-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607082542.380166-1-hao.ge@linux.dev>

Hi Hao,

Thanks for the patch.

On Fri, Jun 07, 2024 at 04:25:42PM +0800, Hao Ge wrote:
> From: Hao Ge <gehao@kylinos.cn>
> 
> stream is NULL when source is less than 0 in
> ipu6_isys_query_stream_by_source. It's a null
> pointer dereference.

Applied. Rewrapped this, lines can be up to 75 characters long.

> 
> Actually, this should be isys->adev->auxdev.dev.
> 
> Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index c8a33e1e910c..06090cc0a476 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -943,7 +943,7 @@ ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc)
>  		return NULL;
>  
>  	if (source < 0) {
> -		dev_err(&stream->isys->adev->auxdev.dev,
> +		dev_err(&isys->adev->auxdev.dev,
>  			"query stream with invalid port number\n");
>  		return NULL;
>  	}

-- 
Regards,

Sakari Ailus

