Return-Path: <linux-media+bounces-8356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF388894DD7
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 10:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FE091F22A60
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 08:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39CE4B5CD;
	Tue,  2 Apr 2024 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="hioEYQq0"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E5446B80
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712047581; cv=pass; b=iW3g+45T+tPAFKlcE90cg+vM2G4xtfJwyhy2NvOmFPy43m4r8j9Dxa9kf2ajCwheCYwLX/xWEzp0Hy/gZmvNuey2ta1cyNbKvvRHoxBn/zCCz1SpnimQxqJK6pa8OErvaevs/MBE2Mn0SwIrRaJiECuFtmyExEDgMGIGitiqZjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712047581; c=relaxed/simple;
	bh=3VcUTZtZWOreFBclTMvj3564dfq7uPciavHMGoCYE0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lobCDHqxcPQotoydSUY12wRe0gXjjfDI1+AIgnEdr5BnOlI60JEdE1kKzg2ZX+VW7fm2q/9I3vEok5CAUmZWvb9JGcST5lWIYUX5ZHvj6jytGBEO7YvASw9eHqrPTAqNkBh+1tBmbL3HfMD5UdSg4EV+tDwEp9pXIaJFC03P07w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=hioEYQq0; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4V81gr3VQpz49Psw;
	Tue,  2 Apr 2024 11:46:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1712047576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fbMm7zB8ATioflRmyHgl+yxvqEIYtcQYvNUus6FU6ZA=;
	b=hioEYQq08Ryn1Hyr8mu4zx0wVsFurewrRpENFSFddZ7ikgQNczrREl8aLzqE8toI3HyafF
	arDMKnGTuXzhissNj9wIBZj4wO9uVzQkEtjD+TkH0LVVA0t4+/Y1NJath00PcVvLi2y01v
	bAQjDGvjzqgNEYkNXmq6BtEdg0I1rzhW2u6zc94O6RD46BPrIoEpVENMSthXb7SSfpHtTq
	t8s89AwHG0095hrEkbWOOjUqBcthLtUA0Yi17tXYp83OpCnDB2QqbnfReC3wJavjyO1Nsm
	c4lIV80KRyDnJv/QXBXmZ08AjIzCGcfzHw4iI3MpSpl/K4E4nNdF/NawHP0dHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1712047576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fbMm7zB8ATioflRmyHgl+yxvqEIYtcQYvNUus6FU6ZA=;
	b=DYTo+o8yC230VDUShlvRoyI1G/LOX+km2z2iPj/tr2QHFNWQnbBavmcrkOyzOUNLuq5g8K
	puHIZO7N3IS5ou0tJ7x7WDPxOGfYfDIhZ3lOmjxpBBG8LsxFPfdk8jnVL4vnNo6x9p3AMr
	8Nwl3CK60pTFEnvtCKcIyDH4KXelOxaovCLldAthg4lqcCdbpL8hA9gtSxqeupAU4XcSd1
	XbrDYlaZG6YmpG0MflETnPrclLxIg82Tezkb/c5IILIb8eRWD1J5gHYYeYf/Zw2RQbuhJa
	809CW5soDJq4PUZDDwlpizSv/nfpM3elB6qPp7USwc+LC4NIzIzQYg6WeHYQAg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1712047576; a=rsa-sha256;
	cv=none;
	b=Dm4KgI1+eGL9dHxHq+Lst+oFEfcprz3wNRVptzP4hCFvMFGNDWFWLvS79cYCEBQWDEVP0m
	8Stko+Hiw7V5+r2cIWC5KksTVr3k8upBFJkWtErA1MMJ+JKtOkjOinXERK8tIydEqOKdFe
	klQZb9L/tgoPOsWjAd6bUHgWcPUmzLPZb5l8ajOOtTo0RRVzUXzz6drlJB7sVFtB05FnXc
	fPKkT9+DTZFAVxK1UJYF/LqaYB0mhF7k/QByx11Fkvoq7TMrerXuZ9y+ociaqLEw2OQfu5
	Aj5yfEAx9AH2KTtO+YIu3PpUmUEdD2vNcAMdwdGSjFkij4P9I8Ou/zkWUncemQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 183E1634C93;
	Tue,  2 Apr 2024 11:46:16 +0300 (EEST)
Date: Tue, 2 Apr 2024 08:46:15 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Fix stream handling for crop API
Message-ID: <ZgvF1wi2UpkUTC9-@valkosipuli.retiisi.eu>
References: <20240401233725.2401-1-laurent.pinchart@ideasonboard.com>
 <Zgu_xhcadm2F1Rxl@valkosipuli.retiisi.eu>
 <20240402084407.GC10288@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402084407.GC10288@pendragon.ideasonboard.com>

On Tue, Apr 02, 2024 at 11:44:07AM +0300, Laurent Pinchart wrote:
> On Tue, Apr 02, 2024 at 08:20:22AM +0000, Sakari Ailus wrote:
> > Moi,
> > 
> > On Tue, Apr 02, 2024 at 02:37:25AM +0300, Laurent Pinchart wrote:
> > > When support for streams was added to the V4L2 subdev API, the
> > > v4l2_subdev_crop structure was extended with a stream field, but the
> > > field was not handled in the core code that translates the
> > > VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. Fix it.
> > 
> > The field is indeed in the UAPI headers. But do we want to support the CROP
> > IOCTL for streams? Shouldn't the callers be using the [GS]_SELECTION
> > instead?
> 
> They should, but if the field is there, we should support it :-) The
> alternative is to remove it. It will cause failures in v4l2-compliance
> that we'll need to handle though.

I'd prefer to stick to selections here, this is new functionality so
[GS]_CROP support isn't required. I don't have a strong opinion on the
matter though.

> 
> > > Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 4c6198c48dd6..45836f0a2b0a 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -732,6 +732,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  		memset(&sel, 0, sizeof(sel));
> > >  		sel.which = crop->which;
> > >  		sel.pad = crop->pad;
> > > +		sel.stream = crop->stream;
> > >  		sel.target = V4L2_SEL_TGT_CROP;
> > >  
> > >  		rval = v4l2_subdev_call(
> > > @@ -756,6 +757,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  		memset(&sel, 0, sizeof(sel));
> > >  		sel.which = crop->which;
> > >  		sel.pad = crop->pad;
> > > +		sel.stream = crop->stream;
> > >  		sel.target = V4L2_SEL_TGT_CROP;
> > >  		sel.r = crop->rect;
> > >  
> > > 
> > > base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus

