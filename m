Return-Path: <linux-media+bounces-47024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E7C5A5BB
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 23:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B8DC84EA59E
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 22:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C57E31A7EA;
	Thu, 13 Nov 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CuJgCX7N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8AB32573E
	for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 22:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763073364; cv=none; b=Z+Tfc6H/wpB8GdGfnQNtrKxkhaN/+bygMQii9H4io2/vs/HrDO8pu51EIZeq64pTxxv5SYuygFeD0vaLjBQp+18HZywMXc13PZepXFZ6UHiXJd2OMladRgM37XsxdpY/JEiFmK2VsXZjar17LgLvMLE9614OCcY+Y6KjTH4JG0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763073364; c=relaxed/simple;
	bh=2yVpJY+aeisJHvGDwoFPYLuYT8Ebc0gRs6IMYNT04l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSJwWcv5Vk3pIDlkx7JDHEGHzVQKlvUtx1362vd28gBP0WP13f4yCxiGNTiCb50duT86Kfm70z5NJk7Av7DS1qsVVzNMkUg213SYiYcc1etnzh9vEi+6S8fO5C+SBYCEMGQRYvGSxFuMG/d5Gqdeu0btj9X0rwXbTRdHD/kLco8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CuJgCX7N; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5942e61f001so1297983e87.1
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 14:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763073359; x=1763678159; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h30VSnQHi4bPYHqpJ1DDcugPgpyo8jt9+e8fEtu4vhU=;
        b=CuJgCX7N0zxqpf0ZefF3fpWqwulzhzpxi1D6D1qOfV1+XxQY9mNLgcdr0zlcunHsN/
         XHdayrSRCMHjHILGi0gXNOn5+1JRbru/3bdNY/GjCvZWFlJbrpGxfgVg7Wmx4M573jCZ
         d2EQZjKZUiUh+btuEQSiQWw9eQVqVShrFQTYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763073359; x=1763678159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h30VSnQHi4bPYHqpJ1DDcugPgpyo8jt9+e8fEtu4vhU=;
        b=REBoreJ+HTDGjT9DrhbM/vhSpDtE9f/+l3RuxytF4+F5ky6g65MUlN6UFMd1K9liHm
         BUb9KT0gyUnmuf1VmP8lQRVrSThTkLqWeoeJje8qYYbMEtGqhuZ0gGHgGP3xZz3T4x9E
         T0CNRfGxAgR/PObjmbmGQa0GW9YpVExT7IYIGKbV3fg/rURNU/9iTSCuvTn0k6vIdAUW
         GvnioP+JeMC7PB3VT9XG9KP4U7/YVd8E1yHmkJQ+hh2FBDwLtBxwXG4FG/tAzUA54Ah0
         8FJ9/qwAgFnXwfy4vhkdhA6/fFDbgK0+waWiLqy4+TPSyN37QAJYu2Glbx1BgRJKPRsa
         OFEw==
X-Forwarded-Encrypted: i=1; AJvYcCXLUbe+kekzRSr8MaH83QUrImn8oOD/kdQH4papRnHlYsDz3DNTFPyTejmKDAmn+gabZ5pckilXeUEJgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEey9EnnGbgvjJCADM27O3THMNiCIkO8ScRM8pEKuhXl8d2QL
	zPmG/gifdpc9clVpsB5SRkd15RXKWzYlECGiCViVchwfx6v67maNZvALGCfknpHYevGen2uS150
	UaODQDA==
X-Gm-Gg: ASbGncvAkUx5405v47c6AhSw8LXLt88IdhIDSEcDaTDK9UcvyLwh1jfi3WKhRU2qKN5
	lr7hNSfm12vmfU9A+K/ViMW3LypF9T7+zwZoWelBEClU9UbbeulZOwC2gFStE3/jlCzsbubZOGU
	u2Yq2b3v3jb1oCZ+EEhmtinek86+ci4zqjBsTd6Y3rttbmLWS+7t8+0Wy2sLFIHUUU34NztIZXL
	FDYtdIrW8x7uagNz3XRI58XJb0J7MbB8hmon1Mwr6ewBrKBWS3Om0WUtLsg9PP76hqTzZqbcxZM
	1Y7ILlW1Y240cq04/q9lv1L2cMmveEWVXHorErLpBEdUNqm4brWrkxWOowqLXLXJOqe8BsjbQG/
	zef4Aoa2S9x3e6kpZeWfOs0hQMiBCY4lQ1RBL87+5VRYBvcOD5vauka0KIFQ2d7fKGfqN986YpY
	DefwMFdfZQ2VjgelFE5EDv4EQBj48PPkfAc3udor2aHw9DS5w5
X-Google-Smtp-Source: AGHT+IGoPxCmBMJ5tLOyht6eCuiVQiHxUZN7qZyglkFCb0dpfj3n5Dms3rgRHs9/Zhq+w/A81s/7XQ==
X-Received: by 2002:a05:6512:2399:b0:594:5644:db94 with SMTP id 2adb3069b0e04-5958414cccdmr328082e87.0.1763073359461;
        Thu, 13 Nov 2025 14:35:59 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040c9e6sm643591e87.104.2025.11.13.14.35.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 14:35:58 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59428d2d975so1518480e87.3
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 14:35:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVg+maxkrREhehzcj9E3LWzkUWxR5c9i0HWI3zT3Q6r4gqe2/U1BuWu/y5YlPpQvi2DibyPn+lo5te+Lg==@vger.kernel.org
X-Received: by 2002:a05:6512:1597:b0:591:c8de:467b with SMTP id
 2adb3069b0e04-59584209463mr317437e87.40.1763073356972; Thu, 13 Nov 2025
 14:35:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028-uvc-fix-which-v1-1-a7e6b82672a3@chromium.org> <20251113215909.GG9135@pendragon.ideasonboard.com>
In-Reply-To: <20251113215909.GG9135@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 13 Nov 2025 23:35:44 +0100
X-Gmail-Original-Message-ID: <CANiDSCs5ZcU8_8vZQumtLtPXod2swLuyzwZiV6u8bywx7ZF0bQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmaVztA46OPLtJzSKyIMRHfLXxFFMuCdSt3BgLwwD5VreTLlAY8KC-n1Cg
Message-ID: <CANiDSCs5ZcU8_8vZQumtLtPXod2swLuyzwZiV6u8bywx7ZF0bQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix support for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 13 Nov 2025 at 22:59, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Tue, Oct 28, 2025 at 05:55:10PM +0000, Ricardo Ribalda wrote:
> > The VIDIOC_G_EXT_CTRLS with which V4L2_CTRL_WHICH_(MIN|MAX)_VAL can only
> > work for controls that have previously announced support for it.
> >
> > This patch fixes the following v4l2-compliance error:
> >
> >   info: checking extended control 'User Controls' (0x00980001)
> >   fail: v4l2-test-controls.cpp(980): ret != EINVAL (got 13)
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> >
> > Fixes: 39d2c891c96e ("media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c |  9 ++++++---
> >  drivers/media/usb/uvc/uvcvideo.h |  2 +-
> >  3 files changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 2905505c240c060e5034ea12d33b59d5702f2e1f..2f7d5cdd18e072a47fb5906da0f847dd449911b4 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1432,7 +1432,7 @@ static bool uvc_ctrl_is_readable(u32 which, struct uvc_control *ctrl,
> >   * auto_exposure=1, exposure_time_absolute=251.
> >   */
> >  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> > -                        const struct v4l2_ext_controls *ctrls,
> > +                        const struct v4l2_ext_controls *ctrls, u32 which,
> >                          unsigned long ioctl)
> >  {
> >       struct uvc_control_mapping *master_map = NULL;
> > @@ -1442,14 +1442,21 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >       s32 val;
> >       int ret;
> >       int i;
> > +     bool is_which_min_max = (ioctl == VIDIOC_G_EXT_CTRLS &&
>
> Is the ioctl check needed, given that this function will be called with
> which set to V4L2_CTRL_WHICH_CUR_VAL if ioctl is not VIDIOC_G_EXT_CTRLS

Right now it is not needed. But I wanted to be on the protective side
here. Let me add a comment and remove the ioctl check.

> ?
>
> > +                              (which == V4L2_CTRL_WHICH_MIN_VAL ||
> > +                               which == V4L2_CTRL_WHICH_MAX_VAL));
>
> Let's move this up to have longer lines first.
>
> >
> >       if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
> > -             return -EACCES;
> > +             return is_which_min_max ? -EINVAL : -EACCES;
> >
> >       ctrl = uvc_find_control(chain, v4l2_id, &mapping);
> >       if (!ctrl)
> >               return -EINVAL;
> >
> > +     if ((!(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) ||
> > +          !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)) && is_which_min_max)
>
> Please put MIN before MAX.
>
> Do we have to bundle min and max, or could we handle them separately ?
> Something like

I believe we have to bundle min and max. Controls that support
VIDIOC_G_EXT_CTRLS with  V4L2_CTRL_WHICH_(MIN|MAX)_VAL have this flag:
V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX

```
Whether a control supports querying the minimum and maximum values
using V4L2_CTRL_WHICH_MIN_VAL and V4L2_CTRL_WHICH_MAX_VAL is indicated
by the V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX flag.
```




>
>         if ((which == V4L2_CTRL_WHICH_MIN_VAL &&
>              !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)) ||
>             (which == V4L2_CTRL_WHICH_M1X_VAL &&
>             !(ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)))
>                 return -EINVAL;
>
> > +             return -EINVAL;
> > +
> >       if (ioctl == VIDIOC_G_EXT_CTRLS)
> >               return uvc_ctrl_is_readable(ctrls->which, ctrl, mapping);
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 9e4a251eca88085a1b4e0e854370015855be92ee..d5274dc94da3c60f1f4566b307dd445f30c4f45f 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -765,6 +765,7 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *priv,
> >
> >  static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
> >                                struct v4l2_ext_controls *ctrls,
> > +                              u32 which,
>
> This fits on the previous line.
>
> >                                unsigned long ioctl)
> >  {
> >       struct v4l2_ext_control *ctrl = ctrls->controls;
> > @@ -772,7 +773,8 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
> >       int ret = 0;
> >
> >       for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> > -             ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, ioctl);
> > +             ret = uvc_ctrl_is_accessible(chain, ctrl->id, ctrls, which,
> > +                                          ioctl);
> >               if (ret)
> >                       break;
> >       }
> > @@ -806,7 +808,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *priv,
> >               which = V4L2_CTRL_WHICH_CUR_VAL;
> >       }
> >
> > -     ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
> > +     ret = uvc_ctrl_check_access(chain, ctrls, which, VIDIOC_G_EXT_CTRLS);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -840,7 +842,8 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
> >       if (!ctrls->count)
> >               return 0;
> >
> > -     ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
> > +     ret = uvc_ctrl_check_access(chain, ctrls, V4L2_CTRL_WHICH_CUR_VAL,
> > +                                 ioctl);
> >       if (ret < 0)
> >               return ret;
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index ed7bad31f75ca474c1037d666d5310c78dd764df..d583425893a5f716185153a07aae9bfe20182964 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -786,7 +786,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
> >                struct v4l2_ext_control *xctrl);
> >  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
> >  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> > -                        const struct v4l2_ext_controls *ctrls,
> > +                        const struct v4l2_ext_controls *ctrls, u32 which,
> >                          unsigned long ioctl);
> >
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >
> > ---
> > base-commit: c218ce4f98eccf5a40de64c559c52d61e9cc78ee
> > change-id: 20251028-uvc-fix-which-c3ba1fb68ed5
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

