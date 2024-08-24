Return-Path: <linux-media+bounces-16705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0295DEF8
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 18:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A2A61F21F56
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 16:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4C9153BD9;
	Sat, 24 Aug 2024 16:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="CUiFKkci"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601FA29A1
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 16:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724516896; cv=pass; b=N5m+AcfNuwjapwYxqxM64S4TqrY3szo+hs4y/W5GOLNHpy6CB2DVaePbuynrPNHU7PMZuXk/pWAXibz7Hhc84v0t15nlLybm1SxfVrUK2Sd/qo18OimYliKsKLy/xZ9kx4OB3Pp9uZBEmBqkAjwTnaKeQNjH5Dc8sIpjPSHaHx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724516896; c=relaxed/simple;
	bh=+GVkCriykzb3CsXh807E/7VlIN3zNPUHA40aO0KkyI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdbghwcgS3b0esG8Ekj0Xhult5+ECwwGp8j49flCf2eY9gsAbXc+N4dfFmTX9VG1GdzhUyYAG4sXuWg0Wh1NRg+yng84r81m1BRtJMsNd6fpmdJooTZ+v/uV9wenqsTMNGM7S0NFNv5txDqz8KjDaKkcYky0d++eQN9cg6vHayA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=CUiFKkci; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Wrj6K0fNrz49Px6;
	Sat, 24 Aug 2024 19:28:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1724516889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QaU5cOO39+RJRObfIS1hBUghsjPHGWCpMnbwRbKIVdg=;
	b=CUiFKkciMZ6a8zhMCumtoA/XGMwYR113nFbpfU10RI3+5Tz7dKsPpfwW9acUaNBXHnYpmJ
	4CE3D7TusU6C/Hy5lU1kuuJoSISAVIF8j2DI7+FZsXzA/Mzkd3ae29B2d4G6OKtzkH9T3l
	sZ8CZGnTSR9hbajqmvM5iyXaNOGt/MHenzBqOTnYRhVHvZZhRs9FSPSCoS7NtsLCeH4Dnt
	goqVa88tOK9mTHqAfGv7rOO1WRAJmoXd9dosgTHNo4Un1KavQ96j4qLyIAJJRuoCHgi4jC
	xC4Mg6Fo98tb4AAFctLVfF0Syn+5LjoRT300HL80liTzmBG5ALcQT4RaWasWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1724516889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QaU5cOO39+RJRObfIS1hBUghsjPHGWCpMnbwRbKIVdg=;
	b=rbel2QKl/TWtZNeXHIYK7vWwbBHdve4ST99kM9SxNRDTcBl9h8mo4yU2zDOhAB+6iYnSfr
	XxnDgohGCwdk3kROTrF7C/GAXddpgWi3hbGCJF+Sl3zlKvRF/BgBSGw8Bs0OWk+bvSscXD
	CYjVAZqq8ux0ISu2Uwb0hISmPyMnZmuTmOduMc48EdlOFK38o5SiyON/9oNN0Mk4ckYLP0
	Y16PL57/RK3S8gJzNzUOKRXxDxa0PHOoCg0ZJyQvOkzneQbhaFT2yEo9PL/1HaoN/iDM4l
	KjVAgXG4DTLjAjSdXX4+6J7YhhJD+52pHqUdKXRkdGCj7DApkLu+QzrV224fjA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1724516889; a=rsa-sha256;
	cv=none;
	b=OxTbKMl5gKkYVLV6B+JRcZ2LNedw0mRuNIzkN+wcOilGw9BzFxMLlSccFkbnsEehL1neki
	Av8Eg8MFhnezqWbDIUlU6HWolLI8gyzY36neS5m2in78WYKZ3deznN5CFP32KDGe3l3Cyv
	AJikXgpKa5CGuFDTY6IZiIwXXSb3y0bNJ+V42ePLWuminLdjEDc9gZIuPl8136EKLxrS8O
	tfbM6VXtp5nvIOfv/j1s/WNECgjAb2WnY+dEl8c+9DISLghWd1JtfbdU7nPJmourOPbElA
	AAzS7vJroC/TnPZAICBLp3DgLppeYHfRr38vbIvFfEK7BHCPKrsdDLM6m45tfA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7F8B0634C93;
	Sat, 24 Aug 2024 19:28:08 +0300 (EEST)
Date: Sat, 24 Aug 2024 16:28:08 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-mc: Mark v4l2_pipeline_link_notify() as
 deprecated
Message-ID: <ZsoKGBL1uzJ47_hj@valkosipuli.retiisi.eu>
References: <20240822214125.3161-1-laurent.pinchart+renesas@ideasonboard.com>
 <Zsg3WojLqfNprMIp@valkosipuli.retiisi.eu>
 <20240823135728.GL26098@pendragon.ideasonboard.com>
 <ZsnuBtFIiEb316cf@valkosipuli.retiisi.eu>
 <20240824155009.GU26098@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824155009.GU26098@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Aug 24, 2024 at 06:50:09PM +0300, Laurent Pinchart wrote:
> On Sat, Aug 24, 2024 at 02:28:22PM +0000, Sakari Ailus wrote:
> > On Fri, Aug 23, 2024 at 04:57:28PM +0300, Laurent Pinchart wrote:
> > > On Fri, Aug 23, 2024 at 07:16:42AM +0000, Sakari Ailus wrote:
> > > > On Fri, Aug 23, 2024 at 12:41:25AM +0300, Laurent Pinchart wrote:
> > > > > Commit b97213a41140 ("media: v4l2-mc: Make v4l2_pipeline_pm_{get,put}
> > > > > deprecated") marked the v4l2_pipeline_pm_get() and
> > > > > v4l2_pipeline_pm_put() functions as deprecated, but forgot to address
> > > > > the related v4l2_pipeline_link_notify() function similarly. Fix it.
> > > > > 
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > 
> > > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > 
> > > > How about adding a warning for the use of these functions? Possibly on
> > > > debug level if pr_warn_once() is considered too drastic?
> > > 
> > > I think we need to do a bit of homework first, as there's a large number
> > > of drivers using these, directly or indirectly. We should at least
> > > convert the sensor drivers still using .s_power() to runtime PM, to make
> > > it possible to convert the other drivers.
> > 
> > With that, we could just drop the implementation of the pipeline PM stuff
> > and replace it with a warning.
> > 
> > I think a pr_debug_once() would still be appropriate, at least. People
> > generally won't read the documentation unless something is broken.
> 
> Generally I agree, but my concern here is that someone hitting the
> warning would need to first convert all the remaining sensor drivers to
> runtime PM before they could safely address the issue on the host driver
> side. That's quite a bit of yak shaving.

That's a fair point.

How about then adding such a warning to sub-device drivers implementing
s_power? That'd be much easier to fix for anyone encountering it.

That being said, there could be drivers that need s_power, due to missing
other APIs, for TV tuners on PCI cards for instance.

Cc Hans.

> 
> > > > > ---
> > > > >  include/media/v4l2-mc.h | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> > > > > index ed0a44b6eada..1837c9fd78cf 100644
> > > > > --- a/include/media/v4l2-mc.h
> > > > > +++ b/include/media/v4l2-mc.h
> > > > > @@ -178,6 +178,9 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
> > > > >   * @flags: New link flags that will be applied
> > > > >   * @notification: The link's state change notification type (MEDIA_DEV_NOTIFY_*)
> > > > >   *
> > > > > + * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
> > > > > + * ON SUB-DEVICE DRIVERS INSTEAD.
> > > > > + *
> > > > >   * React to link management on powered pipelines by updating the use count of
> > > > >   * all entities in the source and sink sides of the link. Entities are powered
> > > > >   * on or off accordingly. The use of this function should be paired
> > > > > 
> > > > > base-commit: a043ea54bbb975ca9239c69fd17f430488d33522
> 

-- 
Kind regards,

Sakari Ailus

