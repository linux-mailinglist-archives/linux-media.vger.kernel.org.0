Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC2E9339A26
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 00:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235894AbhCLXsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 18:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235615AbhCLXsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 18:48:03 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67F1C061574;
        Fri, 12 Mar 2021 15:48:02 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 18so47927757lff.6;
        Fri, 12 Mar 2021 15:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CxYlLIhvnZZV2Iu1AEjJAC1SlL/gqQ02y8v2I3Ugc4k=;
        b=TlVHi36K+JNFFiMTpvhpv8o8/mb7jwmmlCD5xEmCnMAzLTCnocw8lcgIE12cKusrA9
         HzDcKxdF+FNlEJlNUMz4daSE8GdAW/7DErOg09et9/Dq97hvmaJpcHGXtEqHjOlsI/Yh
         pPfhpex4ZpjoK5h4jn5oIrD5AkuvqNz7GXoyfqwDl79nAP72aBhlAeedP5FdgNEaYZeE
         G1aSCURMwAZIJyjEoPtR6UbEJnpeWaUs3voTHnN7TQqtNrjs+P9D6zPz53pz1p6x4rLI
         lnC57BlPodv6kWivzKt7663McEOOzKPtbacMY0qI8gzgzlw2AmAoueGZaumqZmxuwq/j
         C+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CxYlLIhvnZZV2Iu1AEjJAC1SlL/gqQ02y8v2I3Ugc4k=;
        b=XQ7PLPIDi/E7EmJqDLiIsca4nhYg8agGVOM3c6HNsztz8OsJSupLtgw2M3YW5TmEYJ
         aWg7XmARty+B8qP465f9RHhU0EOVLfHYjhk0lzxaM7zYNnrEkupYQ3pwnSnnInc8A65b
         gyWkAbpvjPGIfh1YMkVmvOqg9J2y/82VMnpB7jpIH4YuPXZSP1h6NJ9DkqJoCWRvZz4o
         DMuEPq5egS8Lxd4rHiIaLu5OuWs2AmP2J9Mm9Rwn+VDd2yHzPJXc009qPABkc3RSHqeX
         s2jefb4nEe9Q42K9sPJvtqfgoH9N0vwh7BYz8G9mwzhYAmTP/KCjoq8rYJ9xHc9S/R/L
         WeOQ==
X-Gm-Message-State: AOAM533+pgnkuLDRPQnJUSZyU02fwQUDZMF3nq944HFh3KGydWmshAXO
        3XnSY/uMuXETVVNYqXqtj9O1CLGXmB0/1EWG6do=
X-Google-Smtp-Source: ABdhPJzrRhK0PUulW1EhqzvR5UPEeSEhLfbLCmaGacDcWgYMHxCvdXyJu0IesPhg/nwKAWzRsiXZy4goPJDLnRiuZYk=
X-Received: by 2002:a05:6512:2212:: with SMTP id h18mr972854lfu.330.1615592881143;
 Fri, 12 Mar 2021 15:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20210312124830.1344255-1-ribalda@chromium.org>
 <20210312124830.1344255-8-ribalda@chromium.org> <YEvq6TlGCL3NSqJ9@pendragon.ideasonboard.com>
 <CAPybu_16KTsEF+BGoG6ea6hf4d-J+uwimXbUT0Bv9HO8HLhJ-Q@mail.gmail.com> <YEv5N1k6CAFX9/L8@pendragon.ideasonboard.com>
In-Reply-To: <YEv5N1k6CAFX9/L8@pendragon.ideasonboard.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Sat, 13 Mar 2021 00:47:45 +0100
Message-ID: <CAPybu_1kksxsnciSv38OBh_QR875X4gDSvV7Hj=dE+ocRrGQUA@mail.gmail.com>
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

Hi Laurent

Thanks!
On Sat, Mar 13, 2021 at 12:29 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Sat, Mar 13, 2021 at 12:17:50AM +0100, Ricardo Ribalda Delgado wrote:
> > On Fri, Mar 12, 2021 at 11:30 PM Laurent Pinchart wrote:
> > > On Fri, Mar 12, 2021 at 01:48:29PM +0100, Ricardo Ribalda wrote:
> > > > All the entities must have a unique name. And now that we are at it, we
> > > > append the entity->id to the name to avoid collisions on multi-chain
> > > > devices.
> > > >
> > > > Fixes v4l2-compliance:
> > > > Media Controller ioctls:
> > > >                 fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
> > > >         test MEDIA_IOC_G_TOPOLOGY: FAIL
> > > >                 fail: v4l2-test-media.cpp(394): num_data_links != num_links
> > > >       test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 21 ++++++++++++++++++++-
> > > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index 35873cf2773d..6c928e708615 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2154,6 +2154,18 @@ static void uvc_unregister_video(struct uvc_device *dev)
> > > >  #endif
> > > >  }
> > > >
> > > > +static int uvc_oterm_id(struct uvc_video_chain *chain)
> > > > +{
> > > > +     struct uvc_entity *entity;
> > > > +
> > > > +     list_for_each_entry(entity, &chain->entities, chain) {
> > > > +             if (UVC_ENTITY_IS_OTERM(entity))
> > > > +                     return entity->id;
> > >
> > > It can also be an ITERM for output devices. You can drop this function
> > > and use stream>header.bTerminalLink below (see uvc_stream_by_id() and
> > > its usage in uvc_register_terms()).
> > >
> > > > +     }
> > > > +
> > > > +     return -1;
> > > > +}
> > > > +
> > > >  int uvc_register_video_device(struct uvc_device *dev,
> > > >                             struct uvc_streaming *stream,
> > > >                             struct video_device *vdev,
> > > > @@ -2162,6 +2174,8 @@ int uvc_register_video_device(struct uvc_device *dev,
> > > >                             const struct v4l2_file_operations *fops,
> > > >                             const struct v4l2_ioctl_ops *ioctl_ops)
> > > >  {
> > > > +     char prefix[sizeof(vdev->name) - 9];
> > > > +     const char *suffix;
> > > >       int ret;
> > > >
> > > >       /* Initialize the video buffers queue. */
> > > > @@ -2190,16 +2204,21 @@ int uvc_register_video_device(struct uvc_device *dev,
> > > >       case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > > >       default:
> > > >               vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> > > > +             suffix = "video";
> > > >               break;
> > > >       case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> > > >               vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> > > > +             suffix = "out";
> > >
> > > I wonder if these two should be video-cap and video-out (or vid-cap and
> > > vid-out if you want to shorten them) ?
> > >
> > > >               break;
> > > >       case V4L2_BUF_TYPE_META_CAPTURE:
> > > >               vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> > > > +             suffix = "meta";
> > > >               break;
> > > >       }
> > > >
> > > > -     strscpy(vdev->name, dev->name, sizeof(vdev->name));
> > > > +     strscpy(prefix, dev->name, sizeof(prefix));
> > > > +     snprintf(vdev->name, sizeof(vdev->name), "%s-%d %s", prefix,
> > >
> > > The unit ID is never negative, so %u ?
> > >
> > > > +              uvc_oterm_id(stream->chain), suffix);
> > >
> > > Truncating the device name at the beginning of the video node name isn't
> > > very nice :-S How about the following ?
> > >
> > >         snprintf(vdev->name, sizeof(vdev->name), "%s-%u (%s)", type_name,
> > >                  uvc_oterm_id(stream->chain), dev->name);
> > >
> > > with the suffix variable renamed to type_name ?
> > >
> > > Thinking some more about it, vdev->name serves two purposes in the
> > > driver: creating the entity name, and reporting the card name in
> > > querycap. The former is done in the V4L2 core, which uses vdev->name
> > > as-is. In this context, we con't need to add dev->name, it would be
> > > redundant as the media controller device already reports it. The latter
> > > is done in uvc_ioctl_querycap(). How about dropping dev->name from
> > > vdev->name, and modifying uvc_ioctl_querycap() to use dev->name instead
> > > of cap->card ?
> > >
> >
> > Something like ?
> > https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v4&id=d4f7363455837116268152c96bf4b78d9761ad1e
>
> I would have moved the sprintf() after the switch/case, but otherwise
> it's the idea.

https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v4&id=fe287f9d764457f5bcd48780b99e54df161f33f6

Yep, it looks better

>
> > https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v4&id=ee3916f12b30f56c03d5622ba8a599b9c610a055
>
> Looks good.
>
> > I need to work on the V4L2_CTRL_FLAG_GRABBED issue and then I will
> > send the whole v4 series that can pass all the v4l2-compliance test :)
> >
> > > >
> > > >       /*
> > > >        * Set the driver data before calling video_register_device, otherwise
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
