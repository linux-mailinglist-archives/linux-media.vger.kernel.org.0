Return-Path: <linux-media+bounces-7787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB05B88B32A
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 22:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 470B6BC236C
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8492823DC;
	Mon, 25 Mar 2024 17:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ERBHhPvM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DA533EE
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711386296; cv=none; b=sHxgHRtvIkdTmG5BhOhdR2QKMQMWkqPc0c9veTt2RMtzZGZGWeqmEtJl/OCT3NW6Dn0cg4Mcz02mChVAx7QOlDYOyEgWL2ifRKmQ0N1zEkfcPRLvyscb2mnAnmG6OdkFpeTOVKnVuOWLkqAWgGehVNnPBEH3bwYE4xl5VKlxkG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711386296; c=relaxed/simple;
	bh=zjq/DG+cvqgMsUiNYMDQivFwwYewiSLnwOQ/SJ2xIN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DaoEh8F7+UXxNPPt92aKSznJzl9mwcuorSuIbpsmN6FT4zzNHU2oOtLNYdKFKUmuhxqwBMfbCWnuUeFKttrq4mw496YfP+YPYvhPcjoSRz94KZJ20BBnW2khF3aBI9IxGGSx4yrqf337fQUKT3DT7trTN5/Y43Q8WCuaGLK0l2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ERBHhPvM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c0613307cso1941131a12.0
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 10:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711386292; x=1711991092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1OzGkAHHwhk46wpPgQoszCwUFmzjSqr7ix6aP2YTnA=;
        b=ERBHhPvM/K6cjyXud4A8CH7BNpjEMm2UepBP69+CnXalPfIoO++u/maWFXz5F7NdBh
         LS1w6YyYlRHBxnSDRZeqraKn9FzDxZtGTpfLpPLqQxQIdKOs1jfCr34nWEhDqqQJZpSt
         CEZjik2PQ1911reJ+xBKpDH7AxiKCjj1VUTiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711386292; x=1711991092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1OzGkAHHwhk46wpPgQoszCwUFmzjSqr7ix6aP2YTnA=;
        b=xDqMJ9knPdGJux5V2y/MWULD5dlc7jjNZHsZyX8ZlC2kcbeBkHmQ4LN5X9ec5IFCFa
         9K8c2euzeTrAYPBInGuJ05aEko6NGXdny8wD6VU6Mg59vhHkHtzq+Q0A80KKUpcePkWQ
         rvhTE6Ejq8fLVJ9+Bga2iIsqYcdSdL+zWgW7K47CEJBd3xgN63k+RW7/eT/NLyw4DHGh
         wMdezb9fpU26VfbBKrPmFNMUSjdVcgbdR+ds0iO92U8gKKhOwDpadDdp5/cUSljX8tks
         sFVRuA6gxMBslNJ7yuas+mPv3qq7xAWSplYgYi8hQAxMpN8Mo6s1QB2ZGdQmvjGyKW+9
         pbHg==
X-Forwarded-Encrypted: i=1; AJvYcCV4oC/H7oqnSyE6Aus/vCc8ORrifhqm5ecS6gWvUXUJKjwZcmyqHxXvrW2jOf5UrDgwQLwerkOOctkoUCP2080u+xRassXwgNwYA2U=
X-Gm-Message-State: AOJu0Yy2tsewIysdzZX8XdnSTotBw2KP+iQX0DZKlpScqV0xPKNCuDa9
	C/+L4c/yL2xccq5x+KVsjUKxHSCubtwNkQe/yjLpBPcQ72ePxAda8y6jwNdzaVXn4CQpxLYOUXC
	OURaUCmC6QCZyFJ36koYkGsVfWFAyeF+KbsuB6uvnzPyjs7QAidPu
X-Google-Smtp-Source: AGHT+IEejAScvSrefYCoLkn7pm1atXa2buUudDkeZGqV6NOGZPyvybcgeav7Hn7Mz3/Sk6Iq4yx7oKnjHqC7bypnfH4=
X-Received: by 2002:a05:6402:34c1:b0:56c:189f:cf2f with SMTP id
 w1-20020a05640234c100b0056c189fcf2fmr1500085edc.32.1711386292471; Mon, 25 Mar
 2024 10:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD4e14uBMtVTYBAWibcsff+FYgZqA-c8RW4qCE7YHSy6xZknKw@mail.gmail.com>
 <20240322163146.43231-1-johnebgood@securitylive.com>
In-Reply-To: <20240322163146.43231-1-johnebgood@securitylive.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 18:04:40 +0100
Message-ID: <CAMrC3HtnBJ+ky7YeJsyX9fP9aR3nF+nMR2-1LBQCqch+0Z1MLw@mail.gmail.com>
Subject: Re: [PATCH] Quirk-fix-for-OBSBOT-Tiny-camera-minimum-settings
To: John Bauer <john@oxt.co>
Cc: linh.tp.vu@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-media@vger.kernel.org, mchehab@kernel.org, soyer@irl.hu, 
	John Bauer <johnebgood@securitylive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John

Thanks for your patch!!!


You probably want to run:

$ scripts/checkpatch.pl --strict -g HEAD

before sending the patch, and fix whatever it says.

On Fri, Mar 22, 2024 at 5:31=E2=80=AFPM John Bauer <john@oxt.co> wrote:
>

You want to add all this comment after the
--

If you use b4 https://b4.docs.kernel.org/en/latest/contributor/overview.htm=
l
(which I strongly recommend, as it it super nice :) )
It will add the cover later there automagically, plus other super
amazing features

> Greetings, this is my first patch in about 30 years so I'm probably
> going to do something wrong so apologies in advance. Below is my working
> patch tested on the OBSBOT Tiny and Tiny 4k. I'm not sure if the override=
s
> can be done in a different way/place. uvc_ctrl_get_rel_speed doesn't have
> a reference to maximum when it's called.

Yeah, that is pretty inconvenient :( we can probably use something
like container_of(), to get that reference, but it would be pretty
ugly.
Other option is modify get/set so it does get a pointer to
ctrl->uvc_data... but that can be a major rework.

@Laurent, any suggesting on what would be the nicest way to implement this.

>
> I am on the OBSBOT Facebook support page which is the only way to get
> support that I can find. I'm really hoping they can fix this in the
> firmware and to fix other issues for example on the OBSBOT Tiny 4k auto
> exposure can't be set in Linux with the UVC driver even though the
> minimum shows it can be 0. I would like to see them add the ability to
> enable/disable AI tracking with a custom XU control as well.

Suddenly there are at least two people talking about this camera :)

Do you have a link to the support page where you report the bug? I am
curious about their response and if the can share how to use the AI
tracking.

There is a series to support ROI:
https://lore.kernel.org/all/20231201071907.3080126-10-yunkec@google.com/
, maybe that is enough to make this work?


>
> Ricardo, I ran the output message you suggested and 0 is being returned
> for zoom and 1 for pan/tilt which is being negated in
> uvc_ctrl_get_rel_speed: return -data[first+1];
>
> [  219.164932] usb 1-4: Found UVC 1.00 device OBSBOT Tiny 4K (3564:fef4)
> [  219.222257] zoom: GET_MIN 00 0x0 00
> [  219.222261] zoom: GET_MAX 00 0x0 064
> [  219.223261] speed: GET_MIN 00 0x1 00
> [  219.223264] speed: GET_MAX 00 0xa0 00
> [  219.223313] speed: GET_MIN 00 0x1 00
> [  219.223314] speed: GET_MAX 00 0x78 00
> [  219.368848] usb 1-7.3: Found UVC 1.10 device OBSBOT Tiny (3564:fef0)
> [  219.405003] zoom: GET_MIN 00 0x0 00
> [  219.405006] zoom: GET_MAX 00 0x0 064
> [  219.405361] speed: GET_MIN 00 0x1 00
> [  219.405362] speed: GET_MAX 00 0xa0 00
> [  219.405368] speed: GET_MIN 00 0x1 00
> [  219.405369] speed: GET_MAX 00 0x78 00

Thanks for testing this out, I wonder if *all* the other devices
implementing this controls behave similar. From the spec it is not
clear to me waht get_min should return.

>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 29 +++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 46 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index e59a463c2761..509eb7ed652a 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1322,9 +1322,22 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_=
chain *chain,
>                 break;
>         }
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
>                 v4l2_ctrl->minimum =3D mapping->get(mapping, UVC_GET_MIN,
> -                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MI=
N));
> +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA=
_MIN));
> +
> +               if (chain->dev->quirks & UVC_QUIRK_OBSBOT_MIN_SETTINGS) {
> +                       switch (v4l2_ctrl->id) {
> +                       case V4L2_CID_ZOOM_CONTINUOUS:
> +                       case V4L2_CID_PAN_SPEED:
> +                       case V4L2_CID_TILT_SPEED:
> +                               v4l2_ctrl->minimum =3D -1 * mapping->get(=
mapping, UVC_GET_MAX,
> +                                                    uvc_ctrl_data(ctrl, =
UVC_CTRL_DATA_MAX));
> +                       default:
> +                               break;
> +                       }
> +               }
> +       }
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
>                 v4l2_ctrl->maximum =3D mapping->get(mapping, UVC_GET_MAX,
> @@ -1914,6 +1927,18 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN)=
);
>                 max =3D mapping->get(mapping, UVC_GET_MAX,
>                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX)=
);
> +
> +               if(chain->dev->quirks & UVC_QUIRK_OBSBOT_MIN_SETTINGS) {
> +                       switch (xctrl->id) {
> +                       case V4L2_CID_ZOOM_CONTINUOUS:
> +                       case V4L2_CID_PAN_SPEED:
> +                       case V4L2_CID_TILT_SPEED:
> +                               min =3D max * -1;
> +                       default:
> +                               break;
> +               }
> +               }
> +
>                 step =3D mapping->get(mapping, UVC_GET_RES,
>                                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES=
));
>                 if (step =3D=3D 0)
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index bbd90123a4e7..8cc2fe144887 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3120,6 +3120,24 @@ static const struct usb_device_id uvc_ids[] =3D {
>           .bInterfaceSubClass   =3D 1,
>           .bInterfaceProtocol   =3D 0,
>           .driver_info          =3D UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* OBSBOT Tiny 1080p pan, tilt, zoom min settings quirk */
> +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             =3D 0x3564,
> +         .idProduct            =3D 0xfef0,
> +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   =3D 1,
> +         .bInterfaceProtocol   =3D 0,
> +         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_OBSBOT_MIN_S=
ETTINGS) },
> +       /* OBSBOT Tiny 4k pan, tilt, zoom min settings quirk */
> +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             =3D 0x3564,
> +         .idProduct            =3D 0xfef4,
> +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   =3D 1,
> +         .bInterfaceProtocol   =3D 0,
> +         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_OBSBOT_MIN_S=
ETTINGS) },
>         /* Generic USB Video Class */
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINE=
D) },
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index 6fb0a78b1b00..0e2f083a5c0e 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -73,6 +73,7 @@
>  #define UVC_QUIRK_FORCE_Y8             0x00000800
>  #define UVC_QUIRK_FORCE_BPP            0x00001000
>  #define UVC_QUIRK_WAKE_AUTOSUSPEND     0x00002000
> +#define UVC_QUIRK_OBSBOT_MIN_SETTINGS 0x00004000
>
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
> --
> 2.34.1
>

