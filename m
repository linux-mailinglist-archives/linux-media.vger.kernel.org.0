Return-Path: <linux-media+bounces-5800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D58613A2
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 15:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B163281ACB
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 14:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BFC80036;
	Fri, 23 Feb 2024 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V10aeQA/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBCF7E798
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708697401; cv=none; b=u52BUM1yLyKDQVWNRSzA5aFfKrBJhai9oMFUk9O40Zydh16f87C+/Am9Aaek+Uxk+a5uYH/oB4Jz098qEvtBhu3OjUZfZ14VDjQrWAUNzP3Fr0DoJXUEG+8QbCGYyj4mhWbA5S5aDgMl5GOzmP7rA4V6xaxANWXpd32MtuMrdE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708697401; c=relaxed/simple;
	bh=3G+g6BllPc9uaOzGwZYVR1zgjhxCkWMKXZdNcBY+4oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjSBzv+2o5YBWcy7xZTUAQH2tGGKNanKuzcH9y/7Nyn3WcSeQxXFZJcgmhUyE1KFiuhgD5R/vyc8slUAUtTKli8l8GOCIjjzszkwDJL/xZCNUIB0vjxNMZ0aJx2X3FYsIHazdEMbFquZH5tlHQ6v0chUO8MJwhiucx6sA/19Tgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V10aeQA/; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-608959cfcbfso4481467b3.3
        for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 06:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708697397; x=1709302197; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eAPyItCVDT4gWeCeZAeUVS+cG21PhVeYpJuB3UozBoI=;
        b=V10aeQA/QH/Hn1FWKsMdj0/Shn5WVt++h15iqdhEaodT4qTsmo4swkMQlZMz3NjFQF
         sQG0AHy3rlPPBi5ZHi5IaMyFOI545NKnQYtqxxPBlLOngysG+X70y250EzdIPFdzLx7u
         T3Jjqfu5UwKCXqxEZPPY4txj/W6bIbjVKPKgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708697397; x=1709302197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAPyItCVDT4gWeCeZAeUVS+cG21PhVeYpJuB3UozBoI=;
        b=X/qKNU11/FlPT7SQHvufgXtQJRmPTWCYihV83qui/W5aLwa2JdFOX24wdG5AB8/RKg
         PPU0FRB/as//6ruBrDVA4NxrAjJgGNTgWGJ9lcAeDKM0w5bWwHfN/YqU+bA29KUVmYXK
         mn5+H8g9FWNEH6b38ALnc0juPR8So9WKl8PoI23TPDcs9jqYytxgfIv3FMlqNxAwEPHa
         YJj03TMoOSeLzQBN5tbwEMRkFt0anteQXtIR+fRohMP8DE48c4qtn/Hmxp92hMkPekvX
         +Z9riKxAi0smndApLnzY1OTtfOyza1DLxKm3qEg0xG3BogRC9ymSgD30I5T6IN8xvqrp
         fwDw==
X-Forwarded-Encrypted: i=1; AJvYcCWuK2Z4cJ/0g8YAY2i7uOFuRKPWY8YaU7nR/iLh3cib2Vvrif0rMmsaNoEJuE2oPUQJeQeTmO4cC0lPAZ9NoXVa0nDhDsPuMEloM1Y=
X-Gm-Message-State: AOJu0YxPA5zpOU8qeAMregMFQZsJ9YthopchWISe7qIhOCB+Fc/hN5YZ
	x5lBymA6IHEqR/ltAdlR+KlSrI8H6OPCPpKiqC17lyTFsqkzl55sl74fZtG+J2XZ0C0Gz0fMeew
	=
X-Google-Smtp-Source: AGHT+IEQOpdS7nmiYjTt+3+iWuYWvNR1QZOl13X6xnULH1HF4ivv78m+N7qGkVtScomH/HzMf3ZG0Q==
X-Received: by 2002:a81:b660:0:b0:607:db57:b25d with SMTP id h32-20020a81b660000000b00607db57b25dmr2525871ywk.17.1708697397177;
        Fri, 23 Feb 2024 06:09:57 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id i79-20020a816d52000000b00608b1597facsm506696ywc.137.2024.02.23.06.09.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 06:09:56 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-608342633b8so4037847b3.1
        for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 06:09:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMwQRfvl6qDAVoFEJBbR+CHdMd3EzZQJCLEdcKFpR27++WR57xIMSYWOGtLnUbUsoCNyKsAiIf4BqNu/ZYPu4uQyRqSJbqn8LcbP0=
X-Received: by 2002:a05:690c:97:b0:5ff:42f2:ef75 with SMTP id
 be23-20020a05690c009700b005ff42f2ef75mr2664803ywb.16.1708697395524; Fri, 23
 Feb 2024 06:09:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-uvc-host-video-decode-start-v1-1-228995925c70@pengutronix.de>
In-Reply-To: <20240221-uvc-host-video-decode-start-v1-1-228995925c70@pengutronix.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 Feb 2024 15:09:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCtFRugwLX-9jLUwkvxxvO2EFZES6899qcdfnoeQwX3fOQ@mail.gmail.com>
Message-ID: <CANiDSCtFRugwLX-9jLUwkvxxvO2EFZES6899qcdfnoeQwX3fOQ@mail.gmail.com>
Subject: Re: [PATCH] uvc_video: check for fid change early in decode_start and
 avoid wrong error counting
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Hi Michael

In your code when is  uvc_video_stats_update() called or
stream->sequence incremented in normal use case?

I might be interpreting it wrong, but it seems like if buf->bytesused
is !=0 that code is never called.

Regards!


On Wed, 21 Feb 2024 at 23:53, Michael Grzeschik
<m.grzeschik@pengutronix.de> wrote:
>
> When the uvc request will get parsed by uvc_video_decode_start it will
> leave the function with -EAGAIN to be restarted on the next frame. While
> the first wrong parse the statistics will already be updated with
> uvc_video_stats_decode.
>
> One value e.g. is the error_count, which therefor will be incremented
> twice in case the fid has changed on the way. This patch fixes the
> unnecessary extra parsing by returning early from the function when the
> fid has changed.
>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 64 +++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 7cbf4692bd875..fce5349b5f9fa 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1068,11 +1068,43 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>
>         fid = data[1] & UVC_STREAM_FID;
>
> +       /*
> +        * Store the payload FID bit and return immediately when the buffer is
> +        * NULL.
> +        */
> +       if (buf == NULL) {
> +               stream->last_fid = fid;
> +               return -ENODATA;
> +       }
> +
>         /*
>          * Increase the sequence number regardless of any buffer states, so
>          * that discontinuous sequence numbers always indicate lost frames.
>          */
>         if (stream->last_fid != fid) {
> +               /*
> +                * Mark the buffer as done if we're at the beginning of a new frame.
> +                * End of frame detection is better implemented by checking the EOF
> +                * bit (FID bit toggling is delayed by one frame compared to the EOF
> +                * bit), but some devices don't set the bit at end of frame (and the
> +                * last payload can be lost anyway). We thus must check if the FID has
> +                * been toggled.
> +                *
> +                * stream->last_fid is initialized to -1, so the first isochronous
> +                * frame will never trigger an end of frame detection.
> +                *
> +                * Empty buffers (bytesused == 0) don't trigger end of frame detection
> +                * as it doesn't make sense to return an empty buffer. This also
> +                * avoids detecting end of frame conditions at FID toggling if the
> +                * previous payload had the EOF bit set.
> +                */
> +               if (buf->bytesused) {
> +                       uvc_dbg(stream->dev, FRAME,
> +                               "Frame complete (FID bit toggled)\n");
> +                       buf->state = UVC_BUF_STATE_READY;
> +                       return -EAGAIN;
> +               }
> +
>                 stream->sequence++;
>                 if (stream->sequence)
>                         uvc_video_stats_update(stream);
> @@ -1081,15 +1113,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>         uvc_video_clock_decode(stream, buf, data, len);
>         uvc_video_stats_decode(stream, data, len);
>
> -       /*
> -        * Store the payload FID bit and return immediately when the buffer is
> -        * NULL.
> -        */
> -       if (buf == NULL) {
> -               stream->last_fid = fid;
> -               return -ENODATA;
> -       }
> -
>         /* Mark the buffer as bad if the error bit is set. */
>         if (data[1] & UVC_STREAM_ERR) {
>                 uvc_dbg(stream->dev, FRAME,
> @@ -1124,29 +1147,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>                 buf->state = UVC_BUF_STATE_ACTIVE;
>         }
>
> -       /*
> -        * Mark the buffer as done if we're at the beginning of a new frame.
> -        * End of frame detection is better implemented by checking the EOF
> -        * bit (FID bit toggling is delayed by one frame compared to the EOF
> -        * bit), but some devices don't set the bit at end of frame (and the
> -        * last payload can be lost anyway). We thus must check if the FID has
> -        * been toggled.
> -        *
> -        * stream->last_fid is initialized to -1, so the first isochronous
> -        * frame will never trigger an end of frame detection.
> -        *
> -        * Empty buffers (bytesused == 0) don't trigger end of frame detection
> -        * as it doesn't make sense to return an empty buffer. This also
> -        * avoids detecting end of frame conditions at FID toggling if the
> -        * previous payload had the EOF bit set.
> -        */
> -       if (fid != stream->last_fid && buf->bytesused != 0) {
> -               uvc_dbg(stream->dev, FRAME,
> -                       "Frame complete (FID bit toggled)\n");
> -               buf->state = UVC_BUF_STATE_READY;
> -               return -EAGAIN;
> -       }
> -
>         stream->last_fid = fid;
>
>         return data[0];
>
> ---
> base-commit: 3bf0514dc6f36f81ee11b1becd977cb87b4c90c6
> change-id: 20240221-uvc-host-video-decode-start-af53df5924cd
>
> Best regards,
> --
> Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>


-- 
Ricardo Ribalda

