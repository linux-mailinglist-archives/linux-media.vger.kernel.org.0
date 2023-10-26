Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C947D83F0
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 15:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345130AbjJZNzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 09:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345125AbjJZNzN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 09:55:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F66D183
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 06:55:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 928E083B;
        Thu, 26 Oct 2023 15:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698328497;
        bh=AKD52Dr5HVb0Rman+hkm1acNdEBSbjqfsWIf5xVv9Zk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F/brW6Sv0y+wkBDogtsLvSdk+VKG3oc5IBOhruaZ1XQIZgC92KJDi1KItgpiELZFp
         +WWsnqUkC0aRqEC1WkaO0Voqwih4OxQw0irMfQ/vHyTy9fS8k2uJr2V7ouu/TfuFO2
         QdNhF6s4mOwC+HuVH3f9T9juktVBoSFME+9T/eEI=
Date:   Thu, 26 Oct 2023 16:55:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 8/9] media: v4l: subdev: Return NULL from pad access
 functions on error
Message-ID: <20231026135516.GF26306@pendragon.ideasonboard.com>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-9-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231026070329.948847-9-sakari.ailus@linux.intel.com>
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

On Thu, Oct 26, 2023 at 10:03:28AM +0300, Sakari Ailus wrote:
> Return NULL from sub-device pad state access functions
> (v4l2_subdev_state_get_{format,crop,compose}) for non-existent pads. While
> this behaviour differs from older set of pad state information access
> functions, we've had a WARN_ON() there for a long time and callers also do
> validate the pad index nowadays. Therefore problems are not expected.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 9d4ff9b4fcec..bd0d89c2996f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1684,12 +1684,8 @@ __v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
>  		if (stream)
>  			return NULL;
>  
> -		/*
> -		 * Set the pad to 0 on error as this is aligned with the
> -		 * behaviour of the pad state information access functions.
> -		 */
>  		if (WARN_ON(pad >= state->sd->entity.num_pads))
> -			pad = 0;
> +			return NULL;
>  
>  		return &state->pads[pad].try_fmt;
>  	}
> @@ -1722,12 +1718,8 @@ __v4l2_subdev_state_get_crop_stream(struct v4l2_subdev_state *state,
>  		if (stream)
>  			return NULL;
>  
> -		/*
> -		 * Set the pad to 0 on error as this is aligned with the
> -		 * behaviour of the pad state information access functions.
> -		 */
>  		if (WARN_ON(pad >= state->sd->entity.num_pads))
> -			pad = 0;
> +			return NULL;
>  
>  		return &state->pads[pad].try_crop;
>  	}
> @@ -1760,12 +1752,8 @@ __v4l2_subdev_state_get_compose_stream(struct v4l2_subdev_state *state,
>  		if (stream)
>  			return NULL;
>  
> -		/*
> -		 * Set the pad to 0 on error as this is aligned with the
> -		 * behaviour of the pad state information access functions.
> -		 */
>  		if (WARN_ON(pad >= state->sd->entity.num_pads))
> -			pad = 0;
> +			return NULL;
>  
>  		return &state->pads[pad].try_compose;
>  	}

-- 
Regards,

Laurent Pinchart
