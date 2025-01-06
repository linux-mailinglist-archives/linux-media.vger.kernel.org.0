Return-Path: <linux-media+bounces-24299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B0A02C21
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 16:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A03BD3A794B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 15:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96441DED5F;
	Mon,  6 Jan 2025 15:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AyG4Z4XG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF781DDA3B
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736178573; cv=none; b=XRU4mniyzU0+fJgl9ko4k+W1ATCangUs70SH/JciVQjbOHuOFLYL9O+CqKgupkiokQptoR+uPIw22HeZmTrYuKwYWrhJsHft1L1ILXWNEKUvB+VdlBObJCCNDTuZhD3wEkdetqoL3k8grU+Ep7Oy4GhhHjQ+5xxs7zLgq4ANg7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736178573; c=relaxed/simple;
	bh=vuH9q0IVv6Ln2AO9gtF3eUVpeWyE7eYYcnc2BqNuX9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvABMEpfYfUYXE2l4df6V5Kpk5xEVimJtrz4evc0w5w/onbAE5sBZo57CWpuDdEo+4jSuEPgWPy1Id29KPGc1Vt+wflvF9gYrKoWSSVWS3nE49292Qbp0SodJSY7UoAjHHc3MOhQPGHk85cHV9f4kJal0OHeILrhVXdXfpoU4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AyG4Z4XG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736178570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JkmcIskMaIX394xx5zapBr3r62K7L1VbDRihrUQPSwk=;
	b=AyG4Z4XG7ZNqNitrncDGs8V6xuCnRZKiuc6HYLsNfhEaYqtq5MgKpx1lDbJLCzz051I2rs
	uW41psQWxhISYRmALsFs31ebBJkxuvYwcALIzL5mTXk305j0M8mMyI+xYw/43BzEYOe4ta
	Yx0rhWeH3YNjvpyc/90iMZCNJIsD8mw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-OhrorfexNSmbX7rU_3cfsA-1; Mon, 06 Jan 2025 10:49:28 -0500
X-MC-Unique: OhrorfexNSmbX7rU_3cfsA-1
X-Mimecast-MFC-AGG-ID: OhrorfexNSmbX7rU_3cfsA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aafc90962ffso169261066b.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 07:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178567; x=1736783367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkmcIskMaIX394xx5zapBr3r62K7L1VbDRihrUQPSwk=;
        b=nT9Gkt4ItvbB2gdyPfx57u7JBgE7ra0ijG9qrb5OepTQLyjykalPPB9BembFXainRP
         Yjm2vR+hzFOdOmWK4RcUPkhed0y8U0Jc5HdLwiGCGhwneVaftUL3MNpsYCwnvP50jcAo
         Mj+Kdkmv/RxDU2wIW+gr7QxZaWtxIO91ITqdBYLi6QNob3FLRNjgajYGxRsLukYUwWt+
         w7Kq6oicgikGyXKz8ItJbYFKiD0P4C9dDPvXaHsFF6dZ8+wWNkfoiAqyt5qR1cN6jGqh
         zMG72IyOEisRqclbJYWhNJvhi7sZKTA9evG7Bl3NDO+92hMFZN7VZvfb8M3qxIRlj23z
         3uLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE/9JDAehyUtw8M2LyKHTm0gcwbtYFLkQDmCCeUsUlqnmMMm1R7N5qz5/gKM1SKDYmE5CIwQBMe0ddVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2HXQ8nkCoyKpsOf23lfBNuswO2dwPSrIwGp76dHdFdI9IuAe3
	qzXmzZWaArx4r91ZfZrisRGIfApcnYbPb7sE2iyxDFXJwwNp3UfvvZXFBqDi+8wm/SVCLXKyAC9
	eONtE/cdig7oDJYjPS5irAXHLFNs9Pi20lX1HXGwep4AdeT4I/019e+MPVMph
X-Gm-Gg: ASbGncseMUViZK0DseAe/TD0BFNsanEEOIry7sS5g+YD9HXrfoJZTcyc5wguZZhLscx
	xlJZXEPjUJCv/tUkU/4OjsTvh5m4FSpaAGg5GlXIq1X5KHBOfDJa4ZpiQOg7HR855oD5EXdtq+N
	fDQNHxPhnYoNM7zjOQ+2J2XNBuZAI/3rbg71g19fuhaEOLjrVVsFqL07EqZaPh5tsJ+pkyhAQw6
	PzvcQR5PNPeD8solUM5otzzXMNDmpLORi2EnQFbh4LE88wx0w+rV88qYstax5vBRyaI/SoezEvC
	6g6DE49QECBKPWfDduGMa8d23Ga9m82eKM/5jo7MWs+I573an/HW/l+QmKAgdQItRS+F2zksZ0K
	h9P3uvKbOaOuixkiKftILh89PHT3zlPI=
X-Received: by 2002:a17:907:944f:b0:aac:439:10ce with SMTP id a640c23a62f3a-aac2ba3c11amr6520298866b.27.1736178567409;
        Mon, 06 Jan 2025 07:49:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpZvdpzTfwBXXs/7Af19UhXbY0aZLGAB1s2eaNbIbVvH9C49QNZRteQfPDX/lqziDZfChR0A==
X-Received: by 2002:a17:907:944f:b0:aac:439:10ce with SMTP id a640c23a62f3a-aac2ba3c11amr6520295666b.27.1736178566960;
        Mon, 06 Jan 2025 07:49:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89617bsm2241662466b.76.2025.01.06.07.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 07:49:25 -0800 (PST)
Message-ID: <3f9adbc0-6474-4afd-b2de-d1a87edf047f@redhat.com>
Date: Mon, 6 Jan 2025 16:49:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: uvc: limit max bandwidth for HDMI capture
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20250106140923.56896-1-hdegoede@redhat.com>
 <20250106140923.56896-3-hdegoede@redhat.com>
 <CANiDSCviVQyoaf70KG=uPGJo1jsiHhzmG7XmfBCzCy6YpXr4Fg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCviVQyoaf70KG=uPGJo1jsiHhzmG7XmfBCzCy6YpXr4Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6-Jan-25 3:48 PM, Ricardo Ribalda wrote:
> On Mon, 6 Jan 2025 at 15:09, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>
>> This device:
>>         534d:2109 MacroSilicon
>>
>> Announces that it supports several frame intervals for
>> their resolutions for MJPEG compression:
>>
>>         VideoStreaming Interface Descriptor:
>>         bLength                            46
>>         bDescriptorType                    36
>>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>>         bFrameIndex                         1
>>         bmCapabilities                   0x00
>>           Still image unsupported
>>         wWidth                           1920
>>         wHeight                          1080
>>         dwMinBitRate                   768000
>>         dwMaxBitRate                196608000
>>         dwMaxVideoFrameBufferSize     4147200
>>         dwDefaultFrameInterval         166666
>>         bFrameIntervalType                  5
>>         dwFrameInterval( 0)            166666
>>         dwFrameInterval( 1)            333333
>>         dwFrameInterval( 2)            400000
>>         dwFrameInterval( 3)            500000
>>         dwFrameInterval( 4)           1000000
>>
>> However, the highest frame interval (166666), which means 60 fps
>> is not supported. If set to it, URB packages will be dropped,
>> causing JPEG decoding errors and part of the video frames will
>> be missed.
>>
>> Also, as specified at the device's documentation, for such
>> resolution, the maximum interval is 30 fps (interval == 333333).
>>
>> The last format that supports such frame interval is 1280x720.
>>
>> Add a quirk to estimate a raw bandwidth, by doing:
>>         width * height * framerate
>> E. g.:
>>         1920 * 1080 * 30 = 62208000
>>
>> if the bandwidth is greater than such threshold, get
>> the next value from the dwFrameInterval.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> Link: https://lore.kernel.org/r/bca0634691cea503c2c5df62b98ba66f0c85bf85.1624350539.git.mchehab+huawei@kernel.org
>> [hdegoede@redhat.com add "pixels per second" comment, use UVC_FIVAL_DENOM]
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
>>  drivers/media/usb/uvc/uvc_video.c  | 29 ++++++++++++++++++++++++++---
>>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>>  3 files changed, 41 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index f754640fddf5..6d001d4f0902 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -2491,6 +2491,11 @@ static const struct uvc_device_info uvc_quirk_fix_bandwidth = {
>>         .quirks = UVC_QUIRK_FIX_BANDWIDTH,
>>  };
>>
>> +static const struct uvc_device_info uvc_quirk_fix_bw_622 = {
>> +       .quirks = UVC_QUIRK_FIX_BANDWIDTH,
>> +       .max_bandwidth = 62208000,
>> +};
>> +
>>  static const struct uvc_device_info uvc_quirk_probe_def = {
>>         .quirks = UVC_QUIRK_PROBE_DEF,
>>  };
>> @@ -2794,6 +2799,15 @@ static const struct usb_device_id uvc_ids[] = {
>>           .bInterfaceSubClass   = 1,
>>           .bInterfaceProtocol   = 0,
>>           .driver_info          = (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
>> +       /* MacroSilicon HDMI capture */
>> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
>> +         .idVendor             = 0x534d,
>> +         .idProduct            = 0x2109,
>> +         .bInterfaceClass      = USB_CLASS_VIDEO,
>> +         .bInterfaceSubClass   = 1,
>> +         .bInterfaceProtocol   = 0,
>> +         .driver_info          = (kernel_ulong_t)&uvc_quirk_fix_bw_622 },
>>         /* Genesys Logic USB 2.0 PC Camera */
>>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>> index 41cb1b45fa23..af5233ab667e 100644
>> --- a/drivers/media/usb/uvc/uvc_video.c
>> +++ b/drivers/media/usb/uvc/uvc_video.c
>> @@ -225,9 +225,32 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>>         if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
>>                 ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
>>
>> -       if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
>> -           stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
>> -           stream->intf->num_altsetting > 1) {
>> +       if (!(stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH))
>> +               return;
>> +
>> +       /* Handle UVC_QUIRK_FIX_BANDWIDTH */
>> +
> 
> Shouldn't this quirk be better implemented in uvc_try_frame_interval() ?

This is the place where the other bandwidth checks / UVC_QUIRK_FIX_BANDWIDTH
handling is done, so I guess it makes sense to keep this here.

>> +       if (format->flags & UVC_FMT_FLAG_COMPRESSED) {
>> +               u32 bandwidth;
>> +
>> +               if (!stream->dev->info->max_bandwidth || !frame->bFrameIntervalType)
>> +                       return;
>> +
>> +               for (i = 0; i < frame->bFrameIntervalType; ++i) {
>> +                       bandwidth = frame->wWidth * frame->wHeight;
>> +                       bandwidth *= UVC_FIVAL_DENOM / frame->dwFrameInterval[i];
> 
> frame->dwFrameInterval[i] comes from the device, it is not sanitized.
> We need to make sure it is not zero.

That is a good point, in the non-compressed UVC_QUIRK_FIX_BANDWIDTH handling
this is handled by doing:

			bandwidth *= UVC_FIVAL_DENOM / (frame->dwFrameInterval[i] + 1);

I guess we should do the same here then ?

Regards,

Hans



> 
>> +
>> +                       if (bandwidth <= stream->dev->info->max_bandwidth)
>> +                               break;
>> +               }
>> +
>> +               if (ctrl->dwFrameInterval < frame->dwFrameInterval[i])
>> +                       ctrl->dwFrameInterval = frame->dwFrameInterval[i];
>> +
>> +               return;
>> +       }
>> +
>> +       if (stream->intf->num_altsetting > 1) {
>>                 u32 interval;
>>                 u32 bandwidth;
>>
>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>> index 966ff82c2ba8..6b702219173f 100644
>> --- a/drivers/media/usb/uvc/uvcvideo.h
>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>> @@ -535,6 +535,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
>>
>>  struct uvc_device_info {
>>         u32     quirks;
>> +       u32     max_bandwidth; /* In pixels per second */
>>         u32     meta_format;
>>         u16     uvc_version;
>>  };
>> --
>> 2.47.1
>>
>>
> 
> 


