Return-Path: <linux-media+bounces-35006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EC6ADBBA6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 23:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ABE5167554
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 21:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351C6215F6B;
	Mon, 16 Jun 2025 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PNOY+2+5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73A21018A
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107771; cv=none; b=G4RA9r4TMW9LuYH+gk3W6xJOursGtzKXTBYxWIX6j/ZuqGvFCAHzcEL2fZBQp/oy4fAnmyP9HKUZkdVfXjhGmbmPl9EO2HYPi1b0Q9GaziXyjTEvVFIgxl2r4akRqdtGimZCt/ePU2ydYbCLOGUO+u0W5m1PRvPn3GIPn8VeGC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107771; c=relaxed/simple;
	bh=VUGbQSlpv2U8R1jdbUJn51uIyoYhGn8dY810LqSWYtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZQmLHzjWfAU6tqlpUCzIJaQjp3zwp3WGx2uR/biWpBmBs2aUEV1Z1dnW2wK0oJmqBlV2Dgr4IyNEthpgfVe67vNri9TdtsVwLx1e2A7dd9OX3NGEgRJi1kSxK2sbNoXaXze5cTKcmBSzXtF8542UZEknAANv1Hj9s1tnacF0gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PNOY+2+5; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32ae3e94e57so44124291fa.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 14:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750107767; x=1750712567; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9tJfw+k7xufHIN5ReiQx5xacfGPuiC+xpWuZiEqJRlI=;
        b=PNOY+2+5Wn9izafm48GcTNVhXt/m3KEOmw1BFJLTAkm6ONy8DzUW4CtFfzvuI/Aueh
         /P91xhECBlrVtPaU++UyBqsEp4xCqQrWxiGbnE5BPagEAha1E881+/TMD0Nv6FJ8Q5cq
         SY3npzuKWGE8JEQOqPGcGMm4GpyoE1hC9fU60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107767; x=1750712567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tJfw+k7xufHIN5ReiQx5xacfGPuiC+xpWuZiEqJRlI=;
        b=s1SmWhsr6tEHtUy5Cvovu6Hs9pyWgluS7zfU3aLU72NVd1hZlz3YPZSH3hNy8AExjp
         vFu8S4tZ1hUumekq0gDuteiouURuz4loY2/i01S/aZ3B1Px6RNKmV1Ts7wHCKIzXkgfS
         KgYbhIXmqWe+mlh7Iieu9f8RRu2TsLGQbw9lqFMMrhg4loyBsty+1WiNFl3bX8dxrnwo
         SfXhNdpuR8dL/7iqulHjoyDgjG3jJhVG4uQYPEoVK52ehuo7WHehzgMnKEW+462XrN8e
         dwCvj5KEryog7tJDPLOyIZMawv+6r3h4tfnzLCHgBx/tNtr/K7eEF+ymGAg0YLlAPphJ
         QdGw==
X-Forwarded-Encrypted: i=1; AJvYcCW0fSOTSNqDxNmGq9Uo3DsRLy2Ly65MHVlGIRE+jQxK/lupj1ntUWfbM047NleBI3fLT5bb7hf6i3vk8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIrHaycUAbRQjjqpYLeXCoCbQWDQ+Y3Sgf9egX5kaCYXBWTZmK
	hNCky+D8+Im+ZAfQhEC51etEStcydWhf+7qIDL2pkKay87pHOXnbS/yC9GH4qas+REauSWQQI7R
	etzI=
X-Gm-Gg: ASbGncuv6As1bauobsHKmSJeN8EYLRWCNXnpugqKOITy2h0mNTXkIB1iqaEt4/GE552
	7kmNfaC+iOu2WRRyHaGbeOjsL508gYGoljEvE1NOxbUz54VSzrnI6AOiEqN5DrrUQGsYCzi8A5/
	itXs0rHWoh+1s/H3BT/WBCahhnrDR3pATcCbYiYdI2iETG8dE8rC3Fhd1dVZvS22lwbgyI9JqeW
	7TEqKTA9gLLWNZnZ4rMPJch4csSKqwZ8ZMst/zOeaNZNval8rK9COWpIVUZJ2jW1uQzM5XhdY+c
	crANsojHF5Bkh/8Zn8pj6eBMtHSbkQmSKuQMUhIZ6f5X9C8LR3svXygPS28cPS9CN67uIy7+BCa
	liD5EVes/HkNK0cqxzyUHCc9BByEg
X-Google-Smtp-Source: AGHT+IEMFwyGEA9ADFF1rGzqsJWKSH9v7OtUYUFRf/VY8UmRxSdBj2pYydj8PThM4YyV2j2ZUgDTAQ==
X-Received: by 2002:a2e:a548:0:b0:32b:2ea9:1dcd with SMTP id 38308e7fff4ca-32b4a6854e0mr32537881fa.32.1750107767430;
        Mon, 16 Jun 2025 14:02:47 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b32ea6718sm16886821fa.0.2025.06.16.14.02.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:02:46 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32ade3723adso52233181fa.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 14:02:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOhEutgn8o4zl9fr1C2g3NgYuJecwusq4AhmnQQSSdAwtQ66dZS8dPq6EJccEK0NzWhYHUhhb1JHKkEA==@vger.kernel.org
X-Received: by 2002:a05:6512:138c:b0:553:66b3:c385 with SMTP id
 2adb3069b0e04-553b6ee3e9cmr2720265e87.24.1750107765537; Mon, 16 Jun 2025
 14:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
 <20250604-uvc-meta-v6-4-7141d48c322c@chromium.org> <d1e5942b-f8e5-42c6-98ae-d346927df3cb@kernel.org>
 <CANiDSCtXmXYkv3b_62iegTFOxBVrGUv9+mbioxvQvPsadwBpqg@mail.gmail.com> <ec722aa6-17d4-4264-b99f-bdae1d908713@kernel.org>
In-Reply-To: <ec722aa6-17d4-4264-b99f-bdae1d908713@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 23:02:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCu1b2n9c7WH2ZHysOY2xV1RbV9Z6AHBuXXfF8fV8OwYgg@mail.gmail.com>
X-Gm-Features: AX0GCFsNdtkP8JB6ltTsdc-cqZ6Op2oMgeY2ihm_dh0JlNkr6ExVMQMQ5z0q73M
Message-ID: <CANiDSCu1b2n9c7WH2ZHysOY2xV1RbV9Z6AHBuXXfF8fV8OwYgg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 16 Jun 2025 at 22:47, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 16-Jun-25 5:04 PM, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > On Mon, 16 Jun 2025 at 16:38, Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 4-Jun-25 14:16, Ricardo Ribalda wrote:
> >>> If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> >>> MSXU_META quirk.
> >>>
> >>> Reviewed-by: Hans de Goede <hansg@kernel.org>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_metadata.c | 72 ++++++++++++++++++++++++++++++++++++
> >>>  include/linux/usb/uvc.h              |  3 ++
> >>>  2 files changed, 75 insertions(+)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> >>> index df3f259271c675feb590c4534dad95b3b786f082..cd58427578ff413591b60abe0a210b90802dddc7 100644
> >>> --- a/drivers/media/usb/uvc/uvc_metadata.c
> >>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> >>> @@ -10,6 +10,7 @@
> >>>  #include <linux/list.h>
> >>>  #include <linux/module.h>
> >>>  #include <linux/usb.h>
> >>> +#include <linux/usb/uvc.h>
> >>>  #include <linux/videodev2.h>
> >>>
> >>>  #include <media/v4l2-ioctl.h>
> >>> @@ -188,11 +189,82 @@ static const struct v4l2_file_operations uvc_meta_fops = {
> >>>       .mmap = vb2_fop_mmap,
> >>>  };
> >>>
> >>> +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> >>> +
> >>> +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
> >>> +{
> >>> +     struct uvc_entity *entity;
> >>> +
> >>> +     list_for_each_entry(entity, &dev->entities, list) {
> >>> +             if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> >>> +                     return entity;
> >>> +     }
> >>> +
> >>> +     return NULL;
> >>> +}
> >>> +
> >>> +#define MSXU_CONTROL_METADATA 0x9
> >>> +static int uvc_meta_detect_msxu(struct uvc_device *dev)
> >>> +{
> >>> +     u32 *data __free(kfree) = NULL;
> >>> +     struct uvc_entity *entity;
> >>> +     int ret;
> >>> +
> >>> +     entity = uvc_meta_find_msxu(dev);
> >>> +     if (!entity)
> >>> +             return 0;
> >>> +
> >>> +     /*
> >>> +      * USB requires buffers aligned in a special way, simplest way is to
> >>> +      * make sure that query_ctrl will work is to kmalloc() them.
> >>> +      */
> >>> +     data = kmalloc(sizeof(*data), GFP_KERNEL);
> >>> +     if (!data)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     /* Check if the metadata is already enabled. */
> >>> +     ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> >>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> >>> +     if (ret)
> >>> +             return 0;
> >>> +
> >>> +     if (*data) {
> >>> +             dev->quirks |= UVC_QUIRK_MSXU_META;
> >>> +             return 0;
> >>> +     }
> >>> +
> >>> +     /*
> >>> +      * We have seen devices that require 1 to enable the metadata, others
> >>> +      * requiring a value != 1 and others requiring a value >1. Luckily for
> >>> +      * us, the value from GET_MAX seems to work all the time.
> >>> +      */
> >>> +     ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> >>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> >>> +     if (ret || !*data)
> >>> +             return 0;
> >>> +
> >>> +     /*
> >>> +      * If we can set MSXU_CONTROL_METADATA, the device will report
> >>> +      * metadata.
> >>> +      */
> >>> +     ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> >>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> >>> +     if (!ret)
> >>> +             dev->quirks |= UVC_QUIRK_MSXU_META;
> >>
> >> Since we set the ctrl to enable MSXU fmt metadata here, this means that
> >> cameras which also support V4L2_META_FMT_D4XX will be switched to MSXU
> >> metadata mode at probe() time.
> >
> > Not sure that I completely follow you. D4XX cameras will not be
> > switched to MSXU, they will support MSXU and D4XX with the current
> > patchset.
>
> Is MSXU an extension on top of D4XX ? If not then we need to tell
> the camera which metadata we want in uvc_meta_v4l2_set_format()

I think I know where the miss-comunication happened :)

MSXU is indeed a superset of D4xx. D4xx metadata is formatted in MSXU.

If an app fetches D4XX and MSXU from an Intel D4xx device, they are identical.

Or in other words, if D4XX devices have MSXU_CONTROL_METADATA, they
are probably today initialized with a value != 0.


Thanks!
>
> Currently your patch 4/4 does:
>
> +       ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> +                            MSXU_CONTROL_METADATA, data, sizeof(*data));
>
> in uvc_meta_detect_msxu() which runs at probe time.
>
> So patch 4/4 breaks V4L2_META_FMT_D4XX support as it switched the
> camera to MSXU metadata mode (I'm assuming the 2 metadata formats
> are different and that MSXU metadata is not just a superset of D4xx).
>
> This is why I suggest supporting only one metadata format. If we
> want to support both on cameras which support both and can switch
> formats with the msxu control, then this patch needs to modify
> uvc_meta_v4l2_set_format() to do something like this:
>
> +       ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> +                            MSXU_CONTROL_METADATA, data, sizeof(*data));
>
> When switching formats, that or only support 1 metadata fmt.
>
> I hope this explains my thinking here, if not keep asking questions ...
>
> Regards,
>
> Hans
>
>
>
>
> >
> >>
> >> So even if cameras exist which support both metadata formats, since we
> >> switch to MSXU at probe() time, disabling V4L2_META_FMT_D4XX support,
> >> the uvcvideo driver will only support 1 metadata fmt per camera.
> >> Which is fine supporting more then 1 metadata fmt is not worth
> >> the trouble IMHO.
> >
> > If we only support one metadata, we have two options for D4XX cameras:
> >
> > A) Switch to MSXU: apps that expect D4XX will not work. I think this
> > will mean breaking uAPI.
> > B) Keep D4XX and ignore MSXU: apps that work with MSXU will not work
> > with D4XX cameras. I do not love this but it will not affect my
> > usecase.
> >
> >
> > If you are ok with B) I can start the implementation. But I still
> > believe that the current option is more generic and the extra
> > complexity is not too excessive.
> >
> >
> >>
> >> This means that Laurent's remark on [PATCH v5 4/4]:
> >>
> >> "I would prefer if you could instead add a metadata format field in the
> >> uvc_device structure (I'd put it right after the info field, and while
> >> at it you could move the quirks field to that section too). The metadata
> >> format would be initialized from dev->info (when available) or set to
> >> the UVC format, and overridden when the MSXU is detected."
> >>
> >> is still relevant, which will also make patch 3/4 cleaner.
> >>
> >> The idea is to (in patch 3/4):
> >>
> >> 1. Introduce a dev->meta_format which gets initialized from dev->info->meta_format
> >> 2. Keep the quirk and if the quirk is set override dev->meta_format to
> >>    V4L2_META_FMT_UVC_MSXU_1_5 thus still allowing testing for MSXU metadata on
> >>    cameras which lack the MSXU_CONTROL_METADATA control.
> >>
> >> Doing things this way avoids the need for the complexity added to
> >> uvc_meta_v4l2_try_format() / uvc_meta_v4l2_set_format() /
> >> uvc_meta_v4l2_enum_format(). Instead the only changes necessary there now will
> >> be replacing dev->info->meta_format with dev->meta_format.
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>
> >>
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>>  int uvc_meta_register(struct uvc_streaming *stream)
> >>>  {
> >>>       struct uvc_device *dev = stream->dev;
> >>>       struct video_device *vdev = &stream->meta.vdev;
> >>>       struct uvc_video_queue *queue = &stream->meta.queue;
> >>> +     int ret;
> >>> +
> >>> +     ret = uvc_meta_detect_msxu(dev);
> >>> +     if (ret)
> >>> +             return ret;
> >>>
> >>>       stream->meta.format = V4L2_META_FMT_UVC;
> >>>
> >>> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> >>> index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
> >>> --- a/include/linux/usb/uvc.h
> >>> +++ b/include/linux/usb/uvc.h
> >>> @@ -29,6 +29,9 @@
> >>>  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >>>       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >>>        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> >>> +#define UVC_GUID_MSXU_1_5 \
> >>> +     {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> >>> +      0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> >>>
> >>>  #define UVC_GUID_FORMAT_MJPEG \
> >>>       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> >>>
> >>
> >
> >
>


--
Ricardo Ribalda

