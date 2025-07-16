Return-Path: <linux-media+bounces-37868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1B8B07509
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 072537A6496
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39862F3C0B;
	Wed, 16 Jul 2025 11:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jTm8P1sk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A578E1953BB
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 11:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752666679; cv=none; b=sHeOBtfFFKXCSmIM4UaV513YO7uUKNcoP1e5QrpcJcEXaw9MnxVwO5sCjgvjpc7aW4mAqrgQ/WDYrdkMj/WsrgabFfUD0cP7FOjsXg6RulOCxrUrjTMNMF5WxUjPgTcjlyNCkNZQe2ITuo+yGICd9kynwngOyb7Ua7kVb1Xy3qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752666679; c=relaxed/simple;
	bh=c23+fTqCPmcfHn3i7yUhUMn1SXRyPK/MYU/2u2Xn4W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZSIR71+z6KKAzuDqOWgM9uDnbvOMRv6jCmRGIcoIHnss0je+FmdE2AuxTXQguLZ64fdcob1TOeejfIDWQw+AXPq+zj08n4RoBJPrtAh3tOfz1vRcKsYwq6LqcaDaOoZWGbiDpMX/qGtLICNu/2WtDV/QS3iyoGoUR7OzpPfRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jTm8P1sk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 564B1A57;
	Wed, 16 Jul 2025 13:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752666635;
	bh=c23+fTqCPmcfHn3i7yUhUMn1SXRyPK/MYU/2u2Xn4W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTm8P1sk86V8bWNVLlG3rUKnvhFvznmRzPLcwDVpYTnNYNhbyXbmvuTF/tm4XvMhF
	 8X6Y7JQVXOA/E0loAMLfztVa6bf0dSZY/BIDFPO5UX9uAmT3SHyk2WDIygEGPhooet
	 kkDkc41weu/UQHP7gDloOzFzx21LNB0K0kPG37bc=
Date: Wed, 16 Jul 2025 14:51:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 2/3] media: uvcvideo: Add missing curly braces
Message-ID: <20250716115105.GE13915@pendragon.ideasonboard.com>
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
 <20250715185254.6592-3-laurent.pinchart@ideasonboard.com>
 <CANiDSCvSyi9RQedMTn4u0kCu4MvAQ3x=f52Yh=v=8wAeadGi=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvSyi9RQedMTn4u0kCu4MvAQ3x=f52Yh=v=8wAeadGi=g@mail.gmail.com>

On Wed, Jul 16, 2025 at 12:47:58PM +0200, Ricardo Ribalda wrote:
> Hi Laurent
> 
> If you use a linter we could add it to media-ci to make sure that the
> code follows your style.

I currently don't, it's all wired in the OCD part of my brain I suppose
:-)

> On Tue, 15 Jul 2025 at 20:53, Laurent Pinchart wrote:
> >
> > The uvc_meta_v4l2_try_format() function is missing curly braces on an
> > outer for loop statement to comply with the driver coding style. Add
> > them.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/media/usb/uvc/uvc_metadata.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index b68bfb2d47df..386b04a3a102 100644
> > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > @@ -67,11 +67,12 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
> >         if (format->type != vfh->vdev->queue->type)
> >                 return -EINVAL;
> >
> > -       for (unsigned int i = 0; i < dev->nmeta_formats; i++)
> > +       for (unsigned int i = 0; i < dev->nmeta_formats; i++) {
> >                 if (dev->meta_formats[i] == fmt->dataformat) {
> >                         fmeta = fmt->dataformat;
> >                         break;
> >                 }
> > +       }
> >
> >         memset(fmt, 0, sizeof(*fmt));
> >

-- 
Regards,

Laurent Pinchart

