Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD8E56B748
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 12:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237515AbiGHKa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 06:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiGHKa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 06:30:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD64C237D8
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 03:30:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5647A56D;
        Fri,  8 Jul 2022 12:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657276224;
        bh=dG0UVaIpueVU6JTUA0iSJdx5RNzUKLI2Z2ojYEX7lLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YmA/iFKHftqIhViQ6Hnm+rsk7IRB4Mt78DnxPD5Wjj/3Piu9k6GvFSpVHo49Kc5cv
         S4XSsbFnR0KVc7alOLDXdut7e+1ABsAIv4aLdwq+asc83qOVTAqSNmztcOAbAaLiEU
         ex6/Pb2DEpzMm6KcjBANcHmJTAY2N7KN9IZRKnl8=
Date:   Fri, 8 Jul 2022 13:29:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH 5/8] v4l2-ctrls: alloc arrays in ctrl_ref
Message-ID: <YsgHJkL5/oBX6Hgo@pendragon.ideasonboard.com>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
 <20220628120523.2915913-6-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628120523.2915913-6-hverkuil-cisco@xs4all.nl>
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

On Tue, Jun 28, 2022 at 02:05:20PM +0200, Hans Verkuil wrote:
> Also allocate space for arrays in struct ctrl_ref.
> 
> This is in preparation for allowing to change the array size from
> a driver.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c  |  2 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 31 ++++++++++++++---------
>  include/media/v4l2-ctrls.h                | 16 ++++++------
>  3 files changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index 1b90bd7c4010..6f1b72c59e8e 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -467,7 +467,7 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>  
>  			if (is_default)
>  				ret = def_to_user(cs->controls + idx, ref->ctrl);
> -			else if (is_request && ref->p_req_dyn_enomem)
> +			else if (is_request && ref->p_req_array_enomem)
>  				ret = -ENOMEM;
>  			else if (is_request && ref->p_req_valid)
>  				ret = req_to_user(cs->controls + idx, ref);
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 1372b7b45681..38030a7cb233 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1048,23 +1048,26 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
>  	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
>  }
>  
> -static bool req_alloc_dyn_array(struct v4l2_ctrl_ref *ref, u32 elems)
> +static bool req_alloc_array(struct v4l2_ctrl_ref *ref, u32 elems)
>  {
>  	void *tmp;
>  
> -	if (elems < ref->p_req_dyn_alloc_elems)
> +	if (elems == ref->p_req_array_alloc_elems)
> +		return true;
> +	if (ref->ctrl->is_dyn_array &&
> +	    elems < ref->p_req_array_alloc_elems)
>  		return true;
>  
>  	tmp = kvmalloc(elems * ref->ctrl->elem_size, GFP_KERNEL);
>  
>  	if (!tmp) {
> -		ref->p_req_dyn_enomem = true;
> +		ref->p_req_array_enomem = true;
>  		return false;
>  	}
> -	ref->p_req_dyn_enomem = false;
> +	ref->p_req_array_enomem = false;
>  	kvfree(ref->p_req.p);
>  	ref->p_req.p = tmp;
> -	ref->p_req_dyn_alloc_elems = elems;
> +	ref->p_req_array_alloc_elems = elems;
>  	return true;
>  }
>  
> @@ -1077,7 +1080,7 @@ void new_to_req(struct v4l2_ctrl_ref *ref)
>  		return;
>  
>  	ctrl = ref->ctrl;
> -	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->new_elems))
> +	if (ctrl->is_array && !req_alloc_array(ref, ctrl->new_elems))
>  		return;
>  
>  	ref->p_req_elems = ctrl->new_elems;
> @@ -1094,7 +1097,7 @@ void cur_to_req(struct v4l2_ctrl_ref *ref)
>  		return;
>  
>  	ctrl = ref->ctrl;
> -	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->elems))
> +	if (ctrl->is_array && !req_alloc_array(ref, ctrl->elems))
>  		return;
>  
>  	ref->p_req_elems = ctrl->elems;
> @@ -1123,14 +1126,18 @@ int req_to_new(struct v4l2_ctrl_ref *ref)
>  		return 0;
>  	}
>  
> -	/* Not a dynamic array, so just copy the request value */
> -	if (!ctrl->is_dyn_array) {
> +	/* Not an array, so just copy the request value */
> +	if (!ctrl->is_array) {
>  		ptr_to_ptr(ctrl, ref->p_req, ctrl->p_new, ctrl->new_elems);
>  		return 0;
>  	}
>  
>  	/* Sanity check, should never happen */
> -	if (WARN_ON(!ref->p_req_dyn_alloc_elems))
> +	if (WARN_ON(!ref->p_req_array_alloc_elems))
> +		return -ENOMEM;
> +
> +	if (!ctrl->is_dyn_array &&
> +	    ref->p_req_elems != ctrl->p_array_alloc_elems)
>  		return -ENOMEM;
>  
>  	/*
> @@ -1243,7 +1250,7 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  	/* Free all nodes */
>  	list_for_each_entry_safe(ref, next_ref, &hdl->ctrl_refs, node) {
>  		list_del(&ref->node);
> -		if (ref->p_req_dyn_alloc_elems)
> +		if (ref->p_req_array_alloc_elems)
>  			kvfree(ref->p_req.p);
>  		kfree(ref);
>  	}
> @@ -1368,7 +1375,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>  	if (hdl->error)
>  		return hdl->error;
>  
> -	if (allocate_req && !ctrl->is_dyn_array)
> +	if (allocate_req && !ctrl->is_array)
>  		size_extra_req = ctrl->elems * ctrl->elem_size;
>  	new_ref = kzalloc(sizeof(*new_ref) + size_extra_req, GFP_KERNEL);
>  	if (!new_ref)
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index a2f147873265..e0f32e8b886a 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -324,15 +324,15 @@ struct v4l2_ctrl {
>   *		from a cluster with multiple controls twice (when the first
>   *		control of a cluster is applied, they all are).
>   * @p_req_valid: If set, then p_req contains the control value for the request.
> - * @p_req_dyn_enomem: If set, then p_req is invalid since allocating space for
> - *		a dynamic array failed. Attempting to read this value shall
> - *		result in ENOMEM. Only valid if ctrl->is_dyn_array is true.
> - * @p_req_dyn_alloc_elems: The number of elements allocated for the dynamic
> - *		array. Only valid if @p_req_valid and ctrl->is_dyn_array are
> + * @p_req_array_enomem: If set, then p_req is invalid since allocating space for
> + *		an array failed. Attempting to read this value shall
> + *		result in ENOMEM. Only valid if ctrl->is_array is true.
> + * @p_req_array_alloc_elems: The number of elements allocated for the
> + *		array. Only valid if @p_req_valid and ctrl->is_array are
>   *		true.
>   * @p_req_elems: The number of elements in @p_req. This is the same as
>   *		ctrl->elems, except for dynamic arrays. In that case it is in
> - *		the range of 1 to @p_req_dyn_alloc_elems. Only valid if
> + *		the range of 1 to @p_req_array_alloc_elems. Only valid if
>   *		@p_req_valid is true.
>   * @p_req:	If the control handler containing this control reference
>   *		is bound to a media request, then this points to the
> @@ -354,8 +354,8 @@ struct v4l2_ctrl_ref {
>  	bool from_other_dev;
>  	bool req_done;
>  	bool p_req_valid;
> -	bool p_req_dyn_enomem;
> -	u32 p_req_dyn_alloc_elems;
> +	bool p_req_array_enomem;
> +	u32 p_req_array_alloc_elems;
>  	u32 p_req_elems;
>  	union v4l2_ctrl_ptr p_req;
>  };

-- 
Regards,

Laurent Pinchart
