Return-Path: <linux-media+bounces-37684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11177B044AC
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 278FC3A6ED3
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CAC246BC5;
	Mon, 14 Jul 2025 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TO3Iq7Qe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7734A259CA0
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752508020; cv=none; b=DZosanFsGUO9/XHhHXI+ZnjU8T7Wsj9ZRB/ySwx+PtklIhj9vj8IDbGSOSV2hqy17LkK1ZHJktRmj744rYWCfgBhpNhBPWWHTguUC9K/t2vG0tOEhh3gPrl6dVaXgpVc8BJU8ZT3FTK5OdgJa4apE9kMfGMMS1THvdE1m3HUoiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752508020; c=relaxed/simple;
	bh=5LlMEN4J3o3aD6YDXjwZ5zCkBWXWLqScnxci+wtPW0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUN0tb2760e+3I6PUaTSCQpJQr4NMpXns+vhkAa5gQ//jYBW9LRErjXu35U9sJfIpCjQXO1aVfwjST7owGDF+qdl8X1wXUikvecbSkFrww18KwUcGIhgNTINi9JXmIaVckQLlS5K1Q/ACs7fJRNCQVAWmi5t4FfEx/pRQyM1qqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TO3Iq7Qe; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55502821bd2so4608743e87.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752508016; x=1753112816; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9h6RiMEbdSPWHXVsj9OLxwFBmTJFmqoquTZg92Kpnmk=;
        b=TO3Iq7QeVk002ueq3Qx/vgiIdEEyI7LQfxkhURcouoXe4MOrNKo+tGUbHirZ++TWyf
         Phcwg3ctQpb9YeTAzrIjYk3WOhf1KeiN0NaOkkg24Jkqq/MLe1ni1bxlRj8OJzwb2ESX
         SMoThRskLQ3+cO1SdpObAgNnPg+xxrCUx5zhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508016; x=1753112816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9h6RiMEbdSPWHXVsj9OLxwFBmTJFmqoquTZg92Kpnmk=;
        b=AQSb9I1OKnfjpId4eAjH0FWbvsJyoCzsOVnvrYa5lvMF4ScVyIvm2G91AU9YdqKgrM
         b7ya/lZlqqkc6CnAb3P8x7EmgbRso9Yk9EvUOkWiRVv8XvZt/FsuzAagJZpo09G4EJeo
         QeeZoDTuAoq4gpPVZgv+H5iglYx//e3sOW+ks75ASCv7klxc6geJN4iUKtYouWAwEZrh
         cd4PpHhdFQVKKOq6/ydqZt5RAqWv9AOQOKfV8IuUbCyymTKH7gWE5Q0NpKCs2Xu9V3+e
         yVWlEVZ1E8G7HnollVT7TepbRUsH1YtdRkNdCP1dHA2vG3LjyWl9QX5pcENlN08jCurU
         tfkg==
X-Forwarded-Encrypted: i=1; AJvYcCXZN/h/b5vPuMT3gfiJ8Gxg253Rhzlgqvxn5C6M1DEXlnN+cxj/DPfX7DXnLFGaTQYaLPmjmbyS9mQOIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5fQJjcZLLFDn4x6oBmqt2irUfnaRj5/bcje1LfVbOlKrJnYLE
	wG3ixkVmAqaCi5zM94bbeaIlIa+tP+HwgWi7Da7Yt3DSNNFVgdkBl50vMCJ+pREwsW+c+k1LEZG
	vQS18dg==
X-Gm-Gg: ASbGncvxE5P3/DnFmkJXkFIhe3B6xtgCDTv0RDbdKYkJEJbKmHJLxAaoxepiNKZ93jb
	XHr6icvGZvRlM9hjwBLUJcgO+MYHSxg8WtrXinoSNd8X/nsI09/9LH5pEHMtjfYzKI95BZy82YT
	2eYNRRGUOxXzzfIfVl6pDa3CCmTRAe9VBmH5mBWg85v1H/zbaPXtd2Uj8JoRR5PULpXozC2tnft
	/Wq9EhkHPZZ3mu2mYWcKkC5ziL5YSI7mBTA8vw91LGrYpveyqyII5lQz/EcCIWNqnJLs6j43VTX
	e1y1MXqJfgswUyjcCxanNlOjNxA5JsmxeUpndea4ymPeXqHoWPFxL79QYqEsYIK/jmuAU0K4tq0
	MnBKA5W8dio0tvdnsgBTiEtmxECFKGFhSul0oOT+XwB1VHHq02fCSCbvyGkIX
X-Google-Smtp-Source: AGHT+IF3QKsE/juxos/Oj325qTxLYxn/S4UdP+7mTwV4O+p823JdA+RvbEcA5FYeNjrHR6Og4UB8Rw==
X-Received: by 2002:a05:6512:1284:b0:553:2480:2309 with SMTP id 2adb3069b0e04-55a0448b3f3mr3908532e87.3.1752508016534;
        Mon, 14 Jul 2025 08:46:56 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2932313sm16444931fa.35.2025.07.14.08.46.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:46:53 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55511c3e203so4218199e87.3
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVf7C2xX9PTjOIh8GsQFieBJRP8aQDKKmdyxQHPis0r/Z9rDZ0wCaWTzMaXAfp0z8au8pNoLKAdUUp8VA==@vger.kernel.org
X-Received: by 2002:a05:6512:b10:b0:553:3492:b708 with SMTP id
 2adb3069b0e04-55a046250abmr3344250e87.49.1752508013248; Mon, 14 Jul 2025
 08:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org>
 <20250629181246.GE6260@pendragon.ideasonboard.com> <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
 <20250714142926.GI8243@pendragon.ideasonboard.com>
In-Reply-To: <20250714142926.GI8243@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 17:46:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCvFe23xmrJ0-qbWWa6+vKGb+QdDFV8VSLkmWdAnfsFtzw@mail.gmail.com>
X-Gm-Features: Ac12FXzUtyaVLj7tKhzc2QjlgMNdUTCkm86hTg8iZ2lfMiulh_fOCFYDlXtaIQQ
Message-ID: <CANiDSCvFe23xmrJ0-qbWWa6+vKGb+QdDFV8VSLkmWdAnfsFtzw@mail.gmail.com>
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

On Mon, 14 Jul 2025 at 16:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jul 01, 2025 at 01:13:10PM +0200, Ricardo Ribalda wrote:
> > On Sun, 29 Jun 2025 at 20:13, Laurent Pinchart wrote:
> > > On Thu, Jun 05, 2025 at 05:53:03PM +0000, Ricardo Ribalda wrote:
> > > > Virtual entities need to provide more values than get_cur and get_cur
> > >
> > > I think you meant "get_info and get_cur".
> > >
> > > > for their controls. Add support for get_def, get_min, get_max and
> > > > get_res.
> > >
> > > Do they ? The UVC specification defines controls that don't list
> > > GET_DEF, GET_MIN, GET_MAX and GET_RES as mandatory requests. Can't we do
> > > the same for the software controls ? This patch is meant to support the
> > > UVC_SWENTITY_ORIENTATION and UVC_SWENTITY_ROTATION control in the next
> > > patch, and those are read-only controls. Aren't GET_INFO and GET_CUR
> > > enough ?
> >
> > V4L2_CID_CAMERA_ROTATION has the type UVC_CTRL_DATA_TYPE_UNSIGNED,
> > that time requires get_min and get_max.
>
> Where does that requirement come from ? Is it because how the
> corresponding V4L2 type (V4L2_CTRL_TYPE_INTEGER) is handled in
> uvc_ctrl_clamp() ? uvc_ctrl_clamp() is only called when setting a
> control, from uvc_ctrl_set(), and V4L2_CID_CAMERA_ROTATION should be
> read-only.

It its for VIDIOC_QUERY_EXT_CTRL

uvc_query_v4l2_ctrl -> __uvc_query_v4l2_ctrl -> __uvc_queryctrl_boundaries

We need to list the min, max, def and step for every control. They are
fetched with uvc_ctrl_populate_cache()



>
> > We can create a new type UVC_CTRL_DATA_TYPE_UNSIGNED_READ_ONLY that
> > fakes min, max and res, but I think that it is cleaner this approach.
> >
> > > > This is a preparation patch.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
> > > >  drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
> > > >  2 files changed, 20 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
> > > >       if (query == UVC_GET_CUR && ctrl->entity->get_cur)
> > > >               return ctrl->entity->get_cur(dev, ctrl->entity,
> > > >                                            ctrl->info.selector, data, len);
> > > > +     if (query == UVC_GET_DEF && ctrl->entity->get_def)
> > > > +             return ctrl->entity->get_def(dev, ctrl->entity,
> > > > +                                          ctrl->info.selector, data, len);
> > > > +     if (query == UVC_GET_MIN && ctrl->entity->get_min)
> > > > +             return ctrl->entity->get_min(dev, ctrl->entity,
> > > > +                                          ctrl->info.selector, data, len);
> > > > +     if (query == UVC_GET_MAX && ctrl->entity->get_max)
> > > > +             return ctrl->entity->get_max(dev, ctrl->entity,
> > > > +                                          ctrl->info.selector, data, len);
> > > > +     if (query == UVC_GET_RES && ctrl->entity->get_res)
> > > > +             return ctrl->entity->get_res(dev, ctrl->entity,
> > > > +                                          ctrl->info.selector, data, len);
> > > >       if (query == UVC_GET_INFO && ctrl->entity->get_info)
> > > >               return ctrl->entity->get_info(dev, ctrl->entity,
> > > >                                             ctrl->info.selector, data);
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -261,6 +261,14 @@ struct uvc_entity {
> > > >                       u8 cs, u8 *caps);
> > > >       int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
> > > >                      u8 cs, void *data, u16 size);
> > > > +     int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                    u8 cs, void *data, u16 size);
> > > > +     int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                    u8 cs, void *data, u16 size);
> > > > +     int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                    u8 cs, void *data, u16 size);
> > > > +     int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                    u8 cs, void *data, u16 size);
> > > >
> > > >       unsigned int ncontrols;
> > > >       struct uvc_control *controls;
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

