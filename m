Return-Path: <linux-media+bounces-12904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E25902C97
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A61DA1C20C63
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC19415251C;
	Mon, 10 Jun 2024 23:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XVDukOJs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F3C3BB48;
	Mon, 10 Jun 2024 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718063294; cv=none; b=DLTm20SK62Hq+ELoCTPNgJepDHLZYyYsBljpMfQ+CJfTiKppQwj5QXc3VHWIFAo/nhXQ7jvxw47hVd/EroaS5eO35Id8NVoOkiYfCO/egdLAFdYUvvdboOAvAG+Cl6KEwS03X9/gm3Ib28mMEbZzD6tZuWv9f8XxGZfDl01sFVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718063294; c=relaxed/simple;
	bh=oHIfgziPPsbZM/o/5WtRklp62e9dkLY49s/p4ExS3W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iO+4VAaA/PmsmY+sE06V2nmB5kOCNI8ScjCjZkYoFccz7zoz5jleqNszAHfIZGkQQNglxyi3VuEo+zTH8fpXW0LbSiIoh5gtcYvW7j5/cm3rk0WzG5SgXwn4JEnk5od5hL9RhUiNrf/hnSZDuGVWjVme9tcyWfEep3fygb6+Je8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XVDukOJs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E38029A;
	Tue, 11 Jun 2024 01:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718063278;
	bh=oHIfgziPPsbZM/o/5WtRklp62e9dkLY49s/p4ExS3W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVDukOJsQpCrLGEDyQPVCJX8ODyf0Axsrp2fI6qzI6iTnciq4WqhzmRvWSUKI0TiU
	 ppNYRrjEZ7Yn8gFmXB04bKnDbd2SZX3Zx4yzWXgPFVMXX0ApX5EpakZcWPjCFGbJk3
	 XNJNhseSe9Lf/jE/ZC5+GzASqTe74MgWzkCP9MX0=
Date: Tue, 11 Jun 2024 02:47:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] media: uvcvideo: Probe the PLF characteristics
Message-ID: <20240610234750.GC31989@pendragon.ideasonboard.com>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
 <20240318-billion-v1-3-2f7bc0ee2030@chromium.org>
 <20240610141402.GB13744@pendragon.ideasonboard.com>
 <CANiDSCsNdZyKMM82q9SqZ-hQH2Pch24rVCqSs=L6mFL=RbJqQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsNdZyKMM82q9SqZ-hQH2Pch24rVCqSs=L6mFL=RbJqQg@mail.gmail.com>

Hi Ricardo,

On Mon, Jun 10, 2024 at 11:51:55PM +0200, Ricardo Ribalda wrote:
> On Mon, 10 Jun 2024 at 16:14, Laurent Pinchart wrote:
> > On Mon, Mar 18, 2024 at 11:55:25PM +0000, Ricardo Ribalda wrote:
> > > The UVC 1.5 standard defines 4 values for the PLF control: Off, 50Hz,
> > > 60Hz and Auto. But it does not clearly define if all the values must be
> > > implemented or not.
> > >
> > > Instead of just using the UVC version to determine what the PLF control
> > > can do, probe it.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 54 +++++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 50 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 67522143c6c85..9a0b81aca30d1 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -501,12 +501,58 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> > >  static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
> > >       struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
> > >  {
> > > +     const struct uvc_control_mapping *out_mapping =
> > > +                                     &uvc_ctrl_power_line_mapping_uvc11;
> > > +     u8 init_val;
> > > +     u8 *buf;
> >
> >         u8 *buf __free(kfree) = NULL;
> >
> > will simplify the exit paths.
> >
> > > +     int ret;
> > > +
> > > +     buf = kmalloc(sizeof(*buf), GFP_KERNEL);
> > > +     if (!buf)
> > > +             return -ENOMEM;
> > > +
> > > +     /* Save the default PLF value, so we can restore it. */
> > > +     ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> > > +                          chain->dev->intfnum, ctrl->info.selector,
> > > +                          buf, sizeof(*buf));
> >
> > That's the current value, not the default. Is that intended ?
> 
> Yes, the driver does not init the other controls to the default value.
> So I'd rather be consistent.

I'm fine with that, let's update the comment to "Save the current PLF
value".

> > > +     /* If we cannot read the control skip it. */
> > > +     if (ret) {
> > > +             kfree(buf);
> > > +             return ret;
> > > +     }
> > > +     init_val = *buf;
> > > +
> > > +     /* If PLF value cannot be set to off, it is limited. */
> > > +     *buf = V4L2_CID_POWER_LINE_FREQUENCY_DISABLED;
> > > +     ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> > > +                          chain->dev->intfnum, ctrl->info.selector,
> > > +                          buf, sizeof(*buf));
> > > +     if (ret) {
> > > +             out_mapping = &uvc_ctrl_power_line_mapping_limited;
> > > +             goto end;
> >
> > If setting the value failed you don't need to restore it, do you ?
> >
> > > +     }
> > > +
> > > +     /* UVC 1.1 does not define auto, we can exit. */
> > >       if (chain->dev->uvc_version < 0x150)
> > > -             return __uvc_ctrl_add_mapping(chain, ctrl,
> > > -                                           &uvc_ctrl_power_line_mapping_uvc11);
> > > +             goto end;
> > > +
> > > +     /* Check if the device supports auto. */
> > > +     *buf = V4L2_CID_POWER_LINE_FREQUENCY_AUTO;
> > > +     ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> > > +                          chain->dev->intfnum, ctrl->info.selector,
> > > +                          buf, sizeof(*buf));
> >
> > Now for the real annoying question. I've encountered quite a few devices
> > that would crash when the driver tried to get/set lots of controls at
> > probe time. This is why the control cache is populated the first time a
> > control is queried, and not when the device is probed. I'm always
> > worried when adding more control accesses at probe time that some
> > devices will behave improperly.
> 
> If we encounter a device like that we could quirk it.

Now we could place bets on what is less likely to scale, quirking
devices that have a bad PLF implementation, or quirking devices whose
firmware will crash when queried too much at probe time :-)

> > Given the number of UVC users I tend to be on the conservative side, but
> > obviously, if we were to strictly avoid new access patterns to the
> > device, the driver wouldn't be able to evolve. I do like patches 4/5 and
> > 5/5, so I'm tempted to take the risk and revert this series later if
> > needed. That would likely make some other users unhappy if they rely on
> > the heuristic.
> >
> > Another issue is how to get vendors to implement the power line
> > frequency control correctly. With the series applied, vendors won't
> > notice they're doing something wrong. Of course, they probably don't
> > check the behaviour of their devices with Linux in the first place, so
> > I'm not sure what we could do.
> 
> We can add the check to v4l2-compliance....
> 
> Although I would love to see a uvc-compliance tool. If the tool can be
> easily run in windows/linux without a driver I guess ISP vendors will
> run it to validate their code.

*without a driver* is doable with libusb but would be *lots* of work,
basically duplicating the whole uvcvideo driver in userspace. That's not
a project I would start, but it would be interesting.

> Right now there is no way to validate a usb camera beyond: it runs in
> windows and in cheese.

Isn't the USB-IF supposed to have a compliance test suite ? Given all
the broken devices we hear about, it must either not be very good, or
not be used by vendors.

I think a compliance tool based on top of the uvcvideo kernel driver
would already be a good step forward.

> > > +     if (!ret)
> > > +             out_mapping = &uvc_ctrl_power_line_mapping_uvc15;
> > > +
> > > +end:
> > > +     /* Restore initial value and add mapping. */
> > > +     *buf = init_val;
> > > +     uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> > > +                    chain->dev->intfnum, ctrl->info.selector,
> > > +                    buf, sizeof(*buf));
> > >
> > > -     return __uvc_ctrl_add_mapping(chain, ctrl,
> > > -                                   &uvc_ctrl_power_line_mapping_uvc15);
> > > +     kfree(buf);
> > > +     return __uvc_ctrl_add_mapping(chain, ctrl, out_mapping);
> > >  }
> > >
> > >  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {

-- 
Regards,

Laurent Pinchart

