Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5E87D429A
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 00:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjJWWPf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 18:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjJWWPe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 18:15:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F5DA6
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 15:15:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9E61AE;
        Tue, 24 Oct 2023 00:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698099320;
        bh=2TspKdW4I9qbz6E9V6HA4F2tlq0DYyyR4mTifKr1sQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vzv4QCOTnEU9Rsh6mSjgHbWw3Y0EYSDfGoievFVjaCGP+XSevwy7/+AexjJCgKPHH
         MnFIMD4CH+/gfHW2RPnDB1S5tDQnEw63WZ5zo3R8BGiOCJbD80BcPRI7qpG4KTgatC
         Q0mD17V8fzkbw5tbtTlhJFIVOIWxBSIClSIhu4p4=
Date:   Tue, 24 Oct 2023 01:15:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 5/8] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <20231023221537.GH18687@pendragon.ideasonboard.com>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023174408.803874-6-sakari.ailus@linux.intel.com>
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

On Mon, Oct 23, 2023 at 08:44:05PM +0300, Sakari Ailus wrote:
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
> index 71cb35133b4a..12eb0fe746d7 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1545,7 +1545,7 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>   * v4l2_subdev_state_get_format() - Get pointer to a stream format
>   * @state: subdevice state
>   * @pad: pad id
> - * @stream: stream id
> + * @...: stream id (optional argument)

Not great, but I suppose we can't do better :-S

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
>  
>  /**
>   * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
>   * @state: subdevice state
>   * @pad: pad id
> - * @stream: stream id
> + * @...: stream id (optional argument)
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
> + * @...: stream id (optional argument)
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
