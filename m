Return-Path: <linux-media+bounces-33442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B9AC4A59
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 10:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC8603AF740
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 08:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C292E23FC6B;
	Tue, 27 May 2025 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yb8vv4qc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849D51F8722
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334726; cv=none; b=tY0GBy7iyFRBwBSgqoFKOtC9fK1AjzygAx0ey1HhY/+5JF7Uu83TP8wnNaS99tIp6h5iKh8pgIbOwrowWjEcVjYLJEaGEnE7AQS8OMTGCLYoWmKYO4B4yL7Y/D0+zHL2RiVhNUCbuZOBhmAXBLBYAXcxkk2ZU1qEePjOSUKYm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334726; c=relaxed/simple;
	bh=z2sfmjl6Pw/ZBMKqzA4OOm9ek6mcObEXGfFNcGUeqd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o69rSdT6bSVwubVRTOGVJ74uBFA9+4KHwrfK+QSSJ7biOhi8I7k0qVRDd0q1Fm+teSzRzFrrAa6iHuFiA/LZyHzH8wphsDcg/9tFbCeoBxx+CTQ59bK96YoQe7rem7Uy0YXEazkb48WbrMdHPEkSQ7hXGt/pWLjj3pShX/e6SCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yb8vv4qc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [178.248.166.46])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA7F2B3;
	Tue, 27 May 2025 10:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748334697;
	bh=z2sfmjl6Pw/ZBMKqzA4OOm9ek6mcObEXGfFNcGUeqd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yb8vv4qcouliHvZjrdSaBM+WQQ7FhpqBTSxeItN9oYMZWMhInlnsQc4b3dnt1rMML
	 cDAzXhxhUEsFWo7+T0eaiP44wzepkQRdthj/Y7RGun+Ju2B7HO0Jzn/aUGgF37at+H
	 Y5IJaKq4Pmdx3pS5TRWtDEK3YNzPkt1b/Oq0ubnk=
Date: Tue, 27 May 2025 10:31:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [GIT PULL FOR v6.16] uvcvideo improvements
Message-ID: <20250527083157.GH2942@pendragon.ideasonboard.com>
References: <20250509124615.GA12452@pendragon.ideasonboard.com>
 <20250527090824.3ecb413f@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527090824.3ecb413f@foz.lan>

Hi Mauro,

On Tue, May 27, 2025 at 09:08:31AM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 9 May 2025 14:46:15 +0200 Laurent Pinchart escreveu:
> 
> > Hi Mauro, Hans,
> > 
> > The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> > 
> >   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-uvc-20250509
> > 
> > for you to fetch changes up to 9882222fa76450e545aeb625522ced7a78ff79a0:
> > 
> >   media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional (2025-04-07 15:31:55 +0200)
> > 
> > ----------------------------------------------------------------
> > uvcvideo improvements:
> > 
> > - Granular power saving
> > - Controls cache sync fix
> > - GPIO deferred probe error fix
> 
> It doesn't seem to be the case of this PR, since it sounds mostly fixes,
> but if a driver is getting some relevant improvement from user's perspective,
> please be a little bit more verbose at the e-mail's subject. Something like:
> 
> 	Subject: uvcvideo: added support for xxx
> 
> As otherwise, I'll simply ignore the PR's subject when submitting
> upstream pull requests.

Do you mean the subject line of the pull request, as in "[GIT PULL FOR
v6.16] ..." ? There's very little space there to list all changes, which
is why the pull request body contains a summary for your convenience
that you can integrate in merge commit messages or in pull requests
mails to Linus.

> > ----------------------------------------------------------------
> > Ricardo Ribalda (10):
> >       media: uvcvideo: Keep streaming state in the file handle
> >       media: uvcvideo: Create uvc_pm_(get|put) functions
> >       media: uvcvideo: Increase/decrease the PM counter per IOCTL
> >       media: uvcvideo: Make power management granular
> >       media: uvcvideo: Do not turn on the camera for some ioctls
> >       media: uvcvideo: Return the number of processed controls
> >       media: uvcvideo: Send control events for partial succeeds
> >       media: uvcvideo: Rollback non processed entities on error
> >       media: uvcvideo: Fix deferred probing error
> >       media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional
> > 
> >  drivers/media/usb/uvc/uvc_ctrl.c   |  91 +++++++++++++++++++++--------
> >  drivers/media/usb/uvc/uvc_driver.c |  38 ++++++++----
> >  drivers/media/usb/uvc/uvc_v4l2.c   | 117 +++++++++++++++++++++++++++++--------
> >  drivers/media/usb/uvc/uvcvideo.h   |   5 ++
> >  4 files changed, 190 insertions(+), 61 deletions(-)

-- 
Regards,

Laurent Pinchart

