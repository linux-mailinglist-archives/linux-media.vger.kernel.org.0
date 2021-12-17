Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57A34786DE
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 10:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbhLQJQK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 04:16:10 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33865 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbhLQJQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 04:16:10 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1FA1FE0008;
        Fri, 17 Dec 2021 09:16:06 +0000 (UTC)
Date:   Fri, 17 Dec 2021 10:17:00 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/2] media: subdev: Rename v4l2_state_get_stream_format()
 with subdev prefix
Message-ID: <20211217091700.ml5hgw46vzogzyrh@uno.localdomain>
References: <20211216131510.12308-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211216131510.12308-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211216131510.12308-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Dec 16, 2021 at 03:15:09PM +0200, Laurent Pinchart wrote:
> The v4l2_state_get_stream_format() function operates on a subdev state,
> rename it accordingly to v4l2_subdev_state_get_stream_format().

No need for a formal ack as I assume this will go in Tomi's v11 (if he
likes the patch ofc).

But in any case, it makes sense to me
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++------
>  include/media/v4l2-subdev.h           |  6 +++---
>  2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index dca2bea180ec..73ee7f01838f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -179,7 +179,7 @@ static int check_state_pad_stream(struct v4l2_subdev *sd,
>  	 */
>  	v4l2_subdev_lock_state(state);
>
> -	fmt = v4l2_state_get_stream_format(state, pad, stream);
> +	fmt = v4l2_subdev_state_get_stream_format(state, pad, stream);
>
>  	v4l2_subdev_unlock_state(state);
>
> @@ -1492,8 +1492,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
>
>  struct v4l2_mbus_framefmt *
> -v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
> -			     u32 stream)
> +v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> +				    unsigned int pad, u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1510,7 +1510,7 @@ v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
>
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_state_get_stream_format);
> +EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_format);
>
>  int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
>  					  u32 pad, u32 stream, u32 *other_pad,
> @@ -1555,7 +1555,8 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>  	if (ret)
>  		return NULL;
>
> -	return v4l2_state_get_stream_format(state, other_pad, other_stream);
> +	return v4l2_subdev_state_get_stream_format(state, other_pad,
> +						   other_stream);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
>
> @@ -1566,7 +1567,8 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>
>  	v4l2_subdev_lock_state(state);
>
> -	fmt = v4l2_state_get_stream_format(state, format->pad, format->stream);
> +	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> +						  format->stream);
>  	if (!fmt) {
>  		v4l2_subdev_unlock_state(state);
>  		return -EINVAL;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 9754913b34f8..aff1fb3a30d5 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1505,7 +1505,7 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>  				     const struct v4l2_mbus_framefmt *fmt);
>
>  /**
> - * v4l2_state_get_stream_format() - Get pointer to a stream format
> + * v4l2_subdev_state_get_stream_format() - Get pointer to a stream format
>   * @state: subdevice state
>   * @pad: pad id
>   * @stream: stream id
> @@ -1516,8 +1516,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>   * If the state does not contain the given pad + stream, NULL is returned.
>   */
>  struct v4l2_mbus_framefmt *
> -v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
> -			     u32 stream);
> +v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> +				    unsigned int pad, u32 stream);
>
>  /**
>   * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
> --
> Regards,
>
> Laurent Pinchart
>
