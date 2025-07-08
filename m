Return-Path: <linux-media+bounces-37054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 792DEAFC2B6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 324DC1AA3335
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 06:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B0A221DBA;
	Tue,  8 Jul 2025 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sk4b5hHl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4C3220F36
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956120; cv=none; b=eRAVmPDsVsZ0gp+3Gpp0oh+17Lg/t3xJghsm2CU90CdoKjx+CWcwCPB9sND9H6n16zEXAi4t0qAbRGYrAtSvaFlObWSntRFupDpnR3wwcYIiEnDqT99l0nrkJNHmz94geKHDbDH1+WlVnc4G/OnEc5q0g5UvKGcKn2vJZT+Qi48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956120; c=relaxed/simple;
	bh=I0rAk6mb7yKobFsz49sdDHTtScf9ylS26QbCpacwhZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AALvP5+aGQYZOZnXL36+bWWkz9FZNcTilJTU6716CTK2of7VIx1lptK3RmUpL/FdO34cNrG6pNyVvdv7QQJFeOaHXQGhFnzwfoS5yGeSVvkyebFYUogJpO1bFTjQ5kPrnTbIAZfJo+tFr4qxzW+Jqbdo/5+FTN8smu5lsm1dNSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sk4b5hHl; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso46247201fa.3
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 23:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751956116; x=1752560916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=epMO4JAtFgFxLvmQB+DGKVfgOj+pDHGWO9fLU9qAUo4=;
        b=Sk4b5hHlLbvMSea00iizq3aJzaFUear+n0VTqUiK4fV53N89kp8Gnvi+bvGIW02iOK
         b3wC+y3K0aSmiq9hWyqWD9C4s9ob4oqQO7Iawd0Bie4zS8xjVXYcW2tSj2rl7ZMfc/ss
         mwlzI5UjeA42ZsDp1rMJlRihYZOdjdB1vW4hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956116; x=1752560916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epMO4JAtFgFxLvmQB+DGKVfgOj+pDHGWO9fLU9qAUo4=;
        b=mF7zF1AHEmvoKL4xS3mnUGUlqqO60cIU6BprLGnh25Xnj9qIGYw0Q+dTqsk6ahLHcl
         2IwVmxtQJdnLnusbF7CNCQbo8wQeS8C4Ymxb2hZLfSiqmphpMJEoXugk/z/Fd8QYbn6J
         eYY0e4OUSw9X5HbdQxoCPr2KcTlaEVStvdO4JKhwJqTuMIbNtIMl7Uyz4OEoTNQRFd39
         5JYJPAl5U09q3Q8l7lX4Gs9xpJvG9g4HRlsz9OcioTHw0gla99TI0GRRcQUwZv6B2OLV
         jfrLS0xRQTiNPJiFBTuJiCU73DyS7xYRVsN7i3zFFvfKiraQjTwf5fBDqYS3RUs0oYmi
         g5NA==
X-Forwarded-Encrypted: i=1; AJvYcCXYXativHEXrqtLk0w6gZ2z0KuYt54SyLXlJ0bNR2aTukCL51vHigx0iy6IjGB5REVNEJlRgavhHzQt5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzssXHxwjelFGNmCbuV629OiPFzFlaA9DCW+8qsKZ7SacQ7O88i
	Sf7dQhBRw8W2FFDcFsXLbFKrONiwJxazW/S1QwW8qr/4E1vXOxZNAja5hOJTcTerV6fBAJ2k1s4
	/PUc=
X-Gm-Gg: ASbGncveXtj+lRz+mN+Ifs4VQmFZCR6s7tbBE5rPRsv3ZFH1IvZFmGiIfm50n3Nn0L7
	sqG3/36Yg/7RO1P9TJfUTZHzkp+14frzLt/L8uTr+HbqjhUJE/NIuall2kXeqSGb2WX4BPt+I3L
	EWpXJq7VOeFzHH1QAzyB8aYW+Z14IXnhbFqcXlLRT5q2aR26B2DRiAt3CpHn53ebf+BeixOkdbb
	ztiOHZvVfnwjw/Ne82HqTmZt3jPlUKf4WT3aAihySXXMN9J6TXZh0BVftNXoH+pFvkJrrzcQp4W
	z4EbmuG/r10xNfO4uHkA5YSEZbPG8Xisrms/feJWJcwdGYzqU/5m77nad4u/IT/VZc5aGKZX4Xo
	9naZOgbWHZbpJjllVq6ZmCHHWI0Ic
X-Google-Smtp-Source: AGHT+IHXp8Marrg6lv60JxyyYRnVonH3jwfQtqH+RcHeJXS3/VwOaRPfp5x64UaSTZeFPH6eZORMgw==
X-Received: by 2002:a05:651c:2205:b0:32a:dcc7:f99e with SMTP id 38308e7fff4ca-32f39b205e6mr5337861fa.22.1751956116133;
        Mon, 07 Jul 2025 23:28:36 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af84bc8sm14000221fa.4.2025.07.07.23.28.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 23:28:34 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso46246961fa.3
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 23:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwk2f9tKYSAPgoBDkVvWsG/BKkwuhdxxtDgpxtLlFOcG56kabNjpneYRp7LfXQ2yGE2SDvwp1FP6yHnw==@vger.kernel.org
X-Received: by 2002:a05:651c:3254:20b0:32b:78ce:be8e with SMTP id
 38308e7fff4ca-32f39b48b77mr3774321fa.32.1751956114000; Mon, 07 Jul 2025
 23:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-12-5710f9d030aa@chromium.org>
 <20250629180534.GN24912@pendragon.ideasonboard.com> <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
In-Reply-To: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 08:28:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCtq0cr1LgFCgvdBtWcE3z1MWZEjc0e1wTH_BYPETC+s4Q@mail.gmail.com>
X-Gm-Features: Ac12FXyYQKv3E7HlyxyFaWCzaarpcfNGMVTbadH4TCiFfkv-rgAm8ijV2sCYmI0
Message-ID: <CANiDSCtq0cr1LgFCgvdBtWcE3z1MWZEjc0e1wTH_BYPETC+s4Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] media: uvcvideo: Do not create MC entities for
 virtual entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Tue, 1 Jul 2025 at 13:20, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent and Hans
>
>
> On Sun, 29 Jun 2025 at 20:06, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > I would use "software entities" and not "virtual entities" in the
> > subject line and everywhere else, as those entities are not virtual.
> >
> > On Thu, Jun 05, 2025 at 05:53:05PM +0000, Ricardo Ribalda wrote:
> > > Neither the GPIO nor the SWENTITY entities form part of the device
> > > pipeline. We just create them to hold emulated uvc controls.
> > >
> > > When the device initializes, a warning is thrown by the v4l2 core:
> > > uvcvideo 1-1:1.0: Entity type for entity SWENTITY was not initialized!
> > >
> > > There are no entity function that matches what we are doing here, and
> > > it does not make to much sense to create a function for entities that
> > > do not really exist.
> >
> > I don't agree with this. The purpose of reporting entities to userspace
> > through the MC API is to let application enumerate what entities a
> > device contains. Being able to enumerate software entities seems as
> > useful as being able to enumerate hardware entities.
>
> What function shall we use in this case? Nothing here seems to match a
> software entity
> https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/media-types.html
>
> Any suggestion for name?
> Shall we just live with the warning in dmesg?

 I just realised that if/when we move to the control framework, the
software entity will be gone.... So to avoid introducing a uAPI change
that will be reverted later I think that we should keep this patch.

Regards
>
> >
> > > Do not create MC entities for them and pretend nothing happened here.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > index d1a652ef35ec34801bd39a5124b834edf838a79e..2dbeb4ab0c4c8cc763ff2dcd2d836a50f3c6a040 100644
> > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > @@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> > >  {
> > >       int ret;
> > >
> > > +     /*
> > > +      * Do not initialize virtual entities, they do not really exist
> > > +      * and are not connected to any other entities.
> > > +      */
> > > +     switch (UVC_ENTITY_TYPE(entity)) {
> > > +     case UVC_EXT_GPIO_UNIT:
> > > +     case UVC_SWENTITY_UNIT:
> > > +             return 0;
> > > +     }
> > > +
> > >       if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> > >               u32 function;
> > >
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

