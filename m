Return-Path: <linux-media+bounces-58316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI8UNhdc12kCNAgAu9opvQ
	(envelope-from <linux-media+bounces-58316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:58:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5231A3C75B2
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82BC93013008
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 07:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B659382399;
	Thu,  9 Apr 2026 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X6WamO0C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49085387584
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 07:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721492; cv=none; b=MDnJJDugQO6eHdtQSF4Q2doSLpUyk7TbqBcaUxrwSDAMuF/q4O8kIJQzvzD5mr0aNx7FrW2XT3PDffCb9zxuvf528StBb9wMFObWHr5QwQ28ZU0550i1toWX+8/20o5bSSV9+J7Rxw98QeD4DFbzRSv3+N6tHVg4HW+JtV5BAfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721492; c=relaxed/simple;
	bh=75AaxxT51YQYSPWqVcPdIIihL7T5QhWFGdZ1JNY3wXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXaQAbBqHZMb/Lmo0qI6HJGN3XRSLu19QV5dKeelN5wgTa0br0ROxVgsEp/w5Yl+W/iIRskb6bQ1YOkQaEM+wJ5WeXHcoD+P2GVWOV7GNlBYHtzk1NfES9YdRngafwg56GqFdYp2ppzn4o+rdgfAxKinni04jqGQH2Qs1Cdw4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X6WamO0C; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so96796766b.3
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775721489; x=1776326289; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KgjyUckJk89hUGKwnSl/YBODJB2o0tpFWnbI+O8bvQ4=;
        b=X6WamO0CpKrXVYXyVASnp26WK1WZDpiZHnpLfW2Wn5cYwOa86bCugluNFDXjObO4Bd
         gpgiDuUo771dDnr7QrW+NBIcF+cKEQz2cszfUpYnd/0MbNPPSRK271YYtBbFt5h3X523
         gy8c1zxq3A2uDWlHFlWmA123GzcCkfzav48I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721489; x=1776326289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgjyUckJk89hUGKwnSl/YBODJB2o0tpFWnbI+O8bvQ4=;
        b=IkC6uV4IcAZsRKCJMThtMLYzgs1TfS1RjczdNQMptslOZmvWgEeYPU67NeykwxLQ+0
         /L6UbMzaQVFr7rvOa69D+mTg4d1OSbe4BtQZT/hyUCYNGonl4r3DghMvQhd2i2vHJXp3
         laiCV8fvZCzmEPUfP/f8ukEgHr7zheBQIeR4qWmflJc4HTTHg7QsK7e/7uy4vnMRFgVd
         /bO1M0qxdrGYg/01VATFuKe1xBbiIraYlb6FU8xvLBLGweTCNHh9ixWcnFuornWobD6K
         PE9AkWRKSyGIB/ttyMZ6ZAbf7mvEmJ/jxjcQgo6/yAhdQ4dg5w0aYVSEcz3KXe9ZmK6F
         4bbw==
X-Forwarded-Encrypted: i=1; AJvYcCV4aCAZ6UZaS9XGJb7ATT/hkKxzsEYWctD8z3zbVZf102JQRBGyHukyjMYDXqSQZxbKwFc4jQK5BMVL7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxco63aSbCGAkh9unCcjHOl7IdIwjUYyZ0BQPMkSIUvE5wAr5CB
	g7YeQ9cbUZV8XqwYOeuiBvNjM0Rgi6evRvO3ZUsN6Hyhc61CemEas1+36YWGdTADg5o7jDJF8uz
	ptrn1wQ==
X-Gm-Gg: AeBDiev76MP+Lw+RD0c6nq4RJGTCq4vznTWpvPCIzRps1uUz/G79aGHqVyVrFsilZ42
	rn62IEbobM01RjciGb3XfSqN+nhkSB/x6xFOAmZfxP+SUMXQOErHwl3Fms1pTKoCv7KpQbyc7X9
	26iV2WL5blnfgVKUEtg5YG+T3U2oC4ly8WPhiY/RE9RyLa3t7ZxFQ479iU7kazHOLL2g5LYpxj5
	u0mLwuUhhlnGbd0ztyEafUj5mmkA14xv6nc81QCFRCvc8aUhUdP3VrK6tm0IAmtqYz7vtF8kWUE
	Xyo7O35oI1mzm5xXBMLWkSu8uNFfOUw67kcIXkT+6XOW002HTU57PgMBRkLcFW58JKf5jNnrfDD
	ZA59l2dVtKNXG61+7LUIJr/Rczc/TpZMUzJqPWq5OQG505fgdIVXWeoIZ9ZPkKqad7lfh3sQeAS
	c0OYdckyk0HJFQx3gYC74+W0ZZ7lXRBvB4QVHVGq/jSTbYdBqejDOC3gCuhkYI
X-Received: by 2002:a17:907:789:b0:b9b:e4ea:93a9 with SMTP id a640c23a62f3a-b9d47674a65mr118598066b.24.1775721489276;
        Thu, 09 Apr 2026 00:58:09 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b9284sm5879504a12.22.2026.04.09.00.58.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 00:58:07 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so96785566b.3
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:58:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpzWkpNH50KlKVr3wosM6wgvlziPwtpV3krojwoya+3tWaeg9jJZ6Y4ADdKylIHlJDJ11MYxRYzcVbTQ==@vger.kernel.org
X-Received: by 2002:a17:907:a04:b0:b9c:3ba2:2dbd with SMTP id
 a640c23a62f3a-b9d477d7b8dmr111645166b.53.1775721485788; Thu, 09 Apr 2026
 00:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260409074242.2115657-1-jp@jphein.com>
 <20260409074242.2115657-3-jp@jphein.com>
In-Reply-To: <20260409074242.2115657-3-jp@jphein.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 9 Apr 2026 09:57:52 +0200
X-Gmail-Original-Message-ID: <CANiDSCvNLVO7EEMO-FzSD1cteoMUTcftaXqvw5-AW-VqKLkNxA@mail.gmail.com>
X-Gm-Features: AQROBzDyzMrYjQVbGJVOH7hZjR0hRr3aEheTeyyruzz3-tawdJt0UB-POkfR9ts
Message-ID: <CANiDSCvNLVO7EEMO-FzSD1cteoMUTcftaXqvw5-AW-VqKLkNxA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] media: uvcvideo: add Razer Kiyo Pro to device info table
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TAGGED_FROM(0.00)[bounces-58316-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,jphein.com:email,mail.gmail.com:mid,chromium.org:dkim]
X-Rspamd-Queue-Id: 5231A3C75B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

On Thu, 9 Apr 2026 at 09:44, JP Hein <jp@jphein.com> wrote:
>
> Add a device entry for the Razer Kiyo Pro (1532:0e05) with quirks to
> work around firmware bugs that crash the xHCI host controller:
>
>   UVC_QUIRK_CTRL_THROTTLE   - rate-limit control transfers and skip
>                                error-code queries after EPIPE
>   UVC_QUIRK_DISABLE_AUTOSUSPEND - prevent runtime suspend
>   UVC_QUIRK_NO_RESET_RESUME - skip post-reset reinitialization
>
> The firmware (v1.5.0.1) has two failure modes: it stalls endpoints
> under rapid control transfers (~25 without delay), and it fails to
> reinitialize properly after USB power state transitions. Both can
> cascade into xHCI controller death, disconnecting all USB devices on
> the bus.
>
> Bug reproduced on two separate Kiyo Pro units running simultaneously,
> confirming the issue is not unit-specific.
>
> lsusb -v:
>   Bus 002 Device 002: ID 1532:0e05 Razer USA, Ltd Razer Kiyo Pro
>   Device Descriptor:
>     bLength                18
>     bDescriptorType         1
>     bcdUSB               3.20
>     bDeviceClass          239 Miscellaneous Device
>     bDeviceSubClass         2 [unknown]
>     bDeviceProtocol         1 Interface Association
>     bMaxPacketSize0         9
>     idVendor           0x1532 Razer USA, Ltd
>     idProduct          0x0e05 Razer Kiyo Pro
>     bcdDevice            8.21
>     iManufacturer           1 Razer Inc
>     iProduct                2 Razer Kiyo Pro
>     iSerial                 0
>

Is this the whole output of lsusb?? Can you try with lsusb -vv?

> Signed-off-by: JP Hein <jp@jphein.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 775bede..9b6df8e 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2880,6 +2880,22 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = (kernel_ulong_t)&uvc_quirk_probe_minmax },
> +
> +       /*
> +        * Razer Kiyo Pro -- firmware crashes under rapid control transfers
> +        * and on LPM/autosuspend resume, cascading into xHCI controller
> +        * death that disconnects all USB devices on the bus.
> +        */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x1532,
> +         .idProduct            = 0x0e05,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROTTLE
> +                                       | UVC_QUIRK_DISABLE_AUTOSUSPEND
> +                                       | UVC_QUIRK_NO_RESET_RESUME) },
>         /* Kurokesu C1 PRO */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.43.0
>


-- 
Ricardo Ribalda

