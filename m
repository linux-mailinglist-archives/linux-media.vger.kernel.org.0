Return-Path: <linux-media+bounces-22460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9659E080A
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 17:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 572C2B4579D
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264C4209F3B;
	Mon,  2 Dec 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eq9rmD/E"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A542207A0A
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151378; cv=none; b=ZNmMZ1ytwhfQDn7N98wifmQkl9+tP3eiD29+/AZ8mdvIiq3AGZjMzziZG9M8tOIrrYIyvTfEN4qF8qTUkMxZpR0Ui1hEjQjvuWANG1xndC8CvFS46ZAmJZC4LRjJLsMLt0i6yj13v/3fmJBPMXBg1X/x9JJted4MXdbGOz21L84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151378; c=relaxed/simple;
	bh=fKP/RiMYgZS2O68QD/EI11Q3lQSHnma6zMItBFmLxKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJGQVMIC6K7nPqUaDUX0c9QT+EylJyNitPTiFskeOr1mocruHClTZyziWIVmZKwkTUDe9NkW4/Rw6+N2bFJlOrIsEnDy6Wwt1UBJxL690dL7rdMyHrO3Muwdq5S7RzIPu46gbuKXLFFpAP0jAI3g4p4JFTiSV+dWI04ZDnln48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eq9rmD/E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733151373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgML7MvW6KLkBDw9XHbFRndWiyvemLPs+WW1WJQdJVc=;
	b=eq9rmD/EYmmSKr3f6HdGd/Hda2jq9UznpI4a2VuBtX+Dc/NXvFId1aWY5NDeFBBoY/OU3z
	IG8m8hO6oT+eIc8Qph5jf5+9gRY4bHT608jTKEl/9SdgC/58HHxSrEvSDGpzA1iNXjrrI5
	jy3BXZbe2GLGW4XEGQDPYEZcw9hq7+I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-cLXdXMz4MHe_QMLhNKDOeA-1; Mon, 02 Dec 2024 09:56:12 -0500
X-MC-Unique: cLXdXMz4MHe_QMLhNKDOeA-1
X-Mimecast-MFC-AGG-ID: cLXdXMz4MHe_QMLhNKDOeA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa53116660fso287339266b.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151371; x=1733756171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgML7MvW6KLkBDw9XHbFRndWiyvemLPs+WW1WJQdJVc=;
        b=XiS8tTFyXUf9SVIp+SlDBmO2MBHf5oWTCCEBmz0/8F9rLiXuyRr7iLIE3EsFe03yL/
         UsTKxq5a+81c66PItXuuvGDoJQ0iJmxe7CEKkglZNza7Jrf8zuGNyjTr4B4NZujNKZ93
         nf9eeIaidFxte/3orKVQEpO/0lJjxVa90XX+G12v6yZcDDEkHmMGwRqRGS2fiZ8P0SpZ
         UaQUrbhBcJCHdHfDEfpa/LZbg0aEyQN2yThkO79vwV1X8XYu62y9vHAhDgYEa1FbJohi
         jP5iUkXxCZ2h6ZgBUbNYIcoJgmBT877y5w6pm5BBtRPE1Y0FuJqPcQaTiGeFElMkSQlW
         0O4A==
X-Forwarded-Encrypted: i=1; AJvYcCVpUqC50WaJyUjAPt9qxwLsBJ2LjG6tP1RcIgrf1C1PHcNSBVj8xhU25pZaxia7ogsamXzRMz/Y4ntteQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVYNlK5ATFBqIukkbz7NxvlJ5WX3BEugFrLD7iDjdlTwNX7tc
	jA4Ha0/3CoCTQQR5ML1TooEuEEbIJIEnTFMfALFydHD5oiRr7EFlAeAA3H6gpAWoO/uc30EItRa
	DkhdQr6ysRuA0m3N7xBHiZjsh5/x6qDYEg0l+0L3Y7+k4gsFhNv1c38UKhjKQ
X-Gm-Gg: ASbGncv5BiVQO16xCVzTW6I4BL4sW/9AMXVJcsrnBY1YB9b35zxC9g4v9WJiHVfwGdo
	KMNKYZfwOTpa613pkmu8ldA4L1B594DtepsSOxH8T0IO+exyStFaSH7mUSDZZEUK8RqW3FqREBB
	+w1BSCN/jb3jWaq6ULhwr7PhW0WmOOy6W6IMSiYYSDfnQAqvguOt8NEdv+c3sQzDn2anfX0AVJf
	haijPzLMAIjmKJWF1fIY6hvVVfTzf+CNSEBTD+WXBusRAslR62SiQ==
X-Received: by 2002:a17:906:329a:b0:aa5:1d08:dacf with SMTP id a640c23a62f3a-aa580f01a6amr2029062766b.13.1733151370769;
        Mon, 02 Dec 2024 06:56:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJQaJW0zre9XIeROgYN/FJjTnxYGPO36rn6GiEgfSijb3+9BRwxJ39xLZ6IITHDMcGsy9uQA==
X-Received: by 2002:a17:906:329a:b0:aa5:1d08:dacf with SMTP id a640c23a62f3a-aa580f01a6amr2029060066b.13.1733151370143;
        Mon, 02 Dec 2024 06:56:10 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e64a8sm514473266b.130.2024.12.02.06.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:56:09 -0800 (PST)
Message-ID: <38121061-452d-486a-80e5-e4cda0ab9071@redhat.com>
Date: Mon, 2 Dec 2024 15:56:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: uvcvideo: Remove dangling pointers
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-2-6658c1fe312b@chromium.org>
 <79da5e62-acb0-4bf5-a1c0-f2000fae0167@redhat.com>
 <CANiDSCu3BjC1JsnmgX5eEapBpzHw+HZUw58iiyVfe4KqEDCWVA@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCu3BjC1JsnmgX5eEapBpzHw+HZUw58iiyVfe4KqEDCWVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Dec-24 3:49 PM, Ricardo Ribalda wrote:
> Hi Hans
> 
> 
> On Mon, 2 Dec 2024 at 15:44, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
>>> When an async control is written, we copy a pointer to the file handle
>>> that started the operation. That pointer will be used when the device is
>>> done. Which could be anytime in the future.
>>>
>>> If the user closes that file descriptor, its structure will be freed,
>>> and there will be one dangling pointer per pending async control, that
>>> the driver will try to use.
>>>
>>> Clean all the dangling pointers during release().
>>>
>>> To avoid adding a performance penalty in the most common case (no async
>>> operation), a counter has been introduced with some logic to make sure
>>> that it is properly handled.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/usb/uvc/uvc_ctrl.c | 52 ++++++++++++++++++++++++++++++++++++++--
>>>  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
>>>  drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
>>>  3 files changed, 60 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>> index 9a80a7d8e73a..af1e38f5c6e9 100644
>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>> @@ -1579,6 +1579,37 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>>>       uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>>>  }
>>>
>>> +static void uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
>>> +{
>>> +     lockdep_assert_held(&handle->chain->ctrl_mutex);
>>> +
>>> +     if (ctrl->handle)
>>> +             dev_warn_ratelimited(&handle->stream->dev->udev->dev,
>>> +                                  "UVC non compliance: Setting an async control with a pending operation.");
>>> +
>>> +     if (handle == ctrl->handle)
>>> +             return;
>>> +
>>> +     if (ctrl->handle)
>>> +             ctrl->handle->pending_async_ctrls--;
>>> +
>>> +     ctrl->handle = handle;
>>> +     handle->pending_async_ctrls++;
>>> +}
>>
>> Maybe simplify this to:
> 
> I do not think that we can do that simplification.
> 
> If we do that, the original file handle `pending_async_ctrls` value
> will be out of sync.

Ah good point, I missed that the -- and ++ are done on 2 potentially
different handles.

Regards,

Hans



>> static void uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
>> {
>>         lockdep_assert_held(&handle->chain->ctrl_mutex);
>>
>>         if (!ctrl->handle)
>>                 handle->pending_async_ctrls++;
>>         else
>>                 dev_warn_ratelimited(&handle->stream->dev->udev->dev,
>>                                      "UVC non compliance: Setting an async control with a pending operation.");
>>
>>         ctrl->handle = handle;
>> }
>>
>> ?
>>
>> Otherwise the patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> 
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> +static void uvc_ctrl_put_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
>>> +{
>>> +     lockdep_assert_held(&handle->chain->ctrl_mutex);
>>> +
>>> +     if (ctrl->handle != handle) /* Nothing to do here.*/
>>> +             return;
>>> +
>>> +     ctrl->handle = NULL;
>>> +     if (WARN_ON(!handle->pending_async_ctrls))
>>> +             return;
>>> +     handle->pending_async_ctrls--;
>>> +}
>>> +
>>>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>>>                          struct uvc_control *ctrl, const u8 *data)
>>>  {
>>> @@ -1589,7 +1620,8 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>>>       mutex_lock(&chain->ctrl_mutex);
>>>
>>>       handle = ctrl->handle;
>>> -     ctrl->handle = NULL;
>>> +     if (handle)
>>> +             uvc_ctrl_put_handle(handle, ctrl);
>>>
>>>       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>>>               s32 value = __uvc_ctrl_get_value(mapping, data);
>>> @@ -1865,7 +1897,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>>>
>>>               if (!rollback && handle &&
>>>                   ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>>> -                     ctrl->handle = handle;
>>> +                     uvc_ctrl_get_handle(handle, ctrl);
>>>       }
>>>
>>>       return 0;
>>> @@ -2774,6 +2806,22 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>>>       return 0;
>>>  }
>>>
>>> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>>> +{
>>> +     struct uvc_entity *entity;
>>> +
>>> +     guard(mutex)(&handle->chain->ctrl_mutex);
>>> +
>>> +     if (!handle->pending_async_ctrls)
>>> +             return;
>>> +
>>> +     list_for_each_entry(entity, &handle->chain->dev->entities, list)
>>> +             for (unsigned int i = 0; i < entity->ncontrols; ++i)
>>> +                     uvc_ctrl_put_handle(handle, &entity->controls[i]);
>>> +
>>> +     WARN_ON(handle->pending_async_ctrls);
>>> +}
>>> +
>>>  /*
>>>   * Cleanup device controls.
>>>   */
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index 97c5407f6603..b425306a3b8c 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
>>>
>>>       uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>>>
>>> +     uvc_ctrl_cleanup_fh(handle);
>>> +
>>>       /* Only free resources if this is a privileged handle. */
>>>       if (uvc_has_privileges(handle))
>>>               uvc_queue_release(&stream->queue);
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index 07f9921d83f2..92ecdd188587 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -337,7 +337,11 @@ struct uvc_video_chain {
>>>       struct uvc_entity *processing;          /* Processing unit */
>>>       struct uvc_entity *selector;            /* Selector unit */
>>>
>>> -     struct mutex ctrl_mutex;                /* Protects ctrl.info */
>>> +     struct mutex ctrl_mutex;                /*
>>> +                                              * Protects ctrl.info,
>>> +                                              * ctrl.handle and
>>> +                                              * uvc_fh.pending_async_ctrls
>>> +                                              */
>>>
>>>       struct v4l2_prio_state prio;            /* V4L2 priority state */
>>>       u32 caps;                               /* V4L2 chain-wide caps */
>>> @@ -612,6 +616,7 @@ struct uvc_fh {
>>>       struct uvc_video_chain *chain;
>>>       struct uvc_streaming *stream;
>>>       enum uvc_handle_state state;
>>> +     unsigned int pending_async_ctrls;
>>>  };
>>>
>>>  struct uvc_driver {
>>> @@ -797,6 +802,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>>>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>>>                     struct uvc_xu_control_query *xqry);
>>>
>>> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
>>> +
>>>  /* Utility functions */
>>>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>>>                                           u8 epaddr);
>>>
>>
> 
> 


