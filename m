Return-Path: <linux-media+bounces-27357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD611A4C5DD
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B302818924FB
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9490B214A79;
	Mon,  3 Mar 2025 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dfT13uC3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B52C181
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017417; cv=none; b=FNRjnXHbiCSii9qQAySNJfxnbqwMIxjWpQH9T56JEygZyVM082EKkVOHeLCa1tRB4h22wNgTYRe0j7Ta+/l1Bf4YDzkpaGX6C6d3ZOVVgclL0AuRDpo5gcCY8I5DaSArncjwjGoya0uVSeQjNUpMv4Pp2DwMoJZLK3YrbCTylIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017417; c=relaxed/simple;
	bh=9qmtvFryEe/ChfH0AvxH1kt0jg9xeu0JTLgLhy2M7IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmOzeZ6UIe0m9ZgZib8EAf7pce+IGO/EsZKOEMmfg0r0UtP42OjVUkzyCs4C8Y/87+rz9WosttOZr4y9CNXLTC6nrOj8LonmfGUbe4ATMWZtv9Z5OTgrOpi9O3WvWLMqvgkGWtjb3uTDxdbpEIZF65s4DYFj2xJb8sfO9p60fGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dfT13uC3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54957f0c657so3001795e87.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 07:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741017413; x=1741622213; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YGCynV2yWUEC6QIoDPAZAo2E73n5HQeexWCm9jKiqQw=;
        b=dfT13uC31ng9VuGBtfGkKOHOYyPvlO5nJRZKMNgdMypV5Rh7IQapxPbFYCbVy0zcMy
         5gd0gqLhRf9kzKZnrbhwRFOB5tmd+iCn9Wvrz3p1/NTwKmUJaRyboJzokhQCCESfYkyi
         MHiKb6gTBOaFgag9YzeE/U6U6DbTfMN8jXh24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017413; x=1741622213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGCynV2yWUEC6QIoDPAZAo2E73n5HQeexWCm9jKiqQw=;
        b=vX2J9sqtTTurPEcKxv/EiDf0kbN10C7cYD7HYe6+Zu9dWaTCwVJNY7/f9DEtHykOLP
         6zB3Ar5V0W/tNrSOgs1966ag/c6bZ4g+2aQmcLb/wkgTU/5GGKyg5EIa1jyiGavb/flt
         19RddNnanjdv9lqksIKNLqDI872cAwpFvbeyS+NCA3irgU7ow4DKDnASuVbGUZFIa4uk
         PI/NLETlm4oJNl4pt3Hmk6E5mpu6V7DI549iib/j2QHcrOtmpyVOQHQGVYwIH60V0QAC
         LEs9FBje5t8EaQXbsm+wOgaz5akTiMYYPs4DvPINXlv3wN7BkGRT3TItsN/xM/fCjsok
         ziTg==
X-Forwarded-Encrypted: i=1; AJvYcCUQUbnslm07VkM58JqUT+Zp8OcAUwe42598/ni6PPnNYwrYHsjRgNquPh0JNh2BtpTfxmmC59pzGMXFsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwPHRK9RvVv+dL4+Eo6WP5b9h51JPZU1lR5PQWHzdFsXA6crWP
	NeO0Q/7+/IcODxiiduXe7M5b6RiYIDW5xOO+1dwSt+iYKQQubZJRopENK3zhNh97MdwNJDb5FxU
	=
X-Gm-Gg: ASbGnctZnJUm0Bwuiqlj88uhfuXC53n2ivSedaEhWAPelv5WCaEKfSwM0bzcpC5q2YY
	kHT8WidmHZP9ntsa4Uu8JnpMW+Wy6qUjQTTSgN57zxWB3e5hhINmUm4v89+RbTztFerHyKzXNT/
	7H0PfHiLQVz0BOSutmsQQdUY3XQkZxiV3wNdchyKrm995xgugqWY73uZK88bsrAM9fLrlgJwFXs
	K8jYT0XS5hz64NGW9ssaH3BvKyW3eCFk9QdCPd9ZyoiA9LiSVAdp03ucFJkkiIQKJnYR7IHe2Ap
	o2IR5LolEUi1WXN4yR5KaAra8NzFuxiZnVCj67emXSaaea/XpTMULc6iQD96JFv89G20fSeTpWV
	smGzbZgM=
X-Google-Smtp-Source: AGHT+IFrxEqI0D/0nsqXZwaFspp/viKx+1enDbPO1CKVP1tN//EMKsXRCo0fN0Z48X+jC83OfVLUTw==
X-Received: by 2002:a05:6512:12cf:b0:545:dc8:9376 with SMTP id 2adb3069b0e04-549432ccaefmr5604283e87.5.1741017412444;
        Mon, 03 Mar 2025 07:56:52 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54958dcdce6sm802507e87.13.2025.03.03.07.56.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 07:56:52 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5439a6179a7so4754940e87.1
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 07:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUr6xqTc0t/gLyR7VE2I3UgwyilYp59yE5fDV5K8BhQwvJ3fZEwydb5LOrz50Q3ZngFmOQ2bdj50p0+Jg==@vger.kernel.org
X-Received: by 2002:a05:6512:3083:b0:549:6ae7:e679 with SMTP id
 2adb3069b0e04-5496ae7e8a0mr1635835e87.3.1741017411440; Mon, 03 Mar 2025
 07:56:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org>
 <c6ab8640-d96c-4a71-929a-a4ad6bb2647d@redhat.com> <20250303151346.GC32048@pendragon.ideasonboard.com>
 <1436dc95-68a6-456d-ab5d-117c7791ec48@redhat.com>
In-Reply-To: <1436dc95-68a6-456d-ab5d-117c7791ec48@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 3 Mar 2025 16:56:37 +0100
X-Gmail-Original-Message-ID: <CANiDSCtTeNhJ3u7hkmSgcUmKp+N5ThsAkSo2_JOz9QWALi=RTg@mail.gmail.com>
X-Gm-Features: AQ5f1JpxtSVd51UXd0agw5Uq4bRc8DMlReSJ_fhm3xRHEfQ7pu0K2rYHPmWz858
Message-ID: <CANiDSCtTeNhJ3u7hkmSgcUmKp+N5ThsAkSo2_JOz9QWALi=RTg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Enable full UVC metadata for all devices
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, 3 Mar 2025 at 16:44, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 3-Mar-25 16:13, Laurent Pinchart wrote:
> > On Mon, Mar 03, 2025 at 03:47:51PM +0100, Hans de Goede wrote:
> >> On 26-Feb-25 14:00, Ricardo Ribalda wrote:
> >>> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> >>> V4L2_META_FMT_D4XX. The only difference between the two of them is that
> >>> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> >>> V4L2_META_FMT_D4XX copies the whole metadata section.
> >>>
> >>> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> >>> devices, but it is useful for any device where vendors include other
> >>> metadata, such as the one described by Microsoft:
> >>> - https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> >>>
> >>> This patch removes the UVC_INFO_META macro and enables
> >>> V4L2_META_FMT_D4XX for every device. It also updates the documentation
> >>> to reflect the change.
> >>>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>
> >> Thanks, patch looks good to me:
> >>
> >> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >
> > I don't quite agree, sorry.
> >
> > The reason why the current mechanism has been implemented this way is to
> > ensure we have documentation for the metadata format of devices that
> > expose metadata to userspace.
> >
> > If you want to expose the MS metadata, you can create a new metadata
> > format for that, and enable it on devices that implement it.
>
> Looking at the long list of quirks this removes just for the D4xx
> cameras I do not believe that having quirked based relaying of
> which metadata fmt is used to userspace is something which scales
> on the long term. Given the large amount of different UVC cameras
> I really think we should move the USB VID:PID -> metadata format
> mapping out of the kernel.

+1000 to this. ChromeOS alone, this will be 200+ quirks per year.

>
> I do agree that using V4L2_META_FMT_D4XX for every device is
> probably not the best idea. So my suggestion would be to add
> a new V4L2_META_FMT_CUSTOM metadata fmt and for index 1
> metadata fmt use V4L2_META_FMT_D4XX for the currently quirked
> cams and use V4L2_META_FMT_CUSTOM for other cameras.

That works for me. What I wanted to avoid was to add a new metadata
format that is identical to V4L2_META_FMT_D4XX.

V4L2_META_FMT_D4XX is just Microsoft metadata id 0x80000000


>
> This can then be combined with a udev-rule + hwdb to provide
> info of what V4L2_META_FMT_CUSTOM should be mapped to in userspace,
> moving further VID:PID -> extended-metadata fmt mappings out of
> the kernel.

I am not aware of cameras implementing other metadata types different
to Microsoft's.
The rule is basically going to be *:* -> Microsoft Metadata.

But yeah, having a way to support weird cameras is always good :)

>
> Regards,
>
> Hans
>
>
>
> >
> >>> ---
> >>>  .../userspace-api/media/v4l/metafmt-d4xx.rst       | 19 +++--
> >>>  .../userspace-api/media/v4l/metafmt-uvc.rst        |  6 +-
> >>>  drivers/media/usb/uvc/uvc_driver.c                 | 83 ----------------------
> >>>  drivers/media/usb/uvc/uvc_metadata.c               | 15 ++--
> >>>  drivers/media/usb/uvc/uvcvideo.h                   |  1 -
> >>>  5 files changed, 23 insertions(+), 101 deletions(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> >>> index 0686413b16b2..1b18ef056934 100644
> >>> --- a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> >>> @@ -6,12 +6,23 @@
> >>>  V4L2_META_FMT_D4XX ('D4XX')
> >>>  *******************************
> >>>
> >>> -Intel D4xx UVC Cameras Metadata
> >>> +UVC Full Payload Header Data (formerly known as Intel D4xx UVC Cameras
> >>> +Metadata).
> >>>
> >>>
> >>>  Description
> >>>  ===========
> >>>
> >>> +V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
> >>> +V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
> >>> +payload header data. It was originally implemented for Intel D4xx cameras, and
> >>> +thus the name, but now it can be used by any UVC device, when userspace wants
> >>> +full access to the UVC Metadata.
> >>> +
> >>> +
> >>> +Intel D4xx Metadata
> >>> +===================
> >>> +
> >>>  Intel D4xx (D435, D455 and others) cameras include per-frame metadata in their UVC
> >>>  payload headers, following the Microsoft(R) UVC extension proposal [1_]. That
> >>>  means, that the private D4XX metadata, following the standard UVC header, is
> >>> @@ -21,10 +32,8 @@ types are MetadataId_CaptureStats (ID 3), MetadataId_CameraExtrinsics (ID 4),
> >>>  and MetadataId_CameraIntrinsics (ID 5). For their description see [1_]. This
> >>>  document describes proprietary metadata types, used by D4xx cameras.
> >>>
> >>> -V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
> >>> -V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
> >>> -payload header data. D4xx cameras use bulk transfers and only send one payload
> >>> -per frame, therefore their headers cannot be larger than 255 bytes.
> >>> +D4xx cameras use bulk transfers and only send one payload per frame, therefore
> >>> +their headers cannot be larger than 255 bytes.
> >>>
> >>>  This document implements Intel Configuration version 3 [9_].
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >>> index 784346d14bbd..a3aae580e89e 100644
> >>> --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >>> @@ -6,7 +6,7 @@
> >>>  V4L2_META_FMT_UVC ('UVCH')
> >>>  *******************************
> >>>
> >>> -UVC Payload Header Data
> >>> +UVC Partial Payload Header Data (formerly known as UVC Payload Header Data).
> >>>
> >>>
> >>>  Description
> >>> @@ -44,7 +44,9 @@ Each individual block contains the following fields:
> >>>          them
> >>>      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
> >>>      * - __u8 length;
> >>> -      - length of the rest of the block, including this field
> >>> +      - length of the rest of the block, including this field (please note that
> >>> +        regardless of this value, the driver will never copy more than 12
> >>> +        bytes).
> >>>      * - __u8 flags;
> >>>        - Flags, indicating presence of other standard UVC fields
> >>>      * - __u8 buf[];
> >>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >>> index deadbcea5e22..f19dcd4a7ac6 100644
> >>> --- a/drivers/media/usb/uvc/uvc_driver.c
> >>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >>> @@ -2488,8 +2488,6 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
> >>>  };
> >>>
> >>>  #define UVC_INFO_QUIRK(q) (kernel_ulong_t)&(struct uvc_device_info){.quirks = q}
> >>> -#define UVC_INFO_META(m) (kernel_ulong_t)&(struct uvc_device_info) \
> >>> -   {.meta_format = m}
> >>>
> >>>  /*
> >>>   * The Logitech cameras listed below have their interface class set to
> >>> @@ -3107,87 +3105,6 @@ static const struct usb_device_id uvc_ids[] = {
> >>>       .bInterfaceSubClass   = 1,
> >>>       .bInterfaceProtocol   = 0,
> >>>       .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> >>> -   /* Intel D410/ASR depth camera */
> >>> -   { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>> -                           | USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -     .idVendor             = 0x8086,
> >>> -     .idProduct            = 0x0ad2,
> >>> -     .bInterfaceClass      = USB_CLASS_VIDEO,
> >>> -     .bInterfaceSubClass   = 1,
> >>> -     .bInterfaceProtocol   = 0,
> >>> -     .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -   /* Intel D415/ASRC depth camera */
> >>> -   { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>> -                           | USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -     .idVendor             = 0x8086,
> >>> -     .idProduct            = 0x0ad3,
> >>> -     .bInterfaceClass      = USB_CLASS_VIDEO,
> >>> -     .bInterfaceSubClass   = 1,
> >>> -     .bInterfaceProtocol   = 0,
> >>> -     .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -   /* Intel D430/AWG depth camera */
> >>> -   { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>> -                           | USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -     .idVendor             = 0x8086,
> >>> -     .idProduct            = 0x0ad4,
> >>> -     .bInterfaceClass      = USB_CLASS_VIDEO,
> >>> -     .bInterfaceSubClass   = 1,
> >>> -     .bInterfaceProtocol   = 0,
> >>> -     .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -   /* Intel RealSense D4M */
> >>> -   { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>> -                           | USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -     .idVendor             = 0x8086,
> >>> -     .idProduct            = 0x0b03,
> >>> -     .bInterfaceClass      = USB_CLASS_VIDEO,
> >>> -     .bInterfaceSubClass   = 1,
> >>> -     .bInterfaceProtocol   = 0,
> >>> -     .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -   /* Intel D435/AWGC depth camera */
> >>> -   { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>> -                           | USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -     .idVendor             = 0x8086,
> >>> -     .idProduct            = 0x0b07,
> >>> -     .bInterfaceClass      = USB_CLASS_VIDEO,
> >>> -     .bInterfaceSubClass   = 1,
> >>> -     .bInterfaceProtocol   = 0,
> >>> -     .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -   /* Intel D435i depth camera */
> >>> -   { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>> -                           | USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -     .idVendor             = 0x8086,
> >>> -     .idProduct            = 0x0b3a,
> >>> -     .bInterfaceClass      = USB_CLASS_VIDEO,
> >>> -     .bInterfaceSubClass   = 1,
> >>> -     .bInterfaceProtocol   = 0,
> >>> -     .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -   /* Intel D405 Depth Camera */
> >>> -   { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>> -                           | USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -     .idVendor             = 0x8086,
> >>> -     .idProduct            = 0x0b5b,
> >>> -     .bInterfaceClass      = USB_CLASS_VIDEO,
> >>> -     .bInterfaceSubClass   = 1,
> >>> -     .bInterfaceProtocol   = 0,
> >>> -     .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -   /* Intel D455 Depth Camera */
> >>> -   { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>> -                           | USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -     .idVendor             = 0x8086,
> >>> -     .idProduct            = 0x0b5c,
> >>> -     .bInterfaceClass      = USB_CLASS_VIDEO,
> >>> -     .bInterfaceSubClass   = 1,
> >>> -     .bInterfaceProtocol   = 0,
> >>> -     .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -   /* Intel D421 Depth Module */
> >>> -   { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>> -                           | USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -     .idVendor             = 0x8086,
> >>> -     .idProduct            = 0x1155,
> >>> -     .bInterfaceClass      = USB_CLASS_VIDEO,
> >>> -     .bInterfaceSubClass   = 1,
> >>> -     .bInterfaceProtocol   = 0,
> >>> -     .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>>     /* Generic USB Video Class */
> >>>     { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
> >>>     { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> >>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> >>> index 82de7781f5b6..5c44e6cdb83c 100644
> >>> --- a/drivers/media/usb/uvc/uvc_metadata.c
> >>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> >>> @@ -60,18 +60,16 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
> >>>                                 struct v4l2_format *format)
> >>>  {
> >>>     struct v4l2_fh *vfh = file->private_data;
> >>> -   struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
> >>> -   struct uvc_device *dev = stream->dev;
> >>>     struct v4l2_meta_format *fmt = &format->fmt.meta;
> >>> -   u32 fmeta = fmt->dataformat;
> >>> +   u32 fmeta = fmt->dataformat == V4L2_META_FMT_D4XX ?
> >>> +               V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
> >>>
> >>>     if (format->type != vfh->vdev->queue->type)
> >>>             return -EINVAL;
> >>>
> >>>     memset(fmt, 0, sizeof(*fmt));
> >>>
> >>> -   fmt->dataformat = fmeta == dev->info->meta_format
> >>> -                   ? fmeta : V4L2_META_FMT_UVC;
> >>> +   fmt->dataformat = fmeta;
> >>>     fmt->buffersize = UVC_METADATA_BUF_SIZE;
> >>>
> >>>     return 0;
> >>> @@ -110,19 +108,16 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
> >>>                                   struct v4l2_fmtdesc *fdesc)
> >>>  {
> >>>     struct v4l2_fh *vfh = file->private_data;
> >>> -   struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
> >>> -   struct uvc_device *dev = stream->dev;
> >>>     u32 index = fdesc->index;
> >>>
> >>> -   if (fdesc->type != vfh->vdev->queue->type ||
> >>> -       index > 1U || (index && !dev->info->meta_format))
> >>> +   if (fdesc->type != vfh->vdev->queue->type || index > 1U)
> >>>             return -EINVAL;
> >>>
> >>>     memset(fdesc, 0, sizeof(*fdesc));
> >>>
> >>>     fdesc->type = vfh->vdev->queue->type;
> >>>     fdesc->index = index;
> >>> -   fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
> >>> +   fdesc->pixelformat = index ? V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
> >>>
> >>>     return 0;
> >>>  }
> >>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >>> index 5e388f05f3fc..cc2092ae9987 100644
> >>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>> @@ -534,7 +534,6 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
> >>>
> >>>  struct uvc_device_info {
> >>>     u32     quirks;
> >>> -   u32     meta_format;
> >>>     u16     uvc_version;
> >>>  };
> >>>
> >>>
> >>> ---
> >>> base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
> >>> change-id: 20250226-uvc-metadata-2e7e445966de
> >
>


-- 
Ricardo Ribalda

