Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA3E4B934B
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 22:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbiBPVjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 16:39:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiBPVjJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 16:39:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BC628DDC7
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 13:38:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8A0825B;
        Wed, 16 Feb 2022 22:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645047531;
        bh=PGlXL/Pq3OP1KrAdzVpY8BRkfR6vmAEjXFpvSgvs62U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TB0MhvZtnUnqy/ko+HqeWODDfR6ORbJLgdiiGyfPNNTNMtR11vY6vZkjYxhVyRdn+
         BOg96ZzhX+4EzymdlvwZLOoDSLsbprEn1pEGiEoZQ3nJaSi8w4Gxdn5OlQgoCxbeBJ
         rsagAiSlf8UKCkZv/EIiaTB2hg4jr/+xgc2siSwY=
Date:   Wed, 16 Feb 2022 23:38:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v4 5/7] media: subdev: Add
 v4l2_subdev_lock_and_return_state()
Message-ID: <Yg1u4zdEGtN7wydB@pendragon.ideasonboard.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220216130049.508664-6-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Feb 16, 2022 at 03:00:47PM +0200, Tomi Valkeinen wrote:
> All suitable subdev ops are now passed either the TRY or the ACTIVE
> state by the v4l2 core. However, other subdev drivers can still call the
> ops passing NULL as the state, implying the active case.
> 
> For all current upstream drivers this doesn't matter, as they do not
> expect to get a valid state for ACTIVE case. But future drivers which
> support multiplexed streaming and routing will depend on getting a state
> for both active and try cases.
> 
> For new drivers we can mandate that the pipelines where the drivers are
> used need to pass the state properly, or preferably, not call such
> subdev ops at all.
> 
> However, if an existing subdev driver is changed to support multiplexed
> streams, the driver has to consider cases where its ops will be called
> with NULL state. The problem can easily be solved by using the
> v4l2_subdev_lock_and_return_state() helper, introduced here.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 38 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 8d089a2dbd32..84c02488d53f 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1278,6 +1278,44 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
>   */
>  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
>  
> +/**
> + * v4l2_subdev_lock_and_return_state() - Gets locked try or active subdev state
> + * @sd: subdevice
> + * @state: subdevice state as passed to the subdev op
> + *
> + * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
> + * NULL as the state parameter, as subdevs always used to have their active
> + * state stored privately.
> + *
> + * However, newer state-aware subdev drivers, which store their active state in
> + * a common place, subdev->active_state, expect to always get a proper state as
> + * a parameter.
> + *
> + * These state-aware drivers can use v4l2_subdev_lock_and_return_state() instead
> + * of v4l2_subdev_lock_state(). v4l2_subdev_lock_and_return_state() solves the
> + * issue by using subdev->active_state in case the passed state is NULL.
> + *
> + * This is a temporary helper function, and should be removed when we can ensure
> + * that all drivers pass proper state when calling other subdevs.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state)
> +{
> +	if (state)
> +		return state;
> +
> +	dev_notice_once(sd->dev,
> +		"The provided state is NULL. Adjusting to the subdev active state.\n"
> +		"Please consider porting your driver to the new state management API.\n");
> +
> +	state = sd->active_state;
> +
> +	v4l2_subdev_lock_state(state);

This looks strange, if the state parameter is not NULL then you don't
lock the state, otherwise you do. How is the caller of this function
expected to unlock the state ? I'm tempted to drop this helper and push
harder for porting drivers to the new API.

> +
> +	return state;
> +}
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  /**

-- 
Regards,

Laurent Pinchart
