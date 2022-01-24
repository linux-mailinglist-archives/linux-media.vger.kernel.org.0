Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A58D498434
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243307AbiAXQEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243380AbiAXQEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:04:08 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0597C06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 08:04:07 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id o12so22677084eju.13
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 08:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kf0SWhN+o+NjrRK+FofhXbWRrzxB3Iu5g0ym7SFoUqI=;
        b=YK+aU8qLsLCjicPYGz47Ii6lMeKX2/wRX6PVEqSCbPoSZX+yIqf2v7jON50Fb8MGzl
         Al9OMKEY3JVI9H1Ui7Lux350Vk2xuCRGvrBSFF6eGAkURt/0N8tiYOJfGh1vcAy6cNoP
         32dXFwBkGrq1CrKlfubFlOtQZzfbQscIU23TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kf0SWhN+o+NjrRK+FofhXbWRrzxB3Iu5g0ym7SFoUqI=;
        b=PiY4dGOHgjC8Ns76kvJNy5dz7f44pfa8+QJPNPoygHEbSNhyGw0pCnLcW/6OdsEAQv
         CHSmw3WJ8Dj685uGtzs321bG6YVDlN34dWn9At6lxfew8kSs5v9G7TNqDK4IoDZTKy+P
         UhqryDADaOJ8TNKMWmCGk7ZGb8G3YvnUam2fccosJ5ulPpGbhCGZhgah1U3uA4uhDSN4
         xkYeHfVgLgMrfwC030g718z59OhaQoyDKaq0HfAVTL52UEnCWNNsyi7+qrkaeI55tTbc
         9C0Afp1rfwNN+/XJjrlDwgfs9AQJfyA9E6N4U76TVCAKuwgTWeumkqLv1PK+3pgM4qTM
         lKaQ==
X-Gm-Message-State: AOAM532EL5Zo+Ha52HEwbAvBWJ0AEH31s6y52wW+zrIvEXn1EWRbj6O/
        BRJM1LfTR1aW3iq63k90sSfGt3PvGn1Q1A==
X-Google-Smtp-Source: ABdhPJz8yTNgcdHfRCiR9zzi2sCmcr6C7Wo7v6BiIXy4dgsP55luSPmzI3B6phKeOwHIBsgqGA9gaA==
X-Received: by 2002:a17:907:3fa1:: with SMTP id hr33mr10318371ejc.239.1643040245866;
        Mon, 24 Jan 2022 08:04:05 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id de43sm5145679ejc.12.2022.01.24.08.04.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 08:04:05 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a8so22613822ejc.8
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 08:04:05 -0800 (PST)
X-Received: by 2002:a17:907:7f9e:: with SMTP id qk30mr439731ejc.25.1643040244856;
 Mon, 24 Jan 2022 08:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20220124144539.180822-1-ribalda@chromium.org> <Ye7CXovFQMm9q4F6@pendragon.ideasonboard.com>
In-Reply-To: <Ye7CXovFQMm9q4F6@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 24 Jan 2022 17:03:53 +0100
X-Gmail-Original-Message-ID: <CANiDSCuFWy5o-fN6Wo+ULAXjVOrQ9w83m1JF7E-fWoHU1H9G_g@mail.gmail.com>
Message-ID: <CANiDSCuFWy5o-fN6Wo+ULAXjVOrQ9w83m1JF7E-fWoHU1H9G_g@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Do power management granularly
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, 24 Jan 2022 at 16:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Jan 24, 2022 at 03:45:39PM +0100, Ricardo Ribalda wrote:
> > Instead of suspending/resume the USB device at open()/close(), do it
> > when the device is actually used.
> >
> > This way we can reduce the power consumption when a service is holding
> > the video device and leaving it in an idle state.
>
> Won't this prevent receiving button events ?

Good catch :), I did not think of those.

I have disabled the optimization in those cases in v2.

Thanks!

>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 191 +++++++++++++++++++++++++------
> >  drivers/media/usb/uvc/uvcvideo.h |   1 +
> >  2 files changed, 156 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 711556d13d03..4fcfc9a24e7f 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -25,6 +25,55 @@
> >
> >  #include "uvcvideo.h"
> >
> > +/* ------------------------------------------------------------------------
> > + * UVC power management
> > + */
> > +
> > +static int uvc_pm_get(struct uvc_streaming *stream)
> > +{
> > +     int ret = 0;
> > +
> > +     if (!video_is_registered(&stream->vdev))
> > +             return -ENODEV;
> > +
> > +     /*
> > +      * We cannot hold dev->lock when calling autopm_get_interface.
> > +      */
> > +     ret = usb_autopm_get_interface(stream->dev->intf);
> > +     if (ret)
> > +             return ret;
> > +
> > +     mutex_lock(&stream->dev->lock);
> > +     if (!stream->dev->users)
> > +             ret = uvc_status_start(stream->dev, GFP_KERNEL);
> > +     if (!ret)
> > +             stream->dev->users++;
> > +     mutex_unlock(&stream->dev->lock);
> > +
> > +     if (ret)
> > +             usb_autopm_put_interface(stream->dev->intf);
> > +
> > +     return ret;
> > +}
> > +
> > +static void uvc_pm_put(struct uvc_streaming *stream)
> > +{
> > +     if (!video_is_registered(&stream->vdev))
> > +             return;
> > +
> > +     mutex_lock(&stream->dev->lock);
> > +     if (WARN_ON(!stream->dev->users)) {
> > +             mutex_unlock(&stream->dev->lock);
> > +             return;
> > +     }
> > +     stream->dev->users--;
> > +     if (!stream->dev->users)
> > +             uvc_status_stop(stream->dev);
> > +     mutex_unlock(&stream->dev->lock);
> > +
> > +     usb_autopm_put_interface(stream->dev->intf);
> > +}
> > +
> >  /* ------------------------------------------------------------------------
> >   * UVC ioctls
> >   */
> > @@ -251,8 +300,14 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> >                       stream->ctrl.dwMaxVideoFrameSize;
> >
> >       /* Probe the device. */
> > +     ret = uvc_pm_get(stream);
> > +     if (ret) {
> > +             mutex_unlock(&stream->mutex);
> > +             goto done;
> > +     }
> >       ret = uvc_probe_video(stream, probe);
> >       mutex_unlock(&stream->mutex);
> > +     uvc_pm_put(stream);
> >       if (ret < 0)
> >               goto done;
> >
> > @@ -464,7 +519,13 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
> >       }
> >
> >       /* Probe the device with the new settings. */
> > +     ret = uvc_pm_get(stream);
> > +     if (ret) {
> > +             mutex_unlock(&stream->mutex);
> > +             return ret;
> > +     }
> >       ret = uvc_probe_video(stream, &probe);
> > +     uvc_pm_put(stream);
> >       if (ret < 0) {
> >               mutex_unlock(&stream->mutex);
> >               return ret;
> > @@ -555,35 +616,14 @@ static int uvc_v4l2_open(struct file *file)
> >  {
> >       struct uvc_streaming *stream;
> >       struct uvc_fh *handle;
> > -     int ret = 0;
> >
> >       stream = video_drvdata(file);
> >       uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> >
> > -     ret = usb_autopm_get_interface(stream->dev->intf);
> > -     if (ret < 0)
> > -             return ret;
> > -
> >       /* Create the device handle. */
> >       handle = kzalloc(sizeof(*handle), GFP_KERNEL);
> > -     if (handle == NULL) {
> > -             usb_autopm_put_interface(stream->dev->intf);
> > +     if (!handle)
> >               return -ENOMEM;
> > -     }
> > -
> > -     mutex_lock(&stream->dev->lock);
> > -     if (stream->dev->users == 0) {
> > -             ret = uvc_status_start(stream->dev, GFP_KERNEL);
> > -             if (ret < 0) {
> > -                     mutex_unlock(&stream->dev->lock);
> > -                     usb_autopm_put_interface(stream->dev->intf);
> > -                     kfree(handle);
> > -                     return ret;
> > -             }
> > -     }
> > -
> > -     stream->dev->users++;
> > -     mutex_unlock(&stream->dev->lock);
> >
> >       v4l2_fh_init(&handle->vfh, &stream->vdev);
> >       v4l2_fh_add(&handle->vfh);
> > @@ -606,6 +646,9 @@ static int uvc_v4l2_release(struct file *file)
> >       if (uvc_has_privileges(handle))
> >               uvc_queue_release(&stream->queue);
> >
> > +     if (handle->is_streaming)
> > +             uvc_pm_put(stream);
> > +
> >       /* Release the file handle. */
> >       uvc_dismiss_privileges(handle);
> >       v4l2_fh_del(&handle->vfh);
> > @@ -613,12 +656,6 @@ static int uvc_v4l2_release(struct file *file)
> >       kfree(handle);
> >       file->private_data = NULL;
> >
> > -     mutex_lock(&stream->dev->lock);
> > -     if (--stream->dev->users == 0)
> > -             uvc_status_stop(stream->dev);
> > -     mutex_unlock(&stream->dev->lock);
> > -
> > -     usb_autopm_put_interface(stream->dev->intf);
> >       return 0;
> >  }
> >
> > @@ -842,7 +879,21 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >               return -EBUSY;
> >
> >       mutex_lock(&stream->mutex);
> > +     if (!handle->is_streaming) {
> > +             ret = uvc_pm_get(stream);
> > +             if (ret)
> > +                     goto unlock;
> > +     }
> > +
> >       ret = uvc_queue_streamon(&stream->queue, type);
> > +
> > +     if (ret && !handle->is_streaming)
> > +             uvc_pm_put(stream);
> > +
> > +     if (!ret)
> > +             handle->is_streaming = true;
> > +
> > +unlock:
> >       mutex_unlock(&stream->mutex);
> >
> >       return ret;
> > @@ -859,6 +910,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
> >
> >       mutex_lock(&stream->mutex);
> >       uvc_queue_streamoff(&stream->queue, type);
> > +     if (handle->is_streaming) {
> > +             handle->is_streaming = false;
> > +             uvc_pm_put(stream);
> > +     }
> >       mutex_unlock(&stream->mutex);
> >
> >       return 0;
> > @@ -909,6 +964,7 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_video_chain *chain = handle->chain;
> > +     struct uvc_streaming *stream = handle->stream;
> >       u8 *buf;
> >       int ret;
> >
> > @@ -922,9 +978,16 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
> >       if (!buf)
> >               return -ENOMEM;
> >
> > +     ret = uvc_pm_get(stream);
> > +     if (ret) {
> > +             kfree(buf);
> > +             return ret;
> > +     }
> > +
> >       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, chain->selector->id,
> >                            chain->dev->intfnum,  UVC_SU_INPUT_SELECT_CONTROL,
> >                            buf, 1);
> > +     uvc_pm_put(stream);
> >       if (!ret)
> >               *input = *buf - 1;
> >
> > @@ -937,6 +1000,7 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_video_chain *chain = handle->chain;
> > +     struct uvc_streaming *stream = handle->stream;
> >       u8 *buf;
> >       int ret;
> >
> > @@ -958,10 +1022,17 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
> >       if (!buf)
> >               return -ENOMEM;
> >
> > +     ret = uvc_pm_get(stream);
> > +     if (ret) {
> > +             kfree(buf);
> > +             return ret;
> > +     }
> > +
> >       *buf = input + 1;
> >       ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, chain->selector->id,
> >                            chain->dev->intfnum, UVC_SU_INPUT_SELECT_CONTROL,
> >                            buf, 1);
> > +     uvc_pm_put(stream);
> >       kfree(buf);
> >
> >       return ret;
> > @@ -972,8 +1043,15 @@ static int uvc_ioctl_queryctrl(struct file *file, void *fh,
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_video_chain *chain = handle->chain;
> > +     struct uvc_streaming *stream = handle->stream;
> > +     int ret;
> >
> > -     return uvc_query_v4l2_ctrl(chain, qc);
> > +     ret = uvc_pm_get(stream);
> > +     if (ret)
> > +             return ret;
> > +     ret = uvc_query_v4l2_ctrl(chain, qc);
> > +     uvc_pm_put(stream);
> > +     return ret;
> >  }
> >
> >  static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
> > @@ -981,10 +1059,15 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_video_chain *chain = handle->chain;
> > +     struct uvc_streaming *stream = handle->stream;
> >       struct v4l2_queryctrl qc = { qec->id };
> >       int ret;
> >
> > +     ret = uvc_pm_get(stream);
> > +     if (ret)
> > +             return ret;
> >       ret = uvc_query_v4l2_ctrl(chain, &qc);
> > +     uvc_pm_put(stream);
> >       if (ret)
> >               return ret;
> >
> > @@ -1030,6 +1113,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_video_chain *chain = handle->chain;
> > +     struct uvc_streaming *stream = handle->stream;
> >       struct v4l2_ext_control *ctrl = ctrls->controls;
> >       unsigned int i;
> >       int ret;
> > @@ -1054,22 +1138,30 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
> >               return 0;
> >       }
> >
> > +     ret = uvc_pm_get(stream);
> > +     if (ret)
> > +             return ret;
> >       ret = uvc_ctrl_begin(chain);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> > +             uvc_pm_put(stream);
> >               return ret;
> > +     }
> >
> >       for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> >               ret = uvc_ctrl_get(chain, ctrl);
> >               if (ret < 0) {
> >                       uvc_ctrl_rollback(handle);
> >                       ctrls->error_idx = i;
> > +                     uvc_pm_put(stream);
> >                       return ret;
> >               }
> >       }
> >
> >       ctrls->error_idx = 0;
> >
> > -     return uvc_ctrl_rollback(handle);
> > +     ret = uvc_ctrl_rollback(handle);
> > +     uvc_pm_put(stream);
> > +     return ret;
> >  }
> >
> >  static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
> > @@ -1078,6 +1170,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
> >  {
> >       struct v4l2_ext_control *ctrl = ctrls->controls;
> >       struct uvc_video_chain *chain = handle->chain;
> > +     struct uvc_streaming *stream = handle->stream;
> >       unsigned int i;
> >       int ret;
> >
> > @@ -1085,9 +1178,15 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
> >       if (ret < 0)
> >               return ret;
> >
> > +     ret = uvc_pm_get(stream);
> > +     if (ret)
> > +             return ret;
> > +
> >       ret = uvc_ctrl_begin(chain);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> > +             uvc_pm_put(stream);
> >               return ret;
> > +     }
> >
> >       for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> >               ret = uvc_ctrl_set(handle, ctrl);
> > @@ -1095,6 +1194,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
> >                       uvc_ctrl_rollback(handle);
> >                       ctrls->error_idx = ioctl == VIDIOC_S_EXT_CTRLS ?
> >                                                   ctrls->count : i;
> > +                     uvc_pm_put(stream);
> >                       return ret;
> >               }
> >       }
> > @@ -1102,9 +1202,12 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
> >       ctrls->error_idx = 0;
> >
> >       if (ioctl == VIDIOC_S_EXT_CTRLS)
> > -             return uvc_ctrl_commit(handle, ctrls);
> > +             ret = uvc_ctrl_commit(handle, ctrls);
> >       else
> > -             return uvc_ctrl_rollback(handle);
> > +             ret = uvc_ctrl_rollback(handle);
> > +
> > +     uvc_pm_put(stream);
> > +     return ret;
> >  }
> >
> >  static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
> > @@ -1119,8 +1222,16 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
> >                                  struct v4l2_ext_controls *ctrls)
> >  {
> >       struct uvc_fh *handle = fh;
> > +     struct uvc_streaming *stream = handle->stream;
> > +     int ret;
> > +
> > +     ret = uvc_pm_get(stream);
> > +     if (ret)
> > +             return ret;
> > +     ret = uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
> > +     uvc_pm_put(stream);
> >
> > -     return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
> > +     return ret;
> >  }
> >
> >  static int uvc_ioctl_querymenu(struct file *file, void *fh,
> > @@ -1128,8 +1239,16 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_video_chain *chain = handle->chain;
> > +     struct uvc_streaming *stream = handle->stream;
> > +     int ret;
> >
> > -     return uvc_query_v4l2_menu(chain, qm);
> > +     ret = uvc_pm_get(stream);
> > +     if (ret)
> > +             return ret;
> > +     ret = uvc_query_v4l2_menu(chain, qm);
> > +     uvc_pm_put(stream);
> > +
> > +     return ret;
> >  }
> >
> >  static int uvc_ioctl_g_selection(struct file *file, void *fh,
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 143230b3275b..5958b2a54dab 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -720,6 +720,7 @@ enum uvc_handle_state {
> >
> >  struct uvc_fh {
> >       struct v4l2_fh vfh;
> > +     bool is_streaming;
> >       struct uvc_video_chain *chain;
> >       struct uvc_streaming *stream;
> >       enum uvc_handle_state state;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
