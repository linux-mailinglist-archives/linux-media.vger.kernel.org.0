Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1AD2A63E9
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 13:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbgKDMJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 07:09:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57226 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbgKDMJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 07:09:20 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB7CD563;
        Wed,  4 Nov 2020 13:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604491758;
        bh=l+MSBTjndby1RX7HJX7yl70OnVOk8NJVoXyjYM5aO68=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z7VkQK9ljdACMRljZHRx4yEmvWZs45/f6Tis74JAtGsseRY2kPlR/9KlRnoRHjvWo
         Ynvhqg4eOGN4nelP4Qi6ZsUOsRFJo10HK6kcLI8nHJClo8ivaxg5aNhDNj94ylVVe1
         /iL+firLTLrH4V1UUjQ+MTNkMYnko31RC48GtW1Y=
Date:   Wed, 4 Nov 2020 14:08:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tfiga@chromium.org
Subject: Re: [PATCH 1/6] media: uvcvideo: Add UVC_CTRL_FLAG_ENTITY_GET_INFO
Message-ID: <20201104120830.GB6196@pendragon.ideasonboard.com>
References: <20201022133753.310506-1-ribalda@chromium.org>
 <20201022133753.310506-2-ribalda@chromium.org>
 <20201104110937.GH26171@pendragon.ideasonboard.com>
 <CANiDSCuCJigJ293pMnXT9wALUn3D2=RTKtzVcrD+Hr+u2uCWPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuCJigJ293pMnXT9wALUn3D2=RTKtzVcrD+Hr+u2uCWPA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Wed, Nov 04, 2020 at 12:48:25PM +0100, Ricardo Ribalda wrote:
> On Wed, Nov 4, 2020 at 12:10 PM Laurent Pinchart wrote:
> > On Thu, Oct 22, 2020 at 03:37:48PM +0200, Ricardo Ribalda wrote:
> > > This flag allows controls to get their properties from an entity defined
> >
> > s/entity defined/entity-defined/
> >
> > > function instead of via a query to the USB device.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 9 +++++++--
> > >  drivers/media/usb/uvc/uvcvideo.h | 3 +++
> > >  include/uapi/linux/uvcvideo.h    | 2 ++
> > >  3 files changed, 12 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index f479d8971dfb..7acdc055613b 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1708,8 +1708,13 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
> > >       if (data == NULL)
> > >               return -ENOMEM;
> > >
> > > -     ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id, dev->intfnum,
> > > -                          info->selector, data, 1);
> > > +     if (ctrl->info.flags & UVC_CTRL_FLAG_ENTITY_GET_INFO)
> >
> > Do we need the flag, couldn't we use entity->get_info if it is non-null,
> > and call uvc_query_ctrl() otherwise ?
> 
> The idea behind the flag is to support in the same entity controls
> that are uvc_query_ctrl() based
> and "entity private functions".
> 
> As this moment, there is only the " GPIO entity"  that has has private
> functions, and does not require it.
> 
> So I can simply remove the flag and add it later (if needed).

I hope we won't need more hacks of this kind ;-)

(It's a pretty clever hack I have to say)

> > > +             ret = ctrl->entity->get_info ?
> > > +                     ctrl->entity->get_info(ctrl->entity, ctrl->info.selector, data) :
> > > +                     -EINVAL;
> > > +     else
> > > +             ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id, dev->intfnum,
> > > +                                  info->selector, data, 1);
> > >       if (!ret)
> > >               info->flags |= (data[0] & UVC_CONTROL_CAP_GET ?
> > >                               UVC_CTRL_FLAG_GET_CUR : 0)
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index a3dfacf069c4..08922d889bb6 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -353,6 +353,9 @@ struct uvc_entity {
> > >       u8 bNrInPins;
> > >       u8 *baSourceID;
> > >
> > > +     int (*get_info)(struct uvc_entity *entity, u8 cs, u8 *caps);
> > > +     int (*get_cur)(struct uvc_entity *entity, u8 cs, void *data, u16 size);
> >
> > Looks like the second function should be part of patch 2/6 instead. I
> > would however squash 1/6 and 2/6.
> >
> > > +
> > >       unsigned int ncontrols;
> > >       struct uvc_control *controls;
> > >  };
> > > diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
> > > index f80f05b3c423..69b636290c31 100644
> > > --- a/include/uapi/linux/uvcvideo.h
> > > +++ b/include/uapi/linux/uvcvideo.h
> > > @@ -30,6 +30,8 @@
> > >  #define UVC_CTRL_FLAG_AUTO_UPDATE    (1 << 7)
> > >  /* Control supports asynchronous reporting */
> > >  #define UVC_CTRL_FLAG_ASYNCHRONOUS   (1 << 8)
> > > +/* Entity queries */
> > > +#define UVC_CTRL_FLAG_ENTITY_GET_INFO        (1 << 9)
> > >
> > >  #define UVC_CTRL_FLAG_GET_RANGE \
> > >       (UVC_CTRL_FLAG_GET_CUR | UVC_CTRL_FLAG_GET_MIN | \

-- 
Regards,

Laurent Pinchart
