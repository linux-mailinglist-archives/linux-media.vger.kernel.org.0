Return-Path: <linux-media+bounces-34954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B632FADB4EC
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 155F77AB77F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462EC219303;
	Mon, 16 Jun 2025 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gtYavM4v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5D92BEFF9
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086306; cv=none; b=eiGsOKy34JtFU0nxL1Y6lBvwWen1FmHYZtlOY0XzyuT5ucNjfSN75mCGwp8IxOySThoj8XMe/Nf7CjT6vM9Wsg7Sb22Zxwk1mXzUOIi7nC/zOvBVynAXXptd3QJZMyZSzebFy6cGzWLyD5tRgAEqzN753fELgR20j3K6ln4+r/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086306; c=relaxed/simple;
	bh=xEEEFe2DCXOIcoLFyj2eBlLVjU/+jvg+u7CPfzyUFAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rw6R81zs5iQle69uHXeIKv4FgfAxkdQbsihUmp+7QJbtn57rmMlh8LFYMxt9SShM5a1hPV/KcJftBdGwjXv79xtb2Xt+GsueAUBHV0iaIiFVVdeFvn6EdRrOZanvinEMkWiel43SNPkZk5esMQJpTwLEVfwWMSXXS3OORwEaYik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gtYavM4v; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553bcf41440so1690833e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750086303; x=1750691103; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7CmiRg3wf48axsfuxxvYfT6/rUXvgOviud+TRcFYhmo=;
        b=gtYavM4v/WQXj1QFE7tbYi4qEbmPPb4ItEWLEP2yHIq9pD0TZsE38w0aiDGfSJLt8j
         j+QElaexJl93RI90QqE4T+ANgxDEFXVAwGnC/gl/O0kL6BtjrW+FPy/+ww3Lfo5wVY5I
         7L/Blvt0xg7jI9L1T5AKzN1EreZPyx4xcilEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086303; x=1750691103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CmiRg3wf48axsfuxxvYfT6/rUXvgOviud+TRcFYhmo=;
        b=Sup1MDUn2eI4J6WUI8mUst5wK4H3bg8cL2gaRLXqWj5Cl19B59JpbfsYbh0RTXeYP8
         dNShcxIm5ceLFaiICMyZ67y4MdEY2KBeq0xdWgllC4p7Qs0khGRrXpvB4ufft/HVQH3x
         2WEcuCGB1E4jlyZDspJRaqqqtWQXk0o2Nm5aVDulz2UtueEEQmwDvL/v8ZF2n7ki6q8n
         HxCK6378bQNBst5Si/dD619uvMOyJltlvuzw7t7Db7ljkGjziM90jE0J1LBWH3B9IxJI
         deZsDi3p/uQ8RXPAY3zTipkmRY5mQRZMGL/EQ6RDE1AkmSKlwym6LQ1Ml9ZDGGYk5/p3
         tj5A==
X-Forwarded-Encrypted: i=1; AJvYcCUmtuhoyfcppDO5rGbmVFYyt67LjiPfSo7MIzbadjaI17KBgvxMfJf2/teukeBbtffr74AVGOEWnprqLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr609jHKgrzm8fuUX85FLCaFzEsU5QzQ++A7D7auBDEU8wS0hU
	EKL0praCZPDOUaF3m6IqLr0wP84KwXme+PfFUG8KZr0SPQkOyWLNCSngmZxHxJ9vf0xiGQYXclT
	0Swg=
X-Gm-Gg: ASbGncuMvt4QRNbovfBtezXyCOZsQxj/MQVade2IAN+UUuoiR6GTnZDGpoRsnPZtcSG
	czfbnGy/7a0NsGwWDmVWyAZgrR2DXOLZa767PiCpC9O/VRmm8RJwngUlKV0U7uO1Tr/JFMi2DLr
	7jBkukgpelgh1aJAye8vBlPLgVQRv227xiDYXTp1s7henW7vosQjewHHgAjjsMRIItK65SKhIAD
	2RPLZ+pTlZfL1NgnsXDp5sfj3i1zf6oS9xhSarF0BAMV8bzWEXdRwmwrdgstbDsOL0udI09AYEW
	jFT4rFvF82+D9PxXBrq8eDvGhWpx6V2l/dwdZkCtCM1tm3rWAzrWRIxE4oLgdJr3FeokeIplQpF
	141PeLGcDXeDkCeRfSPjZjC4M
X-Google-Smtp-Source: AGHT+IHbEuFcOfKOE0UmMP/ZozaKz3UaJdVFfuJrpwz+kK/fRsUKdXRmlCVxt1CZrgtw8vgid6kEFQ==
X-Received: by 2002:a05:6512:e9a:b0:553:3446:beda with SMTP id 2adb3069b0e04-553b6f0b235mr2818761e87.35.1750086302543;
        Mon, 16 Jun 2025 08:05:02 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac135c2dsm1587881e87.67.2025.06.16.08.05.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 08:05:02 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b51f5218so2896599e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:05:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfccLw7L9lIVX6tSiHVLE1wRFkBVioF8byVoJM+RPR+g4rLLdDeCI5yWjvJF6vDBa2JMq9c04x2JggGA==@vger.kernel.org
X-Received: by 2002:a05:6512:39cc:b0:553:3770:c912 with SMTP id
 2adb3069b0e04-553b6f42a3fmr2460867e87.47.1750086300514; Mon, 16 Jun 2025
 08:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
 <20250604-uvc-meta-v6-4-7141d48c322c@chromium.org> <d1e5942b-f8e5-42c6-98ae-d346927df3cb@kernel.org>
In-Reply-To: <d1e5942b-f8e5-42c6-98ae-d346927df3cb@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 17:04:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCtXmXYkv3b_62iegTFOxBVrGUv9+mbioxvQvPsadwBpqg@mail.gmail.com>
X-Gm-Features: AX0GCFuHFKUi-9B4I3CPVjTQKDuL0NpKPYCYgWNg_SuaoEaEGMlQPtEEXLBpmJ8
Message-ID: <CANiDSCtXmXYkv3b_62iegTFOxBVrGUv9+mbioxvQvPsadwBpqg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 16 Jun 2025 at 16:38, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 4-Jun-25 14:16, Ricardo Ribalda wrote:
> > If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> > MSXU_META quirk.
> >
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_metadata.c | 72 ++++++++++++++++++++++++++++++++++++
> >  include/linux/usb/uvc.h              |  3 ++
> >  2 files changed, 75 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index df3f259271c675feb590c4534dad95b3b786f082..cd58427578ff413591b60abe0a210b90802dddc7 100644
> > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> >  #include <linux/usb.h>
> > +#include <linux/usb/uvc.h>
> >  #include <linux/videodev2.h>
> >
> >  #include <media/v4l2-ioctl.h>
> > @@ -188,11 +189,82 @@ static const struct v4l2_file_operations uvc_meta_fops = {
> >       .mmap = vb2_fop_mmap,
> >  };
> >
> > +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> > +
> > +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
> > +{
> > +     struct uvc_entity *entity;
> > +
> > +     list_for_each_entry(entity, &dev->entities, list) {
> > +             if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> > +                     return entity;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +#define MSXU_CONTROL_METADATA 0x9
> > +static int uvc_meta_detect_msxu(struct uvc_device *dev)
> > +{
> > +     u32 *data __free(kfree) = NULL;
> > +     struct uvc_entity *entity;
> > +     int ret;
> > +
> > +     entity = uvc_meta_find_msxu(dev);
> > +     if (!entity)
> > +             return 0;
> > +
> > +     /*
> > +      * USB requires buffers aligned in a special way, simplest way is to
> > +      * make sure that query_ctrl will work is to kmalloc() them.
> > +      */
> > +     data = kmalloc(sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     /* Check if the metadata is already enabled. */
> > +     ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > +     if (ret)
> > +             return 0;
> > +
> > +     if (*data) {
> > +             dev->quirks |= UVC_QUIRK_MSXU_META;
> > +             return 0;
> > +     }
> > +
> > +     /*
> > +      * We have seen devices that require 1 to enable the metadata, others
> > +      * requiring a value != 1 and others requiring a value >1. Luckily for
> > +      * us, the value from GET_MAX seems to work all the time.
> > +      */
> > +     ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > +     if (ret || !*data)
> > +             return 0;
> > +
> > +     /*
> > +      * If we can set MSXU_CONTROL_METADATA, the device will report
> > +      * metadata.
> > +      */
> > +     ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > +     if (!ret)
> > +             dev->quirks |= UVC_QUIRK_MSXU_META;
>
> Since we set the ctrl to enable MSXU fmt metadata here, this means that
> cameras which also support V4L2_META_FMT_D4XX will be switched to MSXU
> metadata mode at probe() time.

Not sure that I completely follow you. D4XX cameras will not be
switched to MSXU, they will support MSXU and D4XX with the current
patchset.

>
> So even if cameras exist which support both metadata formats, since we
> switch to MSXU at probe() time, disabling V4L2_META_FMT_D4XX support,
> the uvcvideo driver will only support 1 metadata fmt per camera.
> Which is fine supporting more then 1 metadata fmt is not worth
> the trouble IMHO.

If we only support one metadata, we have two options for D4XX cameras:

A) Switch to MSXU: apps that expect D4XX will not work. I think this
will mean breaking uAPI.
B) Keep D4XX and ignore MSXU: apps that work with MSXU will not work
with D4XX cameras. I do not love this but it will not affect my
usecase.


If you are ok with B) I can start the implementation. But I still
believe that the current option is more generic and the extra
complexity is not too excessive.


>
> This means that Laurent's remark on [PATCH v5 4/4]:
>
> "I would prefer if you could instead add a metadata format field in the
> uvc_device structure (I'd put it right after the info field, and while
> at it you could move the quirks field to that section too). The metadata
> format would be initialized from dev->info (when available) or set to
> the UVC format, and overridden when the MSXU is detected."
>
> is still relevant, which will also make patch 3/4 cleaner.
>
> The idea is to (in patch 3/4):
>
> 1. Introduce a dev->meta_format which gets initialized from dev->info->meta_format
> 2. Keep the quirk and if the quirk is set override dev->meta_format to
>    V4L2_META_FMT_UVC_MSXU_1_5 thus still allowing testing for MSXU metadata on
>    cameras which lack the MSXU_CONTROL_METADATA control.
>
> Doing things this way avoids the need for the complexity added to
> uvc_meta_v4l2_try_format() / uvc_meta_v4l2_set_format() /
> uvc_meta_v4l2_enum_format(). Instead the only changes necessary there now will
> be replacing dev->info->meta_format with dev->meta_format.
>
> Regards,
>
> Hans
>
>
>
>
>
> > +
> > +     return 0;
> > +}
> > +
> >  int uvc_meta_register(struct uvc_streaming *stream)
> >  {
> >       struct uvc_device *dev = stream->dev;
> >       struct video_device *vdev = &stream->meta.vdev;
> >       struct uvc_video_queue *queue = &stream->meta.queue;
> > +     int ret;
> > +
> > +     ret = uvc_meta_detect_msxu(dev);
> > +     if (ret)
> > +             return ret;
> >
> >       stream->meta.format = V4L2_META_FMT_UVC;
> >
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -29,6 +29,9 @@
> >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > +#define UVC_GUID_MSXU_1_5 \
> > +     {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> > +      0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> >
> >  #define UVC_GUID_FORMAT_MJPEG \
> >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> >
>


-- 
Ricardo Ribalda

