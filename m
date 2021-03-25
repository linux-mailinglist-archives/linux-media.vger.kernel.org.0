Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9AB34938D
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 15:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhCYOCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 10:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhCYOCV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 10:02:21 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42A7C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 07:02:20 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id d2so2180504ilm.10
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WFT4X9qjFLyaboU3jk9DZiP1eiV1Osc3Gv5SUkAiuLM=;
        b=ZUbdhBvaylFk7Lofbb7jP7ehevFcDiOTpk+wahsXyqGwVQ+l9LBonLPdIfz8Iga43X
         w4UuUomTpzsPsW/OZ2WDZMuBb3y4/peXGjAUzkblSrpvOFn9+wcUC5NuZrIxs2LZqNby
         m3ENDWegMldQhzQ2g7s5Rk/0p8SHEEWanAYKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WFT4X9qjFLyaboU3jk9DZiP1eiV1Osc3Gv5SUkAiuLM=;
        b=lbgA24O7EJAn2DsCzgzLR+PdAuFgfirydTJFeN8WLlpfWjLgMoDBoL4MRfNOCXN81s
         c+jLJ6mRfQrZqK8K1/n8C1zHob56mAjD5VTVXW75UufT1L1fcBfd01jwyEO5sDRAjkvD
         Lx9TMQlAmM2RJL09QEsN2/8edOP5/USka2lk+JAPRRgVCRaZYHYoI6ZQbKWzH7EMln4O
         EuC1+Ll/cxKlS6JlyOwVEkdbPYhUNpR3sq9XKoawMc7ce46XBv+V39z2oa+WBptHCy4Z
         t6iLpSDzkjGChyq6nd/m2NqeCC+5DBX39pOv/nBkdymhPy+cBgAt9Dy1b0sYBsHhFqwO
         OXtg==
X-Gm-Message-State: AOAM530QVqgLWy2EAOm+/eMm0+Zruhxh6rNwVOE1WCm7X3/YifTgYZ6n
        20Mf1nggliJINpSeujRrMn1iKSr1kHIOeA==
X-Google-Smtp-Source: ABdhPJzG0FghNgukMcfEEFO3y2C9N6fPqAS04azLSrFh7ctpKS2lFW5hOTpIa+GEXtZGypjII37NBg==
X-Received: by 2002:a92:650d:: with SMTP id z13mr6384828ilb.293.1616680939939;
        Thu, 25 Mar 2021 07:02:19 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id x20sm2836157ilc.88.2021.03.25.07.02.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 07:02:18 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id d10so2211336ils.5
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 07:02:18 -0700 (PDT)
X-Received: by 2002:a05:6e02:2182:: with SMTP id j2mr7102794ila.89.1616680937404;
 Thu, 25 Mar 2021 07:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <b1c94f21-4ae1-148c-fa5f-f9e4719049b9@xs4all.nl>
 <CAPybu_1qv67P6WQqXM6g1qr5=n7PPre3u0TJkkhk0wpWEG7F3Q@mail.gmail.com> <ffaa3e0c-9137-91ee-b4e2-e64a3402aff8@xs4all.nl>
In-Reply-To: <ffaa3e0c-9137-91ee-b4e2-e64a3402aff8@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 25 Mar 2021 15:02:06 +0100
X-Gmail-Original-Message-ID: <CANiDSCuKtfzho8jET0+5dz9B5iHiLeaY1tN6-c5sgXmNUacR1w@mail.gmail.com>
Message-ID: <CANiDSCuKtfzho8jET0+5dz9B5iHiLeaY1tN6-c5sgXmNUacR1w@mail.gmail.com>
Subject: Re: [PATCH] uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Thu, Mar 25, 2021 at 1:27 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 23/03/2021 16:29, Ricardo Ribalda Delgado wrote:
> > Hi Hans
> >
> > On Mon, Mar 22, 2021 at 1:06 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> Check for inactive controls in uvc_ctrl_is_accessible().
> >> Use the new value for the master_id controls if present,
> >> otherwise use the existing value to determine if it is OK
> >> to set the control. Doing this here avoids attempting to
> >> set an inactive control, which will return an error from the
> >> USB device.
> >
> > Dont you think that this patch is not needed if this is used:
> > https://patchwork.linuxtv.org/project/linux-media/patch/20210319170906.278238-17-ribalda@chromium.org/
> > ?
>
> That might well be the case :-)
>
> I haven't really looked at that.

They overlap a bit. Not sure if we can remove one of them. Lets see
what Laurent thinks.

Thanks!

>
> >
> >
> > Also Maybe it is wrong. (Maybe it is the keyword here ;).
> > I think the initial assumption was that uvc_ctrl_is_accessible shall
> > not access the hardware, but with this patch it is accessing it.
>
> It's only accessing it if master_ctrl->loaded is 0 (see __uvc_ctrl_get()).
> If loaded is 0, and __uvc_ctrl_get() returns an error, then that error is
> ignored and the code will assume that the control is accessible.
>
> Note that what we try to avoid is *setting* an inactive control. In this
> case we're reading the master control, which should be safe except for
> USB hardware problems that can return an error.
>
> Regards,
>
>         Hans
>
> >>
> >> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> >> ---
> >> Ricardo: this can be added to your uvc series. It avoids attempts to set
> >> inactive controls.
> >> ---
> >>  drivers/media/usb/uvc/uvc_ctrl.c | 28 +++++++++++++++++++++++++++-
> >>  drivers/media/usb/uvc/uvc_v4l2.c |  4 ++--
> >>  drivers/media/usb/uvc/uvcvideo.h |  3 ++-
> >>  3 files changed, 31 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> >> index d9d4add1e813..6e7b904bc33d 100644
> >> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> >> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> >> @@ -1047,10 +1047,18 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
> >>  }
> >>
> >>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >> -                          bool read)
> >> +                          const struct v4l2_ext_controls *ctrls,
> >> +                          unsigned long ioctl)
> >>  {
> >> +       struct uvc_control_mapping *master_map = NULL;
> >> +       struct uvc_control *master_ctrl = NULL;
> >>         struct uvc_control_mapping *mapping;
> >>         struct uvc_control *ctrl;
> >> +       bool read = ioctl == VIDIOC_G_EXT_CTRLS;
> >> +       bool try = ioctl == VIDIOC_TRY_EXT_CTRLS;
> >> +       s32 val;
> >> +       int ret;
> >> +       int i;
> >>
> >>         if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
> >>                 return -EACCES;
> >> @@ -1065,6 +1073,24 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >>         if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
> >>                 return -EACCES;
> >>
> >> +       if (read || try || !mapping->master_id)
> >> +               return 0;
> >> +
> >> +       for (i = ctrls->count - 1; i >= 0; i--)
> >> +               if (ctrls->controls[i].id == mapping->master_id)
> >> +                       return ctrls->controls[i].value ==
> >> +                                       mapping->master_manual ? 0 : -EACCES;
> >> +
> >> +       __uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> >> +                          &master_ctrl, 0);
> >> +
> >> +       if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> >> +               return 0;
> >> +
> >> +       ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> >> +       if (ret >= 0 && val != mapping->master_manual)
> >> +               return -EACCES;
> >> +
> >>         return 0;
> >>  }
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> >> index 12362e0f9870..e40db7ae18b1 100644
> >> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >> @@ -803,8 +803,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
> >>         int ret = 0;
> >>
> >>         for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> >> -               ret = uvc_ctrl_is_accessible(chain, ctrl->id,
> >> -                                           ioctl == VIDIOC_G_EXT_CTRLS);
> >> +               ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls,
> >> +                                           ioctl);
> >>                 if (ret)
> >>                         break;
> >>         }
> >> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >> index aedb4d3d4db9..8849d7953767 100644
> >> --- a/drivers/media/usb/uvc/uvcvideo.h
> >> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >> @@ -869,7 +869,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
> >>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
> >>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
> >>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >> -                          bool read);
> >> +                          const struct v4l2_ext_controls *ctrls,
> >> +                          unsigned long ioctl);
> >>
> >>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >>                       struct uvc_xu_control_query *xqry);
> >> --
> >> 2.30.0
> >>
> >>
> >
> >
>


--
Ricardo Ribalda
