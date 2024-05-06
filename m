Return-Path: <linux-media+bounces-10820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A58BC610
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 05:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF9DFB20FE9
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 03:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F418F40855;
	Mon,  6 May 2024 03:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIouoH7g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C5533D0
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714964848; cv=none; b=GwE9SxCSvwPW4jSkpUTOBSzv7aqkUcpmj0zZF4R96Ny5BgvR1we0lMGTYzrfpI0GSba+J0KDxn/AN7LQAjX9SaVOJpiluZa1pknrH7/lSXbCJTsrkkioChYkUiQWqtoB+2p+7vLwuJicsznzLzr3BJUP6PScUv6Nf73GKxyze6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714964848; c=relaxed/simple;
	bh=VDpugAxNEAxXQFaDCnDp/TT9UD6Rnb2h1LmCWDYJ670=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TXJ/feaMk7qJQqeZIT62ik0KkD8OTyeTkwTu7M1F89ekJvC04FRyCi4izrYs2gkIINyWkH6q6ZUIjaIbsoxNvbZZp2WgslAb2uTXHPO6TJWYJ2miroA4rl6qJXZeGvC9MIME0xwHe4osxHWqN4Byyx4CG0TE1Nx5mxijHWXl9aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIouoH7g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714964847; x=1746500847;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=VDpugAxNEAxXQFaDCnDp/TT9UD6Rnb2h1LmCWDYJ670=;
  b=LIouoH7gqwqXowhV5S4KyBju7B27q5mU+98dM6Xz9tfYH2U8HIyPEUq9
   nquriDZJhDcydqeduDHa2vYQnKmolGjFbpmFeuQlULL+Wtr5XEiHFZImY
   fNqTsT31jWEWgLZ+BSnghyeQcJ3+Mz48eZKroW+QgBPhxEYgD+6/EuuTX
   NVxcNnmbupcemxKL67oM2DxosgYFHWW966UXhW2tZtUOlmzMcQr5IX9De
   FORGHuCKv+Wkm8cCS4d9pmONhzOzbeZyjGLaoSaAOKWiVwp3/1HCqwvXK
   gbl3G0wCV4EsjtYoSQUW73AolRq+c97SNw6XIK1PyUdJyGv9fq1MSk4MN
   Q==;
X-CSE-ConnectionGUID: 7LWvRqPeTuSXQduCGmclMg==
X-CSE-MsgGUID: dhQahMniRBGXWMvegW6nIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10816895"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10816895"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 20:07:26 -0700
X-CSE-ConnectionGUID: 6v+Y0J4JSveFGo6hlutokQ==
X-CSE-MsgGUID: alunLnauTfm3rX6hkNisTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="65456885"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2024 20:07:26 -0700
Subject: Re: [PATCH 1/1] media: ov2740: Add event support for controls
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
References: <20240502100240.1585378-1-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <5078e1ac-d352-7f10-394f-c25ec6e172be@linux.intel.com>
Date: Mon, 6 May 2024 11:07:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240502100240.1585378-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the patch.

On 5/2/24 6:02 PM, Sakari Ailus wrote:
> The driver supports controls. Therefore, add support for control events.
> This makes the driver pass v4l2-compliance, too.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 57906df7be4e..3e3f958db256 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -13,6 +13,7 @@
>  #include <linux/regmap.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  
>  #define OV2740_LINK_FREQ_360MHZ		360000000ULL
> @@ -1100,7 +1101,13 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
>  	.enum_frame_size = ov2740_enum_frame_size,
>  };
>  
> +static const struct v4l2_subdev_core_ops ov2740_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_ops ov2740_subdev_ops = {
> +	.core = &ov2740_core_ops,
>  	.video = &ov2740_video_ops,
>  	.pad = &ov2740_pad_ops,
>  };
> @@ -1364,7 +1371,8 @@ static int ov2740_probe(struct i2c_client *client)
>  	}
>  
>  	ov2740->sd.state_lock = ov2740->ctrl_handler.lock;
> -	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		V4L2_SUBDEV_FL_HAS_EVENTS;
>  	ov2740->sd.entity.ops = &ov2740_subdev_entity_ops;
>  	ov2740->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ov2740->pad.flags = MEDIA_PAD_FL_SOURCE;
> 

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>


-- 
Best regards,
Bingbu Cao

