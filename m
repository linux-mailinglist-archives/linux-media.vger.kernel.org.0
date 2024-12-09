Return-Path: <linux-media+bounces-22928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6079E9801
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90792823A7
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC8B1ACED9;
	Mon,  9 Dec 2024 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SIsszPhc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497AA1ACEC2
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733752737; cv=none; b=K+NXURCnPLdKF+H9nIc6w4qCkXQaKHu0emKssGROIdyuSQ6MAvU8l1RR+AFMi76OSeBqg70crj/1IIzEkMFWGptTwN1UUJMMVa0qGVnTJLSD6jiGaiMfmm8yZfgIPIdLBBuJW8L0kTkOTqpahInNzb22U3ezajNhdUzrTeN+ENk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733752737; c=relaxed/simple;
	bh=oq7NI5KFgFre6T52oWAt0rnSxrGeYNer420M375pCD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+7rjn2QVninpSXxFMe063mKEkmoj5YEkKriOJoGEt52X4IDOqO5udJQqMSka2UyXaFPHrd9z597+ocDLztO4J/06cNDClRJK16RrcexfL9mw5nQX71ylicDGj7eDPk9ICJ/PYZ/JfcjG1Wf614gwl5FAZ+gYUIyb87UksbxWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SIsszPhc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733752733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7QHQ6fdH5kEbsSEM5ocuGy0eYSxlB7jTtXGYrqo+qU=;
	b=SIsszPhcXabMYk84SifL5Tjl1eSFgDZ+0eGXr8Hh+0TEO3pIsw2nO2rWV/wk19qSAwmTFV
	1br3FpfwKpPczrQp9oxk66pZX6r6kpH7vznGhFvMIujHoc+NtHv47MzREcRw7TiQ1tugAx
	iLRiVppV5ZBvDS74sTiXlsPHl7yB9d0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-EFW9Y6quN1W4iAWyvagT3g-1; Mon, 09 Dec 2024 08:58:52 -0500
X-MC-Unique: EFW9Y6quN1W4iAWyvagT3g-1
X-Mimecast-MFC-AGG-ID: EFW9Y6quN1W4iAWyvagT3g
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa63948418fso198940766b.3
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 05:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733752726; x=1734357526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p7QHQ6fdH5kEbsSEM5ocuGy0eYSxlB7jTtXGYrqo+qU=;
        b=GpU51P33DK57zts1i8I5XzKKx/p7mKXv2XIA/KVCAs/HBxCoLC7xXMNxlbpKnM4xKx
         bdsBwMPjAsQQdN0YTEd/ihx9dTX4We/i/c/JHI3AgKa4snXkgt29a70oFH0ckekTOzIl
         c5QoqQDKG8M7riH/503fFIYfOXGmI411kz8kPY0xWFiQgFVkqoM/xtX7oRE1PRLNNf9O
         88L8E5TzoWN1jXTk1L7/K8JvTSra54rvxmjzWu56y71MIYbuG/1wf2i98W4LT1id1oPV
         TCTFSaLYoG4j9bXBEvPPS8BM82fACIP+ThSfD0vT8drHABJtLyMgzSrpydCHWxKsn8rR
         wU2A==
X-Forwarded-Encrypted: i=1; AJvYcCXuqlD6ltB8cl8Ac60fKr35zzx70JHom7dh87Ka6VdxcVoa8GTpXjqoDN9HIBkY89VQzkbeclojJcsUrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFvjtqItfWwQeo1icXUYqz4LHt6twAeab/cRWigWniKT6WKyT
	mOvBwMdOnycz7PYEdRb1SzvtjIw27DrHL2TXEvrpc6vGT2u/SEakmgR7MTU7SRWIPZSg5gNiJIR
	GRY230gTdAAzHNJDVubTmj/Strlwga/iV3mP6GdpbLLDy7Aucod45O7TU8YC4qcjfx98I
X-Gm-Gg: ASbGncv01LZie6rxRVzu6l4gmSTOMf0E2c1GGL8Io3bHpsq0UZ3uh/CUs2WQJo1jUPp
	LEbt1X4Ps4CVgvbojUk3FGU0LFxMUuWgxpi8F/WzHB/xkMG6W2jAn+fG5piTYIzjuk0bpOWTnhg
	qihJ2mXmy+toPeNLl/DIGLGaNyyvS3Yu5eVr2RtCFBqqoo3D9Phgr/RdW3UAK/X7R99mY6lqJa5
	IbhNZtr/AUDgG1ZdQj2LHgaHFed5QEcQEjw9ypGAT4xcPIfuZrOTQ==
X-Received: by 2002:a17:906:3cb2:b0:aa6:423c:850e with SMTP id a640c23a62f3a-aa6423c88c4mr1082617266b.27.1733752726163;
        Mon, 09 Dec 2024 05:58:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/q5DH2fhz/HoaynAnr4jhQZEHAgbly+SJp3H7cKxrjHRo+wJydaxXWPAsZ1RiqkoVr0ryCw==
X-Received: by 2002:a17:906:3cb2:b0:aa6:423c:850e with SMTP id a640c23a62f3a-aa6423c88c4mr1082613766b.27.1733752725771;
        Mon, 09 Dec 2024 05:58:45 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa667843413sm351403266b.24.2024.12.09.05.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:58:45 -0800 (PST)
Message-ID: <e0098601-4242-4044-bb99-c5e86cb0c858@redhat.com>
Date: Mon, 9 Dec 2024 14:58:44 +0100
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

Hi,

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

<snip>

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

While reviewing "[PATCH v15 14/19] media: uvcvideo: Use the camera to clamp compound controls"
I realized that this copy_to_user() is somewhat unexpected. Normally we let the v4l2 core
ioctl wrapper take care of this.

Since there is no room in struct v4l2_ext_control to store the data I guess this is ok,
but IMHO this does at least need a comment explaining how this is a special case.

Regards,

Hans





