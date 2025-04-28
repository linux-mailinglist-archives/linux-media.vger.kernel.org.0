Return-Path: <linux-media+bounces-31211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA54A9F250
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 15:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9307168667
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8FB26B962;
	Mon, 28 Apr 2025 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fCG6UoZQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF321A072A
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846904; cv=none; b=szRQ7KXxikHytaYcbUOI77UILgRv+XVzUQZoWnhTcKGT+TiGmSH1IO5q0L3ct8vjg+J3wrKeSZIXNlrgpbRdQ3preZOLNtGwxTMBOMya/TxvxyWoAWjunaSIDFqskgPE9ND+t1ZTrho4zkZzP5zFyC+SFGzjptomxrcOw6nMGv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846904; c=relaxed/simple;
	bh=l3dVdh9wzuSTOKDHUFz0b9/AIs71l6IsH7JSLxyvWm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7QGYKvPymnmZQzFZa7/YXQdK6JE+jq2GQ72KvL0bJJ7th1rHnqEaVTMDHZoK57bI6uTnqUtyL4AZzLpGtgFcuoQOORmi8CpWppEkIx//wEiIkx1C/TzgphMmrcwZuFF1Fi0Q4jTztv68ArAegJNdtrTgZGx1ZPV+0AB9KdCGLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fCG6UoZQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745846901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg0xq41qt97xR3ZvTPk2wgbDhcDx4hFTu+2DD4oLNRw=;
	b=fCG6UoZQ4H60VIVxH6imAeoiIoFEXev9Yzjw6H0iufiiSDnxEKS/SWJcJS+myobuT/9QnG
	rsjeIqzQkOH6ELuVYUBH8q9P8FjsEcfs+x0F1QuiQBpKIseVUT+gxaP/7nM65XSMgHRIZT
	Gztiti/5YmuimnoYV+bLQ3PVYP23VUI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-Ajj79vRoOeahJRqXs0CkdQ-1; Mon, 28 Apr 2025 09:28:19 -0400
X-MC-Unique: Ajj79vRoOeahJRqXs0CkdQ-1
X-Mimecast-MFC-AGG-ID: Ajj79vRoOeahJRqXs0CkdQ_1745846898
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac37ed2b99fso427678966b.3
        for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 06:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745846898; x=1746451698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg0xq41qt97xR3ZvTPk2wgbDhcDx4hFTu+2DD4oLNRw=;
        b=NBtSN4nhxDbpC5py7niRo3RR0AVyAaWei20R8194CVkYLFmTM7uGxR1s/+AnMdfQm5
         Qjo0wxnw3Oxxdl0JmQOHvgoqyHfFmS9S4b/BKa8v8N9NzKjyuyNbocH+Ph8AeLgUsQ/A
         P7okSfEetAagvaXmQn42VAsrCU3uwv5bMSzYF2Wdzs04tH1aPnLGUDg5ZD2zK55HbNJT
         qgONMWQCOzAPoziXcbl04g78DbDOAVsBH89RJS8fcWaBsB5eNYrYU5aAkRGKQqRvY8ev
         A1GwknDpLHtSBjJN/6wLE8K4BA0ALkSDEdAn7pWXDvd1M+INcRyTfSk0jB2/stuwZTMH
         CZwA==
X-Forwarded-Encrypted: i=1; AJvYcCWk0qeXXZyroYJ/SbTaYd/+7wcHE9fpXOyq56Wst43LD36+1u5OGZ6DYvgEbe0985l1l0AQYhMrxKD0lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvioo9U2s8zWa5Q/S3jENxj3S64Bmvs7hDD+qipS/47QTpu9A
	cK9igUAO3RiFzVoAuwZUhdKpL0ynDIdKbMY1cA4Gp+p/FTJUKGGYnSJkLQLXr9uXBFv/UZtVWqk
	XDdIipZA/KTmLt0afkeN+H+Rke0zC00j8oMXODiP7C0MYsT+5Sz3fg2TNJoQL
X-Gm-Gg: ASbGncsiVUs2rd/ONLnPk+pwpg/WJkaWL6AEH4Xr9SsTUf26r/Y23sAJ3RpWqxWxqzu
	NKHTgEZjEWUauTYZAds8nkFjV8OlfgD+oSuzkhKPkK+8qTpOrDJ6jNwF2R0LJKDiNdo9KEH1VjB
	pJyewPjt8xWSd0YHftIFOW49Ocsq2X35Wi4ozCHDdF384Xti6WdhM+zX2NBW+al/XJx4wAh5vBO
	PTtXLer/XPXfLhXR8v20MpAY3Mknof+5se6PKI4jVebw37PzWCUzp6rvPgpC/Q0lKzr8IKkgVsS
	dD6Y3qfVt7zlmm0=
X-Received: by 2002:a17:907:9812:b0:acb:5070:dd19 with SMTP id a640c23a62f3a-ace7140871emr986957166b.61.1745846898404;
        Mon, 28 Apr 2025 06:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtlXu0jsASJ3MeiUP+hMifoEhEfHok+6uVTbLwLAPDU6I6D9W4QXDaUyIpZvionOFT+g0NGQ==
X-Received: by 2002:a17:907:9812:b0:acb:5070:dd19 with SMTP id a640c23a62f3a-ace7140871emr986954566b.61.1745846897877;
        Mon, 28 Apr 2025 06:28:17 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed705e5sm628164366b.145.2025.04.28.06.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:28:17 -0700 (PDT)
Message-ID: <5e8025a1-63f2-4120-8160-8848a5cf34ec@redhat.com>
Date: Mon, 28 Apr 2025 15:28:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Fix deferred probing error
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
 <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org>
 <20250422180630.GJ17813@pendragon.ideasonboard.com>
 <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com>
 <20250422230513.GX17813@pendragon.ideasonboard.com>
 <CANiDSCssyAVoyvsiO8thGwUFc_boA_jhBxYDif32Hxh40fhf-Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCssyAVoyvsiO8thGwUFc_boA_jhBxYDif32Hxh40fhf-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 23-Apr-25 01:18, Ricardo Ribalda wrote:
> On Wed, 23 Apr 2025 at 07:05, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> On Wed, Apr 23, 2025 at 06:50:10AM +0800, Ricardo Ribalda wrote:
>>> On Wed, 23 Apr 2025 at 02:06, Laurent Pinchart wrote:
>>>> On Thu, Mar 13, 2025 at 12:20:39PM +0000, Ricardo Ribalda wrote:
>>>>> uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
>>>>> have not yet been probed. This return code should be propagated to the
>>>>> caller of uvc_probe() to ensure that probing is retried when the required
>>>>> GPIOs become available.
>>>>>
>>>>> Currently, this error code is incorrectly converted to -ENODEV,
>>>>> causing some internal cameras to be ignored.
>>>>>
>>>>> This commit fixes this issue by propagating the -EPROBE_DEFER error.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
>>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>> ---
>>>>>  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
>>>>>  1 file changed, 19 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>>>> index deadbcea5e227c832976fd176c7cdbfd7809c608..e966bdb9239f345fd157588ebdad2b3ebe45168d 100644
>>>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>>>> @@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
>>>>>  #endif
>>>>>
>>>>>       /* Parse the Video Class control descriptor. */
>>>>> -     if (uvc_parse_control(dev) < 0) {
>>>>> +     ret = uvc_parse_control(dev);
>>>>> +     if (ret < 0) {
>>>>> +             ret = -ENODEV;
>>>>
>>>> Why do you set ret to -ENODEV here...
>>>>
>>>>>               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
>>>>>               goto error;
>>>>>       }
>>>>>
>>>>>       /* Parse the associated GPIOs. */
>>>>> -     if (uvc_gpio_parse(dev) < 0) {
>>>>> +     ret = uvc_gpio_parse(dev);
>>>>> +     if (ret < 0) {
>>>>>               uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
>>>>>               goto error;
>>>>>       }
>>>>> @@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
>>>>>       }
>>>>>
>>>>>       /* Register the V4L2 device. */
>>>>> -     if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
>>>>> +     ret = v4l2_device_register(&intf->dev, &dev->vdev);
>>>>> +     if (ret < 0)
>>>>
>>>> ... but not here ? The code below is also not very consistant.
>>>
>>> For all the "external" functions I was looking into populating their
>>> error code to probe(). Other drivers (check vivid for example) do
>>> exactly this.
>>>
>>> There is more value in returning the real cause of the error (ENOMEM,
>>> EINVAL) that the plain ENODEV.
>>
>> Yes, I got that, my question was why you override the return value of
>> e.g. uvc_parse_control() or uvc_scan_device() with -ENODEV, but not for
>> e.g. uvc_gpio_parse() or v4l2_device_register(). There's no explanation
>> in the commit message regarding why they're treated differently.
> 
> Because it is less risky that way. There are plenty of examples where
> the framework functions return code is passed to probe().
> 
> The uvc_* functions might or might not work this way. When I do that
> assessment for every function I can post a different patch. I thought
> that this approach was safer, especially if we are cc-ing stable.
> 
> A note in the commit message would have been a nice thing to have I agree :).

I agree with Laurent that just properly propagating the error code of
all functions, without overriding the return value with another -EXXXX code
in some places seems a better and cleaner way to handle this.

In the end the return value of uvc_probe() does not matter that much,
the only difference is that for errors other then -ENODEV the driver-core
will print an extra error message. But we should not fail to probe anyways.

If we get bug reports about this we can revisit, but for simplicity and
consistency reasons I would prefer to just always return the error of
the called function as is.

Regards,

Hans




>>>>>               goto error;
>>>>>
>>>>>       /* Scan the device for video chains. */
>>>>> -     if (uvc_scan_device(dev) < 0)
>>>>> +     if (uvc_scan_device(dev) < 0) {
>>>>> +             ret = -ENODEV;
>>>>>               goto error;
>>>>> +     }
>>>>>
>>>>>       /* Initialize controls. */
>>>>> -     if (uvc_ctrl_init_device(dev) < 0)
>>>>> +     if (uvc_ctrl_init_device(dev) < 0) {
>>>>> +             ret = -ENODEV;
>>>>>               goto error;
>>>>> +     }
>>>>>
>>>>>       /* Register video device nodes. */
>>>>> -     if (uvc_register_chains(dev) < 0)
>>>>> +     if (uvc_register_chains(dev) < 0) {
>>>>> +             ret = -ENODEV;
>>>>>               goto error;
>>>>> +     }
>>>>>
>>>>>  #ifdef CONFIG_MEDIA_CONTROLLER
>>>>>       /* Register the media device node */
>>>>> -     if (media_device_register(&dev->mdev) < 0)
>>>>> +     ret = media_device_register(&dev->mdev);
>>>>> +     if (ret < 0)
>>>>>               goto error;
>>>>>  #endif
>>>>>       /* Save our data pointer in the interface data. */
>>>>> @@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
>>>>>  error:
>>>>>       uvc_unregister_video(dev);
>>>>>       kref_put(&dev->ref, uvc_delete);
>>>>> -     return -ENODEV;
>>>>> +     return ret;
>>>>>  }
>>>>>
>>>>>  static void uvc_disconnect(struct usb_interface *intf)
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 
> 
> 


