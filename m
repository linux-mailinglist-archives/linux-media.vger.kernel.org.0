Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E307A3378A1
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 17:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbhCKQA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 11:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbhCKQAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 11:00:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9527DC061574;
        Thu, 11 Mar 2021 08:00:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99D82879;
        Thu, 11 Mar 2021 17:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615478410;
        bh=88gQ2lkGXDtbfbgviEA36zdOmTrkESs9PAAixpS5TD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qWdNtBO2ruDPFJ6QiU7Z/xh0SO2LD+0UhqpgTGOijIdQ94pUYu83dVca4Q3EkN67+
         suiicXtnUL0mLGEiafcGnTe6M6Li5Q9sSi9Pa3/L05aoiOv07q7shhmgbYOXBqzdXb
         vF1NCptPH86L4/oNHMGaflOts5rIxVyrgeHxrkiQ=
Date:   Thu, 11 Mar 2021 17:59:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, senozhatsky@chromium.org
Subject: Re: [PATCH 10/10] media: uvcvideo: Populate only active control
 classes
Message-ID: <YEo+aLunKHemzWhA@pendragon.ideasonboard.com>
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-12-ribalda@chromium.org>
 <f2341e0e-e9c9-a1f6-2d9f-4355e232cf4a@xs4all.nl>
 <CAPybu_08hhaAh4tPyohrEwhfowE5TC1NDfg9tUEo0tHQjcFJug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPybu_08hhaAh4tPyohrEwhfowE5TC1NDfg9tUEo0tHQjcFJug@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Thu, Mar 11, 2021 at 04:21:38PM +0100, Ricardo Ribalda Delgado wrote:
> On Thu, Mar 11, 2021 at 3:32 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 11/03/2021 13:20, Ricardo Ribalda wrote:
> > > Do not create Control Classes for empty classes.
> >
> > Shouldn't this be squashed with patch 06/10?
> 
> Most of the cameras I have used have the two classes, So  I am not
> sure if squash with 6/10, or remove it. I separated it to feel what
> Laurent has to say :)

I think it makes sense to only expose the classes that are being used,
so the change is good. As it fixes a bug introduced in 06/10, I'd squash
it.

> > > Fixes v4l2-compliance:
> > >
> > > Control ioctls (Input 0):
> > >                       fail: v4l2-test-controls.cpp(255): no controls in class 009d0000
> > >       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c   | 11 +++++++++++
> > >  drivers/media/usb/uvc/uvc_driver.c |  1 -
> > >  drivers/media/usb/uvc/uvcvideo.h   |  1 -
> > >  3 files changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 433342efc63f..5efbb3b5aa5b 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -2128,6 +2128,17 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
> > >       if (map->set == NULL)
> > >               map->set = uvc_set_le_value;
> > >
> > > +     switch (V4L2_CTRL_ID2WHICH(map->id)) {
> > > +     case V4L2_CTRL_ID2WHICH(V4L2_CID_CAMERA_CLASS):
> > > +             dev->ctrl_class_unit->ctrl_class.bmControls[0] |=
> > > +                                             BIT(UVC_CC_CAMERA_CLASS);
> > > +             break;
> > > +     case V4L2_CTRL_ID2WHICH(V4L2_CID_USER_CLASS):
> > > +             dev->ctrl_class_unit->ctrl_class.bmControls[0] |=
> > > +                                             BIT(UVC_CC_USER_CLASS);
> > > +             break;
> > > +     }
> > > +
> > >       list_add_tail(&map->list, &ctrl->info.mappings);
> > >       uvc_dbg(dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
> > >               map->name, ctrl->info.entity, ctrl->info.selector);
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 996e8bd06ac5..4f368ab3a1f1 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -1501,7 +1501,6 @@ static int uvc_ctrl_class_parse(struct uvc_device *dev)
> > >
> > >       unit->ctrl_class.bControlSize = 1;
> > >       unit->ctrl_class.bmControls = (u8 *)unit + sizeof(*unit);
> > > -     unit->ctrl_class.bmControls[0] = (1 << (UVC_CC_LAST_CLASS + 1)) - 1;
> > >       unit->get_info = uvc_ctrl_class_get_info;
> > >       strncpy(unit->name, "Control Class", sizeof(unit->name) - 1);
> > >
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 1d59ac10c2eb..cc573d63e459 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -186,7 +186,6 @@
> > >   */
> > >  #define UVC_CC_CAMERA_CLASS  0
> > >  #define UVC_CC_USER_CLASS    1
> > > -#define UVC_CC_LAST_CLASS    UVC_CC_USER_CLASS
> > >
> > >  /* ------------------------------------------------------------------------
> > >   * Driver specific constants.

-- 
Regards,

Laurent Pinchart
