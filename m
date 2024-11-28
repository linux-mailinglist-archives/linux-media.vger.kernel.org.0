Return-Path: <linux-media+bounces-22233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B52479DBB13
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 17:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D50281AD1
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CF51B2190;
	Thu, 28 Nov 2024 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BJvDpSoa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA73232
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732810597; cv=none; b=DLzPZelYH3pgN7/ujV17zRlD/PgNtF8hYZYGEZsgtHCZAat7gL406mVmyhpE/Og1T5zhxxSguIpgq6SI0j492conRikT0N6mQ34xdnHS5l0fR3UZQTyrX24X9jxI8cZal+WSuuP47HDXkVzxSQDXZnApBzHL0KwMyAPTEEooMgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732810597; c=relaxed/simple;
	bh=Yzk6cOFxYa6jR7yWClvjo52Jw5bYDYug0e9yUMD66ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zmq1X0hP3vcr1Ip270dQs6B67nxCz/ij04CUjukneRNGXbRqUnCyKuXCWLhF+aX5nq48KHAYqBaXqCyD/4KgrSw74O7zG641xflM4QLHo5nBamrbJCmoWZrSINrUdRvcZ+5jh6pYzXsBP5YRZ3yh4kFM6x/YM4KIInPucOl+K44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BJvDpSoa; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21269c8df64so8904175ad.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732810594; x=1733415394; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o3Q9tPGCeJpyVzIXBtojfUfZJ2WPx2EkhbpdeI1m8Co=;
        b=BJvDpSoaAbqKk+uNHQCWkBsB94OWSd9vbODDTLSwaoSkNE9ZH6eXgZ8WGBcK1s/6Lw
         lsMFH1K23iNsFuau7EVLC5afOXffkeUiKIpPvmLF1tTFs4ACyqNC0SWz1MTfKZRA9/q2
         V9mCj/McuwffhTDVWwk5WdcsiyCClHoF8V/oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732810594; x=1733415394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3Q9tPGCeJpyVzIXBtojfUfZJ2WPx2EkhbpdeI1m8Co=;
        b=GIpxlQVr20fAh/UZMsx6TSClosyOd81ixNSPPtKsSx9p0ZGeNg1OBaEHZ04O3hTj6L
         BtRAirdeFv3BMV9cG06WXT9b5WdnfEc71kMEmj2Tt6UmzEdnCBDhdIauqKemNIgnjxhE
         RskyySf/11qL6fTYJcHUMOsLsijwAFGu2vlVyc2vRCvI5cHBQTp3Tgn9m7GZHtomL5Ax
         XASQJ5d6eRHYoNWyH/asuPdubmpDdnEGjY4Jj8Sm9UWkLszmrEU5I0YfN3RSYV3k3GO0
         WRYNePx4aLbsbazyDMPMCG4tWIOl0QM4rNn+U9CMp7EoRszDuZWiywGVknxVgqSd8XrP
         JS2g==
X-Forwarded-Encrypted: i=1; AJvYcCWmyI3WtosxnFyLur6OLo5r+FFU9Vnzlqq//o4DQrG2N+XBdAXM/8NkgNFyRnv0Jci8lZdIP8JQDkVu9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+g4NVH+/5Zjg5NTli/8MPKfq5S+TOjdjwCFyNFGHJ0BoBnYO
	gkAlxEPv5v+XGgYzkZvYKiMaX+wYV/xQKeLwfciaU2IyMj3LyUSnLc29nTPzVy34HZKu4UNsTRU
	=
X-Gm-Gg: ASbGncuG709EPVTmIrlsWgNaw5n83YWmluk+P8ELobrTwSY26w/Gj7gsdgrCoQ26Qv/
	1lMdeVDDyaRLPk1OBN+A59F9X9yuekR35GaBdZ2Nq6LTNlw7Z0FsbsUFq+CGN9o63nTT4DDDkb3
	KWgGc1EYljc/B8ue+63fNZR02bvAtqEArf9tWwmhMabEai5XSPWYib0tyTmMJXfMtajLChVoyGt
	lIDPjd3nZHh0YIhHFgMZEQCXVIk1TuW16zel0Wrn1ft6VgeJAvn2GGVr0JVy3Tb1a/oXbD79fBU
	yNX/lhEaDNH983Ny
X-Google-Smtp-Source: AGHT+IGzrYoggQDxFuUD4F8PkX95+piw70H2gCQNRjfzqmDUIYLEECG/CXrLDqpjLvO6JHsxQkgW0g==
X-Received: by 2002:a17:902:dac8:b0:20c:70ab:b9c3 with SMTP id d9443c01a7336-21501a44acfmr98847125ad.34.1732810594524;
        Thu, 28 Nov 2024 08:16:34 -0800 (PST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com. [209.85.210.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521905f73sm15296375ad.92.2024.11.28.08.16.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 08:16:33 -0800 (PST)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724f1ce1732so813734b3a.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:16:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJ947YVlsmgcix4iSZ1xvbpR+Oi7c55sIBGgfUdH5WqXlQxJyz1+d7MGo/QMiOYPIH1lrATLeltdsEXA==@vger.kernel.org
X-Received: by 2002:a05:6a00:b47:b0:725:99f:9732 with SMTP id
 d2e1a72fcca58-72530041cd1mr10081270b3a.13.1732810591876; Thu, 28 Nov 2024
 08:16:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128145144.61475-1-isaac.scott@ideasonboard.com> <20241128145144.61475-2-isaac.scott@ideasonboard.com>
In-Reply-To: <20241128145144.61475-2-isaac.scott@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Nov 2024 17:16:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCuQUEhxhqTvrKcKtRx4fbkQPUx5O22xBxuXOpGPzH=jVw@mail.gmail.com>
Message-ID: <CANiDSCuQUEhxhqTvrKcKtRx4fbkQPUx5O22xBxuXOpGPzH=jVw@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] media: uvcvideo: Implement dual stream quirk to
 fix loss of usb packets
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 15:53, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
>
> Some cameras, such as the Sonix Technology Co. 292A, exhibit issues when
> running two parallel streams, causing USB packets to be dropped when an
> H.264 stream posts a keyframe while an MJPEG stream is running
> simultaneously. This occasionally causes the driver to erroneously
> output two consecutive JPEG images as a single frame.
>
> To fix this, we inspect the buffer, and trigger a new frame when we
> find an SOI.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 27 ++++++++++++++++++++++++++-
>  drivers/media/usb/uvc/uvcvideo.h  |  1 +
>  2 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e00f38dd07d9..6d800a099749 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -20,6 +20,7 @@
>  #include <linux/atomic.h>
>  #include <linux/unaligned.h>
>
> +#include <media/jpeg.h>
>  #include <media/v4l2-common.h>
>
>  #include "uvcvideo.h"
> @@ -1116,6 +1117,7 @@ static void uvc_video_stats_stop(struct uvc_streaming *stream)
>  static int uvc_video_decode_start(struct uvc_streaming *stream,
>                 struct uvc_buffer *buf, const u8 *data, int len)
>  {
> +       u8 header_len;
>         u8 fid;
>
>         /*
> @@ -1129,6 +1131,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>                 return -EINVAL;
>         }
>
> +       header_len = data[0];
>         fid = data[1] & UVC_STREAM_FID;
>
>         /*
> @@ -1210,9 +1213,31 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>                 return -EAGAIN;
>         }
>
> +       /*
> +        * Some cameras, when running two parallel streams (one MJPEG alongside
> +        * another non-MJPEG stream), are known to lose the EOF packet for a frame.
> +        * We can detect the end of a frame by checking for a new SOI marker, as
> +        * the SOI always lies on the packet boundary between two frames for
> +        * these devices.
> +        */
> +       if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
> +           (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> +           stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> +               const u8 *packet = data + header_len;
> +
> +               if (len >= header_len + 2 &&
> +                   packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
> +                   buf->bytesused != 0) {
nit: !buf->bytesused (please ignore if you prefer your way)
> +                       buf->state = UVC_BUF_STATE_READY;
> +                       buf->error = 1;

I have a question. Lets say that  you have two frames: A and B, each
one has 4 packets:
A1A2A3A4B1B2B3B4
The last package of A is lost because the device is non-compliant.
A1A2A3B1B2B3B4

You detect this by inspecting every packet, and checking for the
values 0xff, JPEG_MARKER_SOI at the beggining of the packet.

Can't that value happen in the middle of the image, let's say in A2,
A3, B2, B3... ? If that happens, won't you be losing frames?

Also, If I get it right, the device not only loses the packet A4, but
it sends the wrong fid for all the Bx packets?
Maybe the device is not losing A4 but sending wrong fids? Have you
tried not setting buf->error=1 and inspecting the "invalid" image?

I am not saying that it is incorrect. I am just trying to understand
the patch better. :)


> +                       stream->last_fid ^= UVC_STREAM_FID;
It would be nice to have uvc_dbg() here, in case we want to debug what
is going on.
> +                       return -EAGAIN;
> +               }
> +       }
> +
>         stream->last_fid = fid;
>
> -       return data[0];
> +       return header_len;
>  }
>
>  static inline enum dma_data_direction uvc_stream_dir(
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b7d24a853ce4..040073326a24 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -76,6 +76,7 @@
>  #define UVC_QUIRK_NO_RESET_RESUME      0x00004000
>  #define UVC_QUIRK_DISABLE_AUTOSUSPEND  0x00008000
>  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
> +#define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
>
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda

