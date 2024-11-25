Return-Path: <linux-media+bounces-21990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B65F9D86B0
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5C5BB388B1
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04B21A76D0;
	Mon, 25 Nov 2024 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I5t8TCoY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75801474DA;
	Mon, 25 Nov 2024 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732539527; cv=none; b=MQDGujAtDL5U1AlK82C2UIhvdZtH9TA7vtL+1rTst2Lj33BSxfO18EQ9CHOp8WpSMtPRQi9+eO1uTGLJQNEVVHhP2xcfV7Zs/egWxwBTAnJrxKRzWjY+eoWer9KLt3gqfgeo28419lvqm4zkOkkIPotlnG6ZTVblJ2EP61N/D/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732539527; c=relaxed/simple;
	bh=U0C133PBOhIbbk72L55KqjmAemkPKINGDGqM7GI27Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ea3+fpEJYksPLj8QnO0Dcuyz24ZPYBHM88XskCYgZAaufXQKG+ZzQ+dfmqbD6r5zRKW3ASNkVlyf7Ece/Oe/xp+P+dQUSVPO5u39OmlgLH1RPBgGDjF237E3QXPAt4p/S6BvUZ0gj/5qiCx0s7zVbBrEjfJIlSjx7g5dCRcwVQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I5t8TCoY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50909A2F;
	Mon, 25 Nov 2024 13:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732539502;
	bh=U0C133PBOhIbbk72L55KqjmAemkPKINGDGqM7GI27Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I5t8TCoYGSGNUMMzuug/JcWw0sveyTzIDlx2AnRn2cJVDOW8wDpg5aIYVPAPSMArS
	 O5logEcmnnogGX4jF4rsSRivq+NYCfqdEQnMahWVl92u/77C1sHhsN4sO2XoVcUgfZ
	 tQzWwiifkdCR+Ud9yk/fMQF0rq4gpLVKS8nbD8gc=
Date: Mon, 25 Nov 2024 14:58:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Message-ID: <20241125125834.GC32280@pendragon.ideasonboard.com>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110151426.GD6002@pendragon.ideasonboard.com>
 <CANiDSCsTNuQRXwMqA_YmX4MJ-A8eTi_rEpkd+Qv=Qwbbrj18Yg@mail.gmail.com>
 <123bfac4-389a-400a-8104-afc27124b75d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <123bfac4-389a-400a-8104-afc27124b75d@redhat.com>

On Mon, Nov 25, 2024 at 01:39:05PM +0100, Hans de Goede wrote:
> Hi Ricardo,
> 
> On 10-Nov-24 5:07 PM, Ricardo Ribalda wrote:
> > On Sun, 10 Nov 2024 at 16:14, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> 
> <snip>
> 
> >>>> Here is what I have in mind for this:
> >>>>
> >>>> 1. Assume that the results of trying a specific fmt do not change over time.
> >>>>
> >>>> 2. Only allow userspace to request fmts which match one of the enum-fmts ->
> >>>>    enum-frame-sizes -> enum-frame-rates tripplet results
> >>>>    (constrain what userspace requests to these)
> >>>>
> >>>> 3. Run the equivalent of tryfmt on all possible combinations (so the usaul
> >>>>    3 levels nested loop for this) on probe() and cache the results
> >>>>
> >>>> 4. Make try_fmt / set_fmt not poweron the device but instead constrain
> >>>>    the requested fmt to one from our cached fmts
> >>>>
> >>>> 5. On stream-on do the actual power-on + set-fmt + verify that we get
> >>>>    what we expect based on the cache, and otherwise return -EIO.
> >>>
> >>> Can we start powering up the device during try/set fmt and then
> >>> implement the format caching as an improvement?
> >>
> >> This sounds worth trying. We'll need to test it on a wide range of
> >> devices though, both internal and external.
> > 
> > For what is worth, we have been running something similar to
> > https://lore.kernel.org/linux-media/20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org/
> > in ChromeOS and it has worked fine....
> > 
> > But I am pretty sure that it has issues with async controls :S
> 
> Interesting that is actually a lot more aggressive (as in doing a
> usb_autopm_put_interface() often) then what I expected when you said:
> 
> "Can we start powering up the device during try/set fmt"
> 
> As I mentioned in my other emails what I think would worth nicely
> is delay the initial usb_autopm_get_interface() till we need it
> and then just leave the camera on till /dev/video# gets closed.
> 
> That idea is based on dividing apps in 2 groups:
> 
> 1. Apps just temporarily opening /dev/video# nodes for discovery,
> where we ideally would not power-up the camera.
> 
> 2. Apps (could even be the same app) opening /dev/video# for
> a longer time because it actually want to use the camera
> at the moment of opening and which close the /dev/video# node
> when done with the camera.
> 
> Your code seems to also covers a 3th group of apps:
> 
> 3. Apps opening /dev/video# for a long time, while not using
> it all the time.
> 
> Although it would be nice to also cover those, IMHO those are
> not well behaved apps and I'm not sure if we need to cover those.

Is that right ? Isn't it better for an application to keep the device
open to avoid open delays or even open failures when it wants to use the
device ?

> Although looking back at the libcamera uvc pipeline handler issue
> I fixed recently, that was actually a case of 3.

-- 
Regards,

Laurent Pinchart

