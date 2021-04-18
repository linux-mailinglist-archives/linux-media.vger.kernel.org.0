Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D1E363569
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhDRNJw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhDRNJw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:09:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB947C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 06:09:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18449499;
        Sun, 18 Apr 2021 15:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618751360;
        bh=73IZdLbrLdg/SBrJHuP5P5pHcUPT399kvTE4g5R+X+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GNgWFf5tBWnaUjfOQ6eJxXuqtQEOeMlJ54luuRen3WJ6WC/5naRgXW89GmRKfQW3K
         ENWH7IYjnvFvNL8+YsljdRGVtNc61eSjZdjtdY3losQYKZsB8Lyp4QOlsdoL8GvWXC
         HxbwsBTSLzd8Yc+vTgODmIfX3fnK8UuvNxgEOxgQ=
Date:   Sun, 18 Apr 2021 16:09:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 21/28] media: ti-vpe: cal: fix cal_ctx_v4l2_register
 error handling
Message-ID: <YHwvfL885Qm0iD0/@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-22-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-22-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:50PM +0300, Tomi Valkeinen wrote:
> cal_ctx_v4l2_register() returns an error code, but the returned error
> code is not handled anywhere. However, we can't really even handle the
> error in any proper way, so lets just drop the return value and make
> sure all error paths have an error print.

Ouch. Doesn't this call for registering the video node earlier, at probe
time, instead of in the async notifier complete callback ?

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-video.c | 16 ++++++++--------
>  drivers/media/platform/ti-vpe/cal.h       |  2 +-
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index 064efdc31b28..ea9b13c16a06 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -864,14 +864,16 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
>  	return 0;
>  }
>  
> -int cal_ctx_v4l2_register(struct cal_ctx *ctx)
> +void cal_ctx_v4l2_register(struct cal_ctx *ctx)
>  {
>  	struct video_device *vfd = &ctx->vdev;
>  	int ret;
>  
>  	ret = cal_ctx_v4l2_init_formats(ctx);
> -	if (ret)
> -		return ret;
> +	if (ret) {
> +		ctx_err(ctx, "Failed to init formats: %d\n", ret);
> +		return;
> +	}
>  
>  	if (!cal_mc_api) {
>  		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
> @@ -880,14 +882,14 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
>  					    NULL, true);
>  		if (ret < 0) {
>  			ctx_err(ctx, "Failed to add source ctrl handler\n");
> -			return ret;
> +			return;
>  		}
>  	}
>  
>  	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
>  	if (ret < 0) {
>  		ctx_err(ctx, "Failed to register video device\n");
> -		return ret;
> +		return;
>  	}
>  
>  	ret = media_create_pad_link(&ctx->phy->subdev.entity,
> @@ -899,13 +901,11 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
>  		ctx_err(ctx, "Failed to create media link for context %u\n",
>  			ctx->dma_ctx);
>  		video_unregister_device(vfd);
> -		return ret;
> +		return;
>  	}
>  
>  	ctx_info(ctx, "V4L2 device registered as %s\n",
>  		 video_device_node_name(vfd));
> -
> -	return 0;
>  }
>  
>  void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 8aa93c92193a..ad7d26c803eb 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -310,7 +310,7 @@ void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr);
>  void cal_ctx_start(struct cal_ctx *ctx);
>  void cal_ctx_stop(struct cal_ctx *ctx);
>  
> -int cal_ctx_v4l2_register(struct cal_ctx *ctx);
> +void cal_ctx_v4l2_register(struct cal_ctx *ctx);
>  void cal_ctx_v4l2_unregister(struct cal_ctx *ctx);
>  int cal_ctx_v4l2_init(struct cal_ctx *ctx);
>  void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx);

-- 
Regards,

Laurent Pinchart
