Return-Path: <linux-media+bounces-21433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB8C9C929F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C7FF1F2269B
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AC41A0B07;
	Thu, 14 Nov 2024 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kCv26Ofp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6C817588
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731613689; cv=none; b=WcYuegl7T7cev60iBl8xkjO18J1d8wUwZZSmhz6lMl9YdvsQhQ/Ton2jfEGeExmt4i6/K5R9uMoq2W8rDKrVQj3lSa/B25QxcNviTrTx4l/QUijOFTo0q6E4qQNmeG0VI8Ii1enOlqPdcs+sK+Gx+m2gYTwXc4MU5ZzeR4rMtCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731613689; c=relaxed/simple;
	bh=JJKU6cICBlV/z9N4jZYhV+a+vNTFNyKH/LABJEVr82o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLSgE17OhrOREcRq2kAGS34UdRVpZqijNhP825sULfbLqGWAYpeWTJs7lpdHJuFWpAfKKaXTjj1l8Warkg6BtyYgUXOvllik4S7765ZuyoqqYuErFv4+Z4tyM/mzTUhFw0CnPo5dOeYoqYHdgO5fUn19R1v8LzuNgy09cGSCBqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kCv26Ofp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-211c1bd70f6so9597545ad.0
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731613686; x=1732218486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1poutJZDyUnMdmJmLuhxshITcn6FdS/wvFn0qHRMXiI=;
        b=kCv26OfpB/FYhFqcpZfB/Q7hl9J2KGLn/p7ywGlvYzJgtrSqeQATjbuVZAXpJHI8QP
         UL0ROnhZepZgGY2olwo9MfCbc0fvn8Qc0nPTwLGgz+0eC/Xyk5oDFbZCBE4zGbg5hGMq
         sjf19OYqvSI00OzH1YIYD5js4wtc54FHaEUGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731613686; x=1732218486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1poutJZDyUnMdmJmLuhxshITcn6FdS/wvFn0qHRMXiI=;
        b=Ww8zoRNJnjM1WpHeaXjeUtLrsFGzJmiPm61v5dWFQO2RwiJlT3u4xiPaSoLOpwPPMk
         00ivjHMVu1CyuWVEa7iyD0nnbQ2cWwqwjYTGrPriE5rYY+fd3QiQVWpqVsTDc56w8PZW
         Mqu0ze6oSbbuRGA36cialGbzS6vBtneoVfN1fWH6aR8d53HLcnr/nRMdBvBVUgNFfaSe
         Qgn+FA2IaD5XWbAt0ix6ifn6fhxyeFy91ukzN/21iJcQG4LyHqRyYiL+c98DY3l57QEN
         QnshSYI94uVR2+SnnkXVmKr6AHBx18pqO98SJb2hDIj2zAzw39pm1uMYMyLYXsEc9Um1
         pUZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFWet7BwYZC4YEnO7d04VCXSMcdqyUmIdAnFezShbaC9SWP8kogNxwe77TLLQVDwMZxRlhU6HX5cqngg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl2UonDj8fUpxwVDieSziG7MbnCHt0DP9uGoPwk1UyM8ONfYnr
	N1C3M+8mbQVGkGpXQ7pWVSOUF2ofQTU4oe10fDpLA5uRTsmstCpoS9ts/z07XSUymq8Tp99XRs4
	=
X-Google-Smtp-Source: AGHT+IEKhWq8atB/HHbxrvX7grta4RO9kv4wcc/EB/i4XVc1yn7XWE6vFCmd4oOwhXvmt89qxL+4Qw==
X-Received: by 2002:a17:902:e803:b0:211:2fb2:6a6 with SMTP id d9443c01a7336-211d07fa485mr3508065ad.24.1731613686374;
        Thu, 14 Nov 2024 11:48:06 -0800 (PST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0dc51a1sm117795ad.57.2024.11.14.11.48.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:48:05 -0800 (PST)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-720be27db74so810576b3a.1
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:48:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV98k609/otLY/cmGXnCYbAG2mIxI8VH08dsEv3XypdTzXQ9raK2VI/o1nF+waVaMqVv8EbJAm30GgS5Q==@vger.kernel.org
X-Received: by 2002:a05:6a00:190c:b0:724:66cf:163f with SMTP id
 d2e1a72fcca58-72475f97125mr488071b3a.3.1731613684924; Thu, 14 Nov 2024
 11:48:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112112926.17848-1-isaac.scott@ideasonboard.com> <20241112112926.17848-2-isaac.scott@ideasonboard.com>
In-Reply-To: <20241112112926.17848-2-isaac.scott@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 20:47:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCuA7MFzo4Oyk3wiaoa=7CpVgFkaxxD+BHeJS1i5G9qSRw@mail.gmail.com>
Message-ID: <CANiDSCuA7MFzo4Oyk3wiaoa=7CpVgFkaxxD+BHeJS1i5G9qSRw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] media: uvcvideo: Implement dual stream quirk to
 fix loss of usb packets
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Isaac

I am curious... How is this v7?

Remember to run
 scripts/checkpatch.pl --strict -g HEAD

It is complaining about an open parenthesis match here. Not the end of
the world, but rather fix it locally than discussing :)

Totally optional... maybe you can add to the cover-letter a run of
yavta -c /dev/videoX
with and without the patch. So people can see practically what changes.

Regards!

On Tue, 12 Nov 2024 at 12:33, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
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
> index e00f38dd07d9..9bb41362c48d 100644
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
> +          (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> +           stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> +               const u8 *packet = ((const u8 *)data) + header_len;
Do you need the (const u8 *) casting here? . I believe data has
exactly that datatype
> +
> +               if (len >= header_len + 2 &&
> +                   packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
> +                   buf->bytesused != 0) {
> +                       buf->state = UVC_BUF_STATE_READY;
> +                       buf->error = 1;
> +                       stream->last_fid ^= UVC_STREAM_FID;
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

