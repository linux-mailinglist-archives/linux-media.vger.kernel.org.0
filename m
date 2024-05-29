Return-Path: <linux-media+bounces-12142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FCE8D2DFF
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 09:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BAFD2841C5
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 07:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1A51667FA;
	Wed, 29 May 2024 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dtfsht42"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E525115CD6C
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716967237; cv=none; b=lgmBb3mb+Dscufo5RyLUBoNbsQl676ndr44DldbYswPR22vmPanPaTqthYUacqFUHT+wS2Hxe3wV8JwNehcZLMfd1Y6WW9DzkT3VZhrv7ZwbyLpJyJNZzAlpG4YPdMEkNrpG3qSNHeyOTEOVWUO/HHXb3YCqspVdXYMVXA2M58k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716967237; c=relaxed/simple;
	bh=RseO8Fq4ilRgMFHbMdVd3HicF/tAkkoL/zOtKS7kuxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC9uwdLX2mBmUeqF4lsUUQ660lSM3BrPoVCuHxmyuYnI2m2EdFs5iC6QJNYKUnuVTT9rPSPeeyZGrL0maxTnKEUk/8RCQ9757AHtflCooe6aFJniEe9uvIbqTFFRcVXFYWfBUwN3/4UFfYimPtPrV0mxcGOfeljA/gIAX4AZwII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dtfsht42; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f4851f7c28so14879935ad.3
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716967235; x=1717572035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrP0lC+ylsDVtkh+78zMfS99ubIeprL0D+84GsbfptA=;
        b=Dtfsht42+0udI/c9bT8nl+pfcSt4Uhc/xctDzjVSD6Ksb58OAyCeRp553/4psGThuU
         2UHLBJ5PHQrnIT1qnXVCUkHVtvS8uErLNrXjECXY9loQUlGCsVnJcG+DBD279W1PAB5U
         ZYhixfruySzK3YCZReF8CPD2Y8+MynVit5TO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967235; x=1717572035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrP0lC+ylsDVtkh+78zMfS99ubIeprL0D+84GsbfptA=;
        b=T38G/yBV52AgaxkEORaFj+kbNWnXh+fk1sVs8ohSdo1Nwc/YAC7yoFGa2KbTB5DUvv
         ibWgd4uVjPJNT9gCdKk9rNrEPn1x6FNuBqK/0kXU8Tr6o/e1gEG54yFZ2btNthWVdNjK
         JtLEnWWRZJK9adUOcXXSzDHSp+6ZCD3ZNkktqWoL72P7fkpIgPLp99dhUIKQbb+XbjTL
         s18u5Xm1dJD5TPdDZb0h7Ng4C1N5HD/tSwkRY5xsUF1zfr3Uo7bgpq6EMUMi0GS2IuhJ
         /mOFO7czrwpdhV+OB4xhE0DDKwIwQGWmUkRMFdFx06RUM4+4EjBmXtNgNNM6+5+p1mmP
         BLrw==
X-Forwarded-Encrypted: i=1; AJvYcCV+RuR1gQPx6D18c4bfDz6RcUkSb9SWBlWvqAxxiFbXZZuPo1xbOVON08eWEgpPaP71yq7yRFl3sKzRxc8r1+a9fbrj1PhnAekhAJI=
X-Gm-Message-State: AOJu0Yw+CZxI5pFY9dOj1RZjEv7eqCMVgKUUSF87B7YmAL/gaY7jgMk6
	mCLg5ewXk/JR3D7hDkbDho6neYkIcH6ihOLqGhWDETsbDlD1Iz/quk/lZgtPDQ==
X-Google-Smtp-Source: AGHT+IG0kGGFbfI2cecpO9ImlWQuyySlRGlMDeXY1V6VTJYeY6FsZiH4GA2/DyDB3fWtApC7L6O71Q==
X-Received: by 2002:a17:902:f54b:b0:1f4:b7ff:ac4f with SMTP id d9443c01a7336-1f4b7ffb0camr59885205ad.50.1716967235146;
        Wed, 29 May 2024 00:20:35 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f471f127c2sm72761645ad.13.2024.05.29.00.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 00:20:34 -0700 (PDT)
Date: Wed, 29 May 2024 16:20:31 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 3/6] media: uvcvideo: Quirk for invalid dev_sof in
 Logitech C922
Message-ID: <sb4gvafzk7fb2ohyeksegvyvnjccbyml7oj7nw6g5mvprk4brt@3mhm7we2eqwa>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-3-b08e590d97c7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323-resend-hwtimestamp-v10-3-b08e590d97c7@chromium.org>

On Sat, Mar 23, 2024 at 10:48:04AM +0000, Ricardo Ribalda wrote:
> Logitech C922 internal SOF does not increases at a stable rate of 1kHz.
> This causes that the device_sof and the host_sof run at different rates,
> breaking the clock domain conversion algorithm. Eg:
> 
> 30 (6) [-] none 30 614400 B 21.245557 21.395214 34.133 fps ts mono/SoE
> 31 (7) [-] none 31 614400 B 21.275327 21.427246 33.591 fps ts mono/SoE
> 32 (0) [-] none 32 614400 B 21.304739 21.459256 34.000 fps ts mono/SoE
> 33 (1) [-] none 33 614400 B 21.334324 21.495274 33.801 fps ts mono/SoE
> * 34 (2) [-] none 34 614400 B 21.529237 21.527297 5.130 fps ts mono/SoE
> * 35 (3) [-] none 35 614400 B 21.649416 21.559306 8.321 fps ts mono/SoE
> 36 (4) [-] none 36 614400 B 21.678789 21.595320 34.045 fps ts mono/SoE
> ...
> 99 (3) [-] none 99 614400 B 23.542226 23.696352 33.541 fps ts mono/SoE
> 100 (4) [-] none 100 614400 B 23.571578 23.728404 34.069 fps ts mono/SoE
> 101 (5) [-] none 101 614400 B 23.601425 23.760420 33.504 fps ts mono/SoE
> * 102 (6) [-] none 102 614400 B 23.798324 23.796428 5.079 fps ts mono/SoE
> * 103 (7) [-] none 103 614400 B 23.916271 23.828450 8.478 fps ts mono/SoE
> 104 (0) [-] none 104 614400 B 23.945720 23.860479 33.957 fps ts mono/SoE
> 
> Instead of disabling completely the hardware timestamping for such
> hardware we take the assumption that the packet handling jitter is
> under 2ms and use the host_sof as dev_sof.
> 
> We can think of the UVC hardware clock as a system with a coarse clock
> (the SOF) and a fine clock (the PTS). The coarse clock can be replaced
> with a clock on the same frequency, if the jitter of such clock is
> smaller than its sampling rate. That way we can save some of the
> precision of the fine clock.
> 
> To probe this point we have run three experiments on the Logitech C922.
> On that experiment we run the camera at 33fps and we analyse the
> difference in msec between a frame and its predecessor. If we display
> the histogram of that value, a thinner histogram will mean a better
> meassurement. The results for:
> - original hw timestamp: https://ibb.co/D1HJJ4x
> - pure software timestamp: https://ibb.co/QC9MgVK
> - modified hw timestamp: https://ibb.co/8s9dBdk
> 
> This bug in the camera firmware has been confirmed by the vendor.
> 
> lsusb -v
> 
> Bus 001 Device 044: ID 046d:085c Logitech, Inc. C922 Pro Stream Webcam
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x046d Logitech, Inc.
>   idProduct          0x085c C922 Pro Stream Webcam
>   bcdDevice            0.16
>   iManufacturer           0
>   iProduct                2 C922 Pro Stream Webcam
>   iSerial                 1 80B912DF
>   bNumConfigurations      1
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
>  drivers/media/usb/uvc/uvc_video.c  | 11 +++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index bbd90123a4e76..723e6d5680c2e 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2574,6 +2574,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT) },
> +	/* Logitech HD Pro Webcam C922 */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x046d,
> +	  .idProduct		= 0x085c,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
>  	/* Chicony CNF7129 (Asus EEE 100HE) */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index b2e70fcf4eb4c..d6ca383f643e3 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -558,6 +558,17 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	stream->clock.last_sof = dev_sof;
>  
>  	host_sof = usb_get_current_frame_number(stream->dev->udev);
> +
> +	/*
> +	 * On some devices, like the Logitech C922, the device SOF does not run
> +	 * at a stable rate of 1kHz. For those devices use the host SOF instead.
> +	 * In the tests performed so far, this improves the timestamp precision.
> +	 * This is probably explained by a small packet handling jitter from the
> +	 * host, but the exact reason hasn't been fully determined.

Given that the counter increases at a low frequency (1 kHz), we have a
millisecond from when the frame is received to go into
uvc_video_clock_decode() and read it, which should be quite realistic in
normal conditions.

I suspect that under a relatively high interrupt load, with interrupts
of higher priority than USB host, we could end up with more jitter, but
it should be still better compared to the broken hw timestamp behavior
and not worse than sw timestamp, because that would be subjected to many
more factors introducing jitter.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

