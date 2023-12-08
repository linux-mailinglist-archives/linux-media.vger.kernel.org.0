Return-Path: <linux-media+bounces-1966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D6D80A694
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 207671F2139A
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CAA208C1;
	Fri,  8 Dec 2023 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rd2BBi2Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B117F122
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:07:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B48AB512;
	Fri,  8 Dec 2023 16:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702047984;
	bh=dOuRg5XRtEvxvBOxZygxSYaLQfzg2BeEpHyaQSArKUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rd2BBi2QL54gFKJ0uyo4dZwsFu9QxqSPGepzDcfhHrsurNcQZSLX4eHE2ptKa3Vdq
	 zfgDXhbiHYtCKdcALza7AsCr9oJsc5RYylaqhRtWt2ADp0ZrpWnKSYAqgtXU0OyXJU
	 kyL3t0sFeXh03scaRBjVOKExEl1dsK4G+L0Cb3fY=
Date: Fri, 8 Dec 2023 17:07:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yunke Cao <yunkec@google.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v14 05/11] media: uvcvideo: Add support for compound
 controls
Message-ID: <20231208150713.GB22113@pendragon.ideasonboard.com>
References: <20231201071907.3080126-1-yunkec@google.com>
 <20231201071907.3080126-6-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-6-yunkec@google.com>

Hi Yunke,

Thank you for the patch.

On Fri, Dec 01, 2023 at 04:18:56PM +0900, Yunke Cao wrote:
> Supports getting/setting current value.
> Supports getting default value.
> Handles V4L2_CTRL_FLAG_NEXT_COMPOUND.

Please write a better commit message.

> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v11:
> - No change.
> Changelog since v10:
> - Rewrite some logic in __uvc_find_control().
> - Remove a duplicate check in __uvc_ctrl_get_compound_cur().
> - Thanks, Daniel!
> Changelog since v9:
> - Make __uvc_ctrl_set_compound() static.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Fixed comments styles, indentation and a few other style issues.
> - Renamed uvc_g/set_array() to uvc_g/set_compound().
> - Moved size check to __uvc_ctrl_add_mapping().
> - After setting a new value, copy it back to user.
> - In __uvc_ctrl_set_compound(), check size before allocating.
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 179 +++++++++++++++++++++++++++----
>  drivers/media/usb/uvc/uvcvideo.h |   4 +
>  2 files changed, 164 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 98254b93eb46..aae2480496b7 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -884,6 +884,28 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>  	}
>  }
>  
> +/*
> + * Extract the byte array specified by mapping->offset and mapping->data_size
> + * stored at 'data' to the output array 'data_out'.
> + */
> +static int uvc_get_compound(struct uvc_control_mapping *mapping, const u8 *data,
> +			    u8 *data_out)
> +{
> +	memcpy(data_out, data + mapping->offset / 8, mapping->data_size / 8);
> +	return 0;
> +}
> +
> +/*
> + * Copy the byte array 'data_in' to the destination specified by mapping->offset
> + * and mapping->data_size stored at 'data'.
> + */
> +static int uvc_set_compound(struct uvc_control_mapping *mapping,
> +			    const u8 *data_in, u8 *data)
> +{
> +	memcpy(data + mapping->offset / 8, data_in, mapping->data_size / 8);
> +	return 0;
> +}
> +

I may be missing something, but isn't this essentially dead code ? This
series adds support for a single compound control, with custom get/set
handlers, so these two default handlers will never be called.

I don't think it makes sense to have default handlers for compound
controls, I don't foresee any use case where a simple mempcy() will do
the right thing.

>  static bool
>  uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
>  {
> @@ -906,7 +928,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
>  
>  static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
>  	struct uvc_control_mapping **mapping, struct uvc_control **control,
> -	int next)
> +	int next, int next_compound)
>  {
>  	struct uvc_control *ctrl;
>  	struct uvc_control_mapping *map;
> @@ -921,14 +943,16 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
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
> +			    (uvc_ctrl_mapping_is_compound(map) ?
> +			     next_compound : next)) {
>  				*control = ctrl;
>  				*mapping = map;
>  			}
> @@ -942,6 +966,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl = NULL;
>  	struct uvc_entity *entity;
>  	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> +	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
>  
>  	*mapping = NULL;
>  
> @@ -950,12 +975,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
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
> @@ -1101,12 +1127,59 @@ static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
>  	return 0;
>  }
>  
> +static int __uvc_ctrl_get_compound(struct uvc_control_mapping *mapping,
> +				   struct uvc_control *ctrl,
> +				   int id,
> +				   struct v4l2_ext_control *xctrl)
> +{
> +	u8 size;
> +	u8 *data;
> +	int ret;
> +
> +	size = mapping->v4l2_size / 8;
> +	if (xctrl->size < size) {
> +		xctrl->size = size;
> +		return -ENOSPC;
> +	}
> +
> +	data = kmalloc(size, GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = mapping->get_compound(mapping, uvc_ctrl_data(ctrl, id), data);
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
> +static int __uvc_ctrl_get_compound_cur(struct uvc_video_chain *chain,
> +				       struct uvc_control *ctrl,
> +				       struct uvc_control_mapping *mapping,
> +				       struct v4l2_ext_control *xctrl)
> +{
> +	int ret;
> +
> +	ret = __uvc_ctrl_load_cur(chain, ctrl);
> +	if (ret < 0)
> +		return ret;
> +
> +	return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT,
> +				       xctrl);
> +}
> +
>  static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  				  u32 found_id)
>  {
> -	bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
>  	unsigned int i;
>  
> +	bool find_next = req_id &
> +		(V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND);
> +
>  	req_id &= V4L2_CTRL_ID_MASK;
>  
>  	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
> @@ -1194,7 +1267,7 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	}
>  
>  	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> -			   &master_ctrl, 0);
> +			   &master_ctrl, 0, 0);
>  
>  	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
>  		return 0;
> @@ -1262,7 +1335,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  
>  	if (mapping->master_id)
>  		__uvc_find_control(ctrl->entity, mapping->master_id,
> -				   &master_map, &master_ctrl, 0);
> +				   &master_map, &master_ctrl, 0, 0);
>  	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
>  		s32 val = 0;
>  		int ret;
> @@ -1278,6 +1351,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
> @@ -1533,7 +1615,7 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>  	s32 val = 0;
>  
> -	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
> +	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
>  	if (ctrl == NULL)
>  		return;
>  
> @@ -1843,7 +1925,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
>  
>  	for (i = 0; i < ctrls->count; i++) {
>  		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
> -				   &ctrl_found, 0);
> +				   &ctrl_found, 0, 0);
>  		if (uvc_control == ctrl_found)
>  			return i;
>  	}
> @@ -1891,7 +1973,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  		return -EINVAL;
>  
>  	if (uvc_ctrl_mapping_is_compound(mapping))
> -		return -EINVAL;
> +		return __uvc_ctrl_get_compound_cur(chain, ctrl, mapping, xctrl);
>  	else
>  		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
>  }
> @@ -1912,6 +1994,22 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
>  	return 0;
>  }
>  
> +static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
> +					    struct uvc_control *ctrl,
> +					    struct uvc_control_mapping *mapping,
> +					    struct v4l2_ext_control *xctrl)
> +{
> +	int ret;
> +
> +	if (!ctrl->cached) {
> +		ret = uvc_ctrl_populate_cache(chain, ctrl);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_DEF, xctrl);
> +}
> +
>  int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
>  			  struct v4l2_ext_control *xctrl)
>  {
> @@ -1929,7 +2027,8 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
>  	}
>  
>  	if (uvc_ctrl_mapping_is_compound(mapping))
> -		ret = -EINVAL;
> +		ret = __uvc_ctrl_get_boundary_compound(chain, ctrl, mapping,
> +						       xctrl);
>  	else
>  		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
>  
> @@ -1938,6 +2037,34 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
>  	return ret;
>  }
>  
> +static int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
> +				   struct v4l2_ext_control *xctrl,
> +				   struct uvc_control *ctrl)
> +{
> +	u8 *data;
> +	int ret;
> +
> +	if (xctrl->size != mapping->v4l2_size / 8)
> +		return -EINVAL;
> +
> +	data = kmalloc(xctrl->size, GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = copy_from_user(data, xctrl->ptr, xctrl->size);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = mapping->set_compound(mapping, data,
> +			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +
> +	__uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT, xctrl);

Why do you need to call __uvc_ctrl_get_compound() here ?

> +
> +out:
> +	kfree(data);
> +	return ret;
> +}
> +
>  int uvc_ctrl_set(struct uvc_fh *handle,
>  	struct v4l2_ext_control *xctrl)
>  {
> @@ -2052,13 +2179,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  		       ctrl->info.size);
>  	}
>  
> -	if (uvc_ctrl_mapping_is_compound(mapping))
> -		return -EINVAL;
> -	else
> +	if (uvc_ctrl_mapping_is_compound(mapping)) {
> +		ret = __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
> +		if (ret < 0)
> +			return ret;
> +	} else
>  		mapping->set(mapping, value,
>  			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));

I really don't like how handling of compound controls is scattered
everywhere :-( That makes the code difficult to read, and thus more
error-prone.

Could this be refactored to simplify the implementation ? In particular,
I'm thinking about

- Moving the copy_from_user() and copy_to_user() towards the top of the
  call stack, directly in uvc_ctrl_get(), uvc_ctrl_get_boundary() and
  uvc_ctrl_set() 

- Merging the .[gs]et() and .[gs]et_compound() functions (see below)

- Moving the value clamping from uvc_set_compound_rect() to
  uvc_ctrl_set(), with the rest of the clamping code

>  
> -
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>  		ctrl->handle = handle;
>  
> @@ -2468,10 +2596,23 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  			goto err_nomem;
>  	}
>  
> -	if (map->get == NULL)
> +	if (uvc_ctrl_mapping_is_compound(map)) {
> +		if (map->data_size != map->v4l2_size)
> +			return -EINVAL;

If the two values have to be the same, why do we have two fields ?

> +
> +		/* Only supports byte-aligned data. */
> +		if (WARN_ON(map->offset % 8 || map->data_size % 8))
> +			return -EINVAL;
> +	}
> +
> +	if (!map->get && !uvc_ctrl_mapping_is_compound(map))
>  		map->get = uvc_get_le_value;
> -	if (map->set == NULL)
> +	if (!map->set && !uvc_ctrl_mapping_is_compound(map))
>  		map->set = uvc_set_le_value;
> +	if (!map->get_compound && uvc_ctrl_mapping_is_compound(map))
> +		map->get_compound = uvc_get_compound;
> +	if (!map->set_compound && uvc_ctrl_mapping_is_compound(map))
> +		map->set_compound = uvc_set_compound;
>  
>  	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
>  		if (V4L2_CTRL_ID2WHICH(uvc_control_classes[i]) ==
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 7bc41270ed94..11805b729c22 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -129,8 +129,12 @@ struct uvc_control_mapping {
>  
>  	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
>  		   const u8 *data);
> +	int (*get_compound)(struct uvc_control_mapping *mapping, const u8 *data,
> +			    u8 *data_out);
>  	void (*set)(struct uvc_control_mapping *mapping, s32 value,
>  		    u8 *data);
> +	int (*set_compound)(struct uvc_control_mapping *mapping, const u8 *data_in,
> +			    u8 *data);

Instead of adding new functions, I think we could modify the existing
.get() and .set() handlers to be usable for compound controls.

	int (*get)(struct uvc_control_mapping *mapping, u8 query,
		   const u8 *data_in, void *data_out);
	void (*set)(struct uvc_control_mapping *mapping, const void *data_in,
		    u8 *data_out);

For additional safety, you could pass the size of the void * buffer to
the functions.

>  };
>  
>  struct uvc_control {

-- 
Regards,

Laurent Pinchart

