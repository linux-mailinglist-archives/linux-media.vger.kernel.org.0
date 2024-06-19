Return-Path: <linux-media+bounces-13656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA7290E32B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 08:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D58C71F22610
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 06:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697B74405;
	Wed, 19 Jun 2024 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bkJ4dhoT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061624A1D
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 06:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718777743; cv=none; b=AXYF0tPN0hV04XVsFNIlQkKov6lnOoCadQqCkrFNfKESUNLf3vOceCMP7nyOqgsoeynlX42wuzMfNgCK/RhHs4EqyS9aMmTwwGDmMT6ElLm/5zfYuj624ZIEroaXdy2cF7bw3sMA3LXZ+9HLqMbRVZKhPBqE3gVKSzhz39oiVkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718777743; c=relaxed/simple;
	bh=E32afqFs5Lu7Y5oNxXL0EzLi11zTM40ymyrgpPSVGoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2WJKBkGlPwiwU9kQgF8R735moA9hjyaGi6UELn21QLdpOq2Y4wM45hVXHi457jubKpgOoM6sKM8fxlx8kRinsC8fqehxyJSy7t6bCm9aAgtOpsJWG2KLeLpyNK1LLKOX/BshMhvFZHrj7qaeMjyeGPCD6GzG88EdBYmV5I0T/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bkJ4dhoT; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso8294417e87.1
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 23:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718777740; x=1719382540; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r1bGbDKaKhkn1mQHGSzAalsmolUgZrz+Gk53FfmEtnk=;
        b=bkJ4dhoT5j2p7z2PhgH/u554ZngPrlDFr7Bzc5o/ea/DfWAn26/aPnfJMhbNCiO7fF
         w5qBiSKjlAolzcrnFS4JTA/CW/a3xw0kBvDJd2Zy546GC/a1HUi5k2i7cgBh1J4kLHBs
         THpdtU729OcWrYiBmIv2Ohiz5i5A4ketkx/3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718777740; x=1719382540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1bGbDKaKhkn1mQHGSzAalsmolUgZrz+Gk53FfmEtnk=;
        b=dpbfYKmBT3Tr/vn0KACioaEyQlbqEJ2gwP3pQpP830VSYRVynSBaGy3FDR7zMVdZd7
         n7fkADZLqaRrIQHNmpaxjjidO/AVsZmowtCnMXGEjQgzSPKC8Iy5bErWkhHenTmsmTmt
         liqCFsQZ8dj1ooULQ1RyMNf6CZAcYWAN9V+WkkfaWktKcPI3Pu4H4gaB+F2FPk1mfSEa
         ZDTqAREZ+T7Y0rXsgEosgYInQ7T6MSyXPRK7oxYcYkZRxIZRyibNGrBV7+0qKLvs90DJ
         tmFv8qnhH3y/1f/v6/EIoNQJ02E2f2qNN12/QO/T++OhBqh0gqRnpukzXRImdm19EaGs
         0hMg==
X-Forwarded-Encrypted: i=1; AJvYcCWelElsYjvqpaT+3r+5Iv5qmRK3+qksk/RXReZ/y9ipmKEkJJ3mPI5wiGdxUwTpCWqKK8qf31TUOQ0D3XKtFarfPafOc4PO3ngGWTY=
X-Gm-Message-State: AOJu0YwvsWXs6Ix3JSjbLGhQYEthWCacHeSfROafa6wocEn9pF3lzaiu
	TxgYUgyjEpAhRcaQ9QO8uinac7l7SjLsqxeCG8RdJc3AAx6i/Mb8B39bCwZunDvius9iF+gOe/r
	T8gf4
X-Google-Smtp-Source: AGHT+IFHiDWgYTQ47rchkpXuWtfJUxpWRcqeoFro0cyp6n5WHAophq0GknWgmunPLfuKV3GZse1MIA==
X-Received: by 2002:a19:2d03:0:b0:52c:8f4e:b1c9 with SMTP id 2adb3069b0e04-52ccaa328famr999090e87.15.1718777739613;
        Tue, 18 Jun 2024 23:15:39 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f4182fsm657031366b.178.2024.06.18.23.15.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 23:15:38 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6cb130027aso420626666b.2
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 23:15:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIZO30aFBpvandP47BdLQVIjjcfxA+T6+ejgNfLdDkvsk8v66VSozSUae+oGr9ZdBwofcvgseG9ZmgsFM6ihxqfLkcnTQsc+2EVBE=
X-Received: by 2002:a50:9359:0:b0:57c:77a1:d1da with SMTP id
 4fb4d7f45d1cf-57d07c37da2mr981271a12.0.1718777737964; Tue, 18 Jun 2024
 23:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718726777.git.soyer@irl.hu> <b062c3ec615a69cbc1b154b1838df3cdc3e1282a.1718726777.git.soyer@irl.hu>
In-Reply-To: <b062c3ec615a69cbc1b154b1838df3cdc3e1282a.1718726777.git.soyer@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Jun 2024 08:15:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCs2MLqdNuZtcQEHhE6c8XXc=4AKNcuHNNgqJKnc9da3Hg@mail.gmail.com>
Message-ID: <CANiDSCs2MLqdNuZtcQEHhE6c8XXc=4AKNcuHNNgqJKnc9da3Hg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: uvcvideo: UVC minimum relative
 pan/tilt/zoom speed fix.
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, John Bauer <johnebgood@securitylive.com>, linh.tp.vu@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gergo

Thanks for your your patch.

On Tue, 18 Jun 2024 at 18:33, Gergo Koteles <soyer@irl.hu> wrote:
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
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 38 +++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4b685f883e4d..93ed2462e90b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -441,7 +441,6 @@ static s32 uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
>                 return (rel == 0) ? 0 : (rel > 0 ? data[first+1]
>                                                  : -data[first+1]);
>         case UVC_GET_MIN:
> -               return -data[first+1];
>         case UVC_GET_MAX:
>         case UVC_GET_RES:
>         case UVC_GET_DEF:
> @@ -1233,6 +1232,17 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>         return ~0;
>  }
>
> +static bool is_relative_ptz_ctrl(__u32 ctrl_id)
> +{
> +       switch (ctrl_id) {
> +       case V4L2_CID_ZOOM_CONTINUOUS:
> +       case V4L2_CID_PAN_SPEED:
> +       case V4L2_CID_TILT_SPEED:
> +               return true;
> +       }
> +       return false;
> +}
> +
>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>         struct uvc_control *ctrl,
>         struct uvc_control_mapping *mapping,
> @@ -1322,14 +1332,23 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>                 break;
>         }
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> -               v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
> -                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> -
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
>                 v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
>                                      uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
>
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
> +               /*
> +                * For the relative speed implementation the minimum
> +                * value cannot be probed so it becomes the additive
> +                * inverse of maximum.
> +                */
> +               if (is_relative_ptz_ctrl(v4l2_ctrl->id))
> +                       v4l2_ctrl->minimum = -v4l2_ctrl->maximum;
> +               else
> +                       v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
> +                                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> +       }
> +
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
>                 v4l2_ctrl->step = mapping->get(mapping, UVC_GET_RES,
>                                   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> @@ -1916,6 +1935,15 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
>                 max = mapping->get(mapping, UVC_GET_MAX,
>                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +
> +               /*
> +                * For the relative speed implementation the minimum
> +                * value cannot be probed so it becomes the additive
> +                * inverse of maximum.
> +                */
> +               if (is_relative_ptz_ctrl(xctrl->id))
> +                       min = -max;
> +

nit: The following would probably be more correct but less clear:

if  (is_relative_ptz_ctrl(xctrl->id))
    min = -max;
else
    min = mapping->get(mapping, UVC_GET_MIN,...)

So up to you what do you/Laurent what is better ;)

>                 step = mapping->get(mapping, UVC_GET_RES,
>                                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
>                 if (step == 0)
> --
> 2.45.2
>


-- 
Ricardo Ribalda

