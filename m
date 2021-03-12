Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27EFF3399F2
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 00:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235773AbhCLXSb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 18:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235757AbhCLXSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 18:18:08 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3F7C061574;
        Fri, 12 Mar 2021 15:18:08 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id f26so9335293ljp.8;
        Fri, 12 Mar 2021 15:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uKgDYVcrdDhaZCb9x72sec4DqEQqkC9UbaLz0E8J488=;
        b=oZq81cjsTN0NO3awH5ACedaxJ0O+pnlzRnw5GoDjwpkMNzoKjqxgT1K9rvvp7Xz/kW
         WRV/ZFYVnaX/Bb2IVFGu8vTdHD61fjeyeLjf4zwi2voEJmudZcsA+pBeoaGjBkCdB+BB
         rp3Hdtt/rAoKa2KbKVVNsMWgyPvitmyg7k6v6wFpR3uSki6HnAEfzzqw1ExyCxAXDm5a
         ionriQaFDNDiRFlahZh9eDa3nEkLN0xwY5I2cjARrRznvd4jQbMGYTAWAwzh1UBvpEHA
         EfA7O7nWrmL9+jxjiW+bPynU+/BfYHNHKjo7FeQ+xH7vEss0Br0JTVajy/vRbc8nfhUo
         Ts6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKgDYVcrdDhaZCb9x72sec4DqEQqkC9UbaLz0E8J488=;
        b=cZf0WxE64G0bkiDpHMPBz4RvfXCF4gsJb2mu6tReUAnfwNbM/EoHLQRb9nxaQz90HF
         Iw8Yyn0mMgLS/lNqjXuvLwzuNkvC5Wigz7H45wPIngteR7EoB9O1GrmqudO6VF55lfhV
         PumT0gmoX/U/7NB4gscbiOJhAzkDIyswUxVUV5TB0i0WiPvXbBvWKak1A+DvQW4CWuca
         jdmvNXxSp8ed8wzd1uV8UErl1O6kJMTEHrAn8Hzlpje4j/I+DJetJNK0Ui3wbd+F+acd
         diq8c2a4NBBEKX/AVkAWxS06+D5DXGxDvpp531SP56ziYn7BVgRux8MSo2vLHfI8ab8p
         bcJA==
X-Gm-Message-State: AOAM5320a3rztUN3df518Tzjc8s9M/FAAZFdGasPKVaNlfHbg2PBAqf7
        Wnv8wr+eUNsBFnf0eOwB9brOrHEbpgIS2GbjaWMVPQS+bR87XQ==
X-Google-Smtp-Source: ABdhPJw5sxlQhwPiAtwJLwaY5JliPOtlLq0KSzG4iw67le7fQ/j7tmROB9zkbyBeQHhxgVoOrIu0nbacgYV9Eu/+KTc=
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr3665599ljp.495.1615591086492;
 Fri, 12 Mar 2021 15:18:06 -0800 (PST)
MIME-Version: 1.0
References: <20210312124830.1344255-1-ribalda@chromium.org>
 <20210312124830.1344255-8-ribalda@chromium.org> <YEvq6TlGCL3NSqJ9@pendragon.ideasonboard.com>
In-Reply-To: <YEvq6TlGCL3NSqJ9@pendragon.ideasonboard.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Sat, 13 Mar 2021 00:17:50 +0100
Message-ID: <CAPybu_16KTsEF+BGoG6ea6hf4d-J+uwimXbUT0Bv9HO8HLhJ-Q@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] media: uvcvideo: Set a different name for the
 metadata entity
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Laurent

Thanks for the review

On Fri, Mar 12, 2021 at 11:30 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Mar 12, 2021 at 01:48:29PM +0100, Ricardo Ribalda wrote:
> > All the entities must have a unique name. And now that we are at it, we
> > append the entity->id to the name to avoid collisions on multi-chain
> > devices.
> >
> > Fixes v4l2-compliance:
> > Media Controller ioctls:
> >                 fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
> >         test MEDIA_IOC_G_TOPOLOGY: FAIL
> >                 fail: v4l2-test-media.cpp(394): num_data_links != num_links
> >       test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 35873cf2773d..6c928e708615 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2154,6 +2154,18 @@ static void uvc_unregister_video(struct uvc_device *dev)
> >  #endif
> >  }
> >
> > +static int uvc_oterm_id(struct uvc_video_chain *chain)
> > +{
> > +     struct uvc_entity *entity;
> > +
> > +     list_for_each_entry(entity, &chain->entities, chain) {
> > +             if (UVC_ENTITY_IS_OTERM(entity))
> > +                     return entity->id;
>
> It can also be an ITERM for output devices. You can drop this function
> and use stream>header.bTerminalLink below (see uvc_stream_by_id() and
> its usage in uvc_register_terms()).
>
> > +     }
> > +
> > +     return -1;
> > +}
> > +
> >  int uvc_register_video_device(struct uvc_device *dev,
> >                             struct uvc_streaming *stream,
> >                             struct video_device *vdev,
> > @@ -2162,6 +2174,8 @@ int uvc_register_video_device(struct uvc_device *dev,
> >                             const struct v4l2_file_operations *fops,
> >                             const struct v4l2_ioctl_ops *ioctl_ops)
> >  {
> > +     char prefix[sizeof(vdev->name) - 9];
> > +     const char *suffix;
> >       int ret;
> >
> >       /* Initialize the video buffers queue. */
> > @@ -2190,16 +2204,21 @@ int uvc_register_video_device(struct uvc_device *dev,
> >       case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> >       default:
> >               vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> > +             suffix = "video";
> >               break;
> >       case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> >               vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> > +             suffix = "out";
>
> I wonder if these two should be video-cap and video-out (or vid-cap and
> vid-out if you want to shorten them) ?
>
> >               break;
> >       case V4L2_BUF_TYPE_META_CAPTURE:
> >               vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> > +             suffix = "meta";
> >               break;
> >       }
> >
> > -     strscpy(vdev->name, dev->name, sizeof(vdev->name));
> > +     strscpy(prefix, dev->name, sizeof(prefix));
> > +     snprintf(vdev->name, sizeof(vdev->name), "%s-%d %s", prefix,
>
> The unit ID is never negative, so %u ?
>
> > +              uvc_oterm_id(stream->chain), suffix);
>
> Truncating the device name at the beginning of the video node name isn't
> very nice :-S How about the following ?
>
>         snprintf(vdev->name, sizeof(vdev->name), "%s-%u (%s)", type_name,
>                  uvc_oterm_id(stream->chain), dev->name);
>
> with the suffix variable renamed to type_name ?
>
> Thinking some more about it, vdev->name serves two purposes in the
> driver: creating the entity name, and reporting the card name in
> querycap. The former is done in the V4L2 core, which uses vdev->name
> as-is. In this context, we con't need to add dev->name, it would be
> redundant as the media controller device already reports it. The latter
> is done in uvc_ioctl_querycap(). How about dropping dev->name from
> vdev->name, and modifying uvc_ioctl_querycap() to use dev->name instead
> of cap->card ?
>

Something like ?
https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v4&id=d4f7363455837116268152c96bf4b78d9761ad1e
https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v4&id=ee3916f12b30f56c03d5622ba8a599b9c610a055

I need to work on the V4L2_CTRL_FLAG_GRABBED issue and then I will
send the whole v4 series that can pass all the v4l2-compliance test :)

Thanks!

> >
> >       /*
> >        * Set the driver data before calling video_register_device, otherwise
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
