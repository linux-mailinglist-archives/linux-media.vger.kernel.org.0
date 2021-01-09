Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F382EFC20
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 01:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbhAIA2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 19:28:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45404 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbhAIA2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 19:28:51 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD140DA;
        Sat,  9 Jan 2021 01:28:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610152088;
        bh=O3AnHnEUGIqqTn6uf8Z/vD5jiPYvHI6+4rpQBBbxRPc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ANBxPz0AVb5CbmbFb4WuqC4rwbCE5DvalykOcHq6nMP15bx6w8Y+2oeNY1T9tsoaA
         2Fs4S+640pZLGC0CPT4JL+CvvMYEN0L5HQ0QJ8Zv5fOm7wcmwgNVA7y/nUhFEyJGMm
         g3hVApt3FPXF0RCpSpJEC5+p7T/veiJAB6ODPsbg=
Date:   Sat, 9 Jan 2021 02:27:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: v4l2-async: Remove V4L2_ASYNC_MATCH_CUSTOM
Message-ID: <X/j4i39NrxySY3Lz@pendragon.ideasonboard.com>
References: <20210108171728.39434-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210108171728.39434-1-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for the patch.

On Fri, Jan 08, 2021 at 02:17:27PM -0300, Ezequiel Garcia wrote:
> Custom/driver-specific v4l2-async match support was introduced
> in 2013, as V4L2_ASYNC_BUS_CUSTOM.
> 
> This type of match never had any user, so it's fair
> to conclude it's not required and that safe for removal.
> If the support is ever needed, it can always be restored.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-async.c | 14 --------------
>  include/media/v4l2-async.h           | 17 -----------------
>  2 files changed, 31 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index e3ab003a6c85..3faf1d12d49d 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -139,16 +139,6 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	return true;
>  }
>  
> -static bool match_custom(struct v4l2_async_notifier *notifier,
> -			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> -{
> -	if (!asd->match.custom.match)
> -		/* Match always */
> -		return true;
> -
> -	return asd->match.custom.match(sd->dev, asd);
> -}
> -
>  static LIST_HEAD(subdev_list);
>  static LIST_HEAD(notifier_list);
>  static DEFINE_MUTEX(list_lock);
> @@ -164,9 +154,6 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  	list_for_each_entry(asd, &notifier->waiting, list) {
>  		/* bus_type has been verified valid before */
>  		switch (asd->match_type) {
> -		case V4L2_ASYNC_MATCH_CUSTOM:
> -			match = match_custom;
> -			break;
>  		case V4L2_ASYNC_MATCH_DEVNAME:
>  			match = match_devname;
>  			break;
> @@ -467,7 +454,6 @@ static int v4l2_async_notifier_asd_valid(struct v4l2_async_notifier *notifier,
>  		return -EINVAL;
>  
>  	switch (asd->match_type) {
> -	case V4L2_ASYNC_MATCH_CUSTOM:
>  	case V4L2_ASYNC_MATCH_DEVNAME:
>  	case V4L2_ASYNC_MATCH_I2C:
>  	case V4L2_ASYNC_MATCH_FWNODE:
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 0e04b5b2ebb0..8ed42188e7c9 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -21,8 +21,6 @@ struct v4l2_async_notifier;
>   * enum v4l2_async_match_type - type of asynchronous subdevice logic to be used
>   *	in order to identify a match
>   *
> - * @V4L2_ASYNC_MATCH_CUSTOM: Match will use the logic provided by &struct
> - *	v4l2_async_subdev.match ops
>   * @V4L2_ASYNC_MATCH_DEVNAME: Match will use the device name
>   * @V4L2_ASYNC_MATCH_I2C: Match will check for I2C adapter ID and address
>   * @V4L2_ASYNC_MATCH_FWNODE: Match will use firmware node
> @@ -31,7 +29,6 @@ struct v4l2_async_notifier;
>   * algorithm that will be used to match an asynchronous device.
>   */
>  enum v4l2_async_match_type {
> -	V4L2_ASYNC_MATCH_CUSTOM,
>  	V4L2_ASYNC_MATCH_DEVNAME,
>  	V4L2_ASYNC_MATCH_I2C,
>  	V4L2_ASYNC_MATCH_FWNODE,
> @@ -58,15 +55,6 @@ enum v4l2_async_match_type {
>   * @match.i2c.address:
>   *		I2C address to be matched.
>   *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> - * @match.custom:
> - *		Driver-specific match criteria.
> - *		Used if @match_type is %V4L2_ASYNC_MATCH_CUSTOM.
> - * @match.custom.match:
> - *		Driver-specific match function to be used if
> - *		%V4L2_ASYNC_MATCH_CUSTOM.
> - * @match.custom.priv:
> - *		Driver-specific private struct with match parameters
> - *		to be used if %V4L2_ASYNC_MATCH_CUSTOM.
>   * @asd_list:	used to add struct v4l2_async_subdev objects to the
>   *		master notifier @asd_list
>   * @list:	used to link struct v4l2_async_subdev objects, waiting to be
> @@ -85,11 +73,6 @@ struct v4l2_async_subdev {
>  			int adapter_id;
>  			unsigned short address;
>  		} i2c;
> -		struct {
> -			bool (*match)(struct device *dev,
> -				      struct v4l2_async_subdev *sd);
> -			void *priv;
> -		} custom;
>  	} match;
>  
>  	/* v4l2-async core private: not to be used by drivers */

-- 
Regards,

Laurent Pinchart
