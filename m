Return-Path: <linux-media+bounces-22931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A69E9876
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F26A165F16
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDAE1B0410;
	Mon,  9 Dec 2024 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SjPw5jlI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC5233157
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753393; cv=none; b=VWlWY3CrUIHBFuLUFEDtM6h+mne4nGhfg6ZvUOL3RZWfP1WhgyjUScuopTeBTKjAAsL/kEtjE82svYdi5S2kgGxPQJzxFCKYrp1HqD0NMfGcGQCkMgCiukN+P0LhnU6IbAUV0h9rmwKVGVVnVBkPQhuGUdrphneLVVuS2qAgRNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753393; c=relaxed/simple;
	bh=VFsqTHIjbvNsg1lhxlslmn4uCUDQmZvnFu9rTQQdUT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTmoio8OXM78ScHmYBi4ihTYd6VSpxpx6RipOUzacIHXTleQhaQVdZfM43ZlYHO60Zg7VzjUVIJi8ymbZcKrIYYuNBruYqz3pprdXquLL1sA3VPM4yZL7fPE1fQlFpkL7K0n+9bkivWpgQJwOw/n+LLzfSAA7M+Q8ZLAIlv6Azw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SjPw5jlI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733753390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHZzrjR5Ve3b7sXUVbsD2DflrETBRAIsfwkq5v711Dk=;
	b=SjPw5jlIVrlatV6X8ZHXWR7+gtunI4zduejCdkB+aOsycPZv+z6LnzAh4bkeOthpdK3EGc
	SXbOmbidMrP0tzlWRjdMtda61zt+ILnF/vSiA6vAn/SJf+SJC183dsc0b8EHzW2A11AZ9y
	rbJ9ngIE5X6WBxjgnuXecD6Z8HNGMCo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-ItBScmcbOHyBjRV5OeqCLg-1; Mon, 09 Dec 2024 09:09:46 -0500
X-MC-Unique: ItBScmcbOHyBjRV5OeqCLg-1
X-Mimecast-MFC-AGG-ID: ItBScmcbOHyBjRV5OeqCLg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa683e90dd3so77204466b.3
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753382; x=1734358182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHZzrjR5Ve3b7sXUVbsD2DflrETBRAIsfwkq5v711Dk=;
        b=wghAOVCwr5DVNrs8dJv/Bw3rVx0d1DW7GWlEhH7jv6QbKe5cvMM84FnSav3M9FAtBu
         9+ZoINj1zVLfIZblAS1b8FEETn+wU5zQdCJTnBtT3KXkjedFtFNg302plgZDNbwPN5Cr
         GqqWuAaUDr2YtdHrLyJRBLfF6Xj/LOr0nG5orHIU1zw6ocNworxYTFFFkTgYxw0m+vEy
         gDS5ePSNGnj+qH7gJnpcR6ZOshNMJIzQwNzI02VewkBjGIidoJzxle6wvHzD1rwGm2B1
         3/Fd7OHFyBnkZjDA5dZLheIidAFy47nH6dY9mFNn3x9MUAebBZsV7Ab19jrm+Us4H6FL
         IjhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2vhWl4uGuY3lyGS9QoYRSwobzUcJ/x8CGo256PwMseD9IIqWKU+vZX5IPXZB4DP8lDR5D2SwhtAGS8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2oNsalvM0dLuNtqx4bKrUO/lQPcIeZqOOi2km935MkTQFSS2
	tfV49lCb6niZr6XvmM4Si8r5aAFlw/q7NjsJ+1gQhVmJ6rnS95Qe4iLemM0jIbDSohk7Z1j+dI1
	JGFQ+T9TwsiVAwbZgLsyZk02qvZaG6vg/S2SOtQA+1uFz2dkZbthsBfoWcyV6
X-Gm-Gg: ASbGnctzcLEtVdLf5jRs/Gh3K43dSZSRhdNsgSaEEpAXqQGhuAmMLBgLTdi8X54c+LB
	nHkaNu4pvpi3ds7umh+YPZOHU9xQp3ogNTPqv39NnbKuqR7v06Q1p8/gEZmgWvW0xZ4RWnVr+p3
	aMwboDtCFKDu6CYjI+9HyqDz+ihDHplCnD65zU3B/Z+wLerQ7UAOE2s33KkS1e/ASlojNnnL19C
	CDONuz7Vze31BF/CoVIOvVWDSnY5mULfuDVMZR79quJbsQWJdyjYA==
X-Received: by 2002:a17:907:cb1d:b0:aa6:85d0:1486 with SMTP id a640c23a62f3a-aa685d029f6mr368165666b.54.1733753382361;
        Mon, 09 Dec 2024 06:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGbaRuojSlObqb+ZgGmgiC5B1UUWtEQVDAfZ4MvGLv/a0gZ7FV1AlNBxzVkBL59NKv7aDaAQ==
X-Received: by 2002:a17:907:cb1d:b0:aa6:85d0:1486 with SMTP id a640c23a62f3a-aa685d029f6mr368162266b.54.1733753381961;
        Mon, 09 Dec 2024 06:09:41 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6707a5110sm290067466b.36.2024.12.09.06.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:09:41 -0800 (PST)
Message-ID: <5701c6b4-b749-4028-8e42-475790f08190@redhat.com>
Date: Mon, 9 Dec 2024 15:09:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 16/19] media: uvcvideo: Introduce
 uvc_mapping_v4l2_size
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-16-64cfeb56b6f8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-16-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> Centralize the calculation for the v4l2_size of a mapping.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 1bc019138995..f262e05ad3a8 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1463,6 +1463,14 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
>  	return 0;
>  }
>  
> +static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapping)
> +{
> +	if (uvc_ctrl_mapping_is_compound(mapping))
> +		return DIV_ROUND_UP(mapping->size, 8);
> +
> +	return sizeof(s32);
> +}
> +
>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  				 struct uvc_control *ctrl,
>  				 struct uvc_control_mapping *mapping,
> @@ -1504,7 +1512,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>  	}
>  
> -	v4l2_ctrl->elem_size = sizeof(s32);
> +	v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
>  	v4l2_ctrl->elems = 1;
>  
>  	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
> @@ -2093,7 +2101,7 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
>  		return -EINVAL;
>  	}
>  
> -	size = DIV_ROUND_UP(mapping->size, 8);
> +	size = uvc_mapping_v4l2_size(mapping);
>  	if (xctrl->size < size) {
>  		xctrl->size = size;
>  		return -ENOSPC;
> @@ -2271,9 +2279,8 @@ static int uvc_mapping_set_xctrl_compound(struct uvc_control *ctrl,
>  					  struct v4l2_ext_control *xctrl)
>  {
>  	u8 *data __free(kfree) = NULL;
> -	size_t size;
> +	size_t size = uvc_mapping_v4l2_size(mapping);
>  
> -	size = DIV_ROUND_UP(mapping->size, 8);
>  	if (xctrl->size != size)
>  		return -EINVAL;
>  
> 


