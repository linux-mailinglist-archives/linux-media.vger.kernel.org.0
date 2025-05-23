Return-Path: <linux-media+bounces-33251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4518AC21A9
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DAC64A5C5E
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B3622B8B5;
	Fri, 23 May 2025 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBbPu1z3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2882A2288C6
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997931; cv=none; b=Akxt9z9i7U61+ZNHLeHfjoivi1CA6Su+oGMiSzVgWuT/b1l7uu69MkwDfI5uGUpfsIhjy69geD3S9De6XLdGi30YHRnbYvgOXwq7OqdfspsGNA8mIWuAzOEcnUWO17mZsxj/ItghPD3KOnpQu+Xlbm7hng/erQt3pcoOHtVIoMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997931; c=relaxed/simple;
	bh=+7x8E4JVOl0BMoLyN3u4e+/xsogRji2QWQnJHu10K9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RsrSBrkrS4C5h+q20qTG5hFvGojSxV8SSg7MtUiQNj/Vb02wGzvR8Bn6pDDCubqDdwz4TY2ccesEyVVDFHDcBUyMH5nSxytMP9G56BzWep6u8N02TgFV+xjfG4T2N7N9KPr3i+wKhO0fyrpr318XtfVbMrrxIwH6ifzA31+FL7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBbPu1z3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-551f00720cfso7493456e87.0
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 03:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747997927; x=1748602727; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71mj/4e4v16Jj1WjDwVwI/Op91TJ/LzlHRMMlGe5K4o=;
        b=aBbPu1z36MFhVfPxOgZzvxGYUUPXbzP9pPZuBymaElH8/dwJfwifRtD7/R+zqj9OVA
         AXE0wt23ocCcaInGG+FB0japNXtHNaL7KDVE85WitlXzJ5zFuqY2KXdpXdWt+TdGPsiE
         vx0Yur0kxogFSva+Y9p9WRgC944A7JmwGMLy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997927; x=1748602727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71mj/4e4v16Jj1WjDwVwI/Op91TJ/LzlHRMMlGe5K4o=;
        b=HYH5EnXOz2/A4JRoAjzJq15f7fjKuaTU3AyNwrF2naCRmF8ycrO/HgbpxwmY6ekK4b
         yvTAobhvUIVRjPNrHDmO8g+xTdEcM1Mi6svJcKvafA6MuHRdGackBZCy7lvziv/0fIC2
         R/VFvHQi7Lx2ZOY+5gtgNKxxWaA10HbP3TFPiIHgUIiO96RZ8qvfHZISQ7kUJTWrla6F
         AgLhg9g8jz3dBF+zdeI99lvKEloLyaAKs1ut3LJVXEkdwUR5etgSQE5NhanxNahuMEsS
         f2z5G7PAnu3vsPrg5VknVOB0ye9fpJM9TzgtMPKnOx1OUsw7KFcQwpu33UioB9jOrsRh
         mePg==
X-Forwarded-Encrypted: i=1; AJvYcCUBVIbG9FWIL4SKrEm5H0PRUcQcVff3YvZpcFCQZ6ErBTPUN7CqAAO9LKT/wUm8AJifVbW/ZIVAGvScFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfxU+xSSpMMZvhyr9u6c72BdKcpiWT1EeGLGGywdKL5/AtVoQW
	DgqlfEUG4UBgly3fgq0rXynV+x/Or/MjBiCPlCcBncDFygJs0kCWC3V/FouVP3gxuON+ZjFIMgK
	w/NKJNw==
X-Gm-Gg: ASbGncu6LQgRuUG6QYgs7UhjtwiOKymDyUygQbTGS3E76X4S4gH3PrDJ9SpvMIgL6/0
	hUpOiVDRfhnFAXYau6uxQwJLLanwmcO+uwwTapHBZoDpHkEllfS+ro5hs/i1bJlArXwx0bfldcz
	BqVz5of8r8QSwKr4YGKdCTiwtO3jAHUyh2XDZrgHXBV6kdPUvJkOPs98RiQvYSgzszcpNTVG97G
	Nv3qRxHglulDxWvCXuxyWZX/oeGcqhHLcawdZmjUPwH4Jlj3UqOpK7FEf4lKjs7ImoZGpDsq3sf
	zSTgxyJx0J2nGrv3gLLZ1Upa8aGXhbjBRR1vALZaHwEapyGauP3gUIey2DFf8qb7rgQtcCEJQkK
	sDg3NNOFpfyvUcA==
X-Google-Smtp-Source: AGHT+IHSlscJ5+FZ9htiqTxcvd94HuOcCcV8Wj9w18SZyuEAs9GsiQLTLTYlgN44vYOh8uFZVh9/MQ==
X-Received: by 2002:a05:6512:228a:b0:550:e15a:be6d with SMTP id 2adb3069b0e04-550e71e21c3mr9358335e87.30.1747997927073;
        Fri, 23 May 2025 03:58:47 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f15fa0sm3788426e87.10.2025.05.23.03.58.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:58:46 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-551efcb745eso7350977e87.2
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 03:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYTpaR2ot+J7IWzFCnJkCRhS3oeh9JwjwCS+qalpowFLiJxomYlqDm1lcrImxh2skaGaaZ91QnDsBdGg==@vger.kernel.org
X-Received: by 2002:a05:6512:159f:b0:550:e575:3923 with SMTP id
 2adb3069b0e04-550e71b667amr9786746e87.15.1747997925442; Fri, 23 May 2025
 03:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
 <20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org> <20250523085341.GA7516@pendragon.ideasonboard.com>
In-Reply-To: <20250523085341.GA7516@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 May 2025 12:58:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCuuaJ9AOr9nGc+GN5UhHs2b0CCZvEnF1Qdw2vn9yo_uXw@mail.gmail.com>
X-Gm-Features: AX0GCFtscgEu8lGhLD0b0uVltUbbjyvKq2QaZ5IbmNBRKIs4PPY0XzwdFe1MRdE
Message-ID: <CANiDSCuuaJ9AOr9nGc+GN5UhHs2b0CCZvEnF1Qdw2vn9yo_uXw@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: uvcvideo: Refactor uvc_ctrl_set_handle()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 23 May 2025 at 10:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Fri, May 09, 2025 at 06:24:13PM +0000, Ricardo Ribalda wrote:
> > Today uvc_ctrl_set_handle() covers two use-uses: setting the handle and
> > clearing the handle. The only common code between the two cases is the
> > lockdep_assert_held.
> >
> > The code looks cleaner if we split these two usecases in two functions.
>
> It does indeed. Thanks for pushing for this :-)
>
> > We also take this opportunity to use pending_async_ctrls from ctrl where
> > possible.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 65 +++++++++++++++++++++-------------------
> >  1 file changed, 35 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 44b6513c526421943bb9841fb53dc5f8e9f93f02..26be1d0a1891cf3a9a7489f60f9a2931c78d3239 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1812,48 +1812,53 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
> >       uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> >  }
> >
> > -static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> > -                            struct uvc_fh *new_handle)
> > +static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> >  {
> > -     lockdep_assert_held(&handle->chain->ctrl_mutex);
> > -
> > -     if (new_handle) {
> > -             int ret;
> > +     int ret;
> >
> > -             if (ctrl->handle)
> > -                     dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> > -                                          "UVC non compliance: Setting an async control with a pending operation.");
> > +     lockdep_assert_held(&handle->chain->ctrl_mutex);
> >
> > -             if (new_handle == ctrl->handle)
> > -                     return 0;
> > +     if (ctrl->handle) {
> > +             dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> > +                                  "UVC non compliance: Setting an async control with a pending operation.");
> >
> > -             if (ctrl->handle) {
> > -                     WARN_ON(!ctrl->handle->pending_async_ctrls);
> > -                     if (ctrl->handle->pending_async_ctrls)
> > -                             ctrl->handle->pending_async_ctrls--;
> > -                     ctrl->handle = new_handle;
> > -                     handle->pending_async_ctrls++;
> > +             if (ctrl->handle == handle)
> >                       return 0;
> > -             }
> > -
> > -             ret = uvc_pm_get(handle->chain->dev);
> > -             if (ret)
> > -                     return ret;
> >
> > -             ctrl->handle = new_handle;
> > -             handle->pending_async_ctrls++;
> > +             WARN_ON(!ctrl->handle->pending_async_ctrls);
> > +             if (ctrl->handle->pending_async_ctrls)
> > +                     ctrl->handle->pending_async_ctrls--;
> > +             ctrl->handle = handle;
> > +             ctrl->handle->pending_async_ctrls++;
> >               return 0;
> >       }
> >
> > +     ret = uvc_pm_get(handle->chain->dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctrl->handle = handle;
> > +     ctrl->handle->pending_async_ctrls++;
> > +     return 0;
> > +}
> > +
> > +static int uvc_ctrl_clear_handle(struct uvc_fh *handle,
> > +                              struct uvc_control *ctrl)
> > +{
> > +     lockdep_assert_held(&handle->chain->ctrl_mutex);
> > +
> >       /* Cannot clear the handle for a control not owned by us.*/
>
> While at it, I'll add a space before */ when applying.
>
> >       if (WARN_ON(ctrl->handle != handle))
> >               return -EINVAL;
>
> But actually, as the caller guarantees that handle == ctrl->handle in
> both call sites (renaming the function makes this clear), can we drop
> the handle argument to this function ?
>
> If that's fine with you, I'd like to also change the
> uvc_ctrl_set_handle() function to pass the ctrl argument first.

SGTM, let me know if you have time to do this or if you prefer that I do it.

Cheers


>
> >
> > -     ctrl->handle = NULL;
> > -     if (WARN_ON(!handle->pending_async_ctrls))
> > +     if (WARN_ON(!ctrl->handle->pending_async_ctrls)) {
> > +             ctrl->handle = NULL;
> >               return -EINVAL;
> > -     handle->pending_async_ctrls--;
> > +     }
> > +
> > +     ctrl->handle->pending_async_ctrls--;
> >       uvc_pm_put(handle->chain->dev);
>
> This will need to become
>
>         uvc_pm_put(ctrl->handle->chain->dev);
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +     ctrl->handle = NULL;
> >       return 0;
> >  }
> >
> > @@ -1871,7 +1876,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >
> >       handle = ctrl->handle;
> >       if (handle)
> > -             uvc_ctrl_set_handle(handle, ctrl, NULL);
> > +             uvc_ctrl_clear_handle(handle, ctrl);
> >
> >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> >               s32 value;
> > @@ -2161,7 +2166,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >
> >               if (!rollback && handle && !ret &&
> >                   ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > -                     ret = uvc_ctrl_set_handle(handle, ctrl, handle);
> > +                     ret = uvc_ctrl_set_handle(handle, ctrl);
> >
> >               if (ret < 0 && !rollback) {
> >                       if (err_ctrl)
> > @@ -3271,7 +3276,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> >                       if (entity->controls[i].handle != handle)
> >                               continue;
> > -                     uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
> > +                     uvc_ctrl_clear_handle(handle, &entity->controls[i]);
> >               }
> >       }
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

