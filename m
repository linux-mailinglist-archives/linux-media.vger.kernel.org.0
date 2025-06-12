Return-Path: <linux-media+bounces-34599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3587CAD6C7C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D1C3189FA91
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08B422B8D0;
	Thu, 12 Jun 2025 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wF+mCh/5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FAF1A5BBA;
	Thu, 12 Jun 2025 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721465; cv=none; b=Wuj0VRfzwvzqiMdsmG2NfeKdP5VoCiVfpxJttACcB0GrYGX9qhmC7AtgVVpAiOb+sFygysbjbrC5UliT6Fa3w98r/24ERA8I/Jc2dLCHWpaURN7qpS6EdcxI2c0WX8QhuXIju/MsVbEHXyz1uosHkz+zqyzAJYS4hMOPZurWchQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721465; c=relaxed/simple;
	bh=3UIgJvgNqVEigrt+4WeOo1m3tKPDdhDMxKxI0QCtF3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDWScTNNeRcFfb4C/VpTyYnHTGX6g7T3TzOGA1pTBwpo+xejvCMmzDPZGELNib/NHgh1jbE6upcVhx4Cq0waAbQdmtfXUm2sf0cTZU1GvrIIpAMYxv/q5DFxC6d0HH7jI9J8tRterYcSZkHciwfSxatngv8dRDti+3MWNRyqi64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wF+mCh/5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60573B5;
	Thu, 12 Jun 2025 11:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749721453;
	bh=3UIgJvgNqVEigrt+4WeOo1m3tKPDdhDMxKxI0QCtF3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wF+mCh/5weuWgfRhLysnMjq/tePMc+w2BXibU7e+F/c0YQddqT0epaR6uxoRjWMwR
	 lwARHx+bFh+gVM44Q1njt7XsMaKsdp02mFFM4C3tdpp7pTB6pt6zzEyA5npQbnsfow
	 QcNAC7T0lJO4qULsyPDIKTU1W+xkVakXNVEbDXDU=
Date: Thu, 12 Jun 2025 12:44:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 12/12] media: rcar-vin: Fold event notifier into only
 user
Message-ID: <20250612094408.GD25137@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-13-niklas.soderlund+renesas@ragnatech.se>
 <20250612002816.GD22977@pendragon.ideasonboard.com>
 <20250612072240.GF330732@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612072240.GF330732@ragnatech.se>

On Thu, Jun 12, 2025 at 09:22:40AM +0200, Niklas Söderlund wrote:
> On 2025-06-12 03:28:16 +0300, Laurent Pinchart wrote:
> > On Fri, Jun 06, 2025 at 08:26:06PM +0200, Niklas Söderlund wrote:
> > > With Gen2 converted to use the common media device there is only one
> > > caller left for the helper to notify a video device of an event, fold it
> > > in.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > > * Changes since v4
> > > - Broken out from larger patch.
> > > ---
> > >  .../platform/renesas/rcar-vin/rcar-v4l2.c     | 20 +++++++------------
> > >  1 file changed, 7 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > index 2bf94bd77c24..59b01cb0628a 100644
> > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > @@ -656,18 +656,6 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
> > >  	video_unregister_device(&vin->vdev);
> > >  }
> > >  
> > > -static void rvin_notify_video_device(struct rvin_dev *vin,
> > > -				     unsigned int notification, void *arg)
> > > -{
> > > -	switch (notification) {
> > > -	case V4L2_DEVICE_NOTIFY_EVENT:
> > > -		v4l2_event_queue(&vin->vdev, arg);
> > > -		break;
> > > -	default:
> > > -		break;
> > > -	}
> > > -}
> > > -
> > >  static void rvin_notify(struct v4l2_subdev *sd,
> > >  			unsigned int notification, void *arg)
> > >  {
> > > @@ -693,7 +681,13 @@ static void rvin_notify(struct v4l2_subdev *sd,
> > >  		if (remote != sd)
> > >  			continue;
> > >  
> > > -		rvin_notify_video_device(vin, notification, arg);
> > > +		switch (notification) {
> > > +		case V4L2_DEVICE_NOTIFY_EVENT:
> > > +			v4l2_event_queue(&vin->vdev, arg);
> > > +			break;
> > > +		default:
> > > +			break;
> > > +		}
> > 
> > How about
> > 
> > 		if (notification == V4L2_DEVICE_NOTIFY_EVENT)
> > 			v4l2_event_queue(&vin->vdev, arg);
> > 
> > Unless you expect more notifications to be handled later ?
> 
> I do, I have a different series that tries to notify CSI-2 errors to 
> user-space with events. The series was posted in 2021 and I need to get 
> back to it at some point ;-)

Could the event be sent on the subdev instead of the video device ?

> As this just moves the existing structure around I would prefere to keep 
> it as-is for now.

OK.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > >  	}
> > >  }
> > >  

-- 
Regards,

Laurent Pinchart

