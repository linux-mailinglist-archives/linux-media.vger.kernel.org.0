Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF9122FE68
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 02:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgG1ARc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 20:17:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33058 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgG1ARc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 20:17:32 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F05C556;
        Tue, 28 Jul 2020 02:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595895449;
        bh=qDENp+ksFdx3Ek7ZnyN0CbjkZwu8wZVUvGQGBhlAVNo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WQneBtFfC8YsCrZ0w68NkAap9rZ+f8NNEvPoukq0ZfIKz4GzG418ysEjyAGV4dkKX
         6EofAS/a4wEmdu3hqPg8563CRe5ffeKT9Cmd2xFKVNcaGZc5pRmUAJrVOAs6M0TjPA
         r7FkYmaplRF5wA2bW4PdvqXegDsktzS8gbC1xBL4=
Date:   Tue, 28 Jul 2020 03:17:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Buzdyk <dima.buzdyk@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     john.agosta@canonical.com, kevin.lu@canonical.com,
        ethan.hsieh@canonical.com, 'Jesse Sung' <jesse.sung@canonical.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] uvcvideo: Add mapping for HEVC payloads
Message-ID: <20200728001721.GG15448@pendragon.ideasonboard.com>
References: <20200529010547.GA630131@dmitry-T520>
 <20200607010719.GU7339@pendragon.ideasonboard.com>
 <20200609045732.GA781356@dmitry-T520>
 <20200715080010.GA551680@dmitry-T520>
 <20200727232546.GB26169@dmitry-T520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200727232546.GB26169@dmitry-T520>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

Sorry for the late reply.

Mauro, there's a question for your below.

On Tue, Jul 28, 2020 at 09:25:46AM +1000, Dmitry Buzdyk wrote:
> Hi Laurent,
> 
> Had you a chance to review USB descriptors from the device provided
> below? Is any additional information needed?
> 
> On Wed, Jul 15, 2020 at 06:00:10PM +1000, Dmitry Buzdyk wrote:
> > On Tue, Jun 09, 2020 at 02:57:36PM +1000, Dmitry Buzdyk wrote:
> > Hi Laurent,
> > 
> > Please see updated information below
> > 
> >> On Sun, Jun 07, 2020 at 04:07:19AM +0300, Laurent Pinchart wrote:
> >>> Hi Dmitry,
> >>> 
> >>> Thank you for the patch.
> >>> 
> >>> On Fri, May 29, 2020 at 11:05:47AM +1000, Dmitry Buzdyk wrote:
> >>>> Add HEVC GUID and assotiate with HEVC pixel format so that frame
> >>>> based format descriptors recognized by the UVC video driver.
> >>> 
> >>> The patch itself looks OK to me, but could you share a bit more
> >>> information about which device(s) implement this ? Are they UVC 1.1
> >>> devices ? Could you share their full USB descriptors (retrieved with
> >>> 'lsusb -v', running as root if possible) ?
> >>
> >> This is a UVC1.1 camera device based on Ambarella H22 SOC.

That's interesting. It would be nice to have upstream support for the
Ambarella SoCs in the kernel :-)

> >> Please note that device is still in development and yet to get actual
> >> VID and PID.
> >
> > Device got its VID:PID from USB-IF:
> > 
> > Bus 001 Device 009: ID 3301:1000  
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.00
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2 
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   idVendor           0x3301 
> >   idProduct          0x1000 
> >   bcdDevice            0.10
> >   iManufacturer           1 Rhonda
> >   iProduct                2 Rhonda Cam
> >   iSerial                 3 FMABCLE15000007
> >   bNumConfigurations      1

Thank you for the descriptors.

[snip]

> >       VideoControl Interface Descriptor:
> >         bLength                 9
> >         bDescriptorType        36
> >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> >         bTerminalID            16
> >         wTerminalType      0x0101 USB Streaming
> >         bAssocTerminal          0
> >         bSourceID              10
> >         iTerminal               0 
> >       VideoControl Interface Descriptor:
> >         bLength                 9
> >         bDescriptorType        36
> >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> >         bTerminalID            17
> >         wTerminalType      0x0101 USB Streaming
> >         bAssocTerminal          0
> >         bSourceID              10
> >         iTerminal               0 

Two output terminals ? Does that mean the device can provide two streams
from the same source ?

[snip]


> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x83  EP 3 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0

This is interesting too, does it provide enough bandwidth for 3000x4000
@10fps MJPEG ?

[snip]

> >>> Is there anything else needed to get HEVC capture working, such as
> >>> extension unit controls, or is this patch enough ? What userspace
> >>> software do you use to capture and decode HEVC (or capture it to disk) ?
> >>
> >> No other changes to Linux nor extra actions needed to start HEVC capture.
> >> We use patched version of FFmpeg to capture, decode and display HEVC
> >> stream from camera device. That simple patch also going to be sent to
> >> FFmpeg upstream.
> >
> > Patch for FFmpeg sent to https://patchwork.ffmpeg.org/project/ffmpeg/list/?series=1760
> >
> >>>> Signed-off-by: Dmitry Buzdyk <dima.buzdyk@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree. I'm afraid we're a bit too close to the v5.9 merge
window for me to send a pull request now, unless Mauro would be fine
with that. Otherwise I'll include it in the pull request for the next
release.

> >>>> ---
> >>>>  drivers/media/usb/uvc/uvc_driver.c | 5 +++++
> >>>>  drivers/media/usb/uvc/uvcvideo.h   | 4 ++++
> >>>>  2 files changed, 9 insertions(+)
> >>>> 
> >>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >>>> index 431d86e1c94b..825ee3601661 100644
> >>>> --- a/drivers/media/usb/uvc/uvc_driver.c
> >>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >>>> @@ -214,6 +214,11 @@ static struct uvc_format_desc uvc_fmts[] = {
> >>>>  		.guid		= UVC_GUID_FORMAT_CNF4,
> >>>>  		.fcc		= V4L2_PIX_FMT_CNF4,
> >>>>  	},
> >>>> +	{
> >>>> +		.name		= "HEVC",
> >>>> +		.guid		= UVC_GUID_FORMAT_HEVC,
> >>>> +		.fcc		= V4L2_PIX_FMT_HEVC,
> >>>> +	},
> >>>>  };
> >>>>  
> >>>>  /* ------------------------------------------------------------------------
> >>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >>>> index 6ab972c643e3..c7f043121b41 100644
> >>>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>>> @@ -165,6 +165,10 @@
> >>>>  	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
> >>>>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >>>>  
> >>>> +#define UVC_GUID_FORMAT_HEVC \
> >>>> +	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
> >>>> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >>>> +
> >>>>  
> >>>>  /* ------------------------------------------------------------------------
> >>>>   * Driver specific constants.

-- 
Regards,

Laurent Pinchart
