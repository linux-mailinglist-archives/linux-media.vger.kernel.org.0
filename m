Return-Path: <linux-media+bounces-28556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A39A5A6B7EF
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 10:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C89621899F13
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 09:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D0C1F151A;
	Fri, 21 Mar 2025 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="myS5bosg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E2A35947
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742550250; cv=none; b=LDS4wIcbYKucdSWnUBSbUaLJDUFBNaI0/DggMZ+n7/3xOrYlUKnD7wM/OBI9VCEO7p4+u6Md6GgY/BQ50Vb48NfcpQFs4gx0KUHxMrgJO5MnFdXtMdIURJh/gNhi8OVMbsTQ/0ixiSrmEaZezhgdzNWndOjV0wnYcOpcfHVDQiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742550250; c=relaxed/simple;
	bh=ATigMA0a/MlF8JyYwM1f7DKgjphs05xuS1/j4qKoTcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3Uj0rmOA5Kw7T5fuErj3Sq7ZF12ULrab+xIeKY8Wyl768ykcIODurkwFLrrYuqYFow9ZNkZqXw0XhVOa1zOmld6/6q6/bKHuyQXwmpxoBmWtfx3bUAVOqfzxobW2wB1AeafpM8nJxruNpLRTQY9KULDw6wn7xfdHmyBpZBU088=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=myS5bosg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549644ae382so2268327e87.1
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 02:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742550247; x=1743155047; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7KzR4/KTCc1hHx0bVWFwybI1sqREbxFze/GsdIhnkQs=;
        b=myS5bosgWwvE+svIBBVlPtAd+qH3osr+uWMKOuK+/UKSf70+37mHA/VGJc8EFbihyi
         vq1VO4pGsHQ8FLueR+2pPfFaxf9/JLodKjQZozQMnHfnhZRLiPJlbl7+0MVNOJ1TYikj
         2horRS2MIV1olCL/TRDNwu5dwdESsXfhSDuUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550247; x=1743155047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KzR4/KTCc1hHx0bVWFwybI1sqREbxFze/GsdIhnkQs=;
        b=X2PKkF2GAmx4KnocxvrnYFVg/W5uDRprN7/2ySL4jUm44FT9EzOBTO26VjktTITnyg
         xSrIV1lFLYM0l27NfWQe1zC9AyVMZu/ZMncTSGBiJ3H/nnyJord+0fe0NtF9HneubLJM
         0158PrsGy+3/H+Ts/diZh5vFyZcjVbily1q4M4PeEcENHtVkSHW3yhYxRp16i9TBRqA5
         6eYWeUs30fXqqrFJgHy2CGALA2u4UYf9Uo59DT9NuCADKDKvqiL5bjEuOi6FmyJrNGEO
         5oY9ulAWCLDba17I54K0W5PO5vp3uoo+qrq7NF1l40e8z63YmbAznUIRAPZRrdyZqv+r
         LRMw==
X-Forwarded-Encrypted: i=1; AJvYcCWOhloffYLjtBrUa96o726T93lrMdknOX7A2VHO7SEpeASp1jwsycEGF+UEzptjWfOsTmXAuqXpq404Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbhaamCZ0eQwRejDe56cDSIZkImLQL7JjpW7euM/50HufVdqg
	KInjwWfo+oU6+uEvbVpNOS1fbMzrhSpZHwimMgcc2YlQYFmVSu5c/cHRZr27ByhiUYO0qQ+Rfjo
	=
X-Gm-Gg: ASbGncsitGY9XvC8RjHNnZrj8Ke3ODIlndg4Qr3BJyklGx1NXQeK7/VmP7p564WYiLU
	62x6bg0+YQdczINrCX+QgMyZ8OdKlrAOaDiIsWFT8m7aP8rOjBS15sDkYIpreYKki8Gmecz3eQW
	THefAuGLaZ3zusqhqQSk90i/8nx+bQODgiF1fmp+orhjqECojlhE5Vj05xt/tigQFQiASm6l0rE
	jo8t4MpNbDe2rYUGIT8BEjgjILExiJdxj0k/0AUo1fM1NpPETtvXDV/Sdn+jaTWHu2IyLjcF802
	iQA4XKSLezh+uKnbuDoBVEZcPPiJU87JFsvmL7+ReZfvW6hkSI7Cw5mqslPwNe4YOhH8jk8b9tt
	UPAbLv1RLQQ4=
X-Google-Smtp-Source: AGHT+IEdN2SCx17WILp4eEAjZX/CWXoUp4VyAJbrYxRlTDRrFg14rzTkFvS1P00jf0P01kdpAuEYXw==
X-Received: by 2002:a05:6512:ea5:b0:545:ee3:f3c5 with SMTP id 2adb3069b0e04-54ad6484e57mr931898e87.17.1742550246370;
        Fri, 21 Mar 2025 02:44:06 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6511672sm146068e87.219.2025.03.21.02.44.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 02:44:05 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bf8f5dde5so16185491fa.2
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 02:44:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdfTMkM4HvdeNt22EgM9SgdcNyjR8FnD/d4GBwWy10DXh9vAIk1eIa7V4/ewVMXo42kIt+QY9aW4DHNQ==@vger.kernel.org
X-Received: by 2002:a2e:a7ca:0:b0:30b:feb4:ed4 with SMTP id
 38308e7fff4ca-30d7e2ba516mr9130741fa.31.1742550244669; Fri, 21 Mar 2025
 02:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321014904.129768-1-ccc194101@163.com>
In-Reply-To: <20250321014904.129768-1-ccc194101@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 21 Mar 2025 10:43:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCs9p=JkGs8w8_n8oPkYg5J3rQFF2RT1bbdme_sNKuzwmg@mail.gmail.com>
X-Gm-Features: AQ5f1JonmDYWYcHzcO8vXYDfya0NXyjJ0hXUe4izsg4TP3Bz07BroK5N3AChmWk
Message-ID: <CANiDSCs9p=JkGs8w8_n8oPkYg5J3rQFF2RT1bbdme_sNKuzwmg@mail.gmail.com>
Subject: Re: [PATCH v5] media: uvcvideo: Fix bandwidth issue for Alcor camera
To: chenchangcheng <ccc194101@163.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chenchangcheng <chenchangcheng@kylinos.cn>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Chenchangcheng

On Fri, 21 Mar 2025 at 02:51, chenchangcheng <ccc194101@163.com> wrote:
>
> From: chenchangcheng <chenchangcheng@kylinos.cn>
>
> Some broken device return wrong dwMaxPayloadTransferSize fields,
> as follows:
> [  218.211425] [pid:20391,cpu4,guvcview,3]uvcvideo: Trying format 0x47504a4d (MJPG): 640x480.
> [  218.211425] [pid:20391,cpu4,guvcview,4]uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> [  218.252532] [pid:20391,cpu4,guvcview,1]uvcvideo: Trying format 0x47504a4d (MJPG): 640x480.
> [  218.252532] [pid:20391,cpu4,guvcview,2]uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> [  218.293426] [pid:20391,cpu7,guvcview,8]videobuf2_common: __setup_offsets: buffer 0, plane 0 offset 0x00000000
> [  218.294067] [pid:20391,cpu7,guvcview,9]videobuf2_common: __setup_offsets: buffer 1, plane 0 offset 0x000e1000
> [  218.294433] [pid:20391,cpu7,guvcview,0]videobuf2_common: __setup_offsets: buffer 2, plane 0 offset 0x001c2000
> [  218.294677] [pid:20391,cpu7,guvcview,1]videobuf2_common: __setup_offsets: buffer 3, plane 0 offset 0x002a3000
> [  218.294677] [pid:20391,cpu7,guvcview,2]videobuf2_common: __vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
> [  218.294738] [pid:20391,cpu7,guvcview,3]uvcvideo: uvc_v4l2_mmap
> [  218.294799] [pid:20391,cpu7,guvcview,4]videobuf2_common: vb2_mmap: buffer 0, plane 0 successfully mapped
> [  218.294799] [pid:20391,cpu7,guvcview,5]uvcvideo: uvc_v4l2_mmap
> [  218.294830] [pid:20391,cpu7,guvcview,6]videobuf2_common: vb2_mmap: buffer 1, plane 0 successfully mapped
> [  218.294830] [pid:20391,cpu7,guvcview,7]uvcvideo: uvc_v4l2_mmap
> [  218.294830] [pid:20391,cpu7,guvcview,8]videobuf2_common: vb2_mmap: buffer 2, plane 0 successfully mapped
> [  218.294860] [pid:20391,cpu7,guvcview,9]uvcvideo: uvc_v4l2_mmap
> [  218.294860] [pid:20391,cpu7,guvcview,0]videobuf2_common: vb2_mmap: buffer 3, plane 0 successfully mapped
> [  218.294860] [pid:20391,cpu7,guvcview,1]videobuf2_common: vb2_core_qbuf: qbuf of buffer 0 succeeded
> [  218.294891] [pid:20391,cpu7,guvcview,2]videobuf2_common: vb2_core_qbuf: qbuf of buffer 1 succeeded
> [  218.294891] [pid:20391,cpu7,guvcview,3]videobuf2_common: vb2_core_qbuf: qbuf of buffer 2 succeeded
> [  218.294891] [pid:20391,cpu7,guvcview,4]videobuf2_common: vb2_core_qbuf: qbuf of buffer 3 succeeded
> [  218.294891] [pid:20391,cpu7,guvcview,5]uvcvideo: Setting frame interval to 1/25 (400000).
> [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
> [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
You can copy the whole log messages in the cover letter. I think the
commit message should only contain:

uvcvideo: Device requested 2752512 B/frame bandwidth.
uvcvideo: No fast enough alt setting for requested bandwidth.

Please also add the out of lsusb -v -d 1b17:6684 to the cover letter



>
> The maximum packet size of the device is 3 * 1024, according to the
> logs above, the device needs to apply for a bandwidth of 0x2a0000.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503191330.AveQs7tb-lkp@intel.com/
The code has not landed, please remove the previous two lines.


> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
> ---
>  drivers/media/usb/uvc/uvc_driver.c |  9 ++++
>  drivers/media/usb/uvc/uvc_video.c  | 82 +++++++++++++++++-------------
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 58 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index deadbcea5e22..6d739c3cc88f 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3188,6 +3188,15 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Alcor Corp. Slave camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x1b17,
> +         .idProduct            = 0x6684,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_OVERFLOW_BANDWIDTH) },

The quirks are ordered by vid:pid. Please move this element to its
correct position

>         /* Generic USB Video Class */
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..7af77bf1be9b 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -226,41 +226,55 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>         if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
>                 ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
>
> -       if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> -           stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
> -           stream->intf->num_altsetting > 1) {
> -               u32 interval;
> -               u32 bandwidth;
> -
> -               interval = (ctrl->dwFrameInterval > 100000)
> -                        ? ctrl->dwFrameInterval
> -                        : frame->dwFrameInterval[0];
> -
> -               /*
> -                * Compute a bandwidth estimation by multiplying the frame
> -                * size by the number of video frames per second, divide the
> -                * result by the number of USB frames (or micro-frames for
> -                * high- and super-speed devices) per second and add the UVC
> -                * header size (assumed to be 12 bytes long).
> -                */
> -               bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
> -               bandwidth *= 10000000 / interval + 1;
> -               bandwidth /= 1000;
> -               if (stream->dev->udev->speed >= USB_SPEED_HIGH)
> -                       bandwidth /= 8;
> -               bandwidth += 12;
> -
> -               /*
> -                * The bandwidth estimate is too low for many cameras. Don't use
> -                * maximum packet sizes lower than 1024 bytes to try and work
> -                * around the problem. According to measurements done on two
> -                * different camera models, the value is high enough to get most
> -                * resolutions working while not preventing two simultaneous
> -                * VGA streams at 15 fps.
> -                */
> -               bandwidth = max_t(u32, bandwidth, 1024);
> +       if (stream->intf->num_altsetting > 1) {
> +               if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> +                   stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH) {
> +                       u32 interval;
> +                       u32 bandwidth;
> +
> +                       interval = (ctrl->dwFrameInterval > 100000)
> +                                ? ctrl->dwFrameInterval
> +                                : frame->dwFrameInterval[0];
> +
> +                       /*
> +                        * Compute a bandwidth estimation by multiplying the
> +                        * frame size by the number of video frames per second,
> +                        * divide the result by the number of USB frames (or
> +                        * micro-frames for high- and super-speed devices) per
> +                        * second and add the UVC header size (assumed to be
> +                        * 12 bytes long).
> +                        */
> +                       bandwidth = frame->wWidth * frame->wHeight / 8
> +                                   * format->bpp;
> +                       bandwidth *= 10000000 / interval + 1;
> +                       bandwidth /= 1000;
> +                       if (stream->dev->udev->speed >= USB_SPEED_HIGH)
> +                               bandwidth /= 8;
> +                       bandwidth += 12;
> +
> +                       /*
> +                        * The bandwidth estimate is too low for many cameras.
> +                        * Don't use maximum packet sizes lower than 1024 bytes
> +                        * to try and work around the problem. According to
> +                        * measurements done on two different camera models,
> +                        * the value is high enough to get most resolutions
> +                        * working while not preventing two simultaneous VGA
> +                        * streams at 15 fps.
> +                        */
> +                       bandwidth = max_t(u32, bandwidth, 1024);
> +
> +                       ctrl->dwMaxPayloadTransferSize = bandwidth;
> +               }
>
> -               ctrl->dwMaxPayloadTransferSize = bandwidth;
> +               if (format->flags & UVC_FMT_FLAG_COMPRESSED &&

Why only for compressed formats?
> +                   stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH &&
> +                   ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
> +                       dev_warn(&stream->intf->dev,
> +                                "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). use the default value of 1024 bytes.\n",
exceeds
The max
. Use
> +                                ctrl->dwMaxPayloadTransferSize,
> +                                stream->maxpsize);
> +                       ctrl->dwMaxPayloadTransferSize = 1024;

Why did you decided 1024 to be the correct transfer Size? Wouldn;t it
be more generic to use stream->maxpsize


> +               }

Maybe a bit nicer:

diff --git a/drivers/media/usb/uvc/uvc_video.c
b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..b50e6a4048f0 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -262,6 +262,16 @@ static void uvc_fixup_video_ctrl(struct
uvc_streaming *stream,

                ctrl->dwMaxPayloadTransferSize = bandwidth;
        }
+
+       /* Proper comment.... bla bla bla */
+       if (stream->intf->num_altsetting > 1 &&
+           ctrl->dwMaxPayloadTransferSize > stream->maxpsize &&
+           stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH) {
+               dev_warn(&stream->intf->dev,
+                        "the max payload transmission size (%d)
exceeds the size of the ep max packet (%d). Using the max size.\n",
+                        ctrl->dwMaxPayloadTransferSize, stream->maxpsize);
+               ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
+       }
 }



>         }
>  }
>
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5e388f05f3fc..8b43d725c259 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -77,6 +77,7 @@
>  #define UVC_QUIRK_DISABLE_AUTOSUSPEND  0x00008000
>  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
> +#define UVC_QUIRK_OVERFLOW_BANDWIDTH   0x00040000
>
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
>
> base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
> --
> 2.25.1
>
>


-- 
Ricardo Ribalda

