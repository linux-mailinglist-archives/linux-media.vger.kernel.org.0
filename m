Return-Path: <linux-media+bounces-22125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD59DA310
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 08:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42F87164712
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 07:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E139F14F9CC;
	Wed, 27 Nov 2024 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K30XBOsG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5550149C69
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732692432; cv=none; b=GoBLOhq5Kjx8ybj6G1L3d6caqrk8N7NBg2dDf6dNCxvpNsBLkIYpRsbyeB/AzPjsaU7PLNFLQHRzECj0951wphfra/+I2jCpudWMZY2I+JbwT/tNUZvtUvsNDkJJXZVT1cjNKP7IaoDYXlSpSOn0LPlV+7EvtxoxGK1XZIDirNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732692432; c=relaxed/simple;
	bh=VEeTdkPIshGtUMIjF1+MQ8SsBy4eSEWr18q7NQ2DlmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ubxb091blUOybVw5FtNXdtMH0WPl66US9nitcXsZHL3S/RnlZaTk0G1eDKYo3KVNfyk8r4PCUBJAB95TtpNFYZZP8tW0oJjswg20wfInC5PgpGWsi8Tu8cCuaMzYCsxo+yvdCpGad2w96uDIzot+US15FSlhPx7cJD3Mi4QOjzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K30XBOsG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21288d3b387so48217825ad.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 23:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732692430; x=1733297230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sWsPbH9Ey/0wa0vmOqHRbHISu5d2cxb8zw/sMgDSg6c=;
        b=K30XBOsG4CKLedDWW1KfUkGuNWC5dpbQtn9C0GYRuP76CWIR1MvYAZ63uRHI+WPE8K
         AS96BSbStMZ7YFVoYnWXnp/RQDCFgcmVqUgXK33f+A4lalijRsQCKPtoJ6XA/VAdMYL/
         4cKqvJI36bbUgVIGKzCqObwxaN9cHlbISKd9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732692430; x=1733297230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWsPbH9Ey/0wa0vmOqHRbHISu5d2cxb8zw/sMgDSg6c=;
        b=RnyJrRsxRX4pdFiueUPOpmGRHgtxsV+NIECUghxdZFsaMmjIqtxuyixjaLua0pqIvN
         nuOMCmU+VuUMvJm01RWdHFYfis3UheE0uSgUINGDVsgl/luak2+8TRKTV5GyuqavFoSv
         L9lm8od89+hgxy2u8M4VbPwKQ3cp7lv18zFRhqBJuoLWca3k6tapVdDp92Ho1og33oxF
         7L8Ppw5BF97vyVRkGrCc5zi6vhfUZ4un0GS4kHlZ/vwtLHrTz9NYn0q7tOA17wY4tpZ2
         DrzC0LcOTiMIdIrka/NQgYSQkTk54hsMvKLYkwjko/MgOxXZo3svqC60iZ2Z0/kld0Kt
         KqhQ==
X-Gm-Message-State: AOJu0YzuwVTF2gmjK/aObLHDCCA/70DvgkKYIxKvNIfiid9S6o3SE2vb
	ZiXaaW66kGRd/GvMe3E+a3Y5HcyTVj836/dEYOpUwJwD7PV41VmpLhC/i3Is1rm0GXWIZ//WEx4
	=
X-Gm-Gg: ASbGncuV1j2Wj4r4aSOKxxCq4q6L3I2dbaXQNY4z5j9VsX3lUuO8C+TgQZRTLNDY9IA
	xLFvCAiPCxrlYiRqF+WqGEPgK2gZcOR/YJlOyKa5nVtyTCIDvo/WmZ9WfpUl3hbSvHFRB/Z9o7v
	7bGsnUe5RQDUAN0cH7IM3HppqqI+Bjr/83hCWBpv0/HFLwBwyQ4BsbfFjFrw8ZFVCl2nq7ISMS4
	lzXW/GszyBQb6iLpoE5iQbqJji08LDHD6npU2cyVQZjxKx3/54Fpntg6Ez5y8STyzH3AHwRDBQX
	JWkOPzzjamoOMNA9
X-Google-Smtp-Source: AGHT+IGpG3l4My2YwmTjzPqUvmFmnk86pp44AP8vWJqAeX1Yde95UTrORxSuuN9UEp4OoyllWlfIWg==
X-Received: by 2002:a17:903:41c3:b0:212:996:3536 with SMTP id d9443c01a7336-2150108c8eemr29583755ad.10.1732692429958;
        Tue, 26 Nov 2024 23:27:09 -0800 (PST)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com. [209.85.210.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba1b40sm96367585ad.87.2024.11.26.23.27.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 23:27:08 -0800 (PST)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-724f383c5bfso3328995b3a.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 23:27:08 -0800 (PST)
X-Received: by 2002:a05:6a00:3c91:b0:724:f6a2:7b77 with SMTP id
 d2e1a72fcca58-7253013312cmr3529250b3a.17.1732692427462; Tue, 26 Nov 2024
 23:27:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org> <20241126-uvc-granpower-ng-v1-2-6312bf26549c@chromium.org>
In-Reply-To: <20241126-uvc-granpower-ng-v1-2-6312bf26549c@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 08:26:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCu+v+nf3tifsbybf8a5Ea54c7ag4B61BDkN9FA9ogM+SA@mail.gmail.com>
Message-ID: <CANiDSCu+v+nf3tifsbybf8a5Ea54c7ag4B61BDkN9FA9ogM+SA@mail.gmail.com>
Subject: Re: [PATCH 2/9] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[Resending in plain text, seem like today is not may day]

On Tue, 26 Nov 2024 at 17:20, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> When an async control is written, we copy a pointer to the file handle
> that started the operation. That pointer will be used when the device is
> done. Which could be anytime in the future.
>
> If the user closes that file descriptor, its structure will be freed,
> and there will be one dangling pointer per pending async control, that
> the driver will try to use.
>
> Keep a counter of all the pending async controls and clean all the
> dangling pointers during release().
>
> Cc: stable@vger.kernel.org
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
>  drivers/media/usb/uvc/uvcvideo.h |  3 +++
>  3 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 5d3a28edf7f0..11287e81d91c 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>         mutex_lock(&chain->ctrl_mutex);
>
>         handle = ctrl->handle;
> -       ctrl->handle = NULL;
> +       if (handle) {
> +               ctrl->handle = NULL;
> +               WARN_ON(!handle->pending_async_ctrls)
There is obviously a missing semicolon here.
I screwed it up when I reordered the patches to move it to the first
part of the set.
Luckily we have CI :).

You can see the fixed version here:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commits/b4/uvc-granpower-ng

I do not plan to resend the whole series until there are more comments.
But I am sending the first two patches as a new set, they are fixes. I
will also send the last patch alone, it is unrelated to this.

> +               if (handle->pending_async_ctrls)
> +                       handle->pending_async_ctrls--;
> +       }
>
>         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>                 s32 value = __uvc_ctrl_get_value(mapping, data);
> @@ -2050,8 +2055,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>         mapping->set(mapping, value,
>                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> +               if (!ctrl->handle)
> +                       handle->pending_async_ctrls++;
>                 ctrl->handle = handle;
> +       }
>
>         ctrl->dirty = 1;
>         ctrl->modified = 1;
> @@ -2774,6 +2782,34 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
> +               int i;
> +
> +               for (i = 0; i < entity->ncontrols; ++i) {
> +                       struct uvc_control *ctrl = &entity->controls[i];
> +
> +                       if (!ctrl->handle || ctrl->handle != handle)
> +                               continue;
> +
> +                       ctrl->handle = NULL;
> +                       if (WARN_ON(!handle->pending_async_ctrls))
> +                               continue;
> +                       handle->pending_async_ctrls--;
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
> index 07f9921d83f2..2f8a9c48e32a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -612,6 +612,7 @@ struct uvc_fh {
>         struct uvc_video_chain *chain;
>         struct uvc_streaming *stream;
>         enum uvc_handle_state state;
> +       unsigned int pending_async_ctrls; /* Protected by ctrl_mutex. */
>  };
>
>  struct uvc_driver {
> @@ -797,6 +798,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
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

