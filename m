Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB4DE34B733
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 13:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhC0M0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 08:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbhC0M0m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 08:26:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9A7C0613B1;
        Sat, 27 Mar 2021 05:26:41 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a198so11689597lfd.7;
        Sat, 27 Mar 2021 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mSGEMn9lwrQhAEJzx+ol/aL8d/P/R9KtuUiTtOE/PQw=;
        b=DwJdHzf4NdlT/6uQPYyVtCh/SvvO9mbW1b9aYC3wJ4dSEZ9Vk5ev95l9IznRCVHxJN
         +S4Wm9boqA/HlKOaYP5sgy9RR5t8LPKubKomcWXdwDoBHu2g/wd8Lka+sccqNa46sdC1
         IV7p76wPeVhIqq8XjeFzUOXHLi5MjUA0VvC9kKx5FoZIf8INrtJjdjjvFmduxY0RHoKO
         5twLn6CK9CrURCw+6qlN5LXQ++tJBD0GRYuC0ALNeBFq4pLv4fZAEivqZRcfgrx6x9OC
         +x41FNXcSYBNY8+eY2lb+92BfJ6xVSw8NEEC0KhHU1ROmYJDGwg5oJcX7N3wrceQaynl
         33zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mSGEMn9lwrQhAEJzx+ol/aL8d/P/R9KtuUiTtOE/PQw=;
        b=Ity/MW+e9ipoYN7iU0xbWdpQenLG8qmF9NEyl5ZVScd89Ealu6kxDtjJj5sQTeDk5B
         qmwbU0cR7bMJpawTizDbYklUQgR+Hw3BjZuD6bp7DMsfybFrcmLyGk01Gq7tVDLiqNbs
         Z2CP1fmoOuh2WKaJcx0Q+5pC6ZJzr+OT+I6Z0V0UH/lbf5916BTIR8rl00NV5+I1OmDu
         PSMclhqSbnAZcXQKa2h3Kv83HoOPaKqBIKW6tsroFN5m7J8pZEHsRiDFqukT1kaFY/fe
         7iG/NH1SyU+NSz3GmFC3iC10M6Wr7vJXHF8q+fZFI2ooLhQpYfmZrRH8o4aqFZBQAgY9
         I1iw==
X-Gm-Message-State: AOAM530MuUOGnjRhqCqaBZq4KrXvckX1tA+O2RKw7n1BUeH8o1TtCBzc
        7bdx2lZqtiMTqigQXpj3HtQtVnXfW5u+HXAyMIk=
X-Google-Smtp-Source: ABdhPJwUeFidaTlKKo7QT+0LKVvU+cRXMfUgDRI3RY7LDeg+OVojxBjiq9fI7IvVxPq/z5XpaVwIvOLrUOfHTbrT+kM=
X-Received: by 2002:a19:81d0:: with SMTP id c199mr10525900lfd.62.1616847999939;
 Sat, 27 Mar 2021 05:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210326095840.364424-1-ribalda@chromium.org> <20210326095840.364424-20-ribalda@chromium.org>
In-Reply-To: <20210326095840.364424-20-ribalda@chromium.org>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Sat, 27 Mar 2021 13:26:23 +0100
Message-ID: <CAPybu_1S0mLJQPhuz8dZfvVeybqsST0RBsXJKGi+FoFWivCQpw@mail.gmail.com>
Subject: Re: [PATCH v9 19/22] uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans

On Fri, Mar 26, 2021 at 11:01 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> From: Hans Verkuil <hverkuil@xs4all.nl>
>
> Check for inactive controls in uvc_ctrl_is_accessible().
> Use the new value for the master_id controls if present,
> otherwise use the existing value to determine if it is OK
> to set the control. Doing this here avoids attempting to
> set an inactive control, which will return an error from the
> USB device.
>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
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

Maybe we could use  uvc_ctrl_is_inactive().

Please checkout:
https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=uvc-compliance-v10&id=f49f7c84ece18df72094a18011f2fbeb20dc1b15

and if you like it better that will be what I resend for v10 ;)

Thanks!


> +
>         return 0;
>  }
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 8d8b12a4db34..0f4d893eff46 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1000,8 +1000,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
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
> index 0313b30f0cea..20bc681315fb 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -901,7 +901,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
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
> 2.31.0.291.g576ba9dcdaf-goog
>


--
Ricardo Ribalda
