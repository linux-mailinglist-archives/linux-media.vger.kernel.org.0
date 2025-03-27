Return-Path: <linux-media+bounces-28891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFB5A73FE5
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 22:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A657018985B0
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838671D6DB5;
	Thu, 27 Mar 2025 21:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XNp1vewC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD131624C2
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109502; cv=none; b=ACuGRtEfkNPgEFv4NyuxxgfE/Jl3oUH5FEUwe8iGpCUt+yIg7puPrFkHLQL8Po4sMykd5hSvi434+hXxqshE3KPE9kLbYygQH46duJ+8BLpus/FVfoBXLCiRuuOFBuI89h/euwrPK5iHkEI6+39t3R0Ow6X45pDV6C7RZ//mKyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109502; c=relaxed/simple;
	bh=uwR8/t7sIdsF18i2//AWQRg0Q/ROjnh01+8dTIOWgYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfW/U634Hhbl7jWOWBK+dnc9eM3XH+PVDwTidpHP5ydm2T0NFP5pmdxQx9ci3eFnhQ9kPaYyI0c9ekcz0Ri860Fr4b4Fdl90zRRPcpvArsrV1OgOjZKcDvQ5c+jsKC6ltvYPQKdBj5/tn7nUsWoQubGjVPl6+C7XuNWjCKJSdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XNp1vewC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so1669029e87.0
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 14:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109499; x=1743714299; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v76bWlmH5fEA80rAfHXJpyek2P0fDmnWb9VSJAOO0oo=;
        b=XNp1vewCCzlQIfSHVI3rM/qj21+LTnkdkMLOMG3Cy9shUgawJEeNqKk0pOGvQGEoqS
         lw2XzCDx+QqZPJRg5cExgDbxWPaZ1hx+Xdmmg8uP7Dx65W7biA5hYiBQ0YkXq75HJDX+
         RPgObIBwLEQ2MbZOjCs81uOKJCiiTdrByDjaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109499; x=1743714299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v76bWlmH5fEA80rAfHXJpyek2P0fDmnWb9VSJAOO0oo=;
        b=eBOz+d/PxN1euOQvSU5vLZpTOywubb/tpliWBMvzXfTwUhVPELyXDcYu+kopYag03z
         g9e15R1CBcUItTMDJYxfyBSnqn90gbZQN0vDkp5jMmqC/dzHLZbvqSxNT3q57a40tPmM
         b5BOBz3oipd5PM+JQ4ocl+h5TbTwajI9yzvigDo6CmJHjkt+YR/YixPUR1qNlVv8VCS/
         3encG78X/fx3olEYlqDM1tUA+PaoAwK8U8IpPj78qT3yrXKcB+x6GBfkdDsgsd50Gt3f
         fQyoEa/tikyL50Gb1oH7x5oqNhRxxOIX7Q7LXLe5wRxAMz1kWlY4cs9zUUtnKRCFE5YF
         07cw==
X-Forwarded-Encrypted: i=1; AJvYcCXK08IxocKlKPqhyBEJ89/ob7sJQDBesP6pGQi8AZzIKKgjLpOebNQJHFfXDriauAjR7wAQI0KY/fLrSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdaP2qfb3nyuTz9lk1ZD3W+j823V5r0PJwUp1FbnxkwdXjKx+k
	pdI6nQjzFPVcnt69F20CbY9ZZoRJvWEf4aquHb1vyhqNrW/xtcXRggF5NSZHDzrsfzPZzn3ZLkM
	=
X-Gm-Gg: ASbGncvuYn4ISQ0Lx1/uwkymb2vAjltG7fO9I9J/vUKLYGReHonIrMp8da3kNTOB/I6
	rNBoYhqYEIHoqU6enoe7chzR9CFgZ9zbiqAH15WcV6K2rAp6QMu3o05vi/6fvpnTq8EQZ13l7p+
	i05VXoIMvWIVts3IJKvPNqPE6B5TLJ8Dkj+sOJzwGVS5oK0jvHDMzm26s5rHOUjsV5H7aLTpJkn
	2c3oqFbJEQbKO5HGHAC0TuI6PVhmyJDv2xmY3XuZDm4IBVU/uCMtSETYOPCWSTxMZC7S2Q7qQc6
	BbXeAr2Wnud33kWHDMjdigbQqWGOtr1NaYv2guYnfkIbnjUBOlg6fFJ+7WRLVF9Dqndhc7s0m0V
	PurB++bnFx2S3KF9e6w==
X-Google-Smtp-Source: AGHT+IFVE68Bp/EM8GhrbRPdmBPxieW0nmGUkUru807E+qhMmVSUa0sAoFUPqDDB3G891jt8F2Ls2w==
X-Received: by 2002:a05:6512:3e2a:b0:549:91c6:970d with SMTP id 2adb3069b0e04-54b011ce9a8mr1993190e87.5.1743109498651;
        Thu, 27 Mar 2025 14:04:58 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a21b0sm75667e87.243.2025.03.27.14.04.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 14:04:57 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54993c68ba0so1525824e87.2
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 14:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIppx8VIsYy5KrsNfI1wy37dFHrT44yHkkqFW54SrhEMb9OucBcwwGRiV5iZqGmPovSgt4vgaUv173EA==@vger.kernel.org
X-Received: by 2002:a05:6512:1115:b0:549:8cc9:67d1 with SMTP id
 2adb3069b0e04-54b01221f39mr1798987e87.38.1743109496515; Thu, 27 Mar 2025
 14:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
 <20250303-uvc-granpower-ng-v5-3-a3dfbe29fe91@chromium.org> <20250327175225.GA11416@pendragon.ideasonboard.com>
In-Reply-To: <20250327175225.GA11416@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 22:04:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCu4c6i+m7LJB5-_G2qc_XNguKb=JC1VKMmsRhkU9n7ipg@mail.gmail.com>
X-Gm-Features: AQ5f1JpQcnZzo6ViJh74lTA76yE155gIqk6ykMd5DZAwsQBBs79yYqwkKnDOYhw
Message-ID: <CANiDSCu4c6i+m7LJB5-_G2qc_XNguKb=JC1VKMmsRhkU9n7ipg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 27 Mar 2025 at 18:52, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Mar 03, 2025 at 07:13:40PM +0000, Ricardo Ribalda wrote:
> > Now we call uvc_pm_get/put from the device open/close. This low
> > level of granularity might leave the camera powered on in situations
> > where it is not needed.
> >
> > Increase the granularity by increasing and decreasing the Power
>
> You're decreasing the granularity, not increasing it.

I believe that this patch increases the level of detail. So it is
increasing the granularity... But I might be wrong

>
> > Management counter per ioctl. There are two special cases where the
> > power management outlives the ioctl: async controls and streamon. Handle
> > those cases as well.
> >
> > In a future patch, we will remove the uvc_pm_get/put from open/close.
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c | 23 +++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvcvideo.h |  1 +
> >  3 files changed, 33 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4e58476d305e..47188c7f96c7 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1594,12 +1594,15 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> >
> >               if (ctrl->handle) {
> >                       WARN_ON(!ctrl->handle->pending_async_ctrls);
> > -                     if (ctrl->handle->pending_async_ctrls)
> > +                     if (ctrl->handle->pending_async_ctrls) {
> >                               ctrl->handle->pending_async_ctrls--;
> > +                             uvc_pm_put(handle->chain->dev);
>
> Shouldn't this be
>
>                                 uvc_pm_put(ctrl->handle->chain->dev);
>
> ? In practice it won't make a difference as dev will be the same for
> both, but it seems clearer.

The last line of the function needs to be
uvc_pm_put(handle->chain->dev);

So I'd rather not mix handle-> and ctrl->handle. As you say, both
should be identical.

>
> > +                     }
> >               }
> >
> >               ctrl->handle = new_handle;
> >               handle->pending_async_ctrls++;
> > +             uvc_pm_get(handle->chain->dev);
>
> Similarly, we should use ctrl->handle here too (including for the
> pending_async_ctrls++).
>
> >               return;
> >       }
> >
> > @@ -1611,6 +1614,7 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> >       if (WARN_ON(!handle->pending_async_ctrls))
> >               return;
> >       handle->pending_async_ctrls--;
> > +     uvc_pm_put(handle->chain->dev);
> >  }
> >
> >  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> > @@ -2815,6 +2819,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >       struct uvc_entity *entity;
> > +     int i;
> >
> >       guard(mutex)(&handle->chain->ctrl_mutex);
> >
> > @@ -2829,7 +2834,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >               }
> >       }
> >
> > -     WARN_ON(handle->pending_async_ctrls);
> > +     if (!WARN_ON(handle->pending_async_ctrls))
> > +             return;
> > +
> > +     for (i = 0; i < handle->pending_async_ctrls; i++)
> > +             uvc_pm_put(handle->stream->dev);
> >  }
> >
> >  /*
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index de1e105f7263..1c9ac72be58a 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -691,6 +691,9 @@ static int uvc_v4l2_release(struct file *file)
> >       if (uvc_has_privileges(handle))
> >               uvc_queue_release(&stream->queue);
> >
> > +     if (handle->is_streaming)
> > +             uvc_pm_put(stream->dev);
> > +
> >       /* Release the file handle. */
> >       uvc_dismiss_privileges(handle);
> >       v4l2_fh_del(&handle->vfh);
> > @@ -857,6 +860,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >               return ret;
> >
> >       handle->is_streaming = true;
> > +     uvc_pm_get(stream->dev);
> >
> >       return 0;
> >  }
> > @@ -873,7 +877,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
> >       guard(mutex)(&stream->mutex);
> >
> >       uvc_queue_streamoff(&stream->queue, type);
> > -     handle->is_streaming = false;
> > +     if (handle->is_streaming) {
> > +             handle->is_streaming = false;
> > +             uvc_pm_put(stream->dev);
> > +     }
> >
> >       return 0;
> >  }
> > @@ -1410,6 +1417,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >       void __user *up = compat_ptr(arg);
> >       long ret;
> >
> > +     guard(uvc_pm)(handle->stream->dev);
> > +
> >       switch (cmd) {
> >       case UVCIOC_CTRL_MAP32:
> >               ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> > @@ -1444,6 +1453,16 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> >  }
> >  #endif
> >
> > +static long uvc_v4l2_video_ioctl2(struct file *file,
> > +                               unsigned int cmd, unsigned long arg)
> > +{
> > +     struct uvc_fh *handle = file->private_data;
> > +
> > +     guard(uvc_pm)(handle->stream->dev);
> > +
> > +     return video_ioctl2(file, cmd, arg);
> > +}
> > +
> >  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
> >                   size_t count, loff_t *ppos)
> >  {
> > @@ -1529,7 +1548,7 @@ const struct v4l2_file_operations uvc_fops = {
> >       .owner          = THIS_MODULE,
> >       .open           = uvc_v4l2_open,
> >       .release        = uvc_v4l2_release,
> > -     .unlocked_ioctl = video_ioctl2,
> > +     .unlocked_ioctl = uvc_v4l2_video_ioctl2,
>
> I'd have named this uvc_v4l2_unlocked_ioctl.
Changed in the next version
>
> >  #ifdef CONFIG_COMPAT
> >       .compat_ioctl32 = uvc_v4l2_compat_ioctl32,
> >  #endif
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index fbe3649c7cd6..eb8e374fa4c5 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -766,6 +766,7 @@ void uvc_status_put(struct uvc_device *dev);
> >  /* PM */
> >  int uvc_pm_get(struct uvc_device *dev);
> >  void uvc_pm_put(struct uvc_device *dev);
> > +DEFINE_GUARD(uvc_pm, struct uvc_device *, uvc_pm_get(_T), uvc_pm_put(_T))
> >
> >  /* Controls */
> >  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

