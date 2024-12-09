Return-Path: <linux-media+bounces-22925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6D09E974B
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A96218842CC
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD051ACEC3;
	Mon,  9 Dec 2024 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YDOEn1fY"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FBF1A23BA
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733751355; cv=none; b=R5otzgmCODGoNtX7DNoq+IeXYAQlQSAbu/gWKvz0M/1/9prhSm3sLFf/vrW5iBh0vekDyn5BgPrjZdcDyJ5HXH0U80hgUHB6odgq1HR3ORL1SmfTM9iX1WLQP964KGEZLZdcWx6ihUCuUCEj8jlXS1xtTLfQhiAn8xfeT8bQqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733751355; c=relaxed/simple;
	bh=OwTz/fXy5CL7DOzekICP5s4FkGhO84l0lG4TRBQuhjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhFDJtsFVN3uUhyomq6qaW1Qs8gJVCtv+IY1TLPofh9XMV4HacaqZ+h9cowkzQcizdly8dU89ag2nTqF5jEX197rIdIdvgGZBSCrTBl76zjTAadYFDF7Qo1GL2M/jDkz38kPKwxCdaZAnN+hcy4R3zB8CRVb0GP+Cokmpvyn8YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YDOEn1fY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733751352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QmY1xxdHEPsu2Mfx9M0s9LcdH+OERgnMD2LpRJM9X2g=;
	b=YDOEn1fY6+mkaVATUJqjrlhMNGyM6cf7jaCb0i2umdH7TRaSz/QYUJH8q6Oie/Atauz9m6
	mI0ZXU0BtT05eXrardb89PBcQGhtcrq5Qk+V7Ii12jhyPMNJqNUHiLZU9tRd79uQzJnQV8
	Dl0Bob7k0HIE7UEKU6NE6eLFcjbHq8w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-azxN2QlaNPK4SByd2W6c5Q-1; Mon, 09 Dec 2024 08:35:50 -0500
X-MC-Unique: azxN2QlaNPK4SByd2W6c5Q-1
X-Mimecast-MFC-AGG-ID: azxN2QlaNPK4SByd2W6c5Q
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d3d6d924c1so2328602a12.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 05:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751350; x=1734356150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmY1xxdHEPsu2Mfx9M0s9LcdH+OERgnMD2LpRJM9X2g=;
        b=CxevltLifoUs8WgSdTLoK+bIeNc7HOmaiiCF7sivWIwj9jbMg7wa0KaW+VtvzL1TGm
         wrHEXZHDYwOFXGNSyqrYGd0lbRYhzwkZC2QprItdq200QGP/VXqqLCZd8OlNitT6mCwQ
         Z32WJJVWdLSG6fJslyTLxjYDsZR5GMEE2pKn5IQRmXPiCYNMttl59vJrjnK5yWGX+nAZ
         6nNF5YoEoJgx+fevPqq39l71SwqVay0rmEN2NZPMCaM0maNFMSFmm+MoxZHs5uUCcdNT
         7n0yVlvBHUMwqay+ww2SnRw83iSKB69Aze4P5NkHTNc0R2s8lI1CIPxfG1A6yb6Wf310
         /tsw==
X-Forwarded-Encrypted: i=1; AJvYcCW8jljuNdSndl9KoGCvRpmDkxRq9yGR5nt0iMj2e3K/FzwwMI7ffWujKc67u2hg/yEap7oK7GPqmbk85A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw90/KD6XldtLnAMBjpK88CX65Hi3XDQgvb6u9DV5ZtF+JV40g0
	G+onF+LXseDw1vQfvLWn3UobyP0YTIUu/bFba6Jh438SvBpCZyCSiORDbrbIumLvqyPn2vGWEUr
	Fm75WzxC4ve+UDW1QvHTBgGjKBj0IIEPyR2B70U+O0mz1qHJd+Wuocos7lT3N
X-Gm-Gg: ASbGncsoyTEyailDM9PGkryMoexTplv4xGtXubCEv5K9KupMjvzzATD4EBNECADx1/P
	E0a8tz32EUKxigP1Lf0vqFW8nyNcBpQ1M9txkcb2D3ONIbdzq4vGZ46dLKs35s/WIaHtHMMJbIG
	xeJcVq7wiejR0DDqBcp1UgJHlx5j1avS0dCAQIQM7KtyWLCc2gfYjL/NOObRDZ/l8twcJjXnswk
	tje7j6wQ3Su1Xtn65ifN5LOoVaj9rvOqzrQwoXq0u7IACJD9FCYescTOw==
X-Received: by 2002:a05:6402:50d4:b0:5d0:214b:9d15 with SMTP id 4fb4d7f45d1cf-5d4184f7a9bmr796542a12.5.1733751349415;
        Mon, 09 Dec 2024 05:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7MZiX96hWP5SujVf02wjdzjstyxdCKpmUWd5kXNUW5vhOspXN3cGz/stOYjexSqTgQjTl/g==
X-Received: by 2002:a05:6402:50d4:b0:5d0:214b:9d15 with SMTP id 4fb4d7f45d1cf-5d4184f7a9bmr796461a12.5.1733751348228;
        Mon, 09 Dec 2024 05:35:48 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3c270ccdasm4873407a12.63.2024.12.09.05.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:35:47 -0800 (PST)
Message-ID: <2f63296a-0792-41cb-8dd1-45892f6d20ea@redhat.com>
Date: Mon, 9 Dec 2024 14:35:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 11/19] media: uvcvideo: add support for compound
 controls
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-11-64cfeb56b6f8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-11-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> From: Yunke Cao <yunkec@google.com>
> 
> This patch adds support for compound controls. This is required to
> support controls that cannot be represented with a s64 data, such as the
> Region of Interest.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 224 ++++++++++++++++++++++++++++++++-------
>  drivers/media/usb/uvc/uvcvideo.h |   5 +
>  2 files changed, 192 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 893d12cd3f90..e51cd0a2228a 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -367,6 +367,11 @@ static const u32 uvc_control_classes[] = {
>  
>  static const int exposure_auto_mapping[] = { 2, 1, 4, 8 };
>  
> +static bool uvc_ctrl_mapping_is_compound(struct uvc_control_mapping *mapping)
> +{
> +	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
> +}
> +
>  static s32 uvc_mapping_get_s32(struct uvc_control_mapping *mapping,
>  			       u8 query, const void *data_in)
>  {
> @@ -1048,7 +1053,7 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
>  
>  static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
>  	struct uvc_control_mapping **mapping, struct uvc_control **control,
> -	int next)
> +	int next, int next_compound)
>  {
>  	struct uvc_control *ctrl;
>  	struct uvc_control_mapping *map;
> @@ -1063,14 +1068,16 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
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
> @@ -1084,6 +1091,7 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl = NULL;
>  	struct uvc_entity *entity;
>  	int next = v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> +	int next_compound = v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
>  
>  	*mapping = NULL;
>  
> @@ -1092,12 +1100,13 @@ static struct uvc_control *uvc_find_control(struct uvc_video_chain *chain,
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
> @@ -1220,7 +1229,8 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>  static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  				  u32 found_id)
>  {
> -	bool find_next = req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> +	bool find_next = req_id &
> +		(V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND);
>  	unsigned int i;
>  
>  	req_id &= V4L2_CTRL_ID_MASK;
> @@ -1310,10 +1320,12 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	}
>  
>  	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> -			   &master_ctrl, 0);
> +			   &master_ctrl, 0, 0);
>  
>  	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
>  		return 0;
> +	if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
> +		return -EIO;
>  
>  	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>  	if (ret >= 0 && val != mapping->master_manual)
> @@ -1377,10 +1389,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  
>  	if (mapping->master_id)
>  		__uvc_find_control(ctrl->entity, mapping->master_id,
> -				   &master_map, &master_ctrl, 0);
> +				   &master_map, &master_ctrl, 0, 0);
>  	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
>  		s32 val;
> -		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +		int ret;
> +
> +		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
> +			return -EIO;
> +
> +		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -1388,6 +1405,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,>  				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
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
> @@ -1627,11 +1653,12 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>  	s32 val = 0;
>  
> -	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
> +	__uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, 0);
>  	if (ctrl == NULL)
>  		return;
>  
> -	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
> +	if (uvc_ctrl_mapping_is_compound(mapping) ||
> +	    __uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
>  		changes |= V4L2_EVENT_CTRL_CH_VALUE;
>  
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> @@ -1650,7 +1677,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  	ctrl->handle = NULL;
>  
>  	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> -		s32 value = uvc_mapping_get_s32(mapping, UVC_GET_CUR, data);
> +		s32 value;
> +
> +		if (uvc_ctrl_mapping_is_compound(mapping))
> +			value = 0;
> +		else
> +			value = uvc_mapping_get_s32(mapping, UVC_GET_CUR, data);
>  
>  		/*
>  		 * handle may be NULL here if the device sends auto-update
> @@ -1736,6 +1768,7 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
>  
>  	for (i = 0; i < xctrls_count; ++i) {
>  		u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
> +		s32 value;
>  
>  		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
>  		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> @@ -1760,6 +1793,10 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
>  						  slave_id);
>  		}
>  
> +		if (uvc_ctrl_mapping_is_compound(mapping))
> +			value = 0;
> +		else
> +			value = xctrls[i].value;
>  		/*
>  		 * If the master is being modified in the same transaction
>  		 * flags may change too.
> @@ -1770,7 +1807,7 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
>  			changes |= V4L2_EVENT_CTRL_CH_FLAGS;
>  
>  		uvc_ctrl_send_event(handle->chain, handle, ctrl, mapping,
> -				    xctrls[i].value, changes);
> +				    value, changes);
>  	}
>  }
>  
> @@ -1802,7 +1839,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>  		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>  		s32 val = 0;
>  
> -		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
> +		if (uvc_ctrl_mapping_is_compound(mapping) ||
> +		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
>  			changes |= V4L2_EVENT_CTRL_CH_VALUE;
>  
>  		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
> @@ -1935,7 +1973,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
>  
>  	for (i = 0; i < ctrls->count; i++) {
>  		__uvc_find_control(entity, ctrls->controls[i].id, &mapping,
> -				   &ctrl_found, 0);
> +				   &ctrl_found, 0, 0);
>  		if (uvc_control == ctrl_found)
>  			return i;
>  	}
> @@ -1971,19 +2009,59 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  	return ret;
>  }
>  
> -int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
> -		 struct v4l2_ext_control *xctrl)
> +static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
> +					  struct uvc_control *ctrl,
> +					  struct uvc_control_mapping *mapping,
> +					  u32 which,
> +					  struct v4l2_ext_control *xctrl)
>  {
> -	struct uvc_control *ctrl;
> -	struct uvc_control_mapping *mapping;
> -
> -	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> -		return -EACCES;
> +	u8 *data __free(kfree) = NULL;
> +	size_t size;
> +	u8 query;
> +	int ret;
> +	int id;
>  
> -	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> -	if (ctrl == NULL)
> +	switch (which) {
> +	case V4L2_CTRL_WHICH_CUR_VAL:
> +		ret = __uvc_ctrl_load_cur(chain, ctrl);
> +		if (ret < 0)
> +			return ret;
> +		id = UVC_CTRL_DATA_CURRENT;
> +		query = UVC_GET_CUR;
> +		break;
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +		ret = uvc_ctrl_populate_cache(chain, ctrl);
> +		if (ret < 0)
> +			return ret;
> +		id = UVC_CTRL_DATA_DEF;
> +		query = UVC_GET_DEF;
> +		break;
> +	default:
>  		return -EINVAL;
> +	}
> +
> +	size = DIV_ROUND_UP(mapping->size, 8);
> +	if (xctrl->size < size) {
> +		xctrl->size = size;
> +		return -ENOSPC;
> +	}
> +
> +	data = kmalloc(size, GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = mapping->get(mapping, query, uvc_ctrl_data(ctrl, id), size, data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return copy_to_user(xctrl->ptr, data, size) ? -EFAULT : 0;
> +}
>  
> +static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
> +				     struct uvc_control *ctrl,
> +				     struct uvc_control_mapping *mapping,
> +				     u32 which, struct v4l2_ext_control *xctrl)
> +{
>  	switch (which) {
>  	case V4L2_CTRL_WHICH_CUR_VAL:
>  		return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> @@ -2002,6 +2080,33 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
>  	return -EINVAL;
>  }
>  
> +static int uvc_mapping_get_xctrl(struct uvc_video_chain *chain,
> +				 struct uvc_control *ctrl,
> +				 struct uvc_control_mapping *mapping,
> +				 u32 which, struct v4l2_ext_control *xctrl)
> +{
> +	if (uvc_ctrl_mapping_is_compound(mapping))
> +		return uvc_mapping_get_xctrl_compound(chain, ctrl, mapping,
> +						      which, xctrl);
> +	return uvc_mapping_get_xctrl_std(chain, ctrl, mapping, which, xctrl);
> +}
> +> +int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
> +		 struct v4l2_ext_control *xctrl)
> +{
> +	struct uvc_control *ctrl;
> +	struct uvc_control_mapping *mapping;
> +
> +	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> +		return -EACCES;
> +
> +	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	return uvc_mapping_get_xctrl(chain, ctrl, mapping, which, xctrl);
> +}
> +
>  static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
>  			  struct uvc_control *ctrl,
>  			  struct uvc_control_mapping *mapping,
> @@ -2085,6 +2190,37 @@ static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
>  	return 0;
>  }
>  
> +static int uvc_mapping_set_xctrl_compound(struct uvc_control *ctrl,
> +					  struct uvc_control_mapping *mapping,
> +					  struct v4l2_ext_control *xctrl)
> +{
> +	u8 *data __free(kfree) = NULL;
> +	size_t size;
> +
> +	size = DIV_ROUND_UP(mapping->size, 8);
> +	if (xctrl->size != size)
> +		return -EINVAL;
> +
> +	data = memdup_user(xctrl->ptr, size);
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return mapping->set(mapping, size, data,
> +			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +}
> +
> +static int uvc_mapping_set_xctrl(struct uvc_control *ctrl,
> +				 struct uvc_control_mapping *mapping,
> +				 struct v4l2_ext_control *xctrl)
> +{
> +	if (uvc_ctrl_mapping_is_compound(mapping))
> +		return uvc_mapping_set_xctrl_compound(ctrl, mapping, xctrl);
> +
> +	uvc_mapping_set_s32(mapping, xctrl->value,
> +			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +	return 0;
> +}
> +
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
>  {
>  	struct uvc_video_chain *chain = handle->chain;
> @@ -2122,8 +2258,9 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
>  		       ctrl->info.size);
>  	}
>  
> -	uvc_mapping_set_s32(mapping, xctrl->value,
> -			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +	ret = uvc_mapping_set_xctrl(ctrl, mapping, xctrl);
> +	if (ret)
> +		return ret;
>  
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>  		ctrl->handle = handle;
> @@ -2501,6 +2638,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	struct uvc_control_mapping *map;
>  	unsigned int size;
>  	unsigned int i;
> +	int ret;
>  >  	/*
>  	 * Most mappings come from static kernel data, and need to be duplicated.
> @@ -2518,8 +2656,10 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	/* For UVCIOC_CTRL_MAP custom control */
>  	if (mapping->name) {
>  		map->name = kstrdup(mapping->name, GFP_KERNEL);
> -		if (!map->name)
> -			goto err_nomem;
> +		if (!map->name) {
> +			ret = -ENOMEM;
> +			goto free_mem;
> +		}
>  	}
>  
>  	INIT_LIST_HEAD(&map->ev_subs);
> @@ -2529,21 +2669,31 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  		       * fls(mapping->menu_mask);
>  		map->menu_mapping = kmemdup(mapping->menu_mapping, size,
>  					    GFP_KERNEL);
> -		if (!map->menu_mapping)
> -			goto err_nomem;
> +		if (!map->menu_mapping) {
> +			ret = -ENOMEM;
> +			goto free_mem;
> +		}
>  	}
>  	if (mapping->menu_names && mapping->menu_mask) {
>  		size = sizeof(mapping->menu_names[0])
>  		       * fls(mapping->menu_mask);
>  		map->menu_names = kmemdup(mapping->menu_names, size,
>  					  GFP_KERNEL);
> -		if (!map->menu_names)
> -			goto err_nomem;
> +		if (!map->menu_names) {
> +			ret = -ENOMEM;
> +			goto free_mem;
> +		}
>  	}

All the -ENOMEM related changes above introduce a lot of churn / make things harder
to review.

How about keeping everything above as is (except for introducing "int ret;"

and then ... see remark below at err_nomem label.

>  
> -	if (map->get == NULL)
> +	if (uvc_ctrl_mapping_is_compound(map))
> +		if (WARN_ON(!map->set || !map->get)) {
> +			ret = -EIO;
> +			goto free_mem;
> +		}
> +
> +	if (!map->get)
>  		map->get = uvc_get_le_value;
> -	if (map->set == NULL)
> +	if (!map->set)
>  		map->set = uvc_set_le_value;
>  
>  	for (i = 0; i < ARRAY_SIZE(uvc_control_classes); i++) {

These 2 changes replacing "if (map->Xet == NULL) with "if (!map->Xet)"
are unrelated style changes, please drop these.

> @@ -2561,12 +2711,12 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  
>  	return 0;
>  

And here (continued from above) then keep err_nomem and replace
free_mem with err_free_mem and set ret = -ENOMEM on err_nomem label:

err_nomem:
	ret = -ENOMEM;
err_free_mem:
  	kfree(map->menu_names);
  	kfree(map->menu_mapping);
  	kfree(map->name);
  	kfree(map);
	return ret;
}

I'm not 100% sold on this idea myself, but it does reduce the churn by quite a bit,
your choice if you want to follow my suggestion or not.



>  
>  int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 3d32a56c5ff8..f429f325433b 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -115,7 +115,12 @@ struct uvc_control_mapping {
>  	u8 entity[16];
>  	u8 selector;
>  
> +	/*
> +	 * Size of the control data in the payload of the UVC control GET and
> +	 * SET requests, expressed in bits.
> +	 */
>  	u8 size;
> +
>  	u8 offset;
>  	enum v4l2_ctrl_type v4l2_type;
>  	u32 data_type;
> 


Otherwise this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


