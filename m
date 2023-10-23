Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37477D4296
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 00:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjJWWOP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 18:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjJWWOO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 18:14:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BBB99
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 15:14:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D05BFAE;
        Tue, 24 Oct 2023 00:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698099241;
        bh=sB4i2d+A0XRJduCCGb1dRzbF1S9m4jUsIhMxj4uYR2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bYWtquf/E8KqJawDWk1peYtS1Pr+k/zVVqSv2y8bH5c2qfGOYe4Bv8RPs2d/EQJhK
         iCtXhSibVxGuNPMqp36zEVxSb8N05DxxZ81/kTqPNux8T/f/Tc025V3NMn7IZUDcjz
         A7blvKQVAX2PAAiUprhI4Avs5bjJoiQm41rK5Mw4=
Date:   Tue, 24 Oct 2023 01:14:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 7/8] media: v4l: subdev: Remove stream-unaware
 sub-device state access
Message-ID: <20231023221419.GF18687@pendragon.ideasonboard.com>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-8-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023174408.803874-8-sakari.ailus@linux.intel.com>
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

On Mon, Oct 23, 2023 at 08:44:07PM +0300, Sakari Ailus wrote:
> Remove stream-unaware sub-device state access functions and macros. These
> are no longer used.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/v4l2-subdev.h | 77 -------------------------------------
>  1 file changed, 77 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 12eb0fe746d7..24a0add93e6e 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1144,83 +1144,6 @@ struct v4l2_subdev_fh {
>  #define to_v4l2_subdev_fh(fh)	\
>  	container_of(fh, struct v4l2_subdev_fh, vfh)
>  
> -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> -
> -/**
> - * v4l2_subdev_get_pad_format - ancillary routine to call
> - *	&struct v4l2_subdev_pad_config->try_fmt
> - *
> - * @sd: pointer to &struct v4l2_subdev
> - * @state: pointer to &struct v4l2_subdev_state
> - * @pad: index of the pad in the &struct v4l2_subdev_state->pads array
> - */
> -static inline struct v4l2_mbus_framefmt *
> -v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
> -			   struct v4l2_subdev_state *state,
> -			   unsigned int pad)
> -{
> -	if (WARN_ON(!state))
> -		return NULL;
> -	if (WARN_ON(pad >= sd->entity.num_pads))
> -		pad = 0;
> -	return &state->pads[pad].try_fmt;
> -}
> -
> -/**
> - * v4l2_subdev_get_pad_crop - ancillary routine to call
> - *	&struct v4l2_subdev_pad_config->try_crop
> - *
> - * @sd: pointer to &struct v4l2_subdev
> - * @state: pointer to &struct v4l2_subdev_state.
> - * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
> - */
> -static inline struct v4l2_rect *
> -v4l2_subdev_get_pad_crop(struct v4l2_subdev *sd,
> -			 struct v4l2_subdev_state *state,
> -			 unsigned int pad)
> -{
> -	if (WARN_ON(!state))
> -		return NULL;
> -	if (WARN_ON(pad >= sd->entity.num_pads))
> -		pad = 0;
> -	return &state->pads[pad].try_crop;
> -}
> -
> -/**
> - * v4l2_subdev_get_pad_compose - ancillary routine to call
> - *	&struct v4l2_subdev_pad_config->try_compose
> - *
> - * @sd: pointer to &struct v4l2_subdev
> - * @state: pointer to &struct v4l2_subdev_state.
> - * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
> - */
> -static inline struct v4l2_rect *
> -v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
> -			    struct v4l2_subdev_state *state,
> -			    unsigned int pad)
> -{
> -	if (WARN_ON(!state))
> -		return NULL;
> -	if (WARN_ON(pad >= sd->entity.num_pads))
> -		pad = 0;
> -	return &state->pads[pad].try_compose;
> -}
> -
> -/*
> - * Temprary helpers until uses of v4l2_subdev_get_try_* functions have been
> - * renamed
> - */
> -#define v4l2_subdev_get_try_format(sd, state, pad) \
> -	v4l2_subdev_get_pad_format(sd, state, pad)
> -
> -#define v4l2_subdev_get_try_crop(sd, state, pad) \
> -	v4l2_subdev_get_pad_crop(sd, state, pad)
> -
> -#define v4l2_subdev_get_try_compose(sd, state, pad) \
> -	v4l2_subdev_get_pad_compose(sd, state, pad)
> -
> -#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> -
>  extern const struct v4l2_file_operations v4l2_subdev_fops;
>  
>  /**

-- 
Regards,

Laurent Pinchart
