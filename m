Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A6828A389
	for <lists+linux-media@lfdr.de>; Sun, 11 Oct 2020 01:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbgJJW44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Oct 2020 18:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgJJVXV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Oct 2020 17:23:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4BDC0613D0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2020 14:23:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 031D1528;
        Sat, 10 Oct 2020 23:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602364999;
        bh=JxqYjptR8mH8tfRDy9+K/8JbK6yGX0xo8XEVIsGX3Pc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L8PWoVb3rs1lS1zuI0IWQ+F6xdsXaLxeceGsDhGNOi95/g+HaqGr3OecWG0ws9QAl
         6PVDWiwAYoAmZJh1pbyzoBILr4O3lzY4MSRO/lZeuhWKbRD/tnQ6c37qw7WGNE5pK1
         W8FSVVZ8IVm0BF3P6SmXGZDrs9RISD4afAFmq4R4=
Date:   Sun, 11 Oct 2020 00:22:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: subdev: Improve link format validation debug
 messages
Message-ID: <20201010212234.GC3939@pendragon.ideasonboard.com>
References: <20201009140223.600-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201009140223.600-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Oct 09, 2020 at 05:02:23PM +0300, Sakari Ailus wrote:
> The existing link format validation failure debug message in media-entity.c
> helped to poinpoint the point of failure but provided no additional
> information what's wrong. Tell the user exactly why the validation failed.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> I pulled this old patch from the VC patchset. It can be merged now without
> the rest.
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 40 ++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a7d508e74d6b..e1dfbcc96a4a 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -792,21 +792,47 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
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

It would be nice to print the sink and source names and pads, but we
don't have that information. Do you think we should print sd->name to
help identifying which link is faulty ?

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
> +	return pass ? 0 : -EPIPE;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
>  

-- 
Regards,

Laurent Pinchart
