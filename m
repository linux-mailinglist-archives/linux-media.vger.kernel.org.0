Return-Path: <linux-media+bounces-28897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A5AA73FF2
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 22:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F54B1B612B3
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1531DFD89;
	Thu, 27 Mar 2025 21:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DxNHHN9S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F163C1D90D9
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 21:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109538; cv=none; b=itCLWPo3dJvbuQn+/YeR68886S/8n3p4O4a9fGCbVtMOt5PKsIPRdyLHyibWXfMYk+szmKz8QERbhhtFq7kP8VCOMlabEu+HQi29fz/4w3tMAkso7KKsSCR7T2JePh5tfuu9KR1L8NSTnoMNo1LrXk3g6aZm/LuTETfvG+dtQNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109538; c=relaxed/simple;
	bh=o2bqwnjVaa+pcIiHxw+CdotzCsYFTHn/UBcy6+qxLCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhPzobJAi/gF9FORMx5lR17iabrNTuujXZlVu0axRzcvUzpFHl1/NEqPSRxObgrSvjJxHb14rBEQ+B14GLc5xihPR3IeJ5RasmPJ7pn1oupNjMAkUDayDNkDdP1CQGmPP4yRV9wZ2ipsgmUnua9JqKahcbHAdXzmxKqkzwJEsVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DxNHHN9S; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549946c5346so1491781e87.2
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 14:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109534; x=1743714334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gP/wJpgzvj2ghIqB9W7sRYUtUSWJTyT/OuFceuuvtno=;
        b=DxNHHN9SZ9b9g4yMJd7O+X+dLHEFta9hKsljqtdpajlANBwcqFhweEo7fAdz98g/mO
         reJ/mkbJcbeldZoDi+mcZngfCbvxpXmHjUHuY3N75kiq5LmaXt0MJCb6UMEevYgxUGCH
         o2Ih6MwmWdg5nuxJGgn67Jlu5GAsu6TMhhtOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109534; x=1743714334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP/wJpgzvj2ghIqB9W7sRYUtUSWJTyT/OuFceuuvtno=;
        b=uTdMCwT5MbKDp+nrHZHaECfRZh30B+CYn8YKMUH9u6eSfKBn9K1QW9qAYFmUzO14rO
         bJ81vJh10065wEZImthOXtsEW4bEiBl+LXlpqvswZ7u2EHJRX0/KrTBFIseMKoz6vXE9
         5Y6vB+8jY1oJnzwGf5Bn1qrujojH+tg3zCaRF/K4WlU8A+0CcZWYxtL5in8quP87ZdFq
         vZ+T9BP5ag6fb9VwM3H/Hr2xHdmcyfgypEJTxeKARGQ7etHpAIziVRi5QAxcZo2o8UP6
         YlzYBTNNKGpaA+gxVnpvJfnmQ+bchGtOlfgnJUkbSY8L4Vj04yoYevFP5NCXAQ7Jp0Ll
         rbQw==
X-Forwarded-Encrypted: i=1; AJvYcCUHwCTde24w8ikjPFTwyHFYlqDg2XBpm07X/qEoY2OZHCc2keHyjy4bXXNRYHj2wJJ3DNTJZma4sY4Xig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj866uM6+dP5taxtR6whZNJl4gJ199OuQgVIwO5taj8fDpACcG
	xW6OaRoxDpyKLEihIy+BoE0xoW/YHCa1wM8tTa4spn5NLjxK5+R5Ojr81+P8gOrEMkeD/ZKOI9D
	TTA==
X-Gm-Gg: ASbGncvB/Pga4N+Nruyfv1IiAr32YtikPLF2WpFwSdL0lOIZdbeyHAQAFHMBfmuMXc5
	IlAtFKFIJcV2wgolmbteOB1L1cxmVOy/dySDQLzd3H0g/Jb9lxchmglTb1avSPaGMMQwHFBD3GY
	HkJE9nTIWjbThKIyw50T+KuruP4ixhyCW4LYonmXkMnlxX/eEaGPKUZtWWpAJB01GA3J8Cs62Xl
	lhmf2bxuLPxc6R+dvwB2gcAYbkX8FIQIQ+pqbgO5MiaToe8y2ZbC7H/sxYjtLqPPFgMs9zBEtOg
	Cm2ofiVqHBypZHTyt4P1xDiDRc8AviA9cFHCZoawIio6+UtoCiUD7BgXVo1//zBZtCugDWQ43N2
	48F8p1LY=
X-Google-Smtp-Source: AGHT+IGop5u55MShk7xuuTzIQMqYQpJ+r0nGFp+EjcI9XyJuxwkUlj8R+200YjKylkvmpD8Ha2iXQg==
X-Received: by 2002:a05:6512:e9b:b0:549:8fd0:bad8 with SMTP id 2adb3069b0e04-54b011d7cc6mr1724540e87.21.1743109533870;
        Thu, 27 Mar 2025 14:05:33 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb0f7sm79661e87.46.2025.03.27.14.05.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 14:05:32 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54954fa61c8so1441465e87.1
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 14:05:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvxMWevOddcZxggxgsItZhcAPN6mJ3oyOXzWf5NIFvyp0F8o5mJwIxJ/9YsGkQENcrhKiZRrrxKqVwZA==@vger.kernel.org
X-Received: by 2002:a05:6512:3d0b:b0:549:8b24:9896 with SMTP id
 2adb3069b0e04-54b011515cfmr2256856e87.0.1743109531886; Thu, 27 Mar 2025
 14:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
 <20250303-uvc-granpower-ng-v5-3-a3dfbe29fe91@chromium.org>
 <20250327175225.GA11416@pendragon.ideasonboard.com> <20250327175706.GC11416@pendragon.ideasonboard.com>
In-Reply-To: <20250327175706.GC11416@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 22:05:19 +0100
X-Gmail-Original-Message-ID: <CANiDSCvCDxqUCzeOOtneesGiBpXeyqHffT0pHrO4_FwBvkn0dA@mail.gmail.com>
X-Gm-Features: AQ5f1JpXhOizlkxjNiecVB_NqQs75rkyEcWjwgsedXTYAg-xKQo85wVZzs4U6tA
Message-ID: <CANiDSCvCDxqUCzeOOtneesGiBpXeyqHffT0pHrO4_FwBvkn0dA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 18:57, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Mar 27, 2025 at 07:52:27PM +0200, Laurent Pinchart wrote:
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > On Mon, Mar 03, 2025 at 07:13:40PM +0000, Ricardo Ribalda wrote:
> > > Now we call uvc_pm_get/put from the device open/close. This low
> > > level of granularity might leave the camera powered on in situations
> > > where it is not needed.
> > >
> > > Increase the granularity by increasing and decreasing the Power
> >
> > You're decreasing the granularity, not increasing it.
> >
> > > Management counter per ioctl. There are two special cases where the
> > > power management outlives the ioctl: async controls and streamon. Handle
> > > those cases as well.
> > >
> > > In a future patch, we will remove the uvc_pm_get/put from open/close.
> > >
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++--
> > >  drivers/media/usb/uvc/uvc_v4l2.c | 23 +++++++++++++++++++++--
> > >  drivers/media/usb/uvc/uvcvideo.h |  1 +
> > >  3 files changed, 33 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 4e58476d305e..47188c7f96c7 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1594,12 +1594,15 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > >
> > >             if (ctrl->handle) {
> > >                     WARN_ON(!ctrl->handle->pending_async_ctrls);
> > > -                   if (ctrl->handle->pending_async_ctrls)
> > > +                   if (ctrl->handle->pending_async_ctrls) {
> > >                             ctrl->handle->pending_async_ctrls--;
> > > +                           uvc_pm_put(handle->chain->dev);
> >
> > Shouldn't this be
> >
> >                               uvc_pm_put(ctrl->handle->chain->dev);
> >
> > ? In practice it won't make a difference as dev will be the same for
> > both, but it seems clearer.
> >
> > > +                   }
> > >             }
> > >
> > >             ctrl->handle = new_handle;
> > >             handle->pending_async_ctrls++;
> > > +           uvc_pm_get(handle->chain->dev);
> >
> > Similarly, we should use ctrl->handle here too (including for the
> > pending_async_ctrls++).
> >
> > >             return;
> > >     }
> > >
> > > @@ -1611,6 +1614,7 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > >     if (WARN_ON(!handle->pending_async_ctrls))
> > >             return;
> > >     handle->pending_async_ctrls--;
> > > +   uvc_pm_put(handle->chain->dev);
> > >  }
> > >
> > >  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> > > @@ -2815,6 +2819,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> > >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > >  {
> > >     struct uvc_entity *entity;
> > > +   int i;
> > >
> > >     guard(mutex)(&handle->chain->ctrl_mutex);
> > >
> > > @@ -2829,7 +2834,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > >             }
> > >     }
> > >
> > > -   WARN_ON(handle->pending_async_ctrls);
> > > +   if (!WARN_ON(handle->pending_async_ctrls))
> > > +           return;
> > > +
> > > +   for (i = 0; i < handle->pending_async_ctrls; i++)
> > > +           uvc_pm_put(handle->stream->dev);
> > >  }
> > >
> > >  /*
> > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > index de1e105f7263..1c9ac72be58a 100644
> > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > @@ -691,6 +691,9 @@ static int uvc_v4l2_release(struct file *file)
> > >     if (uvc_has_privileges(handle))
> > >             uvc_queue_release(&stream->queue);
> > >
> > > +   if (handle->is_streaming)
> > > +           uvc_pm_put(stream->dev);
> > > +
> > >     /* Release the file handle. */
> > >     uvc_dismiss_privileges(handle);
> > >     v4l2_fh_del(&handle->vfh);
> > > @@ -857,6 +860,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> > >             return ret;
> > >
> > >     handle->is_streaming = true;
> > > +   uvc_pm_get(stream->dev);
>
> Another comment: shouldn't you handle the return value (here and
> elsewhere, including where you use guards) ?

Good point... I guess I got excited trying to use the guards :)
>
> > >
> > >     return 0;
> > >  }
> > > @@ -873,7 +877,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
> > >     guard(mutex)(&stream->mutex);
> > >
> > >     uvc_queue_streamoff(&stream->queue, type);
> > > -   handle->is_streaming = false;
> > > +   if (handle->is_streaming) {
> > > +           handle->is_streaming = false;
> > > +           uvc_pm_put(stream->dev);
> > > +   }
> > >
> > >     return 0;
> > >  }
> > > @@ -1410,6 +1417,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> > >     void __user *up = compat_ptr(arg);
> > >     long ret;
> > >
> > > +   guard(uvc_pm)(handle->stream->dev);
> > > +
> > >     switch (cmd) {
> > >     case UVCIOC_CTRL_MAP32:
> > >             ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> > > @@ -1444,6 +1453,16 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
> > >  }
> > >  #endif
> > >
> > > +static long uvc_v4l2_video_ioctl2(struct file *file,
> > > +                             unsigned int cmd, unsigned long arg)
> > > +{
> > > +   struct uvc_fh *handle = file->private_data;
> > > +
> > > +   guard(uvc_pm)(handle->stream->dev);
> > > +
> > > +   return video_ioctl2(file, cmd, arg);
> > > +}
> > > +
> > >  static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
> > >                 size_t count, loff_t *ppos)
> > >  {
> > > @@ -1529,7 +1548,7 @@ const struct v4l2_file_operations uvc_fops = {
> > >     .owner          = THIS_MODULE,
> > >     .open           = uvc_v4l2_open,
> > >     .release        = uvc_v4l2_release,
> > > -   .unlocked_ioctl = video_ioctl2,
> > > +   .unlocked_ioctl = uvc_v4l2_video_ioctl2,
> >
> > I'd have named this uvc_v4l2_unlocked_ioctl.
> >
> > >  #ifdef CONFIG_COMPAT
> > >     .compat_ioctl32 = uvc_v4l2_compat_ioctl32,
> > >  #endif
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index fbe3649c7cd6..eb8e374fa4c5 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -766,6 +766,7 @@ void uvc_status_put(struct uvc_device *dev);
> > >  /* PM */
> > >  int uvc_pm_get(struct uvc_device *dev);
> > >  void uvc_pm_put(struct uvc_device *dev);
> > > +DEFINE_GUARD(uvc_pm, struct uvc_device *, uvc_pm_get(_T), uvc_pm_put(_T))
> > >
> > >  /* Controls */
> > >  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

