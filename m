Return-Path: <linux-media+bounces-36392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4705EAEF261
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C20188B485
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 09:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C3326CE10;
	Tue,  1 Jul 2025 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cRr05fZ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC46726D4F9
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 09:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360685; cv=none; b=chY+TuQUMtrPXrjJBHdnDW+AbX2TfPuw2WXvqk7ostO29rMRL++WX87bUvFkCpV6fhqi8hnxn6Nkq/oqBMJvnv/lEMo+X0N3EqJJFs3DXwsS2Tum1Ptc/MOPkaMwgsEH3R8kvqLQG7TPWd7RvDt3nZbBOCsdkoc2HKQN07UYpEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360685; c=relaxed/simple;
	bh=o28C31JrBgAZEzAB1O4WLZDzarIKJHFMpSuZuTBwEc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugx7q8aZ3IPlts0HglCC3ar/4ngs8jcxKh6RhEWMj0VnoHqfGEFGUQ/zMeWVm3/bZRPh30YEGTffxW2I88zDvW0yjXFbFCWT3ACWZl10ffXoRvPkomPg1T+tsKjSKJPrLJyCBEMbNxFLBaWe0yxSLsXZmYgWnArqnJjKhpOBjLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cRr05fZ6; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5551a770828so2228321e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751360681; x=1751965481; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xkMPKxlbdTBTKL3fl2oC7mwIlMxs96dPn8+iiFtM8yw=;
        b=cRr05fZ6fbB4i/Xn2IgfJKZmV5PVU/mOGfz93dQV93WklRNW1HTgP6ZZDV1VDxYH6O
         rVh6NS6/Xx5RqrjHMawmTcHxF2z5QUG44wGOQymSLKhX/yjKJLz731L17wwZyf+Zqxsq
         CVVQMrKTTvDgCFonyloU72gDuy1hnwJLPy2eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360681; x=1751965481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkMPKxlbdTBTKL3fl2oC7mwIlMxs96dPn8+iiFtM8yw=;
        b=h+zBj16WnTbZjQmxgp/UfSDkb9QApfU2BWqOYgXO9utMcNItEcA8pTMGz+FRwxgUc6
         zl8pn75gHcuL6gcW8nGYSeg9BQsViCKyLaeWEtpW2DOAS57j9x6NjL+XFcY0BbCD5+bL
         jEceBFAgN5AUxtq6VyFRKkUEF3+HJwc+QQvkNLbTKCAkNTyOWg/DdliF0CsjWcya1Mwo
         Gw6SchMmqHkcS0iXju1B+fsjgf2uUH6ad4/nmb1yi3p32aMK8peIx1QWCo7H/MSCxj7X
         3XDA3zdZxpI/Dr0SazUoWKXwrbvT6owRqLTGyRnhwd/W5ekvD1lJNu3Okhd3VnWD0JVW
         xXJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5XonOkPa7tgd0dhZWx/JvowqTvmTVquqBauuyFn+RtiTKEYMGkNV5WMBIJj9hSm3p5ETv4jBNDwUbDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPCUntXFw/C8lQJGFkt7zMdQEZ8sF7GXGErr7/+be2BFHp46fC
	fLqWoDZ0RGG/9+uHPFFhyNKlJMGi/ytYA8fL7vwH0Dj5rdMUeS8HR8EwWC6qR1hnx8WRMLJ1qsU
	TlC0=
X-Gm-Gg: ASbGncsmVe2/zf74KFY6BS0ZxzcaQihc/0hStqVFJf9Vyexp2/2cHvGDqiURnu/tF48
	3NslCfTdzL9zPKJ9s+so42YN2KAmQIUguCwbpTysA9MPDauh9OTdHAJul/JxT4Gv72FA6SDOeYC
	g3lCL2cnobsBPZAoT8bjp3kmbT/1IuGH0d7j5TyZYjfc2EJNjAXxBANVW69f+c/BP1jQQUnrm9m
	owrJ5ymTVBmQ03z0m17HXo+rVTQ8NFQkp6Dk+hZv5OZgS+icvFyKFgOkY1HwxNGz3uKFpMzTHak
	NARwPotwk6U16gYX66RziakUzJq13zSA7Ir6S4fVgvmLjDOBznuBP9UFKS93+KDwLCyFz359U9z
	mjDSU36AlWlGZWuN6PiShAHXI
X-Google-Smtp-Source: AGHT+IElhiuf5rHAU2r1ML8BJfovKWpa5BuduMhTxOsj+D6OfQgGnfvxe+urCJGA+rVfenPn0B6g4A==
X-Received: by 2002:a05:6512:3f22:b0:553:35f5:7a90 with SMTP id 2adb3069b0e04-5550b9ee723mr5160591e87.28.1751360680649;
        Tue, 01 Jul 2025 02:04:40 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556261e53bdsm10179e87.30.2025.07.01.02.04.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:04:38 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5551a770828so2228279e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 02:04:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQQ51bqU/4AkA6lqlkQdwydVOarawyRoafxF7QlUSKVGfHq5K70Xd+puZ2BwEpYwiDzx4/6XwHFIYCzg==@vger.kernel.org
X-Received: by 2002:a05:6512:6c6:b0:553:cf7d:7283 with SMTP id
 2adb3069b0e04-5550b9ee0bemr5279219e87.33.1751360678000; Tue, 01 Jul 2025
 02:04:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-2-5710f9d030aa@chromium.org> <1ac49bd3-1b65-4611-8c90-92fb2c2ffd4a@linux.intel.com>
In-Reply-To: <1ac49bd3-1b65-4611-8c90-92fb2c2ffd4a@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 11:04:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCuRLVtT54ZxxAh6031OLg422VApsocvOTCOnavQgifTaA@mail.gmail.com>
X-Gm-Features: Ac12FXx3IMpNO_E1OyIfv6p5Mqhpq1vAIqrVG416DGyoC75C25dyBDZ2PZqW7zo
Message-ID: <CANiDSCuRLVtT54ZxxAh6031OLg422VApsocvOTCOnavQgifTaA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] media: v4l: fwnode: Support ACPI's _PLD for v4l2_fwnode_device_parse
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

Thanks for your review!

On Mon, 30 Jun 2025 at 09:06, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> Thanks for the update.
>
> On 6/5/25 20:52, Ricardo Ribalda wrote:
> > Currently v4l2_fwnode_device_parse() obtains the orientation and
> > rotation via fwnode properties.
> >
> > Extend the function to support as well ACPI devices with _PLD info.
> >
> > We give a higher priority to fwnode, because it might contain quirks
> > injected via swnodes.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >   drivers/media/v4l2-core/v4l2-fwnode.c | 85 ++++++++++++++++++++++++++++++++---
> >   1 file changed, 79 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..379290ab3cfde74c8f663d61837a9a95011b5ae0 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -15,6 +15,7 @@
> >    * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> >    */
> >   #include <linux/acpi.h>
> > +#include <acpi/acpi_bus.h>
> >   #include <linux/kernel.h>
> >   #include <linux/mm.h>
> >   #include <linux/module.h>
> > @@ -807,16 +808,65 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
> >   }
> >   EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> >
> > -int v4l2_fwnode_device_parse(struct device *dev,
> > -                          struct v4l2_fwnode_device_properties *props)
> > +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > +                                      struct v4l2_fwnode_device_properties *props)
> > +{
> > +     struct acpi_pld_info *pld;
> > +     int ret = 0;
> > +
> > +     if (!is_acpi_device_node(dev_fwnode(dev)))
> > +             return 0;
> > +
> > +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> > +             dev_dbg(dev, "acpi _PLD call failed\n");
>
> I'd do:
>
> acpi_handle_debug(ACPI_HANDLE(dev), "cannot obtain _PLD\n");
ack
>
> > +             return 0;
> > +     }
> > +
> > +     if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET) {
> > +             switch (pld->panel) {
> > +             case ACPI_PLD_PANEL_FRONT:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> > +                     break;
> > +             case ACPI_PLD_PANEL_BACK:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
> > +                     break;
> > +             case ACPI_PLD_PANEL_TOP:
> > +             case ACPI_PLD_PANEL_LEFT:
> > +             case ACPI_PLD_PANEL_RIGHT:
> > +             case ACPI_PLD_PANEL_UNKNOWN:
> > +                     props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> > +                     break;
> > +             default:
> > +                     dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
>
> Similarly:
>
> acpi_handle_debug(ACPI_HANDLE(dev), "invalid panel %u in _PLD\n",
>                   pld->panel);
>
> > +                     ret = -EINVAL;
>
> Should this be an error or should we simply ignore it here (and maybe
> use acpi_handle_warn())?

v4l2_fwnode_device_parse_of() returns -EINVAL for a similar situation,
so I think it is better to be consistent and return -EINVAL here.
But I agree that acpi_handle_warn() better suits here than _dbg.

>
> > +                     goto done;
> > +             }
> > +     }
> > +
> > +     if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET) {
> > +             switch (pld->rotation) {
> > +             case 0 ... 7:
> > +                     props->rotation = pld->rotation * 45;
> > +                     break;
> > +             default:
> > +                     dev_dbg(dev, "Unknown _PLD rotation val %d\n", pld->panel);
>
> acpi_handle_debug(ACPI_HANDLE(dev), "invalid rotation %u in _PLD\n",
>                   pld->rotation);
>
> > +                     ret = -EINVAL;
> > +                     goto done;
> > +             }
> > +     }
> > +
> > +done:
> > +     ACPI_FREE(pld);
> > +     return ret;
> > +}
> > +
> > +static int v4l2_fwnode_device_parse_dt(struct device *dev,
>
> I'd call this v4l2_fwnode_device_parse_of() as we're parsing OF nodes
> and properties here.
ack
>
> > +                                    struct v4l2_fwnode_device_properties *props)
> >   {
> >       struct fwnode_handle *fwnode = dev_fwnode(dev);
> >       u32 val;
> >       int ret;
> >
> > -     memset(props, 0, sizeof(*props));
> > -
> > -     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "orientation", &val);
> >       if (!ret) {
> >               switch (val) {
> > @@ -833,7 +883,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >               dev_dbg(dev, "device orientation: %u\n", val);
> >       }
> >
> > -     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> >       if (!ret) {
> >               if (val >= 360) {
> > @@ -847,6 +896,30 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >
> >       return 0;
> >   }
> > +
> > +int v4l2_fwnode_device_parse(struct device *dev,
> > +                          struct v4l2_fwnode_device_properties *props)
> > +{
> > +     int ret;
> > +
> > +     memset(props, 0, sizeof(*props));
> > +
> > +     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> > +     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> > +
> > +     /* Start by looking into swnodes and dt. */
> > +     ret =  v4l2_fwnode_device_parse_dt(dev, props);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Orientation and rotation found!, we are ready. */
> > +     if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET &&
> > +         props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             return 0;
>
> I think you can remove this check without affecting the functionality.
I want to avoid calling an acpi method unless it is strictly
necessary. The check is not that ugly... if it is ok with you i'd
rather keep it.

>
> > +
> > +     /* Let's check the acpi table. */
> > +     return v4l2_fwnode_device_parse_acpi(dev, props);
> > +}
> >   EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> >
> >   /*
> >
>
> --
> Regards,
>
> Sakari Ailus

Thanks!

-- 
Ricardo Ribalda

