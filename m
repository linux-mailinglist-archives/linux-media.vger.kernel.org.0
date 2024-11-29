Return-Path: <linux-media+bounces-22353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA39DE8A2
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 15:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BEE2B2239F
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 14:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78D513A258;
	Fri, 29 Nov 2024 14:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L0YVDbHo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B342AAB
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732891032; cv=none; b=T5+37c1+X2dqXiR249WGBWc4R7pNioZhslQOY4ZKKlld5YZAuaJ2k3G5WXXzuS6mCrP10S1g+y0BTyARvH64i7P1EM7kNk+8tvoX5zlXJnI1Ii75cuDb0EMKTTRCpZBHRGzismARad8TN4ApCHohlLWifzyr9ap5AEqCfQrWPRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732891032; c=relaxed/simple;
	bh=5ZOgJmJjEJiFNUpmp32gvaH73J6nFPWcYoh8rVtkgCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SS2aR8c5HNyRh/XiGgohslxJZOYE8iuVdntH9NSxIvanbRUbVH51V/+2PWw8aNqhrMsrbyeqnBniiHrs50UFtHTFuLKmWkQpFmQxW9RXwLfFehG8MKfI7NNTeMWJGJPEYOVVjETYak7EuZgTYxvE2acoIv3hZj6dIX45s7rI+Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L0YVDbHo; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7f450f7f11dso1373066a12.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732891029; x=1733495829; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GCaydgbEYNCZNA2YMsVwrS/UE0n5hw0VHuQ5q200pTQ=;
        b=L0YVDbHo5uSVbv837OjdjV7a8fWwrz0sMsr9Zxl90RmPQPBQzmw1VSX27wbOVGuBTy
         18fuzlAceqN1uEPRrP671EvI3gTUZGPkyP50FC8crtcnwp7wMwraTuLKf/0xOTESXU5n
         dyo/ZQ2q9tpVz16O61+LU3v4xZ3WMLXhLYOO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732891029; x=1733495829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCaydgbEYNCZNA2YMsVwrS/UE0n5hw0VHuQ5q200pTQ=;
        b=ToZz5eWo8MvuJ3Y5M/XRdEy02+UXG49gdHdUPuD9Yd3SXZ1q5SrvLL3c9PscjqaQNL
         Mh2WRnHwR6tyoaZxVFZ399Zq3URqWTMPVkKMfePEu9ty9AQCelQuTpX368/1wuqu80Uy
         nKN4uLLdUawenTIxvrMlY3do8yAs6fA0gYX1FYCA0Dnk2zjJSouO8PEjw5IvMSGoKfEp
         K9zswnYW3kLmrGuwgBhpRL/7umtcl9Hpm3zuJm6QY0CE4ETtHqBZPZzn6f0v4R+WfSRh
         k1uR35KDZXh0KvQZCYqUEQE9iaHfR0WEjWdgSrO1kNXGJhrzWzx560kHeF1wHXkSkIdy
         vCSg==
X-Forwarded-Encrypted: i=1; AJvYcCWaH/T7M5li3vN70hQ7aOk3LFodomdPgufgCHbaHB9sQven57H19Eh3lR4cfhJwlpy2xeRPboYFxCR3eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnovKIwHLEsG6z+j8JJ7dKQtXpzxvG9C7oZ9D/5Y0iD+7pVcO
	pRHBKKgUVexwp/TCFd+RyePALXyi9BggJ22kKSaF+wcY2J9R+9B/7FHon9AgU7m9WaQvTxaUM4o
	=
X-Gm-Gg: ASbGncvj896q3b3pdlukhu9CY7JrsCXL1zE8T35wIBXr9YKabqKwU7t75j0uAnVylDf
	HdebM/q64FCrLBjD5+xjEP02xhWfxKrdMHEVtofTUUU8tSKu7dHsJxe3KAiAk3o5ggL/+tq6xWL
	/YAjDxkLPinFgd83q0rt8wzFEIRspra4KYaINPLQnALFZqSMTZyfaDrggBBNHZ+tnWOsWx3hqHX
	d6FN4wBokIre7GIITr4su/3FYfH4/hoxUHCCsQSI8MWi1pESliUArBrh/OTi/894CC6VoE100b8
	OuZpX60g/h5+
X-Google-Smtp-Source: AGHT+IGv7OO4S+PX1JEzf1FD5TKVniBJ3Qz2rGhVhW1JutG98DBeJCVgPETzAt4sXagkNpFcw0cCpQ==
X-Received: by 2002:a05:6a20:6a28:b0:1e0:d663:1d12 with SMTP id adf61e73a8af0-1e0e0b52a50mr17753171637.34.1732891029383;
        Fri, 29 Nov 2024 06:37:09 -0800 (PST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541813c15sm3532125b3a.139.2024.11.29.06.37.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 06:37:08 -0800 (PST)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ea5a22d80cso1408708a91.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 06:37:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdHEYiZfk2RBDR0EmO1WyKP0Z4X9V8tMe+4JWaolnfjgVLlDSVi9cD9zVrXMM7zCZTDtf6Zp2bF70hBw==@vger.kernel.org
X-Received: by 2002:a17:90b:2882:b0:2ea:83a0:47a6 with SMTP id
 98e67ed59e1d1-2ee097dd78bmr14783645a91.33.1732891027768; Fri, 29 Nov 2024
 06:37:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128145144.61475-1-isaac.scott@ideasonboard.com>
 <20241128145144.61475-2-isaac.scott@ideasonboard.com> <CANiDSCuQUEhxhqTvrKcKtRx4fbkQPUx5O22xBxuXOpGPzH=jVw@mail.gmail.com>
 <db474dc5ad8ce5743a2120ae490ff9f6a723b6f3.camel@ideasonboard.com>
In-Reply-To: <db474dc5ad8ce5743a2120ae490ff9f6a723b6f3.camel@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 15:36:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCt3SyYtLpSWRhkDZBR44iLJQMvNUwoikQxH6K4dJq_e8Q@mail.gmail.com>
Message-ID: <CANiDSCt3SyYtLpSWRhkDZBR44iLJQMvNUwoikQxH6K4dJq_e8Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] media: uvcvideo: Implement dual stream quirk to
 fix loss of usb packets
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Isaac

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

On Fri, 29 Nov 2024 at 11:36, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> I hope you are well!
>
> On Thu, 2024-11-28 at 17:16 +0100, Ricardo Ribalda wrote:
> > On Thu, 28 Nov 2024 at 15:53, Isaac Scott
> > <isaac.scott@ideasonboard.com> wrote:
> > >
> > > Some cameras, such as the Sonix Technology Co. 292A, exhibit issues
> > > when
> > > running two parallel streams, causing USB packets to be dropped
> > > when an
> > > H.264 stream posts a keyframe while an MJPEG stream is running
> > > simultaneously. This occasionally causes the driver to erroneously
> > > output two consecutive JPEG images as a single frame.
> > >
> > > To fix this, we inspect the buffer, and trigger a new frame when we
> > > find an SOI.
> > >
> > > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 27 ++++++++++++++++++++++++++-
> > >  drivers/media/usb/uvc/uvcvideo.h  |  1 +
> > >  2 files changed, 27 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c
> > > b/drivers/media/usb/uvc/uvc_video.c
> > > index e00f38dd07d9..6d800a099749 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -20,6 +20,7 @@
> > >  #include <linux/atomic.h>
> > >  #include <linux/unaligned.h>
> > >
> > > +#include <media/jpeg.h>
> > >  #include <media/v4l2-common.h>
> > >
> > >  #include "uvcvideo.h"
> > > @@ -1116,6 +1117,7 @@ static void uvc_video_stats_stop(struct
> > > uvc_streaming *stream)
> > >  static int uvc_video_decode_start(struct uvc_streaming *stream,
> > >                 struct uvc_buffer *buf, const u8 *data, int len)
> > >  {
> > > +       u8 header_len;
> > >         u8 fid;
> > >
> > >         /*
> > > @@ -1129,6 +1131,7 @@ static int uvc_video_decode_start(struct
> > > uvc_streaming *stream,
> > >                 return -EINVAL;
> > >         }
> > >
> > > +       header_len = data[0];
> > >         fid = data[1] & UVC_STREAM_FID;
> > >
> > >         /*
> > > @@ -1210,9 +1213,31 @@ static int uvc_video_decode_start(struct
> > > uvc_streaming *stream,
> > >                 return -EAGAIN;
> > >         }
> > >
> > > +       /*
> > > +        * Some cameras, when running two parallel streams (one
> > > MJPEG alongside
> > > +        * another non-MJPEG stream), are known to lose the EOF
> > > packet for a frame.
> > > +        * We can detect the end of a frame by checking for a new
> > > SOI marker, as
> > > +        * the SOI always lies on the packet boundary between two
> > > frames for
> > > +        * these devices.
> > > +        */
> > > +       if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
> > > +           (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> > > +           stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> > > +               const u8 *packet = data + header_len;
> > > +
> > > +               if (len >= header_len + 2 &&
> > > +                   packet[0] == 0xff && packet[1] ==
> > > JPEG_MARKER_SOI &&
> > > +                   buf->bytesused != 0) {
> > nit: !buf->bytesused (please ignore if you prefer your way)
> > > +                       buf->state = UVC_BUF_STATE_READY;
> > > +                       buf->error = 1;
> >
> > I have a question. Lets say that  you have two frames: A and B, each
> > one has 4 packets:
> > A1A2A3A4B1B2B3B4
> > The last package of A is lost because the device is non-compliant.
> > A1A2A3B1B2B3B4
> >
> > You detect this by inspecting every packet, and checking for the
> > values 0xff, JPEG_MARKER_SOI at the beggining of the packet.
> >
> > Can't that value happen in the middle of the image, let's say in A2,
> > A3, B2, B3... ? If that happens, won't you be losing frames?
> >
>
> I have found that in MJPEG, it is required to have both an SOI (0xFFD8)
> and an EOI (0xFFD9) in every payload.

Thanks a lot for checking it out.

If you happen to make a new version, that would be a very nice info to
add  to the comment.

>
> Source: p.16, USB Device Class Definition for Video Devices: MJPEG
> Payload
> (https://usb.org/document-library/video-class-v15-document-set))
>
> Furthermore, the JPEG standard also explicitly defines 0xFFD8 to be the
> start of image marker, meaning its usage outside that functionality
> would not adhere to the standard. If it appears in the middle of a
> payload, the payload should be marked as invalid.
>
> Source: p. 32, Digital Compression and Coding of Continuous-Tone Still
> Images - Requirements and Guidelines
> (https://www.w3.org/Graphics/JPEG/itu-t81.pdf)
>
> > Also, If I get it right, the device not only loses the packet A4, but
> > it sends the wrong fid for all the Bx packets?
>
> Before the patch, B would be joined into A, and gets delivered to user
> space as A1, A2, A3, A4, A5, A6, A7, A8, C1, C2, C3...
>
So it seems like the fid value does not change during all the A...

Thanks again  and sorry for not raising the questions before.

>
> > Maybe the device is not losing A4 but sending wrong fids? Have you
> > tried not setting buf->error=1 and inspecting the "invalid" image?
> >
>
> I saw during the diagnosis of the issue by analysing the USB packets
> sent by the camera that the packet containing the EOF does not get sent
> whatsoever when the two streams are running simultaneously.
>
> > I am not saying that it is incorrect. I am just trying to understand
> > the patch better. :)
> >
> >
> > > +                       stream->last_fid ^= UVC_STREAM_FID;
> > It would be nice to have uvc_dbg() here, in case we want to debug
> > what
> > is going on.
> > > +                       return -EAGAIN;
> > > +               }
> > > +       }
> > > +
> > >         stream->last_fid = fid;
> > >
> > > -       return data[0];
> > > +       return header_len;
> > >  }
> > >
> > >  static inline enum dma_data_direction uvc_stream_dir(
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h
> > > b/drivers/media/usb/uvc/uvcvideo.h
> > > index b7d24a853ce4..040073326a24 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -76,6 +76,7 @@
> > >  #define UVC_QUIRK_NO_RESET_RESUME      0x00004000
> > >  #define UVC_QUIRK_DISABLE_AUTOSUSPEND  0x00008000
> > >  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
> > > +#define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
> > >
> > >  /* Format flags */
> > >  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
> > > --
> > > 2.43.0
> > >
> > >
> >
> >
>
> Best wishes,
>
> Isaac



-- 
Ricardo Ribalda

