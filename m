Return-Path: <linux-media+bounces-24301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449CA02DA2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 17:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8CE63A7F81
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 16:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F471DED57;
	Mon,  6 Jan 2025 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bYmauHcJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093191DE8A4
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736180423; cv=none; b=e+Nm682jfjVa5okBKbsiuGvuciZN5B8BM9PVk9y3xmrO2HK9lkPrYnmnntuLnJikY+2dBvMuLcZXIuf0PIsuUjXf1b/1+vJI8cX1i7X/v7XSRNFC9g+Ty3CSY+fBHfSv0oaxh8bIWM7QP2cDHyBujF8PTp0CRGw+WH1uqGdyzGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736180423; c=relaxed/simple;
	bh=bmJvHZhsptrZmswHUxoyQ3IfSVRaowE+CgC+4yzs5KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqdDh2cYpXYilUGATcV0lghtfWSGfmnYmiJz1yrGY8aCLOHWRX5U6W+YdOgn9TeAjeskKzqCuxlGtE9uf2ygHnapjOQc7cI+1/NDUI57ABXBIkQArmf8YOBb7l4citrE8Lt40N8kXOXN9QO/MDIEsinLDFmG2dCP19Ofwdht8Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bYmauHcJ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3035046d4bfso133986581fa.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 08:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736180419; x=1736785219; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IftjiCQBEu1LGvxarBz2ha2ctLbcQfhCvJnkP9zqOjs=;
        b=bYmauHcJVfBZ4e3MxZzmxxgaImRiQ0eGwD2MyD6ri4GF9OK9lNPpEzMIvIqaFeguaR
         ohKycePQAt44qJ2fEEfIC0vcNWTRuHG6KXTHSRYjyAWVjID1E7c8vyGHaot40mx+xtns
         vsslZ+XsCAAv+VQeKJK4N4+eQRlS1QHaGYKTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736180419; x=1736785219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IftjiCQBEu1LGvxarBz2ha2ctLbcQfhCvJnkP9zqOjs=;
        b=VNaYcZ3xN9Az+BRFGcRZK1ECU+sjAaSXrZ6ixxm/bq1DYrBlSTZd+lEDwbyQaxVMgU
         Evf+gt663zB1VUKYOPyYe0OdimLQ7uu8AOJC+bvehMCzDcSxa7g+LtXIVcdJ3s4dQsR2
         APFKV8fl5br5YZuD/IBfJ8NmhU3wKN9/v+5YJ0pMM5V+o64YLF5EDBq2oenrwQZSE3D+
         Nuc6hs5bMFu9e4BXj9OVzSXzct1slX5sRXHYFCu9qcs6zx5vVcILwIg/SRI0afkzZNs1
         FJGg/kmFWf+8Vk87/WBG+uAwhP/MZL2YqLkMUSOuYxkXnA2bwzFbYRiDooavenNtflDn
         AMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW1yTYT8wqd9MaAiQ93oSzAqKyPC29emefi6uRi10shJQWyCD6B25kurd5LJE1t7eb4+Px9OKdWD8voA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+MOGvWKXnPgtTI5VXFBB1DBv6v+wt6bh8YaSU0u2vwiKXHY2
	vsESaochQKvZCYMCQUTrRrG4AdEG5LnFLQypmB3zsu6X0Q4xaq4qPt4Ra6d19Jf3JKo/zKRm8dl
	2RQ==
X-Gm-Gg: ASbGncsbuOL+C5mvV4mCnXMAAdGYqCDWmqsoMn+EFqaqORTd12x2Y2vin3acDKaKzhv
	XxSpRris4MevWlUvMmsCwt5MLwiTQiqSK2jFq+HaLQzlWaQ/6XV4QrcT6SrEPKkbOZRJHeV0Phz
	iiDVqQp4+hJ7W2Wcw/VKv5mJcP1wJtH9xJF8l7hDx2grelC6/2I0M4+dvQC191Id5uXouSFH41k
	x3zKnewWE35Pm2bixtf8S1k/tA/MTaE5EzEFL2vUejcvhkEfG4XxcOltTI1S5PCCmFSzJ+97COL
	VR6AWl5OeHxv5LZZ/K4=
X-Google-Smtp-Source: AGHT+IFf2EpiO4pW3XfdpHCVUHoQnpFeSRC9UheTzImNZ0i0zof46yFZDIpCfyDPyAHQrtpGO9H2KA==
X-Received: by 2002:a2e:a718:0:b0:301:2d8d:a3ba with SMTP id 38308e7fff4ca-30468570b24mr154238741fa.23.1736180418769;
        Mon, 06 Jan 2025 08:20:18 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adad6dcsm56274591fa.60.2025.01.06.08.20.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 08:20:18 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-540215984f0so15125464e87.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 08:20:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOlDDKUgcIazinbV45viJS51yMH4fJLu0WeO9+RF7yIXKy/YUQKZxbGiZxlYCqebj5E4d+2tlhPGkIjA==@vger.kernel.org
X-Received: by 2002:a05:6512:3e15:b0:53e:1c3e:34 with SMTP id
 2adb3069b0e04-542295911b0mr19920780e87.38.1736180417844; Mon, 06 Jan 2025
 08:20:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org> <454a9a08-edd1-4593-9f78-71c76f1937a1@xs4all.nl>
In-Reply-To: <454a9a08-edd1-4593-9f78-71c76f1937a1@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 6 Jan 2025 17:20:04 +0100
X-Gmail-Original-Message-ID: <CANiDSCv0iHPN1Fj0tHGqg11uQO9CSviouN6K8p_yoHmfgBN7Jg@mail.gmail.com>
X-Gm-Features: AbW1kvYD_gI6tbifE03IPwowlt0JB0FZzxxYyL_xyfnWCJWSjOPmT-XomE5C0CQ
Message-ID: <CANiDSCv0iHPN1Fj0tHGqg11uQO9CSviouN6K8p_yoHmfgBN7Jg@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Filter hw errors while enumerating controls
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 6 Jan 2025 at 16:01, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> On 19/12/2024 16:33, Ricardo Ribalda wrote:
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
> > different than -EINVAL and introduces a warning in dmesg so we can
> > have a trace of what has happened.
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
>
> How about setting the V4L2_CTRL_FLAG_DISABLED flag for problematic controls, but still return 0?

SGTM, Specially after reading the footnote:
https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-queryctrl.html#id1
V4L2_CTRL_FLAG_DISABLED was intended for two purposes: Drivers can
skip predefined controls not supported by the hardware (although
returning EINVAL would do as well), or disable predefined and private
controls after hardware detection without the trouble of reordering
control arrays and indices (EINVAL cannot be used to skip private
controls because it would prematurely end the enumeration).


>
> That way you can still report it, and you can see what the field values are (if you managed to read them),
> but the control is disabled, i.e. it can't be used.
>
> But it is probably wise to try at least twice to get the value in case it is a transient problem.
>
> Note that I think that v4l2-compliance will complain about the use of that flag, since it
> really shouldn't be used in 'normal' drivers, but it can skip that check if is_uvcvideo is set.

I'd rather not quirk v4l2-compliance. Vendors are starting to use it
to validate their hardware. If v4l2-compliance  complains(ce), then
there is a bigger chance that they will fix it.


If there is no objection I will send a v3 with Hans V. suggestion

Thanks!

>
> Regards,
>
>         Hans
>
> >
> > --
> > ---
> > Changes in v2:
> > - Never return error, even if we are not enumerating the controls
> > - Improve commit message.
> > - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4e58476d305e..43ddc5bb02db 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1307,17 +1307,24 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
> > +             }
> >       }
> >
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> >
> > ---
> > base-commit: 40ed9e9b2808beeb835bd0ed971fb364c285d39c
> > change-id: 20241213-uvc-eaccess-755cc061a360
> >
> > Best regards,
>


-- 
Ricardo Ribalda

