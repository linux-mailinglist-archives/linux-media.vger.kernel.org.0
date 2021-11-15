Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4D745058C
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 14:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbhKONgG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 08:36:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43078 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbhKONe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 08:34:29 -0500
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 746D3D3E;
        Mon, 15 Nov 2021 14:31:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636983085;
        bh=gblzYeLjUubmBQmVNLn+mtwg7EhlrprPn2k+YB53DbI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zt+sCR1VWlyllFElfVywNQwDbhZaSo0q6BSulV8393U2I9PWCffE+eUAHZ3+GDK/L
         oMQgq0HMLO//JpU/mwQmeVoyxaWbK7hjHlURvjWa/N5Q8Rr+VNXXpnpPq/FgEyib0r
         ZcQ8QkwAERPru8h8MzOIz24jQCNTQthYj49KVMg4=
Date:   Mon, 15 Nov 2021 15:31:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH 1/1] media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT
 to 5 seconds.
Message-ID: <YZJhF+Mv9uMhQHqp@pendragon.ideasonboard.com>
References: <20211114085236.2345589-1-james.hilliard1@gmail.com>
 <YZIorH8D7NPB3w5B@pendragon.ideasonboard.com>
 <CADvTj4pY+2OXPLy1_pVuiA6=BR9u8634HhP5XBWnGUTVPk5wtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADvTj4pY+2OXPLy1_pVuiA6=BR9u8634HhP5XBWnGUTVPk5wtg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James,

On Mon, Nov 15, 2021 at 06:16:50AM -0700, James Hilliard wrote:
> On Mon, Nov 15, 2021 at 2:30 AM Laurent Pinchart wrote:
> > On Sun, Nov 14, 2021 at 01:52:36AM -0700, James Hilliard wrote:
> > > Some uvc devices appear to require the maximum allowed USB timeout
> > > for GET_CUR/SET_CUR requests.
> >
> > Could you list the devices that you know about which require this change
> > ?
> 
> Seems random unbranded chinese made cameras is where I was hitting it,
> but I was seeing a decent amount of others encountering similar timeout issues
> when researching the issue.

Can you share the USB descriptors (output of 'lsusb -v') for those
devices ?

> > > So lets just bump the UVC control timeout to 5 seconds which is the
> > > same as the usb ctrl get/set defaults:
> > > USB_CTRL_GET_TIMEOUT 5000
> > > USB_CTRL_SET_TIMEOUT 5000
> >
> > The USB specification (section 9.2.6.4) requires the device to send the
> > first data packet within 500ms of reception of the request. A 500ms
> > timeout may thus be a bit too short for compliant devices, but 5000ms
> > seems to be a very large margin. I'm wondering if it would make sense to
> > go for a lower value.
> 
> The 500 ms timeout appears to be applicable:
> "For standard device requests that require data stage transfer to the host"
> 
> While the 5s timeout appears to be applicable to:
> "For standard device requests that require a data stage transfer to the device"

Ah yes good point.

> From what I could tell a lot of software just uses the 5s timeout everywhere for
> these GET_CUR and SET_CUR requests, I think it's probably best to just use
> the 5s timeout, that way it's much less likely that we'll see timeout bugs here as
> it seems likely a lot of vendors are testing against software using
> the 5s timeout.

We could have a lower timeout for GET_CUR requests, but I agree it's
likely not worth it.

> I don't really see any harm in bumping it up to 5 seconds, maybe there is something
> I'm missing there though?

It would be nice to report failures faster to applications, but it's not
mandatory, especially given that failures are not supposed to happen.

> > > Fixes:
> > > Failed to query (GET_CUR) UVC control 11 on unit 2: -110 (exp. 1).
> > > Failed to query (SET_CUR) UVC control 3 on unit 2: -110 (exp. 2).
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > > ---
> > >  drivers/media/usb/uvc/uvcvideo.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index fd4f5ef47dfb..583c51ac3eec 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -189,7 +189,7 @@
> > >  /* Maximum status buffer size in bytes of interrupt URB. */
> > >  #define UVC_MAX_STATUS_SIZE  16
> > >
> > > -#define UVC_CTRL_CONTROL_TIMEOUT     500
> > > +#define UVC_CTRL_CONTROL_TIMEOUT     5000
> > >  #define UVC_CTRL_STREAMING_TIMEOUT   5000
> > >
> > >  /* Maximum allowed number of control mappings per device */

-- 
Regards,

Laurent Pinchart
