Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEC4C8E34
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 18:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfJBQXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 12:23:48 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:54416 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfJBQXs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 12:23:48 -0400
Received: by mail-wm1-f43.google.com with SMTP id p7so7877673wmp.4
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=of8Iq00wEfvH4Q+iS9U1a7kkTaGxB3Oskpd09XxfVLk=;
        b=vlT/oeFsWgC9nweDwLZlaD6B8AmpBChL8n6X8GnHXguvxVKTnZrFeALa1n69Ww+ny0
         26KA3advzMeXTM315D3DJn6bFtLvUjyKah17ljgKTX4Lt7aMMmulmuN1BnhylobG43xp
         TU1lJlftI4QOzM8nRiz2FW0dS9P7iNk2Y5I4HRzyxrqFcrKSxZQqiH5kV8Iy+t4edcw1
         wswaGaEYxz5mSF8Id7yrwR2WCF1hzZRZi5HcMCTIcRqN3ZwHXaCeLfiP5ZstxHXk1RYj
         o63bkCRoravmOIhgsK76mnnsVYT8LdV60vSVdumOkacxSa69qzGarhUWhC23M8JHO2EU
         QCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=of8Iq00wEfvH4Q+iS9U1a7kkTaGxB3Oskpd09XxfVLk=;
        b=Zd+bpEg6nUSlWPG/iNEBozqBS32p1NfePuk4Q224LLILRBwKXuRQG3BKf/ka74+PJv
         zG9qtc10aRCioKFeU45URzn/Nv8wz6V5g1MMQi/5y9rdSxnGoEG0pcioGvFXybHxSVZd
         N/P1NWAYLhEf5tnwMiex4LoObWJ9UnmhT+AORTmQj8sUZ9FjZ/oMPqkcjGFaDTf4mRJ+
         TAFaAuUxA3y3QJ5KciM6cYFMfu2+idOS6XY8FJqvUS4nI2mScf2LszZ7Zntpd+63rfoO
         WeVv+stqFXjbF/b8XcJBKi42b/J8ZPY56G61LUsiCBQWjNcP0qvrsQB4jZc94mQVzijI
         zpyg==
X-Gm-Message-State: APjAAAVd03pGOs6v7z/IecSHjSrgWPSb+KjKB+zxZ+skU7J/G14OmXOQ
        d6eT/lezB7s+xsQ8/d0HRrlAPS0LP+aqPuJanBBjgP2dacg=
X-Google-Smtp-Source: APXvYqzYFR7ysMsjuxwgMSlbMNWVWAHcLplxDziYVwSCaB8HOS0tCTLpymirNgkSMGLQQTMfMPOpY/yJTd+BdUnPbxM=
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr3764737wml.14.1570033420797;
 Wed, 02 Oct 2019 09:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1UdhbPSMZBOeW3XXBkALdNP8_Rk8T=bzeR9KpdqKC8VQ@mail.gmail.com>
 <Pine.LNX.4.44L0.1910011512470.1991-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1910011512470.1991-100000@iolanthe.rowland.org>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 2 Oct 2019 09:23:29 -0700
Message-ID: <CAJ+vNU32WbBd8BuHmojDh4adEemT57qviM12AeeiC8yFVNUgmg@mail.gmail.com>
Subject: Re: PureThermal2 UVC video camera: Failed to submit URB 0 (-28)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 1, 2019 at 12:19 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 1 Oct 2019, Tim Harvey wrote:
>
> > On Thu, Sep 26, 2019 at 3:47 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > >
> > > Greetings,
> > >
> > > I'm running into an issue with a USB UVC Full speed camera, the
> > > PureThermal2 [1] on an IMX6 based ARM board.
> > >
> > > What I find is that I get two video devices registered (the first one
> > > is the expected device, and I'm not clear what the 2nd one is). When I
> > > try to capture a single frame I get 'Failed to submit URB 0 (-28)'
> > > which historically has been due to a bandwidth issue. I encounter this
> > > on the IMX6 EHCI host as well as the OTG host when no other devices
> > > are connected (no hubs either). I've tested with both a 4.20 kernel
> > > and a 5.3 kernel.
> > >
> > > If I plug this device into another board I have based on an OcteonTX
> > > ARM64 cpu with a fairly modern 4.14 kernel and I find that a single
> > > video device gets registered and I can capture just fine.
> > >
> > > Here are some details:
> > > lsusb reports: 1e4e:0100 Cubeternet WebCam
> > >
> > > working system with 4.14 kernel hot-inserting the camera:
> > > [  495.163276] usb 1-1.2: new full-speed USB device number 6 using xhci_hcd
> > > [  495.291685] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> > > (1e4e:0100)
> > > [  495.300543] input: PureThermal (fw:v1.2.2): PureTh as
> > > /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input1
> > > [  496.731214] usb 1-1.2: USB disconnect, device number 6
> > > [  496.987294] usb 1-1.2: new full-speed USB device number 7 using xhci_hcd
> > > [  497.115683] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> > > (1e4e:0100)
> > > [  497.124182] input: PureThermal (fw:v1.2.2): PureTh as
> > > /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input2
>
> ...
>
> > > I'm also not clear why the device enumerates then disconnects and
> > > enumerates again when plugged in but this happens on the system it
> > > works on as well and I've seen similar things with other devices.
>
> Perhaps some process opens the camera's device file, does something to
> cause the camera to disconnect and reconnect, but then doesn't close
> the file.

Alan,

I found that the '2 devices' is because of a kernel commit in 4.16
that adds support for UVC metadata: 088ead2 media: uvcvideo: Add a
metadata device node. I can comment out the call to
uvc_meta_register() and the 2nd device goes away but the first (and
only) v4l2 capture device still has the same issue.

>
> > I have found that if I enumerate the camera through a PCIe based XHCI
> > host controller it still registers the 2 v4l2 devices but in this case
> > I can capture fine. So it would appear that this has something to do
> > with the IMX6 ci_hdrc controller. The -ENOSPC is getting returned from
> > drivers/usb/host/ehci-sched.c:iso_stream_schedule()
> >
> > I feel perhaps this is something basic I don't understand regarding
> > USB URB scheduling but I don't get why it occurs on the IMX6 ci_hdrc
> > controller on not an XHCI controller.
>
> It's probably related to differences between the drivers.  What shows
> up in /sys/kernel/debug/usb/devices with the camera plugged in?
>

Here's some more debugging including /sys/kernel/debug/usb/devices:

~# lsusb
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 1e4e:0100 Cubeternet WebCam
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
~# lsusb -d 1e4e:0100 -v

Bus 001 Device 002: ID 1e4e:0100 Cubeternet WebCam
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 ?
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1e4e Cubeternet
  idProduct          0x0100 WebCam
  bcdDevice            2.00
  iManufacturer           1 GroupGets
  iProduct                2 PureThermal (fw:v1.2.2)
  iSerial                 3 801f001c-5102-3038-3835-393400000000
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength          685
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               2 PureThermal (fw:v1.2.2)
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0
      iInterface              0
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength          259
        dwClockFrequency        6.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x00000000
      VideoControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            3
        bmControls     0x00000003
          Brightness
          Contrast
        iProcessing             0
        bmVideoStandards     0x1d
          None
          PAL - 625/50
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {7074312d-6c65-702d-6167-632d30303030}
        bNumControl            20
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            4
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0x0f
        bmControls( 3)       0x00
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {7074312d-6c65-702d-6f65-6d2d30303030}
        bNumControl            30
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            4
        bmControls( 0)       0xbf
        bmControls( 1)       0xff
        bmControls( 2)       0xff
        bmControls( 3)       0x7f
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                33
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 5
        guidExtensionCode         {7074312d-6c65-702d-7261-642d30303030}
        bNumControl            48
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            8
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0xff
        bmControls( 3)       0x81
        bmControls( 4)       0xfc
        bmControls( 5)       0xcf
        bmControls( 6)       0xff
        bmControls( 7)       0x03
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 6
        guidExtensionCode         {7074312d-6c65-702d-7379-732d30303030}
        bNumControl            23
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            4
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0x7f
        bmControls( 3)       0x00
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 7
        guidExtensionCode         {7074312d-6c65-702d-7669-642d30303030}
        bNumControl            14
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            4
        bmControls( 0)       0xff
        bmControls( 1)       0x3f
        bmControls( 2)       0x00
        bmControls( 3)       0x00
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                21
        guidExtensionCode         {7074312d-6c65-702d-7261-643230303030}
        bNumControl            27
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            4
        bmControls( 0)       0xf9
        bmControls( 1)       0x9f
        bmControls( 2)       0xff
        bmControls( 3)       0x07
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID               254
        guidExtensionCode         {7074312d-6c65-702d-6375-737430303030}
        bNumControl             6
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            4
        bmControls( 0)       0x3f
        bmControls( 1)       0x00
        bmControls( 2)       0x00
        bmControls( 3)       0x00
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID           255
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              32
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      VideoStreaming Interface Descriptor:
        bLength                            18
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         5
        wTotalLength                      363
        bEndPointAddress                  129
        bmInfo                              0
        bTerminalLink                     255
        bStillCaptureMethod                 1
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                    27
        bmaControls( 1)                    27
        bmaControls( 2)                    27
        bmaControls( 3)                    27
        bmaControls( 4)                    27
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors                1
        guidFormat
{55595659-0000-1000-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
          bCopyProtect                      0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x02
          Still image unsupported
          Fixed frame-rate
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  2764800
        dwMaxBitRate                  2764800
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval        1111111
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1111111
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors                2
        guidFormat
{59313620-0000-1000-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
          bCopyProtect                      0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x02
          Still image unsupported
          Fixed frame-rate
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  2764800
        dwMaxBitRate                  2764800
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval        1111111
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1111111
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x02
          Still image unsupported
          Fixed frame-rate
        wWidth                            160
        wHeight                           122
        dwMinBitRate                  2810880
        dwMaxBitRate                  2810880
        dwMaxVideoFrameBufferSize       39040
        dwDefaultFrameInterval        1111111
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1111111
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        3
        bNumFrameDescriptors                1
        guidFormat
{59382020-0000-1000-8000-00aa00389b71}
        bBitsPerPixel                       8
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
          bCopyProtect                      0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x02
          Still image unsupported
          Fixed frame-rate
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  1382400
        dwMaxBitRate                  1382400
        dwMaxVideoFrameBufferSize       19200
        dwDefaultFrameInterval        1111111
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1111111
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        4
        bNumFrameDescriptors                1
        guidFormat
{52474250-0000-1000-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
          bCopyProtect                      0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x02
          Still image unsupported
          Fixed frame-rate
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  2764800
        dwMaxBitRate                  2764800
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval        1111111
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1111111
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        5
        bNumFrameDescriptors                1
        guidFormat
{7deb36e4-4f52-ce11-9f53-0020af0ba770}
        bBitsPerPixel                      24
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
          bCopyProtect                      0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x02
          Still image unsupported
          Fixed frame-rate
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  4147200
        dwMaxBitRate                  4147200
        dwMaxVideoFrameBufferSize       57600
        dwDefaultFrameInterval        1111111
        bFrameIntervalType                  1
        dwFrameInterval( 0)           1111111
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x03c2  1x 962 bytes
        bInterval               1
Device Status:     0x0000
  (Bus Powered)
~# for i in $(ls -1d /sys/class/video4linux/video*); do echo $i:$(cat
$i/name); done
/sys/class/video4linux/video0:PureThermal (fw:v1.2.2): PureTh
/sys/class/video4linux/video1:ipu1_csi0 capture
/sys/class/video4linux/video2:ipu1_ic_prpenc capture
/sys/class/video4linux/video3:ipu1_ic_prpvf capture
/sys/class/video4linux/video4:ipu1_csi1 capture
/sys/class/video4linux/video5:ipu2_csi0 capture
/sys/class/video4linux/video6:ipu2_ic_prpenc capture
/sys/class/video4linux/video7:ipu2_ic_prpvf capture
/sys/class/video4linux/video8:ipu2_csi1 capture
/sys/class/video4linux/video9:ipu_ic_pp csc/scaler
~# v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=x.raw
--stream-count=1
[   82.433385] uvcvideo: uvc_v4l2_open
[   82.449716] uvcvideo: uvc_v4l2_mmap
[   82.453767] uvcvideo: uvc_v4l2_mmap
[   82.457408] uvcvideo: uvc_v4l2_mmap
[   82.460983] uvcvideo: uvc_v4l2_mmap
[   82.466275] uvcvideo: Device requested 962 B/frame bandwidth.
[   82.472579] uvcvideo: Selecting alternate setting 1 (962 B/frame bandwidth).
[   82.485634] uvcvideo: Allocated 5 URB buffers of 32x962 bytes each.
[   82.492431] ci_hdrc ci_hdrc.0: iso sched full 399d9fef
[   82.497845] uvcvideo: Failed to submit URB 0 (-28).
VIDIOC_STREAMON: failed: No space left on device
[   82.511215] uvcvideo: uvc_v4l2_release
~# cat /sys/kernel/debug/usb/devices

T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480  MxCh= 1
B:  Alloc=  0/800 us ( 0%), #Int=  0, #Iso=  0
D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1d6b ProdID=0002 Rev= 5.03
S:  Manufacturer=Linux 5.3.0-00157-g651f7f9-dirty ehci_hcd
S:  Product=EHCI Host Controller
S:  SerialNumber=ci_hdrc.0
C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
I:* If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
E:  Ad=81(I) Atr=03(Int.) MxPS=   4 Ivl=256ms

T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1e4e ProdID=0100 Rev= 2.00
S:  Manufacturer=GroupGets
S:  Product=PureThermal (fw:v1.2.2)
S:  SerialNumber=801f001c-5102-3038-3835-393400000000
C:* #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 2 Cls=0e(video) Sub=03 Prot=00
I:* If#= 0 Alt= 0 #EPs= 1 Cls=0e(video) Sub=01 Prot=00 Driver=uvcvideo
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:* If#= 1 Alt= 0 #EPs= 0 Cls=0e(video) Sub=02 Prot=00 Driver=uvcvideo
I:  If#= 1 Alt= 1 #EPs= 1 Cls=0e(video) Sub=02 Prot=00 Driver=uvcvideo
E:  Ad=81(I) Atr=01(Isoc) MxPS= 962 Ivl=1ms

T:  Bus=02 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480  MxCh= 1
B:  Alloc=  0/800 us ( 0%), #Int=  0, #Iso=  0
D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1d6b ProdID=0002 Rev= 5.03
S:  Manufacturer=Linux 5.3.0-00157-g651f7f9-dirty ehci_hcd
S:  Product=EHCI Host Controller
S:  SerialNumber=ci_hdrc.1
C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
I:* If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
E:  Ad=81(I) Atr=03(Int.) MxPS=   4 Ivl=256ms

~# [  224.159009] systemd-journald[278]: Sent WATCHDOG=1 notification.
v4l2-ctl --device /dev/video0 --all
[  283.767759] uvcvideo: uvc_v4l2_open
Driver Info (not using libv4l2):
        Driver name   : uvcvideo
        Car[  283.777534] systemd-journald[278]: Sent WATCHDOG=1 notification.
d type     : PureThermal (fw:v1.2[  283.785714] uvcvideo: uvc_v4l2_release
.2): PureTh
        Bus info      : usb-ci_hdrc.0-1
        Driver version: 5.3.0
        Capabilities  : 0x84A00001
                Video Capture
                Metadata Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps   : 0x04200001
                Video Capture
                Streaming
                Extended Pix Format
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
        Width/Height      : 160/120
        Pixel Format      : 'UYVY'
        Field             : None
        Bytes per Line    : 320
        Size Image        : 38400
        Colorspace        : sRGB
        Transfer Function : Default (maps to sRGB)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Limited Range)
        Flags             :
Crop Capability Video Capture:
        Bounds      : Left 0, Top 0, Width 160, Height 120
        Default     : Left 0, Top 0, Width 160, Height 120
        Pixel Aspect: 1/1
Selection: crop_default, Left 0, Top 0, Width 160, Height 120
Selection: crop_bounds, Left 0, Top 0, Width 160, Height 120
Streaming Parameters Video Capture:
        Capabilities     : timeperframe
        Frames per second: 9.000 (9/1)
        Read buffers     : 0
                     brightness 0x00980900 (int)    : min=0 max=255
step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=255
step=1 default=128 value=128

So regardless of resolution/frame-size the device is requesting 962
byte USB frame bandwidth which should be just fine for USB full speed
in iso mode (max 1023). I'm not sure why the bandwidth reservation
fails.

Apparently the RaspberryPi 4 has this same issue:
https://github.com/raspberrypi/linux/issues/3136. The same thread
mentions that most USB full speed devices have fall-back endpoint
max-packet sizes that allow for reduced bandwidth reservations (but
this camera does not).

I get the same results regardless of CONFIG_USB_EHCI_TT_NEWSCHED enabled or not.

<snip>
>
> PS: These notices are completely inappropriate for a messages sent to a
> public mailing list.  If adhered to strictly, they would prevent anyone
> from replying to your message.
>

sorry about the sig... IT department inserted that via our mail server
and I didn't realize it was in use. Problem resolved.

Tim
