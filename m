Return-Path: <linux-media+bounces-21392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0685C9C7AD3
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 19:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1404B3209F
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 17:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA09205ABE;
	Wed, 13 Nov 2024 17:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RCOgAmM7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B462038B8
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520643; cv=none; b=sLUoluFyLhc1jRuV80/63RYvefMvrDll0F1Y875WZ19qDC0mBO9SgVNJqcgiCgr6nnQrbXEghyxyYGZW7W4s5vQcNoJLt24NFpJ3gp1ATIepBOt/iLdsgOjMtZan2NFLRhJ6jMN3r8PoLU2ee+h1tVWxdZEvV8bVkPfPzXv/5Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520643; c=relaxed/simple;
	bh=bWNp+nhKHNfXBJ/H1NXhpkIfJa/54tqi7cajg/FN4hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JN+twa9/Tsi1LXtf3pffoysAZAj6xFyfvhB5KYWGXwS5Sv5afM00cxDroaznKPqQ8mfjXKM6Z/bp/j10nA0itVvmCnDleccZ/3DzfKBreMKoTi744fTutCkVXG2I3ai6vcWPAGV1txZ3zjSuoxRFDdjqJry/wy4NK37KDcaYTpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RCOgAmM7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731520640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYHcFHzsHOhUpz2S51Ub1XvP2nN79YNrCvbVuoxCmCQ=;
	b=RCOgAmM7CeFEx1l4O6K/T8isWvrHd7fK8OFa+R5/DsvhbSfD/bKvXhovlc8/e8qmMUNXT6
	Cfe07pmqltPKUjAWSGtVbG6NKuUqMcnMeaaj5gPn4KI3izDWVQmPK/xlHjD+WVSusAv2qF
	GLAi1X8UA6qB+FD2ChxTvrkn53Zi5MU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-Tn40BdE-P7anASNSkaJEHw-1; Wed, 13 Nov 2024 12:57:18 -0500
X-MC-Unique: Tn40BdE-P7anASNSkaJEHw-1
X-Mimecast-MFC-AGG-ID: Tn40BdE-P7anASNSkaJEHw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a2c3e75f0so530327966b.1
        for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 09:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520638; x=1732125438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYHcFHzsHOhUpz2S51Ub1XvP2nN79YNrCvbVuoxCmCQ=;
        b=TUYBf+IELPxOoZzzJbvLZuNoUS44hhCG7Usr0fCUjc32UmicOabq0IXv9h31H5a6qT
         7Ilw2/D9Pf9Y8+7KBGnZfyvVQZJWJOSrTSQT2cBkAI3p4336pcVWyGZGsfGtQSvRIYao
         t3KMKeWKgpx7QE4TjPVPIqGa0eIBv6fn3T/HGzJZh57fSXCVAxWQQHbBoz2ua/M4Xdvf
         3YbamG3CbRzwTNFakf1wu10FDKJcZI8vSYCRNW2yQo+xtIeuNiPTJOMtmzMdfsIswU9E
         Mkw1BhjJzQAVzzw4B36Oa38/mbapgdqVSt0aFLg17s3QLIlcKve5Ceeg/n/Lo4bJmrLv
         LgRg==
X-Forwarded-Encrypted: i=1; AJvYcCXWDfLiiWRdKbc2Nzut1jFlp/JUTigCKXJ5FzQk/oubkq70dqkH+9NW2fWx1OBM8CKVBMQIHdT6VXaDcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkCd5T+Nm65lVF0o/NbnN4BBDbClORQ3KRF+kNmjNuVDnJBUQn
	CrcoeOWRTXoELSFq73bLqEdlfBVZrLGZdHKS35S63eSk0WQhfSZexjJ3rKdW364lCM/olBWBu8B
	QjopC/z2u1abkWbVEJs2FBw/kv8EJw18/S+eC0puVAAN2tJiGHG3PkqiJzzkg
X-Received: by 2002:a17:907:9494:b0:a9a:8042:bbb8 with SMTP id a640c23a62f3a-a9eeffeeeb1mr2091647566b.47.1731520637552;
        Wed, 13 Nov 2024 09:57:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHX8eil+nJ3I3lULtavLJsuySCR8PoQLZPdhNLkUs77QfD8RMSWe/iMtAakHq97Ieijiz5DwA==
X-Received: by 2002:a17:907:9494:b0:a9a:8042:bbb8 with SMTP id a640c23a62f3a-a9eeffeeeb1mr2091645266b.47.1731520637077;
        Wed, 13 Nov 2024 09:57:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0deff4bsm893306866b.162.2024.11.13.09.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 09:57:16 -0800 (PST)
Message-ID: <bd68178f-1de9-491f-8209-f67065d29283@redhat.com>
Date: Wed, 13 Nov 2024 18:57:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] media: uvcvideo: Implement the Privacy GPIO as a
 evdev
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 stable@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 12-Nov-24 6:30 PM, Ricardo Ribalda wrote:
> Some notebooks have a button to disable the camera (not to be mistaken
> with the mechanical cover). This is a standard GPIO linked to the
> camera via the ACPI table.
> 
> 4 years ago we added support for this button in UVC via the Privacy control.
> This has three issues:
> - If the camera has its own privacy control, it will be masked.
> - We need to power-up the camera to read the privacy control gpio.
> - Other drivers have not followed this approach and have used evdev.
> 
> We tried to fix the power-up issues implementing "granular power
> saving" but it has been more complicated than anticipated...
> 
> This patchset implements the Privacy GPIO as a evdev.
> 
> The first patch of this set is already in Laurent's tree... but I
> include it to get some CI coverage.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v3:
> - CodeStyle (Thanks Sakari)
> - Re-implement as input device

Thank you for your enthusiasm for my suggestion to implement this
as an input device.

As I mentioned in my reply in the v2 thread, the goal of my
enumeration of various way camera privacy-controls are exposed to
userspace today is to try and get everyone to agree on a single
userspace API for this.

Except for this v3 patch-set, which I take as an implied vote
from you (Ricardo) for the evdev SW_CAMERA_LENS_COVER approach,
we have not heard anything on this subject from Sakari or Laurent
yet. So for now I would like to first focus on / circle back to
the userspace API discussion and then once we have a plan for
the userspace API we can implement that for uvcvideo.

First lets look at the API question top down, iow what use-cases
do we expect there to be for information about the camera-privacy
switch state:

a) Having an app which is using (trying to use) the camera show
a notification to the user that the camera is turned-off by
a privacy switch.

Ricardo, AFAICT this is the main use-case for chrome-os, do I have
this right ?

b) Showing on on-screen-display (OSD) with a camera /
crossed-out-camera icon when the switch is toggled, similar to how
muting speakers/mic show an OSD. Laptop vendor Windows add-on
software does this and I know that some users have been asking
for this.

Then lets look at the question bottom-up which hardware interfaces
do we have exposing this information:

1. Internal UVC camera with an input privacy GPIO resource in
the ACPI fwnode for the UVC camera, with the GPIO reporting
the privacy-switch state. Found on some chrome-books

2. Laptop firmware (EC/ACPI/WMI) which reports privacy-switch
state, without a clear 1:1 relation between the reported state and
which camera it applies to. In this case sometimes the whole UVC
camera module (if it is UVC) is simply dropped of the bus when
the camera is disabled through the privacy switch, removing
the entire /dev/video# node for the camera. Found on many windows
laptops.

3. UVC cameras which report privacy-switch status through
a UVC_CT_PRIVACY_CONTROL. Found on ... ?

Note this will only work while the camera is streaming and
even then may require polling of the ctrl because not all
cameras reliably send UVC status messages when it changes.
This renders this hardware interface as not usable 


Currently there are 2 ways this info is being communicated
to userspace, hw-interfaces 1. + 3. are exposed as a v4l2
privacy-ctrl where as hw-if 2. uses and input evdev device.

The advantage of the v4l2 privacy-ctrl is that it makes it
very clear which camera is controlled by the camera
privacy-switch.

The disadvantage is that it will not work for hw-if 2,
because the ACPI / WMI drivers have no v4l2 device to report
the control on. We could try to add some magic glue code,
but even then with e.g. IPU6 cameras it would still be
unclear which v4l2(sub)device we should put the control on
and if a UVC camera is just dropped from the bus there is
no /dev/video# device at all.

Using an input device does not has this disadvantage and
it has the advantage of not requiring to power-up the camera
as currently happens with a v4l2 ctrl on a UVC camera.

But using an input device makes it harder to determine
which camera the privacy-switch applies to. We can specify
that SW_CAMERA_LENS_COVER only applies to device internal
cameras, but then it is up to userspace to determine which
cameras that are.

Another problem with using an input device is that it will
not work for "UVC cameras which report privacy-switch status
through a UVC_CT_PRIVACY_CONTROL." since those need the camera
on and even then need to be polled to get a reliable reading.

Taking this all into account my proposal would be to go
with an input device and document that SW_CAMERA_LENS_COVER
only applies to device internal cameras.

This should work well for both use-cases a) and b) described
above and also be easy to support for both hw interfaces
1. and 2.

My proposal for hw-if 3. (UVC_CT_PRIVACY_CONTROL) would be
to keep reporting this as V4L2_CID_PRIVACY. This means it
will not work out of the box for userspace which expects
the input device method, but giving the limitations of
this hw interface I think that requiring userspace to have
to explicitly support this use-case (and e.g. poll the
control) is a good thing rather then a bad thing.

Still before moving forward with switching the hw-if 1.
case to an input device as this patch-series does I would
like to hear input from others.

Sakari, Laurent, any comments ?

Regards,

Hans















> - Make the code depend on UVC_INPUT_EVDEV
> - Link to v2: https://lore.kernel.org/r/20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org
> 
> Changes in v2:
> - Rebase on top of https://patchwork.linuxtv.org/project/linux-media/patch/20241106-uvc-crashrmmod-v6-1-fbf9781c6e83@chromium.org/
> - Create uvc_gpio_cleanup and uvc_gpio_deinit
> - Refactor quirk: do not disable irq
> - Change define number for MEDIA_ENT_F_GPIO
> - Link to v1: https://lore.kernel.org/r/20241031-uvc-subdev-v1-0-a68331cedd72@chromium.org
> 
> ---
> Ricardo Ribalda (8):
>       media: uvcvideo: Fix crash during unbind if gpio unit is in use
>       media: uvcvideo: Factor out gpio functions to its own file
>       media: uvcvideo: Re-implement privacy GPIO as an input device
>       Revert "media: uvcvideo: Allow entity-defined get_info and get_cur"
>       media: uvcvideo: Create ancillary link for GPIO subdevice
>       media: v4l2-core: Add new MEDIA_ENT_F_GPIO
>       media: uvcvideo: Use MEDIA_ENT_F_GPIO for the GPIO entity
>       media: uvcvideo: Introduce UVC_QUIRK_PRIVACY_DURING_STREAM
> 
>  .../userspace-api/media/mediactl/media-types.rst   |   4 +
>  drivers/media/usb/uvc/Kconfig                      |   2 +-
>  drivers/media/usb/uvc/Makefile                     |   3 +
>  drivers/media/usb/uvc/uvc_ctrl.c                   |  40 +-----
>  drivers/media/usb/uvc/uvc_driver.c                 | 112 +---------------
>  drivers/media/usb/uvc/uvc_entity.c                 |  21 ++-
>  drivers/media/usb/uvc/uvc_gpio.c                   | 144 +++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_status.c                 |  13 +-
>  drivers/media/usb/uvc/uvc_video.c                  |   4 +
>  drivers/media/usb/uvc/uvcvideo.h                   |  31 +++--
>  drivers/media/v4l2-core/v4l2-async.c               |   3 +-
>  include/uapi/linux/media.h                         |   1 +
>  12 files changed, 223 insertions(+), 155 deletions(-)
> ---
> base-commit: 1b3bb4d69f20be5931abc18a6dbc24ff687fa780
> change-id: 20241030-uvc-subdev-89f4467a00b5
> 
> Best regards,


