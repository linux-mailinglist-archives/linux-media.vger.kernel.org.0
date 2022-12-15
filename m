Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7461764DC5F
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 14:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiLONkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 08:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiLONkU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 08:40:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C0DDF9D
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 05:40:19 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1822A327;
        Thu, 15 Dec 2022 14:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671111617;
        bh=OG0PU1Q7/TyjKtKY5lMotaNwiNo+jUcLTBteCxE5+Nw=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=G5l+QUM7pzyE64J8RhBxGXHI9HElY+4P8wJo5yO2dKZ7330AzFjvgvr1Rhla+Urel
         pLMMVO7FQ3LK2nLHQNlRzkmSehFFWyw98F0MM+eF5ezt0t2ip9aFr7F7pDDnP+l7DU
         tnu9FgCKXMRzPMhmR+skDGty3ATqbpgSSqp1AABk=
Message-ID: <ef2b5cb5-240c-a86a-263d-a430de2b2cce@ideasonboard.com>
Date:   Thu, 15 Dec 2022 13:40:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20221109060621.704531-1-yunkec@google.com>
 <20221109060621.704531-6-yunkec@google.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v10 05/11] media: uvcvideo: Add support for compound
 controls
In-Reply-To: <20221109060621.704531-6-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke

On 09/11/2022 06:06, Yunke Cao wrote:
> Supports getting/setting current value.
> Supports getting default value.
> Handles V4L2_CTRL_FLAG_NEXT_COMPOUND.
>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
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
>   drivers/media/usb/uvc/uvc_ctrl.c | 184 ++++++++++++++++++++++++++++---
>   drivers/media/usb/uvc/uvcvideo.h |   4 +
>   2 files changed, 170 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 5c4aa4b82218..7d86aa695b34 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -837,6 +837,28 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>   	}
>   }
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
>   static bool
>   uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
>   {
> @@ -859,7 +881,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
>   
>   static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
>   	struct uvc_control_mapping **mapping, struct uvc_control **control,
> -	int next)
> +	int next, int next_compound)
>   {
>   	struct uvc_control *ctrl;
>   	struct uvc_control_mapping *map;
> @@ -874,14 +896,17 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
>   			continue;
>   
>   		list_for_each_entry(map, &ctrl->info.mappings, list) {
> -			if ((map->id == v4l2_id) && !next) {
> +			if (map->id == v4l2_id && !next && !next_compound) {
>   				*control = ctrl;
>   				*mapping = map;
>   				return;
>   			}
>   
>   			if ((*mapping == NULL || (*mapping)->id > map->id) &&
> -			    (map->id > v4l2_id) && next) {
> +			    (map->id > v4l2_id) &&
> +			    ((!uvc_ctrl_mapping_is_compound(map) && next) ||
> +			     (uvc_ctrl_mapping_is_compound(map) &&
> +			      next_compound))) {


I think I'd do (uvc_ctrl_mapping_is_compound(map) ? next_compound : next))

>   				*control = ctrl;
>   				*mapping = map;
>   			}
> @@ -895,6 +920,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>   	struct uvc_control *ctrl = NULL;
>   	struct uvc_entity *entity;
>   	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> +	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
>   
>   	*mapping = NULL;
>   
> @@ -903,12 +929,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>   
>   	/* Find the control. */
>   	list_for_each_entry(entity, &chain->entities, chain) {
> -		__uvc_find_control(entity, v4l2_id, mapping, &ctrl, next);
> -		if (ctrl && !next)
> +		__uvc_find_control(entity, v4l2_id, mapping, &ctrl, next,
> +				   next_compound);
> +		if (ctrl && !next && !next_compound)
>   			return ctrl;
>   	}
>   
> -	if (ctrl == NULL && !next)
> +	if (!ctrl && !next && !next_compound)
>   		uvc_dbg(chain->dev, CONTROL, "Control 0x%08x not found\n",
>   			v4l2_id);
>   


Actually, is next_compound even needed? Can we just set next = v4l2_id & 
(V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND)?

> @@ -1048,10 +1075,59 @@ static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
>   	return 0;
>   }
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
> +	if (!uvc_ctrl_mapping_is_compound(mapping))
> +		return -EINVAL;


This is already guarded against in uvc_ctrl_get()

> +
> +	ret = __uvc_ctrl_load_cur(chain, ctrl);
> +	if (ret < 0)
> +		return ret;
> +
> +	return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT,
> +				       xctrl);
> +}
> +
>   static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>   				  u32 found_id)
>   {
>   	bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> +	bool find_next_compound = req_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
>   	unsigned int i;
>   
>   	req_id &= V4L2_CTRL_ID_MASK;
> @@ -1059,7 +1135,7 @@ static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>   	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
>   		if (!(chain->ctrl_class_bitmap & BIT(i)))
>   			continue;
> -		if (!find_next) {
> +		if (!find_next && !find_next_compound) {


Same as above; can we make do with find_next = req_id 
&(V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND)?

>   			if (uvc_control_classes[i] == req_id)
>   				return i;
>   			continue;
> @@ -1151,7 +1227,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>   
>   	if (mapping->master_id)
>   		__uvc_find_control(ctrl->entity, mapping->master_id,
> -				   &master_map, &master_ctrl, 0);
> +				   &master_map, &master_ctrl, 0, 0);
>   	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
>   		s32 val = 0;
>   		int ret;
> @@ -1167,6 +1243,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>   				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>   	}
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
>   	if (!ctrl->cached) {
>   		int ret = uvc_ctrl_populate_cache(chain, ctrl);
>   		if (ret < 0)
> @@ -1400,7 +1485,7 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>   	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>   	s32 val = 0;
>   
> -	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
> +	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
>   	if (ctrl == NULL)
>   		return;
>   
> @@ -1706,7 +1791,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
>   
>   	for (i = 0; i < ctrls->count; i++) {
>   		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
> -				   &ctrl_found, 0);
> +				   &ctrl_found, 0, 0);
>   		if (uvc_control == ctrl_found)
>   			return i;
>   	}
> @@ -1754,7 +1839,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>   		return -EINVAL;
>   
>   	if (uvc_ctrl_mapping_is_compound(mapping))
> -		return -EINVAL;
> +		return __uvc_ctrl_get_compound_cur(chain, ctrl, mapping, xctrl);
>   	else
>   		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
>   }
> @@ -1776,6 +1861,25 @@ static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
>   	return 0;
>   }
>   
> +static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *chain,
> +					    struct uvc_control *ctrl,
> +					    struct uvc_control_mapping *mapping,
> +					    struct v4l2_ext_control *xctrl)
> +{
> +	int ret;
> +
> +	if (!uvc_ctrl_mapping_is_compound(mapping))
> +		return -EINVAL;


This is already guarded against in uvc_ctrl_get_boundary()

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
>   int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
>   			  struct v4l2_ext_control *xctrl)
>   {
> @@ -1793,7 +1897,8 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
>   	}
>   
>   	if (uvc_ctrl_mapping_is_compound(mapping))
> -		ret = -EINVAL;
> +		ret = __uvc_ctrl_get_boundary_compound(chain, ctrl, mapping,
> +						       xctrl);
>   	else
>   		ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
>   
> @@ -1802,6 +1907,34 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
>   	return ret;
>   }
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
> +
> +out:
> +	kfree(data);
> +	return ret;
> +}
> +
>   int uvc_ctrl_set(struct uvc_fh *handle,
>   	struct v4l2_ext_control *xctrl)
>   {
> @@ -1903,12 +2036,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>   		       ctrl->info.size);
>   	}
>   
> -	if (!uvc_ctrl_mapping_is_compound(mapping))
> +	if (!uvc_ctrl_mapping_is_compound(mapping)) {
>   		mapping->set(mapping, value,
>   			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> -	else
> -		return -EINVAL;
> -
> +	} else {
> +		ret = __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
> +		if (ret < 0)
> +			return ret;
> +	}
>   
>   	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>   		ctrl->handle = handle;
> @@ -2308,10 +2443,23 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>   		return -ENOMEM;
>   	}
>   
> -	if (map->get == NULL)
> +	if (uvc_ctrl_mapping_is_compound(map)) {
> +		if (map->data_size != map->v4l2_size)
> +			return -EINVAL;
> +
> +		/* Only supports byte-aligned data. */
> +		if (WARN_ON(map->offset % 8 || map->data_size % 8))
> +			return -EINVAL;
> +	}
> +
> +	if (!map->get && !uvc_ctrl_mapping_is_compound(map))
>   		map->get = uvc_get_le_value;
> -	if (map->set == NULL)
> +	if (!map->set && !uvc_ctrl_mapping_is_compound(map))
>   		map->set = uvc_set_le_value;
> +	if (!map->get_compound && uvc_ctrl_mapping_is_compound(map))
> +		map->get_compound = uvc_get_compound;
> +	if (!map->set_compound && uvc_ctrl_mapping_is_compound(map))
> +		map->set_compound = uvc_set_compound;
>   
>   	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
>   		if (V4L2_CTRL_ID2WHICH(uvc_control_classes[i]) ==
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 8f7938205a63..1e1bccd3b2e5 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -129,8 +129,12 @@ struct uvc_control_mapping {
>   
>   	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
>   		   const u8 *data);
> +	int (*get_compound)(struct uvc_control_mapping *mapping, const u8 *data,
> +			    u8 *data_out);
>   	void (*set)(struct uvc_control_mapping *mapping, s32 value,
>   		    u8 *data);
> +	int (*set_compound)(struct uvc_control_mapping *mapping, const u8 *data_in,
> +			    u8 *data);
>   };
>   
>   struct uvc_control {
