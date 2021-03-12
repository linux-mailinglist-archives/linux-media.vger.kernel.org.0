Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9765A339A01
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 00:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235831AbhCLX3m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 18:29:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49032 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235826AbhCLX3c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 18:29:32 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80732527;
        Sat, 13 Mar 2021 00:29:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615591770;
        bh=Hxs/Z30Yl+dz+MWqLz7+py02iWhLUYvYkDfwAwBaKkI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H+vqDRMTgJ4pCCKPWPIDunRTza4ViT4oTjsowbriLgM9HU4xV/wTDhwTAlYmil/TI
         S3BkOd5kMNT2QRAw9dCIrsMN6Ei3soy3Ga6TACSeQ8fmiesIA64vps9QUHCejnOtdv
         h4hY5e4qEHnpFGRd649ITEfBeFPzYNc97nQDwsTI=
Date:   Sat, 13 Mar 2021 01:28:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 7/8] media: uvcvideo: Set a different name for the
 metadata entity
Message-ID: <YEv5N1k6CAFX9/L8@pendragon.ideasonboard.com>
References: <20210312124830.1344255-1-ribalda@chromium.org>
 <20210312124830.1344255-8-ribalda@chromium.org>
 <YEvq6TlGCL3NSqJ9@pendragon.ideasonboard.com>
 <CAPybu_16KTsEF+BGoG6ea6hf4d-J+uwimXbUT0Bv9HO8HLhJ-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPybu_16KTsEF+BGoG6ea6hf4d-J+uwimXbUT0Bv9HO8HLhJ-Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Sat, Mar 13, 2021 at 12:17:50AM +0100, Ricardo Ribalda Delgado wrote:
> On Fri, Mar 12, 2021 at 11:30 PM Laurent Pinchart wrote:
> > On Fri, Mar 12, 2021 at 01:48:29PM +0100, Ricardo Ribalda wrote:
> > > All the entities must have a unique name. And now that we are at it, we
> > > append the entity->id to the name to avoid collisions on multi-chain
> > > devices.
> > >
> > > Fixes v4l2-compliance:
> > > Media Controller ioctls:
> > >                 fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
> > >         test MEDIA_IOC_G_TOPOLOGY: FAIL
> > >                 fail: v4l2-test-media.cpp(394): num_data_links != num_links
> > >       test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 21 ++++++++++++++++++++-
> > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 35873cf2773d..6c928e708615 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2154,6 +2154,18 @@ static void uvc_unregister_video(struct uvc_device *dev)
> > >  #endif
> > >  }
> > >
> > > +static int uvc_oterm_id(struct uvc_video_chain *chain)
> > > +{
> > > +     struct uvc_entity *entity;
> > > +
> > > +     list_for_each_entry(entity, &chain->entities, chain) {
> > > +             if (UVC_ENTITY_IS_OTERM(entity))
> > > +                     return entity->id;
> >
> > It can also be an ITERM for output devices. You can drop this function
> > and use stream>header.bTerminalLink below (see uvc_stream_by_id() and
> > its usage in uvc_register_terms()).
> >
> > > +     }
> > > +
> > > +     return -1;
> > > +}
> > > +
> > >  int uvc_register_video_device(struct uvc_device *dev,
> > >                             struct uvc_streaming *stream,
> > >                             struct video_device *vdev,
> > > @@ -2162,6 +2174,8 @@ int uvc_register_video_device(struct uvc_device *dev,
> > >                             const struct v4l2_file_operations *fops,
> > >                             const struct v4l2_ioctl_ops *ioctl_ops)
> > >  {
> > > +     char prefix[sizeof(vdev->name) - 9];
> > > +     const char *suffix;
> > >       int ret;
> > >
> > >       /* Initialize the video buffers queue. */
> > > @@ -2190,16 +2204,21 @@ int uvc_register_video_device(struct uvc_device *dev,
> > >       case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > >       default:
> > >               vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> > > +             suffix = "video";
> > >               break;
> > >       case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> > >               vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> > > +             suffix = "out";
> >
> > I wonder if these two should be video-cap and video-out (or vid-cap and
> > vid-out if you want to shorten them) ?
> >
> > >               break;
> > >       case V4L2_BUF_TYPE_META_CAPTURE:
> > >               vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> > > +             suffix = "meta";
> > >               break;
> > >       }
> > >
> > > -     strscpy(vdev->name, dev->name, sizeof(vdev->name));
> > > +     strscpy(prefix, dev->name, sizeof(prefix));
> > > +     snprintf(vdev->name, sizeof(vdev->name), "%s-%d %s", prefix,
> >
> > The unit ID is never negative, so %u ?
> >
> > > +              uvc_oterm_id(stream->chain), suffix);
> >
> > Truncating the device name at the beginning of the video node name isn't
> > very nice :-S How about the following ?
> >
> >         snprintf(vdev->name, sizeof(vdev->name), "%s-%u (%s)", type_name,
> >                  uvc_oterm_id(stream->chain), dev->name);
> >
> > with the suffix variable renamed to type_name ?
> >
> > Thinking some more about it, vdev->name serves two purposes in the
> > driver: creating the entity name, and reporting the card name in
> > querycap. The former is done in the V4L2 core, which uses vdev->name
> > as-is. In this context, we con't need to add dev->name, it would be
> > redundant as the media controller device already reports it. The latter
> > is done in uvc_ioctl_querycap(). How about dropping dev->name from
> > vdev->name, and modifying uvc_ioctl_querycap() to use dev->name instead
> > of cap->card ?
> >
> 
> Something like ?
> https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v4&id=d4f7363455837116268152c96bf4b78d9761ad1e

I would have moved the sprintf() after the switch/case, but otherwise
it's the idea.

> https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v4&id=ee3916f12b30f56c03d5622ba8a599b9c610a055

Looks good.

> I need to work on the V4L2_CTRL_FLAG_GRABBED issue and then I will
> send the whole v4 series that can pass all the v4l2-compliance test :)
> 
> > >
> > >       /*
> > >        * Set the driver data before calling video_register_device, otherwise

-- 
Regards,

Laurent Pinchart
