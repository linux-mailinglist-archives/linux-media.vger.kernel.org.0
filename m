Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B09087D949E
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 12:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235117AbjJ0KDa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 06:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235128AbjJ0KD2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 06:03:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AA61A5
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 03:03:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAD30669;
        Fri, 27 Oct 2023 12:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400991;
        bh=uWrnO1CDHe6JNIXwsNdbS11JqYK7SiPBa0kS7RiPtxg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jrJiAeNOPhdYeOL9yCDWOvWOrbYs/yntgMq6mdJcs2MlUaW23eG/Uye8dKDeQJe/a
         GOQ29TW4j08xxsxh8Kwml1MlVho2v4UkBPT0vt5r/UndXulvnchHv9iT3dacioAXUJ
         w+jdUtg24FHsR2A3N4UKVoU3MqELxQQXSvKuOE1E=
Date:   Fri, 27 Oct 2023 13:03:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v5 8/8] media: v4l: subdev: Return NULL from pad access
 functions on error
Message-ID: <20231027100330.GN26306@pendragon.ideasonboard.com>
References: <20231027095913.1010187-1-sakari.ailus@linux.intel.com>
 <20231027095913.1010187-9-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231027095913.1010187-9-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Oct 27, 2023 at 12:59:13PM +0300, Sakari Ailus wrote:
> Return NULL from sub-device pad state access functions
> (v4l2_subdev_state_get_{format,crop,compose}) for non-existent pads. While
> this behaviour differs from older set of pad state information access
> functions, we've had a WARN_ON() there for a long time and callers also do
> validate the pad index nowadays. Therefore problems are not expected.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 36 +++++----------------------
>  1 file changed, 6 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index bae932134cfc..923a221955a9 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1684,16 +1684,8 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
>  		if (stream)
>  			return NULL;
>  
> -		/*
> -		 * Set the pad to 0 on error as this is aligned with the
> -		 * behaviour of the pad state information access functions. The
> -		 * purpose of setting pad to 0 here is to avoid accessing memory
> -		 * outside the pads array, but still issuing warning of the
> -		 * invalid access while making the caller's error handling
> -		 * easier.
> -		 */
> -		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
> -			pad = 0;
> +		if (pad >= state->sd->entity.num_pads)
> +			return NULL;
>  
>  		return &state->pads[pad].try_fmt;
>  	}
> @@ -1726,16 +1718,8 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
>  		if (stream)
>  			return NULL;
>  
> -		/*
> -		 * Set the pad to 0 on error as this is aligned with the
> -		 * behaviour of the pad state information access functions. The
> -		 * purpose of setting pad to 0 here is to avoid accessing memory
> -		 * outside the pads array, but still issuing warning of the
> -		 * invalid access while making the caller's error handling
> -		 * easier.
> -		 */
> -		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
> -			pad = 0;
> +		if (pad >= state->sd->entity.num_pads)
> +			return NULL;
>  
>  		return &state->pads[pad].try_crop;
>  	}
> @@ -1768,16 +1752,8 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>  		if (stream)
>  			return NULL;
>  
> -		/*
> -		 * Set the pad to 0 on error as this is aligned with the
> -		 * behaviour of the pad state information access functions. The
> -		 * purpose of setting pad to 0 here is to avoid accessing memory
> -		 * outside the pads array, but still issuing warning of the
> -		 * invalid access while making the caller's error handling
> -		 * easier.
> -		 */
> -		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
> -			pad = 0;
> +		if (pad >= state->sd->entity.num_pads)
> +			return NULL;
>  
>  		return &state->pads[pad].try_compose;
>  	}

-- 
Regards,

Laurent Pinchart
