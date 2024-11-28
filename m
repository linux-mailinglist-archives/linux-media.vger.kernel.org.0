Return-Path: <linux-media+bounces-22267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E439DBD5C
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CAC5281EBF
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A6A1C3314;
	Thu, 28 Nov 2024 21:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fhs54yuY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE3614E2C0;
	Thu, 28 Nov 2024 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732830461; cv=none; b=E84+N68mUu25HJVvB68wNO1lq1tIhLQK1b6d8Yhk2WCxEug9EvoLxhgckZz0Onq/eWPV1vJ3Uzb3hdAI+CK4X58ifenThGSvSuq6bJYbQc15VsMbPk6ILVjddb+QfdTtRnFPLhKcH0Aava8Gow6/xfSKv8XmqLq6PVmUMth+CxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732830461; c=relaxed/simple;
	bh=DnxXmwuKXAMM+BS6t+coUEjPdZAEYERTEen8ITrr53U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdrO51UE+AFr/RNKH6oRmILiuaxPyuQ61AupKABl3YlFH0nCZyulQsm7kuT1Ia0EFpM8Yh+qShfBq5sP4BRi2Y5CalSFVYtSucg5+dHZs1Zd4z/ONvZp4ZO46uwrTpGLAwW/C7L3oFir2IriYMQab4JYbG8JplEzJ2FL6eEW9n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fhs54yuY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80857526;
	Thu, 28 Nov 2024 22:47:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732830434;
	bh=DnxXmwuKXAMM+BS6t+coUEjPdZAEYERTEen8ITrr53U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fhs54yuYa4lHFkwYCspf0NQK0zntgSLbxFfWQHINNxvV/5qtPTkWw1OSgOtvWOp/I
	 70x29L0lkY9uTB9CpJOAPL7NLp4quX9VsoFq9Msh9oQlGzR9ShuaBr6xRAI3joLSYd
	 slAfUDGBXS4O4kz1JICXNFsxDRPEzcQYwkhKBmnA=
Date: Thu, 28 Nov 2024 23:47:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: uvcvideo: Remove redundant NULL assignment
Message-ID: <20241128214727.GE25839@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-4-510aab9570dd@chromium.org>
 <20241128212628.GD25731@pendragon.ideasonboard.com>
 <CANiDSCvb8OCGJjggermRPeD6R2Rt79hMuwF6xc6YQvvSqUNObA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvb8OCGJjggermRPeD6R2Rt79hMuwF6xc6YQvvSqUNObA@mail.gmail.com>

On Thu, Nov 28, 2024 at 10:34:38PM +0100, Ricardo Ribalda wrote:
> On Thu, 28 Nov 2024 at 22:26, Laurent Pinchart wrote:
> > On Wed, Nov 27, 2024 at 12:14:52PM +0000, Ricardo Ribalda wrote:
> > > ctrl->handle will only be different than NULL for controls that have
> > > mappings. This is because that assignment is only done inside
> > > uvc_ctrl_set() for mapped controls.
> >
> > That seems right. I checked the unplug paths, and the mappings are
> > destroyed from uvc_delete(), after all file handles get closed.
> >
> > I think this patch should go first in the series, as otherwise there's a
> > temporary state where you rely on handle never being touched without
> > holding the proper lock, and this code path violates that requirement.
> > Is there anything I may be missing that would cause issues with
> > bisection if I move this patch at the beginning of the series ?
> 
> You probably want to add the Cc: stable and Fixes: tags if you make
> this patch the first one.

Good point. Given that ctrl->handle for controls without mappings can't
be touched anywhere else, I think it's safe to keep this patch last, and
not backport it. There may be a theoretical issue with mappings
dynamically added at runtime, as the list could then become non-empty
and the condition change, but the condition should never turn from false
to true, only from true to false, so I think it's safe.

I'll keep the patch last.

> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 99ddc5e9dff8..b9c9ff629ab6 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1645,10 +1645,8 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
> > >       struct uvc_device *dev = chain->dev;
> > >       struct uvc_ctrl_work *w = &dev->async_ctrl;
> > >
> > > -     if (list_empty(&ctrl->info.mappings)) {
> > > -             ctrl->handle = NULL;
> > > +     if (list_empty(&ctrl->info.mappings))
> > >               return false;
> > > -     }
> > >
> > >       w->data = data;
> > >       w->urb = urb;

-- 
Regards,

Laurent Pinchart

