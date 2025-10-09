Return-Path: <linux-media+bounces-44063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BDFBC84EC
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 11:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F6CC1A600CD
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 09:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7AB2D63E2;
	Thu,  9 Oct 2025 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u5A9+aS+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494F299AAB
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002177; cv=none; b=Mu+nwD88wi18V+8vm99JUfv6us6P8h8h/rnFD00cR3H4j5oG6ysZu1fs9sH+5BKYhfZjEN5888k9Hbs6tZF6Bz2b6iH101ftQJwFkz6mV9wCX+X7sZgIpQMZbgZU+sx2c2/AOHDf4ltWZmrF8U2hTLuHCZVwsYNd+uYI1lToF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002177; c=relaxed/simple;
	bh=gm0+gUeFgzkGfdapEWnYNZRibuQ4f7mcNi49xMjLSzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Upey/9jCRnPbfYrfEpCcEVTpkqaGkdy0sfef8FyPHA250zu37M0lRXfkaJKNhI7oz8R5VF7b7oJeL/lQLzTTbxvhOQ7tw8+vZfd6+9cYNSHIJru9i8p4T1LxfSdyQZt7UJKn6mdic0jQnka079e5TwdU9d0SwFBOPpdVZqV8F/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u5A9+aS+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1DA3A664;
	Thu,  9 Oct 2025 11:27:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760002078;
	bh=gm0+gUeFgzkGfdapEWnYNZRibuQ4f7mcNi49xMjLSzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5A9+aS+YmIdSsB+HT8u6HpwNI/FfJU7W3l3ZUJZuMK3wOLtdbWenCWX7W1LDx3kN
	 YxkIJQ040QjVsKwYt5FGuJG3aXYdPXL7b3fffv+6PVuRMZEiFDhUeAaMXFGvRH0qJS
	 ct4/97KCsNmUzT1o0j8UwsCZNBdQ5M6IF0qptNlE=
Date: Thu, 9 Oct 2025 12:29:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Angel4005 <ooara1337@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-uvc-devel@lists.sourceforge.net
Subject: Re: [REGRESSION] uvcvideo: Grandstream GUV3100 (2bab:0011) broken on
 recent kernels (including LTS)
Message-ID: <20251009092926.GC29493@pendragon.ideasonboard.com>
References: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
 <CANiDSCst6-1g2vPSF4YnEbH6DFcz+WYEwGHc08kGyuH4OZ+adA@mail.gmail.com>
 <CAOzBiVv2yzmawqLk-womOJFpx_dAWW9z6EmSqxADyVOPHTaymw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOzBiVv2yzmawqLk-womOJFpx_dAWW9z6EmSqxADyVOPHTaymw@mail.gmail.com>

On Thu, Oct 09, 2025 at 12:22:57PM +0300, Angel4005 wrote:
> Hello,
> 
> Thank you very much for your quick and helpful responses!
> 
> I confirm that the problem seems to be related to duplicate IDs in the
> descriptor of my Grandstream GUV3100 device.
> 
> Unfortunately, I was unable to test the proposed patch, as kernel
> building is beyond my current capabilities. I am not experienced in
> such matters and do not want to risk the stability of my system.
> 
> The exact breaking point when the camera stopped working was found:
> 
> * Last known WORKING kernel (GOOD): 6.12.50-1-lts
> * First known NON-WORKING kernel (BAD): 6.12.51-1-lts
> 
> I hope this information will help pinpoint the commit that caused the
> regression.

We know which commit caused the regrassion, but it's hard to fix the
issue properly without being able to test on the device. That's why
Ricardo asked if the camera can be easily bought from somewhere.

> Thank you very much for your help, guidance, and understanding!
> 
> чт, 9 жовт. 2025 р. о 09:55 Ricardo Ribalda <ribalda@chromium.org> пише:
> >
> > Hi Angel
> >
> > Thank you very much for the detailed report.
> >
> > Your device has two entities with the same id:
> > VideoControl Interface Descriptor:
> >         bLength                31
> >         bDescriptorType        36
> >         bDescriptorSubtype      6 (EXTENSION_UNIT)
> >         bUnitID                 4
> >
> >
> > ideoControl Interface Descriptor:
> >         bLength                 9
> >         bDescriptorType        36
> >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> >         bTerminalID             4
> >         wTerminalType      0x0101 USB Streaming
> >         bAssocTerminal          0
> >         bSourceID               3
> >         iTerminal               0
> >
> > And that confuses the code. We have recently introduced a change that
> > has probably triggered the regression
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc?id=0e2ee70291e64a30fe36960c85294726d34a103e
> >
> > Do you know the commercial name of the device and if it is available to buy?
> >
> > Could you try this patch and let me know if it fixes the issue?
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > b/drivers/media/usb/uvc/uvc_driver.c
> > index fa61f1d0ea2c..81937501fb0c 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -167,11 +167,23 @@ static struct uvc_entity
> > *uvc_entity_by_reference(struct uvc_device *dev,
> >
> >  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> >  {
> > -       struct uvc_streaming *stream;
> > +       struct uvc_streaming *stream, *last_entry;
> > +       unsigned int count = 0;
> >
> >         list_for_each_entry(stream, &dev->streams, list) {
> >                 if (stream->header.bTerminalLink == id)
> >                         return stream;
> > +               count += 1;
> > +               last_entry = stream;
> > +       }
> > +
> > +       /*
> > +        * If the streaming entity has an invalid id, but it is the only
> > +        * one available, use it.
> > +        */
> > +       if (count == 1 && id == UVC_INVALID_ENTITY_ID) {
> > +               dev_err(&dev->intf->dev, "Heuristics triggered\n");
> > +               return last_entry;
> >         }
> >
> >         return NULL;

-- 
Regards,

Laurent Pinchart

