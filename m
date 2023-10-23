Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD5907D4297
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 00:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjJWWOt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 18:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjJWWOt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 18:14:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4923899
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 15:14:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B0E0AE;
        Tue, 24 Oct 2023 00:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698099275;
        bh=QHXgc/fL1TGV4S48UO9CoYEmLI4OvGrHjIsEK4odmUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qr5NISEslvJb55rPWBIbofMXdxF6w5KEAPX7G/0Tp4AMD3xyzN+BQzCG5pyPK/uvF
         ZS8s0psfhiRIVFkcxfTIYqbVhgaDRa2GpjAg/TVMuSSFMecZ5SxWOog0dLe8hvlu3x
         8H5zQpHlcmvLwYu//qQ8WXYd2eQBnBrvAX89hQkw=
Date:   Tue, 24 Oct 2023 01:14:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 8/8] media: v4l: subdev: Also assert acquired mutex
 for non-stream drivers
Message-ID: <20231023221453.GG18687@pendragon.ideasonboard.com>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-9-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023174408.803874-9-sakari.ailus@linux.intel.com>
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

On Mon, Oct 23, 2023 at 08:44:08PM +0300, Sakari Ailus wrote:
> Assert mutex is taken by drivers that are not stream-aware.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Do you expect the assertions to trigger ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e35226587244..8d079ad3287e 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1680,6 +1680,8 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
>  	if (WARN_ON(!state))
>  		return NULL;
>  
> +	lockdep_assert_held(state->lock);
> +
>  	if (state->pads) {
>  		if (stream)
>  			return NULL;
> @@ -1690,8 +1692,6 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
>  		return &state->pads[pad].try_fmt;
>  	}
>  
> -	lockdep_assert_held(state->lock);
> -
>  	stream_configs = &state->stream_configs;
>  
>  	for (i = 0; i < stream_configs->num_configs; ++i) {
> @@ -1714,6 +1714,8 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
>  	if (WARN_ON(!state))
>  		return NULL;
>  
> +	lockdep_assert_held(state->lock);
> +
>  	if (state->pads) {
>  		if (stream)
>  			return NULL;
> @@ -1724,8 +1726,6 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
>  		return &state->pads[pad].try_crop;
>  	}
>  
> -	lockdep_assert_held(state->lock);
> -
>  	stream_configs = &state->stream_configs;
>  
>  	for (i = 0; i < stream_configs->num_configs; ++i) {
> @@ -1748,6 +1748,8 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>  	if (WARN_ON(!state))
>  		return NULL;
>  
> +	lockdep_assert_held(state->lock);
> +
>  	if (state->pads) {
>  		if (stream)
>  			return NULL;
> @@ -1758,8 +1760,6 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>  		return &state->pads[pad].try_compose;
>  	}
>  
> -	lockdep_assert_held(state->lock);
> -
>  	stream_configs = &state->stream_configs;
>  
>  	for (i = 0; i < stream_configs->num_configs; ++i) {

-- 
Regards,

Laurent Pinchart
