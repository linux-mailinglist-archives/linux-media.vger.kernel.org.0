Return-Path: <linux-media+bounces-19256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A46FA994F09
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 224761F23CA6
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B211DFD8E;
	Tue,  8 Oct 2024 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JCKXnkcg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1739E1DED7D
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393765; cv=none; b=OgMOBmu8OgIZYHS/li2GHvqc4FYJnv9KuVUfMfmHXvRX+peiC8Dh//8aANsoxE8NbhkvvITCEWf5DsWF0uy0GRhwvyssFGzPSEe+2I3YShOihwMK1HCQQ2jkHJnXUjAWrQHIocsxkJRHUjDIOMfpL6BEfwL5G+bp/650Hdyv33Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393765; c=relaxed/simple;
	bh=IaSxTJVH8rLiGz+Akwwe7esOk3xEGpN0J/uq/JOdPeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehqtkYZtX8zgMMcwtOXccqaMPuZRgjW+suN2m7DcnaxeVibg2h+qSLxLpXolnO67JS/54ENt/KnKmI00Jfx2qWDrfUwk6z+Dn+LnnXp/+u4GEawyu4vCXgUw/akoL7V8Yg4bXn/3612GYyCbJ1YQD8AK+4KKJQohkbsr5QxVo4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JCKXnkcg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71def715ebdso2618071b3a.2
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 06:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728393763; x=1728998563; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0cPHVOjNUekqHlnnGcgVTBAAITQgOdA1jICMR0w+xYg=;
        b=JCKXnkcgkuB4U5fErieerDuXJOTWkJG/Lm9adFDgMujXsIRtTWTLhxV5PDgHwWJtRa
         s5Rkm1KfxFgMF6BjMJ4cHq4/bxoLJveBxv20/jegR5vSbbOYsJjVEgMLReT/1zbYpJaj
         kPR9Mnqnlf6E+u1fdick/mqaq/LJApfthvoNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393763; x=1728998563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cPHVOjNUekqHlnnGcgVTBAAITQgOdA1jICMR0w+xYg=;
        b=cmJbqvuMwORWsx4Yrqxy8lgfLqh1q94IiPV1M61nnduvvknkILt5M19+wzUta4VDF/
         wpf0TB2SE7Ia5Ii0xrmUbar2B5VkccXIi5tmODjz08zk8+uJ59Vh15xczxeiLIaXqQP7
         AnrXyUPuaHvOVMcckeUulssi++RyrRlx1KU1X8VziG1x2PI/TpuEcte52AptWKyXxJ3L
         aYvYS6OdVWHE/vExHn9IiV/IwJ3X+YSBJ147cTUbWXH42kDchrVgV8UQo3PTyipbdczw
         1Ph6+c40JZtOAXnOWeLt9UJ9bGyb4m9xXEPCdLB1X7IJAhMev3XTtLOo5PBjGwtW78NA
         8gtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbFQhCq8JmdSunzRoNe2uK4k5W7bgIMEjTq49dHoRRs8SflLDBVd8X1ANe2Ok3Pa6gzve3LsOIqUy3Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDg78VREt0Rq6fk6WN12M+R/9s7YdxHl+Ay8J1Ye+FV7pkpupK
	W6cFjkX3hUISFEZWmXEPmylZOSVSoy+BC9YDq0zHbJw2WN30JDo/DgxvoaR5R9UwoQlV/x/2CS4
	=
X-Google-Smtp-Source: AGHT+IGKZspQm2hTc/ogSP4qKDmEKGlTnji0GtPIJrge1fNettwckK55zg9G9XvTxBmDGkr2G5uGdg==
X-Received: by 2002:a05:6a00:2d1:b0:71d:fa2c:903e with SMTP id d2e1a72fcca58-71dfa2c924amr11983127b3a.12.1728393763134;
        Tue, 08 Oct 2024 06:22:43 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbe71bsm6123691b3a.5.2024.10.08.06.22.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:22:41 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b86298710so47606405ad.1
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 06:22:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUc1GWksXEGHAsuLOKcPlAhDIE3s1IIzg+lXqEKXtGIh69p0R6tBa8hVdKPmwdx0IaeoTc/0ZnwpNC1sA==@vger.kernel.org
X-Received: by 2002:a17:90a:70ce:b0:2e2:8744:716 with SMTP id
 98e67ed59e1d1-2e287440979mr2627293a91.3.1728393760730; Tue, 08 Oct 2024
 06:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-uvc-readless-v1-0-042ac4581f44@chromium.org>
 <20241008-uvc-readless-v1-2-042ac4581f44@chromium.org> <ZwUfD5Kfzv93-46f@valkosipuli.retiisi.eu>
In-Reply-To: <ZwUfD5Kfzv93-46f@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Oct 2024 21:22:25 +0800
X-Gmail-Original-Message-ID: <CANiDSCu5ho_CFCgRQVdUzaWtfSi_eNk+N7c-DGxcO+6Ks_Vmvg@mail.gmail.com>
Message-ID: <CANiDSCu5ho_CFCgRQVdUzaWtfSi_eNk+N7c-DGxcO+6Ks_Vmvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: Refactor uvc_query_ctrl
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari!

On Tue, 8 Oct 2024 at 20:01, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Tue, Oct 08, 2024 at 07:06:15AM +0000, Ricardo Ribalda wrote:
> > Move the query control error logic to its own function.
> > There is no functional change introduced by this patch.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 45 ++++++++++++++++++++++-----------------
> >  1 file changed, 26 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 853dfb7b5f7b..a57272a2c9e1 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -67,30 +67,12 @@ static const char *uvc_query_name(u8 query)
> >       }
> >  }
> >
> > -int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > -                     u8 intfnum, u8 cs, void *data, u16 size)
> > +static int uvc_query_ctrl_error(struct uvc_device *dev, u8 intfnum, void *data)
> >  {
> >       int ret;
> >       u8 error;
> >       u8 tmp;
> >
> > -     ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> > -                             UVC_CTRL_CONTROL_TIMEOUT);
> > -     if (likely(ret == size))
> > -             return 0;
> > -
> > -     if (ret > 0 && ret < size) {
> > -             memset(data + ret, 0, size - ret);
> > -             return 0;
> > -     }
> > -
> > -     if (ret != -EPIPE) {
> > -             dev_err(&dev->udev->dev,
> > -                     "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> > -                     uvc_query_name(query), cs, unit, ret, size);
> > -             return ret ? ret : -EPIPE;
> > -     }
> > -
> >       /* Reuse data[0] to request the error code. */
> >       tmp = *(u8 *)data;
> >
> > @@ -135,6 +117,31 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >       return -EPIPE;
> >  }
> >
> > +int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > +                u8 intfnum, u8 cs, void *data, u16 size)
> > +{
> > +     int ret;
> > +
> > +     ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> > +                            UVC_CTRL_CONTROL_TIMEOUT);
> > +     if (likely(ret == size))
> > +             return 0;
> > +
> > +     if (ret == -EPIPE)
> > +             return uvc_query_ctrl_error(dev, intfnum, data);
> > +
> > +     dev_err(&dev->udev->dev,
> > +             "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> > +             uvc_query_name(query), cs, unit, ret, size);
>
> This message should probably be printed after the check below.

If the device is returning less bytes, the hardware is not behaving
according to spec and it is good information, specially if you are
bringing up a new device.
I could make it  a dev_warn() (or even uvc_debug) if ret <size. WDYT?


>
> I'd actually move the below check before the ret == -EPIPE check as it's a
> successful case (and changing the condition to <= would make the ret ==
> size check redundant).

something like this?

if (ret > 0)  {
   if (ret != size) {
      print_error();
      memcpy();
   }
   return 0;
}

>
> > +
> > +     if (ret > 0 && ret < size) {
> > +             memset(data + ret, 0, size - ret);
> > +             return 0;
> > +     }
> > +
> > +     return ret ? ret : -EPIPE;
> > +}
> > +
> >  static const struct usb_device_id elgato_cam_link_4k = {
> >       USB_DEVICE(0x0fd9, 0x0066)
> >  };
> >
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

