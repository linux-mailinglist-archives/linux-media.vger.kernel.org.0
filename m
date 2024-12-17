Return-Path: <linux-media+bounces-23619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33109F5181
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 593807A21EE
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26391F755F;
	Tue, 17 Dec 2024 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JzpPSi5C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F51F37BE
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 17:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734454955; cv=none; b=XV4c2+L4VAngqEX/rpucd3OgJnJ/u5Ucgp8KQyFmn9510nyEDq2ANHf2u5z2eL+vv4M8nq6mNKbEs01axqxWoJWVhQWfezDSSJ9fpyRxoVRFLNpX4Wul0KlzBP2/O58YSGbsOOnkqwYYkW/TCBoJnHBwyG70QFtwoj/9diESgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734454955; c=relaxed/simple;
	bh=vI/mPkL33n0j6oxWolb1uQ8XU0aZgtB8cqkPE4jr+2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LE00xFpb+5jZDcQHv7/kfNTQAev6fBppHpcxRIlk7JVmNuWJx3Mq2Ge3b+FpkfsI6MVBKA0VsMZkpEAkBV/HhKIxSxg0xtEiJL3UwWkI0NSFaCVRTFqGlBLmH2REFrATiGvpi6XWswV+aDAeQSiE2UtCvXJvE0MkP/lVwFsHZ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JzpPSi5C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 027093E;
	Tue, 17 Dec 2024 18:01:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734454914;
	bh=vI/mPkL33n0j6oxWolb1uQ8XU0aZgtB8cqkPE4jr+2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzpPSi5Cu8uPmAbMLH1m+lpkld8QfC2/tFuU7LaZHW72LC8QiH7tPivNGlfBeraxz
	 oijdIyqrFok2sMDwdtcwlO5iNDln7pGnc66a7utPMPUfPaUYj4r1sQwWY33E7wSEbH
	 rZmNhs25E026/DoCVUdNvNcQKFRTPQLKqbYzZErM=
Date: Tue, 17 Dec 2024 19:02:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] media: uvcvideo: Add no drop parameter for
 MJPEG_NO_EOF quirk
Message-ID: <20241217170229.GK20432@pendragon.ideasonboard.com>
References: <20241217112138.1891708-1-isaac.scott@ideasonboard.com>
 <20241217112138.1891708-2-isaac.scott@ideasonboard.com>
 <CANiDSCtkgRJdPQmwPV6GStLMv_xEYC51LDED1St6i9bnmNEPfg@mail.gmail.com>
 <CANiDSCuJVn9sSP+OWNp+AVM9NCsYaLC_x2AdtPhwwGsVMVK3Lg@mail.gmail.com>
 <0cd5abccbbd307b0346fb4c542dc0a2764665fb7.camel@ideasonboard.com>
 <CANiDSCv-KqBk9UQrdTztzS7+zczu-chFw7owECcfOoGLEtXa0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCv-KqBk9UQrdTztzS7+zczu-chFw7owECcfOoGLEtXa0w@mail.gmail.com>

On Tue, Dec 17, 2024 at 05:02:43PM +0100, Ricardo Ribalda wrote:
> On Tue, 17 Dec 2024 at 16:43, Isaac Scott wrote:
> > On Tue, 2024-12-17 at 13:08 +0100, Ricardo Ribalda wrote:
> > > On Tue, 17 Dec 2024 at 12:58, Ricardo Ribalda wrote:
> > > > On Tue, 17 Dec 2024 at 12:22, Isaac Scott wrote:
> > > > >
> > > > > In use cases where a camera needs to use the UVC_QUIRK_MJPEG_NO_EOF,
> > > > > erroneous frames that do not conform to MJPEG standards are correctly
> > > > > being marked as erroneous. However, when using the camera in a product,
> > > > > manufacturers usually want to enable the quirk in order to pass the
> > > > > buffers into user space. To do this, they have to enable the uvc_no_drop
> > > > > parameter. To avoid the extra steps to configure the kernel in such a
> > > > > way, enable the no_drop parameter by default to comply with this use
> > > > > case.
> > > >
> > > > I am not sure what you want to do with this patch.
> > > >
> > > > Why can't people simply set the quirk with
> > > >
> > > > modprobe uvcvideo quirks=0x20000
> > >
> > > Sorry, I meant
> > >
> > > modprobe uvcvideo nodrop=1
> > >
> > > or
> > >
> > > echo 1 > /sys/module/uvcvideo/parameters/nodrop
> > >
> >
> > That would also work, absolutely!
> >
> > If a user has these cameras, they should always add the no_drop to
> > avoid losing frames that would otherwise be discarded as they are
> > erroneous.
> >
> > This quirk will always trigger, and it is likely they would want to
> > have all the frames sent by the camera, while still marking them as
> > errors they can handle later in user space if they want to.
> 
> Besides what Laurent is saying:
> ```
> One issue with this is that it becomes impossible for someone to unset
> the no_drop parameter.
> ```
> 
> There is also the issue that with your current implementation you are
> changing the module parameter for ALL the cameras probed after this
> one:
> 
> I believe that you have to do:
> -       ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
> +       ret = uvc_queue_init(queue, type, !uvc_no_drop_param &&
> +                                         !(dev->quirks &
> UVC_QUIRK_MJPEG_NO_EOF))
> 
> 
> But maybe before that we need to have the discussion about: shall we
> remove uvc_no_drop_param altogether?. We could start by swapping the
> default value and see what happens....

Unless someone objects, I think swapping the default value and waiting a
bit is a good idea. If the universe doesn't collapse immediately, we
could later drop the parameter.

-- 
Regards,

Laurent Pinchart

