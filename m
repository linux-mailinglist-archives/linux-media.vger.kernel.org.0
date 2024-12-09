Return-Path: <linux-media+bounces-22926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D99FE9E9757
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDFF81881E0E
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC00233141;
	Mon,  9 Dec 2024 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fFIZ7vOL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F792233137
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733751504; cv=none; b=WToE+RNxW0aSvyt+1dD1xcUrWWF8I50dAq3cEV1lIW730F17mD/qg0HUNcXvV5Fa+5GPGwdC9HX5H2HIAAlpm/kdrh5+IXcQ9Rp6pLUqm/7ie1Z5OImrL71GzG/N1M9Ydjb7aI6n3Yb+ZDHeeWlEEnw17+b3utI0BRxqILwX6ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733751504; c=relaxed/simple;
	bh=msmivsM3cNIq15JELm6gin1y7H8RSoxoX6/cXcvyaSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Deaygj67lKzXsU5RkDV4lGdclVZa3/nh0YAdnwtwRmlXWsNs/mckSlv2Rlm5jvxOK0mfgzFTTAk1omD9TTu6e7Zib1URnszlgBOrivnpT8ZzDZm5phTSv/PbwvsLEOKG46jcqvH79YMHWoNw6JTzzd4gfy9v7AqcVCygBQ70bZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fFIZ7vOL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733751502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okx4zMASHbnX7/44n64wH9LHW/esrwmJflYq4sZZaRw=;
	b=fFIZ7vOLtrKDEB/KwJ5FHAR3uBIwVSxVo3miFbp8OWhMobD8XPjch+No9ktko7S1qI9K8a
	2glq1hMi0Eb/AEWvwa2W0rCrAs+83RmAzM8cCdfJtL62hEyCYZRp0gCm0rxjiCh6m16blp
	qTs2W5t4zok/qgUUfxABnA8EE7nK56Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-jnZ4neFlNHal7JD2Z420sQ-1; Mon, 09 Dec 2024 08:38:20 -0500
X-MC-Unique: jnZ4neFlNHal7JD2Z420sQ-1
X-Mimecast-MFC-AGG-ID: jnZ4neFlNHal7JD2Z420sQ
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d3f55f8f3aso1472080a12.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 05:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751500; x=1734356300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okx4zMASHbnX7/44n64wH9LHW/esrwmJflYq4sZZaRw=;
        b=F8/0WD+he5sHDJq1TI8HzF8n+vQH+U/xk81I5zngwydBUOAV9Xa8l/rtifDCpYQn6U
         v9kRCMeQFDthp3zsN/SjVztBIjvnVHmiCCmmLmW6/AO9m+2paNz08QUT4nEieZgEWvWP
         9jo87gpM0vVbtlrfpMRPN2AiTPU8m4STsjsqDO+kJTIM2lwM7yf4nH3FYI592Bt39EKt
         G7MrDYdBjWP1sG3MDS2AsVDLp/p2kGodpvdWS30luJ/Opc1kdKf7LCXDikfDEFSPOcQU
         FiXs32zHZpbxfGBc3n8cJ4Ql57giprcAkiPnwL0xAynMTbtQYC+Yr77Tq8ctUNJEi6q2
         qpVg==
X-Forwarded-Encrypted: i=1; AJvYcCVp7HiMPlJbndPm5YOoPxbNtNGA9xe3jJNaK64BymhHaBNDKRI3EvvzJt0IzV6+/kVl/Wd25tBicp7/Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygq54JnEXxl2bPZVr0/uxpq/XdvFBT1Dd0AH26WHNUYZcecLW/
	SEvTTcjHgX+shx/d+hwzuGu68JYNb3GgQHkhqoZMJWu1xAocZejNQgofyRAcz5hplorJlXaNMBJ
	ezEw/KpeVsF/6LGeS3fJrcR+vG2+BH2P3LCG4YYEYcBGhlAPMiFN45J/Z/6yn
X-Gm-Gg: ASbGncv40m5kdFXOK1DAebksP0UKNA8M0P/CCzM81rE3/mQLW0e/46M1u/SkC00VvdJ
	CiJVMHHaeDHwrakxvVHlRSM13oW3nt6DoST0CnWI/5afMmERRGBiScAc68jPG3oVguc+yywCh4O
	31/oDBTHnPmD/m25u5Z41frAH9qgLxxJWSq3hH5MEOC0K54GO4Dk6ODg1Wr21kGIW3SZ33JJOfx
	PMp232LNUWfIqwdX/w+S4xQwIKFcg456d06VQRwxt11R4rE0cXyK3r24Q==
X-Received: by 2002:a05:6402:2807:b0:5d3:ba42:e9fe with SMTP id 4fb4d7f45d1cf-5d4185319dbmr794673a12.12.1733751499388;
        Mon, 09 Dec 2024 05:38:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd0dBigmNOV1fYdHElggsphZfertDD5vDX31HNLrSbHQ3MhFsQxdCZPBqaa92NCcvs8coT/w==
X-Received: by 2002:a05:6402:2807:b0:5d3:ba42:e9fe with SMTP id 4fb4d7f45d1cf-5d4185319dbmr794645a12.12.1733751499036;
        Mon, 09 Dec 2024 05:38:19 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3dd4f641bsm3536440a12.51.2024.12.09.05.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:38:18 -0800 (PST)
Message-ID: <0c044cb4-d827-4428-994c-ef37e0a63245@redhat.com>
Date: Mon, 9 Dec 2024 14:38:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 12/19] media: uvcvideo: Factor out query_boundaries
 from query_ctrl
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-12-64cfeb56b6f8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-12-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> Split the function in two parts. queryctrl_boundaries will be used in
> future patches.
> 
> No functional change expected from this patch.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 106 ++++++++++++++++++++++-----------------
>  1 file changed, 60 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e51cd0a2228a..b591d7fddc37 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1367,53 +1367,11 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>  	return ~0;
>  }
>  
> -static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> -	struct uvc_control *ctrl,
> -	struct uvc_control_mapping *mapping,
> -	struct v4l2_queryctrl *v4l2_ctrl)
> +static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
> +				      struct uvc_control *ctrl,
> +				      struct uvc_control_mapping *mapping,
> +				      struct v4l2_queryctrl *v4l2_ctrl)
>  {
> -	struct uvc_control_mapping *master_map = NULL;
> -	struct uvc_control *master_ctrl = NULL;
> -
> -	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
> -	v4l2_ctrl->id = mapping->id;
> -	v4l2_ctrl->type = mapping->v4l2_type;
> -	strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
> -		sizeof(v4l2_ctrl->name));
> -	v4l2_ctrl->flags = 0;
> -
> -	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> -		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
> -	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> -		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
> -	if (mapping->master_id)
> -		__uvc_find_control(ctrl->entity, mapping->master_id,
> -				   &master_map, &master_ctrl, 0, 0);
> -	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> -		s32 val;
> -		int ret;
> -
> -		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
> -			return -EIO;
> -
> -		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> -		if (ret < 0)
> -			return ret;
> -
> -		if (val != mapping->master_manual)
> -				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> -	}
> -
> -	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
> -		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
> -		v4l2_ctrl->default_value = 0;
> -		v4l2_ctrl->minimum = 0;
> -		v4l2_ctrl->maximum = 0;
> -		v4l2_ctrl->step = 0;
> -		return 0;
> -	}
> -
>  	if (!ctrl->cached) {
>  		int ret = uvc_ctrl_populate_cache(chain, ctrl);
>  		if (ret < 0)
> @@ -1456,18 +1414,74 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
>  		v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> +	else
> +		v4l2_ctrl->minimum = 0;
>  
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
>  		v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +	else
> +		v4l2_ctrl->maximum = 0;
>  
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
>  		v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> +	else
> +		v4l2_ctrl->step = 0;
>  
>  	return 0;
>  }
>  
> +static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> +				 struct uvc_control *ctrl,
> +				 struct uvc_control_mapping *mapping,
> +				 struct v4l2_queryctrl *v4l2_ctrl)
> +{
> +	struct uvc_control_mapping *master_map = NULL;
> +	struct uvc_control *master_ctrl = NULL;
> +
> +	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
> +	v4l2_ctrl->id = mapping->id;
> +	v4l2_ctrl->type = mapping->v4l2_type;
> +	strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
> +		sizeof(v4l2_ctrl->name));
> +	v4l2_ctrl->flags = 0;
> +
> +	if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY;
> +	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	if (mapping->master_id)
> +		__uvc_find_control(ctrl->entity, mapping->master_id,
> +				   &master_map, &master_ctrl, 0, 0);
> +	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> +		s32 val;
> +		int ret;
> +
> +		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
> +			return -EIO;
> +
> +		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (val != mapping->master_manual)
> +			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +	}
> +
> +	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
> +		v4l2_ctrl->default_value = 0;
> +		v4l2_ctrl->minimum = 0;
> +		v4l2_ctrl->maximum = 0;
> +		v4l2_ctrl->step = 0;
> +		return 0;
> +	}
> +
> +	return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
> +}
> +
>  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	struct v4l2_queryctrl *v4l2_ctrl)
>  {
> 


