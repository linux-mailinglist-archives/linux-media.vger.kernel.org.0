Return-Path: <linux-media+bounces-10401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E173C8B6B58
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 09:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B3C5B21BF9
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 07:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25B13A1DE;
	Tue, 30 Apr 2024 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ryud3/wX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6957933EC
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714461579; cv=none; b=sxqQknzyVkYiDbz/AU5k5I7lNSaxkV5HaaX53zwG+CjA5VWOd0K4nW5glfaYA6w7SJd2RNgmDTRSgKHQws7AGmRe749lGhUsiHr7FbEMsd0vB2wk42KJGrihOAmEodesHXmR99TtqVHuF9+h+ApFVf5y6g3qb74KkmQRqvcaeY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714461579; c=relaxed/simple;
	bh=1ljNqohv6adpnsI2OMiCMmOe5w5X5Mxmyn4nnI6ADgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlH0swfbr77NYldqkrkzab7mmy/pb7DseAUsL2LU0XeLGRWPU39G5HacF3N5w0oOLph0gQSOUrJX0w7Kj5Cail/7jMeATz0chVM3CRw7jVDt5J9WOiMugsT24nFtXzQ6tVEZDeTnRICm+5Vpy08W3L9ISrqfYIcHhQ7RtB8+A+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ryud3/wX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEB78552;
	Tue, 30 Apr 2024 09:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714461519;
	bh=1ljNqohv6adpnsI2OMiCMmOe5w5X5Mxmyn4nnI6ADgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryud3/wXI2rG0zACzHSPCO0zSvoWY5+gKofxJKtfIjmjwCxt99f8ytqlf/63W+ez1
	 u+JzNZs50DfNSi7zBffuSLbWu3PDZBqEuheBV2sYUJws9RL+4Y7C8XKec+0nE6dB9R
	 jljfHNrINUpLAvaO8+jrWbsDz2HfHAKpe8eI6YHY=
Date: Tue, 30 Apr 2024 09:19:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v4 2/4] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <cc5cwbigryoqt6tchpi6g7jhen6mefxnyn5e5dlfomzuh7yha3@du6lkepft6zj>
References: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
 <20240429190852.1008003-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240429190852.1008003-3-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Apr 29, 2024 at 10:08:50PM +0300, Sakari Ailus wrote:
> Add link_freq field to struct v4l2_mbus_config in order to pass the link
> frequency to the reciving sub-device.

'receiving'

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 13 +++++++++----
>  include/media/v4l2-mediabus.h         |  2 ++
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 7f69b5a025fa..09b26ce612e9 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -503,15 +503,20 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
>
>  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> -			     unsigned int div)
> +			      unsigned int div)

Goes in the previous patch that introduces the function ?

>  {
> +	struct v4l2_mbus_config mbus_config = {};
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
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
>
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 5bce6e423e94..2f39b52bb4d4 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -159,6 +159,7 @@ enum v4l2_mbus_type {
>   * @bus.mipi_csi2: embedded &struct v4l2_mbus_config_mipi_csi2.
>   *		   Used if the bus is MIPI Alliance's Camera Serial
>   *		   Interface version 2 (MIPI CSI2).
> + * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
>   */
>  struct v4l2_mbus_config {
>  	enum v4l2_mbus_type type;
> @@ -167,6 +168,7 @@ struct v4l2_mbus_config {
>  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
>  		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
>  	} bus;
> +	u64 link_freq;

Does this apply to all the supported busses ?

I count:

        struct v4l2_mbus_config_parallel parallel;
        struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
        struct v4l2_mbus_config_mipi_csi2 mipi_csi2;

not sure about csi1, but I would say "yes" ?

However it would feel more natural to fetch the 'link_freq' from the
bus-specific structure like in 'bus.mipi_csi2.link_freq' (and 'bus' is
an union, so we're not consuming any additional space if we move it to
the per-bus structure).


>  };
>
>  /**
> --
> 2.39.2
>
>

