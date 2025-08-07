Return-Path: <linux-media+bounces-39053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC2B1D8C5
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 15:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04967724693
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566DD25A359;
	Thu,  7 Aug 2025 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Crba48mx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09751487F6;
	Thu,  7 Aug 2025 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754572575; cv=none; b=cq3Yl/Y21uiJGZpJZcCKOovwA5r8Ah5It+D1iKB5Yk+H6B9bkuVPepw4UsBn8PiWiYA0CmciwLMu2V7iLGTxaC0Xq4AOYuZD4u/H89f9SOsXwiUHgweiqvmcwoClo5v1AebAc9khH5hxIm1rUR8DLUlkQLsC9StuN17onsULqJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754572575; c=relaxed/simple;
	bh=2DYIul8uZoxt4nXMyd2itUJWBXKTVbNfFYtPqIH5zns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESP6jVg/wv9mIeEI3xJfFQJn0Fsv3oQ9a7fsfOcqOZuUjkHQ6AkHolQ+51842WhgUcXyRp02lHoHHRsueQttaEu/eDfV4Efvtm9yZLrlMZWYRX14IsF/JinH0PZ5/kBTZCuvPCMobxwKRM0YD/ZdD5Hw8zYcjBuIJO4Xkysv3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Crba48mx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D8FC0C75;
	Thu,  7 Aug 2025 15:15:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754572521;
	bh=2DYIul8uZoxt4nXMyd2itUJWBXKTVbNfFYtPqIH5zns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Crba48mxoITI4Ejt5G8GiSpowtVbvFZRO9kOklFN1Oqf6y/MK+wqZ/CmwcUTSY+nX
	 8bg1Or4olMtI1KoJ+YM/jPVM3FDH2l3uZVZCnx2RjswmfR+2ucZ+5FTEcktrA+nUGX
	 5bohzL2+xrjKDrpEObRiD4mwrAIJ9qQA9xRbBey0=
Date: Thu, 7 Aug 2025 16:15:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 4/4] media: uvcvideo: eUSB2 double isochronous
 bandwidth support
Message-ID: <20250807131555.GB13647@pendragon.ideasonboard.com>
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
 <20250807055355.1257029-5-sakari.ailus@linux.intel.com>
 <CANiDSCsocBBQRPRFAbAovkzauThgN8Qd1u8kjJ_af-83Nd4wvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCsocBBQRPRFAbAovkzauThgN8Qd1u8kjJ_af-83Nd4wvw@mail.gmail.com>

On Thu, Aug 07, 2025 at 08:38:55AM +0200, Ricardo Ribalda wrote:
> On Thu, 7 Aug 2025 at 07:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > From: Tao Q Tao <tao.q.tao@intel.com>
> >
> > Use usb_endpoint_max_isoc_bpi() from the USB framework to find the maximum
> > bytes per interval for the endpoint. Consequently this adds eUSB2
> > isochronous mode and SuperSpeedPlus Isochronous Endpoint Compaion support
> > where larger bpi values are possible.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> > Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
> > Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> > Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> nit: I believe the last tag should be: Signed-off-by:

Related discussion on the workflow mailing list:
https://lore.kernel.org/workflows/bbe1ea08-23bf-43dc-960d-bb8a214b65fa@hammernet.be/T/#t

To answer a question Sakari asked off-list, I'm fine with this patch
being merged through the linux-usb tree.

> > ---
> >  drivers/media/usb/uvc/uvc_driver.c |  4 ++--
> >  drivers/media/usb/uvc/uvc_video.c  | 24 +++---------------------
> >  drivers/media/usb/uvc/uvcvideo.h   |  4 +---
> >  3 files changed, 6 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index da24a655ab68..fde0bc95622c 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -536,7 +536,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >         unsigned int nformats = 0, nframes = 0, nintervals = 0;
> >         unsigned int size, i, n, p;
> >         u32 *interval;
> > -       u16 psize;
> > +       u32 psize;
> >         int ret = -EINVAL;
> >
> >         if (intf->cur_altsetting->desc.bInterfaceSubClass
> > @@ -772,7 +772,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >                                 streaming->header.bEndpointAddress);
> >                 if (ep == NULL)
> >                         continue;
> > -               psize = uvc_endpoint_max_bpi(dev->udev, ep);
> > +               psize = usb_endpoint_max_isoc_bpi(dev->udev, ep);
> >                 if (psize > streaming->maxpsize)
> >                         streaming->maxpsize = psize;
> >         }
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index a75af314e46b..335b1c4eff9b 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1860,24 +1860,6 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
> >                 uvc_free_urb_buffers(stream);
> >  }
> >
> > -/*
> > - * Compute the maximum number of bytes per interval for an endpoint.
> > - */
> > -u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
> > -{
> > -       u16 psize;
> > -
> > -       switch (dev->speed) {
> > -       case USB_SPEED_SUPER:
> > -       case USB_SPEED_SUPER_PLUS:
> > -               return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> > -       default:
> > -               psize = usb_endpoint_maxp(&ep->desc);
> > -               psize *= usb_endpoint_maxp_mult(&ep->desc);
> > -               return psize;
> > -       }
> > -}
> > -
> >  /*
> >   * Initialize isochronous URBs and allocate transfer buffers. The packet size
> >   * is given by the endpoint.
> > @@ -1888,10 +1870,10 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
> >         struct urb *urb;
> >         struct uvc_urb *uvc_urb;
> >         unsigned int npackets, i;
> > -       u16 psize;
> > +       u32 psize;
> >         u32 size;
> >
> > -       psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
> > +       psize = usb_endpoint_max_isoc_bpi(stream->dev->udev, ep);
> >         size = stream->ctrl.dwMaxVideoFrameSize;
> >
> >         npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
> > @@ -2034,7 +2016,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
> >                                 continue;
> >
> >                         /* Check if the bandwidth is high enough. */
> > -                       psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
> > +                       psize = usb_endpoint_max_isoc_bpi(stream->dev->udev, ep);
> >                         if (psize >= bandwidth && psize < best_psize) {
> >                                 altsetting = alts->desc.bAlternateSetting;
> >                                 best_psize = psize;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b9f8eb62ba1d..a77ba76e033a 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -450,7 +450,7 @@ struct uvc_streaming {
> >
> >         struct usb_interface *intf;
> >         int intfnum;
> > -       u16 maxpsize;
> > +       u32 maxpsize;
> >
> >         struct uvc_streaming_header header;
> >         enum v4l2_buf_type type;
> > @@ -818,8 +818,6 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> >                                             u8 epaddr);
> > -u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
> > -
> >  /* Quirks support */
> >  void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
> >                              struct uvc_buffer *buf,

-- 
Regards,

Laurent Pinchart

