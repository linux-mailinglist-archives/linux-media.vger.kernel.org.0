Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F349A4281B0
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 16:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbhJJOR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Oct 2021 10:17:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33702 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhJJORZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Oct 2021 10:17:25 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C71872FD;
        Sun, 10 Oct 2021 16:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633875326;
        bh=giusG1QrkmZ2pSDifDY07AYUH+SKTeUF2nn0odDyez0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T0sHx5pXCNFnF9P1W7bLmKky660g5szsFOs6u+D1frWFds6g1SjEBRtzs0/qax2Hw
         IMcLK/CNpdNmN2TSlRm19tnLWQLRN1Nu+3uElL26RrilBrkri3X5WVP3DRTeuuvstb
         OW+4gMr8qJ7fhf5MI/eb8CPj2QwFfdN1OiSTUKY4=
Date:   Sun, 10 Oct 2021 17:15:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v9 33/36] media: subdev: add "opposite" stream helper
 funcs
Message-ID: <YWL1cTmobr+RI/01@pendragon.ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-34-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005085750.138151-34-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Oct 05, 2021 at 11:57:47AM +0300, Tomi Valkeinen wrote:
> Add two helper functions to make dealing with streams easier:
> 
> v4l2_state_find_opposite_end - given a routing table and a pad + stream,
> return the pad + stream on the opposite side of the subdev.
> 
> v4l2_state_get_opposite_stream_format - return a pointer to the format
> on the pad + stream on the opposite side from the given pad + stream.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 42 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 32 ++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 37e2e1f907fc..9eeadad997c8 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1484,3 +1484,45 @@ v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
>  	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_state_get_stream_format);
> +
> +int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
> +				 u32 stream, u32 *other_pad, u32 *other_stream)

This function should take a state pointer given its name. I would also
rename it to v4l2_subdev_state_find_opposite_end(). Same for
v4l2_state_get_opposite_stream_format() which should be
v4l2_subdev_state_get_opposite_stream_format().

> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (route->source_pad == pad &&
> +		    route->source_stream == stream) {
> +			*other_pad = route->sink_pad;
> +			*other_stream = route->sink_stream;

Can we support other_stream being NULL ? When the subdev implements the
routing API without multiplexed streams, the other_stream number will
always be 0 and it would be nice if the caller didn't have to declare a
placeholder variable.

There are less use cases for other_pad being NULL, but maybe we could
also allow that for consistency reasons ? Up to you.

> +			return 0;
> +		}
> +
> +		if (route->sink_pad == pad && route->sink_stream == stream) {
> +			*other_pad = route->source_pad;
> +			*other_stream = route->source_stream;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_state_find_opposite_end);
> +
> +struct v4l2_mbus_framefmt *
> +v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
> +				      u32 stream)
> +{
> +	u32 other_pad, other_stream;
> +	int ret;
> +
> +	ret = v4l2_state_find_opposite_end(&state->routing, pad, stream,
> +					   &other_pad, &other_stream);
> +	if (ret)
> +		return NULL;
> +
> +	return v4l2_state_get_stream_format(state, other_pad, other_stream);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_state_get_opposite_stream_format);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1dc824416c1b..4b9520410783 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1501,4 +1501,36 @@ struct v4l2_mbus_framefmt *
>  v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
>  			     u32 stream);
>  
> +/**
> + * v4l2_state_find_opposite_end() - Find the opposite stream
> + * @routing: routing used to find the opposite side
> + * @pad: pad id
> + * @stream: stream id
> + * @other_pad: pointer used to return the opposite pad
> + * @other_stream: pointer used to return the opposite stream
> + *
> + * This function uses the routing table to find the pad + stream which is
> + * opposite the given pad + stream.
> + *
> + * Returns 0 on success, or -EINVAL if no matching route is found.
> + */
> +int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
> +				 u32 stream, u32 *other_pad, u32 *other_stream);
> +
> +/**
> + * v4l2_state_get_opposite_stream_format() - Get pointer to opposite stream
> + *					     format
> + * @state: subdevice state
> + * @pad: pad id
> + * @stream: stream id
> + *
> + * This returns a pointer to &struct v4l2_mbus_framefmt for the pad + stream
> + * that is opposite the given pad + stream in the subdev state.
> + *
> + * If the state does not contain the given pad + stream, NULL is returned.
> + */
> +struct v4l2_mbus_framefmt *
> +v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
> +				      u32 stream);
> +
>  #endif

-- 
Regards,

Laurent Pinchart
