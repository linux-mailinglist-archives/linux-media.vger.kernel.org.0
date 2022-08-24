Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34CAC5A0261
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 21:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbiHXT5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 15:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240039AbiHXT46 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 15:56:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85477C300
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 12:56:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34DE92B3;
        Wed, 24 Aug 2022 21:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661371013;
        bh=oqYPWahrpzdC9G3NK88ZN6iXWK6F7+XN//TfCcny8cE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BMju4lQcRe87qZW8RgAngsN8MtqyE0pwFVGU6OdvcS414wLHGpFXOd2Kz7sontxx2
         xUQw4N2/gWVW2GReKEskAmDkwHKoUW2J9qlQhs3ZLeZ4qp8Ctmkv1QtNgu10K4txOG
         rZEvHErZ4lWyon7u7rALr17rPrpByzVOnOUY1oXM=
Date:   Wed, 24 Aug 2022 22:56:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 3/7] media: uvcvideo: Add support for compound controls
Message-ID: <YwaCf1mR7SGCfnAR@pendragon.ideasonboard.com>
References: <20220628075705.2278044-1-yunkec@google.com>
 <20220628075705.2278044-4-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628075705.2278044-4-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Thank you for the patch.

On Tue, Jun 28, 2022 at 04:57:01PM +0900, Yunke Cao wrote:
> Supports getting/setting current value.
> Supports getting default value.
> Handles V4L2_CTRL_FLAG_NEXT_COMPOUND.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 279 ++++++++++++++++++++++++++-----
>  drivers/media/usb/uvc/uvcvideo.h |   4 +
>  2 files changed, 238 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 772d9d28a520..508ee04afbcd 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -815,6 +815,34 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>  	}
>  }
>  
> +/* Extract the byte array specified by mapping->offset and mapping->size
> + * stored at 'data' to the output array 'data_out'.
> + */

Please use the

/*
 * multi
 * line
 */

style instead of

/* multi
 * line
 */

The uvcvideo driver has recently switched to the former in commit
699b9a86a3f0 ("media: uvcvideo: Fix comment blocks style").

> +static int uvc_get_array(struct uvc_control_mapping *mapping, const u8 *data,
> +			 u8 *data_out)
> +{
> +	// Only supports byte-aligned data.

And no C++-style comments either please.

> +	if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> +		return -EINVAL;
> +
> +	memcpy(data_out, data + mapping->offset / 8, mapping->size / 8);
> +	return 0;
> +}
> +
> +/* Copy the byte array 'data_in' to the destination specified by mapping->offset
> + * and mapping->size stored at 'data'.
> + */
> +static int uvc_set_array(struct uvc_control_mapping *mapping, const u8 *data_in,
> +			 u8 *data)
> +{
> +	// Only supports byte-aligned data.
> +	if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> +		return -EINVAL;
> +
> +	memcpy(data + mapping->offset / 8, data_in, mapping->size / 8);
> +	return 0;
> +}
> +

Could you add here a

static bool
uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
{
	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
}

and use it below ? That would be clearer I think.

>  /* ------------------------------------------------------------------------
>   * Terminal and unit management
>   */
> @@ -831,7 +859,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
>  
>  static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
>  	struct uvc_control_mapping **mapping, struct uvc_control **control,
> -	int next)
> +	int next, int next_compound)
>  {
>  	struct uvc_control *ctrl;
>  	struct uvc_control_mapping *map;
> @@ -846,14 +874,18 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
>  			continue;
>  
>  		list_for_each_entry(map, &ctrl->info.mappings, list) {
> -			if ((map->id == v4l2_id) && !next) {
> +			if (map->id == v4l2_id && !next && !next_compound) {
>  				*control = ctrl;
>  				*mapping = map;
>  				return;
>  			}
>  
>  			if ((*mapping == NULL || (*mapping)->id > map->id) &&
> -			    (map->id > v4l2_id) && next) {
> +			    (map->id > v4l2_id) &&
> +			    ((map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES &&
> +			      next) ||
> +			     (map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES &&
> +			      next_compound))) {
>  				*control = ctrl;
>  				*mapping = map;
>  			}

This could become for instance

			if ((*mapping == NULL || (*mapping)->id > map->id) &&
			    (map->id > v4l2_id) &&
			    ((!uvc_ctrl_mapping_is_compound(map) && next) ||
			     (uvc_ctrl_mapping_is_compound(map) && next_compound))) {
				*control = ctrl;
				*mapping = map;
			}

> @@ -867,6 +899,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl = NULL;
>  	struct uvc_entity *entity;
>  	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> +	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
>  
>  	*mapping = NULL;
>  
> @@ -875,12 +908,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>  
>  	/* Find the control. */
>  	list_for_each_entry(entity, &chain->entities, chain) {
> -		__uvc_find_control(entity, v4l2_id, mapping, &ctrl, next);
> -		if (ctrl && !next)
> +		__uvc_find_control(entity, v4l2_id, mapping, &ctrl, next,
> +				   next_compound);
> +		if (ctrl && !next && !next_compound)
>  			return ctrl;
>  	}
>  
> -	if (ctrl == NULL && !next)
> +	if (!ctrl && !next && !next_compound)
>  		uvc_dbg(chain->dev, CONTROL, "Control 0x%08x not found\n",
>  			v4l2_id);
>  
> @@ -943,6 +977,39 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
>  	return 0;
>  }
>  
> +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> +			       struct uvc_control *ctrl)
> +{

I would declare

	u8 data;

here, and

> +	int ret = 0;
> +
> +	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> +		return -EACCES;
> +
> +	if (ctrl->loaded)
> +		return 0;
> +

set

	data = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT);

here, and

> +	if (ctrl->entity->get_cur) {
> +		ret = ctrl->entity->get_cur(chain->dev,
> +			ctrl->entity,
> +			ctrl->info.selector,
> +			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +			ctrl->info.size);

improve indentation here

		ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
					    ctrl->info.selector, data,
					    ctrl->info.size);


> +	} else {

and also use data here

> +		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> +				     ctrl->entity->id, chain->dev->intfnum,
> +				     ctrl->info.selector,
> +				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +				     ctrl->info.size);

		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
				     ctrl->entity->id, chain->dev->intfnum,
				     ctrl->info.selector, data,
				     ctrl->info.size);

> +	}
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	ctrl->loaded = 1;
> +
> +	return ret;
> +}
> +
>  static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>  				const u8 *data)
>  {
> @@ -963,35 +1030,19 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>  	return value;
>  }
>  
> -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> -	struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> -	s32 *value)
> +static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
> +			      struct uvc_control *ctrl,
> +			      struct uvc_control_mapping *mapping,
> +			      s32 *value)
>  {
>  	int ret;
>  
> -	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> -		return -EACCES;
> -
> -	if (!ctrl->loaded) {
> -		if (ctrl->entity->get_cur) {
> -			ret = ctrl->entity->get_cur(chain->dev,
> -				ctrl->entity,
> -				ctrl->info.selector,
> -				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -				ctrl->info.size);
> -		} else {
> -			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> -				ctrl->entity->id,
> -				chain->dev->intfnum,
> -				ctrl->info.selector,
> -				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -				ctrl->info.size);
> -		}
> -		if (ret < 0)
> -			return ret;
> +	if (mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
> +		return -EINVAL;
>  
> -		ctrl->loaded = 1;
> -	}
> +	ret = __uvc_ctrl_load_cur(chain, ctrl);
> +	if (ret < 0)
> +		return ret;
>  
>  	*value = __uvc_ctrl_get_value(mapping,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> @@ -999,6 +1050,57 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>  	return 0;
>  }
>  
> +static int __uvc_ctrl_get_compound_to_user(struct uvc_control_mapping *mapping,

I don't like this name much. One option would be to rename the
__uvc_ctrl_get_compound() function below to
__uvc_ctrl_get_compound_cur() and call this function
__uvc_ctrl_get_compound(). Better options are likely possible.

> +					   struct uvc_control *ctrl,
> +					   int id,
> +					   struct v4l2_ext_control *xctrl)
> +{
> +	int ret, size;

size is never negative, make it an unsigned int.

> +	u8 *data;
> +
> +	if (WARN_ON(!mapping->size % 8))
> +		return -EINVAL;

This duplicates a check in the get_array function. Let's move all those
checks to the function that adds mappings.

> +
> +	size = mapping->size / 8;
> +	if (xctrl->size < size) {
> +		xctrl->size = size;
> +		return -ENOSPC;
> +	}
> +
> +	data = kmalloc(size, GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = mapping->get_array(mapping, uvc_ctrl_data(ctrl, id), data);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = copy_to_user(xctrl->ptr, data, size) ? -EFAULT : 0;
> +
> +out:
> +	kfree(data);
> +	return ret;
> +}
> +
> +static int __uvc_ctrl_get_compound(struct uvc_video_chain *chain,
> +				   struct uvc_control *ctrl,
> +				   struct uvc_control_mapping *mapping,
> +				   struct v4l2_ext_control *xctrl)
> +{
> +	int ret;
> +
> +	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> +		return -EINVAL;
> +
> +	ret = __uvc_ctrl_load_cur(chain, ctrl);
> +	if (ret < 0)
> +		return ret;
> +
> +	return __uvc_ctrl_get_compound_to_user(mapping, ctrl,
> +					       UVC_CTRL_DATA_CURRENT,
> +					       xctrl);
> +}
> +
>  static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  				  u32 found_id)
>  {
> @@ -1102,10 +1204,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  
>  	if (mapping->master_id)
>  		__uvc_find_control(ctrl->entity, mapping->master_id,
> -				   &master_map, &master_ctrl, 0);
> +				   &master_map, &master_ctrl, 0, 0);
>  	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> -		s32 val;
> -		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +		int ret;
> +		s32 val = 0;

Move ret after val.

> +
> +		if (master_map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
> +			return -EINVAL;
> +
> +		ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -1113,6 +1220,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>  	}
>  
> +	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
> +		v4l2_ctrl->default_value = 0;
> +		v4l2_ctrl->minimum = 0;
> +		v4l2_ctrl->maximum = 0;
> +		v4l2_ctrl->step = 0;
> +		return 0;
> +	}
> +
>  	if (!ctrl->cached) {
>  		int ret = uvc_ctrl_populate_cache(chain, ctrl);
>  		if (ret < 0)
> @@ -1346,11 +1462,12 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>  	s32 val = 0;
>  
> -	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
> +	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
>  	if (ctrl == NULL)
>  		return;
>  
> -	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
> +	if (mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES ||
> +	    __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
>  		changes |= V4L2_EVENT_CTRL_CH_VALUE;
>  
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> @@ -1517,7 +1634,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>  		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>  		s32 val = 0;
>  
> -		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
> +		if (mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES ||
> +		    __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
>  			changes |= V4L2_EVENT_CTRL_CH_VALUE;
>  
>  		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
> @@ -1647,7 +1765,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
>  
>  	for (i = 0; i < ctrls->count; i++) {
>  		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
> -				   &ctrl_found, 0);
> +				   &ctrl_found, 0, 0);
>  		if (uvc_control == ctrl_found)
>  			return i;
>  	}
> @@ -1694,11 +1812,14 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  	if (ctrl == NULL)
>  		return -EINVAL;
>  
> -	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> +	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> +		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
> +	else
> +		return __uvc_ctrl_get_compound(chain, ctrl, mapping, xctrl);
>  }
>  
> -int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> -		       struct v4l2_ext_control *xctrl)
> +int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
> +			     struct v4l2_ext_control *xctrl)
>  {
>  	struct v4l2_queryctrl qc = { .id = xctrl->id };
>  	int ret = uvc_query_v4l2_ctrl(chain, &qc);
> @@ -1710,6 +1831,56 @@ int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
>  	return 0;
>  }
>  
> +int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> +		       struct v4l2_ext_control *xctrl)
> +{
> +	struct uvc_control *ctrl;
> +	struct uvc_control_mapping *mapping;
> +	int ret;
> +
> +	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> +		return -EACCES;
> +

This check comes a bit out of the blue, I think it belongs to another
patch, with a commit message that clearly explain the rationale.

> +	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> +	if (!ctrl)
> +		return -EINVAL;

And here, you're duplicating the uvc_find_control() call from
uvc_query_v4l2_ctrl(), called in __uvc_ctrl_get_fixed_std().
Furthermore, you're not holding the ctrl_mutex lock here, which I think
is wrong.

I'd like to see a patch before this one that refactors what needs to be
refactored first, and then the introduction of compound types support
without any extra change like this. Splitting code out to
__uvc_ctrl_load_cur() could also be moved to a preparatory patch to
simplify this one, it's quite hard to review.

> +
> +	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> +		return __uvc_ctrl_get_fixed_std(chain, xctrl);
> +
> +	if (!ctrl->cached) {
> +		ret = uvc_ctrl_populate_cache(chain, ctrl);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return __uvc_ctrl_get_compound_to_user(mapping, ctrl, UVC_CTRL_DATA_DEF,
> +					       xctrl);
> +}
> +
> +int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
> +			    struct v4l2_ext_control *xctrl,
> +			    struct uvc_control *ctrl)
> +{
> +	int ret;
> +	u8 *data;

Please move ret after data.

> +
> +	data = kmalloc(xctrl->size, GFP_KERNEL);

A limit on the size is needed to avoid denial of service attacks.

> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = copy_from_user(data, xctrl->ptr, xctrl->size);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = mapping->set_array(mapping, data,
> +			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));

	ret = mapping->set_array(mapping, data,
				 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));

The V4L2 control model is that the kernel can update the value of a
control if the requested value is out of range or otherwise not
acceptable. You should here copy the data back to the user.

> +
> +out:
> +	kfree(data);
> +	return ret;
> +}
> +
>  int uvc_ctrl_set(struct uvc_fh *handle,
>  	struct v4l2_ext_control *xctrl)
>  {
> @@ -1820,8 +1991,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  		       ctrl->info.size);
>  	}
>  
> -	mapping->set(mapping, value,
> -		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +	if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES) {
> +		mapping->set(mapping, value,
> +			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +	} else {
> +		ret = __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>  		ctrl->handle = handle;
> @@ -2220,10 +2397,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  		return -ENOMEM;
>  	}
>  
> -	if (map->get == NULL)
> +	if (!map->get && map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
>  		map->get = uvc_get_le_value;
> -	if (map->set == NULL)
> +	if (!map->set && map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
>  		map->set = uvc_set_le_value;
> +	if (!map->get_array && map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
> +		map->get_array = uvc_get_array;
> +	if (!map->set_array && map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES)
> +		map->set_array = uvc_set_array;
>  
>  	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
>  		if (V4L2_CTRL_ID2WHICH(uvc_control_classes[i]) ==
> @@ -2233,6 +2414,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  		}
>  	}
>  
> +	if (map->v4l2_type < V4L2_CTRL_COMPOUND_TYPES &&
> +	    WARN_ON(!map->get || !map->set))
> +		return -EINVAL;
> +
> +	if (map->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES &&
> +	    WARN_ON(!map->get_array || !map->set_array))
> +		return -EINVAL;
> +

Can this happen, given that you set them above if they're null ?

>  	list_add_tail(&map->list, &ctrl->info.mappings);
>  	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
>  		uvc_map_get_name(map), ctrl->info.entity,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index ba028ba7c34e..2f9b75faae83 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -262,8 +262,12 @@ struct uvc_control_mapping {
>  
>  	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
>  		   const u8 *data);
> +	int (*get_array)(struct uvc_control_mapping *mapping, const u8 *data,
> +			 u8 *data_out);
>  	void (*set)(struct uvc_control_mapping *mapping, s32 value,
>  		    u8 *data);
> +	int (*set_array)(struct uvc_control_mapping *mapping, const u8 *data_in,
> +			 u8 *data);

Wouldn't those operations be better names get_compound and set_compound ?

>  };
>  
>  struct uvc_control {

-- 
Regards,

Laurent Pinchart
