Return-Path: <linux-media+bounces-45632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D812C0C360
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 08:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 574014F0C61
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 07:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82772E54BC;
	Mon, 27 Oct 2025 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QgFOZJaJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD482E4241
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761551818; cv=none; b=eZTaGOaIEd9sRHubKx5b06JB2JAgC7aiuLBFQHlw6VsAslv+LglK4S7kqIwkCw02XYTVXx7UJxNLQRxcgiQBrl++qZm/TxQBJ2og55A0jNxiOokyR7855e0uBGkNmnqCvo5lhMyLdr2KXrAnba6VrVRzqBYZNxe77CaVdsFKQJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761551818; c=relaxed/simple;
	bh=lJ/3SAcM3T8zTwBQdR+lRVXwTM1fm1eO6zXcNGCaGec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttMFEufBDJDNWofW/g02RsvfYPmpeLn8NZSS7r5Oav2CJwsBYMVJiuODrHw3xhYsB3l/dEa+xar5KhVIVi7IjmxurrO28nMfj/AZ6oor5KWIm+pkhHorcTLGiGZGTSwsFwbD6bZJzAzoDI59XJOkoqnPJuseSSwQQ1QQl248Tp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QgFOZJaJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-376466f1280so66050891fa.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 00:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761551814; x=1762156614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EYCA50IEKptJTAvmVGiOlvBf9mu8auYxLp0+T6tKlkE=;
        b=QgFOZJaJJgBvGzO5ccm3RMMpttEQcyiUSs/V/nlU3MX+zQ1rsUdgQ3zK/nD0DwUht9
         LSOwQhlmUR86BqDQ7iw5b4YGgGa7tI0CyENylKaIw8LTXjK8Eh2QL1N00seHnohpfFwT
         Hs7eKMByd+lRNAK6tzaYA9QzwMhBmcfDn2Nx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761551814; x=1762156614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYCA50IEKptJTAvmVGiOlvBf9mu8auYxLp0+T6tKlkE=;
        b=fNShJ7Bs6yekpb3mEE3EIZJVnQ7z+Gu4ulF3ocECLg9QGEtS/HRBWMWDweEmmJ2jx0
         KhtEDStzjJTBKPIcPuSOXldTO+O82S7KgZiKZefDt4lLYtlK01lAEcEEF8cV+IiqMrKy
         vaw3c5vdIZAIrUY3vTHugPdM+IMxewU85Bb7V359hSIjmd8wPlqQEqsVvqrRbF7swZ1x
         EReUW8eQJctSNJsVWNKtJrbTaJOu8eKxSFGeRTx0IUfJ4Vat0Rgo08KBl0sS8v/MCOwc
         kw9xdI4WPo+IIT3M+1xBG2kQlPJ3IM4FKtxL5ZnEt8QnNpwMAmIvQKEB2bAPmX7+20sm
         gWog==
X-Forwarded-Encrypted: i=1; AJvYcCXSD2jeaf9R/fKHsTs+gciuglN3Fh2asZ7AkYDQuZb6RkpDoo3WuQ1+9Z8CPSRkA+hnga+Q7QqI+/l3jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ20BRQo7BAvgGrdMJL9EfxDLsmCuGiesdYrZNGiK5HT2RRMoJ
	kNVB6HxJg3mn4uaEURUjqDtU8Ri2XI5YjpFG/aTqNlE7df3L6Qj5vvImrKCsRuO02qY37dJGnoG
	bKV4=
X-Gm-Gg: ASbGncvmCzThukOrvKMhag7apX2X2k84vYHjQNRMWQjHBwZg1Rb/xON5BZjfG0datEY
	A5bpeL5nPAhim+LAZvKxMFueOOaVZ/ub717lZj41TYNIs0KH7JcrZwcQsRxKf2iNegF6iZHjbWm
	qQe3a+0C6zhDg6MWr2bCtzphGtrvxqbtQn+Dq4qqUw1Wd/ZdcM9IzGy64QiQCFcVUXCqsZGb0VX
	t98AG2t3sKsk6JreC4KNTz32R+tp+ip3UqAL0wkTyNueciZoTmVmTuGru3/2K0waetlEN4Y+6ZX
	NL4U43FoA4b0l61k0vvQYckEhdTdLxEbKflklfkeRqAQgmxxG8BlhOyMPxDIzQvwTIpCtvxcPfr
	R9t6SGkjW7KBNMUers6lGI0vgH/oZmNK+zdVejN3ox2i7ndgAEbDrImCwfT8xgvYe4P7I5/ptg4
	R6NPmW0YsndvSmjCCH6u4JiXlcZLT26qBwL+Gw+PNWR6Iaix0mYJ4RNWcTfSjwDnQ=
X-Google-Smtp-Source: AGHT+IGEt4QOOOuU8sk2bBRuu8l6lkiX3S4g3sN2R/UHWydlthfQ8/M4VzB9pmSA1/QN5JR5RTWY0A==
X-Received: by 2002:a2e:b889:0:b0:378:ec14:f79d with SMTP id 38308e7fff4ca-378ec14fc0amr22233031fa.22.1761551814045;
        Mon, 27 Oct 2025 00:56:54 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09cba7sm18329641fa.11.2025.10.27.00.56.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 00:56:53 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-376466f1280so66050581fa.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 00:56:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVF+9QgSmE9fiP+M49kyETtwL7XuQWZje/1kPsVPFypIbe6GsCwoJp5cGNy0eqC7DCb+kCpn+OsTZzMzA==@vger.kernel.org
X-Received: by 2002:a2e:b889:0:b0:378:ec14:f79d with SMTP id
 38308e7fff4ca-378ec14fc0amr22232901fa.22.1761551813136; Mon, 27 Oct 2025
 00:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026-fix-uvc-v4-0-610eb1329600@realsenseai.com> <20251026-fix-uvc-v4-2-610eb1329600@realsenseai.com>
In-Reply-To: <20251026-fix-uvc-v4-2-610eb1329600@realsenseai.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 Oct 2025 08:56:41 +0100
X-Gmail-Original-Message-ID: <CANiDSCtkhaVN_7FawWYVX_DX0anLtU1tkJdRyEDinbkLdR8WDg@mail.gmail.com>
X-Gm-Features: AWmQ_bmdylxnXvGozSI-9olS9rUjE38ysBuzOnS-jfp_ekh1UPYFoPJfi-5xoUY
Message-ID: <CANiDSCtkhaVN_7FawWYVX_DX0anLtU1tkJdRyEDinbkLdR8WDg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: uvcvideo: Add D436 and D555 cameras
 metadata support
To: yogev.modlin@realsenseai.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HI Yogev

On Sun, 26 Oct 2025 at 17:43, ymodlin via B4 Relay
<devnull+yogev.modlin.realsenseai.com@kernel.org> wrote:
>
> From: ymodlin <yogev.modlin@realsenseai.com>
>
> Add support for Intel RealSense D436 and D555 depth cameras metadata.
> These cameras use the D4XX metadata format for transmitting depth and
> sensor information.
>
> The D555 camera uses UVC protocol version 1.5, while the D436 uses
> an undefined protocol version. Both cameras require the D4XX metadata
> format flag to properly handle their metadata streams.

This is the lsusb -v output previously sent to the ML:
https://lore.kernel.org/linux-media/wm5gfxhvifqamhatze5pfeyzfm6hnyknd4ww2bf75nwmw3okyn@7jmk66eibia5/

>
> Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index dbdacc64ea6b..cf3ee33cdfd4 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3196,6 +3196,15 @@ static const struct usb_device_id uvc_ids[] = {
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
>         /* Intel Realsense D405 Depth Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> @@ -3223,6 +3232,15 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel Realsense D436 Camera */
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

