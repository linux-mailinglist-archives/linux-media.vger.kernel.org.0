Return-Path: <linux-media+bounces-24300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5E2A02D79
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 17:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB85D16382E
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 16:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105651DC99E;
	Mon,  6 Jan 2025 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Es+wN+L2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7E8166F07
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736180205; cv=none; b=BUCnDjnwK/ExrUYd4p0iTt/6wDGgZBUNQ8ha2VT9tPNgYn+WgLfFzyEd5AoPiw550opuyrpejY41xEA98Gbl77SemJo3Io54aOUnUYdhG5Ui0c6HqR3ZbpABO1G3O9NOHccwmIERRLYrncnLrq7T0/sM7X02N30XskRuBqLnk/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736180205; c=relaxed/simple;
	bh=AThqvhcvD6PznyZLILDysjlpWwCx6IGU+f5rUSEr+f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+INrQuB5/O2IEYYObdleEKI9kSgbe8+X301IYqYeSr5k090chdK1n/Kl/pUvm+xwJr8s3BUSpk+WOeTBauqua6ghcxlRHMHCWS+02ztsnLjSTZQq10zqxHR6j2iuvij2+Uf2OJkPSNV5SjAkRT8jvlNHH3Xc01w7nT2pwLCYJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Es+wN+L2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30229d5b229so153660971fa.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 08:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736180201; x=1736785001; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2zg2HaPxAcKiGmUPiumX4//cFL/SeWJicC6KIVKRc4E=;
        b=Es+wN+L2Gq174ES2JCC1lnCsRMTWi2vJiIJ20s7kQTI4dqCwuX70sNgbOevX3ImXBH
         gIFKV4CfQYNaVe7ca+1VI+Dy4lpD0VbmpnhzvjmAZdkfGAy0avwayHab0SjByokskJzy
         MUzn+fRjzKpkRzrGA98Sh03SSrGGRWiBo0ACg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736180201; x=1736785001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zg2HaPxAcKiGmUPiumX4//cFL/SeWJicC6KIVKRc4E=;
        b=jWo9gKV+Q+Yc05b5hG/mAOsAXdEQ16sMMdCvsMkPnWHFziwZyIOUsmj2j1+TIluaM5
         cPeY9zlc0lELLUinpkcy5RsXkiSr4acKrq511zHTELpV5jd79lqChdgMqqXFlbPWV3gT
         LAM5WZuw0iP5CdZIJBn5rjkvQS99otPNZWabg7mSIgD2bH2jtNXpNv1yfXCC5g8VagjR
         8/Wbo+C3kqLO9Iv5oNrHVCC6D5FH/Wh3ynchi+arxyV4PAukYitUTQohLNZ8S2XCCO7Q
         cBtwoe0The5ac+guF+UI17e3hLISqo3Nlx5CygBX4ib7hItf+4aR5oOkmXmfbxriy//v
         njvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/os+j6aeA7PQfQlN5bYkUem8GHpqvC4INcV6d2/0temunrTyk0VMKiO2gZ4/8C14OmL0VFXIQzAWMug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpgM2iYL7d2fy/oQsr2Ta7fOFpmPrSEA963ZyykpVO6WY9vnI8
	XvjNI7x+hIj/O78mhLH0WS0XoGes5qazXtuaZJ1OfvEL8PhYWt+Cg8GR133T1ke/+d5obfL6K40
	pAw==
X-Gm-Gg: ASbGncvTCzB2AgpM2CIXn/6eO9dQzBlqYhtOHlMqw5+5Rm1nTfmqQBLZcwQq/C2gBG8
	f8tYm2626RYRGAjxgzzTnG031C3FseS+rnmIJvCeaP1lsoJc6424pkZMwCERjomhd16D6+MfC1B
	d6ocIC3NCKb9VVyhTkob8VJS+3RVV9XZ8dj99cgq/kRCRH8XBHxTYB/WH3vercKBc2jejlwhrDv
	Gi4LhWk6ZnWH6+Mt5aXITUoDFRw3MyQ6ttlw5PELG1Jq/qsvn2QfSi5PyJzLzBhTt6cxaZon1EZ
	zxdqHv+XM4g5F8Keldc=
X-Google-Smtp-Source: AGHT+IF5nBt8/fRlKvyGY1c31tnu2H8mh7LRXS6rkxxo8zH4dq6eQgRH/wvguKg8XXW6iOIxstqkIg==
X-Received: by 2002:a05:651c:4ca:b0:302:3355:f756 with SMTP id 38308e7fff4ca-304685de7e4mr164552361fa.35.1736180201284;
        Mon, 06 Jan 2025 08:16:41 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adac821sm57764701fa.59.2025.01.06.08.16.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 08:16:40 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54024ecc33dso684372e87.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 08:16:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkLYubxfVeeVX3+oU2yK7Fei+MiCPPYI5Re4HFHdZKulSshuBhQflGODXqbE7YPFw+0DAk2gmvR1dH2A==@vger.kernel.org
X-Received: by 2002:a05:6512:3f26:b0:53e:94f9:8ca9 with SMTP id
 2adb3069b0e04-54229581e9bmr15692315e87.39.1736180200163; Mon, 06 Jan 2025
 08:16:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106140923.56896-1-hdegoede@redhat.com> <20250106140923.56896-3-hdegoede@redhat.com>
 <CANiDSCviVQyoaf70KG=uPGJo1jsiHhzmG7XmfBCzCy6YpXr4Fg@mail.gmail.com> <3f9adbc0-6474-4afd-b2de-d1a87edf047f@redhat.com>
In-Reply-To: <3f9adbc0-6474-4afd-b2de-d1a87edf047f@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 6 Jan 2025 17:16:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCvp9LrOPBRCAXLWJf+w1M_q4CtCPoBjDBBZH2Nave5q=w@mail.gmail.com>
X-Gm-Features: AbW1kvat2Y6ZoCYy1_TahXxxdZl8iY2TBS2EsgQII_8591bDNRc2Q8Ps5vlkbgg
Message-ID: <CANiDSCvp9LrOPBRCAXLWJf+w1M_q4CtCPoBjDBBZH2Nave5q=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: uvc: limit max bandwidth for HDMI capture
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 6 Jan 2025 at 16:49, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 6-Jan-25 3:48 PM, Ricardo Ribalda wrote:
> > On Mon, 6 Jan 2025 at 15:09, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >>
> >> This device:
> >>         534d:2109 MacroSilicon
> >>
> >> Announces that it supports several frame intervals for
> >> their resolutions for MJPEG compression:
> >>
> >>         VideoStreaming Interface Descriptor:
> >>         bLength                            46
> >>         bDescriptorType                    36
> >>         bDescriptorSubtype                  7 (FRAME_MJPEG)
> >>         bFrameIndex                         1
> >>         bmCapabilities                   0x00
> >>           Still image unsupported
> >>         wWidth                           1920
> >>         wHeight                          1080
> >>         dwMinBitRate                   768000
> >>         dwMaxBitRate                196608000
> >>         dwMaxVideoFrameBufferSize     4147200
> >>         dwDefaultFrameInterval         166666
> >>         bFrameIntervalType                  5
> >>         dwFrameInterval( 0)            166666
> >>         dwFrameInterval( 1)            333333
> >>         dwFrameInterval( 2)            400000
> >>         dwFrameInterval( 3)            500000
> >>         dwFrameInterval( 4)           1000000
> >>
> >> However, the highest frame interval (166666), which means 60 fps
> >> is not supported. If set to it, URB packages will be dropped,
> >> causing JPEG decoding errors and part of the video frames will
> >> be missed.
> >>
> >> Also, as specified at the device's documentation, for such
> >> resolution, the maximum interval is 30 fps (interval == 333333).
> >>
> >> The last format that supports such frame interval is 1280x720.
> >>
> >> Add a quirk to estimate a raw bandwidth, by doing:
> >>         width * height * framerate
> >> E. g.:
> >>         1920 * 1080 * 30 = 62208000
> >>
> >> if the bandwidth is greater than such threshold, get
> >> the next value from the dwFrameInterval.
> >>
> >> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> Link: https://lore.kernel.org/r/bca0634691cea503c2c5df62b98ba66f0c85bf85.1624350539.git.mchehab+huawei@kernel.org
> >> [hdegoede@redhat.com add "pixels per second" comment, use UVC_FIVAL_DENOM]
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
> >>  drivers/media/usb/uvc/uvc_video.c  | 29 ++++++++++++++++++++++++++---
> >>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >>  3 files changed, 41 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >> index f754640fddf5..6d001d4f0902 100644
> >> --- a/drivers/media/usb/uvc/uvc_driver.c
> >> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >> @@ -2491,6 +2491,11 @@ static const struct uvc_device_info uvc_quirk_fix_bandwidth = {
> >>         .quirks = UVC_QUIRK_FIX_BANDWIDTH,
> >>  };
> >>
> >> +static const struct uvc_device_info uvc_quirk_fix_bw_622 = {
> >> +       .quirks = UVC_QUIRK_FIX_BANDWIDTH,
> >> +       .max_bandwidth = 62208000,
> >> +};
> >> +
> >>  static const struct uvc_device_info uvc_quirk_probe_def = {
> >>         .quirks = UVC_QUIRK_PROBE_DEF,
> >>  };
> >> @@ -2794,6 +2799,15 @@ static const struct usb_device_id uvc_ids[] = {
> >>           .bInterfaceSubClass   = 1,
> >>           .bInterfaceProtocol   = 0,
> >>           .driver_info          = (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
> >> +       /* MacroSilicon HDMI capture */
> >> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> >> +         .idVendor             = 0x534d,
> >> +         .idProduct            = 0x2109,
> >> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> >> +         .bInterfaceSubClass   = 1,
> >> +         .bInterfaceProtocol   = 0,
> >> +         .driver_info          = (kernel_ulong_t)&uvc_quirk_fix_bw_622 },
> >>         /* Genesys Logic USB 2.0 PC Camera */
> >>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> >> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> >> index 41cb1b45fa23..af5233ab667e 100644
> >> --- a/drivers/media/usb/uvc/uvc_video.c
> >> +++ b/drivers/media/usb/uvc/uvc_video.c
> >> @@ -225,9 +225,32 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >>         if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
> >>                 ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
> >>
> >> -       if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> >> -           stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
> >> -           stream->intf->num_altsetting > 1) {
> >> +       if (!(stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH))
> >> +               return;
> >> +
> >> +       /* Handle UVC_QUIRK_FIX_BANDWIDTH */
> >> +
> >
> > Shouldn't this quirk be better implemented in uvc_try_frame_interval() ?
>
> This is the place where the other bandwidth checks / UVC_QUIRK_FIX_BANDWIDTH
> handling is done, so I guess it makes sense to keep this here.

If I understood it correctly the quirk skips one of the intervals.
If we add the quirk to uvc_ioctl_enum_frameintervals and
uvc_try_frame_interval(), the user will not enumerate frame intervals
that will not work.
IMO that is better than accepting an interval and then changing it to
something else.

From Mauro's description, the documentation says that the max fps is
30 but the device announces 60. I'd rather add a "denylist" logic than
introducing a magic number 62208000.

And regarding the magic number, it should be based on
dwMaxVideoFrameBufferSize, not on frame->wWidth , frame->wHeight (if
we decide to have a magic number).
or even better, we could have min_dwFrameInterval.


>
> >> +       if (format->flags & UVC_FMT_FLAG_COMPRESSED) {
> >> +               u32 bandwidth;
> >> +
> >> +               if (!stream->dev->info->max_bandwidth || !frame->bFrameIntervalType)
> >> +                       return;
> >> +
> >> +               for (i = 0; i < frame->bFrameIntervalType; ++i) {
> >> +                       bandwidth = frame->wWidth * frame->wHeight;
> >> +                       bandwidth *= UVC_FIVAL_DENOM / frame->dwFrameInterval[i];
> >
> > frame->dwFrameInterval[i] comes from the device, it is not sanitized.
> > We need to make sure it is not zero.
>
> That is a good point, in the non-compressed UVC_QUIRK_FIX_BANDWIDTH handling
> this is handled by doing:
>
>                         bandwidth *= UVC_FIVAL_DENOM / (frame->dwFrameInterval[i] + 1);
>
> I guess we should do the same here then ?

I prefer (max(1,frame->dwFrameInterval[i])

But you chose :)

>
> Regards,
>
> Hans
>
>
>
> >
> >> +
> >> +                       if (bandwidth <= stream->dev->info->max_bandwidth)
> >> +                               break;
> >> +               }
> >> +
> >> +               if (ctrl->dwFrameInterval < frame->dwFrameInterval[i])
> >> +                       ctrl->dwFrameInterval = frame->dwFrameInterval[i];
> >> +
> >> +               return;
> >> +       }
> >> +
> >> +       if (stream->intf->num_altsetting > 1) {
> >>                 u32 interval;
> >>                 u32 bandwidth;
> >>
> >> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >> index 966ff82c2ba8..6b702219173f 100644
> >> --- a/drivers/media/usb/uvc/uvcvideo.h
> >> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >> @@ -535,6 +535,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
> >>
> >>  struct uvc_device_info {
> >>         u32     quirks;
> >> +       u32     max_bandwidth; /* In pixels per second */
> >>         u32     meta_format;
> >>         u16     uvc_version;
> >>  };
> >> --
> >> 2.47.1
> >>
> >>
> >
> >
>


-- 
Ricardo Ribalda

