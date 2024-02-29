Return-Path: <linux-media+bounces-6196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D80D286D1F1
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 19:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79BAA1F240F3
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 18:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391A07A130;
	Thu, 29 Feb 2024 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QNUL5IJt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7078270
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 18:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230874; cv=none; b=ts47+vej1r5bIXoqxeD9JAoduQWLqfAmdQX5Ehr61jUS3dpU1Ite0IoC34UWPVPfe/+UUkZ8X7ESle43tZh5VUDXZsOEwrGI1LUEG6xarOUxg/KkBPEXLxDmlcmcBHq0O4uwI8lrfAo6+uuCFnpTfxt3Cp6z9ghwOB1HFL6ld8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230874; c=relaxed/simple;
	bh=6URP3Ds0u1PbWJz6vrGB6hFeTqqwpMnTxISizxF7jUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rL4HTvRQNRbB4QbNC00Q3ZLP+m7enefDHQPhzlNHeIg39sFH7Hi/d/DcFq0TBhrAdSCXcjhOzmkyEbZGpH5561uAu1eaHlcxZtDM5f+ZzooyX36byK7sqPz5CHFD5dAfUwN8yDO0RGIPzZufdiax1yCwOq5of1Dyu0Q0INRp2aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QNUL5IJt; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-21edca2a89dso622072fac.3
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 10:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709230872; x=1709835672; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=coF2Crmlhb1FW6THGiXNdR+FS2vkbtT+MwPkcCLE6Nw=;
        b=QNUL5IJtm/RrXUppI6SVYAhgO8/xGQQMUaykr1EGwjdN9SGE8OHOogyU213eyC8OGj
         44Vkp84UCkMEf0HbKAFv4xAAY7oBfsEQLgTRqbmmkbjX5m910SCnXZUeb+65bLgoOzQR
         fJOEnhhp5L0Fh4PZzYKz5cw3ixAp5IgjSjjjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709230872; x=1709835672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coF2Crmlhb1FW6THGiXNdR+FS2vkbtT+MwPkcCLE6Nw=;
        b=aIq+2ZoxcUSmB3d1BeumxEG45qRNABtOPevYxW1BbRyUZBqFLCKk0GhcpI6ZGDH7Zl
         E1gfmozCj+GWQp7KdB8cBV1j0RBNghPXe6iY97mbTcxxJSTkyz+KPnwoQlGMocJCH/HA
         7HlA4pn0xbH/eQlkyHGXQguU+GIweS4aUbxX6BUl0hFrwV5c/HYWY2ckqPsjg1JBr0/N
         98eLXl260svH1lq28mP6mPxZBj1g5NeFOPRrtvrEyjsVyjxUm+IW67hmYSdQXTU8kiQg
         jnhTsDespLu4KgELkoiQvPk8BN42Q5TZCVqovWqzdJ63X4t37rt47ffbTmUcc7qRk9iP
         2img==
X-Forwarded-Encrypted: i=1; AJvYcCXWArFK/pSU5p6uJaZb6WJdVgyfgvANqMhgIEzxghITGSf40l9D0jQilzGcfrlncFFb4Oe598iH+8+NR7MjxDUT11x3Yi5WjRjtcvM=
X-Gm-Message-State: AOJu0YzGb/FodJONrTvqX9IpxwBDscsB6L4bQWO0VqQhGhK2z3l4YgWb
	JXSbimnOQEb6oB+DtztxDY5fOyDZwDzJww6d9TRtjPLfafaxlWzpz3uQwn7YI7hXylfdsvGQXyc
	=
X-Google-Smtp-Source: AGHT+IHaInQUl4qcDvNDtK5Qt3115WEBz6waCJ2EFE+JNF9WvZnOnLyT9wRbkdBUnBedbJv9XNJVDw==
X-Received: by 2002:a05:6871:7717:b0:21e:528f:54e9 with SMTP id ov23-20020a056871771700b0021e528f54e9mr2178723oac.18.1709230871802;
        Thu, 29 Feb 2024 10:21:11 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id r9-20020ac87949000000b0042e67a04eddsm936875qtt.65.2024.02.29.10.21.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 10:21:11 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-68fb3a3f1c5so6307516d6.3
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 10:21:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWe21iZWv2S5Y7OVl3mLYtdiqfjIHfrQVX+SHB6Excpd4w0ssmY8P5hFvO9jpJsNYXUDEVsXWcIBvXprZImbcYSgCXp3rFdUWCZPeM=
X-Received: by 2002:a05:6214:b29:b0:690:4a75:d9aa with SMTP id
 w9-20020a0562140b2900b006904a75d9aamr1873343qvj.56.1709230870341; Thu, 29 Feb
 2024 10:21:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-uvc-host-video-decode-start-v2-1-88c6e17e487a@pengutronix.de>
In-Reply-To: <20240221-uvc-host-video-decode-start-v2-1-88c6e17e487a@pengutronix.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 29 Feb 2024 19:20:53 +0100
X-Gmail-Original-Message-ID: <CANiDSCtCse74oK_nCcJXRRQ__RnAAfYEFzfftty58stsFVKoYg@mail.gmail.com>
Message-ID: <CANiDSCtCse74oK_nCcJXRRQ__RnAAfYEFzfftty58stsFVKoYg@mail.gmail.com>
Subject: Re: [PATCH v2] uvc_video: check for fid change early in decode_start
 and avoid wrong error counting
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Hi Michael

So if my understanding is correct, what you want to achieve is to
avoid double stats_decode when the function returns -EAGAIN.

Wouldn't it be simpler to simply move uvc_video_clock_decode() and
uvc_video_stats_decode() before

stream->last_fid = fid;

just at the end of the function? Or am I missing something?

Besides being a small and documented function,
uvc_video_decode_start() is difficult to follow :), So I might be
saying something stupid

Regards



On Sat, 24 Feb 2024 at 23:52, Michael Grzeschik
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
> Changes in v2:
> - Moved the EAGAIN bailout after the sequence handling as mentioned by Ricardo Ribalda
> - Link to v1: https://lore.kernel.org/r/20240221-uvc-host-video-decode-start-v1-1-228995925c70@pengutronix.de
> ---
>  drivers/media/usb/uvc/uvc_video.c | 64 +++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 7cbf4692bd875..af368c45c4297 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1068,6 +1068,15 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
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
> @@ -1076,20 +1085,34 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>                 stream->sequence++;
>                 if (stream->sequence)
>                         uvc_video_stats_update(stream);
> +
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
>         }
>
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
> base-commit: e89fbb5bc21a10a0de2bb878d4df09f538dc523b
> change-id: 20240221-uvc-host-video-decode-start-af53df5924cd
>
> Best regards,
> --
> Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>


-- 
Ricardo Ribalda

