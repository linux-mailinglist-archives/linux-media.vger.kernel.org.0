Return-Path: <linux-media+bounces-36408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AADAEF641
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E41B3A8D59
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656B62727FF;
	Tue,  1 Jul 2025 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JddWcaDL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0488B221281
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368408; cv=none; b=qju7vJRvj8iHIQ9Pw+eSIhMyxKhkADBHL1MVbw2OK6YKUgB5IZbkPSci6pI6gO9xtxbMDx7jEtUfq4qwc/Npy1x15sRRgc7ZReeqLCuZ/hbxDn2GE2ljXcwtyOehyY52KXqvVxVmUXM8/E73Yiu16ZF6dzY9rcivZ7pmljJ0KNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368408; c=relaxed/simple;
	bh=FeqVp2yCUZ3ij1peE3WeZz1cWGh+QgySUCT2N/2Xbjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sqm1KeRI0hWrubNrJLnYRNH/42pejxw8UzHfFb4xnrRWGrAy61DVcxZfvFI5KcP1uwx5BQNFMhoVD+9/Mu+757/qJ/PpguI802sc2P7noTG5KX85YUzVDjLwxgkbs0S8pPjrsYZcwZtEn4lzzh1lc9lXcTf5IOncLRRipWLnRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JddWcaDL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b10594812so3694178e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751368405; x=1751973205; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bGjQ61S1++mVkf3/jYVKvuXkIa1IOFszhbgMmRDC9tQ=;
        b=JddWcaDLnK2wDhdA4L+9ZyeeWDb9HoAUziWpGpePC9PwYv+i572RcoiNLzdmmuRPrq
         hyFm49ZvbBGLY7oW5pQvlX7J2KbpdCj1Cgad9IPrgV8WPKjOaR6XgPJ8deF/LeSzRncr
         3aZ3CMCmoWamDAXoUBFcbk5UuJIh8uaHyh9D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368405; x=1751973205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGjQ61S1++mVkf3/jYVKvuXkIa1IOFszhbgMmRDC9tQ=;
        b=GsTp/TE/2wu11sGnoPC2KOlEPHktq9/PuPuIqunS6bD9jVTC8ru6cN1NRLL60EdV9B
         oiVkbsXHyOay+exxt9kCux8BIxaMZqaha+n1oFZi3Lb4D06s/pDT8KvwjWZRX4CiEIvG
         MFir/auwjZa3Zz9TLV72pfFx9rxs2k4haHU+GkVsBg8aSgTLra2chP9LD1uozBSReags
         nwGWugJlzfKtayFy0IZm1Dyc8XBfKH0J5J4NFPKch+d+2FuOAxtzFjOU4S69+l/OylDy
         yDGNjuePzIVQ3qrddInMre2KRsbDburELAsM0DS9sniqGtzZaOFVoNRNSfgrXf1wNj/5
         +40Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+hLu0PQqnW8yuFrr77VcU16pcuMe3+tCOqX6NWhcovO7/C3B22pae+hLZEqRu+8bjji9Dw2U1PmxOTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCB/079iaxIqNvOSu2dzuRda3TTVbHEA49GfC31ezyyg6ttkW4
	ZFK86YrlVStU80AZWvLIxXPUDFeV35OmLm/ChJm3xbEvBUGCXS8Fns/u+nVy8wg+WH3QtZ1nlTH
	17js5iw==
X-Gm-Gg: ASbGncssOoLRCajy9GmrMJIMy31yW6TaIAVzLMZcZa0bJTP0RMb0Z8764yQS2LklwuV
	RwZFI86PMiZ6Y3no4KAC8S3/kvs631T6yY+YXdfXFjgEXJPLujAzNfmGgvTCxyVAeXDKHhlOExu
	fyV8OovTv9YGUJHI7rMC87DxfL74mf4u+G2OVsGVVvPr+PRz/zyi/XEVgGNMQFhmf3L4Ob5tmN/
	uQBj0kYW59xEtSWz26a9t/+fqwHAonFWWHDFZO84I98PAQE8JBaxbv0XMyeBx8x0wDQrqwwuF7p
	QL67u7NN/66s6JJHjAfCD8hDQq8bG2gnUlsg3Ddv7jytuXEYywvkDKLGAegHGki7gTRo1wW1E/t
	BLZ4g0c/rSt/sTuofVQvN8fxYUPEnQ0PmxWM=
X-Google-Smtp-Source: AGHT+IGC52TUycU2vpfY2/io836hB/q5YNEuk0xl5slvwWcWMKQ5BeRWzmYYcAQmxDYW+ULmZ1hpDw==
X-Received: by 2002:a05:6512:3c87:b0:553:2927:985f with SMTP id 2adb3069b0e04-5550b860bafmr5284452e87.5.1751368404805;
        Tue, 01 Jul 2025 04:13:24 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f173fcsm15841311fa.112.2025.07.01.04.13.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:13:24 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b82f3767so3591765e87.3
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 04:13:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW11XZAZifOV2fBX48nLx8KpimCZ8ZtZNG5R2u4P+2TsOv19omu0Ib88bWAkALr8+gldBGhgStOO1FeeA==@vger.kernel.org
X-Received: by 2002:a05:6512:224b:b0:553:cf38:5ea1 with SMTP id
 2adb3069b0e04-5550b87b62cmr5806214e87.15.1751368403239; Tue, 01 Jul 2025
 04:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org> <20250629181246.GE6260@pendragon.ideasonboard.com>
In-Reply-To: <20250629181246.GE6260@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:13:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
X-Gm-Features: Ac12FXyUB7J2CzeHXupatytT-Rncr6S6tZS3kWRK4b67_iOG9R3ef-6_Er_0YxQ
Message-ID: <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
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

On Sun, 29 Jun 2025 at 20:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Jun 05, 2025 at 05:53:03PM +0000, Ricardo Ribalda wrote:
> > Virtual entities need to provide more values than get_cur and get_cur
>
> I think you meant "get_info and get_cur".
>
> > for their controls. Add support for get_def, get_min, get_max and
> > get_res.
>
> Do they ? The UVC specification defines controls that don't list
> GET_DEF, GET_MIN, GET_MAX and GET_RES as mandatory requests. Can't we do
> the same for the software controls ? This patch is meant to support the
> UVC_SWENTITY_ORIENTATION and UVC_SWENTITY_ROTATION control in the next
> patch, and those are read-only controls. Aren't GET_INFO and GET_CUR
> enough ?

V4L2_CID_CAMERA_ROTATION has the type UVC_CTRL_DATA_TYPE_UNSIGNED,
that time requires get_min and get_max.
We can create a new type UVC_CTRL_DATA_TYPE_UNSIGNED_READ_ONLY that
fakes min, max and res, but I think that it is cleaner this approach.

>
> >
> > This is a preparation patch.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
> >       if (query == UVC_GET_CUR && ctrl->entity->get_cur)
> >               return ctrl->entity->get_cur(dev, ctrl->entity,
> >                                            ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_DEF && ctrl->entity->get_def)
> > +             return ctrl->entity->get_def(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_MIN && ctrl->entity->get_min)
> > +             return ctrl->entity->get_min(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_MAX && ctrl->entity->get_max)
> > +             return ctrl->entity->get_max(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_RES && ctrl->entity->get_res)
> > +             return ctrl->entity->get_res(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> >       if (query == UVC_GET_INFO && ctrl->entity->get_info)
> >               return ctrl->entity->get_info(dev, ctrl->entity,
> >                                             ctrl->info.selector, data);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -261,6 +261,14 @@ struct uvc_entity {
> >                       u8 cs, u8 *caps);
> >       int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
> >                      u8 cs, void *data, u16 size);
> > +     int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> > +     int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> > +     int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> > +     int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> >
> >       unsigned int ncontrols;
> >       struct uvc_control *controls;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

