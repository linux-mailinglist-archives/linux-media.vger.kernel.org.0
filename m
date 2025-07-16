Return-Path: <linux-media+bounces-37859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A37DAB073DB
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 12:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3FE8583942
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 10:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32A82C3246;
	Wed, 16 Jul 2025 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lt/WIPXH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700A82E36F4
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 10:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662818; cv=none; b=MXBIpS1Z/s58BePe/hDBKDCnIl1koY1BiwzkbtF+mVqSPyTYOqxaugJopRy6GfPAw2WMcPNBIGl3p/CvYp8C+06VYsJp4gT4Oo9lCR+WPJHtV933/rvO14ZyjZZiLn0pxtgCqCw5zbVKsl38o6ymp0xxEiokDRsINEKQ8LqKiUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662818; c=relaxed/simple;
	bh=fUmErU0xxjOG9uox2h5GYjM0aJVrSRTpNQLzPXOse9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5kZj1QJH/wI7PiqojzK6+5cHP05ycLlhuADBKSaPXb1m9ce6fdYJQmPug4TryJrB2CCzWqUcQFG3XvwhW7ns+giwPuKL8vVIrOqLm76CGG3dmWlvYyPruWGPaDkhe+YnflGTMGXFwMA/iteAg762+/AAEg5TaHq8nBG0mhSPlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lt/WIPXH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553e5df44f8so5759910e87.3
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752662814; x=1753267614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7on1yqGTiUFBg/Csnly6gG6XQYQN228hXkOgfEuI68=;
        b=Lt/WIPXHttQFMbC91tNIG7h5JYbfc2PgTXx88T8V/Cvs4/I5cGv6gEBPPzDj8AbXW1
         wjs9Ip0H+jc64NTnZ+zSGnjGge9qc88XZ801mlKaaq9ibxAYEkI9/zeTZMAjU9JlPQik
         qZwJQSTyon7JvD5jEsd/gEqLsfd6xEmpISafc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662814; x=1753267614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7on1yqGTiUFBg/Csnly6gG6XQYQN228hXkOgfEuI68=;
        b=pYpa23a3ngRzeJevwm0A6GbcT4XLV/Ewz+0GU67s0RPF891rSsMetfzSghUbeX78vU
         E12aX7P+/SrqnIWRlqF/F2Apew3mWntGi2Wctx7hPC7kbHUvM58zfcRmt+kTHZJcdtjh
         JkpXbCEq/HQFAIZ0U4nsPZ85sbAs6f1vqQMdW1dXSrGsgfE9gkvYtmM1ZHEcU3uv2k01
         WmUhIj/6gbWCNawM2pFE1o0VDy45fuWs4FjBdQ2oukrLu0e5/JxJnnf9TdpIK4wyEwCH
         Ln7TUymWJ2kfM5cdR0t0IP61IfSlSlGG6cdSUSfU7IyI+NSH1tZ8R8OG/kNj+ZIgIlWc
         HIkg==
X-Gm-Message-State: AOJu0YwmmwMZ4V8nldPDxsn2NSbjrKPF0DOnLT/nf/Xz6rOI73obm61o
	YKYA8SCfSHFBtttf0MZj3HEggRatM2b3/Pq/IXM/CuNu+2hbiY1uDBTdKqwM5dH37Rvjydi6wsH
	nWnS8zg==
X-Gm-Gg: ASbGnctYmvVG8bwQQ8zYFRtibdcl9n/Pd0cfJ640RPQ2hL7h97pW8Cw+tJQ2LsUWhRV
	lhKZ4c/cq9zLrul6nGafJ+7446Xx3SC2MW60wsjwctu24ps7LnU/rD17vUQNoriwqITqky0m1zp
	HbocCNWvegP6oexC2DdPju7IJWq7NUSvHTCrbo8RxQe2GItsaElYdjyUDT+amcUyxUlxePEpqtT
	ZygczajSSNRULYnm1QXoy+nBfI7dGvXnx8iBk+tfQbuDqvAQY4mo2Ra6trOIFABB2pKlkH2cfEN
	n260ax37+EnkXbt7QhL7sbcKwOVm+FTEAWOMfpRHzMN0DvQFAkxzfznUA39jKmdItC+jWtSiimw
	vp7SkkmwKf2I5hqUiSeZZXuvlFeJRsWGZhaeK7dIY6+Vyu37ypsC60d9opnBt
X-Google-Smtp-Source: AGHT+IHdaJaRdHgT3wM4RKrxdVM1CFERDIlsFKC07HiLLFFmgh+iTL9ZLRpfoVoAhkL/fHxprrMXjw==
X-Received: by 2002:a05:6512:4025:b0:553:35ad:2f3a with SMTP id 2adb3069b0e04-55a23f217c1mr616419e87.22.1752662814372;
        Wed, 16 Jul 2025 03:46:54 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d0f4bsm2598216e87.121.2025.07.16.03.46.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:46:53 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553e5df44f8so5759894e87.3
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 03:46:53 -0700 (PDT)
X-Received: by 2002:a05:6512:a8d:b0:553:ac33:ff34 with SMTP id
 2adb3069b0e04-55a23f0b832mr683441e87.8.1752662812826; Wed, 16 Jul 2025
 03:46:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com> <20250715185254.6592-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250715185254.6592-4-laurent.pinchart@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 16 Jul 2025 12:46:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCu6gCK5kM_88DvDurxoR7v6pvkCjY84fMNmed4FzQZm7w@mail.gmail.com>
X-Gm-Features: Ac12FXyKbEJny_KKYl4c_U5NnxJe4D_g9UoJNYwMAWQeBWR_Hk460oxiPt4UYa8
Message-ID: <CANiDSCu6gCK5kM_88DvDurxoR7v6pvkCjY84fMNmed4FzQZm7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: Move MSXU_CONTROL_METADATA
 definition to header
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Tue, 15 Jul 2025 at 20:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Move the MSXU_CONTROL_METADATA control definitino to the
> include/linux/usb/uvc.h header, alongside the corresponding XU GUID. Add
> a UVC_ prefix to avoid namespace clashes.
>
> While at it, add the definition for the other controls for that
> extension unit, as defined in
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_metadata.c |  9 ++++-----
>  include/linux/usb/uvc.h              | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 386b04a3a102..57f5455a726c 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -171,7 +171,6 @@ static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
>         return NULL;
>  }
>
> -#define MSXU_CONTROL_METADATA 0x9
>  static int uvc_meta_detect_msxu(struct uvc_device *dev)
>  {
>         u32 *data __free(kfree) = NULL;
> @@ -192,7 +191,7 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>
>         /* Check if the metadata is already enabled. */
>         ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> -                            MSXU_CONTROL_METADATA, data, sizeof(*data));
> +                            UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
>         if (ret)
>                 return 0;
>
> @@ -207,16 +206,16 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>          * us, the value from GET_MAX seems to work all the time.
>          */
>         ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> -                            MSXU_CONTROL_METADATA, data, sizeof(*data));
> +                            UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
>         if (ret || !*data)
>                 return 0;
>
>         /*
> -        * If we can set MSXU_CONTROL_METADATA, the device will report
> +        * If we can set UVC_MSXU_CONTROL_METADATA, the device will report
>          * metadata.
>          */
>         ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> -                            MSXU_CONTROL_METADATA, data, sizeof(*data));
> +                            UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
>         if (!ret)
>                 dev->quirks |= UVC_QUIRK_MSXU_META;
>
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index ee19e9f915b8..72fff9463c88 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -33,6 +33,22 @@
>         {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
>          0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
>

Maybe you want to add a link to MS doc here?
https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls.
> +#define UVC_MSXU_CONTROL_FOCUS                 0x01
> +#define UVC_MSXU_CONTROL_EXPOSURE              0x02
> +#define UVC_MSXU_CONTROL_EVCOMPENSATION                0x03
> +#define UVC_MSXU_CONTROL_WHITEBALANCE          0x04
> +#define UVC_MSXU_CONTROL_FACE_AUTHENTICATION   0x06
> +#define UVC_MSXU_CONTROL_CAMERA_EXTRINSICS     0x07
> +#define UVC_MSXU_CONTROL_CAMERA_INTRINSICS     0x08
> +#define UVC_MSXU_CONTROL_METADATA              0x09
> +#define UVC_MSXU_CONTROL_IR_TORCH              0x0a
> +#define UVC_MSXU_CONTROL_DIGITALWINDOW         0x0b
> +#define UVC_MSXU_CONTROL_DIGITALWINDOW_CONFIG  0x0c
> +#define UVC_MSXU_CONTROL_VIDEO_HDR             0x0d
> +#define UVC_MSXU_CONTROL_FRAMERATE_THROTTLE    0x0e
> +#define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG   0x0f
> +#define UVC_MSXU_CONTROL_FIELDOFVIEW2          0x10
> +
>  #define UVC_GUID_FORMAT_MJPEG \
>         { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

