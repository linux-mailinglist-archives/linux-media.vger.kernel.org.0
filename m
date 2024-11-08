Return-Path: <linux-media+bounces-21190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA719C24B7
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 19:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C424282109
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 18:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B91D193418;
	Fri,  8 Nov 2024 18:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TfCDS54U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BB7233D8A
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 18:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731089769; cv=none; b=IMcPKFSMHPXQkNKWrOncNhnwdM39Re7YlihhUwfzvVbfN3W0/WhSq5QbjqyqaHvSBZXzTlYTRbde1L+zetPM78Ra8lUrQ1Aq/Od4I2Y70uLTiuWFo9Dn9BsVOCEYMEyRsXW0g7g7KAOdWLblwcMP2OJowMxuZQjRSLvl8Ap+7cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731089769; c=relaxed/simple;
	bh=GMwC/+I9TRMp/LCP8HTjspo1gFnHc2HHBdsaZP7p4Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOEbbYhVlWWOWjWoOZIAx13hdNR42aMJKExG35ShXbsSLwrB1nv6AGoHFLyYT++1doCoQHBrhu0/IXWI5c8rqzj0z14DsbRO1VW5oMNLVYd6wltw390UkVJg+x/CEF7C3rA1HTqHrTTTR4EjTOZJiq/SI5KlwwPCr6Zq+00dQHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TfCDS54U; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c70abba48so26094075ad.0
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731089765; x=1731694565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=03IJj+nW0S5xdU2vx+3DRRZ41y5wPn9JpwMME7PwAzY=;
        b=TfCDS54U1c8xFkZ8Df8G9OQq9klYjHzDb+W/6PkcJ/Dis4nxoD5cBTqaUUZnYeEaTJ
         rifirBwPPJkumoF2KPVwuJWWm8nGkz2pB1stYugwzodGP6szBcy1/Xf8XFGrKTTjWSpk
         mCDBVl1b3m6BRGdj6vouuJ1kHMjGvwedwkphI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731089765; x=1731694565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03IJj+nW0S5xdU2vx+3DRRZ41y5wPn9JpwMME7PwAzY=;
        b=fRDQ2JW8F2rukfTsuZG1GU7ZHJQUwh6oJEwIk0W6dprx39wuPeQqfRLPTNNnRh/pYe
         i7tAc/bIjCx2eNmcF7gtn4xtepx4/+Akxtv3LptmB5iSh8JvLA8Jrt5kswOTjD+mUeRE
         rQYZlHewJDYbZvJe5GVqZmUGVCysrbVSqcYPa3ugY6Gf/nNPczkpN4pcNjpit/ctMtc4
         qayU2xdW6DsFfL1YKa+hIA8gpmXDyJ1wnyGO6vnefGGKhe/v+iOWxEDMf8nBnCOLV4IJ
         +fN0xGk6IDby5HprfQVJxAAhJOBn250wl+CHbjrGRaHD4TkCKQ/QXIvNpjqSTxyOE7Zf
         l8vw==
X-Forwarded-Encrypted: i=1; AJvYcCX1WPgA6G6ZNn+4Ca691vmgr8/rZ7F2v2TiVR3ty1AK0LS2O3WcXaaw5zcZqTjAQ+n8D4+3IfntDLtLzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzFoqXB9CE3Ca6iYWd/lA6EdHlcKrIcW6MNsYawh6InbhEbV0L
	83NvSNIIAcQuuLXfcbixW6e8XnJgbPLUsddGd0/0qJLxaNyJR69AYjvz4b/5q2ihHhUtuIJHIMI
	=
X-Google-Smtp-Source: AGHT+IEOT85OKKFQHPUQg64Gz8bB0bTL6/zD9ZqldXlwOxWP6VrqR4oRwOCiT7wVjUPDFLh5s2gmGA==
X-Received: by 2002:a17:902:e746:b0:20c:9983:27be with SMTP id d9443c01a7336-21183cf0a04mr41225015ad.27.1731089765530;
        Fri, 08 Nov 2024 10:16:05 -0800 (PST)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e4278dsm33363915ad.159.2024.11.08.10.16.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 10:16:05 -0800 (PST)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ee51d9ae30so1901910a12.1
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 10:16:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAbwefWL3v4jmAnZzqJ/bbzkvRLFJiT9SslfJXalJofMAQooFBsojoSLOgXEA4ngQ9T+2evUne9cDgaw==@vger.kernel.org
X-Received: by 2002:a17:90b:1c8d:b0:2e0:8719:5f00 with SMTP id
 98e67ed59e1d1-2e9b173c3admr5706892a91.22.1731089764299; Fri, 08 Nov 2024
 10:16:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108142310.19794-1-isaac.scott@ideasonboard.com> <20241108142310.19794-3-isaac.scott@ideasonboard.com>
In-Reply-To: <20241108142310.19794-3-isaac.scott@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 8 Nov 2024 19:15:51 +0100
X-Gmail-Original-Message-ID: <CANiDSCuyWrZqsvO_R=5AGuPXHyLjx8PAU_wPXjzDRi6-5EiuXg@mail.gmail.com>
Message-ID: <CANiDSCuyWrZqsvO_R=5AGuPXHyLjx8PAU_wPXjzDRi6-5EiuXg@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: Add new quirk definition for the
 Sonix Technology Co. 292a camera
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HI


I think it makes more sense to swap the order to patches 2 and 3 and move the
#define UVC_QUIRK_MJPEG_NO_EOF          0x00020000
to media: uvcvideo: Implement dual stream quirk to fix loss of usb packets

Also when we send quirks we send to the ML the output of lsusb -v 0c45:6366

On Fri, 8 Nov 2024 at 15:24, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
>
> Add the definition of a new quirk that supports the Sonix Technology
> Co. 292A camera, which uses the AR0330 sensor. The camera supports the
> output of two simultaneous streams, which need to be handled
> appropriately by the driver.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  drivers/media/usb/uvc/uvcvideo.h   | 1 +
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 0fac689c6350..15aee3f2b5f9 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2752,6 +2752,15 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = (kernel_ulong_t)&uvc_quirk_probe_minmax },
> +       /* Sonix Technology Co. Ltd. - 292A IPC AR0330 */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x0c45,
> +         .idProduct            = 0x6366,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
>         /* MT6227 */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b7d24a853ce4..116b1e383c25 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -76,6 +76,7 @@
>  #define UVC_QUIRK_NO_RESET_RESUME      0x00004000
>  #define UVC_QUIRK_DISABLE_AUTOSUSPEND  0x00008000
>  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
> +#define UVC_QUIRK_MJPEG_NO_EOF          0x00020000
>
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda

