Return-Path: <linux-media+bounces-6337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ECB86FBD5
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 09:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFE83282847
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 08:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D83D1756F;
	Mon,  4 Mar 2024 08:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NJ3Mn+I8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33211756D
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540926; cv=none; b=XhCzCdmy5mHg1Oi22uCD6V3SwsRoc/L6EO+eJbgdG772AfhA1E0jQpOscZRCvNPqpw5MaYNnjALXUISnHVUA3M1BK5WGP3DrT3miRPnqAGm/0sqx0GoPYNgUCHsh1yauQYPKdpflbXL0uy8BNbp3eEx4jUsDjOvwsYgeNWqMYuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540926; c=relaxed/simple;
	bh=oCzoTz8A9/7pJIa0vZ/4uOgqGqSuhCmhJdxsOi4YgWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aR84+Y6NY+sW3NefuvwIhWHLbOAJ27uqIy+BSX6dr0duEQmWVYIrJX1aJaeTisDiLZKCB0nVYUlECBFbG6yWx5qPbQfJB4RVw8YRIHxLFgDDye2ENO6w/VORP8nMgiypWehsBjSiPgoerS+x/dG/rM+mGfZSHepJGymzA0gsKsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NJ3Mn+I8; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5a11a6a08f2so960398eaf.1
        for <linux-media@vger.kernel.org>; Mon, 04 Mar 2024 00:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709540923; x=1710145723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QioX7dKNZ1/93E+qVe0+SjP8FFkQqFfbUV4STfrGhdc=;
        b=NJ3Mn+I803EyyFNgw+6lCE3GuPC8yotLRYoCS7rKHkv9Jh02jYfPXRRTyTlV85h11r
         fnF8nb2r+1uDKNNxSlC9qe053chQKm03Ialzxz83g6YUv+3h0JowuC5/6EPOr9vb07FV
         jomQLQe7SlYGr/+33XOyRFSMmIsqpDkGCs95k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540923; x=1710145723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QioX7dKNZ1/93E+qVe0+SjP8FFkQqFfbUV4STfrGhdc=;
        b=AuYb+2cb8BIUTomSD5KK9YA2tYBgFhC8hnSp+Q10lyQ92R84GOniXomafnnOSDEEdp
         kRRV2TosjagkB0keNRfjDzQEChKH/P2LkSgDolbfRi4UbxyyK/l5Q9avIQ/54QP/JFfC
         AfV4GUs27Tm3aR/SIfqqQNSEnYDV7IMuQzxGi/JgMBzAqwB6ZjSLbQ50jocY9Q4kQUOD
         jfzagSxYfOactklJnLPXJVyE0cnAqk391NL9WpmC+NT7F+nrJGDywoNJouZhPHK/AGLl
         sM7JNFRVn0LHfZKIUy/pzVAoECXbOFcNZ+WIRk/q8nAE4G78pASX6LK8HqqAbuNyA4p7
         KQJw==
X-Gm-Message-State: AOJu0Yyzo/UTavZH5yNSQj+2n5x8zG8bnx0GsoEEvij5l7D//XRbPK5U
	WxayF7B65i+VNdLjYd3+rqLeg4YwmosERhZ1RuYVtcOZH6s7eXCPcv3rbmlg163QJFbw0uj5nkg
	=
X-Google-Smtp-Source: AGHT+IF5ppFWkhKdkQMPswbF1Bt2PIDAwL6+BBDeteoMN25NYz75un5OWSjM4Q/gVFeNN+hhaaH71w==
X-Received: by 2002:a05:6358:5923:b0:17b:64af:cd7b with SMTP id g35-20020a056358592300b0017b64afcd7bmr11105035rwf.16.1709540923309;
        Mon, 04 Mar 2024 00:28:43 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id nw3-20020a0562143a0300b0068ffe7b2914sm4803869qvb.107.2024.03.04.00.28.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 00:28:42 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-68f9e399c91so37256156d6.2
        for <linux-media@vger.kernel.org>; Mon, 04 Mar 2024 00:28:41 -0800 (PST)
X-Received: by 2002:a05:6214:114d:b0:690:30b1:5fcf with SMTP id
 b13-20020a056214114d00b0069030b15fcfmr9338437qvt.51.1709540921258; Mon, 04
 Mar 2024 00:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 4 Mar 2024 09:28:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCvxosE_MR1FYaM81jQyDrJ6cERzYSASNsjva6xmkn_42Q@mail.gmail.com>
Message-ID: <CANiDSCvxosE_MR1FYaM81jQyDrJ6cERzYSASNsjva6xmkn_42Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4035
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Giuliano Lotta <giuliano.lotta@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi

Helping out Guiliano to send the tested-by, he also says that
0408:4033 should be added to this patch.

On Sun, 15 Jan 2023 at 21:52, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
> implements UVC 1.0a as shown by the UVC probe control being 26 bytes
> long. Force the UVC version for that device.
>
> Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tested-by: Giuliano Lotta <giuliano.lotta@gmail.com>


> ---
>
> Giuliano, I believe you've successfully tested this patch. If so, could
> you reply with a Tested-by tag ? Just copying the following in your
> reply will do:
>
> Tested-by: Giuliano Lotta <giuliano.lotta@gmail.com>
>
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1a186abeb4fa..742eeaff333e 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2429,6 +2429,17 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
>           .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> +       /* Quanta ACER HD User Facing */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x0408,
> +         .idProduct            = 0x4035,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> +               .uvc_version = 0x010a,
> +         } },
>         /* LogiLink Wireless Webcam */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>
> base-commit: fd957081cff04668f390c6f290bdcc7fc009a0f1
> --
> Regards,
>
> Laurent Pinchart
>


--
Ricardo Ribalda

