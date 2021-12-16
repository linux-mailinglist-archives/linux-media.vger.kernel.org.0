Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA4A4774B8
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 15:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238033AbhLPOe0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 09:34:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38528 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbhLPOeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 09:34:25 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F0AD3F6;
        Thu, 16 Dec 2021 15:34:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639665264;
        bh=jCw5qgf4uGnUYDeISfNM5W8CH7QMcPd78YSFI8Iu4nU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jp0JFjm3jYBrhR3pvHuWpYhcaxhEJISKrBEPZdZqJrK+hTg82ocTcN2UVMG0ROE9H
         seQX/ETcQUKy1+CkhUqpudvU49p5xKran5IXmeSU1FXtXDtQC7Eypq/c99yNuFmugF
         cbWsc3Sh/nXbrjnBlLeKMR7ducY9hUTV8FdiotHQ=
Date:   Thu, 16 Dec 2021 16:34:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 05/38] media: subdev: Add
 v4l2_subdev_lock_and_return_state()
Message-ID: <YbtObq+RJbW70pjD@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130141536.891878-6-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 30, 2021 at 04:15:03PM +0200, Tomi Valkeinen wrote:
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
>  include/media/v4l2-subdev.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1810dde9c7fc..873bbe0686e3 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1317,4 +1317,35 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
>   */
>  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
>  
> +/**
> + * v4l2_subdev_lock_and_return_state() - Gets locked TRY or ACTIVE subdev state
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
> + * issue by using subdev->state in case the passed state is NULL.
> + *
> + * This is a temporary helper function, and should be removed when we can ensure
> + * that all drivers pass proper state when calling other subdevs.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state)
> +{
> +	state = state ? state : sd->active_state;

Can we add a dev_warn() when state is NULL ? This will help speeding up
the transition.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	v4l2_subdev_lock_state(state);
> +
> +	return state;
> +}
> +
>  #endif

-- 
Regards,

Laurent Pinchart
