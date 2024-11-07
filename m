Return-Path: <linux-media+bounces-21086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD039C117D
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 23:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EF171F22FC4
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 22:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41131218321;
	Thu,  7 Nov 2024 22:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vbTva3F5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1A921830E;
	Thu,  7 Nov 2024 22:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731017142; cv=none; b=aDBWdA0aUuCumSzN+nhjREg5FEZ0StjcXGLPXrAepUokxZBx2gQKzXjzEuwBYLpZvhbK8x7SUF84rK+qeRr95HuyEzSfAONgM+daiyGYmVO36+A5/QjAisA2qnwkiDZIbNTS9KDYsoSiR41mILFsbUHqWlw880ciIFIrp0Y2F3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731017142; c=relaxed/simple;
	bh=w0De7F5cRJvR8Thd0RZMBTzlt3JcdlqZmJU+VRiSSFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4XqQjx8uDCTWqHj8IPA/jsSpHoFMgJXLxJQYI9hj50EWJ4hSi5QPNxGWXVMDNsrLxHowQPSvaCipkc1ax4kXiFHyN2If4A1ZQaujK/cOzc/Jgrw5KNzPNUGCgUyfgEKxPAYWBEpHGLYMYOQT7PamG0UjdwH5IP9jsSMUAoBZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vbTva3F5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4334774C;
	Thu,  7 Nov 2024 23:05:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731017130;
	bh=w0De7F5cRJvR8Thd0RZMBTzlt3JcdlqZmJU+VRiSSFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vbTva3F5EIr56GwBGRFVj2EU2uaGLAXSJCF89VsvwNGiL2ZN8+jQCkdUjIFzWO37z
	 2fGoFBBa2RWIM6JlwMF/983h1iHH5GKOM/JZ3VkbhiVNB4CIvFzIbbdEm4dIXW72xD
	 EajDHXcvXjSVTkhXfxjeEmtXF0HfiOGtKXuTX5yw=
Date: Fri, 8 Nov 2024 00:05:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9446d5e0d25571e6a212@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: uvcvideo: Fix deadlock during uvc_probe
Message-ID: <20241107220532.GJ31474@pendragon.ideasonboard.com>
References: <20241022-race-unreg-v1-1-2212f364d9de@chromium.org>
 <20241107215736.GI31474@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107215736.GI31474@pendragon.ideasonboard.com>

On Thu, Nov 07, 2024 at 11:57:36PM +0200, Laurent Pinchart wrote:
> Hi Ricardo,
> 
> Thank you for the patch.
> 
> On Tue, Oct 22, 2024 at 08:30:30AM +0000, Ricardo Ribalda wrote:
> > If uvc_probe() fails, it can end up calling uvc_status_unregister() before
> > uvc_status_init() is called.
> > 
> > Fix this by checking if dev->status is NULL or not in
> > uvc_status_unregister()
> 
> That will not work in case usb_alloc_urb() fails in uvc_status_init().
> In that error path, dev->status is freed but the pointer is not set to
> NULL. Setting it to NULL should be enough to fix the problem. I'll do
> that and apply this patch to my tree.

Not the exact same problem actually, as the issue reported by the bot is
due to the dev->status_lock mutex being uninitialized, and it will get
initialized as soon as uvc_status_init() is called, even if it fails.

There is however another issue, if dev->status is not set to NULL in the
error path, there will be a double-free in uvc_status_cleanup(). I'll
send a patch to fix that, and then apply this one on top.

> > Reported-by: syzbot+9446d5e0d25571e6a212@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/linux-media/20241020160249.GD7770@pendragon.ideasonboard.com/T/#m506744621d72a2ace5dd2ab64055be9898112dbd
> > Fixes: c5fe3ed618f9 ("media: uvcvideo: Avoid race condition during unregister")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_status.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> > index 06c867510c8f..b3527895c2f6 100644
> > --- a/drivers/media/usb/uvc/uvc_status.c
> > +++ b/drivers/media/usb/uvc/uvc_status.c
> > @@ -294,6 +294,8 @@ int uvc_status_init(struct uvc_device *dev)
> >  
> >  void uvc_status_unregister(struct uvc_device *dev)
> >  {
> > +	if (!dev->status)
> > +		return;
> 
> I'd add a blank line here.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >  	uvc_status_suspend(dev);
> >  	uvc_input_unregister(dev);
> >  }
> > 
> > ---
> > base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
> > change-id: 20241022-race-unreg-85295d5fbeee

-- 
Regards,

Laurent Pinchart

