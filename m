Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAB6189779
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 09:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgCRI6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 04:58:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39978 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgCRI6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 04:58:25 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FAD5AC0;
        Wed, 18 Mar 2020 09:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584521903;
        bh=x5zGzRONpHqEkfSriHxYKBj7PMtKs3boofmcluqhrMk=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=hMaw+w2HfpkmqY3Ccm9XGbDHug3FSrVG1XpNnQRYcjyZQtXVBu3KJg6Dhnx+67ASJ
         qyKQk4QNtwzkThI/TW5tR2B8nzlGYAz+zSN/ZNmyj7WETjMfKMjIW3ZH0eNV7NWy0N
         zibjIHClhBN8+P7gG4tU5OTJmwm5wVtqTPOagLl8=
Subject: Re: [PATCH v2 2/4] media: v4l2-async: Pass notifier pointer to match
 functions
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200318002507.30336-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <d82c9908-f527-9406-b666-f130b8ede2ee@ideasonboard.com>
Date:   Wed, 18 Mar 2020 08:58:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200318002507.30336-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 18/03/2020 00:25, Laurent Pinchart wrote:
> The notifier is useful to match functions to access information about
> the device matching a subdev. This will be used to print messages using
> the correct struct device and driver name.

The number of times I've added debug prints in these match functions
debugging issues already, I should have done this too!

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 995e5464cba7..224b39a7aeb1 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -50,7 +50,8 @@ static int v4l2_async_notifier_call_complete(struct v4l2_async_notifier *n)
>  	return n->ops->complete(n);
>  }
>  
> -static bool match_i2c(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +static bool match_i2c(struct v4l2_async_notifier *notifier,
> +		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
>  #if IS_ENABLED(CONFIG_I2C)
>  	struct i2c_client *client = i2c_verify_client(sd->dev);
> @@ -63,13 +64,14 @@ static bool match_i2c(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  #endif
>  }
>  
> -static bool match_devname(struct v4l2_subdev *sd,
> -			  struct v4l2_async_subdev *asd)
> +static bool match_devname(struct v4l2_async_notifier *notifier,
> +			  struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
>  	return !strcmp(asd->match.device_name, dev_name(sd->dev));
>  }
>  
> -static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +static bool match_fwnode(struct v4l2_async_notifier *notifier,
> +			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
>  	struct fwnode_handle *other_fwnode;
>  	struct fwnode_handle *dev_fwnode;
> @@ -114,7 +116,8 @@ static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  	return dev_fwnode == other_fwnode;
>  }
>  
> -static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +static bool match_custom(struct v4l2_async_notifier *notifier,
> +			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
>  	if (!asd->match.custom.match)
>  		/* Match always */
> @@ -131,7 +134,8 @@ static struct v4l2_async_subdev *
>  v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		      struct v4l2_subdev *sd)
>  {
> -	bool (*match)(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
> +	bool (*match)(struct v4l2_async_notifier *notifier,
> +		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
>  	struct v4l2_async_subdev *asd;
>  
>  	list_for_each_entry(asd, &notifier->waiting, list) {
> @@ -156,7 +160,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		}
>  
>  		/* match cannot be NULL here */
> -		if (match(sd, asd))
> +		if (match(notifier, sd, asd))
>  			return asd;
>  	}
>  
> 

