Return-Path: <linux-media+bounces-7825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E288C509
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 15:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C35B1C33FE2
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 14:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFDA12D774;
	Tue, 26 Mar 2024 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F/kzOvYe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BFA12D758
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711462993; cv=none; b=Yf9Zi21+JxCah4tNjqIjr/75JOIS/kzwbyYhUQwKOlobyogkI9gOlmm4vPJeJZD5TM/Izd5/wrRrs3aIdJLpnakywdzcPty2UwCub0+6KiK8jQwlJcSCSIIXL17dL9tiXs6ld8TmVyM80+DDYPxmbwHGBEctuPurnIUN/DHFtP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711462993; c=relaxed/simple;
	bh=d6SwhLp5lo5bs/sFKg2UCaH4qFGw7c/LCreIuG1S3Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZolegTYjyzNtd+gEsDFGw6smymkxvtq1beJtp76sEaSEswfh6Rhc3ADmQnGBGoOPc6Zl8pFyOygDgr/Oz8Wzq7BUKJu2s7jn5ETjrEfOlwAiRhzn9X5X4u1KG6E4Kt0CWCb1Mw9n9JRLjrcp1NMXctz26nFGgX3h4VRUVw2k4Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F/kzOvYe; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e673ffbd79so3246894a34.2
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711462990; x=1712067790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FCVKphXqJhysVOrlVCzs0FHTB50D+Xwwv1XZwlRbuys=;
        b=F/kzOvYeV5+eWwt7nKjG8ORBIIDHjaXfT+lO8wTq9m2tIFd9nOPXELqe0pKdKgjOQh
         J2hzOFGOCCWHr0JKtAd3eORKKuZ4pXNMejqGtxfG+uzQQjKMN5AitTf6p4BE/9U+TyX7
         Z2W3fBduqt3O0kbS+qo5aleM1TJsvWWdzabI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711462990; x=1712067790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCVKphXqJhysVOrlVCzs0FHTB50D+Xwwv1XZwlRbuys=;
        b=DuVnlj85s9mBy2RzUKNU++w0bJA3H1HfGxx/WEooQh/4tvR+NGm0e1vfjorlZVCqZA
         Ng10OEI+Ca4dJr2F1gGmVsG2w1z/VoyvDI8LQ93pgrtOWBB31zWt1jhuHm55wU3iOXtV
         B3jFupAmtXqlAQDMFP2iACeGAtbgOvMzQDu4JvCZOIJj0GTTYAmgYyfcgkzIZ0F9Uj0G
         GW84mo/1C1hNgn0jVVV/QkVqHOHSNu1MNFHdGlpDJmSE6sFqKwEAXyxOtj9v0zRxkYiy
         8vAOucHgndSKZ4ck5IsZ2FjjiG/NnPsYBWaQiznFDaR9KuMt2H2av29rXV3qPNsH6gxw
         xonQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsF72Eh0KGiCTGNrxcWqHVA6yb7vcoustW3P58TZdDr6Ak44JoVZd1hpWv8w8A9ntpuLNddUYXBfzhXZOO/Z8+U8xmhLRVE/twiS8=
X-Gm-Message-State: AOJu0YzqZBo6p07i/EiHR6LUBjkAvBBCN38/dXYLteiX4pwbsX8YQPbG
	9/jC2SuwsBGv0TZ/MW/0kcJ3wJWNNcdQmgFgWFjeHan4IKD1DfacNKiR6OH5gv5oL1ocIkAVzM9
	Itw==
X-Google-Smtp-Source: AGHT+IHvWVvj0v9Qa6dMgIHKAlt+Logm1XLvaMQFkE/qhv0LGD8BKM8dwQ96iR7XvQB6UbfG43abtg==
X-Received: by 2002:a9d:74cc:0:b0:6e6:8916:da26 with SMTP id a12-20020a9d74cc000000b006e68916da26mr11272120otl.1.1711462990220;
        Tue, 26 Mar 2024 07:23:10 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id g48-20020a05683030b000b006e6b5bfaa8asm1557191ots.14.2024.03.26.07.23.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 07:23:09 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c3d404225dso876593b6e.3
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 07:23:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVN1JdXJz91Qca2/5i4EkKiZASdISZnkDOmxhm1lFSeL9lzZirRw+AniTlTNY6Q+9B7unYXJdV5o5tGsuDi8KiC4XHVWkdj5i0Dpo0=
X-Received: by 2002:a05:6808:2742:b0:3c3:b64d:c0d with SMTP id
 eh2-20020a056808274200b003c3b64d0c0dmr10062648oib.48.1711462989082; Tue, 26
 Mar 2024 07:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-uvc-relative-ptz-speed-fix-v1-1-453fd5ccfd37@securitylive.com>
In-Reply-To: <20240326-uvc-relative-ptz-speed-fix-v1-1-453fd5ccfd37@securitylive.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Mar 2024 15:22:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCtdgQhAyeLm89W-zNsMsNAVY0Ey5tZ4XpemzaZHXf8ZFQ@mail.gmail.com>
Message-ID: <CANiDSCtdgQhAyeLm89W-zNsMsNAVY0Ey5tZ4XpemzaZHXf8ZFQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.
To: johnebgood@securitylive.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>, linh.tp.vu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

Thanks for your patch. If we confirm that there are no devices with
ranges [-A,B], with A!=B, then it looks like the way to go

I would have removed the

 return -data[first+1];

from uvc_ctrl_get_rel_speed(), as it becomes now dead code.

And I would have done it a little bit different with the switch, but I
have no idea what Laurent prefers ;):

@@ -1334,6 +1333,18 @@ static int __uvc_query_v4l2_ctrl(struct
uvc_video_chain *chain,
                v4l2_ctrl->step = mapping->get(mapping, UVC_GET_RES,
                                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));

+       switch (v4l2_ctrl->id) {
+       case V4L2_CID_ZOOM_CONTINUOUS:
+       case V4L2_CID_PAN_SPEED:
+       case V4L2_CID_TILT_SPEED:
+               /*
+                * For the relative speed implementation the minimum
+                * value cannot be probed so it becomes the additive
+                * inverse of maximum.
+                */
+               v4l2_ctrl->minimum = -v4l2_ctrl->maximum;
+       }
+
        return 0;
 }

@@ -1919,6 +1930,18 @@ int uvc_ctrl_set(struct uvc_fh *handle,
                if (step == 0)
                        step = 1;

+               switch (xctrl->id) {
+               case V4L2_CID_ZOOM_CONTINUOUS:
+               case V4L2_CID_PAN_SPEED:
+               case V4L2_CID_TILT_SPEED:
+                       /*
+                        * For the relative speed implementation the minimum
+                        * value cannot be probed so it becomes the additive
+                        * inverse of maximum.
+                        */
+                       min = -max;
+               }
+
                xctrl->value = min +
DIV_ROUND_CLOSEST((u32)(xctrl->value - min),
                                                        step) * step;
                if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)



On Tue, 26 Mar 2024 at 10:02, John Bauer via B4 Relay
<devnull+johnebgood.securitylive.com@kernel.org> wrote:
>
> From: John Bauer <johnebgood@securitylive.com>
>
> The minimum UVC control value for the relative pan/tilt/zoom speeds
> cannot be probed as the implementation condenses the pan and tilt
> direction and speed into two 16 bit values. The minimum cannot be
> set at probe time because it is probed first and the maximum is not
> yet known. With this fix if a relative speed control is queried
> or set the minimum is set and checked based on the additive inverse of
> the maximum at that time.
>
> Signed-off-by: John Bauer <johnebgood@securitylive.com>
> ---
> Gergo noticed that a quirk fix would not be needed and the just
> the minimum value needed to be set. Thanks Ricardo, Linh and Gergo
> for helping me along here. The reason the problem presented is that
> the minimum probe is done before the maximum however the way the
> driver has condensed direction and speed controls
> (with great simplification benefit to the user) the minimum
> value must be derived from the maximum and negated. This
> fix gets/checks/sets the correct relative minimum value when
> needed instead of of at probe time. This minimum value does not
> reflect the UVC 1.5 spec but the simplified condensed
> implementation of the driver; it's beautiful.
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e59a463c2761..b389ab3ee05d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1322,9 +1322,25 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>                 break;
>         }
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> -               v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
> -                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
> +               switch (v4l2_ctrl->id) {
> +               case V4L2_CID_ZOOM_CONTINUOUS:
> +               case V4L2_CID_PAN_SPEED:
> +               case V4L2_CID_TILT_SPEED:
> +                       /*
> +                        * For the relative speed implementation the minimum
> +                        * value cannot be probed so it becomes the additive
> +                        * inverse of maximum.
> +                        */
> +                       v4l2_ctrl->minimum = -1 * mapping->get(mapping, UVC_GET_MAX,
> +                                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +                       break;
> +               default:
> +                       v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
> +                                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> +                       break;
> +               }
> +       }
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
>                 v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
> @@ -1914,6 +1930,21 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
>                 max = mapping->get(mapping, UVC_GET_MAX,
>                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +
> +               /*
> +                * For the relative speed implementation the minimum
> +                * value cannot be probed so it becomes the additive
> +                * inverse of maximum.
> +                */
> +               switch (xctrl->id) {
> +               case V4L2_CID_ZOOM_CONTINUOUS:
> +               case V4L2_CID_PAN_SPEED:
> +               case V4L2_CID_TILT_SPEED:
> +                       min = max * -1;
> +               default:
> +                       break;
> +               }
> +
>                 step = mapping->get(mapping, UVC_GET_RES,
>                                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
>                 if (step == 0)
>
> ---
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> change-id: 20240325-uvc-relative-ptz-speed-fix-2011aea68b5f
>
> Best regards,
> --
> John Bauer <johnebgood@securitylive.com>
>
>


-- 
Ricardo Ribalda

