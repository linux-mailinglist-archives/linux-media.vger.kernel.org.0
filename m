Return-Path: <linux-media+bounces-37600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 368C7B03951
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 10:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 516053BDC36
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 08:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1977E24113C;
	Mon, 14 Jul 2025 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GonXFGq4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2381923E23C
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481301; cv=none; b=ds+4VgQYUmKwrg2NDDvaHd8UJVTBYdig7ALJ7DEStbeVoeEISYUhWpeBAs1I445jz97jfu49osFRmY7LDHbDfcouh/E19JYbRoRAVTeB47P4z3rHvWc4Llv2qBzy2QlfqQ7Oc/PuX9/H84M7hR0XJKQUwsfFsV4e+pxniICSVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481301; c=relaxed/simple;
	bh=arVcmvMi7wv9dMtrbTzsYunSGTpRra0ZVUpLvZuaUuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biR2ytcOX0ETwBuxT+1cLEyRXJl0/pFICZCOgtyeEsqOFEucSF1zPDE9RFFhAEmhLNPGlhT3cmwRj5lNVBo1gJK77ffAzv15/4h4kpyEI10L9vAYYYZIzjGyLHooNlUSj5CWtZP7otXYhD2z+01W8yCtJY7EzBVwRj2m798exgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GonXFGq4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10594812so3969006e87.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 01:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752481297; x=1753086097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3QXzSslzxPfJBBocBjcOMU9pFCY2a4+fYCQYUTldnc8=;
        b=GonXFGq4QPafl67e4pLty42kcEYn1K/OBXuWK9EIO0LYjQKlFQCaD2+x3JjeoFQFwA
         ASMO6Sz8JGSv78VXRSgOzaYae0xdg97NQvp27e0rFQaSVYBjdX1eVn8Aqvm0uXotkC6Q
         wGzvAFBM6H6YRq22wtPr7+HjKX7q1fEPY97EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752481297; x=1753086097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QXzSslzxPfJBBocBjcOMU9pFCY2a4+fYCQYUTldnc8=;
        b=OFa0XqkQky/G15SMunAdZpMfN/mHBcLSSMc7S8OAtEBNCancPOCbYo5dbwQH1PclCf
         vd7zc73CSNzrH6vI1P1FxKvi8LbW80Pyq5Yz5lBU8loMpg8ts8RVvsaO5EBsfxwoLw1s
         zY3rphQZz6Nbq5nQEg/vqvfZymWDl0rVoQcarZ7wSfdWwG0wp5oNrDaps2j3n959e/GE
         ZAG6aHzElA2nvy9caburtuOF6RpT4VHHT4Irc7zKMncq1cD3XHhTZC/2N1OZLVGBFk70
         cqsGS16GxMq6m6Y9iKbxdfHn6NUmhEgc4v9IkOlOdBwXlftLxXg6oXqpjaO+Bl8LQz9t
         jg4w==
X-Forwarded-Encrypted: i=1; AJvYcCV/9Su3EcjbWxKuIrV57ud4o5q7u/g8nYUhr7iyCEwpOAY8IGznrqHBEuTnbiD2bzBvBEyrKVlkgV6/Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YztfIWGR2oYNnI5TYGXulrAwUcmoVqBeZ4fR0n0taIeAtm3H/gs
	RmqdanunhyOluX0P/pJBk0Q+KEYj+FE2ZyOgqkA+mUET6lDCITOvECkfuFrC3tv7+e4S9256F6g
	+7fc=
X-Gm-Gg: ASbGncv9bKmTwz5rIMlAF8p1TfhZcpRjBGI08Wt7CwJu+2YJn3ziZCXkDKVseJTczVz
	KPyjHBat0BpTmwJE7ramHMZdAlkOk4EINq6PcMrIaUx2FY/mkB4qqTRIbB53RC8v2h6ug7U4TeU
	MQxBIX+PuN9QIJT/inmOgE3b66+PZv7tJYCSgQY2k1bwpidOjpX6lOrS6NNRkV1/weDGpkVjOVJ
	2naboP9vt0MoIGxcnRj5vFxNMjcgp11ve84F+pkD0K0/asDIZbnaS55mv20ktvW6hkcjp3rZrfw
	4rQIP1cWB4WuQn/AENjiUjUQ/MERhAZN+fRDh1osbSl4r2Xm8jA6vcNQw2tYSsksI2LW/TixQaT
	skUatfxCS3uZVU4F2DPxJ+FjH6vDsfiRul5cVJMenFfS8Ayp7CQ1OUNt/PG9E
X-Google-Smtp-Source: AGHT+IEQ5wbtt/9UY7S/PwBIxRYcCqHmoiPA3VnT77rXwxAwF8A8enibaWWqcYK4suQfoVWx66LeHQ==
X-Received: by 2002:a05:6512:131e:b0:553:2698:99c5 with SMTP id 2adb3069b0e04-55a0461f686mr3267707e87.39.1752481297063;
        Mon, 14 Jul 2025 01:21:37 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6bb54sm1870688e87.179.2025.07.14.01.21.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 01:21:35 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b10594812so3968953e87.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 01:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/ul1bmZ/0bpEWZkR+4JzwZUiTE4nvo6tFUSCyzAkO4dKftBsrkoYlmAvL/jtLme6p7aoW/Ywq9KiDhA==@vger.kernel.org
X-Received: by 2002:a05:6512:3096:b0:553:3892:5ead with SMTP id
 2adb3069b0e04-55a044adb03mr3022181e87.2.1752481294990; Mon, 14 Jul 2025
 01:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-5-ed17f8b1218b@chromium.org> <20250711195815.GH27674@pendragon.ideasonboard.com>
 <CANiDSCsWE-5smL-H7CD_mi6AhJL2LAwf07bFpxJyN+0CnsLPfQ@mail.gmail.com> <20250714080608.GB10401@pendragon.ideasonboard.com>
In-Reply-To: <20250714080608.GB10401@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 10:21:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCvkTQeTsFwRiJF=9s8jHsRtWjb46=JcwLWPPK0VLqkbEA@mail.gmail.com>
X-Gm-Features: Ac12FXxusuV_-IRh_oeOSKzUpooIdoCQ91c10vGt0gZ29pEOz092uostatKw6ck
Message-ID: <CANiDSCvkTQeTsFwRiJF=9s8jHsRtWjb46=JcwLWPPK0VLqkbEA@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 10:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jul 14, 2025 at 09:46:45AM +0200, Ricardo Ribalda wrote:
> > On Fri, 11 Jul 2025 at 21:58, Laurent Pinchart wrote:
> > > On Mon, Jul 07, 2025 at 06:34:05PM +0000, Ricardo Ribalda wrote:
> > > > If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> > > > MSXU_META quirk.
> > > >
> > > > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c   |  7 +++-
> > > >  drivers/media/usb/uvc/uvc_metadata.c | 75 +++++++++++++++++++++++++++++++++++-
> > > >  drivers/media/usb/uvc/uvcvideo.h     |  2 +-
> > > >  include/linux/usb/uvc.h              |  3 ++
> > > >  4 files changed, 84 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index 56ea20eeb7b9d5d92f3d837c15bdf11d536e9f2d..9de5abb43e19d9e876cddc5d7124592953db89ac 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2315,7 +2315,12 @@ static int uvc_probe(struct usb_interface *intf,
> > > >               goto error;
> > > >       }
> > > >
> > > > -     uvc_meta_init(dev);
> > > > +     ret = uvc_meta_init(dev);
> > > > +     if (ret < 0) {
> > > > +             dev_err(&dev->udev->dev,
> > > > +                     "Error initializing the metadata formats (%d)\n", ret);
> > > > +             goto error;
> > > > +     }
> > > >
> > > >       if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
> > > >               udev->quirks &= ~USB_QUIRK_RESET_RESUME;
> > > > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > > > index 77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7..59bb133baf9a73ef6a30fa8ead85aa90653d60f4 100644
> > > > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > > > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > > > @@ -10,6 +10,7 @@
> > > >  #include <linux/list.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/usb.h>
> > > > +#include <linux/usb/uvc.h>
> > > >  #include <linux/videodev2.h>
> > > >
> > > >  #include <media/v4l2-ioctl.h>
> > > > @@ -166,6 +167,71 @@ static const struct v4l2_file_operations uvc_meta_fops = {
> > > >       .mmap = vb2_fop_mmap,
> > > >  };
> > > >
> > > > +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
> > > > +{
> > > > +     static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> > > > +     struct uvc_entity *entity;
> > > > +
> > > > +     list_for_each_entry(entity, &dev->entities, list) {
> > > > +             if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> > > > +                     return entity;
> > > > +     }
> > > > +
> > > > +     return NULL;
> > > > +}
> > > > +
> > > > +#define MSXU_CONTROL_METADATA 0x9
> > > > +static int uvc_meta_detect_msxu(struct uvc_device *dev)
> > > > +{
> > > > +     u32 *data __free(kfree) = NULL;
> > > > +     struct uvc_entity *entity;
> > > > +     int ret;
> > > > +
> > > > +     entity = uvc_meta_find_msxu(dev);
> > > > +     if (!entity)
> > > > +             return 0;
> > > > +
> > > > +     /*
> > > > +      * USB requires buffers aligned in a special way, simplest way is to
> > > > +      * make sure that query_ctrl will work is to kmalloc() them.
> > > > +      */
> > > > +     data = kmalloc(sizeof(*data), GFP_KERNEL);
> > > > +     if (!data)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     /* Check if the metadata is already enabled. */
> > > > +     ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> > > > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > > > +     if (ret)
> > > > +             return 0;
> > > > +
> > > > +     if (*data) {
> > > > +             dev->quirks |= UVC_QUIRK_MSXU_META;
> > > > +             return 0;
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * We have seen devices that require 1 to enable the metadata, others
> > > > +      * requiring a value != 1 and others requiring a value >1. Luckily for
> > >
> > > I'm confused here. If those are three different behaviours, then value
> > > != 1 would be value == 0 (as the third behaviour is value > 1). You test
> > > for !*data below, so 0 is not accepted as a valid value for this
> > > purpose. What am I missing ?
> >
> > There is a typo in the comment.
> >
> > Some devices require 1, some devices any value !=0, and other value=MAX.
> > I will fix it in a follow-up patch.
>
> The documentation of the control states that MSXU_CONTROL_METADATA
> reports the maximum size of the MS metadata generated by the device in
> kB, and the control should be set to the value reported by GET_MAX to
> enable metadata generation. That's what you're doing in this patch, so
> you can update the comment to document there.

Some vendors assumed the kB was a typo in MS spec and used bytes instead :)
In this favor I must say that kB here sounds like a mistake, I haven't
seen more than 300 bytes of metadata.

Will send a patch with the updated documentation.


>
> Some devices also don't support SET_CUR, in which case they should
> report GET_MIN == GET_DEF == GET_MAX. I assume GET_CUR should then also
> report the same value. Please also update the previous comment to
> explain this, the GET_CUR value check above is more about handling
> devices that always produce metadata than devices for which a driver has
> enabled metadata production.
>
> This leads to another question: should we enable metadata generation
> only when the metadata capture device is streaming ?

This will lead to a lot of issues with very little benefit.

We have no control over the order that the user will enable streamon
in the metadata and "normal" video devices. And the device will not
like that MSXU_CONTROL_METADATA changes during streamon.

I have not seen any performance penalty by the 300 new bytes
transferred when the metadata is on.


>
> > > > +      * us, the value from GET_MAX seems to work all the time.
> > > > +      */
> > > > +     ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> > > > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > > > +     if (ret || !*data)
> > > > +             return 0;
> > > > +
> > > > +     /*
> > > > +      * If we can set MSXU_CONTROL_METADATA, the device will report
> > > > +      * metadata.
> > > > +      */
> > > > +     ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> > > > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > > > +     if (!ret)
> > > > +             dev->quirks |= UVC_QUIRK_MSXU_META;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  int uvc_meta_register(struct uvc_streaming *stream)
> > > >  {
> > > >       struct uvc_device *dev = stream->dev;
> > > > @@ -185,9 +251,14 @@ int uvc_meta_register(struct uvc_streaming *stream)
> > > >                                        &uvc_meta_fops, &uvc_meta_ioctl_ops);
> > > >  }
> > > >
> > > > -void uvc_meta_init(struct uvc_device *dev)
> > > > +int uvc_meta_init(struct uvc_device *dev)
> > > >  {
> > > >       unsigned int i = 0;
> > > > +     int ret;
> > > > +
> > > > +     ret = uvc_meta_detect_msxu(dev);
> > > > +     if (ret)
> > > > +             return ret;
> > > >
> > > >       dev->meta_formats[i++] = V4L2_META_FMT_UVC;
> > > >
> > > > @@ -201,4 +272,6 @@ void uvc_meta_init(struct uvc_device *dev)
> > > >
> > > >        /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> > > >       dev->meta_formats[i++] = 0;
> > > > +
> > > > +     return 0;
> > > >  }
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 616adc417c62a58686beccbc440a5dfac0a2d588..a4c064c5e046f2a4adba742c8777a10619569606 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -757,7 +757,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > > >  void uvc_video_clock_update(struct uvc_streaming *stream,
> > > >                           struct vb2_v4l2_buffer *vbuf,
> > > >                           struct uvc_buffer *buf);
> > > > -void uvc_meta_init(struct uvc_device *dev);
> > > > +int uvc_meta_init(struct uvc_device *dev);
> > > >  int uvc_meta_register(struct uvc_streaming *stream);
> > > >
> > > >  int uvc_register_video_device(struct uvc_device *dev,
> > > > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > > > index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
> > > > --- a/include/linux/usb/uvc.h
> > > > +++ b/include/linux/usb/uvc.h
> > > > @@ -29,6 +29,9 @@
> > > >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> > > >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > > >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > > > +#define UVC_GUID_MSXU_1_5 \
> > > > +     {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> > > > +      0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> > > >
> > > >  #define UVC_GUID_FORMAT_MJPEG \
> > > >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

