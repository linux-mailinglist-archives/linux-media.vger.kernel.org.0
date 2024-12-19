Return-Path: <linux-media+bounces-23770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 240EB9F7716
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 09:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BBD4162B1A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 08:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6162A217667;
	Thu, 19 Dec 2024 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aOPfQnVt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4BA21639B
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 08:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596268; cv=none; b=iZbELoKkofG/mOW+l7+KCcppJkxLY7+tN4hZmPqdWpp7hW1nTJRwJQD5YfxnLxq2xwAUyMtHbcYaDBCb3hXk/88ZZ8hW8WRfyzlkLLfaRoa/jfKBdVbQ6cRvvqVDGps0p2+EYXSjFRqbB/IyK2dZNhLEFpIOK9jLcQsWxP1FK/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596268; c=relaxed/simple;
	bh=ltUhAjKRs6o87tfULjrT3Cp5c4FGDjv4Ak+7nq8sYuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPqBLC8PjWr8C1hhELQoJpPsKeij6YsUE+6RYUYSoJFu60/OPfzXj3osTospk0Wk04g6JmI+RO8ehEwt/l1Aai81/AezPaj8MqRqjpO7Jre+fFoQV3KPaukBaawYUqcdmszlZSJZZcEVxxAfpc4+xqFLYm7ZRqYQO6xuClF16Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aOPfQnVt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2164b1f05caso4460605ad.3
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 00:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734596266; x=1735201066; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nJL5oEw4hDuY3/xIH62WAaqOexOqx6Yo5l0vCcSlAEQ=;
        b=aOPfQnVtzkOV5/Eo2xWaH3m7N95r6pMHIz2yyddxQQQ5+luBfCMIAVRxKohzy5oDvL
         Zae4g8nlL2iWgYuc2UgAG8udH4ahUweOYVCVTqOvfHx3kK/z1ABUWMx7uki1GgArnTfR
         yPErLN78X1HyXLWRF5VLkdZ5VDp6HE9mM8lcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734596266; x=1735201066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJL5oEw4hDuY3/xIH62WAaqOexOqx6Yo5l0vCcSlAEQ=;
        b=xTUM0LRkD4278ivoIlfFiWVacZzREjduwgvmpUnSPWEmKDFki9hFwSIJBVJCDOjfg+
         V03ctLkmJ60we1V9GbxYqkWX8e/SGbeARm//tPab44stDgByEefb991I4LPXPMxmZVWz
         eIxRuF6AqXQ7FYY148jSRdtXbpBdcirgar+wMTDv0Hmx5yogTN+JrnL771OXYg2Dj+t/
         /CTGasrXg8snkgEIS4yuQuEHsV6OXm3BQ8weC42M8m5b0b8ab3EnPy8sDNFwoZBF+Skm
         /zFRVYZfxm4adSF4YC8gyy2XsoRwUM7zy0SK2skBmPB6oG8Lj1M7pdNoe1F7DIA/ISb+
         Fw5g==
X-Forwarded-Encrypted: i=1; AJvYcCVkypTTu8zq1cGwJa39/vpUAZM1UP+1ZsVk3tvjYdfibpJ8rU0ASN+Ps2EcSL5oWDYip3lr1neoWeBHsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA5zw5RI7FvT0pTqP6pII8sZ60wMtXToGh1pRAnIoN4i6oDYqr
	IG8YKqtz/n92y122GSaksVA+Ki640EVYwgziHbG2HbZTT6uuiYqmq4LCzwpAbmbsV2grPg22DXg
	=
X-Gm-Gg: ASbGncvdkEz0hcG6SXi+BCyIRWdiZeX6YzGwsBptT+CYv5UQmWz5WPlg7uw98gaLhD0
	ImKglTjceXy9FILbXXmF1xbtL5EUcBT3OefnwCYzhdbko/AiZ8ymSzzdoAaNN38pcvS5rMvHrSt
	4ZDQjECfMu9w/viknVi9AYH3F0XCxxhivENCR9VgIIJHJulJxbxNq7uMt441lE5+2Z3Vw54tiYj
	edhgsvDiwTU7mIpQ1YNMjym4eIFO9vOQicNI1f+qJGhEDZUmHg7nzf905O+R6WHmVu5qo9Ui0VC
	szIM5a5yjW3SLthjEuw=
X-Google-Smtp-Source: AGHT+IG1koUoj6dtNsA27CcHYxY7sBLtd/ihiDloWtmOdJpPBwhnmrn0dfU+1HLdeQy8y00XizfMlQ==
X-Received: by 2002:a17:90b:2803:b0:2ea:4c4f:bd20 with SMTP id 98e67ed59e1d1-2f2e93ad642mr7509974a91.32.1734596266046;
        Thu, 19 Dec 2024 00:17:46 -0800 (PST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26fdfdsm2704291a91.52.2024.12.19.00.17.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 00:17:44 -0800 (PST)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso378756a91.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 00:17:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDiOhh6xV3tfT6n97XVvGtSQun0wcHKJMOEnjwx3OeZQIBeRYEZjEjOAd1yCCri6pTQM0frEaysPmwvQ==@vger.kernel.org
X-Received: by 2002:a17:90b:4d11:b0:2ea:3f34:f190 with SMTP id
 98e67ed59e1d1-2f2e93889a9mr8132380a91.25.1734596263696; Thu, 19 Dec 2024
 00:17:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org> <20241218232730.GF5518@pendragon.ideasonboard.com>
In-Reply-To: <20241218232730.GF5518@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Dec 2024 09:17:31 +0100
X-Gmail-Original-Message-ID: <CANiDSCu4krUbXq_RiaP5dSZVGdA6CxmUBzxEEPqMNCS4Ar05mw@mail.gmail.com>
X-Gm-Features: AbW1kvaiV9V2JQJwMgcap1su7a-83XCHILA8PK2yWAEt8OIcGbGAb-Feh4oEa7c
Message-ID: <CANiDSCu4krUbXq_RiaP5dSZVGdA6CxmUBzxEEPqMNCS4Ar05mw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating controls
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2024 at 00:27, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Dec 13, 2024 at 11:21:02AM +0000, Ricardo Ribalda wrote:
> > To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
> > values that were not cached previously. If that read fails, we used to
> > report back the error to the user.
> >
> > Unfortunately this does not play nice with userspace. When they are
> > enumerating the contols, the only expect an error when there are no
> > "next" control.
> >
> > This is probably a corner case, and could be handled in userspace, but
> > both v4l2-ctl and yavta fail to enumerate all the controls if we return
> > then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
> > userspace apps handling this wrongly as well.
> >
> > This patch get around this issue by ignoring the hardware errors and
> > always returning 0 if a control exists.
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
>
> Was it transient and random errors, or does the device always fail for
> those controls ?

For one of the devices the control is always failing (or I could not
find a combination that made it work).

For the other it was more or less random.


>
> > This could be solved in userspace.. but I suspect that a lot of people
> > has copied the implementation of v4l-utils or yavta.
> >
> > What do you think of this workaround?
>
> Pretending that the control could be queried is problematic. We'll
> return invalid values to the user, I don't think that's a good idea. If
> the problematic device always returns error for focus controls, we could
> add a quirk, and extend the uvc_device_info structure to list the
> controls to ignore.
>
> Another option would be to skip over controls that return -EIO within
> the kernel, and mark those controls are broken. I think this could be
> done transparently for userspace, the first time we try to populate the
> cache for such controls, a -EIO error would mark the control as broken,
> and from a userspace point of view it wouldn't be visible through as
> ioctl.

I see a couple of issues with this:
- There are controls that fail randomly.
- There are controls that fail based on the value of other controls
(yeah, I know).
- There are controls that do not implement RES, MIN, or MAX, but
besides that, they are completely functional.
In any of those cases we do not want to skip those controls.

I am not against quirking specific cameras once we detect that they
are broken... but we still need a solution for every camera that
allows enumerating all the controls, even if there is a non compliant
control.


Now that I look into the patch... I think I have to remove the
can_fail argument and let it always remove invalid values.

>
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
> >
> > --
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 31 ++++++++++++++++++++++---------
> >  1 file changed, 22 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4fe26e82e3d1..a11048c9a105 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1283,7 +1283,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >       struct uvc_control *ctrl,
> >       struct uvc_control_mapping *mapping,
> > -     struct v4l2_queryctrl *v4l2_ctrl)
> > +     struct v4l2_queryctrl *v4l2_ctrl,
> > +     bool can_fail)
> >  {
> >       struct uvc_control_mapping *master_map = NULL;
> >       struct uvc_control *master_ctrl = NULL;
> > @@ -1307,17 +1308,28 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> >               s32 val;
> >               int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > -             if (ret < 0)
> > -                     return ret;
> >
> > -             if (val != mapping->master_manual)
> > -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: Error %d querying master control %x\n",
> > +                                           ret, master_map->id);
> > +                     if (can_fail)
> > +                             return ret;
> > +             } else if (val != mapping->master_manual) {
> > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             }
> >       }
> >
> >       if (!ctrl->cached) {
> >               int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > -             if (ret < 0)
> > -                     return ret;
> > +
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: Error %d populating cache of control %x\n",
> > +                                          ret, mapping->id);
> > +                     if (can_fail)
> > +                             return ret;
> > +             }
> >       }
> >
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> > @@ -1420,7 +1432,8 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >                       goto done;
> >       }
> >
> > -     ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
> > +     ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl,
> > +                                 !(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL));
> >  done:
> >       mutex_unlock(&chain->ctrl_mutex);
> >       return ret;
> > @@ -1513,7 +1526,7 @@ static void uvc_ctrl_fill_event(struct uvc_video_chain *chain,
> >  {
> >       struct v4l2_queryctrl v4l2_ctrl;
> >
> > -     __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl);
> > +     __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl, true);
> >
> >       memset(ev, 0, sizeof(*ev));
> >       ev->type = V4L2_EVENT_CTRL;
> >
> > ---
> > base-commit: a7f5b36b34824415c28875d615c49a3cf5070615
> > change-id: 20241213-uvc-eaccess-755cc061a360
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

