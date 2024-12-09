Return-Path: <linux-media+bounces-22930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D259E986C
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D1A162F9D
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF911B0408;
	Mon,  9 Dec 2024 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hDRzLiso"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B43233157
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753339; cv=none; b=dI919ACtsJPC9S4+tZ9bRBzO6yhxtBtfG0lGbNFE1y1v7o61ROQFZ+OLylU6xLhG9dMcqPjmIPCoGaKY67pfs6hyoxUwTEp6ZfNgvi1+iqVTXPV7mTLyr6b7UEfOXNPSpkM4imsAYA/sIHqfY6mjZzrVBRae2cdvb7D08WWdZzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753339; c=relaxed/simple;
	bh=rWkhQeV7h+y7ZZdiFL6y+FUruoFzKM0S6Ck1eG63DJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNgWuWZdv0xwRQ1eyD589OsX3Lv1NDFbmypmNXx5vSP19jCLNXHc61ErY3knGcXJgXCOtLu/WW38N7v2Wi8DeeYjLui2Jsu035jxkHwp31uLqtfi4AcvkoS+00EqKdlB6hW5+TPJOXQhEjgdp8dssL6DP/4SO1/hgeSiN9RLKlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hDRzLiso; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733753337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LR7rYvKSWq2v5nBtgQkssPIXvyGthgIzt9C+awlVsdw=;
	b=hDRzLiso4DMOPKYWlkpg/8ZWTetUXO7NovM3uL6U8ZzAhyiL25pnc8DgZYQqFrTkCm6UPX
	PZ42q2+FrsnlRkBf5T6eW1+BG9Cl3dQ7DdFjCyrMoiUBVvxbbiDUboD+1p4I5hBGX6J5Fb
	Un15pzqUACLmcDe3Y4iwJGDz0TRKjOQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-aXdz9Qm8MT-uEKuq9EMMmQ-1; Mon, 09 Dec 2024 09:08:56 -0500
X-MC-Unique: aXdz9Qm8MT-uEKuq9EMMmQ-1
X-Mimecast-MFC-AGG-ID: aXdz9Qm8MT-uEKuq9EMMmQ
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa630babad3so15364466b.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753335; x=1734358135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LR7rYvKSWq2v5nBtgQkssPIXvyGthgIzt9C+awlVsdw=;
        b=ShnlylsWBlochnNivnB9Gcy2Z1FRwzI28mWe7+6HLmX3ZZDaj0eNGR2jsi4DwQjIPD
         BURf6rhsH6BzQDimqeeM1q2IR6Fbw6BFaD67Emoxs4858DxVs4/VLiIyRuKJkqAQ/Ine
         cKLqRnOPCHF3FVa2gEoFI/iq+R0knJbNBvvqErcpnAjf+d8WkeVfrfn0CaIzBUfuuTsU
         FbSAIKyZol5mtIRAQU30iCkxxuzPGLLi0oCRqLahZVqH4FmoJfa3E26ZGVAFFtii7Gzq
         xCPuFqcz/u+2KhCqBH3LNNu1vhisV9hJ1IA5OkW8U3pL+FLkkHI3bCPtkIH2WVsFhz5P
         wKUw==
X-Forwarded-Encrypted: i=1; AJvYcCXqw1wmsWkdkiFPMwzXTDh7avEMslPPRaPznGWiJPytkVkCXksdQixi04HXICRPDqcTBHo3nrvxlX4tHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznBMN5sZzEzdsK97LDOn/mAgHal0QifIcvGzJFi2/zw9fBg05X
	4UmLGUkJ926bg9zDdIhLTORtpNDNFyt0zNAKYKmX2EeX7b2vUOtbPDh+yEFziJ+D0HsftxsNJhp
	/B/YWHz10P9fkxo4W+9xkSlTo+9sL8XqeYOS6dx0X0LDcISGaM+uC36clj4yE
X-Gm-Gg: ASbGnct7xjjIrq5MgVeBzDfB98BLlZlY+n/4JyOVd9sgINy3ZMDeITdkTq/5GuxoUwa
	14oEBfisVvas8f3R1l0Y9PlQjbK57v16iw8ZvK3EPbKYzUHfhJo2cApViptZeBAe4Nr8Oet8JLc
	HptSaBFP+sYrPrgvI85jAePsq7K85Pni35wfvgMA9L6AhS8q8UDe+YNUntquZXtz3w2MZhuf928
	3bWgUBE1JPsyzehpImAEVA8fxuUsbpxdGGzdfyrhXuKf2FtikmV0Q==
X-Received: by 2002:a17:906:3287:b0:aa6:715a:75b5 with SMTP id a640c23a62f3a-aa6715ad73cmr633488666b.46.1733753334650;
        Mon, 09 Dec 2024 06:08:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPFXfKCBMGRbn5Telp10n7TKPnFYfon6UbhYu74Jb6Tg17SsN6yjB3knVuDX5T/fWbvgqS0w==
X-Received: by 2002:a17:906:3287:b0:aa6:715a:75b5 with SMTP id a640c23a62f3a-aa6715ad73cmr633484266b.46.1733753334179;
        Mon, 09 Dec 2024 06:08:54 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68770c481sm161311066b.110.2024.12.09.06.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:08:53 -0800 (PST)
Message-ID: <d99f507b-1890-4ad3-aabc-494a3b0a0dd8@redhat.com>
Date: Mon, 9 Dec 2024 15:08:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 15/19] media: uvcvideo: let v4l2_query_v4l2_ctrl()
 work with v4l2_query_ext_ctrl
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-15-64cfeb56b6f8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-15-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> v4l2_query_ext_ctrl contains information that is missing in
> v4l2_queryctrl, like elem_size and elems.
> 
> With this change we can handle all the element_size information inside
> uvc_ctrl.c.
> 
> Now that we are at it, remove the memset of the reserved fields, the
> v4l2 ioctl handler should do that for us.
> 
> There is no functional change expected from this change.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Doesn't the v4l2-core ioctl wrapping offers queryctrl emulation
using query_ext_ctrl ? If not maybe that should be added there?
(this can be done later)

Othwerise looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 24 ++++++++++++++----------
>  drivers/media/usb/uvc/uvc_v4l2.c | 35 +++++++++++++++--------------------
>  drivers/media/usb/uvc/uvcvideo.h |  2 +-
>  3 files changed, 30 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 72ed7dc9cfc1..1bc019138995 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1252,7 +1252,8 @@ static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  }
>  
>  static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
> -				u32 found_id, struct v4l2_queryctrl *v4l2_ctrl)
> +				u32 found_id,
> +				struct v4l2_query_ext_ctrl *v4l2_ctrl)
>  {
>  	int idx;
>  
> @@ -1400,7 +1401,7 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>  static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
>  				      struct uvc_control *ctrl,
>  				      struct uvc_control_mapping *mapping,
> -				      struct v4l2_queryctrl *v4l2_ctrl)
> +				      struct v4l2_query_ext_ctrl *v4l2_ctrl)
>  {
>  	if (!ctrl->cached) {
>  		int ret = uvc_ctrl_populate_cache(chain, ctrl);
> @@ -1465,7 +1466,7 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  				 struct uvc_control *ctrl,
>  				 struct uvc_control_mapping *mapping,
> -				 struct v4l2_queryctrl *v4l2_ctrl)
> +				 struct v4l2_query_ext_ctrl *v4l2_ctrl)
>  {
>  	struct uvc_control_mapping *master_map = NULL;
>  	struct uvc_control *master_ctrl = NULL;
> @@ -1503,6 +1504,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>  	}
>  
> +	v4l2_ctrl->elem_size = sizeof(s32);
> +	v4l2_ctrl->elems = 1;
> +
>  	if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
>  		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
>  		v4l2_ctrl->default_value = 0;
> @@ -1516,7 +1520,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  }
>  
>  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> -	struct v4l2_queryctrl *v4l2_ctrl)
> +			struct v4l2_query_ext_ctrl *v4l2_ctrl)
>  {
>  	struct uvc_control *ctrl;
>  	struct uvc_control_mapping *mapping;
> @@ -1642,7 +1646,7 @@ static void uvc_ctrl_fill_event(struct uvc_video_chain *chain,
>  	struct uvc_control_mapping *mapping,
>  	s32 value, u32 changes)
>  {
> -	struct v4l2_queryctrl v4l2_ctrl;
> +	struct v4l2_query_ext_ctrl v4l2_ctrl;
>  
>  	__uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl);
>  
> @@ -2119,7 +2123,7 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
>  				     struct uvc_control_mapping *mapping,
>  				     u32 which, struct v4l2_ext_control *xctrl)
>  {
> -	struct v4l2_queryctrl qc;
> +	struct v4l2_query_ext_ctrl qec;
>  	int ret;
>  
>  	switch (which) {
> @@ -2133,19 +2137,19 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
>  		return -EINVAL;
>  	}
>  
> -	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, &qc);
> +	ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, &qec);
>  	if (ret < 0)
>  		return ret;
>  
>  	switch (which) {
>  	case V4L2_CTRL_WHICH_DEF_VAL:
> -		xctrl->value = qc.default_value;
> +		xctrl->value = qec.default_value;
>  		break;
>  	case V4L2_CTRL_WHICH_MIN_VAL:
> -		xctrl->value = qc.minimum;
> +		xctrl->value = qec.minimum;
>  		break;
>  	case V4L2_CTRL_WHICH_MAX_VAL:
> -		xctrl->value = qc.maximum;
> +		xctrl->value = qec.maximum;
>  		break;
>  	}
>  
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 7e284770149d..5000c74271e0 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1014,40 +1014,35 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
>  	return ret;
>  }
>  
> -static int uvc_ioctl_queryctrl(struct file *file, void *fh,
> -			       struct v4l2_queryctrl *qc)
> +static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
> +				    struct v4l2_query_ext_ctrl *qec)
>  {
>  	struct uvc_fh *handle = fh;
>  	struct uvc_video_chain *chain = handle->chain;
>  
> -	return uvc_query_v4l2_ctrl(chain, qc);
> +	return uvc_query_v4l2_ctrl(chain, qec);
>  }
>  
> -static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
> -				    struct v4l2_query_ext_ctrl *qec)
> +static int uvc_ioctl_queryctrl(struct file *file, void *fh,
> +			       struct v4l2_queryctrl *qc)
>  {
>  	struct uvc_fh *handle = fh;
>  	struct uvc_video_chain *chain = handle->chain;
> -	struct v4l2_queryctrl qc = { qec->id };
> +	struct v4l2_query_ext_ctrl qec = { qc->id };
>  	int ret;
>  
> -	ret = uvc_query_v4l2_ctrl(chain, &qc);
> +	ret = uvc_query_v4l2_ctrl(chain, &qec);
>  	if (ret)
>  		return ret;
>  
> -	qec->id = qc.id;
> -	qec->type = qc.type;
> -	strscpy(qec->name, qc.name, sizeof(qec->name));
> -	qec->minimum = qc.minimum;
> -	qec->maximum = qc.maximum;
> -	qec->step = qc.step;
> -	qec->default_value = qc.default_value;
> -	qec->flags = qc.flags;
> -	qec->elem_size = 4;
> -	qec->elems = 1;
> -	qec->nr_of_dims = 0;
> -	memset(qec->dims, 0, sizeof(qec->dims));
> -	memset(qec->reserved, 0, sizeof(qec->reserved));
> +	qc->id = qec.id;
> +	qc->type = qec.type;
> +	strscpy(qc->name, qec.name, sizeof(qc->name));
> +	qc->minimum = qec.minimum;
> +	qc->maximum = qec.maximum;
> +	qc->step = qec.step;
> +	qc->default_value = qec.default_value;
> +	qc->flags = qec.flags;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index f429f325433b..8aca1a2fe587 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -766,7 +766,7 @@ void uvc_status_put(struct uvc_device *dev);
>  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>  
>  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> -			struct v4l2_queryctrl *v4l2_ctrl);
> +			struct v4l2_query_ext_ctrl *v4l2_ctrl);
>  int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
>  			struct v4l2_querymenu *query_menu);
>  
> 


