Return-Path: <linux-media+bounces-58315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB3rGgxc12kCNAgAu9opvQ
	(envelope-from <linux-media+bounces-58315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:58:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6433C759B
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AA3C300D318
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 07:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFC038757A;
	Thu,  9 Apr 2026 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bi0PeBre"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF51D37104C
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721441; cv=none; b=LNW/rfWjkaH85GuoeC2yCmOlFR+sILI2B9a1v/tQCd2FnB1UXSQWfjEEHTIFPNy9QFQZNnaJOajJyErk035ZwZaKB6y2L5P3QLG3SQgxtnQRZTsV9QIOfGFnmtIz6anKIry6UOvkl8JwjE8RaUvXoaIl06/lCvfYqmfhkme5fx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721441; c=relaxed/simple;
	bh=Fwi6GkefsHFoOdTr7TXb9wXqpTDYFwlirRzzkATpLTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvYnqCYLYfrGqLxAurxR2c8QvaDQBlgj1Bpkwwd7/4U5RhmUmKAwenvR6ZgBrRpPl6sJdJENWot0/ycLgruIOIWzLGltt5cgitNlaFdNIQi+up+VDFob6RX+raTNSbevF+724BNkOeR8fTrrY5s40VvMUJE1M2JzuMDY/L2Z1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bi0PeBre; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso73459966b.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775721438; x=1776326238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1PYZ3CNZv15HzSKJRYNmvTm4cv0HUgIr18BiQU3v1Nc=;
        b=Bi0PeBre+bxLpsPS3QruoFs8YeOpRWcc2YqZB/AD2NAahqBWCKVGnA3TnoEnOpiWEh
         Plvkd2AWIqjyAcCYAhpIASneSQxKOOJAiwCA2/Ix/BGDm3scmSz8Xnsvp+qp6QGerILx
         oS2/3k52CYCO8SDFfNSdqPMh9g5UDA3wTBvJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721438; x=1776326238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PYZ3CNZv15HzSKJRYNmvTm4cv0HUgIr18BiQU3v1Nc=;
        b=qI9O9mA0xEg/4FxYUMbCNUpNEoF0+r/iUfg/aRsvJlopbm90A9HpNVTkUe3FtjwRwT
         I/NyKZGssvlBx4FGtC3p4wyZILkifbArtW05xrLfV98V4s7V1rqCXHyPqFvRe9XAICyb
         lLFrG69jwfAVToZ/WluhyZGXNFwU0dKBmGHXG4CDQFY5jA3iLg5hw3VjVpbDoET5RKw4
         JYfLFgamxOZRvnw9Zutsi4LnRo8PnW3DdpMb6R2b4dOpwgJd+DgcKdB0T/kd1rb8IKwW
         HpLaToHEzKIeo2mW6eM2N2QI+PgbxNopuKkN+7vprTE3xcRC4FPRpX6qcWagZJ7Oyp7R
         8UbA==
X-Forwarded-Encrypted: i=1; AJvYcCX+iAvcYpYQAOCguef60LoABNWkvzWEtvBBIzoViDUukQjeRmoAZ46KEfLPRhR/hZc5RXei5X/iLiQChA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUOOgGCseafAU1OkZF6UU+xGD1Za4tFOD8mJ4oMt3dtwzWjJ9m
	kb186UMSskBmWEF3PK33VDOG4PiFjI8qo9E5TvaEyFY4TBdwPY1AY+sgopXlE96TNg/pk7wBJOF
	JejLIKw==
X-Gm-Gg: AeBDies6lG4KoIOPql//wEHotLUwFKnt8kxyd4+q7Z2OwVWfEm9YJGierFGakm8bBNG
	17rJlJw2yTjSxKT4NYJalm6z0SuogHhtJQRt8YzRbfsiRx9Vkcc7cfUCPBw1cvQcPeOZkx2i+wP
	Hjd3R0fHWT7DdifurAHOr4qRwdeH9u12KELCMD/HgiS/0LY5vK0nnBctyzNIeBnjQzL/rkM+lsr
	uOoFMY9Jn1UTP4eE6fRvAvJ22s2T+uR0ExcXgk8ZunZC1gQMPe1k2gWiCyxw6+0TiVaoH2XmAba
	BqtCT5rOyzV7+wKZJF8mIUzojugcDbskevhqsQpEDGg6B4ggKOg5DPhwPfYOVnQvH0cd+17gDaQ
	uMhi3Cvr8KJ1HW7dxtoY55t8FV8kDse7nWTFzCzihNU67f8i2RGZcoUNHtpBgNvdOtUcu81/6TN
	YjdfE5fImRYZ4JzUYmQD6oX26AgiUOaa2S/FI4jsKvXgcte1lAfO0t8JMY9Uut
X-Received: by 2002:a17:906:f59e:b0:b97:6d1b:4be8 with SMTP id a640c23a62f3a-b9d460591d5mr135442766b.10.1775721437509;
        Thu, 09 Apr 2026 00:57:17 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d02897fsm708446766b.63.2026.04.09.00.57.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 00:57:16 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso693621a12.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnRs7sn3DZviA6KVPGVi5OwzW8ICwq4Xw6O+QYmhpTcoL6St73KnJmlnrMyrVn0qmrBjT6exvmvTPpig==@vger.kernel.org
X-Received: by 2002:a17:907:d11:b0:b99:86b6:85fd with SMTP id
 a640c23a62f3a-b9d4605e95amr129021766b.9.1775721435870; Thu, 09 Apr 2026
 00:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260409074242.2115657-1-jp@jphein.com>
 <20260409074242.2115657-2-jp@jphein.com>
In-Reply-To: <20260409074242.2115657-2-jp@jphein.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 9 Apr 2026 09:57:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCva8V5+h6QsHLXEsJfjMPYaoGWKzZcvH9u2wgXCs-jRdw@mail.gmail.com>
X-Gm-Features: AQROBzDSC3u6kQSPcxdPwsVJ4Kpy1LXRX3PVPipb4Wm_Nkz-555_edmfjAiMXyk
Message-ID: <CANiDSCva8V5+h6QsHLXEsJfjMPYaoGWKzZcvH9u2wgXCs-jRdw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile USB firmware
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TAGGED_FROM(0.00)[bounces-58315-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:email,chromium.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CA6433C759B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026 at 09:44, JP Hein <jp@jphein.com> wrote:
>
> Some UVC devices have firmware that locks up under sustained rapid
> USB control transfers, crashing the xHCI host controller and taking
> all USB devices on the bus with it.
>
> The Razer Kiyo Pro (1532:0e05) is the first known example: approximately
> 25 rapid consecutive control transfers cause the firmware to stall an
> endpoint. The kernel's standard UVC error recovery (GET_CUR on
> UVC_VC_REQUEST_ERROR_CODE_CONTROL) then sends a second transfer to the
> already-stalling device, amplifying the failure into complete firmware
> lockup and xHCI controller death.
>
> Add UVC_QUIRK_CTRL_THROTTLE which:
>   - Rate-limits all USB control transfers to 50ms intervals in
>     __uvc_query_ctrl(), the lowest-level UVC control transfer function,
>     ensuring all callers are throttled including uvc_set_video_ctrl()
>     which bypasses uvc_query_ctrl()
>   - Skips the error-code query after EPIPE to avoid amplifying stalls
>
> The 50ms interval was determined experimentally: the device is stable
> at this rate under sustained operation, while shorter intervals
> eventually trigger the firmware bug.
>
> Signed-off-by: JP Hein <jp@jphein.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 30 ++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h  |  3 +++
>  2 files changed, 33 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a5013a7..cee93ac 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -36,6 +36,26 @@ static int __uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>         u8 type = USB_TYPE_CLASS | USB_RECIP_INTERFACE;
>         unsigned int pipe;
>
> +       /*
> +        * Rate-limit control transfers for devices with fragile firmware.
> +        * The Razer Kiyo Pro locks up under sustained rapid control
> +        * transfers (hundreds without delay), crashing the xHCI controller.
> +        * Throttle in this low-level function to cover all callers,
> +        * including uvc_set_video_ctrl() which bypasses uvc_query_ctrl().
> +        */
> +       if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE) {
> +               unsigned long min_interval = msecs_to_jiffies(50);
> +
> +               if (dev->last_ctrl_jiffies &&
> +                   time_before(jiffies,
> +                               dev->last_ctrl_jiffies + min_interval)) {
> +                       unsigned long wait = dev->last_ctrl_jiffies +
> +                                            min_interval - jiffies;
> +                       msleep(jiffies_to_msecs(wait));
> +               }
> +               dev->last_ctrl_jiffies = jiffies;
> +       }
> +
>         pipe = (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
>                               : usb_sndctrlpipe(dev->udev, 0);
>         type |= (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
> @@ -108,6 +128,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>                 return ret < 0 ? ret : -EPIPE;
>         }
>
> +       /*
> +        * Skip the error code query for devices that crash under load.
> +        * The standard error-code query (GET_CUR on
> +        * UVC_VC_REQUEST_ERROR_CODE_CONTROL) sends a second USB transfer to
> +        * a device that is already stalling, which can amplify the failure
> +        * into a full firmware lockup and xHCI controller death.
> +        */
> +       if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)
> +               return -EPIPE;

I do not believe this is needed anymore now that the check is in the
inner funcion

> +
>         /* Reuse data[0] to request the error code. */
>         tmp = *(u8 *)data;
>
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 757254f..31f2af5 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -78,6 +78,7 @@
>  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
>  #define UVC_QUIRK_MSXU_META            0x00040000
> +#define UVC_QUIRK_CTRL_THROTTLE                0x00080000
>
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
> @@ -583,6 +584,8 @@ struct uvc_device {
>         struct usb_interface *intf;
>         unsigned long warnings;
>         u32 quirks;
> +       /* UVC control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
> +       unsigned long last_ctrl_jiffies;
>         int intfnum;
>         char name[32];
>
> --
> 2.43.0
>


-- 
Ricardo Ribalda

