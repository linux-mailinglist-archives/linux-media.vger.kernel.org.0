Return-Path: <linux-media+bounces-569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB47F0227
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 20:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FC95B20AC6
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 19:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980821BDC2;
	Sat, 18 Nov 2023 19:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VW2wAZLz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9F984
	for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 11:02:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDE18DA7;
	Sat, 18 Nov 2023 20:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700334095;
	bh=9WJZygef/ik6ojpUEGF3hyagDw/5aOZZLxAnUdZokmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VW2wAZLz7NlDVFieUqsjKm7KH2JOmR/nnXcJ9EaP1lC6+DVKukiV1Pr4hatcaaEV1
	 NTxmYemVULzYGlNXALLXl/uL+VNIpP1VeYcVIqPtTPv8keWxhqsJbmfLe3xr5LMi8b
	 8ObfuyxApnLuWLJqMkTx+gyMEAnlabxzEPUSAKGs=
Date: Sat, 18 Nov 2023 21:02:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 9/9] media: v4l: subdev: Return NULL from pad access
 functions on error
Message-ID: <20231118190209.GB28790@pendragon.ideasonboard.com>
References: <20231117101140.1338288-1-sakari.ailus@linux.intel.com>
 <20231117101140.1338288-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231117101140.1338288-10-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Nov 17, 2023 at 12:11:39PM +0200, Sakari Ailus wrote:
> Return NULL from sub-device pad state access functions
> (v4l2_subdev_state_get_{format,crop,compose}) for non-existent pads. While
> this behaviour differs from older set of pad state information access
> functions, we've had a WARN_ON() there for a long time and callers also do
> validate the pad index nowadays. Therefore problems are not expected.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 36 +++++----------------------
>  1 file changed, 6 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 41fe9fa5c21a..985873b7981e 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1545,16 +1545,8 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
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
>  		return &state->pads[pad].format;
>  	}
> @@ -1587,16 +1579,8 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
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
>  		return &state->pads[pad].crop;
>  	}
> @@ -1629,16 +1613,8 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
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
>  		return &state->pads[pad].compose;
>  	}

-- 
Regards,

Laurent Pinchart

