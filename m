Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C525E3A336F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 20:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhFJSmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 14:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhFJSmk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 14:42:40 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE18FC061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 11:40:29 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id b9so2812855ilr.2
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 11:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nf6J5VPNhOdTIuNzS3DZB8U4CF2Pa9aEYKvb9flUDmE=;
        b=L9ROHi2BHpv08ujQ0qbHKjVArHSZnmhGjjBBzyRm68KOimSWOubX9EnG8CQ0OXAVev
         +CJgYDykJlToHLMoS/FMyD5TmcfVYoP2/XrCIqGk92OfAGYPgPU0piy1c776G5VCviVD
         uFvX2DGmcDFLBAYbS3HHS+ZqUy0mFxi3w67Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nf6J5VPNhOdTIuNzS3DZB8U4CF2Pa9aEYKvb9flUDmE=;
        b=Nq3OpuEqFVXZkhZKYAENCIpaNHO0J+8m2oZEPax+Qrdb18tM2XZ5suae5hxWb5SZO/
         OPeVJWUvU65xw4gs2x5eAEB81ARvN2rJl9WQKLYu8kd2EAn2i5+1DEquOqilbesYI6GE
         udlQskti6hf1Hb3gf0hZKVhcT19srg8jod6kneCq3IGWmdkEaqheetIs/SpjtDkKxG2u
         6Qzv+tDrEgfkalQolKPWiMrNcb6rLSnPdi3x28ISg2QDo7RyS0uwEhhfvfHp2hLG5Jht
         W+6NYqQj2g1a1VSb/tlBYC7MVUfrq8f4lE/7lGoGseM9z7q2rQ6EpJ/1qxG7ij1PucMC
         G4GQ==
X-Gm-Message-State: AOAM53038+451gsaNaaLWD+YkugxMXJippeXFX5iNUfHUv88hSvLeGjt
        2/h7WGgj9mSzRLjko+UomqCGeiPfRa7Peg==
X-Google-Smtp-Source: ABdhPJwNGTnj4JaITWy+iodJOpOiSwdgCF6XmQd5fQEhmABCkgM5VBs795zUtRJfwiFFnMERwTAaHw==
X-Received: by 2002:a05:6e02:1a4f:: with SMTP id u15mr153930ilv.147.1623350427567;
        Thu, 10 Jun 2021 11:40:27 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id a22sm2003417iot.37.2021.06.10.11.40.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 11:40:27 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id 5so28137130ioe.1
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 11:40:26 -0700 (PDT)
X-Received: by 2002:a5e:974d:: with SMTP id h13mr4904715ioq.150.1623350426300;
 Thu, 10 Jun 2021 11:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210326095840.364424-1-ribalda@chromium.org> <20210326095840.364424-17-ribalda@chromium.org>
 <YMJLxPgH756t+4qY@pendragon.ideasonboard.com>
In-Reply-To: <YMJLxPgH756t+4qY@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 10 Jun 2021 20:40:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCu5jtm1gvS0j1QjPny5bfXa8DRKy9EdZ=xbo0i--8sMJQ@mail.gmail.com>
Message-ID: <CANiDSCu5jtm1gvS0j1QjPny5bfXa8DRKy9EdZ=xbo0i--8sMJQ@mail.gmail.com>
Subject: Re: [PATCH v9 16/22] media: uvcvideo: Return -EACCES to inactive controls
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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

Thanks for your review!

On Thu, 10 Jun 2021 at 19:28, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Mar 26, 2021 at 10:58:34AM +0100, Ricardo Ribalda wrote:
> > If a control is inactive return -EACCES to let the userspace know that
> > the value will not be applied automatically when the control is active
> > again.
>
> Isn't the device supposed to stall the control set in that case, with
> the bRequestErrorCode set to "Wrong state", which uvc_query_ctrl()
> translates to -EACCES already ? Could you elaborate on why this patch is
> needed ?

The problem is that the hardware was not returning the equivalent of
EACCES, so we had to capture it manually.
I will try to revert the patch and capture an error.

>
> > Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 71 +++++++++++++++++++++-----------
> >  1 file changed, 48 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index bcebf9d1a46f..d9d4add1e813 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1082,13 +1082,36 @@ static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
> >       return "Unknown Control";
> >  }
> >
> > +static bool uvc_ctrl_is_inactive(struct uvc_video_chain *chain,
> > +                              struct uvc_control *ctrl,
> > +                              struct uvc_control_mapping *mapping)
> > +{
> > +     struct uvc_control_mapping *master_map = NULL;
> > +     struct uvc_control *master_ctrl = NULL;
> > +     s32 val;
> > +     int ret;
> > +
> > +     if (!mapping->master_id)
> > +             return false;
> > +
> > +     __uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> > +                        &master_ctrl, 0);
> > +
> > +     if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> > +             return false;
> > +
> > +     ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > +     if (ret < 0 || val == mapping->master_manual)
> > +             return false;
> > +
> > +     return true;
> > +}
> > +
> >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >       struct uvc_control *ctrl,
> >       struct uvc_control_mapping *mapping,
> >       struct v4l2_queryctrl *v4l2_ctrl)
> >  {
> > -     struct uvc_control_mapping *master_map = NULL;
> > -     struct uvc_control *master_ctrl = NULL;
> >       const struct uvc_menu_info *menu;
> >       unsigned int i;
> >
> > @@ -1104,18 +1127,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> >               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > -     if (mapping->master_id)
> > -             __uvc_find_control(ctrl->entity, mapping->master_id,
> > -                                &master_map, &master_ctrl, 0);
> > -     if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > -             s32 val;
> > -             int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > -             if (ret < 0)
> > -                     return ret;
>
> There's a small change in behaviour here, the driver used to return an
> error, now it will ignore it. Is it intentional ?

AFAIK The error did not follow the v4l2 spec. You shall always be able
to query a ctrl.

I will add it to the commit message to make it clear.

>
> > -
> > -             if (val != mapping->master_manual)
> > -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > -     }
> > +     if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
> > +             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> >
> >       if (!ctrl->cached) {
> >               int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > @@ -1638,25 +1651,37 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >       return 0;
> >  }
> >
> > -static int uvc_ctrl_find_ctrlidx(struct uvc_entity *entity,
> > +static int uvc_ctrl_commit_error(struct uvc_video_chain *chain,
> > +                              struct uvc_entity *entity,
> >                                struct v4l2_ext_controls *ctrls,
> > -                              struct uvc_control *uvc_control)
> > +                              struct uvc_control *err_control,
> > +                              int ret)
> >  {
> >       struct uvc_control_mapping *mapping;
> >       struct uvc_control *ctrl_found;
> >       unsigned int i;
> >
> > -     if (!entity)
> > -             return ctrls->count;
> > +     if (!entity) {
> > +             ctrls->error_idx = ctrls->count;
> > +             return ret;
> > +     }
> >
> >       for (i = 0; i < ctrls->count; i++) {
> >               __uvc_find_control(entity, ctrls->controls[i].id, &mapping,
> >                                  &ctrl_found, 0);
> > -             if (uvc_control == ctrl_found)
> > -                     return i;
> > +             if (err_control == ctrl_found)
> > +                     break;
> >       }
> > +     ctrls->error_idx = i;
>
> I think this line should be moved after the next check.

Not really, if we cannot find a control, we cannot blame it on control 0 ;)

>
> > +
> > +     /* We could not find the control that failed. */
> > +     if (i == ctrls->count)
> > +             return ret;
> >
> > -     return ctrls->count;
> > +     if (uvc_ctrl_is_inactive(chain, err_control, mapping))
> > +             return -EACCES;
> > +
> > +     return ret;
> >  }
> >
> >  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> > @@ -1679,8 +1704,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> >               uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
> >  done:
> >       if (ret < 0 && ctrls)
> > -             ctrls->error_idx = uvc_ctrl_find_ctrlidx(entity, ctrls,
> > -                                                      err_ctrl);
> > +             ret = uvc_ctrl_commit_error(chain, entity, ctrls, err_ctrl,
> > +                                         ret);
> >       mutex_unlock(&chain->ctrl_mutex);
> >       return ret;
> >  }
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
