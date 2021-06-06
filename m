Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC61439CBC9
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 02:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhFFADa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 20:03:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50014 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhFFAD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 20:03:29 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06D6E3E7;
        Sun,  6 Jun 2021 02:01:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622937700;
        bh=Lo79EMvNbTjxbiu8vMdtIoXt3zCHoe//AIT2RqhJ9PI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tWTtpbTsLeuPkCs2ryOEpMvBQ8LZ0rpCVJ/b6FtHGBTeU/hDoWYpdFHCcxs42sOxk
         gxneUVLd1vWQnf+dm6FUttzoSUxPfsLjajUyA72LuVYq/3u+AdE8jGNR9WG46XuU6u
         JizfeMlK0asDpVU7JF7EdgP2CHh419a95+Y/kG2s=
Date:   Sun, 6 Jun 2021 03:01:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 25/27] v4l: subdev: add routing & stream config to
 v4l2_subdev_state
Message-ID: <YLwQVl7i7IBNVvMl@pendragon.ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-26-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524104408.599645-26-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 01:44:06PM +0300, Tomi Valkeinen wrote:
> Add routing and stream_configs to struct v4l2_subdev_state. This lets
> the drivers to implement V4L2_SUBDEV_FORMAT_TRY support for routing and
> the stream configurations.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 3 +++
>  include/media/v4l2-subdev.h           | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b30b456d8d99..13cffe9d9b89 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1227,6 +1227,9 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
>  
>  void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
>  {
> +	v4l2_subdev_free_routing(&state->routing);
> +	v4l2_uninit_stream_configs(&state->stream_configs);
> +
>  	kvfree(state->pads);
>  	kvfree(state);
>  }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 39c6b811463a..973db58c2d9b 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -712,6 +712,8 @@ struct v4l2_subdev_krouting {
>   * struct v4l2_subdev_state - Used for storing subdev information.
>   *
>   * @pads: &struct v4l2_subdev_pad_config array
> + * @routing: routing table for the subdev
> + * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_MULTIPLEXED)
>   *
>   * This structure only needs to be passed to the pad op if the 'which' field
>   * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
> @@ -719,6 +721,8 @@ struct v4l2_subdev_krouting {
>   */
>  struct v4l2_subdev_state {
>  	struct v4l2_subdev_pad_config *pads;
> +	struct v4l2_subdev_krouting routing;
> +	struct v4l2_subdev_stream_configs stream_configs;

stream_configs duplicates the information contained in pads. This is
possibly acceptable for the time being, but needs to be abstracted from
drivers completely.

>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
