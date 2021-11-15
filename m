Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A808450E51
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 19:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237720AbhKOSO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 13:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240130AbhKOSFk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 13:05:40 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10EBCC04C342;
        Mon, 15 Nov 2021 09:34:47 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id bf8so36372170oib.6;
        Mon, 15 Nov 2021 09:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mVnS4Vpg/K/QCh7EpDqryQWYhAq75JuFOtQpiAqfotE=;
        b=cTaZX7GPSR0CSU/7JVxMMAVVmsZ3jWxu8Az8f7k2KK36vl05PX4oxOn6E9a6f2WMNr
         8AAjQBmP8h1j0QDmVps+p2sgcaFrkp3MT/vi9wjIk2QHf1nWUdDY8Ha/XQRLAXjCheHZ
         xxc0rW6Q2DcOHpiiw5OToWTQ6+tgePur5WJk/Dp/cwWlo49iDdzJTU8LbIQBGg3mpuwD
         9Fz7qXMggaGqc8ffvJ0siafUJSGmciS2gtXpyEdiN6iIp5QLszy12vQfgqaOAvjluGKk
         r7UKm2EG9yPOqiF6QSWlsXu0JGeX/07Xt9U73OtiQsKaI7Np+VN9P/HfJhJjw6VHR9jy
         KWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mVnS4Vpg/K/QCh7EpDqryQWYhAq75JuFOtQpiAqfotE=;
        b=wjzOun9wAzi42QzdNFbEL8RbYGmpkIYkLZa07JJ7J3/n3ERdpDgAMhBryNWMm4q3cQ
         F9JNTda9Xbu3DtPL3jke3Tx8akRIiu/sENqsiU2oote3euHJUuyZ3Rq6nGepMDXOGlgS
         bGhJZVgqk9UtlxDd1pMayKJl4S6KdgaGq1Ai6hfDyTXyTzmEfoSYXqjhJ2Sl7LPGhK3C
         zm/O14AjZJqi3TueMXKChyGunTkKR1z0Tg5kWO7TtCSCROjJhTuMfcl1+FWc+eBT0T7W
         SC84U/z+0bjlKG02gf+aNBxiyzEnS/oW78oghaBJ15a2/6O3p87SMSymEiqyC15SuAWW
         76BQ==
X-Gm-Message-State: AOAM531We64K5K/7/R+rCTmhMoeIdvy5ylWCl7pFlH85rgFEFKFYOhjl
        eyfy/9qyV+ROqFnSmXkcav0A2l1bcyQrYoTvYoI=
X-Google-Smtp-Source: ABdhPJxk70RGBkR1u3VtBzC2J0Y1gprKo5Mn9jDUtynsoo7BHBPiYc4Qw9dxN2LlCjKTdPPu8Iq8nIZmYFKNIg+3ubY=
X-Received: by 2002:a05:6808:1641:: with SMTP id az1mr45926543oib.67.1636997686208;
 Mon, 15 Nov 2021 09:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20211114085236.2345589-1-james.hilliard1@gmail.com>
 <YZIorH8D7NPB3w5B@pendragon.ideasonboard.com> <CADvTj4pY+2OXPLy1_pVuiA6=BR9u8634HhP5XBWnGUTVPk5wtg@mail.gmail.com>
 <YZJhF+Mv9uMhQHqp@pendragon.ideasonboard.com>
In-Reply-To: <YZJhF+Mv9uMhQHqp@pendragon.ideasonboard.com>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Mon, 15 Nov 2021 10:34:35 -0700
Message-ID: <CADvTj4o4PKRaaLtKvs92=UC6M7XabgQJ0OsOtFxtjC8XBX++pQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT to
 5 seconds.
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 15, 2021 at 6:31 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi James,
>
> On Mon, Nov 15, 2021 at 06:16:50AM -0700, James Hilliard wrote:
> > On Mon, Nov 15, 2021 at 2:30 AM Laurent Pinchart wrote:
> > > On Sun, Nov 14, 2021 at 01:52:36AM -0700, James Hilliard wrote:
> > > > Some uvc devices appear to require the maximum allowed USB timeout
> > > > for GET_CUR/SET_CUR requests.
> > >
> > > Could you list the devices that you know about which require this change
> > > ?
> >
> > Seems random unbranded chinese made cameras is where I was hitting it,
> > but I was seeing a decent amount of others encountering similar timeout issues
> > when researching the issue.
>
> Can you share the USB descriptors (output of 'lsusb -v') for those
> devices ?

This is the one I have that was hitting the issue reliably:
Bus 001 Device 005: ID 0bda:3035 Generic USB Camera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239
  bDeviceSubClass         2
  bDeviceProtocol         1
  bMaxPacketSize0        64
  idVendor           0x0bda
  idProduct          0x3035
  bcdDevice            0.01
  iManufacturer           3 Generic
  iProduct                1 USB Camera
  iSerial                 2 200901010001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0446
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          4 USB Camera
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14
      bFunctionSubClass       3
      bFunctionProtocol       0
      iFunction               5 USB Camera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14
      bInterfaceSubClass      1
      bInterfaceProtocol      0
      iInterface              5 USB Camera
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004e
        dwClockFrequency       15.000000MHz
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
        bmControls           0x0000200e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
          Roll (Absolute)
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000177f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Gamma
          White Balance Temperature
          Backlight Compensation
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0
        bmVideoStandards     0x09
          None
          SECAM - 625/50
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {1229a78c-47b4-4094-b0ce-db07386fb938}
        bNumControls            2
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            2
        bmControls( 0)       0x00
        bmControls( 1)       0x06
        iExtension              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               6
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14
      bInterfaceSubClass      2
      bInterfaceProtocol      0
      iInterface              0
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x0359
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       3
        bStillCaptureMethod                 2
        bTriggerSupport                     1
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors               11
        bFlags                              1
          Fixed-size samples: Yes
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  1536000
        dwMaxBitRate                  9216000
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                  8110080
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 38400000
        dwMaxBitRate                230400000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           768
        dwMinBitRate                 62914560
        dwMaxBitRate                377487360
        dwMaxVideoFrameBufferSize     1572864
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                          1024
        dwMinBitRate                104857600
        dwMaxBitRate                629145600
        dwMaxVideoFrameBufferSize     2621440
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                 0x00  EP 0 OUT
        bNumImageSizePatterns              10
        wWidth( 0)                       1920
        wHeight( 0)                      1080
        wWidth( 1)                       1920
        wHeight( 1)                      1080
        wWidth( 2)                       1280
        wHeight( 2)                      1024
        wWidth( 3)                       1280
        wHeight( 3)                       720
        wWidth( 4)                       1024
        wHeight( 4)                       768
        wWidth( 5)                        800
        wHeight( 5)                       600
        wWidth( 6)                        640
        wHeight( 6)                       480
        wWidth( 7)                        352
        wHeight( 7)                       288
        wWidth( 8)                        320
        wHeight( 8)                       240
        wWidth( 9)                        160
        wHeight( 9)                       120
        bNumCompressionPatterns             0
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
        bNumFrameDescriptors                5
        guidFormat
{32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                165888000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  2
        dwFrameInterval( 0)           1000000
        dwFrameInterval( 1)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 38400000
        dwMaxBitRate                153600000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         500000
        bFrameIntervalType                  4
        dwFrameInterval( 0)            500000
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1000000
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                 41472000
        dwMaxBitRate                165888000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         500000
        bFrameIntervalType                  4
        dwFrameInterval( 0)            500000
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1000000
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            18
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                 0x00  EP 0 OUT
        bNumImageSizePatterns               3
        wWidth( 0)                        640
        wHeight( 0)                       480
        wWidth( 1)                        960
        wHeight( 1)                       540
        wWidth( 2)                       1280
        wHeight( 2)                       720
        bNumCompressionPatterns             0
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
      bInterfaceClass        14
      bInterfaceSubClass      2
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14
      bInterfaceSubClass      2
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14
      bInterfaceSubClass      2
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14
      bInterfaceSubClass      2
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0b00  2x 768 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14
      bInterfaceSubClass      2
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0c00  2x 1024 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14
      bInterfaceSubClass      2
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1380  3x 896 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       7
      bNumEndpoints           1
      bInterfaceClass        14
      bInterfaceSubClass      2
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1400  3x 1024 bytes
        bInterval               1
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239
  bDeviceSubClass         2
  bDeviceProtocol         1
  bMaxPacketSize0        64
  bNumConfigurations      1
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
  (Bus Powered)

>
> > > > So lets just bump the UVC control timeout to 5 seconds which is the
> > > > same as the usb ctrl get/set defaults:
> > > > USB_CTRL_GET_TIMEOUT 5000
> > > > USB_CTRL_SET_TIMEOUT 5000
> > >
> > > The USB specification (section 9.2.6.4) requires the device to send the
> > > first data packet within 500ms of reception of the request. A 500ms
> > > timeout may thus be a bit too short for compliant devices, but 5000ms
> > > seems to be a very large margin. I'm wondering if it would make sense to
> > > go for a lower value.
> >
> > The 500 ms timeout appears to be applicable:
> > "For standard device requests that require data stage transfer to the host"
> >
> > While the 5s timeout appears to be applicable to:
> > "For standard device requests that require a data stage transfer to the device"
>
> Ah yes good point.
>
> > From what I could tell a lot of software just uses the 5s timeout everywhere for
> > these GET_CUR and SET_CUR requests, I think it's probably best to just use
> > the 5s timeout, that way it's much less likely that we'll see timeout bugs here as
> > it seems likely a lot of vendors are testing against software using
> > the 5s timeout.
>
> We could have a lower timeout for GET_CUR requests, but I agree it's
> likely not worth it.

Yeah, actually I think there's maybe a request queue of some sort in the device
firmware which may cause SET_CUR requests(or maybe just previous requests)
to increase GET_CUR timeouts in subsequent requests.

I'm not really sure why exactly these delays happen but increasing the timeout
seems to reliably fix the failures for both GET_CUR and SET_CUR requests.

>
> > I don't really see any harm in bumping it up to 5 seconds, maybe there is something
> > I'm missing there though?
>
> It would be nice to report failures faster to applications, but it's not
> mandatory, especially given that failures are not supposed to happen.

Yeah, I think it's much better to have it on the longer side so that
we don't get false
errors for slow devices.

>
> > > > Fixes:
> > > > Failed to query (GET_CUR) UVC control 11 on unit 2: -110 (exp. 1).
> > > > Failed to query (SET_CUR) UVC control 3 on unit 2: -110 (exp. 2).
> > > >
> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > > > ---
> > > >  drivers/media/usb/uvc/uvcvideo.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index fd4f5ef47dfb..583c51ac3eec 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -189,7 +189,7 @@
> > > >  /* Maximum status buffer size in bytes of interrupt URB. */
> > > >  #define UVC_MAX_STATUS_SIZE  16
> > > >
> > > > -#define UVC_CTRL_CONTROL_TIMEOUT     500
> > > > +#define UVC_CTRL_CONTROL_TIMEOUT     5000
> > > >  #define UVC_CTRL_STREAMING_TIMEOUT   5000
> > > >
> > > >  /* Maximum allowed number of control mappings per device */
>
> --
> Regards,
>
> Laurent Pinchart
