Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107962F85AC
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 20:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387758AbhAOTlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 14:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbhAOTlJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 14:41:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39687C0613C1
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 11:40:28 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AED658B;
        Fri, 15 Jan 2021 20:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610739625;
        bh=TYuBW75zIWbptNsezfxVG6RCXLov6z1LFoD4eyw/eEQ=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=UR+ry29NnlPJgmaGn/wvM+zay8surVsP0OjY4FE2++ssjiKyqclccucYg5/zERwkg
         yH/SEOL9N9js0Bk0XmaoyQJnxEFbno4QM/MreEIRrg0DaK+5TbOQ440/H+Rt6ukjHo
         rZ9rnPSySBlbTWY6m296TO+M+Lw+RYwOzHxy3V+s=
Subject: Re: [PATCH] media: v4l2-async: Remove V4L2_ASYNC_MATCH_CUSTOM
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210108171728.39434-1-ezequiel@collabora.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <732caccd-9bd7-c723-cb34-533f99318cb4@ideasonboard.com>
Date:   Fri, 15 Jan 2021 19:40:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108171728.39434-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 08/01/2021 17:17, Ezequiel Garcia wrote:
> Custom/driver-specific v4l2-async match support was introduced
> in 2013, as V4L2_ASYNC_BUS_CUSTOM.
> 
> This type of match never had any user, so it's fair
> to conclude it's not required and that safe for removal.
> If the support is ever needed, it can always be restored.
> 

Simplify v4l2-async? Yes please!

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
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
> 

