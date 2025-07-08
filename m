Return-Path: <linux-media+bounces-37101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D9AFC9C8
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 13:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB2F85647ED
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 11:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA972D9EC8;
	Tue,  8 Jul 2025 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lMoV19Kc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8110E267F4A
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751974947; cv=none; b=Oiw+S6b8XXsIPGDGMACXx498qcd38wJeQcfMBjhTVR5yvSFSsSoy5UiLw1+AdBjXzY/172hGoj/SQlKI0CmcxMnZPvngqEfq3WGezhcV64UVoEtPPN9/nQWqUKVHYBUKmk49bOXvmZu6F3yxZrPWjjO6lbMfbAxZA6kk/tCUz3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751974947; c=relaxed/simple;
	bh=43Z9jAExTDgPlB2NECimZoVwu77He8Bbm7eZHPDNSQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skYym5+4iW26+qFYGGuFDcpoWB+bc39SU+6xoCBGV46CRG9XnnIG0nvglupI+Zta+biACjE5fP01hUflDFDzlLeMnnA/jMR5iBFgyW7HPh+JPJMt0RYsYiyetFWI/CyZWsFSUTRyz/ZSro5BLYqtvmOpOLc/lDGUYgBptTKrZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lMoV19Kc; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553dceb342fso4051575e87.0
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 04:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751974943; x=1752579743; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qNfdRm5vOELAC7+NU2ZZz5F2GJLL3gg/MzR0Eij1Lxw=;
        b=lMoV19KcUEtkFj5acdFt5rL2Giqx1h0zT4JIlGlVeDAt1g6C9hFInQaiWcr6oxiVJ1
         gxeLLzLy3zMyclep9MQiztdeLd2z1XMmoU+RPJ4W1WlxSzlEKxDji84xv378kFLdls23
         pOHbmdg5j1kO8N8vOlZK9UbDBbBpzYVK5oRVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751974943; x=1752579743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNfdRm5vOELAC7+NU2ZZz5F2GJLL3gg/MzR0Eij1Lxw=;
        b=JFDntqOjyDOimV7AS0CHTXGaM/z3lUi185PMKRmUdyoYapWEPRs1B3mIeRq29qGh9S
         mroepFTO2CWaS7bxXVN37/FT3ubILTif3Z01a4W0OGn0HcdJ089aOExrYsh9KN92AOit
         wpbE+/VU3XmlCVndCkDdiogPq6p5QnSqh1qqtb8B2xTvArC87QRcik/aA+cQrgRFF6UA
         DjFiCySAzjZx76cAVRojvnHs+qgov2ctaLk2RawBNBKL+rU1E6a3AZ1HwnVztnZ1+UQi
         YfDC0n+gHJUjHBPmeOiz5MPB3u2neZt+eGHsK++uKdBVx2JRBJUMknJ2OF6/cUvWIFgx
         aX3A==
X-Forwarded-Encrypted: i=1; AJvYcCWp4beazL19aWJlob532K+GLi5cRu0O2EBEC/6a79XTAgr17xD9l6rP3yACBmMhmcgse0D3guiaHdgd2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsj5rmjJRxs+VKKGx/yhfyghDhELHD+0nJBBe61K2H+dWKzZ/
	EY/5wDk0WlqM/7snuz5R+j5o6X4FE1mbUqirUikhSM0895YgH+az252dEwLsCIGBW6qxBFjCsNE
	YT47bP8AL
X-Gm-Gg: ASbGncvrNGnnZwPQJM/sgkP32gFdajizAk13wD+4U7rJY03ZHrMl8KMYAaWnqQ1XrRO
	TXH0TtWtzc5+LpV/nLAEVh/9maIyCf2hUSThpLGPMdsCT1sgm9P/Npxmk3pQm2GQPVmgWVsejMi
	t1h+jHqzARqSF12q/tkCQ7RrqjbFmxq6pDOYWkuzcrY86ucXG9txtr3buC5vfdiCPGsNo4IQxuD
	Cuho6YnUBZ/JnTVWx5cCbdt/fTN4xZ1Odn4jsNYdcS4zfCzbdlQnHCIEU/qAK3y/ttY0r0KmNaH
	5yEd0xcxw1JCm1f5tRlk1TLP+VnGGcYWSUG+/1gZnE5Vc75aO6dAnFZZ1qCoS/UoZPGTlLFl3v7
	95uHlAf9dB1akPYAsHW5nqPoUxvmu
X-Google-Smtp-Source: AGHT+IFKk0rhtb2pq01G/JFnYwIR2t/4HgSbNhMmk6rlbzRbaS5pQf8PQsUXvSkW/+ZitgO6U++QBw==
X-Received: by 2002:a05:6512:234f:b0:553:aea0:6ee4 with SMTP id 2adb3069b0e04-557f8321876mr1089839e87.16.1751974943471;
        Tue, 08 Jul 2025 04:42:23 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c118bsm1638011e87.211.2025.07.08.04.42.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 04:42:22 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso36747801fa.0
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 04:42:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgD1pxnsKDMuf6ORyhZcHkra9B32P4G+bDhaRfAYXqN53S7low2h3SF01NUqpYa3jSXVU6a5LNnRuFsQ==@vger.kernel.org
X-Received: by 2002:a05:651c:31d9:b0:32f:22f8:a7bc with SMTP id
 38308e7fff4ca-32f39b12c44mr9486421fa.37.1751974942231; Tue, 08 Jul 2025
 04:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708104622.73237-1-hansg@kernel.org> <20250708104622.73237-2-hansg@kernel.org>
In-Reply-To: <20250708104622.73237-2-hansg@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 13:42:09 +0200
X-Gmail-Original-Message-ID: <CANiDSCvNJbJyq0Ur5kp8JxbOkasvET=j008P80WSdbyt31vZYA@mail.gmail.com>
X-Gm-Features: Ac12FXzHGNEnubEJp75-Ly2ha-biRI74DUo6fscO0fC3JXnCeiW-m07bgZFfN8c
Message-ID: <CANiDSCvNJbJyq0Ur5kp8JxbOkasvET=j008P80WSdbyt31vZYA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Use a count variable for meta_formats
 instead of 0 terminating
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

Indeed it looks nicer, thanks :)

On Tue, 8 Jul 2025 at 12:46, Hans de Goede <hansg@kernel.org> wrote:
>
> The code dealing with the 0 terminated meta_formats array is a bit klunky
> especially for the uvc_meta_v4l2_enum_formats() case.
>
> Instead of 0 terminating add an unsigned int nmeta_formats member to struct
> uvc_device and use that. This leads to slightly cleaner code.
>
Reviewed-by: Ricardo Ribalda <ribalda@chrium.org>
Tested-by: Ricardo Ribalda <ribalda@chromium.org> # Camera with
MSXU_CONTROL_METADATA
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 21 +++++++++------------
>  drivers/media/usb/uvc/uvcvideo.h     |  4 ++--
>  2 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 12972527ab8d..229e08ff323e 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -64,17 +64,16 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>         struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>         struct uvc_device *dev = stream->dev;
>         struct v4l2_meta_format *fmt = &format->fmt.meta;
> -       u32 fmeta = fmt->dataformat;
> -       u32 i;
> +       u32 fmeta = V4L2_META_FMT_UVC;
>
>         if (format->type != vfh->vdev->queue->type)
>                 return -EINVAL;
>
> -       for (i = 0; (fmeta != dev->meta_formats[i]) && dev->meta_formats[i];
> -            i++)
> -               ;
> -       if (!dev->meta_formats[i])
> -               fmeta = V4L2_META_FMT_UVC;
Super nitpick:
I'd have placed this here: and not at the beginning of the function,
to make clear my intentions.

 fmeta = V4L2_META_FMT_UVC;
> +       for (unsigned int i = 0; i < dev->nmeta_formats; i++)
> +               if (dev->meta_formats[i] == fmt->dataformat) {
> +                       fmeta = fmt->dataformat;
> +                       break;
> +               }
>
>         memset(fmt, 0, sizeof(*fmt));
>
> @@ -119,14 +118,12 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>         struct v4l2_fh *vfh = file->private_data;
>         struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>         struct uvc_device *dev = stream->dev;
> -       u32 i;
> +       u32 i = fdesc->index;
>
>         if (fdesc->type != vfh->vdev->queue->type)
>                 return -EINVAL;
>
> -       for (i = 0; (i < fdesc->index) && dev->meta_formats[i]; i++)
> -               ;
> -       if (!dev->meta_formats[i])
> +       if (i >= dev->nmeta_formats)
>                 return -EINVAL;
>
>         memset(fdesc, 0, sizeof(*fdesc));
> @@ -265,7 +262,7 @@ int uvc_meta_init(struct uvc_device *dev)
>                 dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;
>
>          /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> -       dev->meta_formats[i++] = 0;
> +       dev->nmeta_formats = i;
>
>         return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b34c1914ff39..757254fc4fe9 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -588,8 +588,8 @@ struct uvc_device {
>
>         const struct uvc_device_info *info;
>
> -       /* Zero-ended list of meta formats */
> -       u32 meta_formats[UVC_MAX_META_DATA_FORMATS + 1];
> +       u32 meta_formats[UVC_MAX_META_DATA_FORMATS];
> +       unsigned int nmeta_formats;
>
>         atomic_t nmappings;
>
> --
> 2.49.0
>


-- 
Ricardo Ribalda

