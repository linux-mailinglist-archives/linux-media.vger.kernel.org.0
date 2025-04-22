Return-Path: <linux-media+bounces-30767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CAAA97AF6
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 01:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92DBC3AFFA4
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 23:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2304A1F3FF1;
	Tue, 22 Apr 2025 23:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PFWpnae/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C17618FDB9
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745363917; cv=none; b=CAen1BFJ5mppfo/2+Z6ARirRelOOcAFVAXpoSSwwXX174883p9xZxziDy7axHxF0rHZ59iLeBeAGG+D634uRAPskPfCkpL1IPp9jFCoKli7nsLQkLzNlCy4MRelkSdP+I2w5vMfUNR4xmpE2Zwr30uwYct0ab09xMdgti47uslA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745363917; c=relaxed/simple;
	bh=QuB8Gjw+RfSX/s5bV7YLthr8S4ItqWWROGytUMe/6qY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBJxAobQie5FHPIsLHbH29oYq9ZCU9nbBdBJB1/+Rx8GGJ8KJZmXn5DPCEXdLRtgxuV3gf1UsLqNRcDC9BuFqhdO2X1VC0HozB3gw/xK0kQikJYFRg4Agdctg1GvowBYPedzatRsjVMmxEDKOCxqsfGPFKRv9c/TCPMefwfdJ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PFWpnae/; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso56411311fa.0
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745363914; x=1745968714; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TzfZueCNs06IErw8Nx2tIZlpeBLYieWxJQnlfkBvHwg=;
        b=PFWpnae/6kq795PZmcyXPBMNzesNHrW3oYqA5V+fgjMCxEJoZtePnZeTFJKnefHQ4H
         Jj34KQnpupKjLEQhO9KsF/QrvZtejCVFeup6MkqyzLrOIzpeZfDvaxmLAlmBaGpvb5nw
         lcLobWNEGXl7pnKH10V3EayF7w788bbTAmBMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745363914; x=1745968714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzfZueCNs06IErw8Nx2tIZlpeBLYieWxJQnlfkBvHwg=;
        b=C+vyLeqSp6vBY8DlIpMfwli2iOpcwrxmpKuIePn/nYZk3Tz88tQ/JfnXZ7wLLjkwOT
         ul8+HlnD4adx4nipp5O4DDpU4kD3PraK4qiGSzHEH9V4IXi8XKvB3gtqF7+QsdSeAERD
         bRJGa8oKkwdBE9pekJjLuByRSMUh/SLnwsjoUKBT6CEO8v4tvw1jN7cvigsYpGOkPBy/
         EThdrvwUPuJE8DCfi4AJ6yOqnq+KKIFRvBCjjVHo2f9hI/r+x/e7TZdKjDpJVHcveUN3
         oyr5h+75QaeyO9tN1fZU+XcAYeyivQ7N45SC08S76JbyN+5Jm9o5l40CS1xQlnPUtS58
         F5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWtsni9KjXGbkIglTHOGGNau3ZqI/jd2yO00kD1AO3QVx2nuabvxE1C9cPxH4BuBkiK6EtVqdQV80PDOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMQkhGI6JRuiZyVN+VkY419jSFH13TX+CewleApO7X9CEsGbNo
	b+VzypDu2IVujaoYqTZ92S0+F31V63gHYriBLnGT2uCbDaqJ/hhQDSIgTW2o3gkikLDH3tXtpLt
	qUA==
X-Gm-Gg: ASbGncsA7QM7T+5V2UUntRb2yMnzDt8NmLtYfNOk6iLhya33AyIK3AAtdjvnhC6AFQt
	HJc31r6fZNx/BGOs7IZdDl5WHa9LmcJl1hH1mSPgVDJE4ygR141fKtW2oM2xNoFS2PPtvFyLNBn
	+mza/0N0+fBIH1Lmhdon3Y3BumlE6jJBLK1rFeQ2osZ8S9er6xZfGAh1toEZqN+jm2SQXwDIsZW
	Hz3O6DgM1+EwWrudk3o4hA56F5lA96xNbPK8qdUciUlXQNr/gYP7ALROSvCBCKAmYRx2XQr5JCG
	Hx6nkvHyak9N2r/NYDUJ14/QFzz93eOf1yUkDWTEoly2q4oqlJ8p66wNvU3by9IHQ4Pcbp9H9sv
	PtyoYjAM=
X-Google-Smtp-Source: AGHT+IG1ZT4V5Yl5qnK/sK1825BVVoqdsat0v77R1M51MaTy+9W8oOoH9KZfMYL4o1VSS3vyHnJGPw==
X-Received: by 2002:a2e:a888:0:b0:30d:69cd:ddcf with SMTP id 38308e7fff4ca-310903d1a72mr57780791fa.0.1745363913631;
        Tue, 22 Apr 2025 16:18:33 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a8655sm15858521fa.62.2025.04.22.16.18.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 16:18:32 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso56489621fa.3
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 16:18:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxt2JiBjn9NF9wVS3byucq408oyTKvZrmixOx0TsOs6Hq6OYNgXX+XPtrSdwbSNcSJqLcFOfZldMja2Q==@vger.kernel.org
X-Received: by 2002:a2e:bc82:0:b0:30b:b908:ce1e with SMTP id
 38308e7fff4ca-31090553f0dmr68294081fa.29.1745363911890; Tue, 22 Apr 2025
 16:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
 <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org> <20250422180630.GJ17813@pendragon.ideasonboard.com>
 <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com> <20250422230513.GX17813@pendragon.ideasonboard.com>
In-Reply-To: <20250422230513.GX17813@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Apr 2025 07:18:18 +0800
X-Gmail-Original-Message-ID: <CANiDSCssyAVoyvsiO8thGwUFc_boA_jhBxYDif32Hxh40fhf-Q@mail.gmail.com>
X-Gm-Features: ATxdqUEDSEbHKCZeCwxeZY8tESjmDWJXIzIiNSsM2g3Q15qo52D4m0v7Y_22dXw
Message-ID: <CANiDSCssyAVoyvsiO8thGwUFc_boA_jhBxYDif32Hxh40fhf-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Fix deferred probing error
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 07:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 23, 2025 at 06:50:10AM +0800, Ricardo Ribalda wrote:
> > On Wed, 23 Apr 2025 at 02:06, Laurent Pinchart wrote:
> > > On Thu, Mar 13, 2025 at 12:20:39PM +0000, Ricardo Ribalda wrote:
> > > > uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> > > > have not yet been probed. This return code should be propagated to the
> > > > caller of uvc_probe() to ensure that probing is retried when the required
> > > > GPIOs become available.
> > > >
> > > > Currently, this error code is incorrectly converted to -ENODEV,
> > > > causing some internal cameras to be ignored.
> > > >
> > > > This commit fixes this issue by propagating the -EPROBE_DEFER error.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
> > > >  1 file changed, 19 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index deadbcea5e227c832976fd176c7cdbfd7809c608..e966bdb9239f345fd157588ebdad2b3ebe45168d 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
> > > >  #endif
> > > >
> > > >       /* Parse the Video Class control descriptor. */
> > > > -     if (uvc_parse_control(dev) < 0) {
> > > > +     ret = uvc_parse_control(dev);
> > > > +     if (ret < 0) {
> > > > +             ret = -ENODEV;
> > >
> > > Why do you set ret to -ENODEV here...
> > >
> > > >               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
> > > >               goto error;
> > > >       }
> > > >
> > > >       /* Parse the associated GPIOs. */
> > > > -     if (uvc_gpio_parse(dev) < 0) {
> > > > +     ret = uvc_gpio_parse(dev);
> > > > +     if (ret < 0) {
> > > >               uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> > > >               goto error;
> > > >       }
> > > > @@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
> > > >       }
> > > >
> > > >       /* Register the V4L2 device. */
> > > > -     if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
> > > > +     ret = v4l2_device_register(&intf->dev, &dev->vdev);
> > > > +     if (ret < 0)
> > >
> > > ... but not here ? The code below is also not very consistant.
> >
> > For all the "external" functions I was looking into populating their
> > error code to probe(). Other drivers (check vivid for example) do
> > exactly this.
> >
> > There is more value in returning the real cause of the error (ENOMEM,
> > EINVAL) that the plain ENODEV.
>
> Yes, I got that, my question was why you override the return value of
> e.g. uvc_parse_control() or uvc_scan_device() with -ENODEV, but not for
> e.g. uvc_gpio_parse() or v4l2_device_register(). There's no explanation
> in the commit message regarding why they're treated differently.

Because it is less risky that way. There are plenty of examples where
the framework functions return code is passed to probe().

The uvc_* functions might or might not work this way. When I do that
assessment for every function I can post a different patch. I thought
that this approach was safer, especially if we are cc-ing stable.

A note in the commit message would have been a nice thing to have I agree :).


>
> > > >               goto error;
> > > >
> > > >       /* Scan the device for video chains. */
> > > > -     if (uvc_scan_device(dev) < 0)
> > > > +     if (uvc_scan_device(dev) < 0) {
> > > > +             ret = -ENODEV;
> > > >               goto error;
> > > > +     }
> > > >
> > > >       /* Initialize controls. */
> > > > -     if (uvc_ctrl_init_device(dev) < 0)
> > > > +     if (uvc_ctrl_init_device(dev) < 0) {
> > > > +             ret = -ENODEV;
> > > >               goto error;
> > > > +     }
> > > >
> > > >       /* Register video device nodes. */
> > > > -     if (uvc_register_chains(dev) < 0)
> > > > +     if (uvc_register_chains(dev) < 0) {
> > > > +             ret = -ENODEV;
> > > >               goto error;
> > > > +     }
> > > >
> > > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > > >       /* Register the media device node */
> > > > -     if (media_device_register(&dev->mdev) < 0)
> > > > +     ret = media_device_register(&dev->mdev);
> > > > +     if (ret < 0)
> > > >               goto error;
> > > >  #endif
> > > >       /* Save our data pointer in the interface data. */
> > > > @@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
> > > >  error:
> > > >       uvc_unregister_video(dev);
> > > >       kref_put(&dev->ref, uvc_delete);
> > > > -     return -ENODEV;
> > > > +     return ret;
> > > >  }
> > > >
> > > >  static void uvc_disconnect(struct usb_interface *intf)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

