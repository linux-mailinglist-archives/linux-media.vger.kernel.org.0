Return-Path: <linux-media+bounces-13349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D204B90A0CA
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBEA0281EC9
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4FC73450;
	Sun, 16 Jun 2024 23:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="phWfsyzP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD149658
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718580317; cv=none; b=U8zVxZhwEDit38/ORiHKx6YzI2lLHnIql9jrxx+V65jbqHxb7PAf45ERyHyeXgiefjlv6nSNdad9mLFsed3RrCi0sMH6pE/pVQZGKYcP0tI9ixTnqtaviD7hj2xzfDXSm9df5BbMZIDKY1ge53+4fUE1knHOngjWriK8p07tQfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718580317; c=relaxed/simple;
	bh=Cdpl079bkdzwDHHoQF8PxKfa7cCanh+syD888P9C3AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMO/e9r5ZMLbOJKaEYxwegnyzLxR2f24ICSUlBzEz3Sqod1cmv/UMu5H+I4Udq/RcspyvuN2xE0bUxa1aFwwGQJC7IL5MnLUBVgOB++ZUfmcckifgJZT1uaJvmWeKi+MHU2HhZnV+7y28p+NPz5q71H0sD705p7m9hthSMWH0xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=phWfsyzP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B6F6A9A;
	Mon, 17 Jun 2024 01:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718580298;
	bh=Cdpl079bkdzwDHHoQF8PxKfa7cCanh+syD888P9C3AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phWfsyzPEFez2Q+Q3IKSeoZBjpH9ZVWDAN8RYpd/+Ms85fZ+wpMySH3wJSRbnpXFK
	 oEr4GE2pkgfW8pdvCDIGt6iN8KGR4PAAf9FcPFzXJ1j9i2rW/gT+Z/aud7sBm0Ec5y
	 EtB5unmbczFhuda7jOTnrxWVSHssV2pcXT4hUcYk=
Date: Mon, 17 Jun 2024 02:24:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Giuliano Lotta <giuliano.lotta@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4035
Message-ID: <20240616232453.GG4782@pendragon.ideasonboard.com>
References: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvxosE_MR1FYaM81jQyDrJ6cERzYSASNsjva6xmkn_42Q@mail.gmail.com>
 <CA+DpmqZFiC2XjiEFuir=Y5L3rg3doK7odiHpXTJAZxSt0o2qWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+DpmqZFiC2XjiEFuir=Y5L3rg3doK7odiHpXTJAZxSt0o2qWQ@mail.gmail.com>

Hi Giuliano,

On Mon, Jun 03, 2024 at 07:21:28PM +0200, Giuliano Lotta wrote:
> Hi Laurent
> I asked Ricardo if the driver for the uvc Quanta camera 0408:4035 was now
> part of the main line of the kernel, but it seems that something happened
> on the way to the merge...
> 
> Ricardo suggested that I contact you about how to make the patch official.
> 
> May you kindly help us on having the patch merged in the mainline kernel ?
> I confirm it works for 0408:4035  (and for 0408:4033 too..)

I was waiting for your Tested-by: tag. I'll add it and merge the patch
for v6.11.

> Il giorno lun 4 mar 2024 alle ore 09:28 Ricardo Ribalda ha scritto:
> 
> > Hi
> >
> > Helping out Guiliano to send the tested-by, he also says that
> > 0408:4033 should be added to this patch.
> >
> > On Sun, 15 Jan 2023 at 21:52, Laurent Pinchart wrote:
> > >
> > > The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
> > > implements UVC 1.0a as shown by the UVC probe control being 26 bytes
> > > long. Force the UVC version for that device.
> > >
> > > Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Tested-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> >
> > > ---
> > >
> > > Giuliano, I believe you've successfully tested this patch. If so, could
> > > you reply with a Tested-by tag ? Just copying the following in your
> > > reply will do:
> > >
> > > Tested-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> > >
> > >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > b/drivers/media/usb/uvc/uvc_driver.c
> > > index 1a186abeb4fa..742eeaff333e 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2429,6 +2429,17 @@ static const struct usb_device_id uvc_ids[] = {
> > >           .bInterfaceSubClass   = 1,
> > >           .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > >           .driver_info          =
> > (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> > > +       /* Quanta ACER HD User Facing */
> > > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > +         .idVendor             = 0x0408,
> > > +         .idProduct            = 0x4035,
> > > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > > +         .bInterfaceSubClass   = 1,
> > > +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > > +         .driver_info          = (kernel_ulong_t)&(const struct
> > uvc_device_info){
> > > +               .uvc_version = 0x010a,
> > > +         } },
> > >         /* LogiLink Wireless Webcam */
> > >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > >
> > > base-commit: fd957081cff04668f390c6f290bdcc7fc009a0f1

-- 
Regards,

Laurent Pinchart

