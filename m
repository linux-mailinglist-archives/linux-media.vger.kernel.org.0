Return-Path: <linux-media+bounces-30763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D92A97AAF
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 00:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08FF83A7399
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5822C2AB4;
	Tue, 22 Apr 2025 22:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VkRbpU87"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517172BEC21
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 22:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745362230; cv=none; b=n/NzpltTAmvgVoBdNazppGCQZsV0rAdrcZ7dI6UG3MY89cx+CTQDG5I3769RLcEVi8uCuS6tFUedfoH30UG1UmK1w7GiSjV7oR0nSiGXqlA4dsNTP/CmJa9bFGnpK0vjoMHxzs9CiiVJDR6hQOtU5YGcHpjyrzuQmD1iaKntVNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745362230; c=relaxed/simple;
	bh=a4EcOav03n+HBGzNSNuTxKZNDu09J/N3p9II0SkD8xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfazYyLWpEgRKI/cMjDi+cyo7eAVm1VFYP2EUSpi8JXnKBa12zlChNam1h2F4cn8BQQ+JZ+jcZxaL/I0Xkss5/zq6nhG9dbuZFl+UxWS+FP6nO8oV1UJYefAZ6dqNecyfD5bBO/7t9F+U573WtORXxSRIUuMa3HXvz8iz4Zf4yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VkRbpU87; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499c5d9691so6475954e87.2
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 15:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745362226; x=1745967026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oZCFkPT9VQDSYU37yasnvmuyi6JQuptLSL8TbX1/xkM=;
        b=VkRbpU87IB2WUGmVLF6WAabnc3Ak9eNMrbJuNyMMR+8nRfcAqx+YXAKMYN1cZZXzBo
         W3HlkC02O9167AJjF4zLhr3Pq/Xpgd0heanHwuPh/HXhZvNN9zrXazgNFrkfPnnfk6A0
         Cru87A0Y4r9vlXNb0iPercg1N+A/vsq85IFLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745362226; x=1745967026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZCFkPT9VQDSYU37yasnvmuyi6JQuptLSL8TbX1/xkM=;
        b=F0CvPil0sb9UTF1lRtPBRNyhfNkeWNNZsLZsqOgQPcmHuWmaH5NfPnZM0ZSBHrsOu0
         d3l1fNYsf+pYu08BJFl6TDuLn9EnHs8GlnU8nwqeKau0DRo27/UU1z5W5QrUmpuVYBkz
         c3AGPi3ZiIyqqiL24ECUEDN1FzocyWfRHuVfhXUmAb4fOFjRkk5dB0Z4rO662Dz6Hy5T
         R3/upea5irQLt9CY8t5I5Sp8cFuJ/+bVD1oN2hbw16GjoclD9u51DY8nKxHuVseOuoM+
         6MPqX5cUc9exGTBoMc8QYdpK3qL5ooVU5aOi2NwDsiLueh3aZ9MEe2KuwSGtDQnjWMkE
         htVg==
X-Forwarded-Encrypted: i=1; AJvYcCXLg1EpSxpUhusmY/5H0y5AN+yudDV5v2pYfH5vfWgMv3y827XGXDR18aah+La1/jCd1v3+7BXJvfQSNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO5NcCBpSfBSX6yWNvB3+PDSS+6L9oLumqUnN/4BFJViMUhueN
	GEM9zXUs4pNM8bhxEl1GeA1MmPiLzcn9+MdtWJkchqg8npIy5cYUt6FDnzQTFE6cRcj0jaaUklh
	59Q==
X-Gm-Gg: ASbGncuwNhjY4sPXe5cbYYQy5zbhpL0OOB177hnjKiuulh4pL7m3CHHDAkFC3PJrc8K
	ilLF4R1208nyf+4IfkoPiMIuDJGCHP+8vumTBjgVuKZhrPQ5b3xZ+d7tQ0t6rclomiimuhXCz+3
	iDwa+QIKy9kGv/NwMbNPn3x9sL6kpZAOejl0hk96un4zitYiOz4hDKXhiqBLoLZwUV5vGyOv66e
	oq8e4PZqr8zdVYtG3ca+/sWKoZA3qDw6K32kSplhcp39VUz8SKxtFW3JNuADaBBj2oU5/4m4bqm
	dv06fzbCO1bD7zPtlRE0m0BeRoRFWAATVRA6tYNRdffDQV3RkCgqKr3qc9tisQ4TfTeVveBSbso
	hMNmgbZQ=
X-Google-Smtp-Source: AGHT+IHFrZoC+XGQcN3DxExjjZ5B5y0Y74Y2CoYQbGhl/mheegUywETg+WzTp8HGMEMvdkaQU6PCLw==
X-Received: by 2002:a05:6512:ba1:b0:545:e2e:8425 with SMTP id 2adb3069b0e04-54d6e657830mr4531542e87.39.1745362226178;
        Tue, 22 Apr 2025 15:50:26 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e52481bsm1333082e87.25.2025.04.22.15.50.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:50:25 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso56293561fa.3
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 15:50:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBxHNmimE40/xnzeIjhMOC3WNKqoexGKok+/01NNeFwhdq2PdI1UsBV2Tijbmib0CaNEVI+iPXY4fG+Q==@vger.kernel.org
X-Received: by 2002:a05:651c:220e:b0:30d:e104:b594 with SMTP id
 38308e7fff4ca-31090579a68mr48817081fa.40.1745362224964; Tue, 22 Apr 2025
 15:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
 <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org> <20250422180630.GJ17813@pendragon.ideasonboard.com>
In-Reply-To: <20250422180630.GJ17813@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Apr 2025 06:50:10 +0800
X-Gmail-Original-Message-ID: <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com>
X-Gm-Features: ATxdqUHelesrjtdLbpQ4wqs-_HLIDR_oOasDUe41GrOFPkA28vVRIy-nBpD1INE
Message-ID: <CANiDSCuO+dHOBtW4yvy1n25QWEs-WdQ9H8Lh2rUtcPbUq3hBkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Fix deferred probing error
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 02:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Mar 13, 2025 at 12:20:39PM +0000, Ricardo Ribalda wrote:
> > uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> > have not yet been probed. This return code should be propagated to the
> > caller of uvc_probe() to ensure that probing is retried when the required
> > GPIOs become available.
> >
> > Currently, this error code is incorrectly converted to -ENODEV,
> > causing some internal cameras to be ignored.
> >
> > This commit fixes this issue by propagating the -EPROBE_DEFER error.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
> >  1 file changed, 19 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index deadbcea5e227c832976fd176c7cdbfd7809c608..e966bdb9239f345fd157588ebdad2b3ebe45168d 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
> >  #endif
> >
> >       /* Parse the Video Class control descriptor. */
> > -     if (uvc_parse_control(dev) < 0) {
> > +     ret = uvc_parse_control(dev);
> > +     if (ret < 0) {
> > +             ret = -ENODEV;
>
> Why do you set ret to -ENODEV here...
>
> >               uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
> >               goto error;
> >       }
> >
> >       /* Parse the associated GPIOs. */
> > -     if (uvc_gpio_parse(dev) < 0) {
> > +     ret = uvc_gpio_parse(dev);
> > +     if (ret < 0) {
> >               uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> >               goto error;
> >       }
> > @@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
> >       }
> >
> >       /* Register the V4L2 device. */
> > -     if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
> > +     ret = v4l2_device_register(&intf->dev, &dev->vdev);
> > +     if (ret < 0)
>
> ... but not here ? The code below is also not very consistant.

For all the "external" functions I was looking into populating their
error code to probe(). Other drivers (check vivid for example) do
exactly this.

There is more value in returning the real cause of the error (ENOMEM,
EINVAL) that the plain ENODEV.

>
> >               goto error;
> >
> >       /* Scan the device for video chains. */
> > -     if (uvc_scan_device(dev) < 0)
> > +     if (uvc_scan_device(dev) < 0) {
> > +             ret = -ENODEV;
> >               goto error;
> > +     }
> >
> >       /* Initialize controls. */
> > -     if (uvc_ctrl_init_device(dev) < 0)
> > +     if (uvc_ctrl_init_device(dev) < 0) {
> > +             ret = -ENODEV;
> >               goto error;
> > +     }
> >
> >       /* Register video device nodes. */
> > -     if (uvc_register_chains(dev) < 0)
> > +     if (uvc_register_chains(dev) < 0) {
> > +             ret = -ENODEV;
> >               goto error;
> > +     }
> >
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >       /* Register the media device node */
> > -     if (media_device_register(&dev->mdev) < 0)
> > +     ret = media_device_register(&dev->mdev);
> > +     if (ret < 0)
> >               goto error;
> >  #endif
> >       /* Save our data pointer in the interface data. */
> > @@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
> >  error:
> >       uvc_unregister_video(dev);
> >       kref_put(&dev->ref, uvc_delete);
> > -     return -ENODEV;
> > +     return ret;
> >  }
> >
> >  static void uvc_disconnect(struct usb_interface *intf)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

