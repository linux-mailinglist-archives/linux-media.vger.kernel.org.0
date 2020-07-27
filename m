Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADDFA22FD33
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 01:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgG0XZz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 19:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbgG0XZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 19:25:53 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC35C061794;
        Mon, 27 Jul 2020 16:25:52 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c3so2775897lfb.3;
        Mon, 27 Jul 2020 16:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GlsQ2R8WngnK2tkee/RZyZ/aSPB6oBRKjS32TEi4OWE=;
        b=Cdvot+LamGaiwCnOeSGA2nrFidURnFYj+Z+gERScmglYdI7WAIMapOCKiybbtRSRN2
         WwLTJjjfx4hQQB0FK2m4Sh4y2AK7gjrdPovfhPDvpR1HOXQdtxY+xhkV1HbFSEpoMOF7
         5zRse8lD9pyAZewQPTybhZGKJMv7rgjHfcRSIg0UKC0LXIWoQ/ntph9VL6RiHhFdXr9G
         0Tc+syCTy37yjMT4BVPrFok6878H8qMxvO8EsQCKAggtXQb6htHqwMOIxeLukQ1C47LG
         pcHq+NGqSH4iKYgqEocrAdyP+weWzLNytdvXpo536R9v0e21hXeuKWElF+bZHEaVLyI8
         oP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GlsQ2R8WngnK2tkee/RZyZ/aSPB6oBRKjS32TEi4OWE=;
        b=uBg0QGkLW7rK5PUffAsXzOh5VGUqAa1SnzTyPWAFGZ7+8PypDLrVnQJ5gnYumCCWHE
         VYqP7DgTekrYkU8xeKW6g0YW5uwCv9wo8l3m/OF61ixIk92V4jbedaEYeS7qin8pFsd1
         r73t0KyHRdaAqAdRJIGziBfSnQBTUHCxFChvsdF0jri0XNrTze7l88VG1BeWh8wvwGUq
         dPs7C1r9af0rIIPCfG3SlZyxuTRHerFvNaRjMvChw4PVRUg2hUn20ui9zIIn8DVA0ZKP
         7xvd/KqL9cLM+E4jRqvlUtBnB6isq3DSxgfbIm0sRmpKDQsRPnmm+eMxOmkiL7oWnD4H
         MaTA==
X-Gm-Message-State: AOAM531ZuEh4O9QXkUzEfkxbd88jmM006F+zBHAidaxiCWxhIZknXTh8
        2DAclsGomwqNG94Fo70V7urLPCjPL5d/sg==
X-Google-Smtp-Source: ABdhPJxSLEzzEXkDZLg0KNDxto0efs+giEQpLlP7JV7ExjN9IOrCadgFidTVsEAGZ/YTh0x7GiNJjw==
X-Received: by 2002:a19:8241:: with SMTP id e62mr12956475lfd.112.1595892351100;
        Mon, 27 Jul 2020 16:25:51 -0700 (PDT)
Received: from dmitry-T520 ([185.57.31.227])
        by smtp.gmail.com with ESMTPSA id y26sm2638723ljk.26.2020.07.27.16.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 16:25:50 -0700 (PDT)
Date:   Tue, 28 Jul 2020 09:25:46 +1000
From:   Dmitry Buzdyk <dima.buzdyk@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     john.agosta@canonical.com, kevin.lu@canonical.com,
        ethan.hsieh@canonical.com, 'Jesse Sung' <jesse.sung@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] uvcvideo: Add mapping for HEVC payloads
Message-ID: <20200727232546.GB26169@dmitry-T520>
References: <20200529010547.GA630131@dmitry-T520>
 <20200607010719.GU7339@pendragon.ideasonboard.com>
 <20200609045732.GA781356@dmitry-T520>
 <20200715080010.GA551680@dmitry-T520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715080010.GA551680@dmitry-T520>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Had you a chance to review USB descriptors from the device provided
below? Is any additional information needed?

On Wed, Jul 15, 2020 at 06:00:10PM +1000, Dmitry Buzdyk wrote:
> On Tue, Jun 09, 2020 at 02:57:36PM +1000, Dmitry Buzdyk wrote:
> Hi Laurent,
> 
> Please see updated information below
> 
> > On Sun, Jun 07, 2020 at 04:07:19AM +0300, Laurent Pinchart wrote:
> > > Hi Dmitry,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Fri, May 29, 2020 at 11:05:47AM +1000, Dmitry Buzdyk wrote:
> > > > Add HEVC GUID and assotiate with HEVC pixel format so that frame
> > > > based format descriptors recognized by the UVC video driver.
> > > 
> > > The patch itself looks OK to me, but could you share a bit more
> > > information about which device(s) implement this ? Are they UVC 1.1
> > > devices ? Could you share their full USB descriptors (retrieved with
> > > 'lsusb -v', running as root if possible) ?
> > This is a UVC1.1 camera device based on Ambarella H22 SOC.
> > Please note that device is still in development and yet to get actual
> > VID and PID.
> Device got its VID:PID from USB-IF:
> 
> Bus 001 Device 009: ID 3301:1000  
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x3301 
>   idProduct          0x1000 
>   bcdDevice            0.10
>   iManufacturer           1 Rhonda
>   iProduct                2 Rhonda Cam
>   iSerial                 3 FMABCLE15000007
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x022f
>     bNumInterfaces          3
>     bConfigurationValue     1
>     iConfiguration          0 
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         3
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0 
>       iFunction               2 Rhonda Cam
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0 
>       iInterface              2 Rhonda Cam
>       VideoControl Interface Descriptor:
>         bLength                14
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdUVC               1.10
>         wTotalLength       0x006b
>         dwClockFrequency       50.000000MHz
>         bInCollection           2
>         baInterfaceNr( 0)       1
>         baInterfaceNr( 1)       2
>       VideoControl Interface Descriptor:
>         bLength                44
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                10
>         guidExtensionCode         {e307e649-4618-a3ff-82fc-2d8b5f216773}
>         bNumControl           146
>         bNrPins                 1
>         baSourceID( 0)          5
>         bControlSize           19
>         bmControls( 0)       0x05
>         bmControls( 1)       0x00
>         bmControls( 2)       0x00
>         bmControls( 3)       0x00
>         bmControls( 4)       0x00
>         bmControls( 5)       0x00
>         bmControls( 6)       0x00
>         bmControls( 7)       0x00
>         bmControls( 8)       0x00
>         bmControls( 9)       0x00
>         bmControls(10)       0x00
>         bmControls(11)       0x00
>         bmControls(12)       0x00
>         bmControls(13)       0x00
>         bmControls(14)       0x00
>         bmControls(15)       0x00
>         bmControls(16)       0x00
>         bmControls(17)       0xf0
>         bmControls(18)       0x02
>         iExtension              0 
>       VideoControl Interface Descriptor:
>         bLength                18
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             1
>         wTerminalType      0x0201 Camera Sensor
>         bAssocTerminal          0
>         iTerminal               0 
>         wObjectiveFocalLengthMin      0
>         wObjectiveFocalLengthMax      0
>         wOcularFocalLength            0
>         bControlSize                  3
>         bmControls           0x00100000
>       VideoControl Interface Descriptor:
>         bLength                13
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>         bUnitID                 5
>         bSourceID               1
>         wMaxMultiplier          0
>         bControlSize            3
>         bmControls     0x00000400
>           Power Line Frequency
>         iProcessing             0 
>         bmVideoStandards     0x00
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID            16
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID              10
>         iTerminal               0 
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID            17
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID              10
>         iTerminal               0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval              15
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       VideoStreaming Interface Descriptor:
>         bLength                            16
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         3
>         wTotalLength                   0x00bf
>         bEndPointAddress                  130
>         bmInfo                              0
>         bTerminalLink                      16
>         bStillCaptureMethod                 0
>         bTriggerSupport                     0
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>         bmaControls( 1)                     0
>         bmaControls( 2)                     4
>       VideoStreaming Interface Descriptor:
>         bLength                            28
>         bDescriptorType                    36
>         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
>         bFormatIndex                        1
>         bNumFrameDescriptors                1
>         guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
>         bBitsPerPixel                      16
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 2 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>         bVariableSize                     1
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1440
>         wHeight                          1920
>         dwMinBitRate                 10000000
>         dwMaxBitRate                 10000000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       VideoStreaming Interface Descriptor:
>         bLength                            28
>         bDescriptorType                    36
>         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
>         bFormatIndex                        2
>         bNumFrameDescriptors                1
>         guidFormat                            {43564548-0000-0010-8000-00aa00389b71}
>         bBitsPerPixel                      16
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 2 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>         bVariableSize                     1
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1440
>         wHeight                          1920
>         dwMinBitRate                 10000000
>         dwMaxBitRate                 10000000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        3
>         bNumFrameDescriptors                1
>         bFlags                              0
>           Fixed-size samples: No
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 1 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           3000
>         wHeight                          4000
>         dwMinBitRate                 10000000
>         dwMaxBitRate                 10000000
>         dwMaxVideoFrameBufferSize    36000000
>         dwDefaultFrameInterval        1000000
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)           1000000
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       VideoStreaming Interface Descriptor:
>         bLength                            16
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         3
>         wTotalLength                   0x00bf
>         bEndPointAddress                  131
>         bmInfo                              0
>         bTerminalLink                      17
>         bStillCaptureMethod                 0
>         bTriggerSupport                     0
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>         bmaControls( 1)                     0
>         bmaControls( 2)                     4
>       VideoStreaming Interface Descriptor:
>         bLength                            28
>         bDescriptorType                    36
>         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
>         bFormatIndex                        1
>         bNumFrameDescriptors                1
>         guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
>         bBitsPerPixel                      16
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 2 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>         bVariableSize                     1
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1440
>         wHeight                          1920
>         dwMinBitRate                 10000000
>         dwMaxBitRate                 10000000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       VideoStreaming Interface Descriptor:
>         bLength                            28
>         bDescriptorType                    36
>         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
>         bFormatIndex                        2
>         bNumFrameDescriptors                1
>         guidFormat                            {43564548-0000-0010-8000-00aa00389b71}
>         bBitsPerPixel                      16
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 2 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>         bVariableSize                     1
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1440
>         wHeight                          1920
>         dwMinBitRate                 10000000
>         dwMaxBitRate                 10000000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        3
>         bNumFrameDescriptors                1
>         bFlags                              0
>           Fixed-size samples: No
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 1 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           3000
>         wHeight                          4000
>         dwMinBitRate                 10000000
>         dwMaxBitRate                 10000000
>         dwMaxVideoFrameBufferSize    36000000
>         dwDefaultFrameInterval        1000000
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)           1000000
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0000
>   (Bus Powered)
> > 
> > Output of lsusb is:
> > 
> > Bus 001 Device 010: ID 1209:0001 Generic pid.codes Test PID
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.00
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2 
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   idVendor           0x1209 Generic
> >   idProduct          0x0001 pid.codes Test PID
> >   bcdDevice            0.10
> >   iManufacturer           1 Rhonda
> >   iProduct                2 Rhonda Cam
> >   iSerial                 3 FMABCLE15000007
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength       0x01ff
> >     bNumInterfaces          3
> >     bConfigurationValue     1
> >     iConfiguration          0 
> >     bmAttributes         0x80
> >       (Bus Powered)
> >     MaxPower              500mA
> >     Interface Association:
> >       bLength                 8
> >       bDescriptorType        11
> >       bFirstInterface         0
> >       bInterfaceCount         3
> >       bFunctionClass         14 Video
> >       bFunctionSubClass       3 Video Interface Collection
> >       bFunctionProtocol       0 
> >       iFunction               2 Rhonda Cam
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      1 Video Control
> >       bInterfaceProtocol      0 
> >       iInterface              2 Rhonda Cam
> >       VideoControl Interface Descriptor:
> >         bLength                14
> >         bDescriptorType        36
> >         bDescriptorSubtype      1 (HEADER)
> >         bcdUVC               1.10
> >         wTotalLength       0x006b
> >         dwClockFrequency       50.000000MHz
> >         bInCollection           2
> >         baInterfaceNr( 0)       1
> >         baInterfaceNr( 1)       2
> >       VideoControl Interface Descriptor:
> >         bLength                44
> >         bDescriptorType        36
> >         bDescriptorSubtype      6 (EXTENSION_UNIT)
> >         bUnitID                10
> >         guidExtensionCode         {e307e649-4618-a3ff-82fc-2d8b5f216773}
> >         bNumControl           146
> >         bNrPins                 1
> >         baSourceID( 0)          5
> >         bControlSize           19
> >         bmControls( 0)       0x05
> >         bmControls( 1)       0x00
> >         bmControls( 2)       0x00
> >         bmControls( 3)       0x00
> >         bmControls( 4)       0x00
> >         bmControls( 5)       0x00
> >         bmControls( 6)       0x00
> >         bmControls( 7)       0x00
> >         bmControls( 8)       0x00
> >         bmControls( 9)       0x00
> >         bmControls(10)       0x00
> >         bmControls(11)       0x00
> >         bmControls(12)       0x00
> >         bmControls(13)       0x00
> >         bmControls(14)       0x00
> >         bmControls(15)       0x00
> >         bmControls(16)       0x00
> >         bmControls(17)       0xf0
> >         bmControls(18)       0x02
> >         iExtension              0 
> >       VideoControl Interface Descriptor:
> >         bLength                18
> >         bDescriptorType        36
> >         bDescriptorSubtype      2 (INPUT_TERMINAL)
> >         bTerminalID             1
> >         wTerminalType      0x0201 Camera Sensor
> >         bAssocTerminal          0
> >         iTerminal               0 
> >         wObjectiveFocalLengthMin      0
> >         wObjectiveFocalLengthMax      0
> >         wOcularFocalLength            0
> >         bControlSize                  3
> >         bmControls           0x00100000
> >       VideoControl Interface Descriptor:
> >         bLength                13
> >         bDescriptorType        36
> >         bDescriptorSubtype      5 (PROCESSING_UNIT)
> >         bUnitID                 5
> >         bSourceID               1
> >         wMaxMultiplier          0
> >         bControlSize            3
> >         bmControls     0x00000400
> >           Power Line Frequency
> >         iProcessing             0 
> >         bmVideoStandards     0x00
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
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x81  EP 1 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0010  1x 16 bytes
> >         bInterval              15
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0 
> >       iInterface              0 
> >       VideoStreaming Interface Descriptor:
> >         bLength                            16
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  1 (INPUT_HEADER)
> >         bNumFormats                         3
> >         wTotalLength                   0x00bf
> >         bEndPointAddress                  130
> >         bmInfo                              0
> >         bTerminalLink                      16
> >         bStillCaptureMethod                 0
> >         bTriggerSupport                     0
> >         bTriggerUsage                       0
> >         bControlSize                        1
> >         bmaControls( 0)                     0
> >         bmaControls( 1)                     0
> >         bmaControls( 2)                     4
> >       VideoStreaming Interface Descriptor:
> >         bLength                            28
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
> >         bFormatIndex                        1
> >         bNumFrameDescriptors                1
> >         guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
> >         bBitsPerPixel                      16
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 2 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        0
> >         bVariableSize                     1
> >       VideoStreaming Interface Descriptor:
> >         bLength                            30
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                           1440
> >         wHeight                          1920
> >         dwMinBitRate                 10000000
> >         dwMaxBitRate                 10000000
> >         dwDefaultFrameInterval         333333
> >         bFrameIntervalType                  1
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            333333
> >       VideoStreaming Interface Descriptor:
> >         bLength                             6
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 13 (COLORFORMAT)
> >         bColorPrimaries                     1 (BT.709,sRGB)
> >         bTransferCharacteristics            1 (BT.709)
> >         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
> >       VideoStreaming Interface Descriptor:
> >         bLength                            28
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
> >         bFormatIndex                        2
> >         bNumFrameDescriptors                1
> >         guidFormat                            {43564548-0000-0010-8000-00aa00389b71}
> >         bBitsPerPixel                      16
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 2 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        0
> >         bVariableSize                     1
> >       VideoStreaming Interface Descriptor:
> >         bLength                            30
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                           1440
> >         wHeight                          1920
> >         dwMinBitRate                 10000000
> >         dwMaxBitRate                 10000000
> >         dwDefaultFrameInterval         333333
> >         bFrameIntervalType                  1
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            333333
> >       VideoStreaming Interface Descriptor:
> >         bLength                             6
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 13 (COLORFORMAT)
> >         bColorPrimaries                     1 (BT.709,sRGB)
> >         bTransferCharacteristics            1 (BT.709)
> >         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
> >       VideoStreaming Interface Descriptor:
> >         bLength                            11
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  6 (FORMAT_MJPEG)
> >         bFormatIndex                        3
> >         bNumFrameDescriptors                1
> >         bFlags                              0
> >           Fixed-size samples: No
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 1 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            30
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  7 (FRAME_MJPEG)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                           3000
> >         wHeight                          4000
> >         dwMinBitRate                 10000000
> >         dwMaxBitRate                 10000000
> >         dwMaxVideoFrameBufferSize    36000000
> >         dwDefaultFrameInterval        1000000
> >         bFrameIntervalType                  1
> >         dwFrameInterval( 0)           1000000
> >       VideoStreaming Interface Descriptor:
> >         bLength                             6
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 13 (COLORFORMAT)
> >         bColorPrimaries                     1 (BT.709,sRGB)
> >         bTransferCharacteristics            1 (BT.709)
> >         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x82  EP 2 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0200  1x 512 bytes
> >         bInterval               0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        2
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0 
> >       iInterface              0 
> >       VideoStreaming Interface Descriptor:
> >         bLength                            15
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  1 (INPUT_HEADER)
> >         bNumFormats                         2
> >         wTotalLength                   0x008f
> >         bEndPointAddress                  131
> >         bmInfo                              0
> >         bTerminalLink                      17
> >         bStillCaptureMethod                 0
> >         bTriggerSupport                     0
> >         bTriggerUsage                       0
> >         bControlSize                        1
> >         bmaControls( 0)                     0
> >         bmaControls( 1)                     0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            28
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
> >         bFormatIndex                        1
> >         bNumFrameDescriptors                1
> >         guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
> >         bBitsPerPixel                      16
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 2 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        0
> >         bVariableSize                     1
> >       VideoStreaming Interface Descriptor:
> >         bLength                            30
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                           1440
> >         wHeight                          1920
> >         dwMinBitRate                 10000000
> >         dwMaxBitRate                 10000000
> >         dwDefaultFrameInterval         333333
> >         bFrameIntervalType                  1
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            333333
> >       VideoStreaming Interface Descriptor:
> >         bLength                             6
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 13 (COLORFORMAT)
> >         bColorPrimaries                     1 (BT.709,sRGB)
> >         bTransferCharacteristics            1 (BT.709)
> >         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
> >       VideoStreaming Interface Descriptor:
> >         bLength                            28
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
> >         bFormatIndex                        2
> >         bNumFrameDescriptors                1
> >         guidFormat                            {43564548-0000-0010-8000-00aa00389b71}
> >         bBitsPerPixel                      16
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 2 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >         bCopyProtect                        0
> >         bVariableSize                     1
> >       VideoStreaming Interface Descriptor:
> >         bLength                            30
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                           1440
> >         wHeight                          1920
> >         dwMinBitRate                 10000000
> >         dwMaxBitRate                 10000000
> >         dwDefaultFrameInterval         333333
> >         bFrameIntervalType                  1
> >         dwBytesPerLine                      0
> >         dwFrameInterval( 0)            333333
> >       VideoStreaming Interface Descriptor:
> >         bLength                             6
> >         bDescriptorType                    36
> >         bDescriptorSubtype                 13 (COLORFORMAT)
> >         bColorPrimaries                     1 (BT.709,sRGB)
> >         bTransferCharacteristics            1 (BT.709)
> >         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
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
> > Device Qualifier (for other device speed):
> >   bLength                10
> >   bDescriptorType         6
> >   bcdUSB               2.00
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2 
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   bNumConfigurations      1
> > Device Status:     0x0000
> >   (Bus Powered)
> > 
> > > 
> > > Is there anything else needed to get HEVC capture working, such as
> > > extension unit controls, or is this patch enough ? What userspace
> > > software do you use to capture and decode HEVC (or capture it to disk) ?
> > No other changes to Linux nor extra actions needed to start HEVC capture.
> > We use patched version of FFmpeg to capture, decode and display HEVC
> > stream from camera device. That simple patch also going to be sent to
> > FFmpeg upstream.
> Patch for FFmpeg sent to https://patchwork.ffmpeg.org/project/ffmpeg/list/?series=1760
> > 
> > > 
> > > > Signed-off-by: Dmitry Buzdyk <dima.buzdyk@gmail.com>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 5 +++++
> > > >  drivers/media/usb/uvc/uvcvideo.h   | 4 ++++
> > > >  2 files changed, 9 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index 431d86e1c94b..825ee3601661 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -214,6 +214,11 @@ static struct uvc_format_desc uvc_fmts[] = {
> > > >  		.guid		= UVC_GUID_FORMAT_CNF4,
> > > >  		.fcc		= V4L2_PIX_FMT_CNF4,
> > > >  	},
> > > > +	{
> > > > +		.name		= "HEVC",
> > > > +		.guid		= UVC_GUID_FORMAT_HEVC,
> > > > +		.fcc		= V4L2_PIX_FMT_HEVC,
> > > > +	},
> > > >  };
> > > >  
> > > >  /* ------------------------------------------------------------------------
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 6ab972c643e3..c7f043121b41 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -165,6 +165,10 @@
> > > >  	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
> > > >  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > > >  
> > > > +#define UVC_GUID_FORMAT_HEVC \
> > > > +	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
> > > > +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > > > +
> > > >  
> > > >  /* ------------------------------------------------------------------------
> > > >   * Driver specific constants.
> > > 
> > > -- 
> > > Regards,
> > > 
> > > Laurent Pinchart
> > --
> > Dmitry Buzdyk
> > Rhonda Software
> Best Regards,
> Dmitry Buzdyk

--
Dmitry Buzdyk
Rhonda Software
