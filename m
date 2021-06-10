Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABC73A2A29
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFJL3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhFJL3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:29:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5327C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 04:27:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CC2F8D4;
        Thu, 10 Jun 2021 13:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623324434;
        bh=w7XRw5vQ6O0RwUjjHOsA39OjnDhg4XAHi57IZl+tgCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ja70BapUAmJQLrC8EeY+jTd2n9QE5TxHqp2N4rK/lDv0U3xcEj/NaVrvGNDjdidSd
         kKnQaRex7CIbY9LWyrRUPznvpNjt8gtJah3VF1rB60xtX7WuoIlLTIYuQ3yzWklQ05
         uWanBKEKf+JuLN/ICa7EdY+x42KzYNYudPQFH35c=
Date:   Thu, 10 Jun 2021 14:26:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 5/5] media: v4l2-subdev: fix and rename check_cfg()
Message-ID: <YMH3AOK961VIVmkI@pendragon.ideasonboard.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
 <20210610094903.343183-1-tomi.valkeinen@ideasonboard.com>
 <20210610094903.343183-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210610094903.343183-4-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Jun 10, 2021 at 12:49:03PM +0300, Tomi Valkeinen wrote:
> Rename check_cfg() to check_state_pads() as it is now checking the pads
> of the state.
> 
> Also fix the check so that it verifies that both state and state->pads
> exist.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 25c80d6de23b..daf7ffdd8882 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -148,9 +148,9 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
>  	return 0;
>  }
>  
> -static int check_cfg(u32 which, struct v4l2_subdev_state *state)
> +static int check_state_pads(u32 which, struct v4l2_subdev_state *state)
>  {
> -	if (which == V4L2_SUBDEV_FORMAT_TRY && !state)
> +	if (which == V4L2_SUBDEV_FORMAT_TRY && (!state || !state->pads))
>  		return -EINVAL;
>  
>  	return 0;
> @@ -164,7 +164,7 @@ static inline int check_format(struct v4l2_subdev *sd,
>  		return -EINVAL;
>  
>  	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
> -	       check_cfg(format->which, state);
> +	       check_state_pads(format->which, state);
>  }
>  
>  static int call_get_fmt(struct v4l2_subdev *sd,
> @@ -191,7 +191,7 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
>  		return -EINVAL;
>  
>  	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
> -	       check_cfg(code->which, state) ? :
> +	       check_state_pads(code->which, state) ? :
>  	       sd->ops->pad->enum_mbus_code(sd, state, code);
>  }
>  
> @@ -203,7 +203,7 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
>  		return -EINVAL;
>  
>  	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
> -	       check_cfg(fse->which, state) ? :
> +	       check_state_pads(fse->which, state) ? :
>  	       sd->ops->pad->enum_frame_size(sd, state, fse);
>  }
>  
> @@ -238,7 +238,7 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
>  		return -EINVAL;
>  
>  	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
> -	       check_cfg(fie->which, state) ? :
> +	       check_state_pads(fie->which, state) ? :
>  	       sd->ops->pad->enum_frame_interval(sd, state, fie);
>  }
>  
> @@ -250,7 +250,7 @@ static inline int check_selection(struct v4l2_subdev *sd,
>  		return -EINVAL;
>  
>  	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
> -	       check_cfg(sel->which, state);
> +	       check_state_pads(sel->which, state);
>  }
>  
>  static int call_get_selection(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
