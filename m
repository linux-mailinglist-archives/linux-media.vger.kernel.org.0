Return-Path: <linux-media+bounces-22451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4E89E067F
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A977B3C7B7
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7301E20C03B;
	Mon,  2 Dec 2024 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FVIwaenU"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB6B207A3A
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150647; cv=none; b=t+HGsdGudAr2he5NV24UwemyYQx2C7xkaKlmvZwubiJgU0ZLWaqkgncTzDKD6TTS3sSW0R32RoffqVeHBSLW4QeMDr8tPPmIgd8A//MnBYNZS0xR4h9a//jzJfugc1H2qG8I4G3so7SOMzawaGZMLqE5DGqI3GntGAGma+2IB+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150647; c=relaxed/simple;
	bh=ghw5/sgatauhigZGW+cYbjW0WgYXPCUoRtwmKDdykUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d03jgbUpgd+jh4Dmf43mwFrkTq0JiO5Fx3sdcFJTIU+HENsyK/UskOjb3zx9ib5ZTTh7nu3MwMHDPsKNYD3vhOEqRouRvWLtpY7CXnnt6z1jmP1S+8K8/ucT0fsMHBnj56fcQCw0M05pRTRDwZaSkH+zT4UQiAu328kl5uo/LI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FVIwaenU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733150644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0u1AtSIvoAjAdUuJPZtCWpWUtVV5/8tB5/FsGjDgVTg=;
	b=FVIwaenUHD0IdTwUmSb/G+LekTHE8HtWXgpc2LO9jnAy3hZo32EEHceVarNRDD1otfReWQ
	GgmEAkvQVAKddAyiNALO87p645xrbJzXj0zi63Z4WjYFlEdT11Wnq/kmFAgdctI+f867gZ
	U9w4niGgUOSFLnSN57CfYS9j5/m+d10=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-NuEpbxivM4qYUjGwe8GWEg-1; Mon, 02 Dec 2024 09:44:03 -0500
X-MC-Unique: NuEpbxivM4qYUjGwe8GWEg-1
X-Mimecast-MFC-AGG-ID: NuEpbxivM4qYUjGwe8GWEg
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d0cd8a0ec5so1553145a12.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150642; x=1733755442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0u1AtSIvoAjAdUuJPZtCWpWUtVV5/8tB5/FsGjDgVTg=;
        b=ahqCmSfs4+otcQhZKF0i3BHKy43ZhRSH/kayT4WnYqpR/x3arg5zh+xdEuacLegqxA
         6oDhz5cKaeeMJt9SRGe8uCmeHxkxUaIPVlzIeU3ByClwJTfuLag6mtODM5/YzeaeqGEM
         9OR63Lj22Ot1azOiaBZB2gdA6YASrnCbziQ/noBu/DEDKZauIU8O03ELc7l6vaOrJnCd
         A5l0z96H5Nb7xZhTZSZJwDX9g3E5RSmB/EACP/8abdWrhyayFWB7iqZ7LQpteu0sN/KE
         Xc42U+yiaHoHdxH0ELDf+F/JsKBrB8+lEscyFCxt6/zAKxNryez/I87CDbnseFrG5XRY
         P3mg==
X-Forwarded-Encrypted: i=1; AJvYcCVEJtsFx3MfXZUjT1TW0n0CeCxxVF2ipzBJTJd6togtOvESn65vvvNpSt+BuPaZd35Y0hRUKBLk0GNbSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBpZipP4jdeY+V3tAgyuOnZyYtoqr52YZZYK9PSrwFBU8qdEc
	7+0yW0KE1gDr8bPnERdgdMtqVbVR2h/el7rX+pCVFe/yaDdymOLA1+AHVczCQfIHw124R1uK1Qd
	sFuiZgy/IP7KtYNTSdXq82HoWw1pfsvDxn5Dy6dZkLl7gNJhhDCnah+RrvmG0
X-Gm-Gg: ASbGncs4VLlAwvrgnuKBSWy+U7FizYlcQj1/FwFD0koLUgEsXZOooK+wd1QTEMJKT+Z
	prZLgBpTmTp4f6CaS32OZSBbLc/VWH6qCWXbXGeNU3wTkqx6xl2DpTKzpgGYuRGoAYz9qbqr6RN
	TVv+AjPqEpOdhv0MKEDjre9IzXWKKGrOtboybUsNa/6HOtWzXwGiitT4YJZIDjlw2w1NBJAEyZ5
	xcIztihMjKlaWaqmVov/IbZr2f1NlKVEc6Sw7owpTrk7WK6gm2ykA==
X-Received: by 2002:a05:6402:2743:b0:5d0:e568:7ba1 with SMTP id 4fb4d7f45d1cf-5d0e5688804mr6843007a12.30.1733150641699;
        Mon, 02 Dec 2024 06:44:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWF4PANTV7QM9gmc9vOIQsZ+o2QQHXMvTVA4aaxxEJKtLVDAOhFJn+aQIj3fgeQcZdoiUR2A==
X-Received: by 2002:a05:6402:2743:b0:5d0:e568:7ba1 with SMTP id 4fb4d7f45d1cf-5d0e5688804mr6842979a12.30.1733150641274;
        Mon, 02 Dec 2024 06:44:01 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0c6999e45sm3391302a12.52.2024.12.02.06.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:44:00 -0800 (PST)
Message-ID: <79da5e62-acb0-4bf5-a1c0-f2000fae0167@redhat.com>
Date: Mon, 2 Dec 2024 15:44:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: uvcvideo: Remove dangling pointers
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-2-6658c1fe312b@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241202-uvc-fix-async-v5-2-6658c1fe312b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
> When an async control is written, we copy a pointer to the file handle
> that started the operation. That pointer will be used when the device is
> done. Which could be anytime in the future.
> 
> If the user closes that file descriptor, its structure will be freed,
> and there will be one dangling pointer per pending async control, that
> the driver will try to use.
> 
> Clean all the dangling pointers during release().
> 
> To avoid adding a performance penalty in the most common case (no async
> operation), a counter has been introduced with some logic to make sure
> that it is properly handled.
> 
> Cc: stable@vger.kernel.org
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 52 ++++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
>  drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
>  3 files changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 9a80a7d8e73a..af1e38f5c6e9 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1579,6 +1579,37 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>  
> +static void uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> +{
> +	lockdep_assert_held(&handle->chain->ctrl_mutex);
> +
> +	if (ctrl->handle)
> +		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> +				     "UVC non compliance: Setting an async control with a pending operation.");
> +
> +	if (handle == ctrl->handle)
> +		return;
> +
> +	if (ctrl->handle)
> +		ctrl->handle->pending_async_ctrls--;
> +
> +	ctrl->handle = handle;
> +	handle->pending_async_ctrls++;
> +}

Maybe simplify this to:

static void uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
{
	lockdep_assert_held(&handle->chain->ctrl_mutex);

	if (!ctrl->handle)
		handle->pending_async_ctrls++;
	else
		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
				     "UVC non compliance: Setting an async control with a pending operation.");

	ctrl->handle = handle;
}

?

Otherwise the patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> +static void uvc_ctrl_put_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> +{
> +	lockdep_assert_held(&handle->chain->ctrl_mutex);
> +
> +	if (ctrl->handle != handle) /* Nothing to do here.*/
> +		return;
> +
> +	ctrl->handle = NULL;
> +	if (WARN_ON(!handle->pending_async_ctrls))
> +		return;
> +	handle->pending_async_ctrls--;
> +}
> +
>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  			   struct uvc_control *ctrl, const u8 *data)
>  {
> @@ -1589,7 +1620,8 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  	mutex_lock(&chain->ctrl_mutex);
>  
>  	handle = ctrl->handle;
> -	ctrl->handle = NULL;
> +	if (handle)
> +		uvc_ctrl_put_handle(handle, ctrl);
>  
>  	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>  		s32 value = __uvc_ctrl_get_value(mapping, data);
> @@ -1865,7 +1897,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		if (!rollback && handle &&
>  		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> -			ctrl->handle = handle;
> +			uvc_ctrl_get_handle(handle, ctrl);
>  	}
>  
>  	return 0;
> @@ -2774,6 +2806,22 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  	return 0;
>  }
>  
> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> +{
> +	struct uvc_entity *entity;
> +
> +	guard(mutex)(&handle->chain->ctrl_mutex);
> +
> +	if (!handle->pending_async_ctrls)
> +		return;
> +
> +	list_for_each_entry(entity, &handle->chain->dev->entities, list)
> +		for (unsigned int i = 0; i < entity->ncontrols; ++i)
> +			uvc_ctrl_put_handle(handle, &entity->controls[i]);
> +
> +	WARN_ON(handle->pending_async_ctrls);
> +}
> +
>  /*
>   * Cleanup device controls.
>   */
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 97c5407f6603..b425306a3b8c 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
>  
>  	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>  
> +	uvc_ctrl_cleanup_fh(handle);
> +
>  	/* Only free resources if this is a privileged handle. */
>  	if (uvc_has_privileges(handle))
>  		uvc_queue_release(&stream->queue);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 07f9921d83f2..92ecdd188587 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -337,7 +337,11 @@ struct uvc_video_chain {
>  	struct uvc_entity *processing;		/* Processing unit */
>  	struct uvc_entity *selector;		/* Selector unit */
>  
> -	struct mutex ctrl_mutex;		/* Protects ctrl.info */
> +	struct mutex ctrl_mutex;		/*
> +						 * Protects ctrl.info,
> +						 * ctrl.handle and
> +						 * uvc_fh.pending_async_ctrls
> +						 */
>  
>  	struct v4l2_prio_state prio;		/* V4L2 priority state */
>  	u32 caps;				/* V4L2 chain-wide caps */
> @@ -612,6 +616,7 @@ struct uvc_fh {
>  	struct uvc_video_chain *chain;
>  	struct uvc_streaming *stream;
>  	enum uvc_handle_state state;
> +	unsigned int pending_async_ctrls;
>  };
>  
>  struct uvc_driver {
> @@ -797,6 +802,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);
>  
> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> +
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>  					    u8 epaddr);
> 


