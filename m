Return-Path: <linux-media+bounces-22262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A99DBD21
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B24A2B21B13
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1C81C3F0D;
	Thu, 28 Nov 2024 20:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="chqbx4g/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6051C2DA1
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 20:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732827421; cv=none; b=jPZEQL5DAjqIW2oH7Mm63p1TklnoSPibkjgCysjNnvtXn/TMNWD6eDFj6+lY2zU9pSfgYMC9bL3/41w97Yob816tTYpWVgQycw8nb4J/6yzKJXXvnGtkyGaHZbfIKdPN7RUAQLJ+iug7k4UcP3IQPxArVigfDxvMHEkCP1yGeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732827421; c=relaxed/simple;
	bh=Q4Tfi5Qfqy25dRIC9gKGMmWxUW4s/pk/KYi8auysg9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBdXPtAqrPSu0QmRG8CzucyKAR4QIvrXbhxvcGOkVtqm3Z/Xl0aYl2jCue+TRmHqL5lo/G3zi0V8QtGs+MQZlHRPANiUQF4l/fzyGww+BlbuHsfWUhn10AEEZw++lJsHI4bcYiSkNyqgB5s7aEmFng66f+4vh0pwTGGLlml2/gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=chqbx4g/; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7fbce800ee5so1091063a12.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732827419; x=1733432219; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TrNpATxGIaM9NuuyjevUaLUjPIqRHdht58keqytoI2A=;
        b=chqbx4g/lEwPGinlhMe8SDVBRNiKWCaG6nPPdhYlB2zHkICda14x7QKmGKcDiZBAF0
         mA3oX7I6wA17EASwTRfQTovYLcVPnmAVdiUeZSTu30xSy+R7MhZGAUfwUNKiTT1Sez67
         bkPqyJSWdby4S0TMO/ZOaizHO/8vq3m1huKwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732827419; x=1733432219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrNpATxGIaM9NuuyjevUaLUjPIqRHdht58keqytoI2A=;
        b=aQqBdKmsG9eTVRyMiopqccMOezULhG4ZnoElg8TESiVjQyqpC0nvmLvjCwf7/OdqPx
         VRboomxXQ2jc/OEX7xfs1QDGBnfXqkbmInMIkuUINOrkeQ1X51H9d3cKwsn2jCfeD1q5
         Y9SAlJXo5D8oNqN42taVyRL0i+x65T4ZkEXWbqxPo+3a4zfG5X+c7dZarRZdGoKBwO/8
         Ij4RC3gxCzOuQ45DJlAz2romhEENjPvFri78IaW+jh+ePHsufOVNPOq4YVk4R90RX0Ql
         Tppsp6EUf27KjwcGZL7DJewzVxZQ9Jxfm4iixTrsT9c+HsSC19xi0Rj4VlsRIQfLf6wB
         lBcg==
X-Forwarded-Encrypted: i=1; AJvYcCW7P3vPMIiE4jETFIy9X9rGUrPNZgDUwNlIV/43ydCPubD70Rrlroe2hmyiLVg08ELe11O79FGD84JNQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYcpxUAIKgcKEtESwyqCGasKgwvjfsgxcFogusjVVkOdro1hyP
	CK9xIhSrPhQqewudyD8Isg/WL9C3ERuexh6bKXSijiWLzOLXrBr4tMVhpeSpAkucykqNUmag0Wc
	=
X-Gm-Gg: ASbGncs9tGcVrdlMxCuNa02ydOtMa58ZcGD4PEO7QYeBt97cT4bvcHqdkJA7/Ge8Rzs
	tILyQvskNcTmX6CrHhhkn1srfItwCmzuSW0qMlyw0BX77IbIlHPUQ5bZX+pDyhNfFI6PFoOHw9q
	/Zxp0wxVbu6G9gf18T2WBge0Lmwv/0Zac2ZhZBki2fSW4fXKKQbKB1sYjxdNknbb0zMTeRXX/jk
	20w1LdlhJBA9WWKf+qjPe4Oc4bUotRDLuhyRYc6TNAUsoMtwq3YcuMX69FFyZs404VeVl3Cxw5z
	eTWy/0eSAitlx3Py
X-Google-Smtp-Source: AGHT+IG9W1wyCrtt5xaHfUuDjnvLq42wU9QMoKFIH3vBgwEhWWD7qYBhdNIqHcSbbR61cGXEgl0bEA==
X-Received: by 2002:a05:6a20:9185:b0:1e0:d618:1fe3 with SMTP id adf61e73a8af0-1e0e0b249a3mr11836008637.26.1732827419092;
        Thu, 28 Nov 2024 12:56:59 -0800 (PST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com. [209.85.210.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254181487esm2012690b3a.160.2024.11.28.12.56.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 12:56:58 -0800 (PST)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724e14b90cfso1182366b3a.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:56:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKTXVaoqbQHNrWp2FyoLmEWZqX8HtW9IZDO2amGKIPFnutfNz7rQBADuXwuxA6nw4n9pmOCKjx9R8awg==@vger.kernel.org
X-Received: by 2002:a05:6a00:8c9:b0:71e:6c67:2ebf with SMTP id
 d2e1a72fcca58-72530035bcfmr11554555b3a.11.1732827416684; Thu, 28 Nov 2024
 12:56:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
 <20241127-uvc-fix-async-v1-2-eb8722531b8c@chromium.org> <20241127093506.GE31095@pendragon.ideasonboard.com>
 <CANiDSCtAxfnKbfEBedaDMvMJX49axeENp=gYPF65pKtgt5_XcQ@mail.gmail.com> <20241128205130.GC25731@pendragon.ideasonboard.com>
In-Reply-To: <20241128205130.GC25731@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Nov 2024 21:56:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCutaABNtchncmJcuBC+F43Rh4Yg39D_5FXNPu=1AfPXZA@mail.gmail.com>
Message-ID: <CANiDSCutaABNtchncmJcuBC+F43Rh4Yg39D_5FXNPu=1AfPXZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 21:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Nov 27, 2024 at 11:23:48AM +0100, Ricardo Ribalda wrote:
> > On Wed, 27 Nov 2024 at 10:35, Laurent Pinchart wrote:
> > > On Wed, Nov 27, 2024 at 07:46:11AM +0000, Ricardo Ribalda wrote:
> > > > When an async control is written, we copy a pointer to the file handle
> > > > that started the operation. That pointer will be used when the device is
> > > > done. Which could be anytime in the future.
> > > >
> > > > If the user closes that file descriptor, its structure will be freed,
> > > > and there will be one dangling pointer per pending async control, that
> > > > the driver will try to use.
> > > >
> > > > Clean all the dangling pointers during release().
> > > >
> > > > To avoid adding a performance penalty in the most common case (no async
> > > > operation). A counter has been introduced with some logic to make sure
> > > > that it is properly handled.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++++++++++++++++++++++--
> > > >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> > > >  drivers/media/usb/uvc/uvcvideo.h |  3 +++
> > > >  3 files changed, 43 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 5d3a28edf7f0..51a53ad25e9c 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> > > >       mutex_lock(&chain->ctrl_mutex);
> > > >
> > > >       handle = ctrl->handle;
> > > > -     ctrl->handle = NULL;
> > > > +     if (handle) {
> > > > +             ctrl->handle = NULL;
> > > > +             WARN_ON(!handle->pending_async_ctrls);
> > > > +             if (handle->pending_async_ctrls)
> > > > +                     handle->pending_async_ctrls--;
> > > > +     }
> > >
> > > There's at least one other location where ctrl->handle is reset to NULL.
> >
> > That assignment is not needed. I added a patch to remove it in the next version.
> >
> > > >
> > > >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> > > >               s32 value = __uvc_ctrl_get_value(mapping, data);
> > > > @@ -2050,8 +2055,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > > >       mapping->set(mapping, value,
> > > >               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > > >
> > > > -     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > > > +     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> > > > +             if (!ctrl->handle)
> > > > +                     handle->pending_async_ctrls++;
> > > >               ctrl->handle = handle;
> > >
> > > Is this protected by ctrl_mutex ?
> >
> > yes, uvc_ctrl_set is only called by uvc_ioctl_s_try_ext_ctrls that
> > calls uvc_ctrl_begin
>
> You're right. I think I figured out after writing this part of the
> review, and forgot to delete it. Sorry.
>
> > I will send another patch to add an annotation to the function to make
> > it explicit.
> >
> > > Please be careful about locking and race conditions, taking the time to
> > > double check will help getting your patches merged faster.
> > >
> > > > +     }
> > > >
> > > >       ctrl->dirty = 1;
> > > >       ctrl->modified = 1;
> > > > @@ -2774,6 +2782,34 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> > > >       return 0;
> > > >  }
> > > >
> > > > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > > > +{
> > > > +     struct uvc_entity *entity;
> > > > +
> > > > +     guard(mutex)(&handle->chain->ctrl_mutex);
> > > > +
> > > > +     if (!handle->pending_async_ctrls)
> > > > +             return;
> > > > +
> > > > +     list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> > > > +             int i;
> > >
> > > unsigned int
> > >
> > > I wonder if these days you could event write
> > >
> > >                 for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > >
> > > > +
> > > > +             for (i = 0; i < entity->ncontrols; ++i) {
> > > > +                     struct uvc_control *ctrl = &entity->controls[i];
> > > > +
> > > > +                     if (!ctrl->handle || ctrl->handle != handle)
> > >
> > > Given that handle can't be null, you can write
> > >
> > >                         if (ctrl->handle != handle)
> > >
> > > > +                             continue;
> > > > +
> > > > +                     ctrl->handle = NULL;
> > > > +                     if (WARN_ON(!handle->pending_async_ctrls))
> > > > +                             continue;
> > >
> > > Is this needed ? If we find more controls for this handle than
> > > pending_async_ctrls, decrementing it below 0 will case the WARN_ON() at
> > > the end of this function to trigger, isn't that enough ?
> >
> > I want to know if the warning is triggered because I have too many
> > pending_async_ctrls or too little.
>
> You could also print the value of pending_async_ctrls at the end, it
> would give you that information, and tell you how many you're missing.
> Not a big deal, and I don't expect that warning to be triggered.

The issue is that the variable is unsigned. it will show a weird
number... And making it signed seems incorrect.

I also do not expect it to be triggered. For now I will keep it as is.
If you have a strong opinion against it I will change it.


>
> > > > +                     handle->pending_async_ctrls--;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     WARN_ON(handle->pending_async_ctrls);
> > > > +}
> > > > +
> > > >  /*
> > > >   * Cleanup device controls.
> > > >   */
> > > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > index 97c5407f6603..b425306a3b8c 100644
> > > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
> > > >
> > > >       uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> > > >
> > > > +     uvc_ctrl_cleanup_fh(handle);
> > > > +
> > > >       /* Only free resources if this is a privileged handle. */
> > > >       if (uvc_has_privileges(handle))
> > > >               uvc_queue_release(&stream->queue);
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 07f9921d83f2..2f8a9c48e32a 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -612,6 +612,7 @@ struct uvc_fh {
> > > >       struct uvc_video_chain *chain;
> > > >       struct uvc_streaming *stream;
> > > >       enum uvc_handle_state state;
> > > > +     unsigned int pending_async_ctrls; /* Protected by ctrl_mutex. */
> > >
> > > The kernel does it the other way around, it lists in the documentation
> > > of the lock what data it protects.
> > >
> > > >  };
> > > >
> > > >  struct uvc_driver {
> > > > @@ -797,6 +798,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> > > >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> > > >                     struct uvc_xu_control_query *xqry);
> > > >
> > > > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > > > +
> > > >  /* Utility functions */
> > > >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> > > >                                           u8 epaddr);
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

