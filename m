Return-Path: <linux-media+bounces-22388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA79DF235
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 18:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C418EB21668
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 17:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D602C1A38E1;
	Sat, 30 Nov 2024 17:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QqqfJBMA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F561FCE
	for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 17:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732986930; cv=none; b=LH3/YjpU0EhnonEZJv1C+Ii7xuxVCtLR0rL8XzB0GOKnwV1tvbL6879yphfioRZBZVLScSXFWN+osL54caN7B33xfEgH9fbNRCb/qU22mk1GxkLVNVQgIO44Rt02+Xqk1PJLkWTJqSN8l3saf7HTEiTyQCt9shD7MMSw4b4TWhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732986930; c=relaxed/simple;
	bh=j986YlEGWUzjWl5L6NnzIUZjyJzBtCOf2hbzQfSlLg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gl7Rs7s26/qqm6DrowhOO+rPAzFmryU9w69IJbQ2xBNOExaqqovbHslkXAWj3eAiA0JfylCkQl34tW/4zvTuSXMmXiv5d8u0Za637/4AFnJfEh1W0jNif78hGIjW/pjqfPouiGplRKpWBOdma2v8DTLqq7uAmgn65KmvOczWfrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QqqfJBMA; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-724e113c821so2593457b3a.3
        for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 09:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732986928; x=1733591728; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns8sXTy5NQlVVpEAKiZMIsA11vqUUUuUQ2j/9bwZtrk=;
        b=QqqfJBMAoUxY6Jg24kHjU9ownfw0ZoYHzM6aAbGzp2a11S6JFTYQMGZXOCz/t7e+SR
         iNzsHOc5TRWL72ClBFHL1Ihe/FLQAn9j+tZnkdl9C0PQC1MA6uL7RskIERTGAPxUZria
         gam0JYulK1sLWgbKQ3kv3S/XSIp1AbgpKDfxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732986928; x=1733591728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ns8sXTy5NQlVVpEAKiZMIsA11vqUUUuUQ2j/9bwZtrk=;
        b=Q0WYRJBAiHO3D4r2BFotnmQwT/H/7/YAbYraVdL7Ki1MlTDr0jhi6kuXIkiL8VSeic
         zaju4oxgYbZsKsXAQtJr2x/COFYaRU3phCaH+eeK/r1sDMKmKbJZwK4zJ1afwQw5HKFw
         IKFhSwkZlrCIslggOW8IQ8yqhOnPMkZktIVp/Pym5I3BH56l4EAkNQ6c88NFsMIvGlpF
         oOLEa+qZ5NhwBs+xne5sZyqN2f5ADpa0DiJPl/ymE+H31qBh5lPFbsQiRTejV16apuQz
         auSBGAjhPsPek/fhooAaMIxhqz075gldO4H9a+lX9NhPA1/yruh5GQSa78f4GTGkYNZJ
         v8OA==
X-Forwarded-Encrypted: i=1; AJvYcCWPqPXCGIk+3tgIt+MdIZueJPsmj8jaV4miiBzwM0v7sOd9Lt2QGzd3z05XsRBEht27avolpCtfp0kFaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy/5o9c50HZ8qRIFjunSMt+CEi87HvlT0g4mYzBTPra8GAg8P5
	89wcGKTZQvEgrn4REAVCPehBgRtFc4pXR6OUhuULBECoS93NdKYVcLj2Y4Gisne0PrWjbkn9Ue8
	=
X-Gm-Gg: ASbGncuC44lTP+gEQAo7vy/I8IpPF7he6C1Y4HLwBGEj5uUF9K7tdPAcyWaJaUJRvX7
	gFprN1nD6+mf/kJPZ4lxpd62jeIHs66wcfET7kxGgd5HfXZ1v15hI3i2rkAqlOseSKLvJXptJ+r
	32LbfQiHatdE1Jvb0uDsZsNI7bpMOG9QASAh4ckaz64+Clo/N4X1RKMFT7Mvh0ICyw57bqrCfXt
	bO8mRwCqEpnhfpqQjp/VvFMmQIgWPo0JDENNuG+0TjlFYMg2n6IygHxChqFCQiv4BUIiAKJIYvI
	Bvl4n5QrKHMy
X-Google-Smtp-Source: AGHT+IGXgHEbLFx7X0vmig2vLQBi9ecqkPGZMKJTO/8QCmCPOS2I8SS1tmbiK9S1ypTk1R4HCzwlfQ==
X-Received: by 2002:a05:6a00:1789:b0:725:a65:d194 with SMTP id d2e1a72fcca58-72530077bcamr21196526b3a.14.1732986927321;
        Sat, 30 Nov 2024 09:15:27 -0800 (PST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176129fsm5409260b3a.4.2024.11.30.09.15.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 09:15:25 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee4f78493aso1271340a91.3
        for <linux-media@vger.kernel.org>; Sat, 30 Nov 2024 09:15:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPojJbooQ8pFhKSDj5YyhqTOum0kFi6Kq1VuitvATEmrlhKTj1+jjzeWDGnC2bDosyHyWI+PWMeVpwyg==@vger.kernel.org
X-Received: by 2002:a17:90b:4b0f:b0:2ea:4150:3f71 with SMTP id
 98e67ed59e1d1-2ee08ea04cbmr20795902a91.14.1732986924592; Sat, 30 Nov 2024
 09:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org> <20241129-uvc-fix-async-v4-2-f23784dba80f@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v4-2-f23784dba80f@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 30 Nov 2024 18:15:12 +0100
X-Gmail-Original-Message-ID: <CANiDSCv3986=KjwWOXsKGZ58+YMViHeHvam=ax7iKr=x_h_pRw@mail.gmail.com>
Message-ID: <CANiDSCv3986=KjwWOXsKGZ58+YMViHeHvam=ax7iKr=x_h_pRw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

nit:

After sleeping on it. I think this could be nicer expressed  with:
uvc_ctrl_get_handle and uvc_ctrl_put_handle

Let me know what do you prefer:



diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 88ef8fdc2be2..d4a010cdf805 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1579,6 +1579,35 @@ static void uvc_ctrl_send_slave_event(struct
uvc_video_chain *chain,
        uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
 }

+static int uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
+{
+       /* NOTE: We must own the chain->ctrl_mutex to run this function. */
+
+       if (handle == ctrl->handle) /* Nothing to do here. */
+               return 0;
+
+       /* We can't change the original handler. */
+       if (ctrl->handle)
+               return -EBUSY;
+
+       ctrl->handle = handle;
+       handle->pending_async_ctrls++;
+       return 0;
+}
+
+static void uvc_ctrl_put_handle(struct uvc_fh *handle, struct
uvc_control *ctrl)
+{
+       /* NOTE: We must own the chain->ctrl_mutex to run this function. */
+
+       if (!ctrl->handle) /* Nothing to do here.*/
+               return;
+
+       ctrl->handle = NULL;
+       if (WARN_ON(!handle->pending_async_ctrls))
+               return;
+       handle->pending_async_ctrls--;
+}
+
 void uvc_ctrl_status_event(struct uvc_video_chain *chain,
                           struct uvc_control *ctrl, const u8 *data)
 {
@@ -1589,7 +1618,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
        mutex_lock(&chain->ctrl_mutex);

        handle = ctrl->handle;
-       ctrl->handle = NULL;
+       uvc_ctrl_put_handle(handle, ctrl);

        list_for_each_entry(mapping, &ctrl->info.mappings, list) {
                s32 value = __uvc_ctrl_get_value(mapping, data);
@@ -2046,8 +2075,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
        mapping->set(mapping, value,
                uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));

-       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS && !ctrl->handle)
-               ctrl->handle = handle;
+       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
+               uvc_ctrl_get_handle(handle, ctrl);

        ctrl->dirty = 1;
        ctrl->modified = 1;
@@ -2770,6 +2799,22 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
        return 0;
 }

+void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
+{
+       struct uvc_entity *entity;
+
+       guard(mutex)(&handle->chain->ctrl_mutex);
+
+       if (!handle->pending_async_ctrls)
+               return;
+
+       list_for_each_entry(entity, &handle->chain->dev->entities, list)
+               for (unsigned int i = 0; i < entity->ncontrols; ++i)
+                       uvc_ctrl_put_handle(handle, &entity->controls[i]);
+
+       WARN_ON(handle->pending_async_ctrls);
+}
+
 /*
  * Cleanup device controls.
  */
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 97c5407f6603..b425306a3b8c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)

        uvc_dbg(stream->dev, CALLS, "%s\n", __func__);

+       uvc_ctrl_cleanup_fh(handle);
+
        /* Only free resources if this is a privileged handle. */
        if (uvc_has_privileges(handle))
                uvc_queue_release(&stream->queue);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ce688b80e986..e0e4f099a210 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -340,7 +340,11 @@ struct uvc_video_chain {
        struct uvc_entity *processing;          /* Processing unit */
        struct uvc_entity *selector;            /* Selector unit */

-       struct mutex ctrl_mutex;                /* Protects ctrl.info */
+       struct mutex ctrl_mutex;                /*
+                                                * Protects ctrl.info,
+                                                * ctrl.handle and
+                                                * uvc_fh.pending_async_ctrls
+                                                */

        struct v4l2_prio_state prio;            /* V4L2 priority state */
        u32 caps;                               /* V4L2 chain-wide caps */
@@ -615,6 +619,7 @@ struct uvc_fh {
        struct uvc_video_chain *chain;
        struct uvc_streaming *stream;
        enum uvc_handle_state state;
+       unsigned int pending_async_ctrls;
 };

 struct uvc_driver {
@@ -800,6 +805,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain
*chain, u32 v4l2_id,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
                      struct uvc_xu_control_query *xqry);

+void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
+
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
                                            u8 epaddr);

On Fri, 29 Nov 2024 at 22:30, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> When an async control is written, we copy a pointer to the file handle
> that started the operation. That pointer will be used when the device is
> done. Which could be anytime in the future.
>
> If the user closes that file descriptor, its structure will be freed,
> and there will be one dangling pointer per pending async control, that
> the driver will try to use.
>
> Clean all the dangling pointers during release().
>
> To avoid adding a performance penalty in the most common case (no async
> operation), a counter has been introduced with some logic to make sure
> that it is properly handled.
>
> Cc: stable@vger.kernel.org
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 54 ++++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
>  drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
>  3 files changed, 62 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 88ef8fdc2be2..bc96fb475b9c 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1579,6 +1579,33 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>         uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>
> +static void uvc_ctrl_set_handle(struct uvc_control *ctrl, struct uvc_fh *handle)
> +{
> +       /* NOTE: We must own the chain->ctrl_mutex to run this function. */
> +
> +       if (handle) {
> +               if (handle == ctrl->handle) /* Nothing to do here. */
> +                       return;
> +
> +               /* We can't change the original handler. */
> +               if (WARN_ON(ctrl->handle))
> +                       return;
> +
> +               ctrl->handle = handle;
> +               handle->pending_async_ctrls++;
> +               return;
> +       }
> +
> +       if (!ctrl->handle) /* Nothing to do here.*/
> +               return;
> +
> +       handle = ctrl->handle;
> +       ctrl->handle = NULL;
> +       if (WARN_ON(!handle->pending_async_ctrls))
> +               return;
> +       handle->pending_async_ctrls--;
> +}
> +
>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>                            struct uvc_control *ctrl, const u8 *data)
>  {
> @@ -1589,7 +1616,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>         mutex_lock(&chain->ctrl_mutex);
>
>         handle = ctrl->handle;
> -       ctrl->handle = NULL;
> +       uvc_ctrl_set_handle(ctrl, NULL);
>
>         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>                 s32 value = __uvc_ctrl_get_value(mapping, data);
> @@ -2047,7 +2074,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS && !ctrl->handle)
> -               ctrl->handle = handle;
> +               uvc_ctrl_set_handle(ctrl, handle);
>
>         ctrl->dirty = 1;
>         ctrl->modified = 1;
> @@ -2770,6 +2797,29 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>         return 0;
>  }
>
> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> +{
> +       struct uvc_entity *entity;
> +
> +       guard(mutex)(&handle->chain->ctrl_mutex);
> +
> +       if (!handle->pending_async_ctrls)
> +               return;
> +
> +       list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> +               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> +                       struct uvc_control *ctrl = &entity->controls[i];
> +
> +                       if (ctrl->handle != handle)
> +                               continue;
> +
> +                       uvc_ctrl_set_handle(ctrl, NULL);
> +               }
> +       }
> +
> +       WARN_ON(handle->pending_async_ctrls);
> +}
> +
>  /*
>   * Cleanup device controls.
>   */
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 97c5407f6603..b425306a3b8c 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
>
>         uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>
> +       uvc_ctrl_cleanup_fh(handle);
> +
>         /* Only free resources if this is a privileged handle. */
>         if (uvc_has_privileges(handle))
>                 uvc_queue_release(&stream->queue);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index ce688b80e986..e0e4f099a210 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -340,7 +340,11 @@ struct uvc_video_chain {
>         struct uvc_entity *processing;          /* Processing unit */
>         struct uvc_entity *selector;            /* Selector unit */
>
> -       struct mutex ctrl_mutex;                /* Protects ctrl.info */
> +       struct mutex ctrl_mutex;                /*
> +                                                * Protects ctrl.info,
> +                                                * ctrl.handle and
> +                                                * uvc_fh.pending_async_ctrls
> +                                                */
>
>         struct v4l2_prio_state prio;            /* V4L2 priority state */
>         u32 caps;                               /* V4L2 chain-wide caps */
> @@ -615,6 +619,7 @@ struct uvc_fh {
>         struct uvc_video_chain *chain;
>         struct uvc_streaming *stream;
>         enum uvc_handle_state state;
> +       unsigned int pending_async_ctrls;
>  };
>
>  struct uvc_driver {
> @@ -800,6 +805,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>                       struct uvc_xu_control_query *xqry);
>
> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> +
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>                                             u8 epaddr);
>
> --
> 2.47.0.338.g60cca15819-goog
>


-- 
Ricardo Ribalda

