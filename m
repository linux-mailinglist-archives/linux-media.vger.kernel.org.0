Return-Path: <linux-media+bounces-27338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD00A4C3DE
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C603A3AF0
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 14:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0E0213E8B;
	Mon,  3 Mar 2025 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QGBjlslO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE2C213E67
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741013506; cv=none; b=hCMa0Auk7SHuBjBfTfqBqClbJenl0IoQYmdwe2ynS08MEBMvFLt0KU0v0ZUO9OvfhI2W/OplRp6SzZwsbAVsAr07fUSOpAMyltNU+ux7L4qqzbTGugb7Oe4JRpyVj6mU7jvlet6FkjYMAMabIpYvLp+FeGHcTikMHGYOU2f9vS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741013506; c=relaxed/simple;
	bh=DkZ0ZU13h9unh67yYI41Mc2eoLM/G+sBDAukmgqAU6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAonVaT1X0jivy83ZtnmyZmnT5aabVZUa50HxF2LE3atCpvL9sAfzwNTEq5II1EvB/mtAU/cK9R//YcDf18vJ/q4yQ4rnij9sBwdhTmk2USUK4wz7N1eth6Yqhop9PV3piuJR7YfZ9rDnb3sTQrA+gj+HQ9sY2JwUl9Sh0akYfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QGBjlslO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741013503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lzyQeS/lmiZRfQTYNaKZi6MlPZQA4aSfZ3WWfK+EdyY=;
	b=QGBjlslO+Y3YXUPFi2ZVBNrL7Yj70oEuxpza5ImzvO3Sp16SDMK8EpAzaxYFQ6BJHbbVjY
	xJie8GAptzV8AAnBU6O3yoAQ2r7Fbz16BfO29vGjO9ogsgnz/RDLzog9X2S/+MIafEn56O
	gfwJOi9qHXTj+6UgKzotfEfPHo1qdo8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-8D7TFEvxOmCEBIqzvyc9EA-1; Mon, 03 Mar 2025 09:51:42 -0500
X-MC-Unique: 8D7TFEvxOmCEBIqzvyc9EA-1
X-Mimecast-MFC-AGG-ID: 8D7TFEvxOmCEBIqzvyc9EA_1741013501
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e4b6d23a5fso3766703a12.2
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 06:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741013501; x=1741618301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzyQeS/lmiZRfQTYNaKZi6MlPZQA4aSfZ3WWfK+EdyY=;
        b=CNay0BVvLGVIcz0/0x5Yv+VQHmgCB/9IJ9x4QlN50GnDxQxXy6qHWFKJpOGK3OKbwq
         f0nl2rNP4LeAS7tCzudIRBcmVnQMDf53tm7FteoiVz9rKFEWp9NwIae1bTonvntEngnd
         4yjgFTe7SYGdnj5mFr1rGUTCHXbnS+l8eTgTajImutoG9XlMWD4LOEnBQqUjYhu9NNtA
         2RqVHyGhydIl1qIH4dOg1Y/TT2yD+WzImpVepFGPkh9J3EZOBQwmZVavuPuh1cv5AKsh
         JyhqkPGS2cCPlBOjxY+LH4OyPVgCNL7iZZOMFEMDpmsAlUywP2j0kFe7JT178x2cXdLE
         Krtw==
X-Gm-Message-State: AOJu0YzQruc3KSHJer5ckxtK9gEnmKjNQ/Bo/XEMrwwZb1KSU4y+SHqP
	LKMydd4Bxp5JoSRgquxO5rX0YTBK1/2b8i3zdlV68Iksh9osanSzrRaNbdIqw8GPqVS12vGs903
	u4I6lczUqhHQfxG7myeF6RwvuyFUNfKL9Rh8RCTkGu7u2dGjic8vuS0ysIAhO
X-Gm-Gg: ASbGnct8E9rxPUsvnUWm6689ggVjCEDWsJxL4u786jmFO/yDmHd7RIVEQZpJA65AuGj
	BlAETTMuVn23HMDlOh/RDUOxCAJlM+ZB8RRn8oAcUmd9SqmwQBWpRGqjVkQOkN+Hfjt2xiv72wK
	nejjxRUpe4UL/Nw/ibDsNpnEGt8EvazjB+6uAiOUo/tMJKLUpzTWaSSLf5XZwdPcKDn5yU54Peh
	brFEkk/WI90oAlX3PCpak7S8f4JAIi9MWMTV990arnbg2wPqBHi4L8ZkBfTErQQwlyyagG5WEww
	VGb2+NbFOAM5hODln1M=
X-Received: by 2002:a05:6402:5247:b0:5de:e02a:89c1 with SMTP id 4fb4d7f45d1cf-5e4d6b62a7emr14619245a12.26.1741013501168;
        Mon, 03 Mar 2025 06:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQBXMOgL+HG0jccPl6+aG8dYZda1+GqG2MpgHoytE7nB1BqrhIyLiAJarjgZcWY5donAVpUA==
X-Received: by 2002:a05:6402:5247:b0:5de:e02a:89c1 with SMTP id 4fb4d7f45d1cf-5e4d6b62a7emr14619214a12.26.1741013500778;
        Mon, 03 Mar 2025 06:51:40 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa3bsm6905057a12.16.2025.03.03.06.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 06:51:40 -0800 (PST)
Message-ID: <a506c61b-41cd-4067-a358-a5c6e94427fb@redhat.com>
Date: Mon, 3 Mar 2025 15:51:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: uvcvideo: Return the number of processed
 controls
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-1-de993ed9823b@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250224-uvc-data-backup-v2-1-de993ed9823b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 24-Feb-25 11:34, Ricardo Ribalda wrote:
> If we let know our callers that we have not done anything, they will be
> able to optimize their decisions.
> 
> Cc: stable@kernel.org
> Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4e58476d305e..f2484f6d21c1 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1846,12 +1846,17 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
>  	return mutex_lock_interruptible(&chain->ctrl_mutex) ? -ERESTARTSYS : 0;
>  }
>  
> +/*
> + * Returns the number of uvc controls that have been correctly set, or a
> + * negative number if there has been an error.
> + */
>  static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  				  struct uvc_fh *handle,
>  				  struct uvc_entity *entity,
>  				  int rollback,
>  				  struct uvc_control **err_ctrl)
>  {
> +	unsigned int processed_ctrls = 0;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
>  	int ret;
> @@ -1886,6 +1891,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  		else
>  			ret = 0;
>  
> +		if (!ret)
> +			processed_ctrls++;
> +
>  		if (rollback || ret < 0)
>  			memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>  			       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_BACKUP),
> @@ -1904,7 +1912,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  			uvc_ctrl_set_handle(handle, ctrl, handle);
>  	}
>  
> -	return 0;
> +	return processed_ctrls;
>  }
>  
>  static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
> @@ -1951,6 +1959,7 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  
>  	if (!rollback)
>  		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
> +	ret = 0;
>  done:
>  	mutex_unlock(&chain->ctrl_mutex);
>  	return ret;
> 


