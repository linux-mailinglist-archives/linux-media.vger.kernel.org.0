Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5977C8406
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbjJMLF7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjJMLF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:05:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613BB91
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:05:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F4F4480;
        Fri, 13 Oct 2023 13:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697195150;
        bh=9u6hraBGfjzcE+s5ul2h6W5tItIzaoxGdut+EjF5DaE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BEWTJ9JmOVPpNNMLWAykhDxRbN0g4bBtniENr0eHHKXvrGgVsHQgntjQ88Qy/US6u
         0jix9th8tQzqZOaKZtxqxoc9uxni1rm0/9/FGAp/he218dt78jdgjvAXvxokgR7I1S
         BGHRq/M1zmiT0A5iPJgcyhr2FRa6Q5da0lJiD5QM=
Date:   Fri, 13 Oct 2023 14:06:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 4/6] media: v4l: subdev: v4l2_subdev_get_format always
 returns format now
Message-ID: <20231013110601.GC11101@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231013104424.404768-5-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Oct 13, 2023 at 01:44:22PM +0300, Sakari Ailus wrote:
> Now that v4l2_subdev_get_format() always returns format, don't call
> alternative v4l2_subdev_get_pad_format() anymore.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Assuming we go forward for 2/6, this patch looks fine.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a522cd8096cf..153e9b1958d6 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1580,14 +1580,7 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  {
>  	struct v4l2_mbus_framefmt *fmt;
>  
> -	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> -		fmt = v4l2_subdev_get_format(state, format->pad,
> -					     format->stream);
> -	else if (format->pad < sd->entity.num_pads && format->stream == 0)
> -		fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
> -	else
> -		fmt = NULL;
> -
> +	fmt = v4l2_subdev_get_format(state, format->pad, format->stream);
>  	if (!fmt)
>  		return -EINVAL;
>  

-- 
Regards,

Laurent Pinchart
