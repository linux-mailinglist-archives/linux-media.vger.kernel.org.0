Return-Path: <linux-media+bounces-26782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20392A41917
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F8216AC15
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F21724A05F;
	Mon, 24 Feb 2025 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FU7U9+Db"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6827F24291B
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389212; cv=none; b=Wfp6MD+CLlYkVOTEjateky96flxlTgrahNlGX+PH4lnF844pdH9PvQfxJvMDgbGFYr0m/WwMW0gpv9pnMcD6T+fjruwgJO2Mo9iq/H5RI32rvLe8EwNBJSFeV95Ne6L2j/dH5RAjJiUiEr6Kx9QD1kd+Uz/KsIwijpEMFjOeVhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389212; c=relaxed/simple;
	bh=/ryG12havO6GGoTrPBXBQA1dshzJ3F4G9J8CFEub8VQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QI1uoOIzxRKEkPLLVqOWMH+YVby2m2aD5IEq2sgYFJnJETQEHZafWAQxzirMsXqArJNmr1gpKI7JLZ5pnK+rhO5glLlAzN0AUp7CRiavUOh1hQSgcs1Cub5RH/wD/552rrsJuvLl7dR3/Mav07Ibxe+caB53rHu2X0BVGmKaaxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FU7U9+Db; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-546210287c1so4329290e87.2
        for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 01:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740389208; x=1740994008; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R9DwX5H0t5xZGrbvpWDysDlrDfS0kR6OfhPIwAFx6mo=;
        b=FU7U9+DbyCbc2NRgWUoTn6VKRqYhotc95YGvfiFGWnmrFG84TF8tG+3CUR+OoqCKc0
         Y7hqrE2S09t9pMQZdSZ5I17seSik/1T1+i6tYIuZ5ttU+FnmAj4mteawHttolRXLdfTY
         aycB4JyNluMoiJeqyj1L+3NCNRskiJkSQrzeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740389208; x=1740994008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9DwX5H0t5xZGrbvpWDysDlrDfS0kR6OfhPIwAFx6mo=;
        b=TVHafFgXwRG6UNlk5xYlNChxZ8jv4dIlv3Ti22asvmWwRi4e7U70AihueL+zoOPlcH
         glA0PaswDDC3jLIueY0Bz44pQemEtVweDN1Yk1RCz+9p/DsK0hwdMDKgCichClnWKq7z
         ZpXrl23F0Kjlbm/FRhkx/MXDFdnXqXR1tT4VeoDNxmn5ME7RLCm36wDuENq6L2cDnmeQ
         qg57L2sNBZjIDvHeVesi2jPbZZlMS8Jwu/CM+32sozyw4UXlB4Hpswzlz/6UPf+WO+Ae
         Ps8OL0oVe7pKVgSzVch3ntcq8an8W0MfAvbu/S7Lv6Ts9Sozu9F7HYC9VGBjUoxzU5Ix
         KEIg==
X-Forwarded-Encrypted: i=1; AJvYcCWB/FpbYqqQA+NEj/syq8ADjdajPYK2mAH/Nf5nTL5agxVNoI8Pb2jGOYb6TOIlDZRhksbW02kYszfrBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaMkzEov+1xyXlQONEpJ++5Pxak9sRHWU/1GEZa6e98JUz9VNv
	sj6JHVa9lqBECsEYLPNevuS0pH4WgYeoyBh1PhZ8bdWbD7RSMulgKiXtv4Yp7Nw0FZ/9cGrW/sm
	aDg==
X-Gm-Gg: ASbGncu8lkbQWBXGTxdG8LDY1ip18fCeuRoklmuIAn8BJNhT3YqUXrp2QFEjsxbYPnx
	vKUx9Fno7HVzfFA7kmENqZdFvyr59jAX0MY8KZN7RK64j8OGkg1LXCMcJs/w1yjHQF7a4+sYFEN
	1tQISaTQGb9Oo6V1ffcKSArebidYee3IBY+O5Y+7P/SjeqIPkW5VLMlfTQo0TRRPPadCBvLNsJs
	1qpt+cxioptvI1ZTyPPDByJo+3M2rLwnYp1Wgi8TkKraDtJaXXnxxoKphpdm9Tlul7JO61ABUfV
	w/QaUC2P49Kc9AWi82p0lLXRkmQctasLRxLYKotWSgWPEeGValjeVrs+r3lQv0H18jTn
X-Google-Smtp-Source: AGHT+IE00cK4bx0YpfbGLFWdScGfgjaiztoQNQ2ecwoytd/m7ZuLawNClObKxbp5+Jx0JHP0Qvlq2g==
X-Received: by 2002:a05:6512:2256:b0:545:60b:f382 with SMTP id 2adb3069b0e04-5483913f99cmr5593457e87.17.1740389208043;
        Mon, 24 Feb 2025 01:26:48 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5484d08c083sm138870e87.57.2025.02.24.01.26.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:26:47 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30a303a656aso42497371fa.0
        for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 01:26:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX976M3RikOTISqxbsdvkW+yoSTB/p/RUmsZ48SFx2iIGZWVzHdADfUhNY4ww2imVY+CaTPRYFNKcjIAA==@vger.kernel.org
X-Received: by 2002:a05:6512:3e14:b0:545:576:cbca with SMTP id
 2adb3069b0e04-5483912fcd7mr4198905e87.8.1740389206945; Mon, 24 Feb 2025
 01:26:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org> <20250223170319.GA2821@pendragon.ideasonboard.com>
In-Reply-To: <20250223170319.GA2821@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Feb 2025 10:26:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCv1HVu82D=PoJFu=XCQ97k_MM1dmYpufkUCiKpSgGRT9w@mail.gmail.com>
X-Gm-Features: AWEUYZmvV4iGze7N3ugwoy0UYAWbTsMtuoDRa1uh5PWbgtlebItM-Je3dCsd9uI
Message-ID: <CANiDSCv1HVu82D=PoJFu=XCQ97k_MM1dmYpufkUCiKpSgGRT9w@mail.gmail.com>
Subject: Re: [PATCH v4] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Feb 2025 at 18:03, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Sat, Jan 11, 2025 at 09:57:21AM +0000, Ricardo Ribalda wrote:
> > To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
> > step and flags of the control. For some of the controls, this involves
> > querying the actual hardware.
> >
> > Some non-compliant cameras produce errors when we query them. Right now,
> > we populate that error to userspace. When an error happens, the v4l2
> > framework does not copy the v4l2_queryctrl struct to userspace. Also,
> > userspace apps are not ready to handle any other error than -EINVAL.
> >
> > One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
> > of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
> > that usecase, a non-compliant control will make it almost impossible to
> > enumerate all controls of the device.
> >
> > A control with an invalid max/min/step/flags is better than non being
> > able to enumerate the rest of the controls.
> >
> > This patch makes VIDIOC_QUERYCTRL return 0 in all the error cases
> > different than -EINVAL, introduces a warning in dmesg so we can
> > have a trace of what has happened and sets the V4L2_CTRL_FLAG_DISABLED.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Hi 2*Hans and Laurent!
> >
> > I came around a device that was listing just a couple of controls when
> > it should be listing much more.
> >
> > Some debugging latter I found that the device was returning -EIO when
> > all the focal controls were read.
> >
> > Lots of good arguments in favor/against this patch in the v1. Please
> > check!
> >
> > Without this patch:
> > $ v4l2-ctl --list-ctrls
> >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> >
> > With this patch:
> > $ v4l2-ctl --list-ctrls
> >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > error 5 getting ext_ctrl Focus, Absolute
> > error 5 getting ext_ctrl Focus, Automatic Continuous
> >    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
> > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> > --
> > ---
> > Changes in v4:
> > - Display control name (Thanks Hans)
> > - Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org
> >
> > Changes in v3:
> > - Add a retry mechanism during error.
>
> This needs to be explained in the commit message, including when/why it
> helps, and why the retry count is 2.
>
> > - Set V4L2_CTRL_FLAG_DISABLED flag.
> > - Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org
> >
> > Changes in v2:
> > - Never return error, even if we are not enumerating the controls
> > - Improve commit message.
> > - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 43 ++++++++++++++++++++++++++++++++--------
> >  1 file changed, 35 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4e58476d305e..9d7812e8572d 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1280,6 +1280,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> >       return ~0;
> >  }
> >
> > +#define MAX_QUERY_RETRIES 2
> > +
> >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >       struct uvc_control *ctrl,
> >       struct uvc_control_mapping *mapping,
> > @@ -1305,19 +1307,44 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >               __uvc_find_control(ctrl->entity, mapping->master_id,
> >                                  &master_map, &master_ctrl, 0);
> >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > +             unsigned int retries;
> >               s32 val;
> > -             int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > -             if (ret < 0)
> > -                     return ret;
> > +             int ret;
> >
> > -             if (val != mapping->master_manual)
> > -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > +                     ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
> > +                                          &val);
> > +                     if (ret >= 0)
> > +                             break;
> > +             }
> > +
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: Error %d querying master control %x (%s)\n",
> > +                                           ret, master_map->id,
> > +                                           uvc_map_get_name(master_map));
> > +             } else if (val != mapping->master_manual) {
> > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             }
> >       }
> >
> >       if (!ctrl->cached) {
> > -             int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > -             if (ret < 0)
> > -                     return ret;
> > +             unsigned int retries;
> > +             int ret;
> > +
> > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > +                     ret = uvc_ctrl_populate_cache(chain, ctrl);
> > +                     if (ret >= 0)
> > +                             break;
> > +             }
> > +
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: Error %d populating cache of control %x (%s)\n",
> > +                                          ret, mapping->id,
> > +                                          uvc_map_get_name(mapping));
> > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
>
> Can we make the control permanently disabled ?

I'd rather not. In funky hardware the control might work with the
right combination of other controls.

>
> > +             }
> >       }
> >
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> >
> > ---
> > base-commit: c5aa327e10b194884a9c9001a751f6e4703bc3e3
> > change-id: 20241213-uvc-eaccess-755cc061a360
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

