Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A5023197F
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 08:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgG2G0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 02:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgG2G0I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 02:26:08 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD82C061794;
        Tue, 28 Jul 2020 23:26:07 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id 185so13551613ljj.7;
        Tue, 28 Jul 2020 23:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U+XZJmBsQyhXVyQ8FDcPDuD2R04wb6fI66keDrm5110=;
        b=tXBEG4CKUwIwDyBEDaGMsRJujdqQmvgwRsodY5YIG0sjmOjYAymk5tXLSFHRyhWwvY
         fExfsNA5disLty+xevzHUPdAH+htvnbKqtD+y5L8nkEnpt82VlVvS4OhA0cztPdw8ACZ
         UGYfW5393+axo2oOpbBHhgKgjLaUAbaMW9M22I43g3Z/1WJi5dXLOfnZfQsQQWzyTnPD
         X0qDNvppe4Q0YZavyXKNjJODXNz7PiLnWnNrSBO5+9ewviI5/rAvY2btCidpOCC1kiD2
         a7+qRjc3lmSCrhKhih6x3b/AqOvounU9GW6Xd59h/UPGUdKnSv1AJ2vPT2JETEvngsJU
         Nt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U+XZJmBsQyhXVyQ8FDcPDuD2R04wb6fI66keDrm5110=;
        b=KuzTSAJUQSRL7cacaSf88psIpA6I1e0wIK2ixpvrGhSNTHGXaixpw6ji9lM0rf5ew5
         3xF/Mrz8ENgU4asVEX9v5sO4UuaLoEGfzBGu6L9pZ4nzx9fnhwNz4a6O281memiSd0lA
         jP0VwJeI9qJq3ImiTU4nVKMWUf9uCf7sO5ZodQuoWO/+9cz+yR1vN5pfZyjpeR9kY1pr
         KDh0i9/BQaSXsvtgKv0S647D0wHUaJd8p+QjFPbLY+cPHindxTuR1Hddkbn3CNSk6J4Z
         gY/BTOhYjeT2GWVt3vr3IDiG2T3I4cO/T1YKRxf2wkDSljfVxqGLTBZ3nAnaF87vSe39
         qy3A==
X-Gm-Message-State: AOAM531iQrvf99jMqRwXfPXrwimuYkREtPN/MxC2anltVrjTVEEJMgci
        8MvXCmbcKDZryV7EdiI3Bhyl6pu/Z/VAzQ==
X-Google-Smtp-Source: ABdhPJz2C99yOiyzXgyFbqffrEw9QIj6Et3+olYLAgSn3iVe21iRSx7XdI6WRJwZS0CrHTLLUSLv+Q==
X-Received: by 2002:a2e:8150:: with SMTP id t16mr14029673ljg.160.1596003966335;
        Tue, 28 Jul 2020 23:26:06 -0700 (PDT)
Received: from dmitry-T520 ([185.57.31.227])
        by smtp.gmail.com with ESMTPSA id x13sm198080ljj.92.2020.07.28.23.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 23:26:05 -0700 (PDT)
Date:   Wed, 29 Jul 2020 16:26:02 +1000
From:   Dmitry Buzdyk <dima.buzdyk@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     john.agosta@canonical.com, kevin.lu@canonical.com,
        ethan.hsieh@canonical.com, 'Jesse Sung' <jesse.sung@canonical.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] uvcvideo: Add mapping for HEVC payloads
Message-ID: <20200729062602.GA258740@dmitry-T520>
References: <20200529010547.GA630131@dmitry-T520>
 <20200607010719.GU7339@pendragon.ideasonboard.com>
 <20200609045732.GA781356@dmitry-T520>
 <20200715080010.GA551680@dmitry-T520>
 <20200727232546.GB26169@dmitry-T520>
 <20200728001721.GG15448@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728001721.GG15448@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Jul 28, 2020 at 03:17:21AM +0300, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> Sorry for the late reply.
> 
> Mauro, there's a question for your below.
> 
> On Tue, Jul 28, 2020 at 09:25:46AM +1000, Dmitry Buzdyk wrote:
> > Hi Laurent,
> > 
> > Had you a chance to review USB descriptors from the device provided
> > below? Is any additional information needed?
> > 
> > On Wed, Jul 15, 2020 at 06:00:10PM +1000, Dmitry Buzdyk wrote:
> > > On Tue, Jun 09, 2020 at 02:57:36PM +1000, Dmitry Buzdyk wrote:
> > > Hi Laurent,
> > > 
> > > Please see updated information below
> > > 
> > >> On Sun, Jun 07, 2020 at 04:07:19AM +0300, Laurent Pinchart wrote:
> > >>> Hi Dmitry,
> > >>> 
> > >>> Thank you for the patch.
> > >>> 
> > >>> On Fri, May 29, 2020 at 11:05:47AM +1000, Dmitry Buzdyk wrote:
> > >>>> Add HEVC GUID and assotiate with HEVC pixel format so that frame
> > >>>> based format descriptors recognized by the UVC video driver.
> > >>> 
> > >>> The patch itself looks OK to me, but could you share a bit more
> > >>> information about which device(s) implement this ? Are they UVC 1.1
> > >>> devices ? Could you share their full USB descriptors (retrieved with
> > >>> 'lsusb -v', running as root if possible) ?
> > >>
> > >> This is a UVC1.1 camera device based on Ambarella H22 SOC.
> 
> That's interesting. It would be nice to have upstream support for the
> Ambarella SoCs in the kernel :-)
> 
> > >> Please note that device is still in development and yet to get actual
> > >> VID and PID.
> > >
> > > Device got its VID:PID from USB-IF:
> > > 
> > > Bus 001 Device 009: ID 3301:1000  
> > > Device Descriptor:
> > >   bLength                18
> > >   bDescriptorType         1
> > >   bcdUSB               2.00
> > >   bDeviceClass          239 Miscellaneous Device
> > >   bDeviceSubClass         2 
> > >   bDeviceProtocol         1 Interface Association
> > >   bMaxPacketSize0        64
> > >   idVendor           0x3301 
> > >   idProduct          0x1000 
> > >   bcdDevice            0.10
> > >   iManufacturer           1 Rhonda
> > >   iProduct                2 Rhonda Cam
> > >   iSerial                 3 FMABCLE15000007
> > >   bNumConfigurations      1
> 
> Thank you for the descriptors.
> 
> [snip]
> 
> > >       VideoControl Interface Descriptor:
> > >         bLength                 9
> > >         bDescriptorType        36
> > >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> > >         bTerminalID            16
> > >         wTerminalType      0x0101 USB Streaming
> > >         bAssocTerminal          0
> > >         bSourceID              10
> > >         iTerminal               0 
> > >       VideoControl Interface Descriptor:
> > >         bLength                 9
> > >         bDescriptorType        36
> > >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> > >         bTerminalID            17
> > >         wTerminalType      0x0101 USB Streaming
> > >         bAssocTerminal          0
> > >         bSourceID              10
> > >         iTerminal               0 
> 
> Two output terminals ? Does that mean the device can provide two streams
> from the same source ?
Correct. This device encode and stream two indpendent H264 or HEVC video streams.
Picture for both streams comes from single image sensor, with own ROI applied for each stream.

> 
> [snip]
> 
> 
> > >       Endpoint Descriptor:
> > >         bLength                 7
> > >         bDescriptorType         5
> > >         bEndpointAddress     0x83  EP 3 IN
> > >         bmAttributes            2
> > >           Transfer Type            Bulk
> > >           Synch Type               None
> > >           Usage Type               Data
> > >         wMaxPacketSize     0x0200  1x 512 bytes
> > >         bInterval               0
> 
> This is interesting too, does it provide enough bandwidth for 3000x4000
> @10fps MJPEG ?
This video mode has relatively high compression ratio thus total bitrate
for this mode does not exceed 100Mbps.

> 
> [snip]
> 
> > >>> Is there anything else needed to get HEVC capture working, such as
> > >>> extension unit controls, or is this patch enough ? What userspace
> > >>> software do you use to capture and decode HEVC (or capture it to disk) ?
> > >>
> > >> No other changes to Linux nor extra actions needed to start HEVC capture.
> > >> We use patched version of FFmpeg to capture, decode and display HEVC
> > >> stream from camera device. That simple patch also going to be sent to
> > >> FFmpeg upstream.
> > >
> > > Patch for FFmpeg sent to https://patchwork.ffmpeg.org/project/ffmpeg/list/?series=1760
> > >
> > >>>> Signed-off-by: Dmitry Buzdyk <dima.buzdyk@gmail.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> and taken in my tree. I'm afraid we're a bit too close to the v5.9 merge
> window for me to send a pull request now, unless Mauro would be fine
> with that. Otherwise I'll include it in the pull request for the next
> release.
> 
> > >>>> ---
> > >>>>  drivers/media/usb/uvc/uvc_driver.c | 5 +++++
> > >>>>  drivers/media/usb/uvc/uvcvideo.h   | 4 ++++
> > >>>>  2 files changed, 9 insertions(+)
> > >>>> 
> > >>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > >>>> index 431d86e1c94b..825ee3601661 100644
> > >>>> --- a/drivers/media/usb/uvc/uvc_driver.c
> > >>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> > >>>> @@ -214,6 +214,11 @@ static struct uvc_format_desc uvc_fmts[] = {
> > >>>>  		.guid		= UVC_GUID_FORMAT_CNF4,
> > >>>>  		.fcc		= V4L2_PIX_FMT_CNF4,
> > >>>>  	},
> > >>>> +	{
> > >>>> +		.name		= "HEVC",
> > >>>> +		.guid		= UVC_GUID_FORMAT_HEVC,
> > >>>> +		.fcc		= V4L2_PIX_FMT_HEVC,
> > >>>> +	},
> > >>>>  };
> > >>>>  
> > >>>>  /* ------------------------------------------------------------------------
> > >>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > >>>> index 6ab972c643e3..c7f043121b41 100644
> > >>>> --- a/drivers/media/usb/uvc/uvcvideo.h
> > >>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> > >>>> @@ -165,6 +165,10 @@
> > >>>>  	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
> > >>>>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > >>>>  
> > >>>> +#define UVC_GUID_FORMAT_HEVC \
> > >>>> +	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
> > >>>> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > >>>> +
> > >>>>  
> > >>>>  /* ------------------------------------------------------------------------
> > >>>>   * Driver specific constants.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

--
Dmitry Buzdyk
Rhonda Software
