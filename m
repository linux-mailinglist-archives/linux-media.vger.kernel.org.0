Return-Path: <linux-media+bounces-22946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB49E9A6E
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 16:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC9B2814CD
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3C41BEF83;
	Mon,  9 Dec 2024 15:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bFyRrr/6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF85233132
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757896; cv=none; b=KkIdMdfCzXn4Hak2hznd3Qsg02wg98BIZABq7f0MXvONCDThnMYN3T3JNjwX3ii5qtcr2LyzUN0oVOkaCbEcMvJryRjYUGYva/yNaecYykWGs+0ie4bYwtUwCB1A3qaI09BZdnO4H7wpHhyhcYptQ4zeYTbr2scBLLY6GvkPA9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757896; c=relaxed/simple;
	bh=Z8ezlDlzfS/VvCx4K0dhY367m+LJZb4FH0Hw1ld9gyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwZm/3M/pui37jTDRXaC2ANr16u78OaReVGJ5wCdqANdpaTRe8a/Vebwrl+Jx77AMUBO+GMfD3sMLO8zuLJeMSKakpQkJCpdqms/X140ggdFs2ifFBWvesPjSA63f/6t4LNFg4D7JuI//BTNR2KgGKPW7rXjIsq5u3QMP6INhEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bFyRrr/6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733757894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lml9igTZ0kguO2PlxaKLV0rcbD78PVoSn43lSLvR664=;
	b=bFyRrr/6WKaEV3cmyfbGYjhCk/6Q7mxr5Eae1DdY0aSlQVHA47bdXOmijgSvFHKXnAIemt
	H5WDYEdUqW804UTRDldBXlXn+G6T9B2rYkCpoVF6IKHCu8htif3rbSEjsRw13Fg/6SmNk+
	HCyti1X71SNaZToq4w5Cc1f9fYs4F58=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-LQZqY8ffPgChWM44YQV9jw-1; Mon, 09 Dec 2024 10:24:53 -0500
X-MC-Unique: LQZqY8ffPgChWM44YQV9jw-1
X-Mimecast-MFC-AGG-ID: LQZqY8ffPgChWM44YQV9jw
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa61e72d68dso322030766b.3
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 07:24:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757892; x=1734362692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lml9igTZ0kguO2PlxaKLV0rcbD78PVoSn43lSLvR664=;
        b=o+zpmDGYoyPbESO8UdFyC7Y/HfcSZyNImfwGFu7Sk9j7GE95HayqzU+GPeE+NDrUni
         YarK5ZdcnALQ9hf1IFB1W1Mjm7+z7B4hcIUr6L+7ibWOmgnBoBF9Fjs2BKgDb+VVae+l
         yfQgL+m+417B1HwCWXG4kGZDGBeJILtr43/FpyS78ud5Vg+TBrCuJTW+gAxIsvuyqs/7
         gidWn0MKASIMrLKMfCB0J/r+XFssuCW953yjIq06MmumB2/PRrZUPLXoDBPBOLd1ZjL5
         qg6R70kiPYXAvST7bSedcqodaumGjiBfCHPxtgReHfSq+fDF+/OkiMEkh/pumk3B3Cox
         8l1w==
X-Forwarded-Encrypted: i=1; AJvYcCU8COwMqowZCXP8V7ESppHvSvWHi8j2fEy4ifeVo/4eZW52OxOMAtjeVshjpM1SgI/j6tkPgS4hCFkAGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1Frhb1WnwipoE0H6lYHt3RKstuMX0ImjoLiKRD8kVEpYaHjO
	XF5fvbom555e+3KsMl5GO9NwpYInwrDXjqfAJ/Hi6VNY3gxr1vLiPoYiI6KVbPUDkUNKqyZgyqv
	W8XsUVcfd+4ZsEI0oOPGB1sqlW0d/89j5Jn76PgaSWXhArsAv2LGiWX6MxgDv
X-Gm-Gg: ASbGncuIxb+iiOzjCoCg/qWCksjl01wV+b6bYFy8bFVBoq+i/xK62yBVNcZb/DRI8HY
	dgDejFr6SCtY1ZIRi1l5YF+YAzNhTNsce5QNcKo03tNGq/LC8fF38S879ucluuFJH/EQ+ECl/pE
	Au2ut2METcOeER4y11lkdDOoxSPlD/EdmZSWDC+lMxQvnyNztYO8Nm7MAYTQOepf3/i768AA7z9
	WxprMr+ewEAK5JmBfHlSah4T4g9nztffg3deRCVuiWPcrPQn8eMJg==
X-Received: by 2002:a17:906:23e9:b0:aa6:78f3:47e5 with SMTP id a640c23a62f3a-aa69cd37769mr91809566b.6.1733757891791;
        Mon, 09 Dec 2024 07:24:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEo0EaUyaeSmt3JlA1qxT41AeaeYLgK7CTAdrxY9r0tJoKdnmwa1wLN6L54AfGtecQ8wYrqsA==
X-Received: by 2002:a17:906:23e9:b0:aa6:78f3:47e5 with SMTP id a640c23a62f3a-aa69cd37769mr91806566b.6.1733757891339;
        Mon, 09 Dec 2024 07:24:51 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6696acc74sm349791866b.134.2024.12.09.07.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:24:50 -0800 (PST)
Message-ID: <dfbbb4a1-2575-42a4-a1f9-c279fc17d9c4@redhat.com>
Date: Mon, 9 Dec 2024 16:24:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] media: uvcvideo: Flush the control cache when we
 get an event
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
 <20241203-uvc-fix-async-v6-5-26c867231118@chromium.org>
 <02a89566-a6f7-4feb-84c3-079795c98a46@redhat.com>
 <CANiDSCuPM1qeerMUBFx+RfqBD35CcfhQeO5hYVHh-ZeQ-4t9Sw@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCuPM1qeerMUBFx+RfqBD35CcfhQeO5hYVHh-ZeQ-4t9Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Dec-24 12:31 PM, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 9 Dec 2024 at 12:03, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Ricardo,
>>
>> On 3-Dec-24 10:20 PM, Ricardo Ribalda wrote:
>>> Asynchronous controls trigger an event when they have completed their
>>> operation.
>>>
>>> This can make that the control cached value does not match the value in
>>> the device.
>>>
>>> Let's flush the cache to be on the safe side.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>
>> Thank you for your patch.
>>
>> It seems that you have missed Laurent's reply asking to improve the commit message:
>>
>> "Conceptually this change looks fine, but the commit message needs to
>> explain why this is safe to do without protecting ctrl->loaded with a
>> lock."
>>
>> https://lore.kernel.org/linux-media/20241203203748.GD5196@pendragon.ideasonboard.com/
>>
>> Or maybe the posting of this v6 and that reply have crossed each other.
> 
> In this v6 I moved loaded=0 from uvc_ctrl_status_event_async() to
> uvc_ctrl_status_event()

Ah I missed that you moved it, my bad.

> Now setting loaded=0 is just after mutex_lock(&chain->ctrl_mutex);
> 
> Do we need a new version?

Since the setting is now clearly done under the lock the new version seems
good to me as is.

So I have now merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

Regards,

Hans

> 
>>
>> Either way please post a new version addressing this comment.
>>
>> Thanks & Regards,
>>
>> Hans
>>
>>
>>
>>> ---
>>>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>> index 3dc9b7a49f64..db29e0e8bfd4 100644
>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>> @@ -1622,6 +1622,9 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>>>
>>>       mutex_lock(&chain->ctrl_mutex);
>>>
>>> +     /* Flush the control cache, the data might have changed. */
>>> +     ctrl->loaded = 0;
>>> +
>>>       handle = ctrl->handle;
>>>       if (handle)
>>>               uvc_ctrl_set_handle(handle, ctrl, NULL);
>>>
>>
> 
> 


