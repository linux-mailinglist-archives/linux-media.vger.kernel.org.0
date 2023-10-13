Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C357C83D3
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 12:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjJMK5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 06:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjJMK5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 06:57:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA58C83
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 03:57:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C93C08C;
        Fri, 13 Oct 2023 12:57:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697194659;
        bh=e85oy1PMzdC0ZtawC5wuutGrQpgGf5WMOmdYRrEYpME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nP4rvwOp2CFXdK98qPaGuFbKB3nDCZYEgzlRJcRu/ICDTIOlMxJF6JVVB955wKoWG
         tVDLlOIO5rEg6lA4Acx7p41evXJ1X5NPURoybSEEe+jY6ALVGHj476I90vCtf4DAsk
         DbofUR8wcus2CULU6W++o80DrcEX37aJ31Prdja4=
Date:   Fri, 13 Oct 2023 13:57:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 1/6] media: v4l: subdev: Store the number of pads in
 sub-device state
Message-ID: <20231013105749.GA11101@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231013104424.404768-2-sakari.ailus@linux.intel.com>
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

On Fri, Oct 13, 2023 at 01:44:19PM +0300, Sakari Ailus wrote:
> Store the number of pads in the sub-device state. This will be needed to
> validate pad when retrieving information for non-stream-aware users.

I'd rather store a pointer to the subdev. You can get the number of pads
from there.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
>  include/media/v4l2-subdev.h           | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index d295a4e87b66..52a8043ab556 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1441,6 +1441,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>  	else
>  		state->lock = &state->_lock;
>  
> +	state->num_pads = sd->entity.num_pads;
> +
>  	/* Drivers that support streams do not need the legacy pad config */
>  	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS) && sd->entity.num_pads) {
>  		state->pads = kvcalloc(sd->entity.num_pads,
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index c1f90c1223a7..5e5499a2fb0e 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -756,6 +756,7 @@ struct v4l2_subdev_krouting {
>   *
>   * @_lock: default for 'lock'
>   * @lock: mutex for the state. May be replaced by the user.
> + * @num_pads: the number of entries in the pads array
>   * @pads: &struct v4l2_subdev_pad_config array
>   * @routing: routing table for the subdev
>   * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_STREAMS)
> @@ -768,6 +769,7 @@ struct v4l2_subdev_state {
>  	/* lock for the struct v4l2_subdev_state fields */
>  	struct mutex _lock;
>  	struct mutex *lock;
> +	unsigned int num_pads;
>  	struct v4l2_subdev_pad_config *pads;
>  	struct v4l2_subdev_krouting routing;
>  	struct v4l2_subdev_stream_configs stream_configs;

-- 
Regards,

Laurent Pinchart
