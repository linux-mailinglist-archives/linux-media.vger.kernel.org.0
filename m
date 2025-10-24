Return-Path: <linux-media+bounces-45489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A21D5C05FEF
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C02E01C254E4
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F86C315790;
	Fri, 24 Oct 2025 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B6n1PODT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA323C50F
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761304424; cv=none; b=Yi2FZTwvSjqDh+aYlbijLYL91ERDrzB6pmbP9pCmi00vJ8sa9WelpQv/zYUcmMJX4GXLbnU+f3/gp661bwbJ4ej1Jt42zFQdj8jvSZlEyZ2xD/ce1teN3DTFvcXH0DI50WFBA/G0rSV8ZiMnN4d9qZtHaBApYoitTpXdZnbXprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761304424; c=relaxed/simple;
	bh=/Cs+7CZojpdYOYGDL2af4FDZmEZBa/hcfB21X1zR8RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ob+NkUoP+5Ep/UwKuoKj7UWk5uDq4BVgMsSdVeoVwY+AbEJYJ0OHngiYtCIw5gSTq4o2pU/d0GhgwJNTwes1N1w9U2+Gwa4LU08cUk/QQaUVeZHMs02u2g+mESk7ac4OkJqbAV3kLrC0RPusKwBu3mvc4QC2hcOjBOhhWweZJrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B6n1PODT; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-58b025fce96so1684150e87.1
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 04:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761304421; x=1761909221; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iyyWCavapnD3yJLeJKy1rToQ+CHIPizLFi9XGHTmR1Q=;
        b=B6n1PODTyE4vQijEh3KPrCeJv/KyNkfe0Nm4pQSJ9ew0u1Skm7UyVQizsJZ6HQf4N0
         KiAzinLZglVhB1LWZwhO03ufMfiTdrBfJiuzqzjH/+9Cjlzp+dwNA4tajiSPqauoKqcf
         gdJDOyV1zTH1T/BVGrTdOVy1ncWnwaaU9n+bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304421; x=1761909221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyyWCavapnD3yJLeJKy1rToQ+CHIPizLFi9XGHTmR1Q=;
        b=LDQ6dmg7JHE5LS8Uon3avkQ4+9OYWMBbukzdxVIRzud+mDyIM5lT4A2XTalFvfYrv3
         rylHBNJ4OW8MxwZxXbqwu2zzLERKqSt2rZ7eodxBgv6+FR1rlvjFhaxG6aINlBxKnaXA
         Kz96XaZ8u8h/IOopLGQdlwoSGPwDAGoKHYofwfrrL70sRDexBg1k3BBcXI6B5U4+JlFi
         iQXj8doTSfevvJVb6wLoveq7DQM1t89XLJKwbVTzHLjb3UNe8fmCjRYgjKnXy91tpjs+
         6RqKHtLGfpOZMOB5NSH+iyIGqvr8Mc02LjGCM3X/5iF5OxoEPoRfpn5IDEX0BHJ9P6KY
         SWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLmjATzd1AqoC7rY+fZdIvhRkdbzDg8rqE8QygB7H9w3Sy8s9m17g3IZGRwPbSG1GWNCFIV8jqXUO2iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMBtyw9uGfad+6aQm+6vu6/HW0ABAuoaaB/i5Z4a7BcFnbROu
	efcSAXGZjihrmCmZXTCrhVZO+A4Tc2zp3O5TQ/TrKdrSp/hFrIAAWKZoSHngXJvYS+IhLR8M80y
	Rilk=
X-Gm-Gg: ASbGncvRWWvwsjxU0J+fumX7ulWdpZd9kOc06IKI1EU0gQ3h59dvIRIMLoNzxCL8tNh
	Gm3dREHKGoAqu3l2Dw/x4/y34BaY9Clr4N5sxcI6pb5f+o5GyqY2cXJF/KhnKLVqFzwCrmegHX9
	xg5MY5TuFc218zZ4oNwBNO5k/vc/UoNqa786AZiwbWTdDGD11UYedLyXouEpl2izwiULpd2azGo
	FXCmNnvK0QOvNwSMJx8CJ7LUKMT+H7Sm9wlXEFTbWPeWa3yKT9v5EDzJ8D8IRl8J6DmPDQMMBGz
	1bfF9bLMVV2+J+AWeb7nNpXpStc+quH/Rcc6rMbJe8QPRmrdvPRGuTRHrDhehwl/4GZDCyg+I0s
	JswhNcPOvtuWca5b3zmOQBcjg0flBfojnN2EJ4fnv9JhDlm6B6YPrUzn3YdNDMm6om52kuKqv3+
	pFm76vnJnvPKWx7Fi5ENxlR9C77NDXbncgN+ZUX7Sl1LnZMcBa
X-Google-Smtp-Source: AGHT+IGFa3WqytnZzpPD/0B3BgvDW8Ffw2OKqSPB+Uze3Qy0bEV5TqipmSwxjholPgDf0i29634d/Q==
X-Received: by 2002:a05:6512:1324:b0:592:f77d:88f7 with SMTP id 2adb3069b0e04-592f77d8ac5mr1528277e87.52.1761304420493;
        Fri, 24 Oct 2025 04:13:40 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d30752sm1541459e87.104.2025.10.24.04.13.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 04:13:40 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-592f3d2d068so2128450e87.3
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 04:13:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXpZdDGdqaY0FV5kMjEi4jxz+jzT2TpMWBQ/AmkAg8TUkykSvNH3l4785jejJRhpKNX1iBqCvgxw4p2Q==@vger.kernel.org
X-Received: by 2002:a05:6512:1549:b0:591:ec77:2c9f with SMTP id
 2adb3069b0e04-591ec772e83mr3852138e87.36.1761304419304; Fri, 24 Oct 2025
 04:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com> <20251024-fix-uvc-v3-3-b7f83c012ca7@realsenseai.com>
In-Reply-To: <20251024-fix-uvc-v3-3-b7f83c012ca7@realsenseai.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 24 Oct 2025 13:13:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCt30UjEEZd8-8Qsuqn_Ks2pOBE1awOwmZVsHPnPHVQ6FA@mail.gmail.com>
X-Gm-Features: AS18NWB81SOOrW67C5lrHubwLteemy12mYDThqflKnvj3xYCkQLGwSJmGHydKqE
Message-ID: <CANiDSCt30UjEEZd8-8Qsuqn_Ks2pOBE1awOwmZVsHPnPHVQ6FA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: uvc: Add D436 and D555 cameras metadata support
To: yogev.modlin@realsenseai.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yogev

Thanks for the patch. Some minor nitpicks inlined.


BTW, is there a way to programmatically detect if a device is
RealSense with D4XX metadata?

I am thinking that maybe all have a special entity id, or any other
way besides vid/pid.

I am asking you this, because if you could find a way to identify the
camera you could implement something like uvc_meta_detect_msxu:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_metadata.c#n170
Instead of creating quirks for every model.


Regards!
On Fri, 24 Oct 2025 at 07:50, Yogev Modlin via B4 Relay
<devnull+yogev.modlin.realsenseai.com@kernel.org> wrote:
>
> From: Yogev Modlin <yogev.modlin@realsenseai.com>
>
> Add support for Intel RealSense D436 and D555 depth cameras metadata.
> These cameras use the D4XX metadata format for transmitting depth and
> sensor information.
>
> The D555 camera uses UVC protocol version 1.5, while the D436 uses
> an undefined protocol version. Both cameras require the D4XX metadata
> format flag to properly handle their metadata streams.

We ask the lsusb -v output for every quirk we add. Could you provide that?

Thanks!

>
> Signed-off-by: Yogev Modlin <yogev.modlin@realsenseai.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index dbdacc64ea6b..6f0053a78123 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3223,6 +3223,24 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel Realsense D555 Depth Camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x0b56,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel Realsense D436 Camera */

The list is sorted by vid:pid

Please move the definition to the correct site.

> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x1156,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_UNDEFINED,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
>         /* Generic USB Video Class */
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
>
> --
> 2.43.0
>
>
>


-- 
Ricardo Ribalda

