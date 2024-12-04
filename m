Return-Path: <linux-media+bounces-22575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 962369E3040
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 01:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50163283A5F
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 00:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C80E10F7;
	Wed,  4 Dec 2024 00:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ciAHNTin"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B80383
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 00:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733271032; cv=none; b=MF+cXD8g7vtv1pTVMsuXbUplS+Bycm85fZSH4/ULcbVJQxsb+aAHeXdFJmmRYtr3iaSpC8kmZ+sPujngcDiUmsmB0VoC5ssXllZofGVDkU85IcWuseUH6jF86vwu8TGF8XeMbBfGjIcWQtrBnVV5JW6eChzmTGZU/Jhs9e2uOMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733271032; c=relaxed/simple;
	bh=V+PKJ0Py7Gg9Ea+J7x7/7xcsC/ZeTDct1LrzM5wbXqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0j6y/R6xdNJE6iWTXKoQNcapO6guOUt8OyYb7LLAqVDiBzuVgNFvwiUA/W+vuL9EF9NO3r/Dmy4rCK/2ZDFO2RkUB658EsLJKq9JrbCYSdw+0s31K2QkmQfwTVciXvoJHIaj1tMwEWGxAKqgpffZmIUR7UszwndBsura+ZZKTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ciAHNTin; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21539e1d09cso58622665ad.1
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 16:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733271030; x=1733875830; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OFd17QlECwIQCFQUFzrEYeq+6a0cRyGfHm8hVcGFVCU=;
        b=ciAHNTin+g/N0tRkZ4HMKU6Uf1AiUcEb4CBqDwBUJr/3cVY+tFQsNa4ScEci3AxF7a
         6AfovPnyaRsiSAfplSFqmHKJLlgHjw4rpUQDGGQFB39prJ8PTmeFUV9+iQ1xmI3ncAFw
         J57idK7hhuPowvl9z/lrj5p+ZpWGKZJEvFkM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733271030; x=1733875830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFd17QlECwIQCFQUFzrEYeq+6a0cRyGfHm8hVcGFVCU=;
        b=LpFmqHJP7FXeDSqfz3tsoI51HhmBbz1RvNrsnxZwMuiYJOc7Rb5vha2y+aeEUPU9DZ
         cg94bzvvwpqqQcha5uvpyKe9dyOmsAoEJxxGml2kCmfddqe/SnqrnZMEFp5xQk958O0k
         pJ2hh0gWrIA5vf3NFTmU7Q2yY9HvzibMWraNM0rxKLt7WAoyzCeCgURoHxH6YkPQmjbX
         sZ2TbvErM2VwhHwoe3ObfL9e80yoLM3nhIad4CGPT2QnnA6LfzWgiqOVSYPSOxsGkmY/
         +TPgiFxOOJdpgy9e5/hw6ER8sHT6H9ipVmL6xS+XiR2qEzniv/pO0JS72aCZ1M09aqfU
         JLWA==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZxmRYZiRdo2CdNTDRAYRO3wPQ4S4aZpl7Nxmqf5dM/2886DWX7PPGrLBITu+ql9Ge94n7/kSIZoKWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzHX+gBkUdSLm7mqycaKIVO9UqVBe64JFVZjZZVxphSSMud/Gb
	WEWRR7OIxaPqHzAwsj2nMDZb7ifSVKO4RSTZBuq0Z7JMXT5oB9LdBCDQzsUuLOTXCaDNFO04kCU
	=
X-Gm-Gg: ASbGncturUBSGMqBEZHkJKYW7VB40fUC+rtUtjg2acOs4bgS9nX5aj7bIWAGXV7eZUZ
	O3lXZ6GFFatXQh6m4i03EJeJevZPxonXPTfr1Y/Ldozj4Gr3T91+ubIH9XJViRQV4Ovx5+EMMuG
	dL4kj6purUDi1nW+g1YsNvB3zpI4H3Qfj7gw3D7pB7hWiWchFEuxFIaDMfYkXNnkTZhuUU1Bg2Q
	0nZmxYZaSKIu2jgQ1rtthXWvaKvuvYfAAokWe7matDWHFQJKE5pRzdOPhGGafOkXX1Mid5HrGCg
	6saY10WgaJ00
X-Google-Smtp-Source: AGHT+IHALH99PmOlhxh/OkX+jU+PjjpPWQngfFwo9wFqsQDumLblCmVwBj7w6JNLfyUcHZI22m2dhw==
X-Received: by 2002:a17:902:d2d1:b0:215:ba1f:2925 with SMTP id d9443c01a7336-215bd24b8ffmr54322615ad.44.1733271029830;
        Tue, 03 Dec 2024 16:10:29 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154bbe35cfsm76967255ad.152.2024.12.03.16.10.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 16:10:27 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2eecc01b5ebso2268666a91.1
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 16:10:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUumS0FEQDau8xCGAHsqe6hGOZGegECNBo5aP27VB8kd9S3SiDeQpujQK0ZLxNOHwIcbK2tlMeoG3KpQA==@vger.kernel.org
X-Received: by 2002:a17:90b:380c:b0:2ee:ab29:1482 with SMTP id
 98e67ed59e1d1-2ef011ff673mr7222661a91.16.1733271026144; Tue, 03 Dec 2024
 16:10:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org> <20241203-uvc-fix-async-v6-3-26c867231118@chromium.org>
In-Reply-To: <20241203-uvc-fix-async-v6-3-26c867231118@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 4 Dec 2024 01:10:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCsaoTOs0j3CFrX7=XK6eww8M-ShEMci5XkuAuhep6gdYw@mail.gmail.com>
Message-ID: <CANiDSCsaoTOs0j3CFrX7=XK6eww8M-ShEMci5XkuAuhep6gdYw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 22:20, Ricardo Ribalda <ribalda@chromium.org> wrote:
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
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 58 ++++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
>  drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
>  3 files changed, 66 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 42b0a0cdc51c..def502195528 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1579,6 +1579,40 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>         uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>
> +static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> +                               struct uvc_fh *new_handle)
> +{
> +       lockdep_assert_held(&handle->chain->ctrl_mutex);
> +
> +       if (new_handle) {
> +               if (ctrl->handle)
> +                       dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> +                                            "UVC non compliance: Setting an async control with a pending operation.");
> +
> +               if (new_handle == ctrl->handle)
> +                       return;
> +
> +               if (ctrl->handle) {
> +                       WARN_ON(!ctrl->handle->pending_async_ctrls);
> +                       if (ctrl->handle->pending_async_ctrls)
> +                               ctrl->handle->pending_async_ctrls--;
> +               }
> +
> +               ctrl->handle = new_handle;
> +               handle->pending_async_ctrls++;
> +               return;
> +       }
> +
> +       /* Cannot clear the handle for a control not owned by us.*/
> +       if (WARN_ON(ctrl->handle != handle))
> +               return;
> +
> +       ctrl->handle = NULL;
> +       if (WARN_ON(!handle->pending_async_ctrls))
> +               return;
> +       handle->pending_async_ctrls--;
> +}

Laurent,


If I have to redo the patch... would you be open to have two functions:
uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
uvc_ctrl_clear_handle(struct uvc_fh *handle, struct uvc_control *ctrl)

instead of this one? It might be me, but it looks uglier than before.

If you like this code just disregard this message.

Regards!


> +
>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>                            struct uvc_control *ctrl, const u8 *data)
>  {
> @@ -1589,7 +1623,8 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>         mutex_lock(&chain->ctrl_mutex);
>
>         handle = ctrl->handle;
> -       ctrl->handle = NULL;
> +       if (handle)
> +               uvc_ctrl_set_handle(handle, ctrl, NULL);
>
>         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>                 s32 value = __uvc_ctrl_get_value(mapping, data);
> @@ -1863,7 +1898,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>
>                 if (!rollback && handle &&
>                     ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> -                       ctrl->handle = handle;
> +                       uvc_ctrl_set_handle(handle, ctrl, handle);
>         }
>
>         return 0;
> @@ -2772,6 +2807,25 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
> +       list_for_each_entry(entity, &handle->chain->dev->entities, list)
> +               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> +                       if (entity->controls[i].handle != handle)
> +                               continue;
> +                       uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
> +               }
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
> index 07f9921d83f2..92ecdd188587 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -337,7 +337,11 @@ struct uvc_video_chain {
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
> @@ -612,6 +616,7 @@ struct uvc_fh {
>         struct uvc_video_chain *chain;
>         struct uvc_streaming *stream;
>         enum uvc_handle_state state;
> +       unsigned int pending_async_ctrls;
>  };
>
>  struct uvc_driver {
> @@ -797,6 +802,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
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

