Return-Path: <linux-media+bounces-22564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED69E2E6C
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 22:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E42A0B654EE
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 20:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA1B209684;
	Tue,  3 Dec 2024 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RDPr5GFT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16922AF05;
	Tue,  3 Dec 2024 20:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258283; cv=none; b=ArqfcTlZ686WdHcruL8CmeEvq/zFT+qbGafP25f60mi58fwCHz9jBE0uvIyaxTyaivX63er+d0wj8GodvbomDFVAyIM0ScOawU/b9LQhqNvJiEJ4eBoR1VLw4qzyFveWmRktdDBl3xwwxvAHaaJodbhpcD8Bhd7iT/7Ne2YR55w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258283; c=relaxed/simple;
	bh=9/pGNKFbABBpSAD4X4iMIevronyylNVP8uD2jhXdvpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=or88+P4KUwQMXq72cxvl7tyNsl/jch/odgkLCqdx0b8e1xk/+wiW/1iEwFDn8iokCndrmQGEiliuWzLc8bZ1KdVixoOdtKdGSCO4nunLrRUNZsI27LPbHq/6xVHNwEdNyJ1xSsso6MPFxcvpZ9NXXBy6Mw560le6ltg8BW5j7Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RDPr5GFT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0547670;
	Tue,  3 Dec 2024 21:37:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733258252;
	bh=9/pGNKFbABBpSAD4X4iMIevronyylNVP8uD2jhXdvpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDPr5GFTK7aaGwbIBCZNFzGfn0zEQ6wLDhpYK5HgmqB+Hu/j4tb8oYdXVrB0uQoBB
	 m7l2XhueBzABAeN9Srvth4pQaCNcj9mg3xM5xv27pYkXAygnzgKW316oJnW7HL8sL5
	 73k2LkWKPeYXBwT1XoS4vRcnE9JeILeVnmhUgiC8=
Date: Tue, 3 Dec 2024 22:37:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] media: uvcvideo: Flush the control cache when we
 get an event
Message-ID: <20241203203748.GD5196@pendragon.ideasonboard.com>
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-5-6658c1fe312b@chromium.org>
 <67f78128-dcc0-4253-a6f7-5905ca375b06@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67f78128-dcc0-4253-a6f7-5905ca375b06@redhat.com>

On Mon, Dec 02, 2024 at 03:45:57PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
> > Asynchronous controls trigger an event when they have completed their
> > operation.
> > 
> > This can make that the control cached value does not match the value in
> > the device.
> > 
> > Let's flush the cache to be on the safe side.
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index e90bf2aeb5e4..75d534072f50 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1672,6 +1672,9 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
> >  	struct uvc_device *dev = chain->dev;
> >  	struct uvc_ctrl_work *w = &dev->async_ctrl;
> >  
> > +	/* Flush the control cache, the data might have changed. */
> > +	ctrl->loaded = 0;
> > +
> >  	if (list_empty(&ctrl->info.mappings))
> >  		return false;
> >  
> 
> Thank you for the patch.
> 
> I'm not familiar enough with UVC yet to really have an opinion on this one,
> so I'll defer reviewing this one to Laurent.

Conceptually this change looks fine, but the commit message needs to
explain why this is safe to do without protecting ctrl->loaded with a
lock.

-- 
Regards,

Laurent Pinchart

