Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62AAE3A3E2F
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 10:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhFKIob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 04:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFKIob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 04:44:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D71C061574
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 01:42:33 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66AC24AD;
        Fri, 11 Jun 2021 10:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623400951;
        bh=7LN1UmKqiX/KptAGRj7GEvUl7YoAxWCFFxyUzdebyog=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=M2NAMbKxjIuGvLmYnQiyHTZYUAIFLR5vfMCbpFEBy0tN/+pe9X7Dy+2CuN3a6D7IL
         lDybuvhhqX6PMXPXqplU6FHvIVXYk1JCU8yDfQs38XlHK0J6+k7Kj+s8VGMG0fkzTQ
         2GyubMxCKtN5pqSUGg/k+Ib66BAA4NPXcu/HHAAI=
Subject: Re: [PATCH v5 10/9] media: mt9v111: fix compilation when
 !VIDEO_V4L2_SUBDEV_API
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
 <20210611054909.28155-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <4e3586f5-2b2f-56c6-1b97-71fecab21025@ideasonboard.com>
Date:   Fri, 11 Jun 2021 11:42:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611054909.28155-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/06/2021 08:49, Tomi Valkeinen wrote:
> Patch "media: v4l2-subdev: add subdev-wide state struct" describes the
> semantic patch used to convert drivers to the new subdev-wide state. For
> some reason the semantic patch didn't catch a single case of:
> 
> 	#if IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API)
> 		this was patched
> 	#else
> 		this was not patched
> 	#endif
> 
> Manually fix this one case.
> 
> Note that this patch is meant to be squashed into the main patch.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/media/i2c/mt9v111.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
> index b438f8c077d5..2dc4a0f24ce8 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -800,7 +800,7 @@ static struct v4l2_mbus_framefmt *__mt9v111_get_pad_format(
>   #if IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API)
>   		return v4l2_subdev_get_try_format(&mt9v111->sd, sd_state, pad);
>   #else
> -		return &cfg->try_fmt;
> +		return &sd_state->pads->try_fmt;
>   #endif
>   	case V4L2_SUBDEV_FORMAT_ACTIVE:
>   		return &mt9v111->fmt;
> 

I missed adding:

Reported-by: kernel test robot <lkp@intel.com>

  Tomi
