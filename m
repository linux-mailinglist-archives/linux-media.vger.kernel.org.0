Return-Path: <linux-media+bounces-22562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342949E2D07
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2B8216584F
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 20:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A43205E22;
	Tue,  3 Dec 2024 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lJFqALY5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D376C2500D3;
	Tue,  3 Dec 2024 20:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733257668; cv=none; b=P+ctF0/jJFs/lBxyfFn3oRho92gpzxwImnKpAixnEPTmSMqwPpp8rvjY83QQSMV2sjJhO3P2mZ+Vo562ys3VuFw/at5exrGrnYDDOQIrg77iHVjtoSHHzdFqqVxTRr9AM8QLvxoCkyw3DnWVpMy3SvEzGSvfmDAfFF0eRlSn/Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733257668; c=relaxed/simple;
	bh=vF76/CaY7bpKvE8abQS9yYAzDzaK921+tbr7OjbTFl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trhaZXanwwl8ascR981hjfCd4AlK3GgkGL8Gb1+PH1/DuhgogkfNKuO7RcKzlKJyO8QVdsSl8FDmWrI35lEr8e1D9qBDlNjbP1ERyWoYtX3s7T9OygG7vVNG98EK9IFBLE4nECvfOjuSGng8bHO7ifzpKOfZM10qFke64lFsHxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lJFqALY5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A301D670;
	Tue,  3 Dec 2024 21:27:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733257637;
	bh=vF76/CaY7bpKvE8abQS9yYAzDzaK921+tbr7OjbTFl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJFqALY5c6q4MNGA+FQi714b88UT7iwEQhtu/5Q+zBWHKpt01jihhBk3/MVLhCJ6b
	 XDCFoFUm7HSAbP7CrSkEP0czYLSqmnc/3qIey0qAOHL+nVkPiCob3ZuP0OJ8ZEyJPD
	 rJre4k+9CLo6ziobc3XKXbCQQQXJRZ3A6XoOsWIk=
Date: Tue, 3 Dec 2024 22:27:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] media: uvcvideo: Remove redundant NULL assignment
Message-ID: <20241203202733.GA21544@pendragon.ideasonboard.com>
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-4-6658c1fe312b@chromium.org>
 <0531da34-d35f-4f46-be14-a9f864f38784@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0531da34-d35f-4f46-be14-a9f864f38784@redhat.com>

On Mon, Dec 02, 2024 at 03:44:57PM +0100, Hans de Goede wrote:
> On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
> > ctrl->handle will only be different than NULL for controls that have
> > mappings. This is because that assignment is only done inside
> > uvc_ctrl_set() for mapped controls.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

This should come before 2/5, otherwise that patch will be wrong about
the documented locking rule. I'm also fine with squashing this change in
2/5 (with an update to the commit message).

> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 576e3854be91..e90bf2aeb5e4 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1672,10 +1672,8 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
> >  	struct uvc_device *dev = chain->dev;
> >  	struct uvc_ctrl_work *w = &dev->async_ctrl;
> >  
> > -	if (list_empty(&ctrl->info.mappings)) {
> > -		ctrl->handle = NULL;
> > +	if (list_empty(&ctrl->info.mappings))
> >  		return false;
> > -	}
> >  
> >  	w->data = data;
> >  	w->urb = urb;
> > 

-- 
Regards,

Laurent Pinchart

