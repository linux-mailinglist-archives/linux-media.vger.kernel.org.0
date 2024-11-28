Return-Path: <linux-media+bounces-22274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38E9DBD7F
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 23:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33590282345
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5991C461A;
	Thu, 28 Nov 2024 22:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q1/hgPbX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097891C2439
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732832744; cv=none; b=DVWqVXNN7E6uOy7c4Al0qGJOwEBIyAwXPg9xfN0EFUlxTHP6zewJzloUYB+X+frcZsJEUEwfH9cmgy52xZbzKc6vXwveF7wV/R4URZ0pFE12sslLor10/CEUhs06wQqNesrXFhKlj9I4oMosIEazRrNypfQnq/imWDkmtmCyjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732832744; c=relaxed/simple;
	bh=mMtRrLQO53zORy9ZIEwuUhpvEMU3X/83C/CmDJGNnaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+mihoMSqRizz5erSN0Pbrd55wMX1PDVofobaLclQT3MkJVDPno7SFBd3dvOpGz5QA/HvhGfzCx60fp8eBAxSTa1cWa0qeIUAjy9i1UbQL7b2isSYqcrH9q1pH4gLEXzFqF+XGnCUXHNqkESdZDFp5DfMtfSAtnDqdBX/EqJoG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q1/hgPbX; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-724f41d550cso743714b3a.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 14:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732832742; x=1733437542; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ut8x+sUZ+v+YLgFB8VOlkYtRBt/+qI6uve6IatC5zR8=;
        b=Q1/hgPbXDwX8K3b7Sx2x7kMe+ddTx0/zUsbXmrlWEWl/m9WpOW1qwpjlvlrJ//YbAD
         mrqxviQM31yzX+WHp1zZeUugXHQ2QuzSTwtoTPos9NgRskZ4nB3b/s5Br28YdKSiMDgO
         +AUvtSTDglhirM+p7l68/k9c14oZspUO9drKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732832742; x=1733437542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ut8x+sUZ+v+YLgFB8VOlkYtRBt/+qI6uve6IatC5zR8=;
        b=R7SRTTM1K6tI2epuraU26aMrNkK1Iwi1HpPi9gmO3FZJ/oannC+Ygd9McqTR7pbElZ
         cCtM9xZ2OcLLbt0UpsrsMADPL06TIzikmC/FHUrH0aGGMg2wJKyXGF0FgzNhqkBsa7WL
         ys2dGbyaOeU6IsLZqT4U5YynuvlxrlTFYvX172CdOt93/gQE2rTnb6btYsbxqJ3sGa3w
         03OmWQFfCWAeCSl/zecy2bFilbKEq7sAfFHg8yxoEtfo5B3sxJV/qtCfv/bMwJ/FCEBG
         OeoVb6M+tOqrymqMFV2JK437Z2Tfu7WIjD14Z/d36qMI0ygdM/tU/Aj5QNNkP/+sGymT
         vshQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVTDZEFGm+RRqg+lRSdOSAOz2FMuN6qZgnRSfeKzhc9N6ApyQTLn5JIG/gXDqgYV6SEZRSrjybtCscmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4QD5cWMKOva7nsfWpx0owDo/7J13BFYSE8/CAFuEOxecWHnhi
	hC7ZpWjX4COe3JxDpCHTP/9aIk2PdtY4Oji9MaK09mURevRmGHmQmVZ999UQzQ+dISWGeawJ9L8
	=
X-Gm-Gg: ASbGncvhkfyvNRdMNV764rB4y/zroPX7o/OKcf5Gz1eRHdETWHKARlmdSX/mxkFNj0h
	evHc9KsL5Hnyw11t4xF4rB78GOPfWoH/cyh1KgBlz9g5VTZIpOh4qdjYc2fjUEMrspJplmN4w8p
	CnFfR1W+0oRmEKKlw60eAi8q9dKm/bJ3tjAxyO7qs8SlRlRz0pyDk635VETzrugkec7y2cswKRj
	1UZPWMSyZ1bPPNiPQlTrxVBd+zREnj5F06DBuULmGbCLPuAiXgEiqSCZNzO3j2QNK7EXi+sI/Ok
	h8tyKP2zXL3L
X-Google-Smtp-Source: AGHT+IHn+oeCFKkVNiv98qgh1GRbpHGUcDzXi00Sgmvu9GGMuZ2s73Iugy5JRcLc8PJpT27JA+yfTg==
X-Received: by 2002:a05:6a00:1789:b0:725:a65:d194 with SMTP id d2e1a72fcca58-72530077bcamr11521555b3a.14.1732832741097;
        Thu, 28 Nov 2024 14:25:41 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f634sm2097012b3a.59.2024.11.28.14.25.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 14:25:38 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee4f78493aso187435a91.3
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 14:25:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXflzFxvM/vxzx0DbeUSo9wNZVb06hkINZ1d++WXBF6ylmho7DhmikxCXwQxoV4/bfLo0klf3VlMvU6Aw==@vger.kernel.org
X-Received: by 2002:a17:90b:35cb:b0:2ea:6f19:180b with SMTP id
 98e67ed59e1d1-2ee097cf0d5mr9964775a91.36.1732832737842; Thu, 28 Nov 2024
 14:25:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-1-510aab9570dd@chromium.org> <20241128221649.GE25731@pendragon.ideasonboard.com>
In-Reply-To: <20241128221649.GE25731@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Nov 2024 23:25:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCuEPPoLjukjoO_BVVsRL22kebUnCxo3eTKJqMRg6J0fSw@mail.gmail.com>
Message-ID: <CANiDSCuEPPoLjukjoO_BVVsRL22kebUnCxo3eTKJqMRg6J0fSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 23:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Nov 27, 2024 at 12:14:49PM +0000, Ricardo Ribalda wrote:
> > When an async control is written, we copy a pointer to the file handle
> > that started the operation. That pointer will be used when the device is
> > done. Which could be anytime in the future.
> >
> > If the user closes that file descriptor, its structure will be freed,
> > and there will be one dangling pointer per pending async control, that
> > the driver will try to use.
> >
> > Clean all the dangling pointers during release().
> >
> > To avoid adding a performance penalty in the most common case (no async
> > operation). A counter has been introduced with some logic to make sure
>
> s/). A/), a/
>
> > that it is properly handled.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 38 ++++++++++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> >  drivers/media/usb/uvc/uvcvideo.h |  8 +++++++-
> >  3 files changed, 45 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4fe26e82e3d1..b6af4ff92cbd 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>
> How about adding

SGTM.

>
> static void uvc_ctrl_set_handle(struct uvc_control *ctrl, uvc_fh *handle)
> {
>         if (handle) {
>                 if (!ctrl->handle)
>                         handle->pending_async_ctrls++;
>                 ctrl->handle = handle;
>         } else if (ctrl->handle) {
>                 ctrl->handle = NULL;
>                 if (!WARN_ON(!handle->pending_async_ctrls))
Unless you think otherwise. I will make this:

WARN_ON(!handle->pending_async_ctrls);
if (handle->pending_async_ctrls)
   handle->pending_async_ctrls--;

The double negation is difficult to read. I am pretty sure the
compiler will do its magic and merge the two checks.
>                         handle->pending_async_ctrls--;
>         }
> }
>
> >       mutex_lock(&chain->ctrl_mutex);
> >
> >       handle = ctrl->handle;
> > -     ctrl->handle = NULL;
> > +     if (handle) {
> > +             ctrl->handle = NULL;
> > +             WARN_ON(!handle->pending_async_ctrls);
> > +             if (handle->pending_async_ctrls)
> > +                     handle->pending_async_ctrls--;
> > +     }
>
> This would become
>
>         handle = ctrl->handle;
>         uvc_ctrl_set_handle(ctrl, NULL);
>
> >
> >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> >               s32 value = __uvc_ctrl_get_value(mapping, data);
> > @@ -2046,8 +2051,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >       mapping->set(mapping, value,
> >               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> >
> > -     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > +     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> > +             if (!ctrl->handle)
> > +                     handle->pending_async_ctrls++;
> >               ctrl->handle = handle;
> > +     }
>
> Here
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>                 uvc_ctrl_set_handle(ctrl, handle);
>
> >
> >       ctrl->dirty = 1;
> >       ctrl->modified = 1;
> > @@ -2770,6 +2778,32 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >       return 0;
> >  }
> >
> > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > +{
> > +     struct uvc_entity *entity;
> > +
> > +     guard(mutex)(&handle->chain->ctrl_mutex);
> > +
> > +     if (!handle->pending_async_ctrls)
> > +             return;
> > +
> > +     list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> > +             for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > +                     struct uvc_control *ctrl = &entity->controls[i];
> > +
> > +                     if (ctrl->handle != handle)
> > +                             continue;
> > +
> > +                     ctrl->handle = NULL;
> > +                     if (WARN_ON(!handle->pending_async_ctrls))
> > +                             continue;
> > +                     handle->pending_async_ctrls--;
>
> And here
>
>                         uvc_ctrl_set_handle(ctrl, NULL);
>
> It seems less error-prone to centralize the logic. I'd add a
> lockdep_assert() in uvc_ctrl_set_handle(), but there's no easy access to
> the chain there.
>
> > +             }
> > +     }
> > +
> > +     WARN_ON(handle->pending_async_ctrls);
> > +}
> > +
> >  /*
> >   * Cleanup device controls.
> >   */
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 97c5407f6603..b425306a3b8c 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
> >
> >       uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> >
> > +     uvc_ctrl_cleanup_fh(handle);
> > +
> >       /* Only free resources if this is a privileged handle. */
> >       if (uvc_has_privileges(handle))
> >               uvc_queue_release(&stream->queue);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 07f9921d83f2..c68659b70221 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -337,7 +337,10 @@ struct uvc_video_chain {
> >       struct uvc_entity *processing;          /* Processing unit */
> >       struct uvc_entity *selector;            /* Selector unit */
> >
> > -     struct mutex ctrl_mutex;                /* Protects ctrl.info */
> > +     struct mutex ctrl_mutex;                /*
> > +                                              * Protects ctrl.info and
> > +                                              * uvc_fh.pending_async_ctrls
> > +                                              */
> >
> >       struct v4l2_prio_state prio;            /* V4L2 priority state */
> >       u32 caps;                               /* V4L2 chain-wide caps */
> > @@ -612,6 +615,7 @@ struct uvc_fh {
> >       struct uvc_video_chain *chain;
> >       struct uvc_streaming *stream;
> >       enum uvc_handle_state state;
> > +     unsigned int pending_async_ctrls;
> >  };
> >
> >  struct uvc_driver {
> > @@ -797,6 +801,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >                     struct uvc_xu_control_query *xqry);
> >
> > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > +
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> >                                           u8 epaddr);
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

