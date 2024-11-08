Return-Path: <linux-media+bounces-21193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 947DC9C24D6
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 19:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59128284371
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 18:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDD8233D88;
	Fri,  8 Nov 2024 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BeNJ4Atu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785F233D60
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731090138; cv=none; b=KxquwrB/was6tApxVNwUIXRGQBBSXG9+zjDshHYblRwmvA8jxprPxWZaaJrykU45wAcEU1DLpP6i1W51IwRORfEOhaAuj5rJXAIChDBXLnHBYio7AmkxHW1BdBDS+FZWUh3E3zXMiP4EiQTXx8DSK5Eo9Vw9Z5v5+b5lDr+BpGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731090138; c=relaxed/simple;
	bh=4gV4hEAI7GAjWq2TrYUue0inJD8Hb9LGg+miMSU1B8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdNmXYD9QOzZ+VaynEt2+L3H0Bv6lAZy900B0WkVr8ugtie9zjofqx9rr2TRveCwHMQhNsmtApcAgryIcDx2roNmTQDdNs4rNU6bTkD7+NhS5fsaXPmqlWCbdPXrZmpxsevmbSA8dO+vk2or5yJDI13JOEtumI00GPmlGOpbiyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BeNJ4Atu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20caccadbeeso27222045ad.2
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731090136; x=1731694936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eBjlM5OTBSsXDxm95e13Fo/r5fp7ks3VaxuhGQa0/MU=;
        b=BeNJ4AtuuHjgp4o41glfYWKzzfdFmO3JVTWibQmp0ESUu/XWTRzuqlKbV3/Mehohgj
         Hw9TfSpIpaI3DipZ1AkXdGVTULE8yyZr7mLXaZ63Sh2Ju9AyZuke77e5cYn2jKEZqIXi
         QYKwwHmOdEa+wBzKwUfh0Vnvke0QIPeaioomc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731090136; x=1731694936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBjlM5OTBSsXDxm95e13Fo/r5fp7ks3VaxuhGQa0/MU=;
        b=Y2Li9yr+Nsy+997exOXBfBmcKOgGuC5IbiDsxl4KMX3RaV3rQd5K0BXaEqL4rzSBI9
         nblOsnZbv7ZiHhuM0vtxFvRKfCnVDu00UCBz9uPGb5BkyhxtunNTKTUVfH6g0Rqx94YQ
         gNqVMw/0520RFcIESkVyphzBlf7nyFS/+p+uN5mM/NHNVOLYS29C7QZqEO0BhE8pXqfH
         fkyIrO4JlHqFWS1D4vnCwZPOD6XKCrIYcXLvaMb4zS8lAtIQD8yfBRVFGtGLAH04wFzw
         vAGDe2D/hGJWU0MwwTwRwVY6LXElw7Y2/RuxrM4slcbVehnT0XAtuhdNEzLqGBkK0TCU
         9jMw==
X-Forwarded-Encrypted: i=1; AJvYcCWb/oVeZv4QLyAutCQhs6GL09A/dS4X2YcCQXWUi69jJb5Wr54LUBQzZbRCGCIbGkrMWA413ZrmJjojQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZcKtmlP1HOTAH40KLCr1ZYL9b5go9VzWxA5VoDI1JnoOfeOh0
	H1q7rT9QfwwDJjPzGNFnTxb1mbeUNvpbpT9MP/PGS0tCogB4+DHuudjNSTIAX0LfK8hSULmvdI0
	=
X-Google-Smtp-Source: AGHT+IHtMdItoxrAeHS+TKQVNLA/MaOnQKvohvcM9nbFmTv/bOVAg9wVSn0uyEEdpJy/ziQmFoiLvQ==
X-Received: by 2002:a17:902:cec9:b0:20b:6d8c:463 with SMTP id d9443c01a7336-2118359b35emr52348105ad.35.1731090136345;
        Fri, 08 Nov 2024 10:22:16 -0800 (PST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6ab8fsm33533135ad.226.2024.11.08.10.22.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 10:22:15 -0800 (PST)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20e576dbc42so27763265ad.0
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 10:22:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaqhcymZLq6X7PTA6O0O1ZJvQxJouNzq2o2ZdSsjEVK26ZZx3dEaTbzQZBsVJXEioMjlnK+cicw1N7Kg==@vger.kernel.org
X-Received: by 2002:a17:902:d4c9:b0:20b:9547:9b36 with SMTP id
 d9443c01a7336-211835a197emr51714465ad.46.1731090134921; Fri, 08 Nov 2024
 10:22:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108142310.19794-1-isaac.scott@ideasonboard.com> <20241108142310.19794-4-isaac.scott@ideasonboard.com>
In-Reply-To: <20241108142310.19794-4-isaac.scott@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 8 Nov 2024 19:22:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCuO6AxZDEEWZmgV_gfcEph_acJ6eio6Gymx_2gRvM-QCw@mail.gmail.com>
Message-ID: <CANiDSCuO6AxZDEEWZmgV_gfcEph_acJ6eio6Gymx_2gRvM-QCw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: Implement dual stream quirk to fix
 loss of usb packets
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Nov 2024 at 15:24, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
>
> Some cameras, such as the Sonix Technology Co. 292A exhibit issues when
> running two parallel streams, causing USB packets to be dropped when an
> H.264 stream posts a keyframe while an MJPEG stream is running
> simultaneously. This occasionally causes the driver to erroneously
> output two consecutive JPEG images as a single frame.
>
> To fix this, we inspect the buffer, and trigger a new frame when we
> find an SOI, inverting the FID to make sure no frames are erroneously
> dropped.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 2fb9f2b59afc..f754109f5e96 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1211,6 +1211,30 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>                 return -EAGAIN;
>         }
>
> +       /*
> +        * Some cameras, such as the Sonix Technology Co. 292A exhibit issues
> +        * when running two parallel streams, causing USB packets to be dropped
> +        * when an H.264 stream posts a keyframe while an MJPEG stream is
> +        * running simultaneously. This occasionally causes the driver to
> +        * erroneously output two consecutive JPEG images as a single frame.
> +        *
> +        * Check the buffer for a new SOI on JPEG streams and complete the
> +        * preceding buffer using EAGAIN, and invert the FID to make sure the
> +        * erroneous frame is not dropped.
> +        */
> +       if ((stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF) &&
> +           (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> +            stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> +               const u8 *packet = data + header_len;

                  Don't you have to validate that data[header_len+1]
can be read?
> +
> +               if ((packet[0] == 0xff && packet[1] == 0xd8) && buf->bytesused != 0) {

nit: maybe it would be nice to make a define for 0xd8 and say what it is
> +                       buf->state = UVC_BUF_STATE_READY;
> +                       buf->error = 1;
> +                       stream->last_fid ^= UVC_STREAM_FID;
> +                       return -EAGAIN;
> +               }
> +       }
> +
>         stream->last_fid = fid;
>
>         return header_len;
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda

