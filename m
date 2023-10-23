Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087257D3898
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 15:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjJWN5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 09:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjJWN5y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 09:57:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E1EC2
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 06:57:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AE0CD20;
        Mon, 23 Oct 2023 15:57:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698069460;
        bh=FAC9DmKiU2klOSZQZOQIgSjWwXepNI85jw6PMFKExR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tyhKGt73ODRItM8x4y5mj9NszVfMBX1pcI6RCsrVnqM+4vGeGXqZFvy6TvOrNHfb3
         Nuxk3TL39XHvUoaX8sqKqzE0VJP3ObqnL+kGI/vSnPLyQh0vGUwZX58JMigXYPo3rf
         fy9PmnzhMc/CsXSHOoWXy2e51B3JrGJwuz43Lam8=
Date:   Mon, 23 Oct 2023 16:57:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 4/6] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <20231023135758.GA13234@pendragon.ideasonboard.com>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023123308.782592-5-sakari.ailus@linux.intel.com>
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

On Mon, Oct 23, 2023 at 03:33:06PM +0300, Sakari Ailus wrote:
> The sub-device state access functions take three arguments: sub-device
> state, pad and stream. The stream is not relevant for the majority of
> drivers and having to specify 0 for the stream is considered a nuisance.
> 
> Provide a two-argument macros for these state access functions to cover
> the needs of stream-unaware users.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++-------
>  include/media/v4l2-subdev.h           | 39 ++++++++++++++++++++-------
>  2 files changed, 39 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index f0f0af48730f..e35226587244 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1671,8 +1671,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
>  
>  struct v4l2_mbus_framefmt *
> -v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> -			     u32 stream)
> +__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> +			       unsigned int pad, u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1702,11 +1702,11 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_format);
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
>  
>  struct v4l2_rect *
> -v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> -			   u32 stream)
> +__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> +			     u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1736,11 +1736,11 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_crop);
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
>  
>  struct v4l2_rect *
> -v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> -			      u32 stream)
> +__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> +				unsigned int pad, u32 stream)
>  {
>  	struct v4l2_subdev_stream_configs *stream_configs;
>  	unsigned int i;
> @@ -1770,7 +1770,7 @@ v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
>  
>  	return NULL;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_compose);
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
>  
>  int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
>  					  u32 pad, u32 stream, u32 *other_pad,
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 71cb35133b4a..130057545b1a 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1545,7 +1545,7 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>   * v4l2_subdev_state_get_format() - Get pointer to a stream format
>   * @state: subdevice state
>   * @pad: pad id
> - * @stream: stream id
> + * @stream: stream id (optional argument)
>   *
>   * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
>   * stream in the subdev state.
> @@ -1553,15 +1553,22 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>   * For stream-unaware drivers the format for the corresponding pad is returned.
>   * If the pad does not exist, NULL is returned.
>   */
> +#define v4l2_subdev_state_get_format(state, pad, ...)         \
> +        __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
> +        (state, pad __VA_OPT__(,) __VA_ARGS__)
> +#define __v4l2_subdev_state_get_format_(state, pad)     \
> +        __v4l2_subdev_state_get_format(state, pad, 0)
> +#define __v4l2_subdev_state_get_format_stream(state, pad, stream)	\
> +        __v4l2_subdev_state_get_format(state, pad, stream)
>  struct v4l2_mbus_framefmt *
> -v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> -			     u32 stream);
> +__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> +			       unsigned int pad, u32 stream);

This causes warning in the documentation build:

include/media/v4l2-subdev.h:1479: warning: Excess function parameter 'stream' description in 'v4l2_subdev_state_get_format'
include/media/v4l2-subdev.h:1502: warning: Excess function parameter 'stream' description in 'v4l2_subdev_state_get_crop'
include/media/v4l2-subdev.h:1525: warning: Excess function parameter 'stream' description in 'v4l2_subdev_state_get_compose'

>  
>  /**
>   * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
>   * @state: subdevice state
>   * @pad: pad id
> - * @stream: stream id
> + * @stream: stream id (optional argument)
>   *
>   * This returns a pointer to crop rectangle for the given pad + stream in the
>   * subdev state.
> @@ -1569,15 +1576,22 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
>   * For stream-unaware drivers the crop rectangle for the corresponding pad is
>   * returned. If the pad does not exist, NULL is returned.
>   */
> +#define v4l2_subdev_state_get_crop(state, pad, ...)         \
> +        __v4l2_subdev_state_get_crop_ ## __VA_OPT__(stream) \
> +        (state, pad __VA_OPT__(,) __VA_ARGS__)
> +#define __v4l2_subdev_state_get_crop_(state, pad)	\
> +        __v4l2_subdev_state_get_crop(state, pad, 0)
> +#define __v4l2_subdev_state_get_crop_stream(state, pad, stream)	\
> +        __v4l2_subdev_state_get_crop(state, pad, stream)
>  struct v4l2_rect *
> -v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> -			   u32 stream);
> +__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> +			     u32 stream);
>  
>  /**
>   * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
>   * @state: subdevice state
>   * @pad: pad id
> - * @stream: stream id
> + * @stream: stream id (optional argument)
>   *
>   * This returns a pointer to compose rectangle for the given pad + stream in the
>   * subdev state.
> @@ -1585,9 +1599,16 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
>   * For stream-unaware drivers the compose rectangle for the corresponding pad is
>   * returned. If the pad does not exist, NULL is returned.
>   */
> +#define v4l2_subdev_state_get_compose(state, pad, ...)         \
> +        __v4l2_subdev_state_get_compose_ ## __VA_OPT__(stream) \
> +        (state, pad __VA_OPT__(,) __VA_ARGS__)
> +#define __v4l2_subdev_state_get_compose_(state, pad)	\
> +        __v4l2_subdev_state_get_compose(state, pad, 0)
> +#define __v4l2_subdev_state_get_compose_stream(state, pad, stream)	\
> +        __v4l2_subdev_state_get_compose(state, pad, stream)
>  struct v4l2_rect *
> -v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> -			      u32 stream);
> +__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> +				unsigned int pad, u32 stream);
>  
>  /**
>   * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream

-- 
Regards,

Laurent Pinchart
