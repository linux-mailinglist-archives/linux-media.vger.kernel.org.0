Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F266E7C83FE
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjJMLEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjJMLEg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:04:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93766BD
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:04:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49B14480;
        Fri, 13 Oct 2023 13:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697195069;
        bh=wYrfjimePrNiv3EN9MaGDKAnw42Gt3KOHj7Ixkwo4Nc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gaVssAC4NS4ceVph5fC7sNTyVIeYPj1JaQvukpkgRh1sF68Gcy6MFO/XuHCHrr39v
         xul2giR2IwCMr8is/Kg2FxMzSVMWykHDs34vfpQJrRnETrWrYa7jHeNiPG5P1n1dLe
         Jb/XBN8cHbsaWC+uDsnHwdhGyowaQL8Dk3pNltDs=
Date:   Fri, 13 Oct 2023 14:04:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 3/6] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <20231013110439.GB11101@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231013104424.404768-4-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Oct 13, 2023 at 01:44:21PM +0300, Sakari Ailus wrote:
> Rename the sub-devices state information access functions, removing
> "_state" and "_stream" from them. This makes them shorter and so more
> convenient to use. No other functions will be needed to access this
> information.

The new names are too generic, and thus confusing. For instance,
v4l2_subdev_get_format() is way too close to v4l2_subdev_get_fmt(). I'm
fine dropping "_stream", but I would like to keep "_state".

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 27 +++++++++++++-------------
>  include/media/v4l2-subdev.h           | 28 ++++++++++++++-------------
>  2 files changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 7d0ce8c8aab4..a522cd8096cf 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -177,7 +177,7 @@ static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  {
>  	if (sd->flags & V4L2_SUBDEV_FL_STREAMS) {
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> -		if (!v4l2_subdev_state_get_stream_format(state, pad, stream))
> +		if (!v4l2_subdev_get_format(state, pad, stream))
>  			return -EINVAL;
>  		return 0;
>  #else
> @@ -1581,8 +1581,8 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  	struct v4l2_mbus_framefmt *fmt;
>  
>  	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> -		fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> -							  format->stream);
> +		fmt = v4l2_subdev_get_format(state, format->pad,
> +					     format->stream);
>  	else if (format->pad < sd->entity.num_pads && format->stream == 0)
>  		fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
>  	else
> @@ -1678,8 +1678,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
>  
>  struct v4l2_mbus_framefmt *
> -v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> -				    unsigned int pad, u32 stream)
> +v4l2_subdev_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> +		       u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1709,11 +1709,11 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_format);
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_format);
>  
>  struct v4l2_rect *
> -v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
> -				  unsigned int pad, u32 stream)
> +v4l2_subdev_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> +		     u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1743,11 +1743,11 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_crop);
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_crop);
>  
>  struct v4l2_rect *
> -v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
> -				     unsigned int pad, u32 stream)
> +v4l2_subdev_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> +			u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1777,7 +1777,7 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_compose);
>  
>  int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
>  					  u32 pad, u32 stream, u32 *other_pad,
> @@ -1823,8 +1823,7 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
>  	if (ret)
>  		return NULL;
>  
> -	return v4l2_subdev_state_get_stream_format(state, other_pad,
> -						   other_stream);
> +	return v4l2_subdev_get_format(state, other_pad, other_stream);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
>  
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 5e5499a2fb0e..a5b819a3be1c 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1542,7 +1542,7 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>  				     const struct v4l2_mbus_framefmt *fmt);
>  
>  /**
> - * v4l2_subdev_state_get_stream_format() - Get pointer to a stream format
> + * v4l2_subdev_get_format() - Get pointer to a stream format
>   * @state: subdevice state
>   * @pad: pad id
>   * @stream: stream id
> @@ -1550,14 +1550,15 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>   * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
>   * stream in the subdev state.
>   *
> - * If the state does not contain the given pad + stream, NULL is returned.
> + * For stream-unaware drivers the format for the corresponding pad is returned.
> + * If the pad does not exist, NULL is returned.
>   */
>  struct v4l2_mbus_framefmt *
> -v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> -				    unsigned int pad, u32 stream);
> +v4l2_subdev_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> +		       u32 stream);
>  
>  /**
> - * v4l2_subdev_state_get_stream_crop() - Get pointer to a stream crop rectangle
> + * v4l2_subdev_get_crop() - Get pointer to a stream crop rectangle
>   * @state: subdevice state
>   * @pad: pad id
>   * @stream: stream id
> @@ -1565,15 +1566,15 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>   * This returns a pointer to crop rectangle for the given pad + stream in the
>   * subdev state.
>   *
> - * If the state does not contain the given pad + stream, NULL is returned.
> + * For stream-unaware drivers the crop rectangle for the corresponding pad is
> + * returned. If the pad does not exist, NULL is returned.
>   */
>  struct v4l2_rect *
> -v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
> -				  unsigned int pad, u32 stream);
> +v4l2_subdev_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> +		     u32 stream);
>  
>  /**
> - * v4l2_subdev_state_get_stream_compose() - Get pointer to a stream compose
> - *					    rectangle
> + * v4l2_subdev_get_compose() - Get pointer to a stream compose rectangle
>   * @state: subdevice state
>   * @pad: pad id
>   * @stream: stream id
> @@ -1581,11 +1582,12 @@ v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
>   * This returns a pointer to compose rectangle for the given pad + stream in the
>   * subdev state.
>   *
> - * If the state does not contain the given pad + stream, NULL is returned.
> + * For stream-unaware drivers the compose rectangle for the corresponding pad is
> + * returned. If the pad does not exist, NULL is returned.
>   */
>  struct v4l2_rect *
> -v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
> -				     unsigned int pad, u32 stream);
> +v4l2_subdev_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> +			u32 stream);
>  
>  /**
>   * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream

-- 
Regards,

Laurent Pinchart
