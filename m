Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5C833DCD1
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 19:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240134AbhCPSr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 14:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240160AbhCPSqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 14:46:45 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB13C06175F;
        Tue, 16 Mar 2021 11:46:44 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a1so76044ljp.2;
        Tue, 16 Mar 2021 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CL63UUQ8vCBeSVhVlVTb0P1mjJWa4M6qfgb4z9iNqSE=;
        b=Zt+e1KiMHUunYG/pD2qi1HRy0sFULqfqFmXZySKe6t5xblgEh9aRoyvbDjz/2xPT3M
         YyMVn0Fp5AKyzpzO7KVRArs/Z4WcW1Ql4B9d74MttegLA09QdoYMMgdcaWH7VWqcnMEi
         zTBCIoqBV1KFBqrx24DdziQQBXmcp3Umr+b4+hMIgu4vnVCT5dfj1V0osH/oq6D318QQ
         3L20ve0rejI8/pOy/wR466hZigCMwczbaPvygrnp7ot9Dpqeq83taSQg1TmYoUcnUMZn
         I/1xUc4ktwxwN2Iir1HPM/rZvxgkEKD78Cy3iXKboGJWOG24XmHoXcBN59VmNpCPhwa2
         lImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CL63UUQ8vCBeSVhVlVTb0P1mjJWa4M6qfgb4z9iNqSE=;
        b=q8krf9G5rS4Wvpix+H5g2KKBCcY9GHoQpF7CsJR4v61qrV5BSzHu5JTB4cT8r/NvsD
         IuN8C6OzOag0bAo7Ory2ZcrbAGzQkMY5DscWaoMzzPBe5Iaq+Hn/0WhNuOx7qmepDuCu
         s8SgJLwwyU7zgpx43VhR2OFWhQ6NC8ImcuUa43sPdttP1EER6Ca5E0BU/xGM2hJxM4PS
         YS/oQF3ArAYkD/PltAkQ+V7tUoi2YpJ2Hp2UCt9y++s9fhBGiYUq1hjrkLp/YvdpjNGl
         uIDpfKm+VjdijNnqHhI75Fr+R3YQV60a6mWQpcU/AS8CiA5Bt02Gw7H+LnWuZcz9NPeM
         AYJQ==
X-Gm-Message-State: AOAM530xjJtWZeJhFTv16f5drNmAX3BHWOxr9lM5Iu8PCAbOsVYcIes4
        7RM5x5z7vVTZL+Sik5lDU+AngfRzHHjb5uF0/LQ=
X-Google-Smtp-Source: ABdhPJxatiKANsJRq2VYLZujp8/EauT0iMdPvFErrhhhaZczlihjPhfo0EGkc/gl1dp5E3iWiHCkY+OO34ugbxqdGuY=
X-Received: by 2002:a2e:b8c9:: with SMTP id s9mr42568ljp.187.1615920402865;
 Tue, 16 Mar 2021 11:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com> <20210208051749.1785246-4-sergey.senozhatsky@gmail.com>
In-Reply-To: <20210208051749.1785246-4-sergey.senozhatsky@gmail.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Tue, 16 Mar 2021 19:46:26 +0100
Message-ID: <CAPybu_10Uz0Eb2U5ZohNV1t0gf98ZBZOa3KFCzdi1RJ0k3c1yQ@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] media: uvcvideo: add UVC 1.5 ROI control
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey

Thanks for the patch
On Mon, Feb 8, 2021 at 6:23 AM Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> From: Sergey Senozhatsky <senozhatsky@chromium.org>
>
> This patch implements parts of UVC 1.5 Region of Interest (ROI)
> control, using the uvcvideo selection API.
>
> There are several things to mention here.
>
> First, UVC 1.5 defines CT_DIGITAL_WINDOW_CONTROL; and ROI rectangle
> coordinates "must be within the current Digital Window as specified
> by the CT_WINDOW control."  (4.2.2.1.20 Digital Region of Interest
> (ROI) Control.) This is not entirely clear if we need to implement
> CT_DIGITAL_WINDOW_CONTROL. ROI is naturally limited by: ROI GET_MIN
> and GET_MAX rectangles. Besides, the H/W that I'm playing with
> implements ROI, but doesn't implement CT_DIGITAL_WINDOW_CONTROL,
> so WINDOW_CONTROL is probably optional.
>
> Second, the patch doesn't implement all of the ROI requests.
> Namely, SEL_TGT_BOUNDS for ROI implements GET_MAX (that is maximal
> ROI rectangle area). GET_MIN is not implemented (as of now) since
> it's not very clear if user space would need such information.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 143 ++++++++++++++++++++++++++++++-
>  1 file changed, 140 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 252136cc885c..71b4577196e5 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1139,14 +1139,60 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
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
> +};

Perhaps __packed; ?

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
> +       case V4L2_SEL_TGT_ROI_DEFAULT:
> +               query = UVC_GET_DEF;
> +               break;
> +       case V4L2_SEL_TGT_ROI_CURRENT:
> +               query = UVC_GET_CUR;
> +               break;
> +       case V4L2_SEL_TGT_ROI_BOUNDS:
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

It is a pity that we have to alloc memory for this  :(.

@Laurent, do you know a better way?

> +       if (!ret) {
> +               sel->r.left     = roi->left;
> +               sel->r.top      = roi->top;
> +               sel->r.width    = roi->right;
> +               sel->r.height   = roi->bottom;
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
> @@ -1173,6 +1219,96 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
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
> +       case V4L2_SEL_TGT_ROI_CURRENT:
> +       case V4L2_SEL_TGT_ROI_DEFAULT:
> +       case V4L2_SEL_TGT_ROI_BOUNDS:
> +               return uvc_ioctl_g_roi_target(file, fh, sel);
> +       }
> +
> +       return -EINVAL;
> +}

Are you sure that there is no lock needed between the control and the
selection API?

> +
> +static bool validate_roi_bounds(struct uvc_streaming *stream,
> +                               struct v4l2_selection *sel)
> +{
> +       bool ok = true;
> +
> +       if (sel->r.left > USHRT_MAX || sel->r.top > USHRT_MAX ||
> +           sel->r.width > USHRT_MAX || sel->r.height > USHRT_MAX)
> +               return false;
> +
> +       /* perhaps also can test against ROI GET_MAX */
> +
> +       mutex_lock(&stream->mutex);
Maybe you should not release this mutex until query_ctrl is done?

> +       if ((u16)sel->r.width > stream->cur_frame->wWidth)
> +               ok = false;
> +       if ((u16)sel->r.height > stream->cur_frame->wHeight)
> +               ok = false;
> +       mutex_unlock(&stream->mutex);
> +
> +       return ok;
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
> +
> +       roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
> +       if (!roi)
> +               return -ENOMEM;
> +
> +       roi->left       = sel->r.left;
> +       roi->top        = sel->r.top;
> +       roi->right      = sel->r.width;
> +       roi->bottom     = sel->r.height;
> +
> +       ret = uvc_query_ctrl(stream->dev, UVC_SET_CUR, 1, stream->dev->intfnum,
> +                            UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
> +                            sizeof(struct uvc_roi_rect));

I think you need to read back from the device the actual value

https://www.kernel.org/doc/html/v4.13/media/uapi/v4l/vidioc-g-selection.html?highlight=vidioc_s_selection
On success the struct v4l2_rect r field contains the adjusted
rectangle. When the parameters are unsuitable the application may
modify the cropping (composing) or image parameters and repeat the
cycle until satisfactory parameters have been negotiated. If
constraints flags have to be violated at then ERANGE is returned. The
error indicates that there exist no rectangle that satisfies the
constraints.


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
> @@ -1533,6 +1669,7 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>         .vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
>         .vidioc_querymenu = uvc_ioctl_querymenu,
>         .vidioc_g_selection = uvc_ioctl_g_selection,
> +       .vidioc_s_selection = uvc_ioctl_s_selection,
>         .vidioc_g_parm = uvc_ioctl_g_parm,
>         .vidioc_s_parm = uvc_ioctl_s_parm,
>         .vidioc_enum_framesizes = uvc_ioctl_enum_framesizes,
> --
> 2.30.0
>


-- 
Ricardo Ribalda
