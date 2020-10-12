Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6E528B0F5
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 10:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgJLI6o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 04:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbgJLI6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 04:58:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA98C0613CE
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 01:58:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 494903B;
        Mon, 12 Oct 2020 10:58:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602493122;
        bh=2lWdRlJugw8CEGclOf++S0QdbGf6UMHeMc8wUcsdpKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o96LGH5RSOLWHFp9egtRZdfCM/vxzxQ8Ta1AcgLruYySmhJE0YR+GV5elD8XtWeaK
         rr29a9eXVPIaYl0sj3uc7dk6gsObCa31FPKYQwYGe3N3KRMGE2oqKmM287ogsQ8pYS
         OegIuENGBCoCrBGhojaXasJm0S3gYRQlYeDMb24E=
Date:   Mon, 12 Oct 2020 11:57:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: subdev: Improve link format validation debug
 messages
Message-ID: <20201012085756.GS3944@pendragon.ideasonboard.com>
References: <20201012083719.23767-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201012083719.23767-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Oct 12, 2020 at 11:37:19AM +0300, Sakari Ailus wrote:
> The existing link format validation failure debug message in media-entity.c
> helped to poinpoint the point of failure but provided no additional
> information what's wrong. Tell the user exactly why the validation failed.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> since v1:
> 
> - Print the link if there were mismatches
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 48 +++++++++++++++++++++++----
>  1 file changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a7d508e74d6b..956dafab43d4 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -792,21 +792,55 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_format *source_fmt,
>  				      struct v4l2_subdev_format *sink_fmt)
>  {
> +	bool pass = true;
> +
>  	/* The width, height and code must match. */
> -	if (source_fmt->format.width != sink_fmt->format.width
> -	    || source_fmt->format.height != sink_fmt->format.height
> -	    || source_fmt->format.code != sink_fmt->format.code)
> -		return -EPIPE;
> +	if (source_fmt->format.width != sink_fmt->format.width) {
> +		dev_dbg(sd->entity.graph_obj.mdev->dev,
> +			"%s: width does not match (source %u, sink %u)\n",
> +			__func__,
> +			source_fmt->format.width, sink_fmt->format.width);
> +		pass = false;
> +	}
> +
> +	if (source_fmt->format.height != sink_fmt->format.height) {
> +		dev_dbg(sd->entity.graph_obj.mdev->dev,
> +			"%s: height does not match (source %u, sink %u)\n",
> +			__func__,
> +			source_fmt->format.height, sink_fmt->format.height);
> +		pass = false;
> +	}
> +
> +	if (source_fmt->format.code != sink_fmt->format.code) {
> +		dev_dbg(sd->entity.graph_obj.mdev->dev,
> +			"%s: media bus code does not match (source 0x%8.8x, sink 0x%8.8x)\n",
> +			__func__,
> +			source_fmt->format.code, sink_fmt->format.code);
> +		pass = false;
> +	}
>  
>  	/* The field order must match, or the sink field order must be NONE
>  	 * to support interlaced hardware connected to bridges that support
>  	 * progressive formats only.
>  	 */
>  	if (source_fmt->format.field != sink_fmt->format.field &&
> -	    sink_fmt->format.field != V4L2_FIELD_NONE)
> -		return -EPIPE;
> +	    sink_fmt->format.field != V4L2_FIELD_NONE) {
> +		dev_dbg(sd->entity.graph_obj.mdev->dev,
> +			"%s: field does not match (source %u, sink %u)\n",
> +			__func__,
> +			source_fmt->format.field, sink_fmt->format.field);
> +		pass = false;
> +	}
>  
> -	return 0;
> +	if (pass)
> +		return 0;
> +
> +	dev_dbg(sd->entity.graph_obj.mdev->dev,
> +		"%s: link was \"%s\":%u -> \"%s\":%u\n", __func__,
> +		link->source->entity->name, link->source->index,
> +		link->sink->entity->name, link->sink->index);
> +
> +	return -EPIPE;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
>  

-- 
Regards,

Laurent Pinchart
