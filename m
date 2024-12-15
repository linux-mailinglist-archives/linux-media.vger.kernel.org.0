Return-Path: <linux-media+bounces-23441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2FC9F24DB
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 18:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C62D51885FDD
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 17:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979FC198E86;
	Sun, 15 Dec 2024 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e3TYh2Fb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A67C196DB1
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734281996; cv=none; b=KuU7kcQuFi/blqo51Cng/E9MuToGnhQ7f4KlWE1g+2ALlZBZp6SyEvfqqkAkv278cIi0CqxS2uJN2aepcQGTJ745UUqrzJalrxasfVSs8RR8Ztakc23BULkBIZaKOwz5v1YAxNLty4HyUA13Ek0PM1mJjJeYbg/xTZFc5odh0Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734281996; c=relaxed/simple;
	bh=10oFs0/LCuH0RzkqRInrw8f4uGoHDTv8Sr00+GmPDSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hv5LK2BJlqegFWwv/sLhv9ZJICNURYSXcD/BIoCexduPCizuy4BJRvuRV69W6GUg2XSbsab7IHNtn3Eac83YGPidM/tx7TjMBoOrmoZ+XFy3chJuzO+5PMak9wmGBZDWip/ZLaCsy4GqeGNRQgr1ciFNtRqRhsGOazK+9nyviZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e3TYh2Fb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 707A77E9;
	Sun, 15 Dec 2024 17:59:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734281956;
	bh=10oFs0/LCuH0RzkqRInrw8f4uGoHDTv8Sr00+GmPDSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e3TYh2Fbg0D0wTIuD18mvdpWjzmAFOOl6Whf9DlhYXT3XIeUZzkCUSm02k7aSGruY
	 HJPwPXw3plpxndA4J3buLLWVofJ9JpOEZP/oU3pBlbG3GQaKIhPofru7NoxYnnaWcp
	 2aNarYt6gp77WOCwJCVFLZao5r1k5fec+5NBWSAY=
Date: Sun, 15 Dec 2024 18:59:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 2/5] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <20241215165935.GG9975@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210075906.609490-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Dec 10, 2024 at 09:59:03AM +0200, Sakari Ailus wrote:
> Add link_freq field to struct v4l2_mbus_config in order to pass the link
> frequency to the receiving sub-device.

The documentation of v4l2_get_link_freq() should be expanded to explain
the new mode of operation. It should document which of the supported
methods are recommended for new drivers.

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
>  include/media/v4l2-mediabus.h         |  2 ++
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 9fe74c7e064f..88fbd5608f00 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -508,13 +508,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
>  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  			     unsigned int div)
>  {
> +	struct v4l2_mbus_config mbus_config = {};

Isn't mbus_config fully populated by the .get_mbus_config() operation ?
That should be documented in the .get_mbus_config() operation
documentation.

>  	struct v4l2_subdev *sd;
> +	int ret;
>  
>  	sd = media_entity_to_v4l2_subdev(pad->entity);
> -	if (!sd)
> -		return -ENODEV;
> +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> +			       &mbus_config);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		return ret;
>  
> -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> +	return mbus_config.link_freq ?:
> +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);

	if (mbus_config.link_freq)
		return mbus_config.link_freq;

	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);

I wonder if we should also add a message in case link_freq is 0, to get
drivers to convert to reporting the link frequency through
.get_mbus_config() if they already implement the operation.

>  }
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 5bce6e423e94..cc5f776dc662 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -148,6 +148,7 @@ enum v4l2_mbus_type {
>  /**
>   * struct v4l2_mbus_config - media bus configuration
>   * @type: interface type
> + * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.

Not a candidate for this series, but I'd like to simplify drivers by
implementing the LINK_FREQ control automatically.

>   * @bus: bus configuration data structure
>   * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
>   *		  Used if the bus is parallel or BT.656.
> @@ -162,6 +163,7 @@ enum v4l2_mbus_type {
>   */
>  struct v4l2_mbus_config {
>  	enum v4l2_mbus_type type;
> +	u64 link_freq;
>  	union {
>  		struct v4l2_mbus_config_parallel parallel;
>  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;

-- 
Regards,

Laurent Pinchart

