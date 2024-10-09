Return-Path: <linux-media+bounces-19328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C77BA996EF4
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 16:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C765284C44
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 14:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498741D2785;
	Wed,  9 Oct 2024 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cAFkyQ5P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15041199FDE;
	Wed,  9 Oct 2024 14:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485858; cv=none; b=BXZ6RwUAZguR+dbnFbw89k1QPFTruD5OCwL0tmtm6tSFXbnT3TKdBbNO0K+9djw9GIHYMrqr3HDvdwukvBaUI5Wj1JYIxBzJtyWPiqwU9ZfOu0vva/Sg6FxGClpZdVg3K39Xsu/uQjVIDOgKzf1Y37HkRsgbe8QOs+vbmhMAR+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485858; c=relaxed/simple;
	bh=j0cEzanLX1CYnvQvAA99nHokiocU8wYsKgvYal2Ot1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UN+Tzu3sHIwguoZudzdDaHQtKvVIO+9iHfRRAAIl37yY7lF6GOVfgPAlAj2zyiH5WybLmSdP2V4sPjBT/9xNcC7QZYlRT+U0lvpq0pxunPIRO8vKTAr+8qbQkg6SLEoSbtwrarhkmJ+Y4tXGulU2N+jFvewIsosMNFrCKAG1XxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cAFkyQ5P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 780E12EC;
	Wed,  9 Oct 2024 16:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728485757;
	bh=j0cEzanLX1CYnvQvAA99nHokiocU8wYsKgvYal2Ot1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAFkyQ5PMoAUGi7K2tHgOnrxoGEPpq4aHZrOCI2XG3+txYsDKXccYdAzEJIXhHnPL
	 e/LPCSkL0Pay82pzgNhdTL1QhE3KrSUVNQ7Lutc9pM3uzPTp4zyKKis/OedV+x5cio
	 5vjExZ/BHbYbqOJYPrrBlay9q5lOLKSmFAeeHCEE=
Date: Wed, 9 Oct 2024 17:57:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] v4l2-subdev: Return -EOPNOTSUPP for unsupported pad
 type in call_get_frame_desc()
Message-ID: <20241009145730.GA16955@pendragon.ideasonboard.com>
References: <20241007123809.89281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241007181654.GD14766@pendragon.ideasonboard.com>
 <ZwYcSZyEFtyl8QpQ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZwYcSZyEFtyl8QpQ@kekkonen.localdomain>

On Wed, Oct 09, 2024 at 06:01:45AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Mon, Oct 07, 2024 at 09:16:54PM +0300, Laurent Pinchart wrote:
> > Hi Prabhakar,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Oct 07, 2024 at 01:38:09PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > 
> > > The `get_frame_desc()` operation should always be called on a source pad,
> > > which is indicated by the `MEDIA_PAD_FL_SOURCE` flag. This patch adds a
> > > check in `call_get_frame_desc()` to ensure that the `MEDIA_PAD_FL_SOURCE`
> > > flag is set for the pad before invoking `get_frame_desc()`. If the pad is
> > > not a source pad, the function will return an `-EOPNOTSUPP` error,
> > > signaling that the operation is not supported on non-source pads.
> > > 
> > > Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v1->v2
> > > - Added a check for CONFIG_MEDIA_CONTROLLER, as the `entity` member in 
> > >   `struct v4l2_subdev` is only available when CONFIG_MEDIA_CONTROLLER
> > >   is enabled.
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index de9ac67574bb..446fbc3805c7 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -325,6 +325,11 @@ static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > >  	unsigned int i;
> > >  	int ret;
> > >  
> > > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > > +	if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
> > 
> > As this should really not happen, I wonder if we shouldn't be more
> > vocal:
> > 
> > 	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
> > 
> > Sakari, what do you think ? Either way,
> 
> I wouldn't as this is probably going to be user-triggerable. The problem
> shouldn't be too hard to find out either.

I don't expect .get_frame_desc() to be callable with user-controllable
arguments, but I'm OK not using WARN_ON().

> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks!

-- 
Regards,

Laurent Pinchart

