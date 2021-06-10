Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B333A3448
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 21:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhFJTub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 15:50:31 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:37505 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbhFJTub (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 15:50:31 -0400
Received: by mail-lj1-f171.google.com with SMTP id e2so6525186ljk.4;
        Thu, 10 Jun 2021 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lVNOHbewvyZiY9or1YDsBIqJe/SN/ynZE37of4+70bQ=;
        b=dIrFdA9ODfODQgWzBnVaGrU2XhL/9Kvhk1FykWCH03CCnCi2XRWqthxxgRBPdOzTwf
         G0qAi5FhE4NxyGWKqFgfj3JykZ/SDmOEO7JdanF1ZVl+4FsgpqRmS1dh3LgT6lpWj/a6
         n/ZVGyDCxH0X9URqeHn+pwYqUEe5qOksZJMi9TrrYAeQQp6JgK+IkMGX083XJjbQRtF9
         PI8mRUVUxUQNfBj8/GlNrVSNjnqv8Vm7SNrRrhUE9GFP3orGFxDaGughd7+vbiTNwaMM
         nqxGODz1vi01ZXhgA9zqEdYXncMFlv/HUaY2IZHmUnQbld5I+ia/LOJbvU/anfyFiYJH
         Lzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lVNOHbewvyZiY9or1YDsBIqJe/SN/ynZE37of4+70bQ=;
        b=IbHhFjbr/9iyusUHXP4TYJg9Tivs14umQuZzjFQrLnJbeK7mi99mQPU9H9rPo3IFKQ
         R+aiygcLyo7iXsGPPG/yVe6Svottey17sRECSpGlhhNmgc7FeHHZ4BEZ+/QlkRYv9qL3
         EFuYLkoPekcyVsanhWIiRIVN16Kz341PjyOqO/O961lhfM5pS5BBtOZmdsWJAln9sTjK
         amSma/J/aO0eoseCwj9TEnagQ5+M3XX/gtR9yPXsqQl9sQCrn0virE+HRIKhCN4KbffF
         5fH7d1I+DXBOwBo2KnUqc+5NltnoK4oTR8kV06rQbbk4ZUeQ6NCvvNF3be5fMKkgMNrh
         Q4hg==
X-Gm-Message-State: AOAM532cgOuNnL/99EdcbWeEHeHm4++JNhGh7Cd9tUw5XW3AmPeivSYd
        UDF/lmHwar4uNzDozCZoSJ7LLuXPT8m/4uhRs0o=
X-Google-Smtp-Source: ABdhPJx5pqejf+dv0EE1Ax+DG/kwIlFtY7hB/2OMR926bY1xj8Z2fyeDs08s8b56V+iR/QSL4TBBuqoNS7CxytqMsI8=
X-Received: by 2002:a2e:88cf:: with SMTP id a15mr170511ljk.187.1623354437206;
 Thu, 10 Jun 2021 12:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210326095840.364424-1-ribalda@chromium.org> <20210326095840.364424-17-ribalda@chromium.org>
 <YMJLxPgH756t+4qY@pendragon.ideasonboard.com> <CANiDSCu5jtm1gvS0j1QjPny5bfXa8DRKy9EdZ=xbo0i--8sMJQ@mail.gmail.com>
In-Reply-To: <CANiDSCu5jtm1gvS0j1QjPny5bfXa8DRKy9EdZ=xbo0i--8sMJQ@mail.gmail.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Thu, 10 Jun 2021 21:47:01 +0200
Message-ID: <CAPybu_29QDtrGMme+aS8e=CjfcAu1TPJp4Gk3iQe1bZ9NAUYTw@mail.gmail.com>
Subject: Re: [PATCH v9 16/22] media: uvcvideo: Return -EACCES to inactive controls
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Jun 10, 2021 at 8:43 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent
>
> Thanks for your review!
>
> On Thu, 10 Jun 2021 at 19:28, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > On Fri, Mar 26, 2021 at 10:58:34AM +0100, Ricardo Ribalda wrote:
> > > If a control is inactive return -EACCES to let the userspace know that
> > > the value will not be applied automatically when the control is active
> > > again.
> >
> > Isn't the device supposed to stall the control set in that case, with
> > the bRequestErrorCode set to "Wrong state", which uvc_query_ctrl()
> > translates to -EACCES already ? Could you elaborate on why this patch is
> > needed ?
>
> The problem is that the hardware was not returning the equivalent of
> EACCES, so we had to capture it manually.
> I will try to revert the patch and capture an error.

In my hardware after reverting the patch I am still passing v4l2-compliance.

The benefits of this patch are:

1) We return -EACCESS even if the hardware mistakenly returns a different error
2) query_ctrl returns a value for hardware errors.

Hans can you comment on this? Shall we remove the patch ?

Thanks!

>
> >
> > > Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 71 +++++++++++++++++++++-----------
> > >  1 file changed, 48 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index bcebf9d1a46f..d9d4add1e813 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1082,13 +1082,36 @@ static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
> > >       return "Unknown Control";
> > >  }
> > >
> > > +static bool uvc_ctrl_is_inactive(struct uvc_video_chain *chain,
> > > +                              struct uvc_control *ctrl,
> > > +                              struct uvc_control_mapping *mapping)
> > > +{
> > > +     struct uvc_control_mapping *master_map = NULL;
> > > +     struct uvc_control *master_ctrl = NULL;
> > > +     s32 val;
> > > +     int ret;
> > > +
> > > +     if (!mapping->master_id)
> > > +             return false;
> > > +
> > > +     __uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> > > +                        &master_ctrl, 0);
> > > +
> > > +     if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> > > +             return false;
> > > +
> > > +     ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > > +     if (ret < 0 || val == mapping->master_manual)
> > > +             return false;
> > > +
> > > +     return true;
> > > +}
> > > +
> > >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > >       struct uvc_control *ctrl,
> > >       struct uvc_control_mapping *mapping,
> > >       struct v4l2_queryctrl *v4l2_ctrl)
> > >  {
> > > -     struct uvc_control_mapping *master_map = NULL;
> > > -     struct uvc_control *master_ctrl = NULL;
> > >       const struct uvc_menu_info *menu;
> > >       unsigned int i;
> > >
> > > @@ -1104,18 +1127,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > >       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> > >               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > >
> > > -     if (mapping->master_id)
> > > -             __uvc_find_control(ctrl->entity, mapping->master_id,
> > > -                                &master_map, &master_ctrl, 0);
> > > -     if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > > -             s32 val;
> > > -             int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > > -             if (ret < 0)
> > > -                     return ret;
> >
> > There's a small change in behaviour here, the driver used to return an
> > error, now it will ignore it. Is it intentional ?
>
> AFAIK The error did not follow the v4l2 spec. You shall always be able
> to query a ctrl.
>
> I will add it to the commit message to make it clear.
>
> >
> > > -
> > > -             if (val != mapping->master_manual)
> > > -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > > -     }
> > > +     if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
> > > +             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > >
> > >       if (!ctrl->cached) {
> > >               int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > > @@ -1638,25 +1651,37 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> > >       return 0;
> > >  }
> > >
> > > -static int uvc_ctrl_find_ctrlidx(struct uvc_entity *entity,
> > > +static int uvc_ctrl_commit_error(struct uvc_video_chain *chain,
> > > +                              struct uvc_entity *entity,
> > >                                struct v4l2_ext_controls *ctrls,
> > > -                              struct uvc_control *uvc_control)
> > > +                              struct uvc_control *err_control,
> > > +                              int ret)
> > >  {
> > >       struct uvc_control_mapping *mapping;
> > >       struct uvc_control *ctrl_found;
> > >       unsigned int i;
> > >
> > > -     if (!entity)
> > > -             return ctrls->count;
> > > +     if (!entity) {
> > > +             ctrls->error_idx = ctrls->count;
> > > +             return ret;
> > > +     }
> > >
> > >       for (i = 0; i < ctrls->count; i++) {
> > >               __uvc_find_control(entity, ctrls->controls[i].id, &mapping,
> > >                                  &ctrl_found, 0);
> > > -             if (uvc_control == ctrl_found)
> > > -                     return i;
> > > +             if (err_control == ctrl_found)
> > > +                     break;
> > >       }
> > > +     ctrls->error_idx = i;
> >
> > I think this line should be moved after the next check.
>
> Not really, if we cannot find a control, we cannot blame it on control 0 ;)
>
> >
> > > +
> > > +     /* We could not find the control that failed. */
> > > +     if (i == ctrls->count)
> > > +             return ret;
> > >
> > > -     return ctrls->count;
> > > +     if (uvc_ctrl_is_inactive(chain, err_control, mapping))
> > > +             return -EACCES;
> > > +
> > > +     return ret;
> > >  }
> > >
> > >  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> > > @@ -1679,8 +1704,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> > >               uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
> > >  done:
> > >       if (ret < 0 && ctrls)
> > > -             ctrls->error_idx = uvc_ctrl_find_ctrlidx(entity, ctrls,
> > > -                                                      err_ctrl);
> > > +             ret = uvc_ctrl_commit_error(chain, entity, ctrls, err_ctrl,
> > > +                                         ret);
> > >       mutex_unlock(&chain->ctrl_mutex);
> > >       return ret;
> > >  }
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
