Return-Path: <linux-media+bounces-33378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 866EBAC3F6D
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA1043B9652
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 12:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C15202C30;
	Mon, 26 May 2025 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PcogCTkA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA81876
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263408; cv=none; b=u4mRit2xP0KYcHZj81yP8KWRmXeyf+HgRydvqtpcqZpa3vYlHar3H2RVYvp+QVoDk/KN1XhNnH0CeUUHmxoFXCFttIak0MsaUoBBrM+sPssV7TBXbJHrF9ykrQrN5mf1wUFjZID2qSRmjwEh6tQ4OrmOAwIsi8s5Age7MPHo5k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263408; c=relaxed/simple;
	bh=MY7Mww48Wb2heP6kP4DbISMh3gCNbdAFLdWx6dh/D5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBoDwhabB38B4JnzI+BoB9flqK4m1Qwr5BRjsMjlTguOCSws8HrrOhqZ9bOYcX5VexMcDDHwchkF7vQKY1NTo9FOhcccQg/ZOBZuEoemsUaXmgUWiElm6J/TNBp48BjBk3ctunPAKQtcj+uSmFzvn1cQ4CrTrktVeleINLlJxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PcogCTkA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748263404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pC/xh3DosBNUBs4qr5hgqy7gIKboDid152+Tr30uYck=;
	b=PcogCTkAYs2UxJfFIGuuIfkA+Y3po1phv6FN4/QuTntYzAbtPwLA0FmoGjr1UXnk/QPkre
	iSl+KLFFTzc/F9bKUPJf78LDJVNJrGaRcbIy1zxmAPe1+6vEzZ2/NYaeSu1ZNwE1/xQvMm
	CgHbWo96w/O4aXVg573TAYiee6YfTbw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-WA8oituzPM6tstQi7qM9sA-1; Mon, 26 May 2025 08:43:23 -0400
X-MC-Unique: WA8oituzPM6tstQi7qM9sA-1
X-Mimecast-MFC-AGG-ID: WA8oituzPM6tstQi7qM9sA_1748263402
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-60488876b2bso913033a12.3
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 05:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748263402; x=1748868202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pC/xh3DosBNUBs4qr5hgqy7gIKboDid152+Tr30uYck=;
        b=ciHpJ5bIyMkejSfFHKiXrY49SJ6ePtS1CCD7ixJyaWnekhWk+YOk0v88pVrWP9/zeW
         PzzlwhuBSsiYa7USq/ObqLnmpzt9qkcFqllpdreekXasTh8Qjk+ymo4hEpMowgb4/6Cv
         H6FC5hljLNa9R5F8Z66C1O77SPHTkPmHoH74SAR5J37IU+Di/fmyK8xch0Oy1djltcUF
         XyGx91+LhYq1aE+mYRtIfVqmVc2Z8V00ntvqWIqzt4HVXGGUkDpTiSCpjSXuX+c6tKVn
         T24SqEgGhhU1u3oQdUiiit2Mn96vpZqSgltEWV+zRA99Ml8owzqRPK4lsEjHjQnEl6sb
         Cvjw==
X-Gm-Message-State: AOJu0Yytce/+iqoEZO+DUR/814PFBllUy1DAgevEFR2IM/wVUImxCUzI
	M25OB3fl+6Q5lLPlecOxauyNpwBVoTjoQbFHtKK1js5XbKanuqao7qwaJxuv9aA/3IXt29afRzL
	lcHjcKSMhnGX63nBkrFeQNE7vAcScH/R/yFnZ5kl5Ps/WkUQC5GKAW5cXq2hZpDhi
X-Gm-Gg: ASbGncvv9fyJVrB4sMtPEjPvorrh8+/1XIGOkyQqv37l/1qDVZMLzmS5naj7uS9ZOX3
	mLWQHL5muQqZMHFUXGSyXfHIP0vNZ3GaO7TQgQSPygUDIujLbvvXx6sbwT17b4Azn6wUqpgeVi5
	IJCee9+/BA6p19rKAUtI8u2Oc6dVbtO2CB4MOUlrOLUfeNSyANI9Z/rWugukh/AeZUIh9DljW3z
	OYaTrMQ6xqAjuyiBXpxn65HW0jtk1gzMpmvawMvvldl1hFm8C2vIyVxC9acL/shliPLFNEljiXJ
	UJ8gL18GiqL+DT4=
X-Received: by 2002:a05:6402:2713:b0:602:2d06:6b19 with SMTP id 4fb4d7f45d1cf-602d8e4f276mr6583273a12.1.1748263402036;
        Mon, 26 May 2025 05:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPGDt6d7DUrLAEESyxOXfmu6xxR7R70aSYpwzwapfP4Cv1cX7iXwygc7puv0N/t7SWTSh8IA==
X-Received: by 2002:a05:6402:2713:b0:602:2d06:6b19 with SMTP id 4fb4d7f45d1cf-602d8e4f276mr6583245a12.1.1748263401517;
        Mon, 26 May 2025 05:43:21 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3888esm16106821a12.65.2025.05.26.05.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 05:43:20 -0700 (PDT)
Message-ID: <df397c55-c3e5-42f9-bd69-d5356d517eb1@redhat.com>
Date: Mon, 26 May 2025 14:43:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-uvc-eaccess-v8-1-0b8b58ac1142@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250502-uvc-eaccess-v8-1-0b8b58ac1142@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 2-May-25 09:48, Ricardo Ribalda wrote:
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
> - Makes VIDIOC_QUERYCTRL return 0 for -EIO errors.
> - Introduces a warning in dmesg so we can have a trace of what has happened
>   and sets the V4L2_CTRL_FLAG_DISABLED.
> - Makes sure we keep returning V4L2_CTRL_FLAG_DISABLED for all the next
>   attempts to query that control (other operations have the same
>   functionality as now).
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you for your patch.

I have merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

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
>                       sharpness 0x0098091b (int)    : min=0 max=0 step=0 default=0 value=3 flags=disabled
>          backlight_compensation 0x0098091c (int)    : min=0 max=2 step=1 default=1 value=1
> 
> Camera Controls
> 
>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
>          exposure_time_absolute 0x009a0902 (int)    : min=2 max=1250 step=1 default=156 value=156 flags=inactive
>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=1
>                         privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
>    region_of_interest_rectangle 0x009a1901 (rect)   : value=(0,0)/1924x1084 flags=has-payload
> 
> Emulating error with:
> +       if (cs == UVC_PU_SHARPNESS_CONTROL && query == UVC_GET_MAX) {
> +               printk(KERN_ERR "%s:%d %s\n", __FILE__, __LINE__, __func__);
> +               return -EIO;
> +       }
> In uvc_query_ctrl()
> ---
> Changes in v8:
> - Return error when != -EIO
> - Fix typo in comment
> - Link to v7: https://lore.kernel.org/r/20250403-uvc-eaccess-v7-1-033d0c3d6368@chromium.org
> 
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
>  drivers/media/usb/uvc/uvc_ctrl.c | 55 ++++++++++++++++++++++++++++++++++------
>  drivers/media/usb/uvc/uvcvideo.h |  2 ++
>  2 files changed, 49 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44b6513c526421943bb9841fb53dc5f8e9f93f02..f24272d483a2d77f01e072684fc9f67899a48801 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1483,14 +1483,28 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>  	return ~0;
>  }
>  
> +/*
> + * Maximum retry count to avoid spurious errors with controls. Increasing this
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
> @@ -1587,18 +1602,31 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
> +			if (!ret)
> +				break;
> +			if (ret < 0 && ret != -EIO)
> +				return ret;
> +		}
>  
> -		if (val != mapping->master_manual)
> -			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> +		if (ret == -EIO) {
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
> @@ -1613,7 +1641,18 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
> index b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e..11d6e3c2ebdfbabd7bbe5722f88ff85f406d9bb6 100644
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
> base-commit: d0faa9505840c711740eca80e255fdabafbcdb1a
> change-id: 20250403-uvc-eaccess-8f3666151830
> 
> Best regards,


