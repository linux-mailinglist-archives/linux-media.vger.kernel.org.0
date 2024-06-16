Return-Path: <linux-media+bounces-13348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005E90A0C7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F2F0B214E6
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF36C73163;
	Sun, 16 Jun 2024 23:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IHE4Kisy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FDB49658
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718580064; cv=none; b=J20/mGPmur+AfTnxd7tNNVyPSwKfa/9gRQz+x8rO7kpChWHVtGFc7rAhMayxETGivnn5Hr2m0aWW33DdXKrNWVy4Fv/FLuJ+xB+kPzmIIWRLSBL9xTvjEptWomep2PCCFitYJf/Dmph0VDJ6D58AC3rd0Jhj00Kzz6M4doxXfQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718580064; c=relaxed/simple;
	bh=JD3Pp6Wkg+Llnof5Fmpvb6JudwCKyIizWDZSOV4GR8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ja30qigjznDAQSpRSi3YaYNUa6jKfQE3zBIb1b4RBHgxLN2M+jWa89ETTyCsFsPzZ6RaXmiHoA6pu1PSFvuBHJIwWDWc174NV72nbmiiPRYOApPtVdjEmCe5qm1+qQs6jaqBTSi8/C3GfOCofxcQi211G6Qxk/vbKtGbCoRbFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IHE4Kisy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7FD42D5;
	Mon, 17 Jun 2024 01:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718580044;
	bh=JD3Pp6Wkg+Llnof5Fmpvb6JudwCKyIizWDZSOV4GR8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHE4Kisy/ENmgWlbQh6GcKGjVweP5AHwl5Jf4qmOTkhrwfE83SFosNroJlFtCiX0r
	 JCSX39hOKqKp9xtEm4df7RxpUVqXBha2DYOBvxhj2cNMxlp9e6Hf+DUVw6ZzX3tmFo
	 oKdCgYwnGF/2FTUr7hsN958RfQm7erDRCkd8PB8E=
Date: Mon, 17 Jun 2024 02:20:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Daniel Schaefer <dhs@frame.work>, linux-media@vger.kernel.org,
	Edgar Thier <info@edgarthier.net>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Levin <ktl@frame.work>
Subject: Re: [PATCH] media: uvcvideo: Override default flags
Message-ID: <20240616232039.GF4782@pendragon.ideasonboard.com>
References: <20240602065053.36850-1-dhs@frame.work>
 <CANiDSCuhOhrN3FaCyFeGgnJ8BD_YDU8ZHq8MrXG3icSNN+iiKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuhOhrN3FaCyFeGgnJ8BD_YDU8ZHq8MrXG3icSNN+iiKg@mail.gmail.com>

On Mon, Jun 03, 2024 at 01:49:51PM +0200, Ricardo Ribalda wrote:
> Hi Daniel
> 
> Thanks for the patch. Some minor nits.
> 
> Feel free to ignore it if you prefer your style.
> 
> On Sun, 2 Jun 2024 at 08:52, Daniel Schaefer <dhs@frame.work> wrote:
> >
> > When the UVC device has a control that is readonly it doesn't set the
> > SET_CUR flag. For example the privacy control has SET_CUR flag set in
> > the defaults in the `uvc_ctrls` variable. Even if the device does not
> > have it set, it's not cleared by uvc_ctrl_get_flags.
> >
> > Originally written with assignment in commit 859086ae3636 ("media:
> > uvcvideo: Apply flags from device to actual properties"). But changed to
> > |= in commit 0dc68cabdb62 ("media: uvcvideo: Prevent setting unavailable
> > flags"). It would not clear the default flags.
> >
> > With this patch applied the correct flags are reported to user space.
> > Tested with:
> >
> > ```
> > > v4l2-ctl --list-ctrls | grep privacy
> > privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
> > ```
> >
> > Cc: Edgar Thier <info@edgarthier.net>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Kieran Levin <ktl@frame.work>
> > Signed-off-by: Daniel Schaefer <dhs@frame.work>
> Fixes: 0dc68cabdb62 ("media: uvcvideo: Prevent setting unavailable flags")
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 26 +++++++++++++++++---------
> >  1 file changed, 17 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4b685f883e4d..f50542e26542 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2031,15 +2031,23 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
> >         else
> >                 ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
> >                                      dev->intfnum, info->selector, data, 1);
> > -       if (!ret)
> > -               info->flags |= (data[0] & UVC_CONTROL_CAP_GET ?
> > -                               UVC_CTRL_FLAG_GET_CUR : 0)
> > -                           |  (data[0] & UVC_CONTROL_CAP_SET ?
> > -                               UVC_CTRL_FLAG_SET_CUR : 0)
> > -                           |  (data[0] & UVC_CONTROL_CAP_AUTOUPDATE ?
> > -                               UVC_CTRL_FLAG_AUTO_UPDATE : 0)
> > -                           |  (data[0] & UVC_CONTROL_CAP_ASYNCHRONOUS ?
> > -                               UVC_CTRL_FLAG_ASYNCHRONOUS : 0);
> > +       if (!ret) {
> > +               info->flags = (data[0] & UVC_CONTROL_CAP_GET)
> > +                       ? (info->flags | UVC_CTRL_FLAG_GET_CUR)
> > +                       : (info->flags & ~UVC_CTRL_FLAG_GET_CUR);
> > +
> > +               info->flags = (data[0] & UVC_CONTROL_CAP_SET)
> > +                       ? (info->flags | UVC_CTRL_FLAG_SET_CUR)
> > +                       : (info->flags & ~UVC_CTRL_FLAG_SET_CUR);
> > +
> > +               info->flags = (data[0] & UVC_CONTROL_CAP_AUTOUPDATE)
> > +                       ? (info->flags | UVC_CTRL_FLAG_AUTO_UPDATE)
> > +                       : (info->flags & ~UVC_CTRL_FLAG_AUTO_UPDATE);
> > +
> > +               info->flags = (data[0] & UVC_CONTROL_CAP_ASYNCHRONOUS)
> > +                       ? (info->flags | UVC_CTRL_FLAG_ASYNCHRONOUS)
> > +                       : (info->flags & ~UVC_CTRL_FLAG_ASYNCHRONOUS);
> > +       }
> 
> nit: I would have done it as
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4b685f883e4d..c453a67e1407 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2031,7 +2031,12 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>         else
>                 ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
>                                      dev->intfnum, info->selector, data, 1);
> -       if (!ret)
> +       if (!ret) {
> +               info->flags &= ~(UVC_CTRL_FLAG_GET_CUR |
> +                               UVC_CTRL_FLAG_SET_CUR |
> +                               UVC_CTRL_FLAG_AUTO_UPDATE |
> +                               UVC_CTRL_FLAG_ASYNCHRONOUS);
> +
>                 info->flags |= (data[0] & UVC_CONTROL_CAP_GET ?
>                                 UVC_CTRL_FLAG_GET_CUR : 0)
>                             |  (data[0] & UVC_CONTROL_CAP_SET ?
> @@ -2040,6 +2045,7 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>                                 UVC_CTRL_FLAG_AUTO_UPDATE : 0)
>                             |  (data[0] & UVC_CONTROL_CAP_ASYNCHRONOUS ?
>                                 UVC_CTRL_FLAG_ASYNCHRONOUS : 0);
> +       }

I prefer that slightly too.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll make the change in my tree, no need to send a v2.

> >
> >         kfree(data);
> >         return ret;

-- 
Regards,

Laurent Pinchart

