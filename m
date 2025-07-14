Return-Path: <linux-media+bounces-37597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7525CB038B7
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 10:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE8317AED3
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 08:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788052397BF;
	Mon, 14 Jul 2025 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iCI/svGe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA2922F74E;
	Mon, 14 Jul 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752480403; cv=none; b=FE3xdgqZ2P2Jb8nl/iIgOpNlyNG9vqyGmd0cMq3bm84pg0UXAD85S0lgz1gea5IAGbtpGxm9mZPHJpMD3838++6Tb98r/temQ4Q1x3UFt34YcAQCsrxfwobKVU/oIYY66T4XC7YLeuBxoryy+To9qTQzNpzkSs+ifvNKcBSeiBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752480403; c=relaxed/simple;
	bh=GvBCjw6DYEUWYaKGZs8AUnAbMDR3q1C7z5x7ZTupAxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgldL5NmB1xeVDUfP11OgrH/3mjsYHzwxPG52XfOvJTReAjkzGpAoNAkFbtZh20IRkrxJZPPIEZFgMrdsCBPCjcC0riWrUENMUDW2qEy3YQ06eiygDTKaUj0gQ/btvqV2anAspcpAe1NztJ9hcxzExTDRJW62Xf98tZHVybW8eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iCI/svGe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 68531166D;
	Mon, 14 Jul 2025 10:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752480368;
	bh=GvBCjw6DYEUWYaKGZs8AUnAbMDR3q1C7z5x7ZTupAxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iCI/svGerfaWRLpgln6VnHYdj62DqF1Kpf5N+55yQJLBtk70Nup4orLCNswZCaLSp
	 B89Vb0LhOZlht6x7Eq2G+z2zfYur9FFcoP3tmmZjxwPwA0d7SA3qqyNxMFcW2RuyIX
	 CiZzEnHFbw3jlp9azjoWfrk5L372e6b1CGL6RoNQ=
Date: Mon, 14 Jul 2025 11:06:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 5/5] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
Message-ID: <20250714080608.GB10401@pendragon.ideasonboard.com>
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-5-ed17f8b1218b@chromium.org>
 <20250711195815.GH27674@pendragon.ideasonboard.com>
 <CANiDSCsWE-5smL-H7CD_mi6AhJL2LAwf07bFpxJyN+0CnsLPfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsWE-5smL-H7CD_mi6AhJL2LAwf07bFpxJyN+0CnsLPfQ@mail.gmail.com>

On Mon, Jul 14, 2025 at 09:46:45AM +0200, Ricardo Ribalda wrote:
> On Fri, 11 Jul 2025 at 21:58, Laurent Pinchart wrote:
> > On Mon, Jul 07, 2025 at 06:34:05PM +0000, Ricardo Ribalda wrote:
> > > If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> > > MSXU_META quirk.
> > >
> > > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c   |  7 +++-
> > >  drivers/media/usb/uvc/uvc_metadata.c | 75 +++++++++++++++++++++++++++++++++++-
> > >  drivers/media/usb/uvc/uvcvideo.h     |  2 +-
> > >  include/linux/usb/uvc.h              |  3 ++
> > >  4 files changed, 84 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 56ea20eeb7b9d5d92f3d837c15bdf11d536e9f2d..9de5abb43e19d9e876cddc5d7124592953db89ac 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2315,7 +2315,12 @@ static int uvc_probe(struct usb_interface *intf,
> > >               goto error;
> > >       }
> > >
> > > -     uvc_meta_init(dev);
> > > +     ret = uvc_meta_init(dev);
> > > +     if (ret < 0) {
> > > +             dev_err(&dev->udev->dev,
> > > +                     "Error initializing the metadata formats (%d)\n", ret);
> > > +             goto error;
> > > +     }
> > >
> > >       if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
> > >               udev->quirks &= ~USB_QUIRK_RESET_RESUME;
> > > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > > index 77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7..59bb133baf9a73ef6a30fa8ead85aa90653d60f4 100644
> > > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/list.h>
> > >  #include <linux/module.h>
> > >  #include <linux/usb.h>
> > > +#include <linux/usb/uvc.h>
> > >  #include <linux/videodev2.h>
> > >
> > >  #include <media/v4l2-ioctl.h>
> > > @@ -166,6 +167,71 @@ static const struct v4l2_file_operations uvc_meta_fops = {
> > >       .mmap = vb2_fop_mmap,
> > >  };
> > >
> > > +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
> > > +{
> > > +     static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> > > +     struct uvc_entity *entity;
> > > +
> > > +     list_for_each_entry(entity, &dev->entities, list) {
> > > +             if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> > > +                     return entity;
> > > +     }
> > > +
> > > +     return NULL;
> > > +}
> > > +
> > > +#define MSXU_CONTROL_METADATA 0x9
> > > +static int uvc_meta_detect_msxu(struct uvc_device *dev)
> > > +{
> > > +     u32 *data __free(kfree) = NULL;
> > > +     struct uvc_entity *entity;
> > > +     int ret;
> > > +
> > > +     entity = uvc_meta_find_msxu(dev);
> > > +     if (!entity)
> > > +             return 0;
> > > +
> > > +     /*
> > > +      * USB requires buffers aligned in a special way, simplest way is to
> > > +      * make sure that query_ctrl will work is to kmalloc() them.
> > > +      */
> > > +     data = kmalloc(sizeof(*data), GFP_KERNEL);
> > > +     if (!data)
> > > +             return -ENOMEM;
> > > +
> > > +     /* Check if the metadata is already enabled. */
> > > +     ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> > > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > > +     if (ret)
> > > +             return 0;
> > > +
> > > +     if (*data) {
> > > +             dev->quirks |= UVC_QUIRK_MSXU_META;
> > > +             return 0;
> > > +     }
> > > +
> > > +     /*
> > > +      * We have seen devices that require 1 to enable the metadata, others
> > > +      * requiring a value != 1 and others requiring a value >1. Luckily for
> >
> > I'm confused here. If those are three different behaviours, then value
> > != 1 would be value == 0 (as the third behaviour is value > 1). You test
> > for !*data below, so 0 is not accepted as a valid value for this
> > purpose. What am I missing ?
> 
> There is a typo in the comment.
> 
> Some devices require 1, some devices any value !=0, and other value=MAX.
> I will fix it in a follow-up patch.

The documentation of the control states that MSXU_CONTROL_METADATA
reports the maximum size of the MS metadata generated by the device in
kB, and the control should be set to the value reported by GET_MAX to
enable metadata generation. That's what you're doing in this patch, so
you can update the comment to document there.

Some devices also don't support SET_CUR, in which case they should
report GET_MIN == GET_DEF == GET_MAX. I assume GET_CUR should then also
report the same value. Please also update the previous comment to
explain this, the GET_CUR value check above is more about handling
devices that always produce metadata than devices for which a driver has
enabled metadata production.

This leads to another question: should we enable metadata generation
only when the metadata capture device is streaming ?

> > > +      * us, the value from GET_MAX seems to work all the time.
> > > +      */
> > > +     ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> > > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > > +     if (ret || !*data)
> > > +             return 0;
> > > +
> > > +     /*
> > > +      * If we can set MSXU_CONTROL_METADATA, the device will report
> > > +      * metadata.
> > > +      */
> > > +     ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> > > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > > +     if (!ret)
> > > +             dev->quirks |= UVC_QUIRK_MSXU_META;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  int uvc_meta_register(struct uvc_streaming *stream)
> > >  {
> > >       struct uvc_device *dev = stream->dev;
> > > @@ -185,9 +251,14 @@ int uvc_meta_register(struct uvc_streaming *stream)
> > >                                        &uvc_meta_fops, &uvc_meta_ioctl_ops);
> > >  }
> > >
> > > -void uvc_meta_init(struct uvc_device *dev)
> > > +int uvc_meta_init(struct uvc_device *dev)
> > >  {
> > >       unsigned int i = 0;
> > > +     int ret;
> > > +
> > > +     ret = uvc_meta_detect_msxu(dev);
> > > +     if (ret)
> > > +             return ret;
> > >
> > >       dev->meta_formats[i++] = V4L2_META_FMT_UVC;
> > >
> > > @@ -201,4 +272,6 @@ void uvc_meta_init(struct uvc_device *dev)
> > >
> > >        /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> > >       dev->meta_formats[i++] = 0;
> > > +
> > > +     return 0;
> > >  }
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 616adc417c62a58686beccbc440a5dfac0a2d588..a4c064c5e046f2a4adba742c8777a10619569606 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -757,7 +757,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > >  void uvc_video_clock_update(struct uvc_streaming *stream,
> > >                           struct vb2_v4l2_buffer *vbuf,
> > >                           struct uvc_buffer *buf);
> > > -void uvc_meta_init(struct uvc_device *dev);
> > > +int uvc_meta_init(struct uvc_device *dev);
> > >  int uvc_meta_register(struct uvc_streaming *stream);
> > >
> > >  int uvc_register_video_device(struct uvc_device *dev,
> > > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > > index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
> > > --- a/include/linux/usb/uvc.h
> > > +++ b/include/linux/usb/uvc.h
> > > @@ -29,6 +29,9 @@
> > >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> > >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > > +#define UVC_GUID_MSXU_1_5 \
> > > +     {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> > > +      0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> > >
> > >  #define UVC_GUID_FORMAT_MJPEG \
> > >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> > >

-- 
Regards,

Laurent Pinchart

