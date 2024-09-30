Return-Path: <linux-media+bounces-18884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B0B98AFD8
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 00:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93029B22BF0
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 22:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC62E186E20;
	Mon, 30 Sep 2024 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WUikVynC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9121373
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727735476; cv=none; b=FKGs6Ln28escFXwKpKFcM6XGcRnKL1iELR7cuHxyUpdNnp467PXo16EoJSCVbLirjT8WgvIwT8/UmOj9TNE9G0HaDNJ46ODh0BPU4z7hhcgqZAr3Yr/TSsIDO7KlhYxgrbstVIvY6qbCvLyJ6H0ZoSfC62XtFIhY+B91CSHwd/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727735476; c=relaxed/simple;
	bh=peJ5q8M/62Yw+zCE2UQ8ZHKdJBFNFn47++J9pYRwQgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOUWEdBLhz3WStgrq5yeWMw7bx/SBvuAqZO+fOoxdUGC0b5hjcSoK89/NfMB7r8of1k5aXXKgXbZEtbDSy7aXGsdi2tALtQluHx96rfc3GzrFZwIqjNov+AYt7z7ymgmARnobjOsNsO2JFD8t2M/U0iVB4R4rs0pqp3kN87XaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WUikVynC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B260A502;
	Tue,  1 Oct 2024 00:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727735380;
	bh=peJ5q8M/62Yw+zCE2UQ8ZHKdJBFNFn47++J9pYRwQgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WUikVynCD19LTSidO5yqEVXVeoD9odbGEhvSh34stjw4G8hPHGI+78+fUj6NZ6hzL
	 ZzPDGpGKEnckpEni0YQ8wBHZFWPF8YdkeoLVtmiL/HYM0devbVyKbMVrECn2oRhk6P
	 QAUXLW5oUvK+m3KPws0CmjJhItTgpiHIH09xl9ZU=
Date: Tue, 1 Oct 2024 01:31:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Takshak Mudgal <takshakmudgal@gmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] uvc: Add support for Quanta ACER HD User Facing Camera
 (0408:4033)
Message-ID: <20240930223108.GM31662@pendragon.ideasonboard.com>
References: <20240930184705.59508-1-takshakmudgal@gmail.com>
 <CANiDSCt-hkO4b85OgORCCJXYe44VQxKY9ZuXPfbWFTtajwjqBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCt-hkO4b85OgORCCJXYe44VQxKY9ZuXPfbWFTtajwjqBg@mail.gmail.com>

On Mon, Sep 30, 2024 at 08:49:59PM +0200, Ricardo Ribalda wrote:
> Hi Takshak
> 
> There is already a patch for this under review:
> https://lore.kernel.org/linux-media/20240924-uvc-quanta-v1-1-2de023863767@chromium.org/
> 
> Will likely land in 6.13

More than likely, I've sent a pull request already:
https://lore.kernel/org/r/20240927205959.GA12322@pendragon.ideasonboard.com

> On Mon, 30 Sept 2024 at 20:48, Takshak Mudgal <takshakmudgal@gmail.com> wrote:
> >
> > This patch adds support for the Quanta ACER HD User Facing Camera
> > with USB ID 0408:4033, which is found in some Acer Nitro 5 and
> > Aspire 3 series laptops. The camera is UVC 1.1 compliant but
> > requires explicit enumeration to function correctly.
> >
> > Signed-off-by: Takshak Mudgal <takshakmudgal@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index f0febdc08..40db8a5f4 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2430,6 +2430,24 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
> >   * though they are compliant.
> >   */
> >  static const struct usb_device_id uvc_ids[] = {
> > +       /**
> > +          * Fix for the problem with cameras on Acer Nitro 5 Series & Acer Aspire 3 Series.
> > +          *
> > +          * Fix required for the camera here
> > +          * Thanks for @Giuliano69 for providing the fix
> > +         */
> > +       /* Quanta ACER HD User Facing 4033 - Experimental !! */
> > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             = 0x0408,
> > +         .idProduct            = 0x4033,
> > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   = 1,
> > +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > +               .uvc_version    = 0x010a,
> > +         } },
> > +       /* Fix end here */
> >         /* Quanta ACER HD User Facing */
> >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart

