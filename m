Return-Path: <linux-media+bounces-29519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 496DEA7E017
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11738188BB99
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91FB1B0F33;
	Mon,  7 Apr 2025 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OzHGfEzI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458641ADC68
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033703; cv=none; b=NLTt7HVQKdDVuTDpmAKdlw0Yda4ER7j6U6vLzLXzxRfUZO0JYRI/3EEVr+vHc3J/3xy/I7fKuR+uyOa/cQ3PHyjtaMqrab2/EQxhmRQxyQnRtjbbG0mwNdD423j1o6kUGmt1LTpih91XOBWNZFHzLEzTe5YSDuVgbWhB+hardQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033703; c=relaxed/simple;
	bh=VjqxvFO5J1BQODV++ixod6FFYI5ALlzEEqAOjqOdYL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WB+9P0A5Z6PXI0EuWcJBQq1/1C8ZgUqTVJcoS30aMhHgeduYiMrO61zKhnUcQ2BLTbhmm8ManewsMo7ELvlLOaBBM9igIf9DO+ePU434ANPCWbPzc5QY1FsHEiJ8BVmPBo/0T0f/W8WNSvx5zKddjevVOnasEH933J7M/a7vM1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OzHGfEzI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744033700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2WhMOIke+wrgBTjG8y6/SylwMA8utkS9M2GmQxzhlKE=;
	b=OzHGfEzIKabrfTHEexHk8zqP6rzgH+bPBeRenj3DSTXIGLSFCyP674paP5zJk5sqqwKB+1
	+qR1DQHVfw2D+QJXPrkzxf8NO+uirjbt8EpIMIcPF3vS7+3rNF658nuBvE8m2I2PI0qoAr
	w8OsRcc3YTW2aHeq+xpVLTarE9Mx8GI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-jQXnj4wrMm6xs6o6dMCiIA-1; Mon, 07 Apr 2025 09:48:19 -0400
X-MC-Unique: jQXnj4wrMm6xs6o6dMCiIA-1
X-Mimecast-MFC-AGG-ID: jQXnj4wrMm6xs6o6dMCiIA_1744033698
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eed325461so8314745e9.3
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 06:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033698; x=1744638498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WhMOIke+wrgBTjG8y6/SylwMA8utkS9M2GmQxzhlKE=;
        b=iJQ6/4Y+KJwsnX4lHx+Wcf7yJ1hRVLpQPw+wfmXNGPdiSgwMfzQrgiQ5YrvAozwj6D
         gmEcTtxuutn+cWDeROoD/P8X5hcsK/8C7xlsCAFhMSl7n7517P3SYLWzEq2N7pbWcM1l
         upsbj07Z8RidXa2nwzfccISaNH8FhvZQbkmHsxR6DCN7rGE69pDoiFSKjSgd2A4Zu3dt
         T1nLIuAJcp7jQQTA+Ad3UmV5QzLpk3hQyn+Grjng+1n8vmJ4onZ6u4FSVah6CjPTwoik
         pW4DpuLm6f2pfb04/L98ERpd5tJgTc6zPjTKL6ttQ+32rPSik5SmtXSL0d/89f/d7bIM
         8wGw==
X-Gm-Message-State: AOJu0Yy4hL/ApFdJPWaKz6f1o0JFBGZ6fnfrozS52sboIVyW2i36bpqa
	4Z1J2RxGL/I9p4RSwGfPzPKFfHiQkWuS2o/tobaqssTIzhqBdsSOGXmY5KWM4v4duPShZ5kDTnK
	HUOubAv2ALlxi9JYKExnIws5CdlFn14r5eoiyfZXy0ZlK4KwBlyyCQNWvz6X+
X-Gm-Gg: ASbGncsngT7OCRrdVvTLLMEsnaksPk2LFRKhKowaYtZ1WLPO1nbHe+WnOa1IH6envwJ
	rHqa/INRGCOsG9syXvqb/wuF3BBnndVjvqzChLycJZWsDFWoa3wTa7mpUS52hTlda8pVy7rHStu
	ARHQ70pftZWOsSEGq+gyFCliCpyls6TV7ckp4bl76mpjH4dXKVEyiWobIGmMKh5eH2iw7y9WsCT
	fpjKyuJrS/c48nwzQCqwwWaO33gMfzQlGoB+haEXgrZVGd1pkc5jWj7ueDbm1c6Ev6qCERZwzQg
	9RUlav3K/i7NWE9W3Jc=
X-Received: by 2002:a05:600c:4513:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-43ecf823163mr102746965e9.1.1744033697636;
        Mon, 07 Apr 2025 06:48:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgMHIo6qVTfWmiKYwEm8so934hlJffcww7VPEXs2uOi8XxEY2IKF/ZItZmmUvEXso0UIdu2w==
X-Received: by 2002:a05:600c:4513:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-43ecf823163mr102746705e9.1.1744033697157;
        Mon, 07 Apr 2025 06:48:17 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm130949385e9.39.2025.04.07.06.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:48:16 -0700 (PDT)
Message-ID: <fe050465-eb6f-42cc-85c3-07c45f948dec@redhat.com>
Date: Mon, 7 Apr 2025 15:48:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250403-uvc-eaccess-v7-1-033d0c3d6368@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250403-uvc-eaccess-v7-1-033d0c3d6368@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Apr-25 14:59, Ricardo Ribalda wrote:
> To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
> step and flags of the control. For some of the controls, this involves
> querying the actual hardware.
> 
> Some non-compliant cameras produce errors when we query them. These
> error can be triggered every time, sometimes, or when other controls do
> not have the "right value". Right now, we populate that error to userspace.
> When an error happens, the v4l2 framework does not copy the v4l2_queryctrl
> struct to userspace. Also, userspace apps are not ready to handle any
> other error than -EINVAL.
> 
> One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
> of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
> that usecase, a non-compliant control will make it almost impossible to
> enumerate all controls of the device.
> 
> A control with an invalid max/min/step/flags is better than non being
> able to enumerate the rest of the controls.
> 
> This patch:
> - Retries for an extra attempt to read the control, to avoid spurious
>   errors. More attempts do not seem to produce better results in the
>   tested hardware.
> - Makes VIDIOC_QUERYCTRL return 0 in all the error cases different than
>   -EINVAL.
> - Introduces a warning in dmesg so we can have a trace of what has happened
>   and sets the V4L2_CTRL_FLAG_DISABLED.
> - Makes sure we keep returning V4L2_CTRL_FLAG_DISABLED for all the next
>   attempts to query that control (other operations have the same
>   functionality as now).
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Hans Verkuil, are you happy with this patch now that Ricardo has provided
updated v4l2-ctl output ?

Regards,

Hans




> ---
> Hi 2*Hans and Laurent!
> 
> I came around a device that was listing just a couple of controls when
> it should be listing much more.
> 
> Some debugging later I found that the device was returning -EIO when
> all the focal controls were read.
> 
> Lots of good arguments in favor/against this patch in the v1. Please
> check!
> 
> Without this patch:
> $ v4l2-ctl --list-ctrls
> User Controls
> 
>                      brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
>                        contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
>                      saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
>                             hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>                           gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
>            power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
>       white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
> 
> With this patch:
> $ v4l2-ctl --list-ctrls
> 
> User Controls
> 
>                      brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
>                        contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
>                      saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
>                             hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>                           gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
>            power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
>       white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
>                       sharpness 0x0098091b (int)    : min=0 max=7 step=1 default=3 value=3
>          backlight_compensation 0x0098091c (int)    : min=0 max=2 step=1 default=1 value=1
> [   32.777643] usb 3-6: UVC non compliance: permanently disabling control 98091b (Sharpness), due to error -5
> 
> Camera Controls
> 
>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
>          exposure_time_absolute 0x009a0902 (int)    : min=2 max=1250 step=1 default=156 value=156 flags=inactive
>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
>                         privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
>    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
>   region_of_interest_auto_ctrls 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> 
> Emulating error with:
> +       if (cs == UVC_PU_SHARPNESS_CONTROL && query == UVC_GET_MAX) {
> +               printk(KERN_ERR "%s:%d %s\n", __FILE__, __LINE__, __func__);
> +               return -EIO;
> +       }
> In uvc_query_ctrl()
> ---
> Changes in v7:
> - Only retry on -EIO (Thanks Hans).
> - Add comment for retry (Thanks Hans).
> - Rebase patch
> - Check master_map->disabled before reading the master control.
> - Link to v6: https://lore.kernel.org/r/20250310-uvc-eaccess-v6-1-bf4562f7cabd@chromium.org
> 
> Changes in v6:
> - Keep returning V4L2_CTRL_FLAG_DISABLED in future control queries.
> - Link to v5: https://lore.kernel.org/r/20250224-uvc-eaccess-v5-1-690d73bcef28@chromium.org
> 
> Changes in v5:
> - Explain the retry in the commit message (Thanks Laurent).
> - Link to v4: https://lore.kernel.org/r/20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org
> 
> Changes in v4:
> - Display control name (Thanks Hans)
> - Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org
> 
> Changes in v3:
> - Add a retry mechanism during error.
> - Set V4L2_CTRL_FLAG_DISABLED flag.
> - Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org
> 
> Changes in v2:
> - Never return error, even if we are not enumerating the controls
> - Improve commit message.
> - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 53 ++++++++++++++++++++++++++++++++++------
>  drivers/media/usb/uvc/uvcvideo.h |  2 ++
>  2 files changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index cbf19aa1d82374a08cf79b6a6787fa348b83523a..b41fed364d54aefd7da72c47197cf9d9e3c1b176 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1483,14 +1483,28 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>  	return ~0;
>  }
>  
> +/*
> + * Maximum retry count to avoid spurious errors with controls. Increase this
> + * value does no seem to produce better results in the tested hardware.
> + */
> +#define MAX_QUERY_RETRIES 2
> +
>  static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
>  				      struct uvc_control *ctrl,
>  				      struct uvc_control_mapping *mapping,
>  				      struct v4l2_query_ext_ctrl *v4l2_ctrl)
>  {
>  	if (!ctrl->cached) {
> -		int ret = uvc_ctrl_populate_cache(chain, ctrl);
> -		if (ret < 0)
> +		unsigned int retries;
> +		int ret;
> +
> +		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> +			ret = uvc_ctrl_populate_cache(chain, ctrl);
> +			if (ret != -EIO)
> +				break;
> +		}
> +
> +		if (ret)
>  			return ret;
>  	}
>  
> @@ -1567,6 +1581,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  {
>  	struct uvc_control_mapping *master_map = NULL;
>  	struct uvc_control *master_ctrl = NULL;
> +	int ret;
>  
>  	memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
>  	v4l2_ctrl->id = mapping->id;
> @@ -1587,18 +1602,29 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  		__uvc_find_control(ctrl->entity, mapping->master_id,
>  				   &master_map, &master_ctrl, 0, 0);
>  	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> +		unsigned int retries;
>  		s32 val;
>  		int ret;
>  
>  		if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
>  			return -EIO;
>  
> -		ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> -		if (ret < 0)
> -			return ret;
> +		for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> +			ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
> +					     &val);
> +			if (ret != -EIO)
> +				break;
> +		}
>  
> -		if (val != mapping->master_manual)
> -			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +		if (ret < 0) {
> +			dev_warn_ratelimited(&chain->dev->udev->dev,
> +					     "UVC non compliance: Error %d querying master control %x (%s)\n",
> +					     ret, master_map->id,
> +					     uvc_map_get_name(master_map));
> +		} else {
> +			if (val != mapping->master_manual)
> +				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +		}
>  	}
>  
>  	v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
> @@ -1613,7 +1639,18 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  		return 0;
>  	}
>  
> -	return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
> +	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
> +	if (ret && !mapping->disabled) {
> +		dev_warn(&chain->dev->udev->dev,
> +			 "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
> +			 mapping->id, uvc_map_get_name(mapping), ret);
> +		mapping->disabled = true;
> +	}
> +
> +	if (mapping->disabled)
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
> +
> +	return 0;
>  }
>  
>  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..8e3753896d42baddcc2192057e8c5786ddd79fa8 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -134,6 +134,8 @@ struct uvc_control_mapping {
>  	s32 master_manual;
>  	u32 slave_ids[2];
>  
> +	bool disabled;
> +
>  	const struct uvc_control_mapping *(*filter_mapping)
>  				(struct uvc_video_chain *chain,
>  				struct uvc_control *ctrl);
> 
> ---
> base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
> change-id: 20250403-uvc-eaccess-8f3666151830
> 
> Best regards,


