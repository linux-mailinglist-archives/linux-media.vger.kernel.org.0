Return-Path: <linux-media+bounces-22027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718B29D89E1
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 17:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 441E1162B96
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0681B3950;
	Mon, 25 Nov 2024 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DdPmyEKb"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBDD1B0F0F
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732550474; cv=none; b=uGK4l59K0ErS8eb5bPTM+tcXkHeiDZDGJsc2gGTeclvhUEeEF5vXWyK5tleo1Z6bNhtIj3l3DZBvGjZS+69JzLf0hjibkIIqjraAO5T9fp5AisMCeC0MSe0+JBLtmOYN5/fTFr3YIqEME3Uen0B+udCMAFUEz/Y/ujYaydqT5ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732550474; c=relaxed/simple;
	bh=XvBt2ajSVUNNM/8Hhh2IsmcsERKJdXAv8ewqGXiLk3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvCl9uDsJeQEK3QvUMmUkn9rWAZYRJVJCxX4iKCa9jQXThT56l/Ni283Xs3C9sFVxzbX1QhiQIu488kjIgGZlxSaQKaAROIy+4alwbBMJj2tqzars+kAgkkeLYvktUO9Mh4hul795ngmsxfd59fqoFMJ0iHCGrcpLGOiE8waPlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DdPmyEKb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732550471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mwD97Iaa1eMsbr0BhCGDfOD7jLttQto+VSmJj0E+TCU=;
	b=DdPmyEKbENouXkXszX7s2XlgUNiz/+AhmWcv7RLzUbFvIlCyu3nXx+6C1qtMHNjMkIY1m5
	0GW+bZ2Jk3S/CC//gfyIjKJaMV7yCwOOMNKGYdg+sBZCZQWnTjHtAaziF3dVG9psBGClSd
	t4c0TbcmT1SHBWsYbKM0nP8T3N3MUs4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-TZ68DTz2PQCzVlVRn_9CIw-1; Mon, 25 Nov 2024 11:01:09 -0500
X-MC-Unique: TZ68DTz2PQCzVlVRn_9CIw-1
X-Mimecast-MFC-AGG-ID: TZ68DTz2PQCzVlVRn_9CIw
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5cffa805c94so2684105a12.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 08:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732550468; x=1733155268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwD97Iaa1eMsbr0BhCGDfOD7jLttQto+VSmJj0E+TCU=;
        b=c7ZEbrbYzyu2zzeNgBFVy74An0OaDnJystGcj4/u6m684Xdh5wz71goJvmXMVwi09n
         9eYUVQo2zNUYAZFBXHmlM1SZAIr3+t1wFGyH2A1T8syvT2HBPKtYCm9ayx4v6qv0jYLL
         0Ya/ZbZdTZvQfsx+yaKfm/HA7UwERfCHeB6tu5fw/zB0pISB1qj+s6+6EpPe/3V+rN+T
         qmmhowNznynwW5kA68DRwejDG5UY4hVLGASYu3G4ZY09h0OvfoqSaAJKLudEGMuii8Go
         M/iz/m5vITuHXbjXgfds1wS3WgT4QlBvMltVglr0RNvRx1s2xtUrSR8PC1/kJU5HGpAA
         OMYw==
X-Forwarded-Encrypted: i=1; AJvYcCXvIqUIaRiMNiiFSvW2KKLZ4VwqzYQiDOlKI4K9+bdxDpqa+yIKrYAbK7gUSF2nigz7dmOJCFiCzEz5Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywact2vraY9ARI3uEcIS0SRhFJPTeVyptQiE+rY6EhpQ6cMqxuV
	2PTNubR0Rab1NBtf97kuviWfbqU95aHaFh+J6v59/GOaYahi/YLSmPGZ3uM4OFbsdZgKQKnJc5k
	x5b3DfJI/XzzfB2CYkjQN+ZaSo+vkriZmmty7l75FZooHtLQnf4Sp4DylCk8R
X-Gm-Gg: ASbGnct6wCbv8/ye3yiUu4K6lD5qdPIzoMIbFvIRayb4KLhzBwN47GcwlqiC5IN1AwJ
	MbmJvDPu4oWMGc+KV9IaPNJX+jeomAK+UdbJ822qq9EpvQg63PofBPU+lvRjaMc8FzxD+WvWQ5U
	9TrL6Ud5pwN+gCNNWN5eLcn/0Lx9d3957jMp3RgAFUVdA4T0f2yUuK6t/1KId7q+x8v+b4m8HHh
	fq3Dqjuqah/rAT4DUyaei6hQHV4WFLvOqTcSKr47QsPL/JoRiN8QhcRkrAZ4M8u5FrK1saOca7e
	M0qZH0IFC/x0ce+Zwq7gxZ+42QO2kqTic4Uu32Tnbzj6EfO3YTW5ITbiHhjt/oK7p2fcvCrsryd
	Z5d3X9tDm3lmL8qqsFW3NBDO7
X-Received: by 2002:a05:6402:2106:b0:5cf:e3cf:3dc2 with SMTP id 4fb4d7f45d1cf-5d0205fb2b7mr12050082a12.11.1732550467327;
        Mon, 25 Nov 2024 08:01:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMK6On0QAetV6/IDul0ywf9knronYPt2+r+MmKSjA9ORvG9/5yP4ydGgXpAqsPiWI4VhFfGw==
X-Received: by 2002:a05:6402:2106:b0:5cf:e3cf:3dc2 with SMTP id 4fb4d7f45d1cf-5d0205fb2b7mr12049986a12.11.1732550466351;
        Mon, 25 Nov 2024 08:01:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3fc658sm4219752a12.71.2024.11.25.08.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 08:01:05 -0800 (PST)
Message-ID: <5faa9bcc-c244-44e4-ba39-679e57b513f3@redhat.com>
Date: Mon, 25 Nov 2024 17:01:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 07/19] media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-7-64cfeb56b6f8@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-7-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> We want to support fetching the min and max values with g_ext_ctrls,
> this patch is a preparation for that.
> 
> Instead of abusing uvc_query_v4l2_ctrl(), add an extra parameter to
> uvc_ctrl_get, so it can support fetching the default value.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 21 ++++++++++++++++++---
>  drivers/media/usb/uvc/uvc_v4l2.c | 28 +++++++++++-----------------
>  drivers/media/usb/uvc/uvcvideo.h |  3 ++-
>  3 files changed, 31 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index c975e0ab479b..d6afa131a5e1 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1902,8 +1902,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  	return ret;
>  }
>  
> -int uvc_ctrl_get(struct uvc_video_chain *chain,
> -	struct v4l2_ext_control *xctrl)
> +int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
> +		 struct v4l2_ext_control *xctrl)
>  {
>  	struct uvc_control *ctrl;
>  	struct uvc_control_mapping *mapping;
> @@ -1915,7 +1915,22 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  	if (ctrl == NULL)
>  		return -EINVAL;
>  
> -	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> +	switch (which) {
> +	case V4L2_CTRL_WHICH_CUR_VAL:
> +		return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +		if (!ctrl->cached) {
> +			int ret = uvc_ctrl_populate_cache(chain, ctrl);
> +
> +			if (ret < 0)
> +				return ret;
> +		}
> +		xctrl->value = mapping->get(mapping, UVC_GET_DEF,
> +					    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
> +		return 0;
> +	}
> +
> +	return -EINVAL;
>  }
>  
>  int uvc_ctrl_set(struct uvc_fh *handle,
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 97c5407f6603..02fd5cbc3474 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1078,34 +1078,28 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  	struct uvc_video_chain *chain = handle->chain;
>  	struct v4l2_ext_control *ctrl = ctrls->controls;
>  	unsigned int i;
> +	u32 which;
>  	int ret;
>  
> +	switch (ctrls->which) {
> +	case V4L2_CTRL_WHICH_DEF_VAL:
> +	case V4L2_CTRL_WHICH_CUR_VAL:
> +		which = ctrls->which;
> +		break;
> +	default:
> +		which = V4L2_CTRL_WHICH_CUR_VAL;
> +	}
> +
>  	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
>  	if (ret < 0)
>  		return ret;
>  
> -	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
> -		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -			struct v4l2_queryctrl qc = { .id = ctrl->id };
> -
> -			ret = uvc_query_v4l2_ctrl(chain, &qc);
> -			if (ret < 0) {
> -				ctrls->error_idx = i;
> -				return ret;
> -			}
> -
> -			ctrl->value = qc.default_value;
> -		}
> -
> -		return 0;
> -	}
> -
>  	ret = uvc_ctrl_begin(chain);
>  	if (ret < 0)
>  		return ret;
>  
>  	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -		ret = uvc_ctrl_get(chain, ctrl);
> +		ret = uvc_ctrl_get(chain, which, ctrl);
>  		if (ret < 0) {
>  			uvc_ctrl_rollback(handle);
>  			ctrls->error_idx = i;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 07f9921d83f2..6ebaabd11443 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -788,7 +788,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  	return __uvc_ctrl_commit(handle, 1, NULL);
>  }
>  
> -int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> +int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
> +		 struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  			   const struct v4l2_ext_controls *ctrls,
> 


