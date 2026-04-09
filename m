Return-Path: <linux-media+bounces-58306-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EqHHi1M12lYMQgAu9opvQ
	(envelope-from <linux-media+bounces-58306-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 08:50:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C83C6B19
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 08:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EBCE301FA61
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 06:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFA534B410;
	Thu,  9 Apr 2026 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MPqdH80T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DA6347BD4
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775717405; cv=none; b=ROmifwFhcLU0sHz5r2yq5/ppA5vw01j6hlnRxOfMyyTSptvSYgIjjUCCbl5IZx2WfRJ2nDImq6564d2qMZnraDGT2nb+FyZKCq4aFoiZ02WNHqjnMBnsm1qAJeb5kiwmqmWxbOj7aGUFFrOuSrMadRmNJ6gOMwAFARmhnL8lh9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775717405; c=relaxed/simple;
	bh=amjMdpMLXPnpXnEVjD4WOv+bzX5GrYRST8oWtDMrcME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bc3pBwXjBFNdZRsPxTKFU7phbOT35Zy8PYPGGzrtFb9FUwYwH80g25K2Hz/Sl+EObAkUWmCVuF5Ep/AzA4b6WvZQnYYpNuDsn8877F/yN5Uq2tedbztkfyXolkZMxoXyhxfBIBzZg8IM5dUYEmC1Z/HYoKYJEOmf+/PCa+eFOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MPqdH80T; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso640711a12.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775717402; x=1776322202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7X2yjy3G3AjVzbkMNhFNNa6fZ5R4PCuwspi3NYnJRiI=;
        b=MPqdH80TvoTDuK4Z3MZIcDXI1GvKZbvNGOAiiiOWSYo/cXfH5Aa+CJFBkfuyqcBbnY
         yBl11frqS2X3EMJlPttIE7r66nxkjfskekQkq3c6mvBApxOaoXXHueCspz9QULP3zqx5
         e/R0U83MajrdY6PQG6DHmDEhcpoWFCW/osv90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775717402; x=1776322202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X2yjy3G3AjVzbkMNhFNNa6fZ5R4PCuwspi3NYnJRiI=;
        b=Jw8NBe5pmkZFjsdUuauqlHMoXTbUymvHuujUyeTvp7cuiO+ZlWsl4Z7mez8LbAKkhr
         DEanKCTawQXWFEsYZOQdj8OHweKaE4jotsxf5IhFDyIHhIt+u70VPtksWmaL0CXie90l
         jiCPrWW6eq8JSG4QZ750G167oOGxq7FDl31ojgSqBi7emLycIWeQiQzGBMZh4OsUGQS3
         dADddI9VtjGdNyfCSEECt3inZ+2t6MQgNjU+6N8XsFl/p59gnLmiMWSxRcUrrSlSyMFM
         xN2LrTfCE24ujfETvKudsgC3JdQfTb+89fMJWWLS0RZfMiWr2A3w2pxR3iOG4Dryr5DI
         N3MA==
X-Forwarded-Encrypted: i=1; AJvYcCXRyNvylNqrq5hUq4EVI4yL3fW4e2djfzku5uQ+1Izu6baEJRl2g49Lznne0bgWQkSsa2aGjmRcAOMTgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziASc0jA49PLSO9YYZM92OUXVadjbfTLxnOs2maL3nwKRq5J+2
	09v6br8ScZd+gJKYflVGay2t4XAhqt3+/75i0DxyDGoCebhNRgh+NJ2Y5LXL12+gX3UEjrz5elQ
	ieABpow==
X-Gm-Gg: AeBDies8X33VbmX1otFcrZvkBa0BVdlfT6RdoH+4IRqh1SL1xPKVykYCvad1Mhi79Ba
	Tpcb/8yvqn4LJaysBgs8saCHoZ8Mku+fIMoXzwuG2FYVqD15tGram9cbEEt92culeN0FhDe6fW6
	c+L/KKVTunqcMciqZHtOoRs7cQXsxfh9fn1SEuDOv7aU9N0XwMJoH0gHPqNFbPKTQm8rhoY+PmL
	DWulxhqQDEN9D3nterFuBwdjLvaTUW5ErURRKriDxraPgy4FARaRJxp1Vp0ydNcA6wMamTpCl2D
	0A9DboNRTe4LdYM4l4cbH5kkRuzpV3hHUT960a7kGqZflqINR/HbAISbhbw47v6xLs1okYrikT9
	2+JTO68TELcuJPZGxnEtWOP98mtqa6r2By1QyAY2FSDp+jbSUIE+IlhKvKe3WcKUKsZNWAfGvG+
	XRHUKwK12SSiamJspC3ccp2f5RxwXC3YELZWAItmdJGv0YwH1MRYqbP0ONhNr6Og6lCIAJCQ4=
X-Received: by 2002:a17:906:2092:b0:b9c:578c:50a8 with SMTP id a640c23a62f3a-b9c67b51d8bmr740233066b.51.1775717401733;
        Wed, 08 Apr 2026 23:50:01 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c11sm747220966b.30.2026.04.08.23.50.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 23:50:00 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66bb4d4fcb4so1032507a12.2
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 23:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdzlqLQfXInTiBBBcLKSTWI9NKV2STxE3xp6tm9iObxgWgOMXSMuO5gGH4hsA5ijkIvY7gQz4rJzgyjw==@vger.kernel.org
X-Received: by 2002:a17:907:6e92:b0:b9d:33b5:6ba1 with SMTP id
 a640c23a62f3a-b9d33b56dfdmr256685766b.15.1775717399530; Wed, 08 Apr 2026
 23:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-4-jp@jphein.com>
In-Reply-To: <20260331003806.212565-4-jp@jphein.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 9 Apr 2026 08:49:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCs2Mt1XziD9w6Dv1uid82UdkeQ2EuyU0+W1RxtqaHTyPw@mail.gmail.com>
X-Gm-Features: AQROBzBsfD4ymzSBIuuyaH-Qc_jqwlmKYUxuJe2TlFq6gdFCbWCcLr_Y33tBcFQ
Message-ID: <CANiDSCs2Mt1XziD9w6Dv1uid82UdkeQ2EuyU0+W1RxtqaHTyPw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TAGGED_FROM(0.00)[bounces-58306-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,jphein.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim]
X-Rspamd-Queue-Id: CD9C83C6B19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi JP

When we add a quirk to the list we include the output of `lsusb -v -d
1532:` to the commit message. Please add it to your next version.

Thanks!

On Tue, 31 Mar 2026 at 02:38, JP Hein <jp@jphein.com> wrote:
>
> The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
> two failure modes that cascade into full xHCI host controller death,
> disconnecting every USB device on the bus:
>
>   1. LPM/autosuspend resume: the device fails to reinitialize its UVC
>      endpoints on resume, producing EPIPE on SET_CUR. The stalled
>      endpoint triggers an xHCI stop-endpoint timeout.
>
>   2. Rapid control transfers: sustained rapid SET_CUR operations
>      (hundreds over several seconds) overwhelm the firmware.
>
> Add the device to the UVC driver table with:
>
>   - UVC_QUIRK_CTRL_THROTTLE: rate-limit SET_CUR (50ms interval) and
>     skip error-code queries after EPIPE to prevent crash trigger #2.
>
>   - UVC_QUIRK_DISABLE_AUTOSUSPEND: prevent USB autosuspend transitions
>     that trigger crash #1. Same approach as Insta360 Link.
>
>   - UVC_QUIRK_NO_RESET_RESUME: avoid the fragile reset-during-resume
>     path. Same approach as Logitech Rally Bar.
>
> Cc: stable@vger.kernel.org
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
> Signed-off-by: JP Hein <jp@jphein.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b0ca81d92..e8b4de942 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2920,6 +2920,23 @@ static const struct usb_device_id uvc_ids[] = {
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
> +
>         /* Kurokesu C1 PRO */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.43.0
>


-- 
Ricardo Ribalda

