Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA3C7D381F
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 15:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjJWNdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 09:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjJWNdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 09:33:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34FCD7C
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 06:33:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2F19D20;
        Mon, 23 Oct 2023 15:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698068006;
        bh=70pY42q+SXIuHVmPKQe+GLRTEqi/LmJNkD+KIwoL/jU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sWdyBSlvneHOYWUK992u01JhQvtV4VVVXaLtWVkCK+zD+RIRd0pBxMfY5mCXy5znl
         z8yoijdAiD2fQ0i1/4TJDGqXCUveW5cvfDoNXlGJ2gS7wjcbuEgupYvwXBNWyFOCEg
         f5TGg5n3e29ThUvA/FbCEBqMWkl9A078GVUP7gqk=
Date:   Mon, 23 Oct 2023 16:33:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 3/6] media: v4l: subdev: v4l2_subdev_state_get_format
 always returns format now
Message-ID: <20231023133344.GS3336@pendragon.ideasonboard.com>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023123308.782592-4-sakari.ailus@linux.intel.com>
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

The subject line doesn't read well on its own. A possible better option
would be

media: v4l: subdev: Simplify v4l2_subdev_get_fmt()

On Mon, Oct 23, 2023 at 03:33:05PM +0300, Sakari Ailus wrote:
> Now that v4l2_subdev_state_get_format() always returns format, don't call
> alternative v4l2_subdev_get_pad_format() anymore.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 9c267aaef56b..f0f0af48730f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1580,14 +1580,7 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  {
>  	struct v4l2_mbus_framefmt *fmt;
>  
> -	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> -		fmt = v4l2_subdev_state_get_format(state, format->pad,
> -						   format->stream);
> -	else if (format->pad < sd->entity.num_pads && format->stream == 0)
> -		fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
> -	else
> -		fmt = NULL;
> -
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>  	if (!fmt)
>  		return -EINVAL;
>  

-- 
Regards,

Laurent Pinchart
