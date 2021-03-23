Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27753464C6
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 17:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbhCWQRN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 12:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbhCWQQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 12:16:51 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72A6C061763
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:16:51 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id c17so18648424ilj.7
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OdVHouUBIBuDXBCel9+OQ4NaibXA+5UIQV8+SjROSaM=;
        b=oJHOpEbW0mw5g65y/ym/nu+3gPznNdyqammcqatn85H6d1t7h2FC6fZvCjG931xrsW
         zrsnIcYN5OIf4O6cjfwK1qPwJDg46VM3kJFykLNNwlVlXkx2qYr/1AojXhHCwWofzCXl
         pNsxo1rzvA7UpaPYrxM/73iwopyYQi4Z4hzoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OdVHouUBIBuDXBCel9+OQ4NaibXA+5UIQV8+SjROSaM=;
        b=IDCrc4DKOwi0ztNpdLQ5iP8S1mC4TYIAKRhkPwdnaGn+1bMqvgR2F86Dq9Vb4zYBys
         uuth30AyV9V36Hsio0FHf3PHZ1x3zssYmPIvBx6Nf0oxG1AHQPx2ET2f13KdTAdVO/Wi
         SnOAShAZds9jcUF3C3SGFXdQ/j3fpSOkm3+2Q0Y+vaYW4nGwEGVPlqWEifSYz0eSZCNx
         LHDCeb4B+v2KzqbfvDD2LczbEcpTvixudWJtwEABWpKzcCE7Ry+t6TikXC8X/kMuFVrq
         ZAKUiP0Z+CwmUJGm8eASTgOgH47kSFRjFUkQq0eAx/UWqIAsHAlfp8KW4Hq5hKeZkI/s
         DCwQ==
X-Gm-Message-State: AOAM53169jOck3/HCKp6qHzh+QNZ35+jvyD3qsSiu84hfU2IluIqi0GV
        SmbuJp/q0e1Y0WPdfFL6vhS2dclCVbkNyA==
X-Google-Smtp-Source: ABdhPJxJfMw7uyZNT37KO1pZZsoMuCallO+oQlLoQ6rqbi31BYs2hRnoP1CzciBpHFv784uzjCgDog==
X-Received: by 2002:a92:7613:: with SMTP id r19mr5360684ilc.41.1616516211035;
        Tue, 23 Mar 2021 09:16:51 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id c16sm9686735ils.2.2021.03.23.09.16.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 09:16:50 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id v3so18638248ilj.12
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:16:50 -0700 (PDT)
X-Received: by 2002:a92:3648:: with SMTP id d8mr4989323ilf.69.1616516209776;
 Tue, 23 Mar 2021 09:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210319055342.127308-1-senozhatsky@chromium.org> <20210319055342.127308-6-senozhatsky@chromium.org>
In-Reply-To: <20210319055342.127308-6-senozhatsky@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 23 Mar 2021 17:16:38 +0100
X-Gmail-Original-Message-ID: <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
Message-ID: <CANiDSCt72o_E=gRBRhMWWmta-H2WGmDqg5_PBGHBrVCG4iepZw@mail.gmail.com>
Subject: Re: [PATCHv3 5/6] media: uvcvideo: add UVC 1.5 ROI control
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey

On Fri, Mar 19, 2021 at 6:54 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> This patch implements UVC 1.5 Region of Interest (ROI) control.
>
> Note that, UVC 1.5 defines CT_DIGITAL_WINDOW_CONTROL controls
> and mentions that ROI rectangle coordinates "must be within
> the current Digital Window as specified by the CT_WINDOW control."
> (4.2.2.1.20 Digital Region of Interest (ROI) Control).
>
> It's is not entirely clear if we need to implement WINDOW_CONTROL.
> ROI is naturally limited by GET_MIN and GET_MAX rectangles.
>
> Another thing to note is that ROI support is implemented as
> V4L2 selection target: selection rectangle represents ROI
> rectangle and selection flags represent ROI auto-controls.
> User-space is required to set valid values for both rectangle
> and auto-controls every time SET_CUR is issued.
>
> Usage example:
>
>        struct v4l2_selection roi = {0, };
>
>        roi.target     = V4L2_SEL_TGT_ROI;
>        roi.r.left     = 0;
>        roi.r.top      = 0;
>        roi.r.width    = 42;
>        roi.r.height   = 42;
>        roi.flags      = V4L2_SEL_FLAG_ROI_AUTO_EXPOSURE;
>
>        ioctl(fd, VIDIOC_S_SELECTION, &roi);
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 147 ++++++++++++++++++++++++++++++-
>  include/uapi/linux/usb/video.h   |   1 +
>  2 files changed, 145 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 252136cc885c..d0fe6c33fab6 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1139,14 +1139,66 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
>         return uvc_query_v4l2_menu(chain, qm);
>  }
>
> -static int uvc_ioctl_g_selection(struct file *file, void *fh,
> -                                struct v4l2_selection *sel)
> +/* UVC 1.5 ROI rectangle is half the size of v4l2_rect */
> +struct uvc_roi_rect {
> +       __u16                   top;
> +       __u16                   left;
> +       __u16                   bottom;
> +       __u16                   right;
> +       __u16                   auto_controls;
> +} __packed;
> +
> +static int uvc_ioctl_g_roi_target(struct file *file, void *fh,
> +                                 struct v4l2_selection *sel)
>  {
>         struct uvc_fh *handle = fh;
>         struct uvc_streaming *stream = handle->stream;
> +       struct uvc_roi_rect *roi;
> +       u8 query;
> +       int ret;
>
> -       if (sel->type != stream->type)
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_ROI:
> +               query = UVC_GET_CUR;
> +               break;
> +       case V4L2_SEL_TGT_ROI_DEFAULT:
> +               query = UVC_GET_DEF;
> +               break;
> +       case V4L2_SEL_TGT_ROI_BOUNDS_MIN:
> +               query = UVC_GET_MAX;
> +               break;
> +       case V4L2_SEL_TGT_ROI_BOUNDS_MAX:
> +               query = UVC_GET_MAX;
> +               break;
> +       default:
>                 return -EINVAL;
> +       }
> +
> +       roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
> +       if (!roi)
> +               return -ENOMEM;
> +
> +       ret = uvc_query_ctrl(stream->dev, query, 1, stream->dev->intfnum,
> +                            UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
> +                            sizeof(struct uvc_roi_rect));
> +       if (!ret) {
> +               /* ROI left, top, right, bottom are global coordinates. */
> +               sel->r.left     = roi->left;
> +               sel->r.top      = roi->top;
> +               sel->r.width    = roi->right - roi->left + 1;
> +               sel->r.height   = roi->bottom - roi->top + 1;
> +               sel->flags      = roi->auto_controls;
> +       }
> +
> +       kfree(roi);
> +       return ret;
> +}
> +
> +static int uvc_ioctl_g_sel_target(struct file *file, void *fh,
> +                                 struct v4l2_selection *sel)
> +{
> +       struct uvc_fh *handle = fh;
> +       struct uvc_streaming *stream = handle->stream;
>
>         switch (sel->target) {
>         case V4L2_SEL_TGT_CROP_DEFAULT:
> @@ -1173,6 +1225,94 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
>         return 0;
>  }
>
> +static int uvc_ioctl_g_selection(struct file *file, void *fh,
> +                                struct v4l2_selection *sel)
> +{
> +       struct uvc_fh *handle = fh;
> +       struct uvc_streaming *stream = handle->stream;
> +
> +       if (sel->type != stream->type)
> +               return -EINVAL;
> +
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +       case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +       case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +               return uvc_ioctl_g_sel_target(file, fh, sel);
> +       case V4L2_SEL_TGT_ROI:
> +       case V4L2_SEL_TGT_ROI_DEFAULT:
> +       case V4L2_SEL_TGT_ROI_BOUNDS_MIN:
> +       case V4L2_SEL_TGT_ROI_BOUNDS_MAX:
> +               return uvc_ioctl_g_roi_target(file, fh, sel);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static bool validate_roi_bounds(struct uvc_streaming *stream,
> +                               struct v4l2_selection *sel)
> +{
> +       if (sel->r.left > USHRT_MAX ||
> +           sel->r.top > USHRT_MAX ||
> +           (sel->r.width + sel->r.left) > USHRT_MAX ||
> +           (sel->r.height + sel->r.top) > USHRT_MAX ||
> +           !sel->r.width || !sel->r.height)
> +               return false;
> +
> +       if (sel->flags > V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY)
> +               return false;

Is it not allowed V4L2_SEL_FLAG_ROI_AUTO_IRIS |
V4L2_SEL_FLAG_ROI_AUTO_HIGHER_QUALITY   ?

> +
> +       return true;
> +}
> +
> +static int uvc_ioctl_s_roi(struct file *file, void *fh,
> +                          struct v4l2_selection *sel)
> +{
> +       struct uvc_fh *handle = fh;
> +       struct uvc_streaming *stream = handle->stream;
> +       struct uvc_roi_rect *roi;
> +       int ret;
> +
> +       if (!validate_roi_bounds(stream, sel))
> +               return -E2BIG;

Not sure if this is the correct approach or if we should convert the
value to the closest valid...


> +
> +       roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
> +       if (!roi)
> +               return -ENOMEM;
> +
> +       /* ROI left, top, right, bottom are global coordinates. */
> +       roi->left               = sel->r.left;
> +       roi->top                = sel->r.top;
> +       roi->right              = sel->r.width + sel->r.left - 1;
> +       roi->bottom             = sel->r.height + sel->r.top - 1;
> +       roi->auto_controls      = sel->flags;
> +
> +       ret = uvc_query_ctrl(stream->dev, UVC_SET_CUR, 1, stream->dev->intfnum,
> +                            UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
> +                            sizeof(struct uvc_roi_rect));
> +
> +       kfree(roi);
> +       return ret;
> +}
> +
> +static int uvc_ioctl_s_selection(struct file *file, void *fh,
> +                                struct v4l2_selection *sel)
> +{
> +       struct uvc_fh *handle = fh;
> +       struct uvc_streaming *stream = handle->stream;
> +
> +       if (sel->type != stream->type)
> +               return -EINVAL;
> +
> +       switch (sel->target) {
> +       case V4L2_SEL_TGT_ROI:
> +               return uvc_ioctl_s_roi(file, fh, sel);
> +       }
> +
> +       return -EINVAL;
> +}
> +
>  static int uvc_ioctl_g_parm(struct file *file, void *fh,
>                             struct v4l2_streamparm *parm)
>  {
> @@ -1533,6 +1673,7 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>         .vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
>         .vidioc_querymenu = uvc_ioctl_querymenu,
>         .vidioc_g_selection = uvc_ioctl_g_selection,
> +       .vidioc_s_selection = uvc_ioctl_s_selection,
>         .vidioc_g_parm = uvc_ioctl_g_parm,
>         .vidioc_s_parm = uvc_ioctl_s_parm,
>         .vidioc_enum_framesizes = uvc_ioctl_enum_framesizes,
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> index d854cb19c42c..c87624962896 100644
> --- a/include/uapi/linux/usb/video.h
> +++ b/include/uapi/linux/usb/video.h
> @@ -104,6 +104,7 @@
>  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                   0x0f
>  #define UVC_CT_ROLL_RELATIVE_CONTROL                   0x10
>  #define UVC_CT_PRIVACY_CONTROL                         0x11
> +#define UVC_CT_REGION_OF_INTEREST_CONTROL              0x14
>
>  /* A.9.5. Processing Unit Control Selectors */
>  #define UVC_PU_CONTROL_UNDEFINED                       0x00
> --
> 2.31.0.rc2.261.g7f71774620-goog
>


-- 
Ricardo Ribalda
