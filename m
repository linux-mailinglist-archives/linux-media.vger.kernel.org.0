Return-Path: <linux-media+bounces-24298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F32A028DB
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 16:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6241C188559C
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 15:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF72A14F9E7;
	Mon,  6 Jan 2025 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OCTKZehE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CE081728
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736176452; cv=none; b=fULMZj/+Kh3n0k92bt7LIHKCk8usLEXJ5irZGZUnTu9O0rV4DBItOgl1K0iiKkhKCk/Hpq0u2CRozwaScyNM5lTVbPWHVBLqFB5Ro9DcFuaT3aB78i+1tM5Kl1cpH2Ff5TIroh2EoFzhUtkk0v12jjpTC79jQ01CJnte95wIIdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736176452; c=relaxed/simple;
	bh=0djxR5MjRKCwcSrtrQnqzRXHsKULLN9SHGYzjFDWYw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3zbgstTEhtzf/41+2sKF5oUdDAu0Jh9sqSAVKLTOqHnPHBxjOf3iQFt4xY36H6LbiIsGw7U+MGPuy9OUjV641sh8/FR9SvP0y2RfawW27oIIo2p40UvKDyYU8ulePk/Zz9zOL6lE+OeqZe1d6L4ljYpKUrFJHNYAEPv38K47Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OCTKZehE; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso187901361fa.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 07:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736176448; x=1736781248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6dKu2YLtzaHc/am3Oz/sUW0/k6vy9oGuzJQ9pclRxRY=;
        b=OCTKZehEQCOsqHi+BpmYx8mcPq43041TLWWiwpyg03JSuA6hhAjLp9rygGg9PzY5pu
         t9l/hogXXezAEbLktsAEOzb082x12lFdF2U+N1KK7W++0CBfgY9GcJ4MJblUJGiPbQR8
         PBBHPgred30C1y3a3sBhg4bLJl3aNHJdvkGyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736176448; x=1736781248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dKu2YLtzaHc/am3Oz/sUW0/k6vy9oGuzJQ9pclRxRY=;
        b=DRfduIirwt+FLFkzwwGaibc221Aa73eIBdMWBzooqIFH5sVC5cI6/zETkAHJ5YfXnQ
         s5Ld2bp0aoPsarbd7YtQi/E1H7MxJV8T9hSRWFwgdOQDYQNKOhDb6daQUmlgaWs7I7EC
         XFkt7F6z9Ggi7ewgPcKhwEv3KEJ4UILgFt0IaQq3NKztBSLR4iz/aj2qK6nowTUvEnoY
         kOlO5U5QBqpt+Se7iNzWShGSaIJ5ZTVcCw3QFHrH5vw1imMQcmOecqz15qW005Wa+c6l
         XtrD9TFx2whLCQ1MW6wO3yd96dT7bhrXCz30fV9+IhlY1WbRcHBDlf/8dcZe1yshGEB4
         SLkA==
X-Forwarded-Encrypted: i=1; AJvYcCVmG5+Nb9syIHmUU03kbtxLt7AFBq5RNWmi5CGOGKYMl3qnVSnrHr5es65Z9aGryqMh2UWdyU1YI67/4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK/J9aACIH8C6AfgfqPHU5iInAXVMguZnl3rXw3RSf4hjurIFv
	w1eWmvsSV2NB7nM5wtkaDNEpfZzWDefvSB7feFys8erEHfUwBwo0W/FOkqUlwwONQreWP/+fjFc
	EFw==
X-Gm-Gg: ASbGncuQEyG9B75E4q7Qq3UGOosPxuV0ZaauXvnYBoFIxeAlbHVvMZ3DXuYQ+R/t9IL
	oMGo63uzUd90rJV6vLb9DtCoBczUu4Vjey2YRWOZO4uPyGlWEmjLxitvD4EbIMaIKcoOJC5VZB+
	5t9MJkiG2KKWb9AgwpGfpQlmyiMTBMCp1Nv04P57+N3jzPAtZT0gTa3UruYUkPpYKCBlqS3FnYu
	RGyU7qogDhxXSZpUiDgwOzwMiGF5MllbGd3mBH4EhGHNQmJ1ZDgM4pjpRYQzUY6zgtT8y6TI6P0
	W4XMpMeJ7OaGcJ7tu5g=
X-Google-Smtp-Source: AGHT+IHgeHr9lFsbvOgFYgEnicOCPcij+gEdkx+M2PVaYf6mWaKJ3QCFmRzfsZTNpDOwrum0tCHrzw==
X-Received: by 2002:a05:6512:3d10:b0:53e:350a:72a0 with SMTP id 2adb3069b0e04-54229598a27mr18782427e87.51.1736176448323;
        Mon, 06 Jan 2025 07:14:08 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813665sm4999511e87.146.2025.01.06.07.14.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 07:14:07 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so14395692e87.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 07:14:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWX5F6Tdi84f2VM5p4NrlaHo+imCqW56QQYirKM83VY8ZD4HsrghktzLwKVYpFav18Z/H3CvYUHfYtY6A==@vger.kernel.org
X-Received: by 2002:a05:6512:2252:b0:540:1faa:5945 with SMTP id
 2adb3069b0e04-54229550e39mr19014694e87.33.1736176446622; Mon, 06 Jan 2025
 07:14:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106140923.56896-1-hdegoede@redhat.com> <20250106140923.56896-2-hdegoede@redhat.com>
In-Reply-To: <20250106140923.56896-2-hdegoede@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 6 Jan 2025 16:13:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCvTBzLqd-zJtvFE6_z_o0E6w8SfCiqOxJJ9Lk76YQtZhQ@mail.gmail.com>
X-Gm-Features: AbW1kvYWOqqjZJcqkmhRLiq388GUCkTZl5aa_mw3kncD2zHiTNzFYCeAua1IZVI
Message-ID: <CANiDSCvTBzLqd-zJtvFE6_z_o0E6w8SfCiqOxJJ9Lk76YQtZhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Add a UVC_FIVAL_DENOM define
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jan 2025 at 15:09, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add a define for the UVC frame interval denominator of 10000000
> instead of hardcoding 10000000 everywhere.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c |  4 ++--
>  drivers/media/usb/uvc/uvc_v4l2.c   | 16 ++++++++--------
>  drivers/media/usb/uvc/uvc_video.c  |  4 ++--
>  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
>  4 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index c3ccd9be0a47..f754640fddf5 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -320,8 +320,8 @@ static int uvc_parse_frame(struct uvc_device *dev,
>
>         uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
>                 frame->wWidth, frame->wHeight,
> -               10000000 / frame->dwDefaultFrameInterval,
> -               (100000000 / frame->dwDefaultFrameInterval) % 10);
> +               UVC_FIVAL_DENOM / frame->dwDefaultFrameInterval,
> +               ((UVC_FIVAL_DENOM * 10) / frame->dwDefaultFrameInterval) % 10);
I wish there was a nicer way for this expression than
((a*10)%b) % 10
I would have simply written.
"%u 1/10 fps.


>
>         *intervals += n;
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 93c6cdb23881..301999e94759 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -282,8 +282,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>         interval = frame->dwDefaultFrameInterval;
>         uvc_dbg(stream->dev, FORMAT,
>                 "Using default frame interval %u.%u us (%u.%u fps)\n",
> -               interval / 10, interval % 10, 10000000 / interval,
> -               (100000000 / interval) % 10);
> +               interval / 10, interval % 10, UVC_FIVAL_DENOM / interval,
> +               ((UVC_FIVAL_DENOM * 10) / interval) % 10);
>
>         /* Set the format index, frame index and frame interval. */
>         memset(probe, 0, sizeof(*probe));
> @@ -450,7 +450,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
>         numerator = stream->ctrl.dwFrameInterval;
>         mutex_unlock(&stream->mutex);
>
> -       denominator = 10000000;
> +       denominator = UVC_FIVAL_DENOM;
>         v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
>
>         memset(parm, 0, sizeof(*parm));
> @@ -551,7 +551,7 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
>
>         /* Return the actual frame period. */
>         timeperframe.numerator = probe.dwFrameInterval;
> -       timeperframe.denominator = 10000000;
> +       timeperframe.denominator = UVC_FIVAL_DENOM;
>         v4l2_simplify_fraction(&timeperframe.numerator,
>                 &timeperframe.denominator, 8, 333);
>
> @@ -1240,17 +1240,17 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
>                 fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
>                 fival->discrete.numerator =
>                         frame->dwFrameInterval[index];
> -               fival->discrete.denominator = 10000000;
> +               fival->discrete.denominator = UVC_FIVAL_DENOM;
>                 v4l2_simplify_fraction(&fival->discrete.numerator,
>                         &fival->discrete.denominator, 8, 333);
>         } else {
>                 fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
>                 fival->stepwise.min.numerator = frame->dwFrameInterval[0];
> -               fival->stepwise.min.denominator = 10000000;
> +               fival->stepwise.min.denominator = UVC_FIVAL_DENOM;
>                 fival->stepwise.max.numerator = frame->dwFrameInterval[1];
> -               fival->stepwise.max.denominator = 10000000;
> +               fival->stepwise.max.denominator = UVC_FIVAL_DENOM;
>                 fival->stepwise.step.numerator = frame->dwFrameInterval[2];
> -               fival->stepwise.step.denominator = 10000000;
> +               fival->stepwise.step.denominator = UVC_FIVAL_DENOM;
>                 v4l2_simplify_fraction(&fival->stepwise.min.numerator,
>                         &fival->stepwise.min.denominator, 8, 333);
>                 v4l2_simplify_fraction(&fival->stepwise.max.numerator,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 7efed64b81a2..41cb1b45fa23 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -231,7 +231,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>                 u32 interval;
>                 u32 bandwidth;
>
> -               interval = (ctrl->dwFrameInterval > 100000)
> +               interval = (ctrl->dwFrameInterval > (UVC_FIVAL_DENOM / 100))
>                          ? ctrl->dwFrameInterval
>                          : frame->dwFrameInterval[0];
>
> @@ -243,7 +243,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>                  * header size (assumed to be 12 bytes long).
>                  */
>                 bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
> -               bandwidth *= 10000000 / interval + 1;
> +               bandwidth *= UVC_FIVAL_DENOM / interval + 1;
>                 bandwidth /= 1000;
>                 if (stream->dev->udev->speed >= USB_SPEED_HIGH)
>                         bandwidth /= 8;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 3d196a696f46..966ff82c2ba8 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -41,6 +41,8 @@
>  #define UVC_EXT_GPIO_UNIT              0x7ffe
>  #define UVC_EXT_GPIO_UNIT_ID           0x100
>
> +#define UVC_FIVAL_DENOM                        10000000
> +
>  /* ------------------------------------------------------------------------
>   * Driver specific constants.
>   */
> --
> 2.47.1
>
>


-- 
Ricardo Ribalda

