Return-Path: <linux-media+bounces-22927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6619E97C1
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52D3C188847A
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820E91B424D;
	Mon,  9 Dec 2024 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZKb9sxHO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAFE1B4225
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733752039; cv=none; b=km5pQuvfLNfMmy6DgCuTsXdFmIInjJENGSxn/hgD50sRYMdLRq/9DyPDfzslMKcHk2MD+T3JjWBqssqKTBj9i848GCRrAXfy2Sm7X/o2T4G6O0hKQ7xMMRpqfAq43tAsNKKiPHodVKu3oBOx3c6yxMASaOYON2etlAiN99+7HRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733752039; c=relaxed/simple;
	bh=xIDH5ZGKn/U7XkrehevgURAa7MsvUJvder0R1oTHzLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pnsZMxlcsfEC8mnxd35fTPTU2/rXUgAeNE2eecYxrO0Jt2Btjif9fUKDxmVh+hxm3WmZQJyMILuOjjwA8NOLCx/C3AsD+xQ4KkThQFTUarvTrWx2Yct5nGYh6xjNF/d/8w+KjjidXCKx022ZlEFuqPVdk3dGdNcxSiE8fqeBNVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZKb9sxHO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733752037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kNtXEjpYUE+9og383dkVR79PwqWRsrM27GgBMRdn9fA=;
	b=ZKb9sxHOGonyMpIkQIjGUyriRD/4s3olQGzXBkGCSzyYsWTfUl4y8EE5wi8CR1Pza9VyRd
	5/Yzd0Z7XjRGSWCAlXx9Pc+7nwfOb4J5XoFKwRXP9A4tUets4vvcDYWTjOnE7x6kDzUnH3
	Ug5N8Xpg254uCkmYLZRdPfyoS6M643o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-JI7TbxlnOCyK7Dz_528HXg-1; Mon, 09 Dec 2024 08:47:13 -0500
X-MC-Unique: JI7TbxlnOCyK7Dz_528HXg-1
X-Mimecast-MFC-AGG-ID: JI7TbxlnOCyK7Dz_528HXg
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38639b4f19cso784475f8f.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 05:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733752032; x=1734356832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNtXEjpYUE+9og383dkVR79PwqWRsrM27GgBMRdn9fA=;
        b=FHfnDeDKaofJ2IT6QZ90a70Fi+FcxdG8EmrBizyiEZ8pwKyEFLHoeXtdbBZ8sg93Xt
         qKuh/kVodnNjYyaXFRRqloFt8huG/TRlmEh+yR1wc0PbxjXYG83FbrreYq8wZdyoCwqM
         DX4OTrNxSN/rIVkxag49bFNanY3c3IUhM7/9gMnKAGMdVWa2BBYG1qgfr0N824SyOtUU
         Z4GlSm1qtCS3QNpVf8+nrTKC7+htOPH87x88aJYGZSo2RyqYwyunX8Wr0GvMsUBqIZU5
         V8S0E4z9Sp+Cmkqj7w1l6gUuyhVFWzwoqHMZsko2OGJoztYKf+OosHK2NT1TSgBALBAQ
         3Axw==
X-Forwarded-Encrypted: i=1; AJvYcCWKuTmmUbmpq3OPuu2EA/3QLuCrwP7vsfXN6Iznv9NfGSZwM5f6I2X4YafkpmlIYpnGXjXWzcfHJLLi9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SAX2rBwCxFS4s514BEf22JPZKeunxtREwiJ1WkWw7dN1LiNk
	QpTDnv2t6lq1DV/+HXJ9jpIbJSi4c2maoUUvkXnpu0SUQlG9TNXsp/V3YdhRoarje02rQPiLNus
	HxbAy2KwXFbvT3AC1IQtZdpLg1hdftVm2RkL184K9uKIXRHIx5/aLDzPJCfgA
X-Gm-Gg: ASbGncvFb2+twnf8d42IUgbaItCEf4bK/8UidtdqDu6gvmSWGnz9TZ8BCpmjjdbOeiI
	d0CKbo723eZQP4VZzQLPN13R6XZbZ2tbyDeE6V0HGtUQuiHnkMkLM0dn1GTlZbSOG7j4PQpbdo/
	GlayNAd9TC/pfyd9OxVYgT4LqzLmxIRwPWUOd6b+4D9iLIJbaK2uZ9tyNFoa3MyQMeqSabRzG49
	nj9nfNF+UahY9FWoVoQ12RHBYPrasIHwFhMkS33cmSN0eQystwMuA==
X-Received: by 2002:a5d:59ae:0:b0:386:3a8e:64bd with SMTP id ffacd0b85a97d-386453da219mr513233f8f.22.1733752031852;
        Mon, 09 Dec 2024 05:47:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2i3cIfb4RiG066keLy/InBf/TPA8L9FhuFcXSsYGXcSfzZNjOq1Xuh7FPM3liPhgDH6s/Gw==
X-Received: by 2002:a5d:59ae:0:b0:386:3a8e:64bd with SMTP id ffacd0b85a97d-386453da219mr513203f8f.22.1733752031509;
        Mon, 09 Dec 2024 05:47:11 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa653d1df95sm376771166b.98.2024.12.09.05.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:47:11 -0800 (PST)
Message-ID: <6941cc32-14a5-40c3-9e79-5a899c6a72c1@redhat.com>
Date: Mon, 9 Dec 2024 14:47:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 13/19] media: uvcvideo: support
 V4L2_CTRL_WHICH_MIN/MAX_VAL
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-13-64cfeb56b6f8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-13-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> From: Yunke Cao <yunkec@google.com>
> 
> Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
> It is needed for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 96 ++++++++++++++++++++++++++++++++--------
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 +
>  2 files changed, 79 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b591d7fddc37..0dae5e8c3ca0 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1270,6 +1270,37 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  	return 0;
>  }
>  
> +static bool uvc_ctrl_is_readable(u32 which, struct uvc_control *ctrl,
> +				 struct uvc_control_mapping *mapping)
> +{
> +	if (which == V4L2_CTRL_WHICH_CUR_VAL)
> +		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR);
> +
> +	if (which == V4L2_CTRL_WHICH_DEF_VAL)
> +		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF);
> +
> +	/* Types with implicit boundaries. */
> +	switch (mapping->v4l2_type) {
> +	case V4L2_CTRL_TYPE_MENU:
> +	case V4L2_CTRL_TYPE_BOOLEAN:
> +	case V4L2_CTRL_TYPE_BUTTON:
> +		return true;
> +	case V4L2_CTRL_TYPE_BITMASK:
> +		return (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES) ||
> +			(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX);
> +	default:
> +		break;
> +	}
> +
> +	if (which == V4L2_CTRL_WHICH_MIN_VAL)
> +		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN);
> +
> +	if (which == V4L2_CTRL_WHICH_MAX_VAL)
> +		return !!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX);
> +
> +	return false;
> +}
> +
>  /*
>   * Check if control @v4l2_id can be accessed by the given control @ioctl
>   * (VIDIOC_G_EXT_CTRLS, VIDIOC_TRY_EXT_CTRLS or VIDIOC_S_EXT_CTRLS).
> @@ -1288,7 +1319,6 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	struct uvc_control *master_ctrl = NULL;
>  	struct uvc_control_mapping *mapping;
>  	struct uvc_control *ctrl;
> -	bool read = ioctl == VIDIOC_G_EXT_CTRLS;
>  	s32 val;
>  	int ret;
>  	int i;
> @@ -1300,10 +1330,10 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  	if (!ctrl)
>  		return -EINVAL;
>  
> -	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) && read)
> -		return -EACCES;
> +	if (ioctl == VIDIOC_G_EXT_CTRLS)
> +		return uvc_ctrl_is_readable(ctrls->which, ctrl, mapping);
>  
> -	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
> +	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>  		return -EACCES;
>  
>  	if (ioctl != VIDIOC_S_EXT_CTRLS || !mapping->master_id)
> @@ -1451,6 +1481,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>  		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
> +	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>  
>  	if (mapping->master_id)
>  		__uvc_find_control(ctrl->entity, mapping->master_id,
> @@ -2037,16 +2070,18 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
>  
>  	switch (which) {
>  	case V4L2_CTRL_WHICH_CUR_VAL:
> -		ret = __uvc_ctrl_load_cur(chain, ctrl);
> -		if (ret < 0)
> -			return ret;
>  		id = UVC_CTRL_DATA_CURRENT;
>  		query = UVC_GET_CUR;
>  		break;
> +	case V4L2_CTRL_WHICH_MIN_VAL:
> +		id = UVC_CTRL_DATA_MIN;
> +		query = UVC_GET_MIN;
> +		break;
> +	case V4L2_CTRL_WHICH_MAX_VAL:
> +		id = UVC_CTRL_DATA_MAX;
> +		query = UVC_GET_MAX;
> +		break;
>  	case V4L2_CTRL_WHICH_DEF_VAL:
> -		ret = uvc_ctrl_populate_cache(chain, ctrl);
> -		if (ret < 0)
> -			return ret;
>  		id = UVC_CTRL_DATA_DEF;
>  		query = UVC_GET_DEF;
>  		break;
> @@ -2064,6 +2099,14 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
>  	if (!data)
>  		return -ENOMEM;
>  
> +	if (which == V4L2_CTRL_WHICH_CUR_VAL)
> +		ret = __uvc_ctrl_load_cur(chain, ctrl);
> +	else
> +		ret = uvc_ctrl_populate_cache(chain, ctrl);
> +
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = mapping->get(mapping, query, uvc_ctrl_data(ctrl, id), size, data);
>  	if (ret < 0)
>  		return ret;
> @@ -2076,22 +2119,37 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
>  				     struct uvc_control_mapping *mapping,
>  				     u32 which, struct v4l2_ext_control *xctrl)
>  {
> +	struct v4l2_queryctrl qc;
> +	int ret;
> +
>  	switch (which) {
>  	case V4L2_CTRL_WHICH_CUR_VAL:
>  		return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
>  	case V4L2_CTRL_WHICH_DEF_VAL:
> -		if (!ctrl->cached) {
> -			int ret = uvc_ctrl_populate_cache(chain, ctrl);
> +	case V4L2_CTRL_WHICH_MIN_VAL:
> +	case V4L2_CTRL_WHICH_MAX_VAL:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
>  
> -			if (ret < 0)
> -				return ret;
> -		}
> -		xctrl->value = uvc_mapping_get_s32(mapping, UVC_GET_DEF,
> -						   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
> -		return 0;
> +	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, &qc);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (which) {
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +		xctrl->value = qc.default_value;
> +		break;
> +	case V4L2_CTRL_WHICH_MIN_VAL:
> +		xctrl->value = qc.minimum;
> +		break;
> +	case V4L2_CTRL_WHICH_MAX_VAL:
> +		xctrl->value = qc.maximum;
> +		break;
>  	}
>  
> -	return -EINVAL;
> +	return 0;
>  }
>  
>  static int uvc_mapping_get_xctrl(struct uvc_video_chain *chain,
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 65dbb53b1e75..7e284770149d 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1087,6 +1087,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  	switch (ctrls->which) {
>  	case V4L2_CTRL_WHICH_DEF_VAL:
>  	case V4L2_CTRL_WHICH_CUR_VAL:
> +	case V4L2_CTRL_WHICH_MAX_VAL:
> +	case V4L2_CTRL_WHICH_MIN_VAL:
>  		which = ctrls->which;
>  		break;
>  	default:
> 


