Return-Path: <linux-media+bounces-33257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0BAC2296
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 14:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87ED616AE8C
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D8023A564;
	Fri, 23 May 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="adDDdjZf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6D0231855
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748003058; cv=none; b=skLwGdaglbv1L9qteYAGpA6WqYLf3EQzuVEDXE5ZiUHogjfo98gdjUGcMjwY0s6mDI4gWJH9Os4xKiyUizoGAuKWxRg50HfQ5tsmp/smaYqAwd4LW5SIeH1VRVtXOh7kA8kLLLlzvshedjHLHpBAzGfOgcljA1ZddDlMqArf4Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748003058; c=relaxed/simple;
	bh=CRQ1CMrTbmORbM8q+dECoDek/gZU71KuJkuyy/QwL7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNLZEYd8UarAHTWG1bdzOC5JhBDEtwGCNT9240hl9zGYRpgsowdNrzK7bbDoXpwVMhhm0i8J4/12dEdaIIyaP+3d94nO0uQpsz0inWdxEWkzlkk7ypk+iOKNf1hL30Pyl5fEadKB39crfdPIc4R3ovKSX285yJgMF/FkhNfeMlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=adDDdjZf; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-550e2ac6bc9so9971867e87.1
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 05:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748003055; x=1748607855; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fezVj3hu+n03EIwbXRE/aCJEPV25lQN8HH83CRPugxs=;
        b=adDDdjZfyubirpITGT4eapqIbqhQ0iSI1/32WlFlzP5lovIEb9LxSX8xamZANCauP5
         EzSPnYGsEpeP7lsGp8cw8AaC8cNjQ+SIxssLUJm0xlBgBgZY1l5tAKNoCzmeqvbb1K0S
         6BNSNuxjg2U/EjR4o/EwDSuQYGgDSvXGr4Gns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748003055; x=1748607855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fezVj3hu+n03EIwbXRE/aCJEPV25lQN8HH83CRPugxs=;
        b=QE8ZuRPB5sUkRen7jq/q4Tv0ntv4YVo3meZn5JFYO6ArilHkABsfyrGFtq6eo9LjWd
         wmS37VIxxvzJ3oQaJqC2UqsAUKFra9C9pYYmazisMjDLOlmI6pSF1I1ap/k3/5TqkcRc
         4MrHtUNRsf/Cb+ssl3GxtpPY25xESoL3JiLwvAHUnnyASW3bCQVLD4WS8CHKGLzGd03e
         Kpnp82rKQ58BEJ6HDXgCiWJN9iO6SJKsyUBk99m1mpc6yj1bLtxDjcci/edM+s2bXQZP
         717KhjeQ+rjCh1ftusu3npySnAZi3n0BcONkj54AcR/6OjKGTPWhJ88wiOz4iUdqY+0b
         AY9A==
X-Forwarded-Encrypted: i=1; AJvYcCWEusXO3Tw1orp332oS7b7swa5F/vuHlR+sz2o2VmWioOhi+7ZzLoyp77BQlACKQnSEJQCrtH3R4BOWuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDY378dP0Y1BsFhAYjU8wIVBYgO9ovhYk9lxBcPkZjitGjpob
	xHc2emiMGZrGMcyrKI7UUeWULmges84D08Tt7+QsxGu7GPQGgE0Fs1Dasj0iJuHlp4aZtHQF6Mj
	pmv3NUg==
X-Gm-Gg: ASbGncs7mStv2VPyJ9BB9V/qFjUw3yCOStkT3+X3cBY04knTw4MDtcDHZXy3YPWbFY0
	tLmKAPWRJU1oxWlsIY505nvRHg3BZVRZgbhn3tHZqaOZvD3NBq6pnNKCJkkJVexX/UTkdD06YJ/
	zH3kmWm2cHMgmJvBTZRtSByXoaWi5CNrkGsEXeNEY9vvkuOn8PXd8/BI03BkI6OOr0IaHup2//H
	YPAGvE2gZoTS+W15QIW5Wxjam/IxCCLXSIcv+851pssHHFw/mshmtKtr3YW2e+YnBY3uMoIeWNY
	LYeu4EmECpTnDs8Oh1Ow7qOjMNN2x/7zXDvhx8FHqoPvHrXB/hjUjb9RwM6EPPM8xAWytVrCfwM
	PeJ1G2CFNpJ3ugqPm5w==
X-Google-Smtp-Source: AGHT+IGjSqot6gebvknQejWDTtT+6UXxp3MdN25L4n9wu1xdTg5cFpZeAysYe/qtBozInkRCvoxTTA==
X-Received: by 2002:a05:6512:460f:b0:54a:fa5a:e9b1 with SMTP id 2adb3069b0e04-550e7193751mr9196230e87.10.1748003054795;
        Fri, 23 May 2025 05:24:14 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fbffsm3839406e87.75.2025.05.23.05.24.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 05:24:13 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3293da06120so13227231fa.2
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 05:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1yAy+zr3HGe/D12sVabQNAPRNeZXqpJlRDhdxPwKIgH7IA16hewYdqiB4W0MwIDWEpWSYxjRgr891YA==@vger.kernel.org
X-Received: by 2002:a05:651c:20c1:b0:328:848:839f with SMTP id
 38308e7fff4ca-32808488552mr57254401fa.40.1748003053410; Fri, 23 May 2025
 05:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
 <20250509-uvc-followup-v1-4-73bcde30d2b5@chromium.org> <20250523115759.GE12514@pendragon.ideasonboard.com>
In-Reply-To: <20250523115759.GE12514@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 May 2025 14:24:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCsmhQFYwsPy8QNnrgrwKj3E9PHJbo+hKv_i-_70b-Wktw@mail.gmail.com>
X-Gm-Features: AX0GCFt2VRsyLYkzyn2U4jT6Qm-K5sPzCzV9IpY2Lpvoh6aT3jqDH6TEI5q1KAg
Message-ID: <CANiDSCsmhQFYwsPy8QNnrgrwKj3E9PHJbo+hKv_i-_70b-Wktw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Populate all errors in uvc_probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 23 May 2025 at 13:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Fri, May 09, 2025 at 06:24:16PM +0000, Ricardo Ribalda wrote:
> > Now we are replacing most of the error codes with -ENODEV.
> > Instead, Populate the error code from the functions called by
> > uvc_probe().
> >
> > Take this opportunity to replace a generic error code from
> > uvc_scan_device() into something more meaningful.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 15 ++++-----------
> >  1 file changed, 4 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index da24a655ab68cc0957762f2b67387677c22224d1..cdf4bbe582272277a6a95267e9752010adc51b6b 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1866,7 +1866,7 @@ static int uvc_scan_device(struct uvc_device *dev)
> >
> >       if (list_empty(&dev->chains)) {
> >               dev_info(&dev->udev->dev, "No valid video chain found.\n");
> > -             return -1;
> > +             return -ENODEV;
> >       }
> >
> >       /* Add GPIO entity to the first chain. */
> > @@ -2239,7 +2239,6 @@ static int uvc_probe(struct usb_interface *intf,
> >       /* Parse the Video Class control descriptor. */
> >       ret = uvc_parse_control(dev);
> >       if (ret < 0) {
> > -             ret = -ENODEV;
> >               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
> >               goto error;
> >       }
> > @@ -2275,22 +2274,16 @@ static int uvc_probe(struct usb_interface *intf,
> >               goto error;
> >
> >       /* Scan the device for video chains. */
> > -     if (uvc_scan_device(dev) < 0) {
> > -             ret = -ENODEV;
> > +     if (uvc_scan_device(dev) < 0)
>
> That's not going to work. You probably meant
>
>         ret = uvc_scan_device(dev);
>         if (ret < 0)

Ups, seems like I sent a partial path :S

Sorry about that. Shall I resend 4/4 or you want to take it as well?

>
> Same elsewhere where applicable.
>
> >               goto error;
> > -     }
> >
> >       /* Initialize controls. */
> > -     if (uvc_ctrl_init_device(dev) < 0) {
> > -             ret = -ENODEV;
> > +     if (uvc_ctrl_init_device(dev) < 0)
> >               goto error;
> > -     }
> >
> >       /* Register video device nodes. */
> > -     if (uvc_register_chains(dev) < 0) {
> > -             ret = -ENODEV;
> > +     if (uvc_register_chains(dev) < 0)
> >               goto error;
> > -     }
> >
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >       /* Register the media device node */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

