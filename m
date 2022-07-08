Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4327756B757
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 12:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237371AbiGHKjv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 06:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiGHKju (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 06:39:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779A07B363
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 03:39:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDAAD56D;
        Fri,  8 Jul 2022 12:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657276788;
        bh=DvoyzAN6uO+oulKXOwNkNIxaQpbUUS8OR6lCoCGD7A4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r3jYZ1iPWA6KkEjsb4KgC70S+UXyBJdl9gjInqcK6uqeGkYrC/cuN/KP3pOgZDKOp
         PSNQXgmvOn6wTgEQY9wGYRsL3bFFjUQRE+fJihdyJMjev4jMG6ZczSBa+srM8hmE+R
         2sQU+sO+8NAz09oKtJrJPXz2Iv3WHuBijzjlpJTo=
Date:   Fri, 8 Jul 2022 13:39:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH 6/8] v4l2-ctrls: add v4l2_ctrl_modify_dimensions
Message-ID: <YsgJWS1fsztxMIUi@pendragon.ideasonboard.com>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
 <20220628120523.2915913-7-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628120523.2915913-7-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Jun 28, 2022 at 02:05:21PM +0200, Hans Verkuil wrote:
> Add a new function to modify the dimensions of an array control.
> 
> This is typically used if the array size depends on e.g. the currently
> selected video format.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c | 34 ++++++++++++++++
>  include/media/v4l2-ctrls.h               | 49 ++++++++++++++++++++++++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index 6f1b72c59e8e..16be31966cb1 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -989,6 +989,40 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>  }
>  EXPORT_SYMBOL(__v4l2_ctrl_modify_range);
>  
> +int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
> +				  u32 dims[V4L2_CTRL_MAX_DIMS])
> +{
> +	unsigned int elems = dims[0];
> +	unsigned int i;
> +	void *p_array;
> +
> +	if (!ctrl->is_array || ctrl->is_dyn_array)
> +		return -EINVAL;
> +
> +	for (i = 1; i < ctrl->nr_of_dims; i++)
> +		elems *= dims[i];

I would have initialized elems to 1 and started iterating at 0, to avoid
splitting the computation in two places.

> +	if (elems == 0)
> +		return -EINVAL;
> +	p_array = kvzalloc(2 * elems * ctrl->elem_size, GFP_KERNEL);

There are lots of places where we allocate memory for arrays, with the
same computation, and the same pointer arithmetic to set p_cur.p. It
would be nice to clean that up at some point and factorize the code out
to a separate function.

A helper function to calculate the total number of elements would also
be helpful, and you could add overflow checks there.

> +	if (!p_array)
> +		return -ENOMEM;
> +	kvfree(ctrl->p_array);
> +	ctrl->p_array_alloc_elems = elems;
> +	ctrl->elems = elems;
> +	ctrl->new_elems = elems;
> +	ctrl->p_array = p_array;
> +	ctrl->p_new.p = p_array;
> +	ctrl->p_cur.p = p_array + elems * ctrl->elem_size;
> +	for (i = 0; i < ctrl->nr_of_dims; i++)
> +		ctrl->dims[i] = dims[i];
> +	for (i = 0; i < elems; i++) {
> +		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
> +		ctrl->type_ops->init(ctrl, i, ctrl->p_new);

Would it be cheaper to call init on only p_cur or p_new, and then memcpy
to the other one ?

> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
> +
>  /* Implement VIDIOC_QUERY_EXT_CTRL */
>  int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctrl *qc)
>  {
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index e0f32e8b886a..3d039142f870 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -963,6 +963,55 @@ static inline int v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>  	return rval;
>  }
>  
> +/**
> + *__v4l2_ctrl_modify_dimensions() - Unlocked variant of v4l2_ctrl_modify_dimensions()
> + *
> + * @ctrl:	The control to update.
> + * @dims:	The control's new dimensions.
> + *
> + * Update the dimensions of an array control on the fly.
> + *
> + * An error is returned if @dims is invalid for this control.
> + *
> + * The caller is responsible for acquiring the control handler mutex on behalf
> + * of __v4l2_ctrl_modify_dimensions().

It would be nice to add lockdep_assert() statements in the unlocked
functions.

> + *
> + * Note: calling this function when the same control is used in pending requests
> + * is untested. It should work (a request with the wrong size of the control
> + * will drop that control silently), but it will be very confusing.
> + */
> +int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
> +				  u32 dims[V4L2_CTRL_MAX_DIMS]);
> +
> +/**
> + * v4l2_ctrl_modify_dimensions() - Update the dimensions of an array control.
> + *
> + * @ctrl:	The control to update.
> + * @dims:	The control's new dimensions.
> + *
> + * Update the dimensions of a control on the fly.

I'd add "The control value is reset to the default". Same for the
previous function.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> + *
> + * An error is returned if @dims is invalid for this control type.
> + *
> + * This function assumes that the control handler is not locked and will
> + * take the lock itself.
> + *
> + * Note: calling this function when the same control is used in pending requests
> + * is untested. It should work (a request with the wrong size of the control
> + * will drop that control silently), but it will be very confusing.
> + */
> +static inline int v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
> +					      u32 dims[V4L2_CTRL_MAX_DIMS])
> +{
> +	int rval;
> +
> +	v4l2_ctrl_lock(ctrl);
> +	rval = __v4l2_ctrl_modify_dimensions(ctrl, dims);
> +	v4l2_ctrl_unlock(ctrl);
> +
> +	return rval;
> +}
> +
>  /**
>   * v4l2_ctrl_notify() - Function to set a notify callback for a control.
>   *

-- 
Regards,

Laurent Pinchart
