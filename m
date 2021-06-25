Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C10D3B44E3
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 15:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhFYN6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 09:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhFYN62 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 09:58:28 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B733C061766
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 06:56:08 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id g3so876852ilj.7
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 06:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=81n+GTbzc4AbJWlslSC8YP9E9oQstMauU2nWKw3pJ48=;
        b=C07lXPGcgLjNS5ptvUVl4aP6RXrfXrW/QrTdytAQHQ8nV0L6nBltmmnYnVpROwsfFc
         tinKHD2qufaHNTg7fiRQFhNPl8NTFhdxWSAcjllSlxyLhvaFxueRyP+Ow34iRQug1Ymx
         mrRPq11+rdnuXs0/y4mVuz9p7TMp8UiI4Ij6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=81n+GTbzc4AbJWlslSC8YP9E9oQstMauU2nWKw3pJ48=;
        b=TdiAqgwsUhRYtnpZRVIqN//fDdQ4F0HEskSrx0TOi7WpAyk1sg/cZEfBm4TKSlPfDP
         mMU1Eztygc1dQ4ndDCaIF7dAV55RmOkQIUoiknl+XsVMaSsvwfxp3CGEd3sAtZuvY/Ep
         7+RaVEJGN/03TqTtDYKFK9VW9FseUqFE6p6F/5XgRv61pAAz0F6TGk1JLhdVzXXf1bbD
         1Wwo/c6GVQHOB4U1EEwgOwRN1QshszAggCc/JL9KKcM3ccUfw6SPBw4NQuqgZ6RtvH+T
         Ptz/xXnsGtiibKiy00IeepPhOkgCvkYesxn7KXoLHZlVzWs8gqOKyNmiLmZL2t9KmrBn
         vStg==
X-Gm-Message-State: AOAM531w9w6Ue5o62WahGDU8Do8Uq4j4nwDV+fOX/xF2WGOZWceH1Kmo
        EE3iyY5HrexM6ku+LkIObU9hAxHIU5VssA==
X-Google-Smtp-Source: ABdhPJz9nXmdvYgSy7Tr6nIY/Gyo4HhgTVnqg7m1iLvC+/dlUYGa5eZSriXOaJ3Iysh1yqmk6KIHiQ==
X-Received: by 2002:a92:b74d:: with SMTP id c13mr7506474ilm.90.1624629367309;
        Fri, 25 Jun 2021 06:56:07 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id x11sm3311050ilc.40.2021.06.25.06.56.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 06:56:06 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id q9so9765511ilj.3
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 06:56:06 -0700 (PDT)
X-Received: by 2002:a92:2a05:: with SMTP id r5mr7197734ile.69.1624629365800;
 Fri, 25 Jun 2021 06:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210618122923.385938-1-ribalda@chromium.org> <20210618122923.385938-22-ribalda@chromium.org>
 <CANiDSCvNvJ_xyuqgvvFv6aZGSm=H-9=SeV6wp5C_0-acm+wC=A@mail.gmail.com> <820809c2-a564-8a79-c279-7570c3bcc801@xs4all.nl>
In-Reply-To: <820809c2-a564-8a79-c279-7570c3bcc801@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 25 Jun 2021 15:55:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCvwQvDYKNqxAZjtAKY6CGNrnn21LMoNnsg7FrrDiooi-A@mail.gmail.com>
Message-ID: <CANiDSCvwQvDYKNqxAZjtAKY6CGNrnn21LMoNnsg7FrrDiooi-A@mail.gmail.com>
Subject: Re: [PATCH v10 21/21] media: uvcvideo: Return -EACCES to inactive controls
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, tfiga@chromium.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Fri, 25 Jun 2021 at 13:07, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 25/06/2021 12:29, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > Did you have some hardware that did not work fine without this patch?
> > Am I remembering correctly?
>
> Yes, that's correct. It's one of my webcams, but I can't remember which one
> it is. You probably want me to test this v10?
>
> Regards,

That would be awesome. Thanks!

>
>         Hans
>
> >
> > Thanks!
> >
> > On Fri, 18 Jun 2021 at 14:29, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >>
> >> If a control is inactive return -EACCES to let the userspace know that
> >> the value will not be applied automatically when the control is active
> >> again.
> >>
> >> Also make sure that query_v4l2_ctrl doesn't return an error.
> >>
> >> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >>  drivers/media/usb/uvc/uvc_ctrl.c | 73 +++++++++++++++++++++-----------
> >>  1 file changed, 49 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> >> index da44d5c0b9ad..4f80c06d3c43 100644
> >> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> >> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> >> @@ -1104,13 +1104,36 @@ static const char *uvc_map_get_name(const struct uvc_control_mapping *map)
> >>         return "Unknown Control";
> >>  }
> >>
> >> +static bool uvc_ctrl_is_inactive(struct uvc_video_chain *chain,
> >> +                                struct uvc_control *ctrl,
> >> +                                struct uvc_control_mapping *mapping)
> >> +{
> >> +       struct uvc_control_mapping *master_map = NULL;
> >> +       struct uvc_control *master_ctrl = NULL;
> >> +       s32 val;
> >> +       int ret;
> >> +
> >> +       if (!mapping->master_id)
> >> +               return false;
> >> +
> >> +       __uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> >> +                          &master_ctrl, 0);
> >> +
> >> +       if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> >> +               return false;
> >> +
> >> +       ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> >> +       if (ret < 0 || val == mapping->master_manual)
> >> +               return false;
> >> +
> >> +       return true;
> >> +}
> >> +
> >>  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >>         struct uvc_control *ctrl,
> >>         struct uvc_control_mapping *mapping,
> >>         struct v4l2_queryctrl *v4l2_ctrl)
> >>  {
> >> -       struct uvc_control_mapping *master_map = NULL;
> >> -       struct uvc_control *master_ctrl = NULL;
> >>         const struct uvc_menu_info *menu;
> >>         unsigned int i;
> >>
> >> @@ -1126,18 +1149,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >>         if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> >>                 v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >>
> >> -       if (mapping->master_id)
> >> -               __uvc_find_control(ctrl->entity, mapping->master_id,
> >> -                                  &master_map, &master_ctrl, 0);
> >> -       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> >> -               s32 val;
> >> -               int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> >> -               if (ret < 0)
> >> -                       return ret;
> >> -
> >> -               if (val != mapping->master_manual)
> >> -                               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> >> -       }
> >> +       if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
> >> +               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> >>
> >>         if (!ctrl->cached) {
> >>                 int ret = uvc_ctrl_populate_cache(chain, ctrl);
> >> @@ -1660,25 +1673,37 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >>         return 0;
> >>  }
> >>
> >> -static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
> >> -                                 struct v4l2_ext_controls *ctrls,
> >> -                                 struct uvc_control *uvc_control)
> >> +static int uvc_ctrl_commit_error(struct uvc_video_chain *chain,
> >> +                                struct uvc_entity *entity,
> >> +                                struct v4l2_ext_controls *ctrls,
> >> +                                struct uvc_control *err_control,
> >> +                                int ret)
> >>  {
> >>         struct uvc_control_mapping *mapping;
> >>         struct uvc_control *ctrl_found;
> >>         unsigned int i;
> >>
> >> -       if (!entity)
> >> -               return ctrls->count;
> >> +       if (!entity) {
> >> +               ctrls->error_idx = ctrls->count;
> >> +               return ret;
> >> +       }
> >>
> >>         for (i = 0; i < ctrls->count; i++) {
> >>                 __uvc_find_control(entity, ctrls->controls[i].id, &mapping,
> >>                                    &ctrl_found, 0);
> >> -               if (uvc_control == ctrl_found)
> >> -                       return i;
> >> +               if (err_control == ctrl_found)
> >> +                       break;
> >>         }
> >> +       ctrls->error_idx = i;
> >> +
> >> +       /* We could not find the control that failed. */
> >> +       if (i == ctrls->count)
> >> +               return ret;
> >> +
> >> +       if (uvc_ctrl_is_inactive(chain, err_control, mapping))
> >> +               return -EACCES;
> >>
> >> -       return ctrls->count;
> >> +       return ret;
> >>  }
> >>
> >>  int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> >> @@ -1701,8 +1726,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> >>                 uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
> >>  done:
> >>         if (ret < 0 && ctrls)
> >> -               ctrls->error_idx = uvc_ctrl_find_ctrl_idx(entity, ctrls,
> >> -                                                         err_ctrl);
> >> +               ret = uvc_ctrl_commit_error(chain, entity, ctrls, err_ctrl,
> >> +                                           ret);
> >>         mutex_unlock(&chain->ctrl_mutex);
> >>         return ret;
> >>  }
> >> --
> >> 2.32.0.288.g62a8d224e6-goog
> >>
> >
> >
>


-- 
Ricardo Ribalda
