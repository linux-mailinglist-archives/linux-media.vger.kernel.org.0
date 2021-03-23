Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073963462E3
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 16:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhCWPah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 11:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232835AbhCWPaI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 11:30:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE116C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 08:30:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b4so3322449lfi.6
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xvm1n3SWN7HpVhA9KDaCh2wXs/ahkUpRWHeiYr6zLAU=;
        b=Nruq76bsswm2rQvYTrGg4LdbZcbWA/vuSY2Qs/SGurI8BF4u6afdjpEh2F2G7E3Xm2
         PfUn/NCXdZMpx2Fc08LG8SfFHq3m3kPmfr90XKfumyep47M9J14KAZ6+THWx/oMkHxqs
         MZWt/5oDpt1B+NRsYC74ewEP1wpnBAkQX3TLQiOb7PHdBi/9mihOLVBIgPar96Xa1rFP
         vE5n+tRYcbwOqjaHQeFLef6zNrMyQ3KC9qy5pToqEqhfJuBidEVHiTriG5qvxU5aBE0X
         bTh6GvNpblHkj7NZvscWt8cBdIKHzt15rDAqguc9KFWEKwkq3NRLojU75e5IDseg38+P
         3Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xvm1n3SWN7HpVhA9KDaCh2wXs/ahkUpRWHeiYr6zLAU=;
        b=XLlLiPUn9W0DHQdim0XMdfpZKexpSK74ulTeRbCyvbgEGomPG7im8R45ynNhy7VP2g
         IHj1bQor+qQtTHSJw0OlPa9dyPkanl5yHpLGDeTihGGg64vSsWOqNCcbwbq9CkujlzN7
         hJPMzMSnfEMFdlO2W4uDn8Mmp1EPG+L0sQP1Mf+yZp79qdRlFEMrC4pdQ9vxNcI+smgX
         jMtl92XLOjkNbs7uXAnRWgirq7mFr8N8M9t8z8/8IvF+kHMvvsiS3A2/UGPGoX+c6Scf
         Oa+LoCL6GpRnwnN/Rw/UtjLGgRQH6t8NTg4dm1Bu60m+7dnEbNHPaU5ozo1yKcGzRx4L
         a6Fg==
X-Gm-Message-State: AOAM530ulqIgpRZeoVqgfgjshgL/yopxShrXh2mrF/+8ho5bGp6TY1ny
        UzK/3+W+JQzkM9Myu/KLDy9g9E4LO5n3erc+ZYU=
X-Google-Smtp-Source: ABdhPJxOCAKMvfvWxEDAuqzDRZVrb4s7gkEyG8uNwbILogR50yRq0hY30UVegMKpTaIWsdt3GEiOXgXsNQzVeX6c944=
X-Received: by 2002:a19:9109:: with SMTP id t9mr2917908lfd.49.1616513406357;
 Tue, 23 Mar 2021 08:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <b1c94f21-4ae1-148c-fa5f-f9e4719049b9@xs4all.nl>
In-Reply-To: <b1c94f21-4ae1-148c-fa5f-f9e4719049b9@xs4all.nl>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Tue, 23 Mar 2021 16:29:50 +0100
Message-ID: <CAPybu_1qv67P6WQqXM6g1qr5=n7PPre3u0TJkkhk0wpWEG7F3Q@mail.gmail.com>
Subject: Re: [PATCH] uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Mon, Mar 22, 2021 at 1:06 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Check for inactive controls in uvc_ctrl_is_accessible().
> Use the new value for the master_id controls if present,
> otherwise use the existing value to determine if it is OK
> to set the control. Doing this here avoids attempting to
> set an inactive control, which will return an error from the
> USB device.

Dont you think that this patch is not needed if this is used:
https://patchwork.linuxtv.org/project/linux-media/patch/20210319170906.278238-17-ribalda@chromium.org/
?


Also Maybe it is wrong. (Maybe it is the keyword here ;).
I think the initial assumption was that uvc_ctrl_is_accessible shall
not access the hardware, but with this patch it is accessing it.
>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
> Ricardo: this can be added to your uvc series. It avoids attempts to set
> inactive controls.
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 28 +++++++++++++++++++++++++++-
>  drivers/media/usb/uvc/uvc_v4l2.c |  4 ++--
>  drivers/media/usb/uvc/uvcvideo.h |  3 ++-
>  3 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index d9d4add1e813..6e7b904bc33d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1047,10 +1047,18 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>  }
>
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> -                          bool read)
> +                          const struct v4l2_ext_controls *ctrls,
> +                          unsigned long ioctl)
>  {
> +       struct uvc_control_mapping *master_map = NULL;
> +       struct uvc_control *master_ctrl = NULL;
>         struct uvc_control_mapping *mapping;
>         struct uvc_control *ctrl;
> +       bool read = ioctl == VIDIOC_G_EXT_CTRLS;
> +       bool try = ioctl == VIDIOC_TRY_EXT_CTRLS;
> +       s32 val;
> +       int ret;
> +       int i;
>
>         if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
>                 return -EACCES;
> @@ -1065,6 +1073,24 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>         if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
>                 return -EACCES;
>
> +       if (read || try || !mapping->master_id)
> +               return 0;
> +
> +       for (i = ctrls->count - 1; i >= 0; i--)
> +               if (ctrls->controls[i].id == mapping->master_id)
> +                       return ctrls->controls[i].value ==
> +                                       mapping->master_manual ? 0 : -EACCES;
> +
> +       __uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> +                          &master_ctrl, 0);
> +
> +       if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> +               return 0;
> +
> +       ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> +       if (ret >= 0 && val != mapping->master_manual)
> +               return -EACCES;
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 12362e0f9870..e40db7ae18b1 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -803,8 +803,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
>         int ret = 0;
>
>         for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -               ret = uvc_ctrl_is_accessible(chain, ctrl->id,
> -                                           ioctl == VIDIOC_G_EXT_CTRLS);
> +               ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls,
> +                                           ioctl);
>                 if (ret)
>                         break;
>         }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index aedb4d3d4db9..8849d7953767 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -869,7 +869,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> -                          bool read);
> +                          const struct v4l2_ext_controls *ctrls,
> +                          unsigned long ioctl);
>
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>                       struct uvc_xu_control_query *xqry);
> --
> 2.30.0
>
>


-- 
Ricardo Ribalda
