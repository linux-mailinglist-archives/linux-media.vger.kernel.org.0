Return-Path: <linux-media+bounces-30671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E53DA95A1C
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 02:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA9C173E07
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 00:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A7E13AD1C;
	Tue, 22 Apr 2025 00:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gxem5lhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C0856B81
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 00:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745281453; cv=none; b=DyJvsoFWZgUyLpoYxCCrPaI6qRg1r5x1NUnOC84OD+K7+sJh0UT/qhe6d7ezzLFpcyiA5/AFZj5qVtgXQwYlbD0K6AU2WyDnDGLoBgAw1vZ2bdnP/k9tLM7sxTzv1w4gdLny7Q+74LQoo2tKHEbKX7ifqW+zysJUKxO/L5vq9gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745281453; c=relaxed/simple;
	bh=u52bVrB/pZ0lfovnX74KF6WwBxpQoIaVYqukYlfqcMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKI62jGYmg0gwIuZIq5e7zREesN6Z2jLxcCJXUHnSdJJgOZMy8yXxFPtV9FjfXD0WudOxAzUjJgUcjI8klFAFAXCD6SBmbZ1iJhhdFoYAowHoadxq40PhmcHr7iJnszDTIaA7NpANO8W05Y+Qb+HQmswdEXsA4Iw2TnI1dE4ARM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gxem5lhJ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30effbfaf61so49298741fa.0
        for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 17:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745281450; x=1745886250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hfCnlXym9eZAbX+zdYaRO3WcEjSZxfzTyz2pRkP+wp4=;
        b=gxem5lhJ+4DHlvLI3uNia58B73VfYi7pHotLLMwrnPEwyeKAnuPKgbgz4ZnhNLzGSe
         6MNIomgzHCv/S/WDtolKl8Pim3obpqcm4/HlrlY08q3p7Av4G/tdyuxDQWWGkDS8whZY
         Ary/n2nS5YKkjIn6JYHl0c36xfrMFreeuiizQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745281450; x=1745886250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfCnlXym9eZAbX+zdYaRO3WcEjSZxfzTyz2pRkP+wp4=;
        b=UN7mCmu6+CmA+6wsfrY9zPQa0qihWhiIojw/8V8SVQ5+4Jz4W/83jj9brK/Z91HsrY
         ePkq0VvJRAerMKFDjrEMXtp2zmm0StAT1lkEKvzhesvZbjn6uq0uj1crs9XD9lqK6wKO
         B6djf650NET0VQVpmH5Vfw+LIJWbQC/XgHurIkMz8/KZBxYHt5i3OylX8aGie2/4+Vuc
         K8P3gCY984YtsJjWxU+WmiSn3FDaHXJ8u7LXkLMxfJt+LMm5hT2hkt0Oz83foAmNTfLU
         vn5U5Y33X39zpFNMDY+nGhUHOKtEDWzy/ZGaULPYuIQxRtlrHPUqqedJmaFCrsVOVL7c
         POcw==
X-Forwarded-Encrypted: i=1; AJvYcCXJxoCjkYXNmgjQXeCVPNkOBaN4pUzEvLK0U8pnEVPFIyP5mjS1SBC46wg498qpK7bZ666V5QSCYPYw9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/7j7D56VKOFb1wALj83JDwP6qplcvT4H+celwDa81KcC1LHuJ
	q90YwO/kPiWLuiqoEKDwzD2YvGZezVNGDR8P+ahB6jT5MqA5DUR2ZbU8KIiKqutsISyrEqfc5u4
	=
X-Gm-Gg: ASbGncvL+98bTBkE+gvh7u62Xg+YucXaHk9fmRkH+tHe5oGfJQQ0v4PSx9iUOH9vbFY
	C6jvfEbZjrK12BRtTYL4efSG8SRmpdEdi+m9RKrGdD7DYC6xcdqp9KLlS7/xrvCKJjeoRrMQFQF
	TYmfDDyJVqv7OAqreaZeBpHaa7Lrih74xz82Ftehlkh9TyvrLFjrvUn9bggjvjsu0P7XEc3UvaZ
	wCcKH1MPZpRwkanjpj4TzITdb9/MI0gEeGjV83UR47rT+JC5q1Cm/BW5wcui6mnmkR1b0knwpB/
	lbVS84fIWOqFGTfIG2TiMWK8f2f6fccdkfhmBWyWalbOaZ7OsIV/XZ7uiBWahI/Ngo2OzmPn8IF
	tyaVZGx0=
X-Google-Smtp-Source: AGHT+IF0VMCyUX/EdFw4dXV4P+KW7miNxa78hzJybH980CiSvfzVKDaGKodF0kOnvYL4GgqkH1kufg==
X-Received: by 2002:a05:651c:54b:b0:30b:c328:3cdc with SMTP id 38308e7fff4ca-31090dd8c0dmr39516891fa.2.1745281449831;
        Mon, 21 Apr 2025 17:24:09 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075f298sm13315181fa.9.2025.04.21.17.24.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 17:24:07 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bee278c2aso56927001fa.0
        for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 17:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSWGu6VWki/HW21BHZ3biqlOVwFL7Q0CoguurjmiOcbXEypzYhpIEaVW0rJMk5wQt1gPhP0m11fTvLYg==@vger.kernel.org
X-Received: by 2002:a05:6512:3995:b0:54a:cc10:1050 with SMTP id
 2adb3069b0e04-54d6e789b2bmr3360285e87.15.1745281447045; Mon, 21 Apr 2025
 17:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org> <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
In-Reply-To: <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Apr 2025 08:23:52 +0800
X-Gmail-Original-Message-ID: <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
X-Gm-Features: ATxdqUGV9UNm6rsWa1b6fT7zaIeRsrhtYZHR863_Li8k5tC_mUahvNyGq--RUEU
Message-ID: <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> Thanks for the patch.
>
> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
> > This patch modifies v4l2_fwnode_device_parse() to support ACPI devices.
> >
> > We initially add support only for orientation via the ACPI _PLD method.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++++++++++----
> >  1 file changed, 52 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1c96f2a5ede3fa9d64dab3 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -15,6 +15,7 @@
> >   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> >   */
> >  #include <linux/acpi.h>
> > +#include <acpi/acpi_bus.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mm.h>
> >  #include <linux/module.h>
> > @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> >
> > -int v4l2_fwnode_device_parse(struct device *dev,
> > -                          struct v4l2_fwnode_device_properties *props)
> > +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > +                                      struct v4l2_fwnode_device_properties *props)
> > +{
> > +     struct acpi_pld_info *pld;
> > +     int ret = 0;
> > +
> > +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
> > +             dev_dbg(dev, "acpi _PLD call failed\n");
> > +             return 0;
> > +     }
>
> You could have software nodes in an ACPI system as well as DT-aligned
> properties. They're not the primary means to convey this information still.
>
> How about returning e.g. -ENODATA here if _PLD doesn't exist for the device
> and then proceeding to parse properties as in DT?

Do you mean that there can be devices with ACPI handles that can also
have DT properties?

Wow that is new to me :).

What shall we do if _PLD contradicts the DT property? What takes precedence?

>
> > +
> > +     switch (pld->panel) {
> > +     case ACPI_PLD_PANEL_FRONT:
> > +             props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> > +             break;
> > +     case ACPI_PLD_PANEL_BACK:
> > +             props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
> > +             break;
> > +     case ACPI_PLD_PANEL_TOP:
> > +     case ACPI_PLD_PANEL_LEFT:
> > +     case ACPI_PLD_PANEL_RIGHT:
> > +     case ACPI_PLD_PANEL_UNKNOWN:
> > +             props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> > +             break;
>
> How about the rotation in _PLD?

If we agree on the orientation part I will extend it to support
rotation. It should not be a complicated change.

>
> > +     default:
> > +             dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
> > +             ret = -EINVAL;
> > +             break;
> > +     }
> > +
> > +     ACPI_FREE(pld);
> > +     return ret;
> > +}
> > +
> > +static int v4l2_fwnode_device_parse_dt(struct device *dev,
> > +                                    struct v4l2_fwnode_device_properties *props)
> >  {
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
> > @@ -833,7 +865,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >               dev_dbg(dev, "device orientation: %u\n", val);
> >       }
> >
> > -     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> >       ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> >       if (!ret) {
> >               if (val >= 360) {
> > @@ -847,6 +878,21 @@ int v4l2_fwnode_device_parse(struct device *dev,
> >
> >       return 0;
> >  }
> > +
> > +int v4l2_fwnode_device_parse(struct device *dev,
> > +                          struct v4l2_fwnode_device_properties *props)
> > +{
> > +     struct fwnode_handle *fwnode = dev_fwnode(dev);
> > +
> > +     memset(props, 0, sizeof(*props));
> > +
> > +     props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
> > +     props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> > +
> > +     if (is_acpi_device_node(fwnode))
> > +             return v4l2_fwnode_device_parse_acpi(dev, props);
> > +     return v4l2_fwnode_device_parse_dt(dev, props);
> > +}
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> >
> >  /*
> >
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

