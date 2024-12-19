Return-Path: <linux-media+bounces-23807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A889F7E91
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6DAD167714
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 15:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA49228CA0;
	Thu, 19 Dec 2024 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H36U5rjX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC8226883
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734623653; cv=none; b=BMb9S3ypvA9d+q1YexNOprvrMOYLuJ3kWE2tBf00erebZtMIWRRG57Jcfz3BsJvP7hscpZ6UTl3Nl+39pdIP0nSlOil0iZaeySMttSMUvUctOycEJ6CeJU6QaiuVKcShW5s3XmA4jaQrBUO9BQxdUT1HrjYUyjGZid7ITOx7fnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734623653; c=relaxed/simple;
	bh=GUdh9+ShxxVaSJIY9izvLq/t+82AtLOkFezuuqRAHnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbNxcHEtC0/bZyZ1KlEArwOLlCsfmJxunwAGt0+OMHfwR3cFUScpkD11DM5QmPKFAGaM4l+zU2acZt2QYAK8KVBHMdwVR00SDPzF7eLjPA6Y1RPr2uVhGSgCPeNwxjyrbik7Fx/0aVIvuTRRp5lIkbswBq3utHM0PqiEDx6rn5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H36U5rjX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-728f337a921so1065216b3a.3
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734623650; x=1735228450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gSW/vuVOQ6APTJZdPyormuri5ApB6qtpJ6fEVPwCiXI=;
        b=H36U5rjXDC/B0zyACLA9WNvOHJDgZTIiU5Fpva8DXoxLPZMfSIl6IbwGSwqLWCo8hQ
         2qDZL46C5dnCVprn2wMq0rqvv85Tf4MmdTvo4eSFGQ0KGc/z4XaYoaHFTf+7QGvq1Gq6
         +k8myRyGt/h03sgVOpO9RbkkrVQB50OnOqZrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734623650; x=1735228450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSW/vuVOQ6APTJZdPyormuri5ApB6qtpJ6fEVPwCiXI=;
        b=HKhBPjL6mEeROVeIwgYcHQA8NjFDiVB1ddIHJvaOaOJQ+JlqzUsazLelfe/lL3mKib
         +3sKqI8cCeeTkigK33+6WJW7lA5MX9ZEY5RNxmjHAz5RuBf0OTe/8G0Js8dHVQtXFfEQ
         oXmzpWPpwPnN7VpWWSpNHLFZU90qSn/5rxQ3vXAUK0U5znDa4lN7gI0tSEPAGzbcZhvK
         M8BB27JXoOcgvgBGarx7HuS5WMyhfctE8EwMV+ZCNQNJbyoYtPjrFwNaCgam/zoDFiuK
         UkfPXdS7gu2Ip5ttRQVJTYkm5uSSwcVDITPhvqIC6R5fLYQUjZokHOH2dKLXx7ROQKen
         xfbw==
X-Forwarded-Encrypted: i=1; AJvYcCWrscpnX9f1nU1dM+b0/7SxnZGCUOSIkt6rRMc4HngBb74hNPWMDoALN1VgDXmlzrcI1rEJcNJV/KMp+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywidqxf/fVYn5wMC9j4yD6Ts5e495K23U4iSD1IjCE+u0UeToMk
	QSDAbl7q1pAo1xwg8kZa2F1pUvMHqqIVcbSnvBV+8WFualyJM4goLwGsk6kKilIk9Lo9/QZg4Cs
	=
X-Gm-Gg: ASbGncsYqLrs5M6kcNTp2JT44hiRwmpcy3ewailOTG1F8rYO0DKgAw3mmZzkv1W6SXY
	RaFvasoJuB4N+BAXZe/WVIHsGU5E01OougNXLZfaXT03shvGm6yqIYVVGPyXdxUChSX4DLjU35x
	7jo1FEeB9w7hndpewpcE2dAQcsTYiCf0l0vpyx0KLXmzGSEc00jwid/aoBkT1d8HdoRA5nkDDIw
	Ml3TN8PgjcpBt8f9po7pDrdaAe1WwwxUVq/tj2VOyCxPwNhy4UGakkTGroO4QuH8/ItfvFXDnsn
	QyGWnpco8PlQqTbTAh4=
X-Google-Smtp-Source: AGHT+IHTCgG3sOkn8gxSruAfYlWxx6cpubSoAhS2bAlmJ4bfktpjJHFdBsRWkc+4IGXq/M6EKKOebA==
X-Received: by 2002:a05:6a00:124a:b0:725:ef4b:de33 with SMTP id d2e1a72fcca58-72aa88f2fe7mr6388111b3a.0.1734623650418;
        Thu, 19 Dec 2024 07:54:10 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbb5asm1453013b3a.93.2024.12.19.07.54.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 07:54:09 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so874437a91.3
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 07:54:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNoV8tLFVYJgUTkz3H3pshm7GiEjS6nP9qtZ7TRmEFkVKixJ1vPucstOvQKYA4AYuBd1MRDBQ2NRiwag==@vger.kernel.org
X-Received: by 2002:a17:90a:e185:b0:2ee:a127:ba8b with SMTP id
 98e67ed59e1d1-2f443d715bcmr5138969a91.36.1734623648318; Thu, 19 Dec 2024
 07:54:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
 <20241218232730.GF5518@pendragon.ideasonboard.com> <CANiDSCu4krUbXq_RiaP5dSZVGdA6CxmUBzxEEPqMNCS4Ar05mw@mail.gmail.com>
 <20241219144124.GB2510@pendragon.ideasonboard.com> <CANiDSCtbkitSDkk-gsb1XwKyYWeCb6pVZJQhYGQjtAyM36oTmA@mail.gmail.com>
 <20241219154103.GD19884@pendragon.ideasonboard.com>
In-Reply-To: <20241219154103.GD19884@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Dec 2024 16:53:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCshYk2OyF_p1inwSdEhMnP0OV2vStFgbMgEHJZzLcG9pg@mail.gmail.com>
X-Gm-Features: AbW1kvanbisHHJmmYOA4q_mgmiCDf0ymZWDTZ0rmDLBlyqU9tOcHJXjZnLn9MW4
Message-ID: <CANiDSCshYk2OyF_p1inwSdEhMnP0OV2vStFgbMgEHJZzLcG9pg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating controls
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2024 at 16:41, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Dec 19, 2024 at 04:35:37PM +0100, Ricardo Ribalda wrote:
> > On Thu, 19 Dec 2024 at 15:41, Laurent Pinchart wrote:
> > > On Thu, Dec 19, 2024 at 09:17:31AM +0100, Ricardo Ribalda wrote:
> > > > On Thu, 19 Dec 2024 at 00:27, Laurent Pinchart wrote:
> > > > > On Fri, Dec 13, 2024 at 11:21:02AM +0000, Ricardo Ribalda wrote:
> > > > > > To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
> > > > > > values that were not cached previously. If that read fails, we used to
> > > > > > report back the error to the user.
> > > > > >
> > > > > > Unfortunately this does not play nice with userspace. When they are
> > > > > > enumerating the contols, the only expect an error when there are no
> > > > > > "next" control.
> > > > > >
> > > > > > This is probably a corner case, and could be handled in userspace, but
> > > > > > both v4l2-ctl and yavta fail to enumerate all the controls if we return
> > > > > > then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
> > > > > > userspace apps handling this wrongly as well.
> > > > > >
> > > > > > This patch get around this issue by ignoring the hardware errors and
> > > > > > always returning 0 if a control exists.
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > ---
> > > > > > Hi 2*Hans and Laurent!
> > > > > >
> > > > > > I came around a device that was listing just a couple of controls when
> > > > > > it should be listing much more.
> > > > > >
> > > > > > Some debugging latter I found that the device was returning -EIO when
> > > > > > all the focal controls were read.
> > > > >
> > > > > Was it transient and random errors, or does the device always fail for
> > > > > those controls ?
> > > >
> > > > For one of the devices the control is always failing (or I could not
> > > > find a combination that made it work).
> > > >
> > > > For the other it was more or less random.
> > >
> > > Are there other controls that failed for that device ? And what
> > > request(s) fail, is it only GET_CUR or also GET_MIN/GET_MAX/GET_RES ?
> >
> > It is a mix.
> >
> > > What's the approximate frequency of those random failures ?
> > >
> > > > > > This could be solved in userspace.. but I suspect that a lot of people
> > > > > > has copied the implementation of v4l-utils or yavta.
> > > > > >
> > > > > > What do you think of this workaround?
> > > > >
> > > > > Pretending that the control could be queried is problematic. We'll
> > > > > return invalid values to the user, I don't think that's a good idea. If
> > > > > the problematic device always returns error for focus controls, we could
> > > > > add a quirk, and extend the uvc_device_info structure to list the
> > > > > controls to ignore.
> > > > >
> > > > > Another option would be to skip over controls that return -EIO within
> > > > > the kernel, and mark those controls are broken. I think this could be
> > > > > done transparently for userspace, the first time we try to populate the
> > > > > cache for such controls, a -EIO error would mark the control as broken,
> > > > > and from a userspace point of view it wouldn't be visible through as
> > > > > ioctl.
> > > >
> > > > I see a couple of issues with this:
> > > > - There are controls that fail randomly.
> > > > - There are controls that fail based on the value of other controls
> > > > (yeah, I know).
> > >
> > > I was fearing there would be random (or random-looking) failures, as
> > > that can preclude marking the controls as broken and fully hiding them
> > > from userspace :-(
> > >
> > > > - There are controls that do not implement RES, MIN, or MAX, but
> > > > besides that, they are completely functional.
> > > > In any of those cases we do not want to skip those controls.
> > > >
> > > > I am not against quirking specific cameras once we detect that they
> > > > are broken...
> > >
> > > Hopefully there won't be too many of those, right ? Righhhht... ?
> >
> > So far I have identified 4 in a week, and I am not testing obscure
> > camera modules....
>
> Can you provide more information about those modules ? USB descriptors
> maybe, and the list of controls that fail, and how they fail ?

These are the ones I can share now:

"13d3:5519": Focus value out of range
focus_absolute 0x009a090a (int)    : min=355 max=790 step=1 default=6
value=500 flags=inactive

"3277:0003": Focus returns -EIO
Focus Absolute and Focus, Automatic Continuous: return -EIO for at
least one of get_ max/min/res

"0408:302f": Error reading AutoExposure Flags
UVC_GET_INFO returns invalid flags


>
> > > > but we still need a solution for every camera that
> > > > allows enumerating all the controls, even if there is a non compliant
> > > > control.
> > >
> > > I'm quite concerned by this. Faking success in QUERYCTRL when we don't
> > > know the actual control min/max values is really bad. For transient
> > > failures, we may work around with a retry. For devices that fail all the
> > > time, we can blacklist the controls with quirks. For other devices...
> > > you know, at some point we need to get the hardware shipped back to the
> > > manufacturer.
> >
> > What I have seen is that a simple retry will always fail. In some
> > modules you can "fix" the control by changing the value of other
> > controls or changing the format.
> >
> > If we look at the big picture, this is not worse than a control that
> > returns invalid min/max/res. We already have plenty of those and in
> > those cases we return 0...
> > In my opinion an QUERYCTRL with invalid values is much better than
> > hidding valid controls.
> >
> > I would like to support as much hardware as possible, even the broken one.
> >
> > I believe that we should either apply a patch like this :
> > https://lore.kernel.org/linux-media/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org/
> >
> > or we should copy the content of  v4l2_queryctrl to userspace when an
> > error happens, and modify v4l2-ctl and yavta. I do not know what Hans
> > thinks about this.
>
> Let's see what Hans thinks.
>
> > > > Now that I look into the patch... I think I have to remove the
> > > > can_fail argument and let it always remove invalid values.
> > > >
> > > > > > Without this patch:
> > > > > > $ v4l2-ctl --list-ctrls
> > > > > >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> > > > > >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> > > > > >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > > > > > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> > > > > >
> > > > > > With this patch:
> > > > > > $ v4l2-ctl --list-ctrls
> > > > > >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> > > > > >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> > > > > >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > > > > > error 5 getting ext_ctrl Focus, Absolute
> > > > > > error 5 getting ext_ctrl Focus, Automatic Continuous
> > > > > >    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
> > > > > > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> > > > > >
> > > > > > --
> > > > > > ---
> > > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 31 ++++++++++++++++++++++---------
> > > > > >  1 file changed, 22 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > index 4fe26e82e3d1..a11048c9a105 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > @@ -1283,7 +1283,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> > > > > >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > > > >       struct uvc_control *ctrl,
> > > > > >       struct uvc_control_mapping *mapping,
> > > > > > -     struct v4l2_queryctrl *v4l2_ctrl)
> > > > > > +     struct v4l2_queryctrl *v4l2_ctrl,
> > > > > > +     bool can_fail)
> > > > > >  {
> > > > > >       struct uvc_control_mapping *master_map = NULL;
> > > > > >       struct uvc_control *master_ctrl = NULL;
> > > > > > @@ -1307,17 +1308,28 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > > > >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > > > > >               s32 val;
> > > > > >               int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > > > > > -             if (ret < 0)
> > > > > > -                     return ret;
> > > > > >
> > > > > > -             if (val != mapping->master_manual)
> > > > > > -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > > > > > +             if (ret < 0) {
> > > > > > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > > > > > +                                          "UVC non compliance: Error %d querying master control %x\n",
> > > > > > +                                           ret, master_map->id);
> > > > > > +                     if (can_fail)
> > > > > > +                             return ret;
> > > > > > +             } else if (val != mapping->master_manual) {
> > > > > > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > > > > > +             }
> > > > > >       }
> > > > > >
> > > > > >       if (!ctrl->cached) {
> > > > > >               int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > > > > > -             if (ret < 0)
> > > > > > -                     return ret;
> > > > > > +
> > > > > > +             if (ret < 0) {
> > > > > > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > > > > > +                                          "UVC non compliance: Error %d populating cache of control %x\n",
> > > > > > +                                          ret, mapping->id);
> > > > > > +                     if (can_fail)
> > > > > > +                             return ret;
> > > > > > +             }
> > > > > >       }
> > > > > >
> > > > > >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> > > > > > @@ -1420,7 +1432,8 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > > > >                       goto done;
> > > > > >       }
> > > > > >
> > > > > > -     ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
> > > > > > +     ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl,
> > > > > > +                                 !(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL));
> > > > > >  done:
> > > > > >       mutex_unlock(&chain->ctrl_mutex);
> > > > > >       return ret;
> > > > > > @@ -1513,7 +1526,7 @@ static void uvc_ctrl_fill_event(struct uvc_video_chain *chain,
> > > > > >  {
> > > > > >       struct v4l2_queryctrl v4l2_ctrl;
> > > > > >
> > > > > > -     __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl);
> > > > > > +     __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl, true);
> > > > > >
> > > > > >       memset(ev, 0, sizeof(*ev));
> > > > > >       ev->type = V4L2_EVENT_CTRL;
> > > > > >
> > > > > > ---
> > > > > > base-commit: a7f5b36b34824415c28875d615c49a3cf5070615
> > > > > > change-id: 20241213-uvc-eaccess-755cc061a360
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

