Return-Path: <linux-media+bounces-23806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB19F7E45
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB937165BEB
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 15:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8768022618E;
	Thu, 19 Dec 2024 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l+7MRcZY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD9113D279;
	Thu, 19 Dec 2024 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734622873; cv=none; b=GYet+zNMi7YqqKG4SQAaQGcX1V/kHHRzrhLUXivaAkrz85p59vvH+ZfyyKviAefPs5NMKsxuGjk3YYf/xBXik3x4ZOg95vmOE3jALBh06SQycI2zroTWauHoI9p2cnwL/XEYLaIDArH2lwCiJQcnU3zy3Rx8GgRWVJOv2tFb/DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734622873; c=relaxed/simple;
	bh=3XZ0HWAmvFtIZmVHGr2SZoNyQlrw71OilSejPbTnL/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEwfsB6M6wzXzZc9JL3+2eC7ReaFe8fRw2J+iujBeYpgwi0Q9Uib/vO1rAMEvl04nmzN27llusK7U+rXlKFSOk+751ocLhV13/3DZzKrRRr2G0Xs8eWcccXi3SGgEhvRAHCiW+o2+f730GzKNIGZ7JXYh+5BiFrNXppj73JKwP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l+7MRcZY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FB48163;
	Thu, 19 Dec 2024 16:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734622830;
	bh=3XZ0HWAmvFtIZmVHGr2SZoNyQlrw71OilSejPbTnL/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+7MRcZYl5oRcm8cqX0NzExkuamPf3z/QEcTemoDmnqmub4OA0KRns2T0ToXWC3TM
	 kHZ0wGRIhz11ooff0bV8GfHd97T2jIkIvPWicSXI/Scq5cOs+I0Qbw2ur+h2XVO0xA
	 vySIIrSHRHnn8UtpEX366gAwDE0HBzaF94mQqGgk=
Date: Thu, 19 Dec 2024 17:41:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating
 controls
Message-ID: <20241219154103.GD19884@pendragon.ideasonboard.com>
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
 <20241218232730.GF5518@pendragon.ideasonboard.com>
 <CANiDSCu4krUbXq_RiaP5dSZVGdA6CxmUBzxEEPqMNCS4Ar05mw@mail.gmail.com>
 <20241219144124.GB2510@pendragon.ideasonboard.com>
 <CANiDSCtbkitSDkk-gsb1XwKyYWeCb6pVZJQhYGQjtAyM36oTmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtbkitSDkk-gsb1XwKyYWeCb6pVZJQhYGQjtAyM36oTmA@mail.gmail.com>

On Thu, Dec 19, 2024 at 04:35:37PM +0100, Ricardo Ribalda wrote:
> On Thu, 19 Dec 2024 at 15:41, Laurent Pinchart wrote:
> > On Thu, Dec 19, 2024 at 09:17:31AM +0100, Ricardo Ribalda wrote:
> > > On Thu, 19 Dec 2024 at 00:27, Laurent Pinchart wrote:
> > > > On Fri, Dec 13, 2024 at 11:21:02AM +0000, Ricardo Ribalda wrote:
> > > > > To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
> > > > > values that were not cached previously. If that read fails, we used to
> > > > > report back the error to the user.
> > > > >
> > > > > Unfortunately this does not play nice with userspace. When they are
> > > > > enumerating the contols, the only expect an error when there are no
> > > > > "next" control.
> > > > >
> > > > > This is probably a corner case, and could be handled in userspace, but
> > > > > both v4l2-ctl and yavta fail to enumerate all the controls if we return
> > > > > then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
> > > > > userspace apps handling this wrongly as well.
> > > > >
> > > > > This patch get around this issue by ignoring the hardware errors and
> > > > > always returning 0 if a control exists.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > > Hi 2*Hans and Laurent!
> > > > >
> > > > > I came around a device that was listing just a couple of controls when
> > > > > it should be listing much more.
> > > > >
> > > > > Some debugging latter I found that the device was returning -EIO when
> > > > > all the focal controls were read.
> > > >
> > > > Was it transient and random errors, or does the device always fail for
> > > > those controls ?
> > >
> > > For one of the devices the control is always failing (or I could not
> > > find a combination that made it work).
> > >
> > > For the other it was more or less random.
> >
> > Are there other controls that failed for that device ? And what
> > request(s) fail, is it only GET_CUR or also GET_MIN/GET_MAX/GET_RES ?
> 
> It is a mix.
> 
> > What's the approximate frequency of those random failures ?
> >
> > > > > This could be solved in userspace.. but I suspect that a lot of people
> > > > > has copied the implementation of v4l-utils or yavta.
> > > > >
> > > > > What do you think of this workaround?
> > > >
> > > > Pretending that the control could be queried is problematic. We'll
> > > > return invalid values to the user, I don't think that's a good idea. If
> > > > the problematic device always returns error for focus controls, we could
> > > > add a quirk, and extend the uvc_device_info structure to list the
> > > > controls to ignore.
> > > >
> > > > Another option would be to skip over controls that return -EIO within
> > > > the kernel, and mark those controls are broken. I think this could be
> > > > done transparently for userspace, the first time we try to populate the
> > > > cache for such controls, a -EIO error would mark the control as broken,
> > > > and from a userspace point of view it wouldn't be visible through as
> > > > ioctl.
> > >
> > > I see a couple of issues with this:
> > > - There are controls that fail randomly.
> > > - There are controls that fail based on the value of other controls
> > > (yeah, I know).
> >
> > I was fearing there would be random (or random-looking) failures, as
> > that can preclude marking the controls as broken and fully hiding them
> > from userspace :-(
> >
> > > - There are controls that do not implement RES, MIN, or MAX, but
> > > besides that, they are completely functional.
> > > In any of those cases we do not want to skip those controls.
> > >
> > > I am not against quirking specific cameras once we detect that they
> > > are broken...
> >
> > Hopefully there won't be too many of those, right ? Righhhht... ?
> 
> So far I have identified 4 in a week, and I am not testing obscure
> camera modules....

Can you provide more information about those modules ? USB descriptors
maybe, and the list of controls that fail, and how they fail ?

> > > but we still need a solution for every camera that
> > > allows enumerating all the controls, even if there is a non compliant
> > > control.
> >
> > I'm quite concerned by this. Faking success in QUERYCTRL when we don't
> > know the actual control min/max values is really bad. For transient
> > failures, we may work around with a retry. For devices that fail all the
> > time, we can blacklist the controls with quirks. For other devices...
> > you know, at some point we need to get the hardware shipped back to the
> > manufacturer.
> 
> What I have seen is that a simple retry will always fail. In some
> modules you can "fix" the control by changing the value of other
> controls or changing the format.
> 
> If we look at the big picture, this is not worse than a control that
> returns invalid min/max/res. We already have plenty of those and in
> those cases we return 0...
> In my opinion an QUERYCTRL with invalid values is much better than
> hidding valid controls.
> 
> I would like to support as much hardware as possible, even the broken one.
> 
> I believe that we should either apply a patch like this :
> https://lore.kernel.org/linux-media/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org/
> 
> or we should copy the content of  v4l2_queryctrl to userspace when an
> error happens, and modify v4l2-ctl and yavta. I do not know what Hans
> thinks about this.

Let's see what Hans thinks.

> > > Now that I look into the patch... I think I have to remove the
> > > can_fail argument and let it always remove invalid values.
> > >
> > > > > Without this patch:
> > > > > $ v4l2-ctl --list-ctrls
> > > > >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> > > > >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> > > > >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > > > > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> > > > >
> > > > > With this patch:
> > > > > $ v4l2-ctl --list-ctrls
> > > > >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> > > > >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> > > > >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > > > > error 5 getting ext_ctrl Focus, Absolute
> > > > > error 5 getting ext_ctrl Focus, Automatic Continuous
> > > > >    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
> > > > > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> > > > >
> > > > > --
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 31 ++++++++++++++++++++++---------
> > > > >  1 file changed, 22 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > index 4fe26e82e3d1..a11048c9a105 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > @@ -1283,7 +1283,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> > > > >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > > >       struct uvc_control *ctrl,
> > > > >       struct uvc_control_mapping *mapping,
> > > > > -     struct v4l2_queryctrl *v4l2_ctrl)
> > > > > +     struct v4l2_queryctrl *v4l2_ctrl,
> > > > > +     bool can_fail)
> > > > >  {
> > > > >       struct uvc_control_mapping *master_map = NULL;
> > > > >       struct uvc_control *master_ctrl = NULL;
> > > > > @@ -1307,17 +1308,28 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > > >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > > > >               s32 val;
> > > > >               int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > > > > -             if (ret < 0)
> > > > > -                     return ret;
> > > > >
> > > > > -             if (val != mapping->master_manual)
> > > > > -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > > > > +             if (ret < 0) {
> > > > > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > > > > +                                          "UVC non compliance: Error %d querying master control %x\n",
> > > > > +                                           ret, master_map->id);
> > > > > +                     if (can_fail)
> > > > > +                             return ret;
> > > > > +             } else if (val != mapping->master_manual) {
> > > > > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > > > > +             }
> > > > >       }
> > > > >
> > > > >       if (!ctrl->cached) {
> > > > >               int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > > > > -             if (ret < 0)
> > > > > -                     return ret;
> > > > > +
> > > > > +             if (ret < 0) {
> > > > > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > > > > +                                          "UVC non compliance: Error %d populating cache of control %x\n",
> > > > > +                                          ret, mapping->id);
> > > > > +                     if (can_fail)
> > > > > +                             return ret;
> > > > > +             }
> > > > >       }
> > > > >
> > > > >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> > > > > @@ -1420,7 +1432,8 @@ int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > > >                       goto done;
> > > > >       }
> > > > >
> > > > > -     ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl);
> > > > > +     ret = __uvc_query_v4l2_ctrl(chain, ctrl, mapping, v4l2_ctrl,
> > > > > +                                 !(v4l2_ctrl->id & V4L2_CTRL_FLAG_NEXT_CTRL));
> > > > >  done:
> > > > >       mutex_unlock(&chain->ctrl_mutex);
> > > > >       return ret;
> > > > > @@ -1513,7 +1526,7 @@ static void uvc_ctrl_fill_event(struct uvc_video_chain *chain,
> > > > >  {
> > > > >       struct v4l2_queryctrl v4l2_ctrl;
> > > > >
> > > > > -     __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl);
> > > > > +     __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl, true);
> > > > >
> > > > >       memset(ev, 0, sizeof(*ev));
> > > > >       ev->type = V4L2_EVENT_CTRL;
> > > > >
> > > > > ---
> > > > > base-commit: a7f5b36b34824415c28875d615c49a3cf5070615
> > > > > change-id: 20241213-uvc-eaccess-755cc061a360

-- 
Regards,

Laurent Pinchart

