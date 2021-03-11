Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E113376E8
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbhCKPWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233973AbhCKPV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:21:56 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA38C061574;
        Thu, 11 Mar 2021 07:21:56 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id n16so40419581lfb.4;
        Thu, 11 Mar 2021 07:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lC/ixFOWgR9g8vvJKl8EcknTrshTOhO8ERJGh1A079U=;
        b=dFBIItV/D7VRqy2t7tDK9+cXF21QD2Iw/43J7zfkQxmBkwrNMJWyC6jwkk04yLJC/h
         kCb0AkF02jIFdWVKA1+u5tdzIKCAuiXvta6xV3iGfxiLJAxMx/dllgv30TEGeR68jyZK
         6x0ExFnpQ4hoA2m+rbxO6nsxL7JxBLfYKBa9u8qjgRyOo2UAvA0arVGmUxfV+19b+sBS
         LObcbE9vAvVWCWBGk/NJf8kLMvuQ5aaWtAi/MzH3xuGi4A+6kNteWY1lkbG6TZXkKjAg
         xfmIKAH3W6qYj3j6Gdl18dDmVWmfpZKAufeykqBKan7+g8wfGDXgGTysppGEe3RzIKCS
         CqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lC/ixFOWgR9g8vvJKl8EcknTrshTOhO8ERJGh1A079U=;
        b=CHC1HSyAGES7zudyV9NLa23KhwtMxr3o9JGCAn2W9hbzC16OR/bizIx0ecK551lRIQ
         QUeqMrGrDjd18So8Wd54kD6qJy8Jzs+ay9eJ+zHGrDSFwvVk8o0M9Ejgm7CGhGiVmpHz
         IX1oR18TJPlRJFqYmQhfTueIoOwcm+4s3/wFZhehrCyUig/SSAvObl+wq6QTmUkKuHeF
         PDbvgnWADxpQdFSSPg7Z11lDV+p9xmju9/b6aOVi6+F+2THt3LMhH1KLkfhKoPmM6WLL
         mjh3IzdpLORkYKdmFNl5XZOjv4cKiGqbMjN+mD9/vL92KXeWWCWcC4/9jGAqJOT+0wc1
         YB0g==
X-Gm-Message-State: AOAM533X2HOcCuGw8rl1AkrS4Cu0OpAu51+fNexhPhxga1rwfEicK3oE
        M+wKZnDuLnh4N+k/3nY3g00X+gWA74z7Gke034R/0PnuPtg=
X-Google-Smtp-Source: ABdhPJzoE34fT/tK/pQPH8iLY7vZg6+C1GYqme0Su3O8avZiP7Qyc/ax/moxg667U0qIIya9slFjOBu8TmuGTACfR6E=
X-Received: by 2002:a19:74c:: with SMTP id 73mr2599275lfh.316.1615476115011;
 Thu, 11 Mar 2021 07:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-12-ribalda@chromium.org> <f2341e0e-e9c9-a1f6-2d9f-4355e232cf4a@xs4all.nl>
In-Reply-To: <f2341e0e-e9c9-a1f6-2d9f-4355e232cf4a@xs4all.nl>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Thu, 11 Mar 2021 16:21:38 +0100
Message-ID: <CAPybu_08hhaAh4tPyohrEwhfowE5TC1NDfg9tUEo0tHQjcFJug@mail.gmail.com>
Subject: Re: [PATCH 10/10] media: uvcvideo: Populate only active control classes
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for your review!

On Thu, Mar 11, 2021 at 3:32 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 11/03/2021 13:20, Ricardo Ribalda wrote:
> > Do not create Control Classes for empty classes.
>
> Shouldn't this be squashed with patch 06/10?

Most of the cameras I have used have the two classes, So  I am not
sure if squash with 6/10, or remove it. I separated it to feel what
Laurent has to say :)

>
> Regards,
>
>         Hans
>
> >
> > Fixes v4l2-compliance:
> >
> > Control ioctls (Input 0):
> >                       fail: v4l2-test-controls.cpp(255): no controls in class 009d0000
> >       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 11 +++++++++++
> >  drivers/media/usb/uvc/uvc_driver.c |  1 -
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 -
> >  3 files changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 433342efc63f..5efbb3b5aa5b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2128,6 +2128,17 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
> >       if (map->set == NULL)
> >               map->set = uvc_set_le_value;
> >
> > +     switch (V4L2_CTRL_ID2WHICH(map->id)) {
> > +     case V4L2_CTRL_ID2WHICH(V4L2_CID_CAMERA_CLASS):
> > +             dev->ctrl_class_unit->ctrl_class.bmControls[0] |=
> > +                                             BIT(UVC_CC_CAMERA_CLASS);
> > +             break;
> > +     case V4L2_CTRL_ID2WHICH(V4L2_CID_USER_CLASS):
> > +             dev->ctrl_class_unit->ctrl_class.bmControls[0] |=
> > +                                             BIT(UVC_CC_USER_CLASS);
> > +             break;
> > +     }
> > +
> >       list_add_tail(&map->list, &ctrl->info.mappings);
> >       uvc_dbg(dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
> >               map->name, ctrl->info.entity, ctrl->info.selector);
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 996e8bd06ac5..4f368ab3a1f1 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1501,7 +1501,6 @@ static int uvc_ctrl_class_parse(struct uvc_device *dev)
> >
> >       unit->ctrl_class.bControlSize = 1;
> >       unit->ctrl_class.bmControls = (u8 *)unit + sizeof(*unit);
> > -     unit->ctrl_class.bmControls[0] = (1 << (UVC_CC_LAST_CLASS + 1)) - 1;
> >       unit->get_info = uvc_ctrl_class_get_info;
> >       strncpy(unit->name, "Control Class", sizeof(unit->name) - 1);
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 1d59ac10c2eb..cc573d63e459 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -186,7 +186,6 @@
> >   */
> >  #define UVC_CC_CAMERA_CLASS  0
> >  #define UVC_CC_USER_CLASS    1
> > -#define UVC_CC_LAST_CLASS    UVC_CC_USER_CLASS
> >
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> >
>


-- 
Ricardo Ribalda
