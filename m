Return-Path: <linux-media+bounces-22922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14829E9598
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2241166F07
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379CA23497E;
	Mon,  9 Dec 2024 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GAyfzdN6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C694F233D9B
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749085; cv=none; b=UNKonHHB+ZccsUxki50Em5MSd/6IaC3WZ5cnJjI5gQSIMFH3vEPBF6zNyfonVgA3yTHpIiz2LdEhwM0F2MOXWn4XDbeSUFm6uo+VZKEBXOJx/IJOMWrA/Kv1GyvvvU74UDxPEIJ3YB7rdaJaO99j62Q9/rD+0en/bRbgMFHEfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749085; c=relaxed/simple;
	bh=+2GZ8Q59WH5eXt/MMZrNO01/XAhHKyIDnw7hJgMiy0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPFk1JT2yRWvo7wj4pRAomG4mtvjoHFHpGywyYRIBNMkC1Qy+q8V2QHsmeMyru/8QnRNPZR7lg1CRjMPPMh7ckHzNZf2kauIPOLH7bygn7+F/W1o5miq6tr9hwJ1MKf60k5j8wwe+lJfQ2SevYTdev67RKqX3BqBMMDmcKu8Vy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GAyfzdN6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733749082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbyC+igT/KTufsKy7S5I6bAyzZ+D5/fjrUElh2MRCIk=;
	b=GAyfzdN6Az4GO6qMYt/2BYWoC0J6aAoe4VdME/oqs1X+cyMQk/x/+/KnIDiWAkBVXZX32v
	AMX91TrwJ6dAo4JEUJzRc+CZl72zhEWxep+VVzAX4s85TriEZy1S+Snt3KJ9v63lF+6q5a
	ZuQm5V7cXKHd0P6W51YoBZ3OB4mDsQA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-6FT6IPiCPjO-PajI7vEuoA-1; Mon, 09 Dec 2024 07:58:01 -0500
X-MC-Unique: 6FT6IPiCPjO-PajI7vEuoA-1
X-Mimecast-MFC-AGG-ID: 6FT6IPiCPjO-PajI7vEuoA
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa683e90dd3so70817266b.3
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 04:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749080; x=1734353880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbyC+igT/KTufsKy7S5I6bAyzZ+D5/fjrUElh2MRCIk=;
        b=BYuRraT/DQ2ycnBcASDGAeaH7poEByBORFPVz076bM7Lx+G0J7iL+9lA9Py+yjpTxS
         mI/XNEovvu1AEWS0TbRLTNSvdCH4K1c7SdRNDI6gg7WNw1QP/vEmJGuULjFmSPGjqHDJ
         /fFtJfwJ7/XJznuEIovrE/0LVlh36jc/pEVmLxzw5PvrxqMS9CUL2pl21Qua+qFes+r9
         fKyJFHT44A0vNcp98FVxgEmUEZWSGucg+cCFv3cJWJNFfZmS7H/Y5EWJadh9whFueeHj
         ENI0k1CH8wd1tYuO6+Q6mZHg2yjAuyKr74BW+hAWeDz07JfGtuAGu0AQMly9ysOvV05U
         tqug==
X-Forwarded-Encrypted: i=1; AJvYcCVuHGk3wylX8FZ95NC6++6qcEQPy/Fj6TsuQ/XzGPkmfUu2YIGkADrENuKgeSI2bEZTlx4LkUStdRihMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHv2kmhrwxREfrHAHK3is/jGrbi2u8fb/+Gf32uPtQ8XG6RX8
	HZ5m7gQ6uQsnHvwdaY1ghsYbowV1du875QUENJlNXb8yrMQ3nNtdcCXg27buCB3FnFvxmbz0ZuS
	g74wwVjrb4HdWNR3HAp+EXoQJ/0gxAbG9IgzeQVzR2qouC+XyUggoy2edIVz7
X-Gm-Gg: ASbGncuHxf2D070Eo9shYBWifqoGuh9qZlFUtUiGZsJYVoZAxN8jZISK3QhnBANnh0A
	MJSDH1I+8A+InJHT50kp1ola6mVOFg7c7GDQqY59eHypJh4zry76XAqsdFrgbG9ylIptEBw0T4T
	RE1q2NlF2LTCA7FbcAIFQlfjvqhVGKUxA0KrayVlROuM+f/RbWwEK3QfrM4/UIxg2pY5RnnLvM4
	dU2hKKNOuCjGELvapP2oVBQXjCK++5iPO+AEkk+m5n36gksnlYBZg==
X-Received: by 2002:a17:906:cc9:b0:aa6:6fa5:65b0 with SMTP id a640c23a62f3a-aa66fa5664emr485283666b.44.1733749080088;
        Mon, 09 Dec 2024 04:58:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvZTaOuUF113q1UE8eYW06UMVUuHznqmeMMI1F122LR/7rNdZV80yo5QnqQxKOBx0lBZD32w==
X-Received: by 2002:a17:906:cc9:b0:aa6:6fa5:65b0 with SMTP id a640c23a62f3a-aa66fa5664emr485281066b.44.1733749079681;
        Mon, 09 Dec 2024 04:57:59 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96c19sm674717066b.42.2024.12.09.04.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:57:59 -0800 (PST)
Message-ID: <b20805a6-8ea7-472a-9fa6-a4f7cce6e868@redhat.com>
Date: Mon, 9 Dec 2024 13:57:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 10/19] media: uvcvideo: Factor out clamping from
 uvc_ctrl_set
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-10-64cfeb56b6f8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-10-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> Move the logic to a separated function. Do not expect any change.
> This is a preparation for supporting compound controls.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 82 +++++++++++++++++++++-------------------
>  1 file changed, 44 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 6d5167eb368d..893d12cd3f90 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2002,28 +2002,17 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
>  	return -EINVAL;
>  }
>  
> -int uvc_ctrl_set(struct uvc_fh *handle,
> -	struct v4l2_ext_control *xctrl)
> +static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
> +			  struct uvc_control *ctrl,
> +			  struct uvc_control_mapping *mapping,
> +			  s32 *value_in_out)
>  {
> -	struct uvc_video_chain *chain = handle->chain;
> -	struct uvc_control *ctrl;
> -	struct uvc_control_mapping *mapping;
> -	s32 value;
> +	s32 value = *value_in_out;
>  	u32 step;
>  	s32 min;
>  	s32 max;
>  	int ret;
>  
> -	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> -		return -EACCES;
> -
> -	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> -	if (ctrl == NULL)
> -		return -EINVAL;
> -	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> -		return -EACCES;
> -
> -	/* Clamp out of range values. */
>  	switch (mapping->v4l2_type) {
>  	case V4L2_CTRL_TYPE_INTEGER:
>  		if (!ctrl->cached) {
> @@ -2041,14 +2030,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  		if (step == 0)
>  			step = 1;
>  
> -		xctrl->value = min + DIV_ROUND_CLOSEST((u32)(xctrl->value - min),
> -							step) * step;
> +		value = min + DIV_ROUND_CLOSEST((u32)(value - min), step) * step;
>  		if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
> -			xctrl->value = clamp(xctrl->value, min, max);
> +			value = clamp(value, min, max);
>  		else
> -			xctrl->value = clamp_t(u32, xctrl->value, min, max);
> -		value = xctrl->value;
> -		break;
> +			value = clamp_t(u32, value, min, max);
> +		*value_in_out = value;
> +		return 0;
>  
>  	case V4L2_CTRL_TYPE_BITMASK:
>  		if (!ctrl->cached) {
> @@ -2057,21 +2045,20 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  				return ret;
>  		}
>  
> -		xctrl->value &= uvc_get_ctrl_bitmap(ctrl, mapping);
> -		value = xctrl->value;
> -		break;
> +		value &= uvc_get_ctrl_bitmap(ctrl, mapping);
> +		*value_in_out = value;
> +		return 0;
>  
>  	case V4L2_CTRL_TYPE_BOOLEAN:
> -		xctrl->value = clamp(xctrl->value, 0, 1);
> -		value = xctrl->value;
> -		break;
> +		*value_in_out = clamp(value, 0, 1);
> +		return 0;
>  
>  	case V4L2_CTRL_TYPE_MENU:
> -		if (xctrl->value < (ffs(mapping->menu_mask) - 1) ||
> -		    xctrl->value > (fls(mapping->menu_mask) - 1))
> +		if (value < (ffs(mapping->menu_mask) - 1) ||
> +		    value > (fls(mapping->menu_mask) - 1))
>  			return -ERANGE;
>  
> -		if (!test_bit(xctrl->value, &mapping->menu_mask))
> +		if (!test_bit(value, &mapping->menu_mask))
>  			return -EINVAL;
>  
>  		/*
> @@ -2079,8 +2066,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  		 * UVC controls that support it.
>  		 */
>  		if (mapping->data_type == UVC_CTRL_DATA_TYPE_BITMASK) {
> -			int val = uvc_mapping_get_menu_value(mapping,
> -							     xctrl->value);
> +			int val = uvc_mapping_get_menu_value(mapping, value);
>  			if (!ctrl->cached) {
>  				ret = uvc_ctrl_populate_cache(chain, ctrl);
>  				if (ret < 0)
> @@ -2090,14 +2076,34 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  			if (!(uvc_get_ctrl_bitmap(ctrl, mapping) & val))
>  				return -EINVAL;
>  		}
> -		value = xctrl->value;
> -		break;
> +		return 0;
>  
>  	default:
> -		value = xctrl->value;
> -		break;
> +		return 0;
>  	}
>  
> +	return 0;
> +}
> +
> +int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
> +{
> +	struct uvc_video_chain *chain = handle->chain;
> +	struct uvc_control_mapping *mapping;
> +	struct uvc_control *ctrl;
> +	int ret;
> +
> +	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
> +		return -EACCES;
> +
> +	ctrl = uvc_find_control(chain, xctrl->id, &mapping);
> +	if (!ctrl)
> +		return -EINVAL;
> +	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> +		return -EACCES;
> +
> +	ret = uvc_ctrl_clamp(chain, ctrl, mapping, &xctrl->value);
> +	if (ret)
> +		return ret;
>  	/*
>  	 * If the mapping doesn't span the whole UVC control, the current value
>  	 * needs to be loaded from the device to perform the read-modify-write
> @@ -2116,7 +2122,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  		       ctrl->info.size);
>  	}
>  
> -	uvc_mapping_set_s32(mapping, value,
> +	uvc_mapping_set_s32(mapping, xctrl->value,
>  			    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>  
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> 


