Return-Path: <linux-media+bounces-22367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF49DECE4
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC66B281873
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 21:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072EB1A3A8D;
	Fri, 29 Nov 2024 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DKqgYdpQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0E1197A7F
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732915426; cv=none; b=N5cyNWbw3GkOpT38Sazg+/AD9eoncjEblmwhQDtJvYMfBJ3jz7gC2HZgBYSbYXbFwnyHSgBG3na94hBMtXvIM3R/pa3gAauMyDzuS1LxvzDRekYlgJXQMVXjX5cO44n9Q/B0A8YTCtKqqFocRKXtDhWusuhz7LKxMvDc1hQoR00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732915426; c=relaxed/simple;
	bh=H+pt1YX92D8b0xsAk6x1oHhj9BYBNM6ur0sFrZX8/r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDW+K139c3frTfxQhE0AOBp2k1sRgtPvjMV+C1wYux2EXeZ7waQJWEnn1aBjld3AoNYTbGpgrTBBUIl6S768au7OHe80Y+1iOxtwUU63rZsYS4c5gygqr0kqtu4ay65enqmW2+15wsjQiEdgblMzEJuNXvzUTlYiNkMAxHy3mCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DKqgYdpQ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fc8f0598cdso2279083a12.1
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732915424; x=1733520224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6+yDaUyQ9Dovj6g5WwtyLbdYrdVmmg1F93HxsG1jRsE=;
        b=DKqgYdpQV/4Jl5/ysCiIwPSzJDUJIxm8m3RbPMmVRfIZiW1ZLVtmlojETrRVdyqsGL
         afj+TDdDOIOXcTp+bnoWCZFvDGws54FQSJ0T8LzQ5dc8xFmPUQmXwwJors1N1d6GikGP
         aMSmjraFxxDriCxEvX6AxI6fvlvmfCHkjE1uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732915424; x=1733520224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+yDaUyQ9Dovj6g5WwtyLbdYrdVmmg1F93HxsG1jRsE=;
        b=RUM20ASN85QHKOYuONkcxJUb413n2L2JDCM2VkXEqPyL+DF7ICIkH/LnlITtCxCg8p
         4HDO8jj82grVl58nsXRzJuxEscTzaeToS/hmj3nX8ou8mORmTjSE+4eHB9cLuOPgc3Lw
         +W33pKANZj183Tdoi/WVnrg2xmaf1rA9dcesHFhA33olgcJVH0HLhkrqaM6/FhtYwIC7
         7W06RXa9efmOSbDYZFVTf1OJgeAlOH2NeTqDeevgDIAONKxfcNBmv+7Bd5gC+CJnhw7b
         JIsPUxiE20r8lHpQjTG08ndFe68DyzkbFwa3S0YTTn/IFvfd/flHBXcgW7LmxVGtWqc2
         FU9g==
X-Forwarded-Encrypted: i=1; AJvYcCVdJflxTqjgLrOXnXqcblLkTnTTKnzGwkqnqLXY/vVFNeEhFqmSU2Y3utQALbNpLAV27T9fpXbAvmyCmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7nNodSjY3Noq0rTvdI+uyfH1in1RUVfTDtW4zpsbLEBbKZBLa
	s70ezP5Ww8tWVI+FCihpaWInPEy6MPoHcNKsW6d012KX5LPeVCfo7uC0XNCcsl0U78MamRBDOdE
	=
X-Gm-Gg: ASbGncsd8xojJfb1Fq6W8gpEl5oSxptCy5T/lT/B9egf8gkJq3luT0ayl7AlFy26sjg
	VMW6KDeDOJgAtwWL8HLE0rWa6ui+6hT6bD3AvBKC1MxvGppOWDw8HqsIipqrdpzc+yvIPpZIuR6
	m7MCCG++ZmeZ+9mc6Bq/qXzyPo8XA49EIX5pZQ0P/AYDFnXfdVcpeO55mmCQELQql3kLtlIBnG5
	nw8TulqnMqgzITTKE3ot1oUIz3SaO6wBqiH+S2Gq3SPosQ+dopjh+a3yVuESl2SFWC2mgLfCXB8
	Ee4b0yPNoU+VSxqv
X-Google-Smtp-Source: AGHT+IGJFQimhv/915t/8Ta9SUT9uDWEnUDK7RJVO4n1W6YXVcIKyj5Dd8m14N1WV2hEmPcb9DK+pQ==
X-Received: by 2002:a05:6a20:6f8d:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-1e0ec7ce3e3mr14151583637.3.1732915423914;
        Fri, 29 Nov 2024 13:23:43 -0800 (PST)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d4bc6sm3569214a12.9.2024.11.29.13.23.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 13:23:43 -0800 (PST)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7251ace8bc0so2385295b3a.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:23:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxyESg2aHNKTW3Y4CmbEFEBr3ke8WCRidsOg9GnGepG+3kDuR95gDpx83Vu1aXGnwj4LCNsxeQ3ltJDw==@vger.kernel.org
X-Received: by 2002:a17:90b:8f:b0:2ee:4b72:fb47 with SMTP id
 98e67ed59e1d1-2ee4b72fcfbmr8253541a91.6.1732915420986; Fri, 29 Nov 2024
 13:23:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org> <20241129-uvc-fix-async-v3-2-ab675ce66db7@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v3-2-ab675ce66db7@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 22:23:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCsRRBs8dEbyamD+xj1t_M_x6r9MU2_T4RmzEwHygxz_ZQ@mail.gmail.com>
Message-ID: <CANiDSCsRRBs8dEbyamD+xj1t_M_x6r9MU2_T4RmzEwHygxz_ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2024 at 20:25, Ricardo Ribalda <ribalda@chromium.org> wrote:
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
>  drivers/media/usb/uvc/uvc_ctrl.c | 44 ++++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
>  drivers/media/usb/uvc/uvcvideo.h |  9 +++++++-
>  3 files changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 88ef8fdc2be2..0a79a3def017 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1579,6 +1579,23 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>         uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>
> +static void uvc_ctrl_set_handle(struct uvc_control *ctrl, struct uvc_fh *handle)
> +{
> +       /* NOTE: We must own the chain->ctrl_mutex to run this function. */
> +
> +       if (handle) {
> +               if (WARN_ON(ctrl->handle))
> +                       return;
> +               handle->pending_async_ctrls++;
> +               ctrl->handle = handle;
> +       } else if (ctrl->handle) {
> +               ctrl->handle = NULL;
> +               if (WARN_ON(!handle->pending_async_ctrls))
> +                       return;
> +               handle->pending_async_ctrls--;
This is wrong, handle is NULL here. Sorry about that.

Uploading a new version.

> +       }
> +}
> +
>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>                            struct uvc_control *ctrl, const u8 *data)
>  {
> @@ -1589,7 +1606,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>         mutex_lock(&chain->ctrl_mutex);
>
>         handle = ctrl->handle;
> -       ctrl->handle = NULL;
> +       uvc_ctrl_set_handle(ctrl, NULL);
>
>         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>                 s32 value = __uvc_ctrl_get_value(mapping, data);
> @@ -2047,7 +2064,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS && !ctrl->handle)
> -               ctrl->handle = handle;
> +               uvc_ctrl_set_handle(ctrl, handle);
>
>         ctrl->dirty = 1;
>         ctrl->modified = 1;
> @@ -2770,6 +2787,29 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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

