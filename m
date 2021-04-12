Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACFE435C494
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239190AbhDLLAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:00:53 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:55931 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239903AbhDLLAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:00:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VuIrl5MYeMxedVuIuld18H; Mon, 12 Apr 2021 13:00:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618225229; bh=eweBOCns51rNnqwDLgQ2/GwIuz+hTvY/G4tatx3t7ek=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ji35tQbv9makRCH93NsZFnKm3CORDH7uWhCH3TbDjsxKWtASafv1KQe3eLOE/S+R9
         sbVoC1SmehsOXVQ4eS7XEQlnUOuJCzKS3hdRcZ/PfUJ5jpSFHz5AWpDgIzN3y08Oiu
         nBdlwPAL49E16SDByWAEieukgnDf0eQTdjmy9EGLirRTmwJa8DgTU1VtzsNpWZySdZ
         7+EEnNFBZmJITcbkzNw25pFtdFP3/UilkLllIju9X7/VKVQlrM6tRxux6xPFTJ0WeH
         YB6kZrMt5fuUyhloN2bTsM5vm7Xs1g5u/YirwsKdCe7A/rYEQhjbU/nmYHNQy3sB6k
         5Pp4gq/ur+gkA==
Subject: Re: [PATCH] v4l2-ctrls: fix reference to freed memory
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>,
        =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= 
        <Yunfei.Dong@mediatek.com>
References: <319aa93f-24f9-ddef-0814-a06011d9e73f@xs4all.nl>
Message-ID: <9f1174c6-826c-0c7f-3069-aa3faf3a7913@xs4all.nl>
Date:   Mon, 12 Apr 2021 13:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <319aa93f-24f9-ddef-0814-a06011d9e73f@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFfZ7ssMyLRX+FoIqdYK3qFHg6ty58gxy1Ue7y+cjpuu6XsYPSoAduAHP1yolwEZrVMl+z8Mu4vfQNHA/Hc6KBg45BG+ZacgQLWjccnulwBcVJ6TCOhv
 pmqfqjT4aOFxBfsIVf1ffK5kFMLbK+gpjjmjmr9HWvVJ6/oBlCW38NaRPdGLiXqeAwpUnIfDGKTRvoyf+OKzM9j9FMknHHloB+7KCmvD+KbvOK8l/Rys80gX
 UiYtYzVyNNZFDIr+cXbyrVabh+uPp7qwYbvVO/33jcQkPKveo3iWeakzsp0UREYnf7gblY4sWAtqhNmfw2/djHNUN0UFoemBOeO1tkRfGiA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/04/2021 12:10, Hans Verkuil wrote:
> When controls are used together with the Request API, then for
> each request a v4l2_ctrl_handler struct is allocated. This contains
> the controls that can be set in a request. If a control is *not* set in
> the request, then the value used in the most recent previous request
> must be used, or the current value if it is not found in any outstanding
> requests.
> 
> The framework tried to find such a previous request and it would set
> the 'req' pointer in struct v4l2_ctrl_ref to the v4l2_ctrl_ref of the
> control in such a previous request. So far, so good. However, when that
> previous request was applied to the hardware, returned to userspace, and
> then userspace would re-init or free that request, any 'ref' pointer in
> still-queued requests would suddenly point to freed memory.
> 
> This was not noticed before since the drivers that use this expected
> that each request would always have the controls set, so there was
> never any need to find a control in older requests. This requirement
> was relaxed, and now this bug surfaced.
> 
> The use of the 'req' pointer in v4l2_ctrl_ref was very fragile, so
> drop this entirely. Instead add a valid_p_req bool to indicate that
> p_req contains a valid value for this control. And if it is false,
> then call the new find_ctrl_in_prev_request() helper function that
> walks through older outstanding requests to find if one of them set
> the same control, and uses that value as per the API specification.
> 
> This simplifies the code as well and is a lot more robust.
> 
> Also added some more comments, since it was not always clear what
> was going on.

Ignore this patch, I just realized that it can be simplified some more.
I'll post a v2 soon.

Regards,

	Hans

> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reported-by: Yunfei Dong (董云飞) <Yunfei.Dong@mediatek.com>
> Tested-by: Ezequiel Garcia <ezequiel@collabora.com>
> Tested-by: Nicolas Dufresne <nicolas@ndufresne.ca>
> Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
> Cc: <stable@vger.kernel.org>      # for v5.9 and up
> ---
> While the bug was actually introduced when the Request API was merged,
> it was not in active use until the H.264 stateless codec API was made
> part of the uAPI. That's why the CC to stable explicitly says v5.9 and
> up, since this patch won't apply for older kernels, and that's OK since
> it was not in active use AFAIK.
> 
> If that assumption is wrong, then let me know and I will have to create
> custom patches for older kernels, but I prefer to avoid doing that.
> 
> I'm not planning to get this merged for 5.12 since we are close to a
> release, so I think it is OK to get this in for 5.13 and have it backported
> to 5.12. I also would like to have feedback from Alexandre and Yunfei
> that this patch indeed fixes your issues as well.
> 
> I plan on creating better tests in v4l2-compliance using vivid to verify
> correct behavior of controls in requests. Proper tests are definitely
> needed to avoid bugs like this.
> 
> Regards,
> 
> 	Hans
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 124 +++++++++++++--------------
>  include/media/v4l2-ctrls.h           |  12 +--
>  2 files changed, 69 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index c7bcc5c25771..0627d16f6334 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -2504,7 +2504,7 @@ static void new_to_req(struct v4l2_ctrl_ref *ref)
>  	if (!ref)
>  		return;
>  	ptr_to_ptr(ref->ctrl, ref->ctrl->p_new, ref->p_req);
> -	ref->req = ref;
> +	ref->valid_p_req = true;
>  }
> 
>  /* Copy the request value to the new value */
> @@ -2512,8 +2512,8 @@ static void req_to_new(struct v4l2_ctrl_ref *ref)
>  {
>  	if (!ref)
>  		return;
> -	if (ref->req)
> -		ptr_to_ptr(ref->ctrl, ref->req->p_req, ref->ctrl->p_new);
> +	if (ref->valid_p_req)
> +		ptr_to_ptr(ref->ctrl, ref->p_req, ref->ctrl->p_new);
>  	else
>  		ptr_to_ptr(ref->ctrl, ref->ctrl->p_cur, ref->ctrl->p_new);
>  }
> @@ -3694,39 +3694,8 @@ static void v4l2_ctrl_request_queue(struct media_request_object *obj)
>  	struct v4l2_ctrl_handler *hdl =
>  		container_of(obj, struct v4l2_ctrl_handler, req_obj);
>  	struct v4l2_ctrl_handler *main_hdl = obj->priv;
> -	struct v4l2_ctrl_handler *prev_hdl = NULL;
> -	struct v4l2_ctrl_ref *ref_ctrl, *ref_ctrl_prev = NULL;
> 
>  	mutex_lock(main_hdl->lock);
> -	if (list_empty(&main_hdl->requests_queued))
> -		goto queue;
> -
> -	prev_hdl = list_last_entry(&main_hdl->requests_queued,
> -				   struct v4l2_ctrl_handler, requests_queued);
> -	/*
> -	 * Note: prev_hdl and hdl must contain the same list of control
> -	 * references, so if any differences are detected then that is a
> -	 * driver bug and the WARN_ON is triggered.
> -	 */
> -	mutex_lock(prev_hdl->lock);
> -	ref_ctrl_prev = list_first_entry(&prev_hdl->ctrl_refs,
> -					 struct v4l2_ctrl_ref, node);
> -	list_for_each_entry(ref_ctrl, &hdl->ctrl_refs, node) {
> -		if (ref_ctrl->req)
> -			continue;
> -		while (ref_ctrl_prev->ctrl->id < ref_ctrl->ctrl->id) {
> -			/* Should never happen, but just in case... */
> -			if (list_is_last(&ref_ctrl_prev->node,
> -					 &prev_hdl->ctrl_refs))
> -				break;
> -			ref_ctrl_prev = list_next_entry(ref_ctrl_prev, node);
> -		}
> -		if (WARN_ON(ref_ctrl_prev->ctrl->id != ref_ctrl->ctrl->id))
> -			break;
> -		ref_ctrl->req = ref_ctrl_prev->req;
> -	}
> -	mutex_unlock(prev_hdl->lock);
> -queue:
>  	list_add_tail(&hdl->requests_queued, &main_hdl->requests_queued);
>  	hdl->request_is_queued = true;
>  	mutex_unlock(main_hdl->lock);
> @@ -3783,7 +3752,7 @@ v4l2_ctrl_request_hdl_ctrl_find(struct v4l2_ctrl_handler *hdl, u32 id)
>  {
>  	struct v4l2_ctrl_ref *ref = find_ref_lock(hdl, id);
> 
> -	return (ref && ref->req == ref) ? ref->ctrl : NULL;
> +	return (ref && ref->valid_p_req) ? ref->ctrl : NULL;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_ctrl_request_hdl_ctrl_find);
> 
> @@ -3972,6 +3941,31 @@ static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
>  	return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
>  }
> 
> +/*
> + * Find the most recent queued request that contains the given control.
> + * Return the reference to that control if found, or NULL otherwise.
> + */
> +static struct v4l2_ctrl_ref *
> +find_ctrl_in_prev_request(struct v4l2_ctrl_handler *hdl,
> +			  struct v4l2_ctrl_ref *ref)
> +{
> +	struct v4l2_ctrl_handler *main_hdl = ref->ctrl->handler;
> +	u32 id = ref->ctrl->id;
> +
> +	/*
> +	 * The main handler must be locked since we're traversing
> +	 * the requests_queued list.
> +	 */
> +	WARN_ON(!mutex_is_locked(main_hdl->lock));
> +	list_for_each_entry_continue_reverse(hdl, &main_hdl->requests_queued,
> +					     requests_queued) {
> +		ref = find_ref_lock(hdl, id);
> +		if (ref && ref->valid_p_req)
> +			return ref;
> +	}
> +	return NULL;
> +}
> +
>  /* Get extended controls. Allocates the helpers array if needed. */
>  static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>  				   struct v4l2_ext_controls *cs,
> @@ -3982,8 +3976,10 @@ static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>  	int ret;
>  	int i, j;
>  	bool def_value;
> +	bool is_request;
> 
>  	def_value = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
> +	is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
> 
>  	cs->error_idx = cs->count;
>  	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
> @@ -4012,6 +4008,7 @@ static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>  		int (*ctrl_to_user)(struct v4l2_ext_control *c,
>  				    struct v4l2_ctrl *ctrl);
>  		struct v4l2_ctrl *master;
> +		u32 idx = i;
> 
>  		ctrl_to_user = def_value ? def_to_user : cur_to_user;
> 
> @@ -4032,22 +4029,35 @@ static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>  			ret = call_op(master, g_volatile_ctrl);
>  			ctrl_to_user = new_to_user;
>  		}
> +
> +		if (ret) {
> +			v4l2_ctrl_unlock(master);
> +			break;
> +		}
> +
>  		/* If OK, then copy the current (for non-volatile controls)
>  		   or the new (for volatile controls) control values to the
>  		   caller */
> -		if (!ret) {
> -			u32 idx = i;
> +		do {
> +			struct v4l2_ctrl_ref *ref = helpers[idx].ref;
> +
> +			/*
> +			 * If this is part of a request, and the request does
> +			 * not contain the value of this control, then try to
> +			 * find it in an older, still queued request. If found,
> +			 * then use the value from that request, otherwise use
> +			 * the current control value.
> +			 */
> +			if (is_request && !ref->valid_p_req)
> +				ref = find_ctrl_in_prev_request(hdl, ref) ? : ref;
> +
> +			if (ref->valid_p_req)
> +				ret = req_to_user(cs->controls + idx, ref);
> +			else
> +				ret = ctrl_to_user(cs->controls + idx, ref->ctrl);
> +			idx = helpers[idx].next;
> +		} while (!ret && idx);
> 
> -			do {
> -				if (helpers[idx].ref->req)
> -					ret = req_to_user(cs->controls + idx,
> -						helpers[idx].ref->req);
> -				else
> -					ret = ctrl_to_user(cs->controls + idx,
> -						helpers[idx].ref->ctrl);
> -				idx = helpers[idx].next;
> -			} while (!ret && idx);
> -		}
>  		v4l2_ctrl_unlock(master);
>  	}
> 
> @@ -4690,8 +4700,6 @@ void v4l2_ctrl_request_complete(struct media_request *req,
>  		unsigned int i;
> 
>  		if (ctrl->flags & V4L2_CTRL_FLAG_VOLATILE) {
> -			ref->req = ref;
> -
>  			v4l2_ctrl_lock(master);
>  			/* g_volatile_ctrl will update the current control values */
>  			for (i = 0; i < master->ncontrols; i++)
> @@ -4701,21 +4709,13 @@ void v4l2_ctrl_request_complete(struct media_request *req,
>  			v4l2_ctrl_unlock(master);
>  			continue;
>  		}
> -		if (ref->req == ref)
> +		if (ref->valid_p_req)
>  			continue;
> 
> +		/* Copy the current control value into the request */
>  		v4l2_ctrl_lock(ctrl);
> -		if (ref->req) {
> -			ptr_to_ptr(ctrl, ref->req->p_req, ref->p_req);
> -		} else {
> -			ptr_to_ptr(ctrl, ctrl->p_cur, ref->p_req);
> -			/*
> -			 * Set ref->req to ensure that when userspace wants to
> -			 * obtain the controls of this request it will take
> -			 * this value and not the current value of the control.
> -			 */
> -			ref->req = ref;
> -		}
> +		ptr_to_ptr(ctrl, ctrl->p_cur, ref->p_req);
> +		ref->valid_p_req = true;
>  		v4l2_ctrl_unlock(ctrl);
>  	}
> 
> @@ -4779,7 +4779,7 @@ int v4l2_ctrl_request_setup(struct media_request *req,
>  				struct v4l2_ctrl_ref *r =
>  					find_ref(hdl, master->cluster[i]->id);
> 
> -				if (r->req && r == r->req) {
> +				if (r->valid_p_req) {
>  					have_new_data = true;
>  					break;
>  				}
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index c1d20bd8f25f..a5953b812878 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -304,12 +304,14 @@ struct v4l2_ctrl {
>   *		the control has been applied. This prevents applying controls
>   *		from a cluster with multiple controls twice (when the first
>   *		control of a cluster is applied, they all are).
> - * @req:	If set, this refers to another request that sets this control.
> + * @valid_p_req: If set, then p_req contains the control value for the request.
>   * @p_req:	If the control handler containing this control reference
>   *		is bound to a media request, then this points to the
> - *		value of the control that should be applied when the request
> + *		value of the control that must be applied when the request
>   *		is executed, or to the value of the control at the time
> - *		that the request was completed.
> + *		that the request was completed. If @valid_p_req is false,
> + *		then this control was never set for this request and the
> + *		control will not be updated when this request is applied.
>   *
>   * Each control handler has a list of these refs. The list_head is used to
>   * keep a sorted-by-control-ID list of all controls, while the next pointer
> @@ -322,7 +324,7 @@ struct v4l2_ctrl_ref {
>  	struct v4l2_ctrl_helper *helper;
>  	bool from_other_dev;
>  	bool req_done;
> -	struct v4l2_ctrl_ref *req;
> +	bool valid_p_req;
>  	union v4l2_ctrl_ptr p_req;
>  };
> 
> @@ -349,7 +351,7 @@ struct v4l2_ctrl_ref {
>   * @error:	The error code of the first failed control addition.
>   * @request_is_queued: True if the request was queued.
>   * @requests:	List to keep track of open control handler request objects.
> - *		For the parent control handler (@req_obj.req == NULL) this
> + *		For the parent control handler (@req_obj.ops == NULL) this
>   *		is the list header. When the parent control handler is
>   *		removed, it has to unbind and put all these requests since
>   *		they refer to the parent.
> 

