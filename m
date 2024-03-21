Return-Path: <linux-media+bounces-7524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FBC885F26
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C012E2816D3
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7A91350D2;
	Thu, 21 Mar 2024 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="doXNVI5h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC73B673
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040254; cv=none; b=N8zcV3xxWqxSEDCFlfwDGI44TQ6umIHNhA+6ZdN4yWuu7DwfVXNhG1RMjnUejdVSi/o8EqfPBDRxC51r5zXO4d3pbmw7HblSDFQC8UaLjSLIU7Qtxg/g5ICkH3oLfzD5X//jKi9D48cIjEUyDMyBW0Bq23l1BXDGvFJtTICgmlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040254; c=relaxed/simple;
	bh=MwDCEikrg9Zxh4PWZKkfF2Gd47YlIgc5gaVCzJGpE98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5c5A1AElkmMZ7mPglPtxFYyfNp4e8KTjf3hgpaP81LDGdfGdr0wZo9Tyf099JPzJAF1CSW5EvyVLZQeEkI8M2AHtX7j2HvJbyH4oK+UkPjrtYlBP6lvp9nx+sIbbKl3zPTv/hpGm7LjE1TUabiwXdjl3gH3S8FNpsc4aDVQ87o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=doXNVI5h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97287672;
	Thu, 21 Mar 2024 17:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711040223;
	bh=MwDCEikrg9Zxh4PWZKkfF2Gd47YlIgc5gaVCzJGpE98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=doXNVI5hiFMudL4RG1PvuSqFJBz9lQKoVYykbloHVu+cihvV/4Kl698CzSjx4hBJF
	 +xj2l2zTKD90VuIrSGRVpOjeHy69lEai7jWcRNdJrURzc4xTwYL6ODWxK8fDo5ubN5
	 SkEtRfjS7xPd1yU/GBRr1mN1nOjhhphOawpXIik0=
Date: Thu, 21 Mar 2024 18:57:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 34/38] media: ov2740: Track streaming state
Message-ID: <20240321165728.GH9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-35-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-35-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:12AM +0200, Sakari Ailus wrote:
> With enable_streams and disable_streams, the driver for a device where
> streams are not independently started and stopped needs to maintain state
> information on streams that have been requested to be started. Do that
> now.
> 
> In the future, a helper function in the framework is a desirable way to do
> this instead.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov2740.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 44c6724a102c..df57f0096e98 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -539,6 +539,9 @@ struct ov2740 {
>  
>  	/* True if the device has been identified */
>  	bool identified;
> +
> +	/* Track streaming state */
> +	u8 streaming;
>  };
>  
>  static inline struct ov2740 *to_ov2740(struct v4l2_subdev *subdev)
> @@ -929,6 +932,11 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
>  	int link_freq_index;
>  	int ret;
>  
> +	if (ov2740->streaming) {
> +		ov2740->streaming |= streams_mask;
> +		return 0;
> +	}
> +
>  	ret = pm_runtime_resume_and_get(&client->dev);
>  	if (ret < 0)
>  		return ret;
> @@ -975,6 +983,8 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
>  		goto out_pm_put;
>  	}
>  
> +	ov2740->streaming |= streams_mask;
> +
>  	return 0;
>  
>  out_pm_put:
> @@ -991,6 +1001,10 @@ static int ov2740_disable_streams(struct v4l2_subdev *sd,
>  	struct ov2740 *ov2740 = to_ov2740(sd);
>  	int ret;
>  
> +	ov2740->streaming &= ~streams_mask;
> +	if (ov2740->streaming)
> +		return 0;
> +
>  	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>  			       OV2740_MODE_STANDBY);
>  

-- 
Regards,

Laurent Pinchart

