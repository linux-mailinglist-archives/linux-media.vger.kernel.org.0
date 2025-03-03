Return-Path: <linux-media+bounces-27379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 954F8A4C659
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A80517302A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3317723AE93;
	Mon,  3 Mar 2025 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aujA5M7S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DDE21578D
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017925; cv=none; b=S7C5/XYZifREV93l5bOOXPbnOf0YR/BzDaVR0tHVZoHZD21jk5CHY1qk9gKr6WO79YjbOBxDAwuMx+YNTgu2Z7s+ZjPngIcMaZHv9H96tsvc85wfg5HkZO+6N5yNXAc0piiLl598VtY8FeFIsKNP6wYWct5dT1+HbqOlPkbm/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017925; c=relaxed/simple;
	bh=MCSgs5xxxCulYRnvfdyGYNbtARDHIyZ/TyhT0KMm5+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVmiMeN3ddeu+cNXpojB3p0ruC6duGqLP91E2qAotxSQAi6RGAEPLnIfz+5fRmfrxY3cjuVI0tsOnX9tmZOh1tsYs6VykghGhhVQKfOrKFHk5zsGyF+ZB9uSu/htGwb7ILienLyuljGArhOVgVOtPjY4F0iAsaA+Wi6+ox68buk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aujA5M7S; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bbdc29334so9370591fa.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 08:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741017921; x=1741622721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdWLGQeqT4YHMMCFuHzXq23B1R2g7aEmE8i8MWclk2s=;
        b=aujA5M7SMz5ojq35jwUdMWfpbXMzLyDhc5pKNrZAZkcyyLPeF8mqYhM3+ptLtA96to
         /8F1isgKTNROzUqDNJJT2llRL6dps5mo6GxowAMRyc60yNShOw6SzDpcVPF/wzW+tXCW
         lozUIPHhUF6qlAQwgxHFGmH5VqWEBYN7m3Kys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017921; x=1741622721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdWLGQeqT4YHMMCFuHzXq23B1R2g7aEmE8i8MWclk2s=;
        b=qgq5NSZaH+gt66P9I+IErFs9KiuoDhoEN72pJ178+kiTGVfeqiisDxFEvuQYTvrTCh
         75fl08/TaP7oTsp2BgsIeypTFMZbLTX/kyfgwpfDn0delClu1l6biW/rQR3HASeYxpOA
         A0K+vVYXRGByzJwhXp+jDBqalHBbWDLH+xLYiSEfSyJ8QbSo141I8FpFuNg8onEC+w/B
         nl2yrZY9Jb7RjFkvHU1rO8GhD+B4rj+c3bFEW0zE80iWZ1pyCCbk3Et6/3BBNgUfuaMI
         ay+M2Q7H3G9aBBSTA+Ua7PsU5NsIsF6wXyIShVGThlzK5h5FJ/C86Gmr5/yrrtRpuqfI
         Xj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqOyMiUoWNFrrtPIbrvs5jmurTN9E45iYe15rglPTjp8x+M3VzrpDLW7u09GSPl+iNv0Y4+XCxByTRxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtkgoes6TyaKlo6PsFAe/CYgpJvpOf6h3iPsefnI4eyV5oHWA7
	HYBc1/RbBUGQCSVQm6caL6zKVTxTf6rmKWJpYcLrq/8GsvRDBOSwTk8w+VvfzXM+9WsnP/N1XEc
	=
X-Gm-Gg: ASbGncs1IS171G4hX2dNQpMTq/pUBnffNpIFcINp/H8g8yjkUuQ3VzCli3nY6zAnG0o
	dsuFedYhalqYb7DXBfj/S3NUpHteINYClp+vZ1mxQWcAhSOBAccV9VzCslhQu0KSIn3WNrTZL25
	Yj9L7GYXNicn9S4oZfqPIOJUq+QmlH92MZjEO0By+82Tvbfw5uHerODNqkotxA6r4dzM+PfaAu1
	VW3qCLa1lH+eqaSVZ20GBn1GhV0PeOZ2yBS9qPfQzcZCxvdAgHsyAYjK1f592u1Jf0jPluUUWYF
	HzGguAC59IvzKqWIWIkq3Hlx8Y82pjrBfqlKJpGYFzEGaIqo1yZQc3RIOzDtVRM+GHSPxgn1eEM
	kAaf2OnQx9UM=
X-Google-Smtp-Source: AGHT+IFtxapCAwEmAIvQrO0sWQseFi63kOkG46Kw1x02NKzbPJusu68sphQsPita6ru2kapccAJWGQ==
X-Received: by 2002:a2e:be10:0:b0:30b:8e06:86a3 with SMTP id 38308e7fff4ca-30b932243cemr41702421fa.16.1741017921328;
        Mon, 03 Mar 2025 08:05:21 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b8685b2fbsm14195961fa.86.2025.03.03.08.05.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:05:20 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30ba92c846eso19731521fa.3
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 08:05:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkM9KutFtcPZ/3MhbMyciHyNGjzLs8BIfv3f5Q6EC0+4qhIqSb7EX7smvxmdOxsQYMwHsCms78a3/UWQ==@vger.kernel.org
X-Received: by 2002:a2e:bc1d:0:b0:30b:c83e:720a with SMTP id
 38308e7fff4ca-30bc83e77demr4968111fa.1.1741017919544; Mon, 03 Mar 2025
 08:05:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org>
 <20250223170319.GA2821@pendragon.ideasonboard.com> <CANiDSCv1HVu82D=PoJFu=XCQ97k_MM1dmYpufkUCiKpSgGRT9w@mail.gmail.com>
 <20250303151603.GD32048@pendragon.ideasonboard.com>
In-Reply-To: <20250303151603.GD32048@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 3 Mar 2025 17:05:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCvQ2evpdfg5FYKBRB9ZNQ5Lfa8Sk-EJ4yNiQwB4OfFnKg@mail.gmail.com>
X-Gm-Features: AQ5f1JovEf4lTEvpCMXxm8mI2dt3ScgsdnXXPBeAg94ewbVqW4zQUL8EN1Bhg_Y
Message-ID: <CANiDSCvQ2evpdfg5FYKBRB9ZNQ5Lfa8Sk-EJ4yNiQwB4OfFnKg@mail.gmail.com>
Subject: Re: [PATCH v4] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Mar 2025 at 16:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Feb 24, 2025 at 10:26:34AM +0100, Ricardo Ribalda wrote:
> > On Sun, 23 Feb 2025 at 18:03, Laurent Pinchart wrote:
> > > On Sat, Jan 11, 2025 at 09:57:21AM +0000, Ricardo Ribalda wrote:
> > > > To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
> > > > step and flags of the control. For some of the controls, this involves
> > > > querying the actual hardware.
> > > >
> > > > Some non-compliant cameras produce errors when we query them. Right now,
> > > > we populate that error to userspace. When an error happens, the v4l2
> > > > framework does not copy the v4l2_queryctrl struct to userspace. Also,
> > > > userspace apps are not ready to handle any other error than -EINVAL.
> > > >
> > > > One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
> > > > of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
> > > > that usecase, a non-compliant control will make it almost impossible to
> > > > enumerate all controls of the device.
> > > >
> > > > A control with an invalid max/min/step/flags is better than non being
> > > > able to enumerate the rest of the controls.
> > > >
> > > > This patch makes VIDIOC_QUERYCTRL return 0 in all the error cases
> > > > different than -EINVAL, introduces a warning in dmesg so we can
> > > > have a trace of what has happened and sets the V4L2_CTRL_FLAG_DISABLED.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > Hi 2*Hans and Laurent!
> > > >
> > > > I came around a device that was listing just a couple of controls when
> > > > it should be listing much more.
> > > >
> > > > Some debugging latter I found that the device was returning -EIO when
> > > > all the focal controls were read.
> > > >
> > > > Lots of good arguments in favor/against this patch in the v1. Please
> > > > check!
> > > >
> > > > Without this patch:
> > > > $ v4l2-ctl --list-ctrls
> > > >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> > > >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> > > >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > > > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> > > >
> > > > With this patch:
> > > > $ v4l2-ctl --list-ctrls
> > > >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> > > >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> > > >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > > > error 5 getting ext_ctrl Focus, Absolute
> > > > error 5 getting ext_ctrl Focus, Automatic Continuous
> > > >    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
> > > > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> > > > --
> > > > ---
> > > > Changes in v4:
> > > > - Display control name (Thanks Hans)
> > > > - Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org
> > > >
> > > > Changes in v3:
> > > > - Add a retry mechanism during error.
> > >
> > > This needs to be explained in the commit message, including when/why it
> > > helps, and why the retry count is 2.
> > >
> > > > - Set V4L2_CTRL_FLAG_DISABLED flag.
> > > > - Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org
> > > >
> > > > Changes in v2:
> > > > - Never return error, even if we are not enumerating the controls
> > > > - Improve commit message.
> > > > - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 43 ++++++++++++++++++++++++++++++++--------
> > > >  1 file changed, 35 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 4e58476d305e..9d7812e8572d 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -1280,6 +1280,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> > > >       return ~0;
> > > >  }
> > > >
> > > > +#define MAX_QUERY_RETRIES 2
> > > > +
> > > >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > >       struct uvc_control *ctrl,
> > > >       struct uvc_control_mapping *mapping,
> > > > @@ -1305,19 +1307,44 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > >               __uvc_find_control(ctrl->entity, mapping->master_id,
> > > >                                  &master_map, &master_ctrl, 0);
> > > >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > > > +             unsigned int retries;
> > > >               s32 val;
> > > > -             int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > > > -             if (ret < 0)
> > > > -                     return ret;
> > > > +             int ret;
> > > >
> > > > -             if (val != mapping->master_manual)
> > > > -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > > > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > > > +                     ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
> > > > +                                          &val);
> > > > +                     if (ret >= 0)
> > > > +                             break;
> > > > +             }
> > > > +
> > > > +             if (ret < 0) {
> > > > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > > > +                                          "UVC non compliance: Error %d querying master control %x (%s)\n",
> > > > +                                           ret, master_map->id,
> > > > +                                           uvc_map_get_name(master_map));
> > > > +             } else if (val != mapping->master_manual) {
> > > > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > > > +             }
> > > >       }
> > > >
> > > >       if (!ctrl->cached) {
> > > > -             int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > > > -             if (ret < 0)
> > > > -                     return ret;
> > > > +             unsigned int retries;
> > > > +             int ret;
> > > > +
> > > > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > > > +                     ret = uvc_ctrl_populate_cache(chain, ctrl);
> > > > +                     if (ret >= 0)
> > > > +                             break;
> > > > +             }
> > > > +
> > > > +             if (ret < 0) {
> > > > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > > > +                                          "UVC non compliance: Error %d populating cache of control %x (%s)\n",
> > > > +                                          ret, mapping->id,
> > > > +                                          uvc_map_get_name(mapping));
> > > > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
> > >
> > > Can we make the control permanently disabled ?
> >
> > I'd rather not. In funky hardware the control might work with the
> > right combination of other controls.
>
> That makes the behaviour random and therefore very confusing for
> userspace. All of a sudden a control will start being available, even if
> it was marked as disabled during enumeration.

Random weird hardware will have random behaviour. I think this is kind
of expected.

Also there are probably lots of cameras in the field that cannot
enumerate properly but are used by custom apps. We are going to break
userspace if we enforce this.

Hans V. What do you think?

>
> > > > +             }
> > > >       }
> > > >
> > > >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> > > >
> > > > ---
> > > > base-commit: c5aa327e10b194884a9c9001a751f6e4703bc3e3
> > > > change-id: 20241213-uvc-eaccess-755cc061a360
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

