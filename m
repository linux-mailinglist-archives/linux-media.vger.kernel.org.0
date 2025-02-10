Return-Path: <linux-media+bounces-25934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8BA2F28F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FB3A1887FDB
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 16:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57BB2451C3;
	Mon, 10 Feb 2025 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gOJRFwTu"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD54247DE5
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203665; cv=none; b=HS9tkTJsPJQZ3VGVdburO14tK/kDeDNQEKq4qwRim4x+RUOcUZsm0VYeFW6hQEixNQsxP1wjKGS5MX88M84v6ye7ZpJOZrXCH1sdJ8razIu+YLwXEdDu2KNHoYON3DusrwqKwRbd3Nm0JkjHUfrjVgHk2Q4NgJ9xbXlEUIxYif4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203665; c=relaxed/simple;
	bh=Pm5JicYMot7Tym1Zb0/aX5QKN/E+G+wocop1y+Xhx34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foA2Ngj6eWvnvJjeIijzrPZF6zmMUsXnz45F2Q8hXf0y05KkUVUoeOzO3pMPc2fjkOKLSl1hgVw0bQ5OYylPMVDAcI4Vi91ougHMv2/E3p64rEhR03XzKTJLl8yWt9pm/cnU3BW9HwB773jEGYhQAFB/0njuaaBTZVO9l8PZLP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gOJRFwTu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739203662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77GL/tYmPl7+mQAdfsy5azygebvcP1znrXsaoed79iE=;
	b=gOJRFwTuNddM0ZzNmCVVFsUIIZEU6irzu823b6dqv6JwYUzSrTSbEdFKfq58bsAlg5dQab
	Tch9J4gfiSPIUkNjnrWr8c0cL+5VZPnjy2dxm7gyQWJ28aNqFN1AenkJ4Yd6DPUGFTMsFn
	FLXTD2U3apvkTh5bKhkRW885cLnBawo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-EMs3lsy_OKikmgebeBnZRw-1; Mon, 10 Feb 2025 11:07:41 -0500
X-MC-Unique: EMs3lsy_OKikmgebeBnZRw-1
X-Mimecast-MFC-AGG-ID: EMs3lsy_OKikmgebeBnZRw
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ab7a3a033b4so162537066b.0
        for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 08:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203659; x=1739808459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77GL/tYmPl7+mQAdfsy5azygebvcP1znrXsaoed79iE=;
        b=XRR+eOBgPsSU4a0sA7hSdFO69fF9frjKeiS47QG3jqFHLdPnm3dcXK+ihN4MM52MAC
         GQkTJgPoJjD3QiQOiFY7qrqe3wypE/L/9HXbNwQF9zV+hHSNGkWHzHggh1g0DPnGelhT
         MFlPj0u3jH0xURBcJjnW8iVUgeaf0nssrSQ/PRJIT8NjI5mn6MY0+4xeW0zUVtzXTYui
         iNNFKooAQ95bnDuARELRytOWK0mEwqSlha767EnxHUqNoDhbZXzSOHSAKYZ6KSf80os1
         r4cF8/GP4/CfizBgGbkujHXTeZ47/z6GTYaxzrU5siops7H8YZc/7ppi7HWnbhoTZKQ5
         QkZA==
X-Forwarded-Encrypted: i=1; AJvYcCWUVMZrqGEWkGX4ujMSZgI/EZN/OG8y2qBO7Ym+/Oc8mGUr53kLGLq9anof7nGrp76fWec9GbLAYbmcPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTbqPMx4os8pwaUVscBnTiEWDthKGkMuf9P3UqBH6iosTWjFgB
	5YpP1A1sNjLr9htEygzF87e70ymCeyO57urB5CzJazgbXJiwRqATcRg8bL4JKEmFghpl2Gby8hG
	XcJ9ZaKRBl3J64xRBWNohyzQGHkqCqX3eXkT3LLzHhyWJwRLU8iBkJU3H5qYp
X-Gm-Gg: ASbGncvK+1aobsvOlMVFwQhZBR5D1uphNz/fU32KqDtJRhi3UY6GjdyAVOd+PQdq3eT
	d60rGN2mgaxcF+1dVjmnl4ZkXAFafId9P4eGuRE0jiBhGjkZv/jSLMR+FlBRRQoVXdQ65wpyuRP
	iaVmsOtJwGkuSWernleFIC0q6z74NLhrXBjpNNJGaB3MtyhRi9LI7g5fbPwhOvSABz5AGezCIGY
	1NOU/x2RYhBNaJIAniwTWu4F2pOCJs1l/NUZwN/BW3dda6OeJQxxNttpEO9X1V5O3njod9ZfM6T
	Z+IpyQjCxA9SG9RTKJxaM5zrGKW8+nmHyb+nYWFOrdeA+QnJ2TAHx7OKGNTjykg22NrMFZj5GYU
	ZV78TFxk7oyPjsouuYUYOSkIT/q5ukofvRF10ZS/EjhPySepFrgc4Joo=
X-Received: by 2002:a17:906:dc90:b0:ab7:bfb1:99c3 with SMTP id a640c23a62f3a-ab7bfb1a9d4mr534421066b.53.1739203658806;
        Mon, 10 Feb 2025 08:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLUgPZe8+WVFOm7+M26Lip/0MK3cHsXrNGEsuLT+IXXY6SoDI7mvOVYZYpW3234IkyWlg3Hg==
X-Received: by 2002:a17:906:dc90:b0:ab7:bfb1:99c3 with SMTP id a640c23a62f3a-ab7bfb1a9d4mr534415266b.53.1739203658299;
        Mon, 10 Feb 2025 08:07:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d9ca16dasm2302466b.180.2025.02.10.08.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:07:37 -0800 (PST)
Message-ID: <6b472224-0789-46c8-bfd0-7c1c4ea67246@redhat.com>
Date: Mon, 10 Feb 2025 17:07:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 00/17] media: uvcvideo: Implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Scally <dan.scally@ideasonboard.com>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 3-Feb-25 12:55 PM, Ricardo Ribalda wrote:
> This patchset implements UVC v1.5 region of interest using V4L2
> control API.
> 
> ROI control is consisted two uvc specific controls.
> 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> 2. An auto control with type bitmask.
> 
> V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
> 
> The corresponding v4l-utils series can be found at
> https://patchwork.linuxtv.org/project/linux-media/list/?series=11069 .
> 
> Tested with v4l2-compliance, v4l2-ctl, calling ioctls on usb cameras and
> VIVID with a newly added V4L2_CTRL_TYPE_RECT control.
> 
> This set includes also the patch:
> media: uvcvideo: Fix event flags in uvc_ctrl_send_events
> It is not technically part of this change, but we conflict with it.
> 
> I am continuing the work that Yunke did.
> 
> Changes in v17:
> - Rebase on latest media-committers/next
> - Link to v16: https://lore.kernel.org/r/20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org

Thank you for the rebased series.

I've merge the entire series into:
https://gitlab.freedesktop.org/linux-media/users/uvc/ -next now.

Regards,

Hans







> Changes in v16:
> - add documentation
> - discard re-style
> - refactor -ENOMEM
> - remove "Use the camera to clamp compound controls"
> - move uvc_rect
> - data_out = 0
> - s/max/min in uvc_set_rect()
> - Return -EINVAL in uvc_ioctl_xu_ctrl_map instead of -ENOTTY.
> - Use switch inside uvc_set_le_value.
> - Link to v15: https://lore.kernel.org/r/20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org
> 
> Changes in v15:
> - Modify mapping set/get to support any size
> - Remove v4l2_size field. It is not needed, we can use the v4l2_type to
>   infer it.
> - Improve documentation.
> - Lots of refactoring, now adding compound and roi are very small
>   patches.
> - Remove rectangle clamping, not supported by some firmware.
> - Remove init, we can add it later.
> - Move uvc_cid to USER_BASE
> 
> - Link to v14: https://lore.kernel.org/linux-media/20231201071907.3080126-1-yunkec@google.com/
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Hans Verkuil (1):
>       media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
> 
> Ricardo Ribalda (10):
>       media: uvcvideo: Handle uvc menu translation inside uvc_get_le_value
>       media: uvcvideo: Handle uvc menu translation inside uvc_set_le_value
>       media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
>       media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls: handle NoP case
>       media: uvcvideo: Support any size for mapping get/set
>       media: uvcvideo: Factor out clamping from uvc_ctrl_set
>       media: uvcvideo: Factor out query_boundaries from query_ctrl
>       media: uvcvideo: let v4l2_query_v4l2_ctrl() work with v4l2_query_ext_ctrl
>       media: uvcvideo: Introduce uvc_mapping_v4l2_size
>       media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
> 
> Yunke Cao (6):
>       media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
>       media: vivid: Add a rectangle control
>       media: uvcvideo: add support for compound controls
>       media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
>       media: uvcvideo: implement UVC v1.5 ROI
>       media: uvcvideo: document UVC v1.5 ROI
> 
>  .../userspace-api/media/drivers/uvcvideo.rst       |  64 ++
>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |  26 +-
>  .../userspace-api/media/v4l/vidioc-queryctrl.rst   |  14 +
>  .../userspace-api/media/videodev2.h.rst.exceptions |   4 +
>  drivers/media/i2c/imx214.c                         |   4 +-
>  drivers/media/platform/qcom/venus/venc_ctrls.c     |   9 +-
>  drivers/media/test-drivers/vivid/vivid-ctrls.c     |  34 +
>  drivers/media/usb/uvc/uvc_ctrl.c                   | 799 ++++++++++++++++-----
>  drivers/media/usb/uvc/uvc_v4l2.c                   |  77 +-
>  drivers/media/usb/uvc/uvcvideo.h                   |  25 +-
>  drivers/media/v4l2-core/v4l2-ctrls-api.c           |  54 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          | 167 ++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +-
>  include/media/v4l2-ctrls.h                         |  38 +-
>  include/uapi/linux/usb/video.h                     |   1 +
>  include/uapi/linux/uvcvideo.h                      |  13 +
>  include/uapi/linux/v4l2-controls.h                 |   7 +
>  include/uapi/linux/videodev2.h                     |   5 +
>  18 files changed, 1058 insertions(+), 287 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241113-uvc-roi-66bd6cfa1e64
> 
> Best regards,


