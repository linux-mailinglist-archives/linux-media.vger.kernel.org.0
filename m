Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFBD958618E
	for <lists+linux-media@lfdr.de>; Sun, 31 Jul 2022 23:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbiGaVih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Jul 2022 17:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiGaVig (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Jul 2022 17:38:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BC71117E
        for <linux-media@vger.kernel.org>; Sun, 31 Jul 2022 14:38:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64EE0415;
        Sun, 31 Jul 2022 23:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659303512;
        bh=1DsLbmC+qdkEqKwhF4t7i1PMtJhX+FAm7maMI/+vrbw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WkhZGHwXV8OHrm9iPSD3GlIjmo5Q7yXcpcavI/wdFiOKsr/DsIPsdvYFvncehV/Rv
         8xkK/04NGmu7rKh3KkbUyxVPyR5c/O1q6SBg0GUYf7y+HmhBp9NaXUXBbipWvKv9LI
         zPdiAQHFXlSWki/sNTT6oKqACzq+W1iGPL+6sOOE=
Date:   Mon, 1 Aug 2022 00:38:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH] v4l2-ctrls: optimize type_ops for arrays
Message-ID: <Yub2UzfD7wKrfJgL@pendragon.ideasonboard.com>
References: <1e31bed0-24d2-d728-3866-6834ad08032c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e31bed0-24d2-d728-3866-6834ad08032c@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Jul 28, 2022 at 03:12:10PM +0200, Hans Verkuil wrote:
> Initializing arrays and validating or checking for equality of arrays
> is suboptimal since it does this per element.
> 
> Change the ops to operate on the whole payload to speed up array
> operations.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c  |  19 +---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 129 +++++++++++++++-------
>  include/media/v4l2-ctrls.h                |   6 +-
>  3 files changed, 96 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index 67fbdccda2d8..a8c354ad3d23 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -89,10 +89,7 @@ static int req_to_user(struct v4l2_ext_control *c,
>  /* Helper function: copy the initial control value back to the caller */
>  static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
>  {
> -	int idx;
> -
> -	for (idx = 0; idx < ctrl->elems; idx++)
> -		ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
> +	ctrl->type_ops->init(ctrl, 0, ctrl->elems, ctrl->p_new);
>  
>  	return ptr_to_user(c, ctrl, ctrl->p_new);
>  }
> @@ -122,7 +119,6 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
>  
>  	if (ctrl->is_ptr && !ctrl->is_string) {
>  		unsigned int elems = c->size / ctrl->elem_size;
> -		unsigned int idx;
>  
>  		if (copy_from_user(ctrl->p_new.p, c->ptr, c->size))
>  			return -EFAULT;
> @@ -130,8 +126,7 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
>  		if (ctrl->is_dyn_array)
>  			ctrl->new_elems = elems;
>  		else if (ctrl->is_array)
> -			for (idx = elems; idx < ctrl->elems; idx++)
> -				ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
> +			ctrl->type_ops->init(ctrl, elems, ctrl->elems, ctrl->p_new);

Is this initialization needed, can't the previous value of the elements
not set by userspace be kept ?

This isn't a problem introduced by this patch, so it should be fixed on
top of needed. For this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		return 0;
>  	}
>  
> @@ -499,12 +494,7 @@ EXPORT_SYMBOL(v4l2_g_ext_ctrls);
>  /* Validate a new control */
>  static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
>  {
> -	unsigned int idx;
> -	int err = 0;
> -
> -	for (idx = 0; !err && idx < ctrl->new_elems; idx++)
> -		err = ctrl->type_ops->validate(ctrl, idx, p_new);
> -	return err;
> +	return ctrl->type_ops->validate(ctrl, ctrl->new_elems, p_new);
>  }
>  
>  /* Validate controls. */
> @@ -1017,8 +1007,7 @@ int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
>  	ctrl->p_cur.p = p_array + elems * ctrl->elem_size;
>  	for (i = 0; i < ctrl->nr_of_dims; i++)
>  		ctrl->dims[i] = dims[i];
> -	for (i = 0; i < elems; i++)
> -		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
> +	ctrl->type_ops->init(ctrl, 0, elems, ctrl->p_cur);
>  	cur_to_new(ctrl);
>  	send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_VALUE |
>  			       V4L2_EVENT_CTRL_CH_DIMENSIONS);
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index a004fea10da2..ff05171b3507 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -65,31 +65,27 @@ void send_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 changes)
>  			v4l2_event_queue_fh(sev->fh, &ev);
>  }
>  
> -static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
> +static bool std_equal(const struct v4l2_ctrl *ctrl, u32 elems,
>  		      union v4l2_ctrl_ptr ptr1,
>  		      union v4l2_ctrl_ptr ptr2)
>  {
> +	unsigned int i;
> +
>  	switch (ctrl->type) {
>  	case V4L2_CTRL_TYPE_BUTTON:
>  		return false;
>  	case V4L2_CTRL_TYPE_STRING:
> -		idx *= ctrl->elem_size;
> -		/* strings are always 0-terminated */
> -		return !strcmp(ptr1.p_char + idx, ptr2.p_char + idx);
> -	case V4L2_CTRL_TYPE_INTEGER64:
> -		return ptr1.p_s64[idx] == ptr2.p_s64[idx];
> -	case V4L2_CTRL_TYPE_U8:
> -		return ptr1.p_u8[idx] == ptr2.p_u8[idx];
> -	case V4L2_CTRL_TYPE_U16:
> -		return ptr1.p_u16[idx] == ptr2.p_u16[idx];
> -	case V4L2_CTRL_TYPE_U32:
> -		return ptr1.p_u32[idx] == ptr2.p_u32[idx];
> +		for (i = 0; i < elems; i++) {
> +			unsigned int idx = i * ctrl->elem_size;
> +
> +			/* strings are always 0-terminated */
> +			if (strcmp(ptr1.p_char + idx, ptr2.p_char + idx))
> +				return false;
> +		}
> +		return true;
>  	default:
> -		if (ctrl->is_int)
> -			return ptr1.p_s32[idx] == ptr2.p_s32[idx];
> -		idx *= ctrl->elem_size;
> -		return !memcmp(ptr1.p_const + idx, ptr2.p_const + idx,
> -			       ctrl->elem_size);
> +		return !memcmp(ptr1.p_const, ptr2.p_const,
> +			       elems * ctrl->elem_size);
>  	}
>  }
>  
> @@ -181,40 +177,66 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	}
>  }
>  
> -static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> +static void std_init(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 elems,
>  		     union v4l2_ctrl_ptr ptr)
>  {
> +	unsigned int i;
> +
>  	switch (ctrl->type) {
>  	case V4L2_CTRL_TYPE_STRING:
> -		idx *= ctrl->elem_size;
> -		memset(ptr.p_char + idx, ' ', ctrl->minimum);
> -		ptr.p_char[idx + ctrl->minimum] = '\0';
> +		for (i = from_idx; i < elems; i++) {
> +			unsigned int offset = i * ctrl->elem_size;
> +
> +			memset(ptr.p_char + offset, ' ', ctrl->minimum);
> +			ptr.p_char[offset + ctrl->minimum] = '\0';
> +		}
>  		break;
>  	case V4L2_CTRL_TYPE_INTEGER64:
> -		ptr.p_s64[idx] = ctrl->default_value;
> +		if (ctrl->default_value) {
> +			for (i = from_idx; i < elems; i++)
> +				ptr.p_s64[i] = ctrl->default_value;
> +		} else {
> +			memset(ptr.p_s64 + from_idx, 0, elems * sizeof(s64));
> +		}
>  		break;
>  	case V4L2_CTRL_TYPE_INTEGER:
>  	case V4L2_CTRL_TYPE_INTEGER_MENU:
>  	case V4L2_CTRL_TYPE_MENU:
>  	case V4L2_CTRL_TYPE_BITMASK:
>  	case V4L2_CTRL_TYPE_BOOLEAN:
> -		ptr.p_s32[idx] = ctrl->default_value;
> +		if (ctrl->default_value) {
> +			for (i = from_idx; i < elems; i++)
> +				ptr.p_s32[i] = ctrl->default_value;
> +		} else {
> +			memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
> +		}
>  		break;
>  	case V4L2_CTRL_TYPE_BUTTON:
>  	case V4L2_CTRL_TYPE_CTRL_CLASS:
> -		ptr.p_s32[idx] = 0;
> +		memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
>  		break;
>  	case V4L2_CTRL_TYPE_U8:
> -		ptr.p_u8[idx] = ctrl->default_value;
> +		memset(ptr.p_u8 + from_idx, ctrl->default_value, elems);
>  		break;
>  	case V4L2_CTRL_TYPE_U16:
> -		ptr.p_u16[idx] = ctrl->default_value;
> +		if (ctrl->default_value) {
> +			for (i = from_idx; i < elems; i++)
> +				ptr.p_u16[i] = ctrl->default_value;
> +		} else {
> +			memset(ptr.p_u16 + from_idx, 0, elems * sizeof(u16));
> +		}
>  		break;
>  	case V4L2_CTRL_TYPE_U32:
> -		ptr.p_u32[idx] = ctrl->default_value;
> +		if (ctrl->default_value) {
> +			for (i = from_idx; i < elems; i++)
> +				ptr.p_u32[i] = ctrl->default_value;
> +		} else {
> +			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
> +		}
>  		break;
>  	default:
> -		std_init_compound(ctrl, idx, ptr);
> +		for (i = from_idx; i < elems; i++)
> +			std_init_compound(ctrl, i, ptr);
>  		break;
>  	}
>  }
> @@ -895,8 +917,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	return 0;
>  }
>  
> -static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
> -			union v4l2_ctrl_ptr ptr)
> +static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
> +			     union v4l2_ctrl_ptr ptr)
>  {
>  	size_t len;
>  	u64 offset;
> @@ -964,6 +986,38 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
>  	default:
>  		return std_validate_compound(ctrl, idx, ptr);
>  	}
> +
> +}
> +
> +static int std_validate(const struct v4l2_ctrl *ctrl, u32 elems,
> +			union v4l2_ctrl_ptr ptr)
> +{
> +	unsigned int i;
> +	int ret = 0;
> +
> +	switch ((u32)ctrl->type) {
> +	case V4L2_CTRL_TYPE_U8:
> +		if (ctrl->maximum == 0xff && ctrl->minimum == 0 && ctrl->step == 1)
> +			return 0;
> +		break;
> +	case V4L2_CTRL_TYPE_U16:
> +		if (ctrl->maximum == 0xffff && ctrl->minimum == 0 && ctrl->step == 1)
> +			return 0;
> +		break;
> +	case V4L2_CTRL_TYPE_U32:
> +		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
> +			return 0;
> +		break;
> +
> +	case V4L2_CTRL_TYPE_BUTTON:
> +	case V4L2_CTRL_TYPE_CTRL_CLASS:
> +		memset(ptr.p_s32, 0, elems * sizeof(s32));
> +		return 0;
> +	}
> +
> +	for (i = 0; !ret && i < elems; i++)
> +		ret = std_validate_elem(ctrl, i, ptr);
> +	return ret;
>  }
>  
>  static const struct v4l2_ctrl_type_ops std_type_ops = {
> @@ -1449,7 +1503,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	unsigned elems = 1;
>  	bool is_array;
>  	unsigned tot_ctrl_size;
> -	unsigned idx;
>  	void *data;
>  	int err;
>  
> @@ -1664,10 +1717,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
>  	}
>  
> -	for (idx = 0; idx < elems; idx++) {
> -		ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
> -		ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
> -	}
> +	ctrl->type_ops->init(ctrl, 0, elems, ctrl->p_cur);
> +	cur_to_new(ctrl);
>  
>  	if (handler_new_ref(hdl, ctrl, NULL, false, false)) {
>  		kvfree(ctrl->p_array);
> @@ -1984,7 +2035,6 @@ void update_from_auto_cluster(struct v4l2_ctrl *master)
>  static int cluster_changed(struct v4l2_ctrl *master)
>  {
>  	bool changed = false;
> -	unsigned int idx;
>  	int i;
>  
>  	for (i = 0; i < master->ncontrols; i++) {
> @@ -2010,10 +2060,9 @@ static int cluster_changed(struct v4l2_ctrl *master)
>  
>  		if (ctrl->elems != ctrl->new_elems)
>  			ctrl_changed = true;
> -
> -		for (idx = 0; !ctrl_changed && idx < ctrl->elems; idx++)
> -			ctrl_changed = !ctrl->type_ops->equal(ctrl, idx,
> -				ctrl->p_cur, ctrl->p_new);
> +		if (!ctrl_changed)
> +			ctrl_changed = !ctrl->type_ops->equal(ctrl,
> +				ctrl->elems, ctrl->p_cur, ctrl->p_new);
>  		ctrl->has_changed = ctrl_changed;
>  		changed |= ctrl->has_changed;
>  	}
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 607960309579..3bb1f0909c46 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -128,13 +128,13 @@ struct v4l2_ctrl_ops {
>   *	otherwise.
>   */
>  struct v4l2_ctrl_type_ops {
> -	bool (*equal)(const struct v4l2_ctrl *ctrl, u32 idx,
> +	bool (*equal)(const struct v4l2_ctrl *ctrl, u32 elems,
>  		      union v4l2_ctrl_ptr ptr1,
>  		      union v4l2_ctrl_ptr ptr2);
> -	void (*init)(const struct v4l2_ctrl *ctrl, u32 idx,
> +	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 elems,
>  		     union v4l2_ctrl_ptr ptr);
>  	void (*log)(const struct v4l2_ctrl *ctrl);
> -	int (*validate)(const struct v4l2_ctrl *ctrl, u32 idx,
> +	int (*validate)(const struct v4l2_ctrl *ctrl, u32 elems,
>  			union v4l2_ctrl_ptr ptr);
>  };
>  

-- 
Regards,

Laurent Pinchart
