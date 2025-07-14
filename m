Return-Path: <linux-media+bounces-37686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A08FB044DA
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2C2C7A4B67
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD42A25BF13;
	Mon, 14 Jul 2025 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m2wIi5D5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D10A1F4615
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752508673; cv=none; b=buYXMwou4b9YbFz0rx0ORsBYocZ/eJPo1o4922IfJUSPNVI0OMLKwrQv3lnB3HQEF9qxuq9h2lYYsOOfrh/ehqpegH2hvZ5wMKiiXH5E/VUt4JFjJpLriKMXo7kpt6n12mFuDIgT6pQc1P+MJEeSdR/YP7ec3Hv1W/jMbaEwCx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752508673; c=relaxed/simple;
	bh=BUEqJYqut2iTVt5+5KMeLcGgtNQULwQgbWxEHQyKu2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCDzcbEcOnn6kDMbwv5XSHKBYOnVSG8141a9+hJFtYlzcuMCpS7Hn30LOJGU3cHZCLQCa9NOBrGcLCghkhyY/KY9586gXWY5sPQvdUd0GBKsPGOoyB9ihl8ZFCvTfkEm9PnlGc+PkK73w/8OqDHBEVxH8rHPZpN9LMvKQsHgazo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m2wIi5D5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso938576666b.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752508670; x=1753113470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JOUTiRTHZw62UnMALOtaZI8EYRouFJiKeX0szARAd/k=;
        b=m2wIi5D5oiDts0HYjSF/KqCbmAzCa/IQKmKae8OxFWHDKpXySWm/qwEuHwWbv1LuDi
         xuqh1IChny4QoKh2lMeiDFw5CMYiuw5D+ys/6fK88g1RxTpauELK8+Q2cvT7CuWN7KYA
         2K6XfnKnR18sU5flRjUDp/Ik+BXtODhZC/9sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508670; x=1753113470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOUTiRTHZw62UnMALOtaZI8EYRouFJiKeX0szARAd/k=;
        b=I9Y4/vNrinpcPRBRYUOpK2Wk6oHMQESsJRhURdad8jcDADyJoSyLEZyHgudb5Z4C9i
         ayl9Fm6jZFS3iVaDhXr2uMlAOBQr+T4/VhSDF5d0lkk79ebYvzCoqIcINN1taVID3LZM
         pdhbrGlZfCJ2jbGLFsiX5gZXQYg7pxrolhZardm/caJBOVrSRDHZdoufDDGagMjMvncp
         rXc50fPosDdPmXnbNeVWPL8Wdy5EWY+ex8kD/605ruCendQRAo5qpHYjYhezsYqiZE5h
         BOGGYU4I+3eBkhv7MnOr6cpV+Zw2QPthGX+6N+G8YMHgPe9AnDVANZTftTJjfJTYIKPv
         3uBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk1twCbMFcDJogmOVSepqLXb8kUq4gqCjzKj0Y80clh/QuYgEHunJc1e2qL+HD5AZKLykyKUyMDi1G/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk7gxdPraxqHNbqJ8LP4CpDt/lqP+5rM93BLRSAX2MLQMFv0TL
	ZQTViDrejZlcR+Lug6iBFdb7lX//yHJtYAgObIHGvtYjhRaBxTVnlIYPqo+Ny+gQUCzysvqiBro
	AC+mJMA==
X-Gm-Gg: ASbGnctwGx6zHkKzk+cNjgXOYau0Y8UAtBEnCAWJvof+6v4V8KG7vy1AMNz+nlHEdMt
	SCWuHcAK1/FCh51X3CnhK1vTZStVU+hIL4fWN3izO1YbqAFSJkfhabzSfUae77CeaE01lbAbjQJ
	oPLMcKBL7wc+oNrDodL2oabli6S+D+lKcA+vBmnTvUbrqZs0/fcoY8phHOWqbh4CIv17skuTf2c
	IkYbVkmnt6auT1N56g+TSEvwyZQRLvlrKuY8Vwco9cmIqgOkLObJ5Ty86hOOiopTRoT85OSzAbI
	FmzHakhqCMCgWyZTGa7CyNChDqnnjXt2CuSbYk4kUW1xTLFxLrupnLoC8MiDCHqRqEpXbEnbnYZ
	v5GKHQ13UExIEF9IXWWf+UI7Iu5lJKYSTmokmGxLenxiDhA67uEQ1rDve9nS3
X-Google-Smtp-Source: AGHT+IG3uOFvZnhbD1T+cW2slvZOWLEB0zKqapO2i0IHykdMFoeGVG9jMOHQ9RIwTni3Hum7ANZpwQ==
X-Received: by 2002:a17:907:1b26:b0:ade:4593:d7cd with SMTP id a640c23a62f3a-ae6fca442f9mr1375214166b.13.1752508669592;
        Mon, 14 Jul 2025 08:57:49 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6120be9e67asm3663180a12.57.2025.07.14.08.57.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:57:49 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso8443979a12.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:57:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRXv+MNi1NKbDs+rkpECU3g7zS4BriuMobpk/PxoWQnpmbxecHFgJ/iZNW4YYGGI9yCrCLW+4eDueMxA==@vger.kernel.org
X-Received: by 2002:a05:651c:214c:b0:32a:8035:3f65 with SMTP id
 38308e7fff4ca-3305348a560mr20431831fa.36.1752508279445; Mon, 14 Jul 2025
 08:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-9-5710f9d030aa@chromium.org> <e573334d-da02-4d67-95ad-d372aa7f4a67@kernel.org>
In-Reply-To: <e573334d-da02-4d67-95ad-d372aa7f4a67@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 17:51:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCu0uHa9EAwyr-4AMdU_UL0k1YxPdT+YKX6yS22nyWw_DA@mail.gmail.com>
X-Gm-Features: Ac12FXwXunI1HhkoiTEAA1El4jNCwDB1UDYcjdPHccPPCbsUo8Spnc2mel0__-w
Message-ID: <CANiDSCu0uHa9EAwyr-4AMdU_UL0k1YxPdT+YKX6yS22nyWw_DA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] media: uvcvideo: Add uvc_ctrl_query_entity helper
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 16:24, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 5-Jun-25 19:53, Ricardo Ribalda wrote:
> > Create a helper function to query a control. The new function reduces
> > the number of arguments, calculates the length of the operation and
> > redirects the operation to the hardware or to the entity private
> > functions.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Thanks, this looks like a nice cleanup.
>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 81 ++++++++++++++++++++--------------------
> >  1 file changed, 41 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index b2768080c08aafa85acb9b7f318672c043d84e55..21ec7b978bc7aca21db7cb8fd5d135d876f3330c 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -576,6 +576,34 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
> >                                 V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
> >  };
> >
> > +static int uvc_ctrl_query_entity(struct uvc_device *dev,
> > +                              const struct uvc_control *ctrl, u8 query,
> > +                              void *data)
> > +{
> > +     u16 len;
> > +
> > +     switch (query) {
> > +     case UVC_GET_INFO:
> > +             len = 1;
> > +             break;
> > +     case UVC_GET_LEN:
> > +             len = 2;
> > +             break;
> > +     default:
> > +             len = ctrl->info.size;
> > +     }
> > +
> > +     if (query == UVC_GET_CUR && ctrl->entity->get_cur)
> > +             return ctrl->entity->get_cur(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_INFO && ctrl->entity->get_info)
> > +             return ctrl->entity->get_info(dev, ctrl->entity,
> > +                                           ctrl->info.selector, data);
> > +
> > +     return uvc_query_ctrl(dev, query, ctrl->entity->id, dev->intfnum,
> > +                           ctrl->info.selector, data, len);
>
> Maybe:
>
>         if (query == UVC_GET_CUR && ctrl->entity->get_cur)
>                 return ctrl->entity->get_cur(dev, ctrl->entity,
>                                              ctrl->info.selector, data, len);
>         else if (query == UVC_GET_INFO && ctrl->entity->get_info)
>                 return ctrl->entity->get_info(dev, ctrl->entity,
>                                               ctrl->info.selector, data);
>         else
>                 return uvc_query_ctrl(dev, query, ctrl->entity->id, dev->intfnum,
>                                       ctrl->info.selector, data, len);
>
> ?
>
> That + Laurent's well observed remark about info->selector vs
> ctrl->info.selector which I would probably have missed...
>
> About Laurent's remark about one case of this pre-existing,
> please fix this in a separate patch (I guess you would have done so
> anyways, but just to be sure).

I have changed the code a bit so we can always rely on
ctrl->info.selector. I have made a small "preparation patch" getting
ready for it. Keep an eye on the next version ;)

There is no need to send a new patch fixing the current code because
the only controls that could have invalid ctrl->info.selector are xu
and software entities are not xu.

Regards!
>
> Regards,
>
> Hans
>
>
>
>
>
> > +}
> > +
> >  static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping(
> >       struct uvc_video_chain *chain, struct uvc_control *ctrl)
> >  {
> > @@ -1222,35 +1250,27 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
> >       int ret;
> >
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> > -             ret = uvc_query_ctrl(chain->dev, UVC_GET_DEF, ctrl->entity->id,
> > -                                  chain->dev->intfnum, ctrl->info.selector,
> > -                                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> > -                                  ctrl->info.size);
> > +             ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_DEF,
> > +                                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
> >               if (ret < 0)
> >                       return ret;
> >       }
> >
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
> > -             ret = uvc_query_ctrl(chain->dev, UVC_GET_MIN, ctrl->entity->id,
> > -                                  chain->dev->intfnum, ctrl->info.selector,
> > -                                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN),
> > -                                  ctrl->info.size);
> > +             ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_MIN,
> > +                                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> >               if (ret < 0)
> >                       return ret;
> >       }
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) {
> > -             ret = uvc_query_ctrl(chain->dev, UVC_GET_MAX, ctrl->entity->id,
> > -                                  chain->dev->intfnum, ctrl->info.selector,
> > -                                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX),
> > -                                  ctrl->info.size);
> > +             ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_MAX,
> > +                                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> >               if (ret < 0)
> >                       return ret;
> >       }
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES) {
> > -             ret = uvc_query_ctrl(chain->dev, UVC_GET_RES, ctrl->entity->id,
> > -                                  chain->dev->intfnum, ctrl->info.selector,
> > -                                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES),
> > -                                  ctrl->info.size);
> > +             ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_RES,
> > +                                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> >               if (ret < 0) {
> >                       if (UVC_ENTITY_TYPE(ctrl->entity) !=
> >                           UVC_VC_EXTENSION_UNIT)
> > @@ -1291,16 +1311,7 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> >               return 0;
> >       }
> >
> > -     if (ctrl->entity->get_cur)
> > -             ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
> > -                                         ctrl->info.selector, data,
> > -                                         ctrl->info.size);
> > -     else
> > -             ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > -                                  ctrl->entity->id, chain->dev->intfnum,
> > -                                  ctrl->info.selector, data,
> > -                                  ctrl->info.size);
> > -
> > +     ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_CUR, data);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -2164,11 +2175,8 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >                       continue;
> >
> >               if (!rollback)
> > -                     ret = uvc_query_ctrl(dev, UVC_SET_CUR, ctrl->entity->id,
> > -                             dev->intfnum, ctrl->info.selector,
> > -                             uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > -                             ctrl->info.size);
> > -
> > +                     ret = uvc_ctrl_query_entity(dev, ctrl, UVC_SET_CUR,
> > +                             uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> >               if (!ret)
> >                       processed_ctrls++;
> >
> > @@ -2570,13 +2578,7 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
> >       if (data == NULL)
> >               return -ENOMEM;
> >
> > -     if (ctrl->entity->get_info)
> > -             ret = ctrl->entity->get_info(dev, ctrl->entity,
> > -                                          ctrl->info.selector, data);
> > -     else
> > -             ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
> > -                                  dev->intfnum, info->selector, data, 1);
> > -
> > +     ret = uvc_ctrl_query_entity(dev, ctrl, UVC_GET_INFO, data);
> >       if (!ret) {
> >               info->flags &= ~(UVC_CTRL_FLAG_GET_CUR |
> >                                UVC_CTRL_FLAG_SET_CUR |
> > @@ -2654,8 +2656,7 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
> >       info->selector = ctrl->index + 1;
> >
> >       /* Query and verify the control length (GET_LEN) */
> > -     ret = uvc_query_ctrl(dev, UVC_GET_LEN, ctrl->entity->id, dev->intfnum,
> > -                          info->selector, data, 2);
> > +     ret = uvc_ctrl_query_entity(dev, ctrl, UVC_GET_LEN, data);
> >       if (ret < 0) {
> >               uvc_dbg(dev, CONTROL,
> >                       "GET_LEN failed on control %pUl/%u (%d)\n",
> >
>


-- 
Ricardo Ribalda

