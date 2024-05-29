Return-Path: <linux-media+bounces-12153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C528D3601
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 14:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B03A1F24717
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 12:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5F4180A86;
	Wed, 29 May 2024 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZqWCIRYW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8240353802
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716984522; cv=none; b=F68u9lJ4N3gfRthuX3CFmcv2jO4iyWwdk4/u4BziY9os9qBf4gSjMdHsk8Lmyk+sUvx/1O+USJoK9c00NbtohCHUHEGPfcpN9NxWRl1zLQi4x7rvTeynDW8S5PBOUL/Kl4ca4VBLQ68QpQN+LE+xDvhOTUbULsNg+W6KOWOo/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716984522; c=relaxed/simple;
	bh=P5pSh/9FY5f00M9NGXm9vtBz4tuG13GFoE2SRb1NhO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZQjNm/5ovciL4GsNb1HIfr76TaEm8yi7xBIlAQ0GSeWLkOG3aArn6yMGOrUr3X6+oqniMrZMalHtIg3YDVS9uczKTPTp/AF2rhVZXK5aTG+yKG3DX5WPt+DmMf+ZnuaBuVDvZ+vjc/MgoWSbRQCWO+ZdePWxKkdzLi5AUfVhQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZqWCIRYW; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d1bf6d156cso1063910b6e.3
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716984519; x=1717589319; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=58Mz1pMCv2xWGH0opDNoc97XaxN4eqbimdmnrrVnn9Q=;
        b=ZqWCIRYWlIYVcAgo9enarMIo2uPyYugGGjTbT+4gQVfBRdYRv55E6Vn53UHxVK0Uhs
         1R9StLAebwNgcHve+UZpWLKHBJWNrWfF046GTFjGbaKjI6RKY8fo9rkfBsnv6jkgxFDw
         wmfJBJkJ37CeIu4GSJ45l+403qCGFkOi+K+TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716984519; x=1717589319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58Mz1pMCv2xWGH0opDNoc97XaxN4eqbimdmnrrVnn9Q=;
        b=hg74az8dxbkHRCQYzPDgn4ZAxfIvbxWcKP+yRftRDlCLSI80C4k/ee96pR34wf3iuX
         xPFVAkf+IudHHI+d6YH9kFOGVtYhAPoQWFAfNQF7ZQR8ItNFHyIy1YDvKzHFTjJqTEQU
         Z9suQAhmMY0JCoLCGTiMVl61kvRzc41sbzvpwHjcYHofGEr5uG0DnMJhAYXpQ+BXTyVV
         BKbw3q9Lxbxryu54BnjWmiKC+DJARZsxezhjc0MNlugMFVxjD3gBu/YDbzrsa2fOaqeS
         SxIhnhvB0vwCFjvMxKEeNn/RYvGWWOjKik6krfSGObe3wBxVYQhR+KF+MijUac9mcOdQ
         DL6w==
X-Gm-Message-State: AOJu0YzVIakW7gDpbuM+LJL0HYfFKlUKSU3DfRA0nZp3yJ9RkTCQtdKN
	XRp3RL+mk7kdCfnST4czeJ6UuMJ530jQhxaY5kt82liIMexc+U79r+5Ajxg/yWyABlNvJL2nR5E
	=
X-Google-Smtp-Source: AGHT+IE04iWG9pczxIlXMFcTF8XvUQasByNomR/v97K0FmBwfxiB60/y/MMkQ2+5e6zEWo409+W0lQ==
X-Received: by 2002:a05:6808:2105:b0:3d1:d399:2cde with SMTP id 5614622812f47-3d1d3993288mr3516142b6e.6.1716984519155;
        Wed, 29 May 2024 05:08:39 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fde7fd8casm11430881cf.86.2024.05.29.05.08.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 05:08:38 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ab8e0c42d3so9053506d6.3
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 05:08:38 -0700 (PDT)
X-Received: by 2002:a05:6214:5988:b0:6ab:1b6b:c8ba with SMTP id
 6a1803df08f44-6abc7a9f3famr166570126d6.1.1716984517986; Wed, 29 May 2024
 05:08:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425132334.18546-2-localevil3@gmail.com>
In-Reply-To: <20240425132334.18546-2-localevil3@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 29 May 2024 14:08:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCv89CcxMW=fA2LBR-qgZmhOcO4J--go6wsCMbGsN+Zf0A@mail.gmail.com>
Message-ID: <CANiDSCv89CcxMW=fA2LBR-qgZmhOcO4J--go6wsCMbGsN+Zf0A@mail.gmail.com>
Subject: Re: [PATCH] Add "Quanta ACER HD User Facing" devices.
To: Ilyas Erezhepov <localevil3@gmail.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

Hi Ilyas

On Thu, 25 Apr 2024 at 15:27, Ilyas Erezhepov <localevil3@gmail.com> wrote:
>
> This patch adds two built-in video cameras for Acer laptops.
>
> Signed-off-by: Ilyas Erezhepov <localevil3@gmail.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
May I ask where Laurent reviewed the patch?

I am trying to find it in linux-media and I am not able to find it


>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 08fcd2ffa727..502c03b6dabe 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2454,6 +2454,29 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
>           .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> +       /* Quanta ACER HD User Facing  0x4035 */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x0408,
> +         .idProduct            = 0x4035,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> +         .driver_info          = (kernel_ulong_t) &(const struct uvc_device_info ) {
> +               .uvc_version = 0x010a,
> +         }
> +       },
> +       /* Quanta ACER HD User Facing 4033 */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x0408,
> +         .idProduct            = 0x4033,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> +         .driver_info          = (kernel_ulong_t) &(const struct uvc_device_info ) {
> +               .uvc_version = 0x010a, }
> +       },
>         /* LogiLink Wireless Webcam */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.44.0
>
>


-- 
Ricardo Ribalda

