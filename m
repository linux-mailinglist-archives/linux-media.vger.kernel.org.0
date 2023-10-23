Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8BB7D4288
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 00:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbjJWWEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 18:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjJWWEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 18:04:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEA1DE
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 15:04:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04C11AE;
        Tue, 24 Oct 2023 00:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698098661;
        bh=DHQN9FjWU0IMJm1FM1HF2LbQEv6M8dFkYeNWFhvx97Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dCqRHVx8/guEk31Rr4e+IGri1ghQenhksmt57Fr8q7IpiREBcXq+tojDoAnvnLTFT
         ubZWBtbDqDTBXtWZLojAizC7AEUt1zhY4gBsLUGE79hZHCpY4YQlP1quICybvfbVLq
         BrpDkoWQl/LWEWiguMUoY56MWDSGzTlNFEALCvqE=
Date:   Tue, 24 Oct 2023 01:04:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 1/8] media: v4l: subdev: Store the sub-device in the
 sub-device state
Message-ID: <20231023220439.GC18687@pendragon.ideasonboard.com>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023174408.803874-2-sakari.ailus@linux.intel.com>
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

On Mon, Oct 23, 2023 at 08:44:01PM +0300, Sakari Ailus wrote:
> Store the sub-device in the sub-device state. This will be needed in e.g.
> validating pad number when retrieving information for non-stream-aware
> users. There are expected to be more needs for this in the future.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
>  include/media/v4l2-subdev.h           | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index d295a4e87b66..ee4fe8f33a41 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1441,6 +1441,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>  	else
>  		state->lock = &state->_lock;
>  
> +	state->sd = sd;
> +
>  	/* Drivers that support streams do not need the legacy pad config */
>  	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS) && sd->entity.num_pads) {
>  		state->pads = kvcalloc(sd->entity.num_pads,
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index c1f90c1223a7..6a02a565035c 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -756,6 +756,7 @@ struct v4l2_subdev_krouting {
>   *
>   * @_lock: default for 'lock'
>   * @lock: mutex for the state. May be replaced by the user.
> + * @sd: the sub-device which the state is related to
>   * @pads: &struct v4l2_subdev_pad_config array
>   * @routing: routing table for the subdev
>   * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_STREAMS)
> @@ -768,6 +769,7 @@ struct v4l2_subdev_state {
>  	/* lock for the struct v4l2_subdev_state fields */
>  	struct mutex _lock;
>  	struct mutex *lock;
> +	struct v4l2_subdev *sd;
>  	struct v4l2_subdev_pad_config *pads;
>  	struct v4l2_subdev_krouting routing;
>  	struct v4l2_subdev_stream_configs stream_configs;

-- 
Regards,

Laurent Pinchart
