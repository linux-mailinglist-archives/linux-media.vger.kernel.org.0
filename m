Return-Path: <linux-media+bounces-50214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121AD03B8E
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 16:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5848330754A5
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 15:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCE0366DBF;
	Thu,  8 Jan 2026 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fz/51mIb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C92F9984
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860969; cv=none; b=IfOKCRCpk1XTdYNKpTP5rfBum4FdI1tgsnJZ+j6XV34ujp9ARyTpmPrG/l9Rm2YaqNJ6aFFx9T5h7d1D9ecNrDI059hC4s9q2WAL+DDdiEL6vX/JHano0s/loPSNvgQzdKOzBstcz3pPJ4xIge9EJniFXvYpyDlknpC+3JSIyhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860969; c=relaxed/simple;
	bh=xdGlVBp4uUpHeYToBRzrYIdctr2LhJ3xZWhNdR33+Fc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Esi64Bo4wrnPu41oemrLwuxNKccaL3/T7TQO3cZG4t4BGNZygARW2j+FPBDhLrJMOLmnQ1hJo9iTnk/XFhFTfRjwzieeUQ6Hqjajdersului4Io/QWnadnwxR2et25u/g0AqjEgdjWy8hgk2N+wgd7z585TtubEDqbBWaTtUEkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fz/51mIb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860963; x=1799396963;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=xdGlVBp4uUpHeYToBRzrYIdctr2LhJ3xZWhNdR33+Fc=;
  b=Fz/51mIb/Pq+TrRmrI9wm8/ojLhLsjx0N/BccrJ5YBxVKDAcQAQVK0Fx
   RdgoAB0WDtoCXoKL4i9sW57lvOUSnsYbMhBo2Pcex2ZKQbptKI+pAgbks
   jXFXL65E62L/Z+CiymU/s8eFOCI9G7urbdTHNrpCRppMguH27E5bhP/2C
   G516Drfc3PJeIW8hzYPcWXxX7aydbdfkeN9Yqjz7h9jz823gXt+cdQVGI
   uOP2GuzpxGsSluKEENW0FG2bOmB0kXTFfAQbCNNbKFRzfFTf+IWSwc0oM
   qLmzGPqflh/KV0Ln043lXWTKGTu1a0JbxL1/G+zHVfbFZYL2JOfysJRKc
   w==;
X-CSE-ConnectionGUID: B4s1OL6mQ6y8OI3QvxqNzw==
X-CSE-MsgGUID: 1CH94gkoT22Yo4Um4aVT7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94702073"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="94702073"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:29:14 -0800
X-CSE-ConnectionGUID: zbDeTkLPTX+Y0hvB8eXosA==
X-CSE-MsgGUID: GoYKLRS8TXWkGKSD+NUu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="207984693"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:29:12 -0800
Subject: Re: [PATCH v4 08/14] media: ipu6: Always close firmware stream
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-9-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <5e7d0d86-eb39-2dfa-47f7-4f3724a539b3@linux.intel.com>
Date: Thu, 8 Jan 2026 16:19:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-9-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the patch.
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:17 PM, Sakari Ailus wrote:
> Close the firmware stream even when disabling a stream on an upstream
> sub-device fails. This allows the firmware to release resources related to
> a stream that is stopped in any case.
> 
> Suggested-by: Bingbu Cao <bingbu.cao@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index 919b77107cef..54d861aca008 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -1036,11 +1036,10 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>  			sd->name, r_pad->index, stream_mask);
>  		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
>  						  stream_mask);
> -		if (ret) {
> +		if (ret)
>  			dev_err(dev, "stream off %s failed with %d\n", sd->name,
>  				ret);
> -			return ret;
> -		}
> +
>  		close_streaming_firmware(av);
>  	} else {
>  		ret = start_stream_firmware(av, bl);
> 

-- 
Best regards,
Bingbu Cao

