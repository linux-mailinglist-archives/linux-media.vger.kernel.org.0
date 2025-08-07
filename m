Return-Path: <linux-media+bounces-39002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AC0B1D388
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 09:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E9A43BACD6
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55CE244EA1;
	Thu,  7 Aug 2025 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FSJkksqA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A11242D82
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552464; cv=none; b=lHR351pHiJZqia/ntfe44z45J+1LF9lBaMWJfO8MIUUyE6LqJ8gws1mCSTllddy/Ss1JhZx0BMJALl4luW8uPBv+gktJYuxTgQoi3OoqPv4GJcVcXYUrfHntEBfLodrQ/wrelG9mgrdkkGgk4iv9bq6ee4RcJBZKy1vTv5UAYG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552464; c=relaxed/simple;
	bh=FiZl7dBM01nTpHTio21jd/nJKd4QC3gAoTSrHH1QJgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5CuYTfkdckltTAqDLHQlFW3+p/qrqTn2Gq6mhGgpwq437qBnIpSJLYCGZVJ+rk7kNHtfZoh9R6eHOBninQe5otjQtFOAJ5/YOcv3uHIGcHzCFM7YJMEu70G8e+a3AOg82bbzi0OR3PcFdv0R5elWHtGQ6zFDg/GdanYmuWA8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FSJkksqA; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-617b36cc489so1342954a12.0
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 00:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754552460; x=1755157260; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vRngVDSFiad8P3vLgxpfrf7smMW2bm5yBF8353hqHug=;
        b=FSJkksqASltHHf7ONsCZI2lqRKefdCQ7lLfUNGrupfei1veUy/Zfr6+egUUdhwkxU2
         KxTKIC9u7E/5WgY3OiLEXWCCGrCttkyrz8AnPuY0dIT+l6WkOJ3iBAysUNLzUBlx+6XZ
         iC8fNlYehPww8mnHw4n+ijatsANPqokbBb3ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552460; x=1755157260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRngVDSFiad8P3vLgxpfrf7smMW2bm5yBF8353hqHug=;
        b=FJmX/iG1Vh5YpFWb6C3u+NiFpNp5XAxjvKOjZ60nNSy5GUvQypdjRCRBlmNy9ylztM
         0ZzsK2hsdqF5vMH9ABJCGbtujc5Iafvm/lsn/zBbuNMwgJYkB4OmLIibHedUq3wczvbJ
         pJdYHgQAY11vFgrHsVjcXfB2CVLMCOvGgo8wBoZcbLruO31wPVVIQ9xYGZ9CWEaMStVm
         mBbMedkEOc/8sOU1dZxmBxq8FB2mYJhmUk1q72Otx2Fx46F0CvwA2J6j1UyBPpeFKFfJ
         EAWAc/5GDOpajHTRw1uZCYNYPHUNZZ1DJsw4IJSZCmhlaoyHc6n1gQZRM5fjKvkGgJs+
         S2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVnh/zs/ZPNhuwwn5Gw0L6WYYhkQPNwdPFXrWAceOFYfnrspTluARzGxKwYsj2mOGQUpNZcFF9PVsT77w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1InujrQO3JeWs9Ydy2/PsdR7vU9wkXuFkeEf3izyvKABrHM/W
	jNmcZO1enukm3GKOuVcertizh8zg4QJJHBH3b+NbC1FIXXXNQmfR3V+M3xGkyorQtp7CqJDLLyk
	uAfuWzw==
X-Gm-Gg: ASbGnctOs5wEoOnch5SuFC4kTyz2VZkq035YygCudMUdpkbZdi39hXK7Gg/p/nmE9/n
	SV/kjoCIW6d1ICNKN5PrYnLhqXph6wO13YgotXcQbYUK50CePxW+0a7L2ionrp6eZ4Vc/Z6Oqg2
	PAkOUMZRGq0KdbW7zTNxO/XJIyBuyVOFYbOj9nxh4LYLjbsbVGQsrGNwUzC6IpPstjQ8GWFpW0H
	rTFkMydDzoykA/PAtHYKqjdwVxWZTk6xWSG808+BXRMwS3eS0NL4kRxA1+5hO4G7RACQw2+5cjB
	snxAf5TzFhuRkISdCmR5HGZoSzsMRQISSN2/HGezCfIFgVUXWKC1OsEQO+jCQrbLRrFO7IFy8nT
	FDw4pCPC+YYU+SsPmC5qkcQ5fhQyV5hFFP55Mql1wrmvwbYWl+LV6pSow9a3p
X-Google-Smtp-Source: AGHT+IHU7H0QEEsGn9lJKoPrUPTnPlDUOpE3K99l5+TDX40L64bNh6z2LfpQGwfGk/UrOgDSfXb8MA==
X-Received: by 2002:a17:907:72c2:b0:ae0:c6fa:ef45 with SMTP id a640c23a62f3a-af99044eb96mr526375466b.41.1754552460312;
        Thu, 07 Aug 2025 00:41:00 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm1273498266b.17.2025.08.07.00.40.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 00:40:59 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61571192ba5so1158682a12.2
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 00:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3hEwwHijcmGFpKO7RlLMCMDgSpM06PKfMYrY7rqXsEXphuA2AGAw79WLrWrDAm0Lcd6Q4YoymtSel5w==@vger.kernel.org
X-Received: by 2002:a2e:b54b:0:b0:332:2a32:2856 with SMTP id
 38308e7fff4ca-333813c4660mr13208821fa.29.1754552127402; Thu, 07 Aug 2025
 00:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org>
 <20250629181246.GE6260@pendragon.ideasonboard.com> <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
 <20250714142926.GI8243@pendragon.ideasonboard.com> <CANiDSCvFe23xmrJ0-qbWWa6+vKGb+QdDFV8VSLkmWdAnfsFtzw@mail.gmail.com>
 <20250715193505.GB19299@pendragon.ideasonboard.com> <CANiDSCtvt6qnROQ0_-0iG5hqkU_uHZABujZPN7xuh7pUASSGyw@mail.gmail.com>
In-Reply-To: <CANiDSCtvt6qnROQ0_-0iG5hqkU_uHZABujZPN7xuh7pUASSGyw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 7 Aug 2025 09:35:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCsNjBEWR5HA9bhFNnXB7Cazj7o0wBnn53gzpoBBcYFkFw@mail.gmail.com>
X-Gm-Features: Ac12FXyjct6ihC0OshwY5F1qdouFOZPK3DFRcqPyUc52eVa5roZ1nWwW2xk9ZpI
Message-ID: <CANiDSCsNjBEWR5HA9bhFNnXB7Cazj7o0wBnn53gzpoBBcYFkFw@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] media: uvcvideo: Add get_* functions to uvc_entity
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Wed, 16 Jul 2025 at 12:32, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> On Tue, 15 Jul 2025 at 21:35, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Mon, Jul 14, 2025 at 05:46:40PM +0200, Ricardo Ribalda wrote:
> > > On Mon, 14 Jul 2025 at 16:30, Laurent Pinchart wrote:
> > > > On Tue, Jul 01, 2025 at 01:13:10PM +0200, Ricardo Ribalda wrote:
> > > > > On Sun, 29 Jun 2025 at 20:13, Laurent Pinchart wrote:
> > > > > > On Thu, Jun 05, 2025 at 05:53:03PM +0000, Ricardo Ribalda wrote:
> > > > > > > Virtual entities need to provide more values than get_cur and get_cur
> > > > > >
> > > > > > I think you meant "get_info and get_cur".
> > > > > >
> > > > > > > for their controls. Add support for get_def, get_min, get_max and
> > > > > > > get_res.
> > > > > >
> > > > > > Do they ? The UVC specification defines controls that don't list
> > > > > > GET_DEF, GET_MIN, GET_MAX and GET_RES as mandatory requests. Can't we do
> > > > > > the same for the software controls ? This patch is meant to support the
> > > > > > UVC_SWENTITY_ORIENTATION and UVC_SWENTITY_ROTATION control in the next
> > > > > > patch, and those are read-only controls. Aren't GET_INFO and GET_CUR
> > > > > > enough ?
> > > > >
> > > > > V4L2_CID_CAMERA_ROTATION has the type UVC_CTRL_DATA_TYPE_UNSIGNED,
> > > > > that time requires get_min and get_max.
> > > >
> > > > Where does that requirement come from ? Is it because how the
> > > > corresponding V4L2 type (V4L2_CTRL_TYPE_INTEGER) is handled in
> > > > uvc_ctrl_clamp() ? uvc_ctrl_clamp() is only called when setting a
> > > > control, from uvc_ctrl_set(), and V4L2_CID_CAMERA_ROTATION should be
> > > > read-only.
> > >
> > > It its for VIDIOC_QUERY_EXT_CTRL
> > >
> > > uvc_query_v4l2_ctrl -> __uvc_query_v4l2_ctrl -> __uvc_queryctrl_boundaries
> > >
> > > We need to list the min, max, def and step for every control. They are
> > > fetched with uvc_ctrl_populate_cache()
> >
> > Ah, I see, thanks.
> >
> > For GET_RES, I think we can leave it unimplemented.
> > __uvc_queryctrl_boundaries() will set v4l2_ctrl->step = 0 which seems to
> > be the right behaviour for a read-only control whose value never
> > changes.
>
> That will break v4l2-compatiblity. Step needs to be != 0
> https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-controls.cpp#n77
>
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(77): step == 0
>                 fail: v4l2-test-controls.cpp(201): invalid control 009a0923
>
> >
> > As for the minimum and maximum, they are currently set to 0 if the
> > corresponding operations are not supported. I wonder if we should set
> > them to the current value instead for read-only controls (as in controls
> > whose flags report support for GET_CUR only)..
>
> I am not sure that I like that approach IMO the code looks worse...
> but if you prefer that, we can go that way

I am almost ready to send a new version.

What approach do you prefer?

Regards!

>
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index ec472e111248..47224437018b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -35,6 +35,8 @@
>  /* ------------------------------------------------------------------------
>   * Controls
>   */
> +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> +                              struct uvc_control *ctrl);
>
>  static const struct uvc_control_info uvc_ctrls[] = {
>         {
> @@ -1272,6 +1274,13 @@ static int uvc_ctrl_populate_cache(struct
> uvc_video_chain *chain,
>                                         uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
>                 if (ret < 0)
>                         return ret;
> +       } else if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)) {
> +               ret = __uvc_ctrl_load_cur(chain, ctrl);
> +               if (!ret) {
> +                       memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> +                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +                              ctrl->info.size);
> +               }
>         }
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
> @@ -1279,14 +1288,31 @@ static int uvc_ctrl_populate_cache(struct
> uvc_video_chain *chain,
>                                         uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
>                 if (ret < 0)
>                         return ret;
> +       } else if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)) {
> +               ret = __uvc_ctrl_load_cur(chain, ctrl);
> +               if (!ret) {
> +                       memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN),
> +                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +                              ctrl->info.size);
> +               }
>         }
> +
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) {
>                 ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_MAX,
>                                         uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
>                 if (ret < 0)
>                         return ret;
> +       } else if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)) {
> +               ret = __uvc_ctrl_load_cur(chain, ctrl);
> +               if (!ret) {
> +                       memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX),
> +                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +                              ctrl->info.size);
> +               }
>         }
> +
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES) {
> +               u8 *res;
>                 ret = uvc_ctrl_query_entity(chain->dev, ctrl, UVC_GET_RES,
>                                         uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
>                 if (ret < 0) {
> @@ -1304,7 +1330,13 @@ static int uvc_ctrl_populate_cache(struct
> uvc_video_chain *chain,
>                                       "an XU control. Enabling workaround.\n");
>                         memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES), 0,
>                                ctrl->info.size);
> +                       res = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES);
> +                       *res = 1
>                 }
> +       } else {
> +               memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES), 0,
> ctrl->info.size);
> +               res = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES);
> +               *res = 1;
>         }
>
>         ctrl->cached = 1;
> @@ -1541,11 +1573,8 @@ static int __uvc_queryctrl_boundaries(struct
> uvc_video_chain *chain,
>                         return ret;
>         }
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF)
>                 v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
>                                 UVC_GET_DEF, uvc_ctrl_data(ctrl,
> UVC_CTRL_DATA_DEF));
> -       else
> -               v4l2_ctrl->default_value = 0;
>
>         switch (mapping->v4l2_type) {
>         case V4L2_CTRL_TYPE_MENU:
> @@ -1576,23 +1605,14 @@ static int __uvc_queryctrl_boundaries(struct
> uvc_video_chain *chain,
>                 break;
>         }
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> -               v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> -       else
> -               v4l2_ctrl->minimum = 0;
> +       v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
> -               v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> -       else
> -               v4l2_ctrl->maximum = 0;
> +       v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
> +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
> -               v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> -       else
> -               v4l2_ctrl->step = 0;
> +       v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
> +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
>
>         return 0;
>  }
>
> >
> > > > > We can create a new type UVC_CTRL_DATA_TYPE_UNSIGNED_READ_ONLY that
> > > > > fakes min, max and res, but I think that it is cleaner this approach.
> > > > >
> > > > > > > This is a preparation patch.
> > > > > > >
> > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > ---
> > > > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
> > > > > > >  drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
> > > > > > >  2 files changed, 20 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
> > > > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > > @@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
> > > > > > >       if (query == UVC_GET_CUR && ctrl->entity->get_cur)
> > > > > > >               return ctrl->entity->get_cur(dev, ctrl->entity,
> > > > > > >                                            ctrl->info.selector, data, len);
> > > > > > > +     if (query == UVC_GET_DEF && ctrl->entity->get_def)
> > > > > > > +             return ctrl->entity->get_def(dev, ctrl->entity,
> > > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > > +     if (query == UVC_GET_MIN && ctrl->entity->get_min)
> > > > > > > +             return ctrl->entity->get_min(dev, ctrl->entity,
> > > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > > +     if (query == UVC_GET_MAX && ctrl->entity->get_max)
> > > > > > > +             return ctrl->entity->get_max(dev, ctrl->entity,
> > > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > > +     if (query == UVC_GET_RES && ctrl->entity->get_res)
> > > > > > > +             return ctrl->entity->get_res(dev, ctrl->entity,
> > > > > > > +                                          ctrl->info.selector, data, len);
> > > > > > >       if (query == UVC_GET_INFO && ctrl->entity->get_info)
> > > > > > >               return ctrl->entity->get_info(dev, ctrl->entity,
> > > > > > >                                             ctrl->info.selector, data);
> > > > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > > index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
> > > > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > > > @@ -261,6 +261,14 @@ struct uvc_entity {
> > > > > > >                       u8 cs, u8 *caps);
> > > > > > >       int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > >                      u8 cs, void *data, u16 size);
> > > > > > > +     int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > > +     int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > > +     int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > > +     int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > > > > +                    u8 cs, void *data, u16 size);
> > > > > > >
> > > > > > >       unsigned int ncontrols;
> > > > > > >       struct uvc_control *controls;
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

