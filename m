Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7525B54BD7B
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 00:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234578AbiFNWOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 18:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233832AbiFNWOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 18:14:54 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3164FC70
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 15:14:52 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id b8so13517949edj.11
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 15:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ridgerun-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/0oKjShvfuQ7XKwx58jn7YaTKmNW68lgK10ElN+94ZE=;
        b=OXe6xxT7yzJ01NrrsgWTOkqAicr54VRMjsuBgpsyFJKg649RKb62Iz/+gmyWr9SFkN
         ZWj+BpkG12ibeI5zxb7PSaSxiAwo5yyCSrjgAqiwbXcDef4OAO0CZPS0+1wJt9kDleA3
         S+jxB/RXnhWYYhxhNOiyJvXP/hrEilhjRYP1ecRgr07jEnVtS8on0p0El1bWrUME96rg
         YjUONz3qNi3MZciSjs6S24/tvAO8c30XVbOO+QB4mrBSM37/j2BE3YuO1+28Jvc/ayEY
         2P9zhXZfB4qIm3qgpbZS1P9xATc7O3F1CecE69hc+Q71vHKPxZ0WqPexMpP5tRzT15RB
         Rodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/0oKjShvfuQ7XKwx58jn7YaTKmNW68lgK10ElN+94ZE=;
        b=3J4Wli/YAWJwOl70Tfi5ZR7HNA7GoTcHZx+K1OvV2xsguMXLAsuP2Oke5QV8a7VykS
         gKpFAkVn6m5U0WQk7OpzGAu2FwFtY+QQjre5VgtC+mYJTQPx2Y3potBusldJcr/w1mdz
         FqTbFr0OP+tVtvt0phBXAb+nWpx5iZ19WLM2TJN/nv3aceHjdqjc5hgssm+EnTDfVLAc
         XOaUKZeAAvDibC0u4JkzbkVyVA8E0PUTcurVTNK7H+u8DSnGJvmKO0O7bLE6yB/Fx2vE
         Mve2ViYXYbMUZWtcQkT6rv5cAmM0pWm8EWeFwVB0IdUuKXasg7E+YQZqMQd3NQWKP1ak
         lHVw==
X-Gm-Message-State: AOAM531eB7v742PYHtU7x7IHmUfgmahREMElKgxOE4h4//toxMoDeYku
        tDjZPWK+HNptcpVMnU39ySn/9SISvl2nj8UwnmAiMSywQcZavVrg
X-Google-Smtp-Source: ABdhPJxtCcZ/TUHy11Zof93MHq1+LoBmtkf9DAmTXh3jipPCJf7/TSUDp7NnzgQekmOpAtaPx5/l92kQb1bno0yeO7w=
X-Received: by 2002:a05:6402:280b:b0:434:efd8:d9ae with SMTP id
 h11-20020a056402280b00b00434efd8d9aemr8796788ede.120.1655244890592; Tue, 14
 Jun 2022 15:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <CADWWMa4PTkr6UqKrr0xH-5=J3r+NLYdHnPyBQ9OzfGEjBZfdcw@mail.gmail.com>
 <CANiDSCt3CQueEb1BKg+8-z3e=E5_xqJf0muxW+RrghOpjLK_Aw@mail.gmail.com>
In-Reply-To: <CANiDSCt3CQueEb1BKg+8-z3e=E5_xqJf0muxW+RrghOpjLK_Aw@mail.gmail.com>
From:   =?UTF-8?Q?Marisol_Zeled=C3=B3n?= <marisol.zeledon@ridgerun.com>
Date:   Tue, 14 Jun 2022 16:14:39 -0600
Message-ID: <CADWWMa7+RAL0Jfr+cV+1yepXA5VR+72v2fqKHnOJD6EWkymkYQ@mail.gmail.com>
Subject: Re: [Support query] UVC fails if defined as second function in a
 configfs composite driver
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for your response. I increased the trace level as advised
but didn't get any more useful information:

[27751.660199] uvcvideo: Probing generic UVC device 2
[27751.660306] uvcvideo: Found format YUV 4:2:2 (YUYV).
[27751.660310] uvcvideo: - 640x360 (15.0 fps)
[27751.660312] uvcvideo: - 1280x720 (2.0 fps)
[27751.660317] uvcvideo: Found a Status endpoint (addr 83).
[27751.660320] uvcvideo: Found UVC 1.00 device Linux for Tegra (0955:7020)
[27751.660327] uvcvideo: Added control
00000000-0000-0000-0000-000000000001/2 to device 2 entity 1
[27751.660428] uvcvideo: Failed to query (GET_INFO) UVC control 2 on
unit 1: -32 (exp. 1).
[27756.893967] uvcvideo: Adding mapping 'Exposure, Auto' to control
00000000-0000-0000-0000-000000000001/2.
[27756.893973] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/2 to device 2 entity 2
[27762.013921] uvcvideo: Failed to query (GET_INFO) UVC control 2 on
unit 2: -110 (exp. 1).
[27762.013930] uvcvideo: Adding mapping 'Brightness' to control
00000000-0000-0000-0000-000000000101/2.
[27762.013934] uvcvideo: Scanning UVC chain: OT 3 <- PU 2 <- IT 1
[27762.013939] uvcvideo: Found a valid video chain (1 -> 3).
[27792.733672] uvcvideo: UVC non compliance - GET_DEF(PROBE) not
supported. Enabling workaround.
[27797.853646] uvcvideo: Failed to query (129) UVC probe control :
-110 (exp. 26).
[27797.853652] uvcvideo: Failed to initialize the device (-5).

In contrast, here is the log when UVC is successful (defined as first
function in the composite driver):

[27916.011570] uvcvideo: Probing generic UVC device 2
[27916.011666] uvcvideo: Found format YUV 4:2:2 (YUYV).
[27916.011669] uvcvideo: - 640x360 (15.0 fps)
[27916.011670] uvcvideo: - 1280x720 (2.0 fps)
[27916.011674] uvcvideo: Found a Status endpoint (addr 81).
[27916.011676] uvcvideo: Found UVC 1.00 device Linux for Tegra (0955:7020)
[27916.011681] uvcvideo: Added control
00000000-0000-0000-0000-000000000001/2 to device 2 entity 1
[27916.012026] uvcvideo: Adding mapping 'Exposure, Auto' to control
00000000-0000-0000-0000-000000000001/2.
[27916.012029] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/2 to device 2 entity 2
[27916.012181] uvcvideo: Adding mapping 'Brightness' to control
00000000-0000-0000-0000-000000000101/2.
[27916.012183] uvcvideo: Scanning UVC chain: OT 3 <- PU 2 <- IT 1
[27916.012190] uvcvideo: Found a valid video chain (1 -> 3).
[27916.013757] uvcvideo: UVC device initialized.

I have also used usbmon since I've tried some USB sniffing tools to
try and figure out the problem. Please let me know of any more
comments or ideas.

Regards,

On Tue, Jun 14, 2022 at 3:39 PM Ricardo Ribalda <ribalda@chromium.org> wrot=
e:
>
> Hi Marisol
>
> Could you try increasing the trace level with:
>
> rmmod uvcvideo
> modprobe uvcvideo trace=3D0xffffffff
>
> And then connect your camera.
>
> That might give you a better idea of what is going on.
>
> You could also use usbmon to discard that there is a problem with the
> usb gadget.
>
> Regards!
>
> On Tue, 14 Jun 2022 at 23:31, Marisol Zeled=C3=B3n
> <marisol.zeledon@ridgerun.com> wrote:
> >
> > Hi,
> >
> > I have been trying to build a configfs - composite driver with UVC. I
> > have other functions such as mass storage and RNDIS included. When I
> > define UVC as the first function, everything seems to work fine, I see
> > the video device on my host computer and the device is able to send
> > frames to it. All other functions get triggered and work fine. The
> > thing is, I need UVC as the second function defined since RNDIS only
> > works on a Windows host if it is the first function defined (I need
> > this composite driver to work with a Windows host too and this is
> > apparently a Microsoft limitation/requirement).
> >
> > - So when I define UVC as the second function, it is not able to
> > create the video device on the host, I get the following logs on the
> > Linux host's side:
> >
> > [40166.930912] uvcvideo: Failed to query (GET_INFO) UVC control 2 on
> > unit 1: -32 (exp. 1).
> > [40177.294692] uvcvideo: Failed to query (GET_INFO) UVC control 2 on
> > unit 2: -110 (exp. 1).
> > [40208.014706] uvcvideo: UVC non compliance - GET_DEF(PROBE) not
> > supported. Enabling workaround.
> > [40213.134647] uvcvideo: Failed to query (129) UVC probe control :
> > -110 (exp. 26).
> > [40213.134653] uvcvideo: Failed to initialize the device (-5).
> >
> > - These are the descriptors I get from the host's side:
> >
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               3.20
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2 ?
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0         9
> >   idVendor           0x0955 NVidia Corp.
> >   idProduct          0x7020
> >   bcdDevice            0.02
> >   iManufacturer           1
> >   iProduct                2
> >   iSerial                 3
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength          317
> >     bNumInterfaces          4
> >     bConfigurationValue     1
> >     iConfiguration          4
> >     bmAttributes         0xe0
> >       Self Powered
> >       Remote Wakeup
> >     MaxPower                0mA
> >     Interface Association:
> >       bLength                 8
> >       bDescriptorType        11
> >       bFirstInterface         0
> >       bInterfaceCount         2
> >       bFunctionClass          2 Communications
> >       bFunctionSubClass       6 Ethernet Networking
> >       bFunctionProtocol       0
> >       iFunction               7
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass         2 Communications
> >       bInterfaceSubClass      2 Abstract (modem)
> >       bInterfaceProtocol    255 Vendor Specific (MSFT RNDIS?)
> >       iInterface              5
> >       CDC Header:
> >         bcdCDC               1.10
> >       CDC Call Management:
> >         bmCapabilities       0x00
> >         bDataInterface          1
> >       CDC ACM:
> >         bmCapabilities       0x00
> >       CDC Union:
> >         bMasterInterface        0
> >         bSlaveInterface         1
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x82  EP 2 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0008  1x 8 bytes
> >         bInterval               9
> >         bMaxBurst               0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        1
> >       bAlternateSetting       0
> >       bNumEndpoints           2
> >       bInterfaceClass        10 CDC Data
> >       bInterfaceSubClass      0 Unused
> >       bInterfaceProtocol      0
> >       iInterface              6
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x81  EP 1 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0400  1x 1024 bytes
> >         bInterval               0
> >         bMaxBurst               0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x01  EP 1 OUT
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0400  1x 1024 bytes
> >         bInterval               0
> >         bMaxBurst               0
> >     Interface Association:
> >       bLength                 8
> >       bDescriptorType        11
> >       bFirstInterface         2
> >       bInterfaceCount         2
> >       bFunctionClass         14 Video
> >       bFunctionSubClass       3 Video Interface Collection
> >       bFunctionProtocol       0
> >       iFunction               9
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        2
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      1 Video Control
> >       bInterfaceProtocol      0
> >       iInterface              9
> >       VideoControl Interface Descriptor:
> >         bLength                13
> >         bDescriptorType        36
> >         bDescriptorSubtype      1 (HEADER)
> >         bcdUVC               1.00
> >         wTotalLength           52
> >         dwClockFrequency       48.000000MHz
> >         bInCollection           1
> >         baInterfaceNr( 0)       3
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
> >         bmControls           0x00000002
> >           Auto-Exposure Mode
> >       VideoControl Interface Descriptor:
> >         bLength                12
> >         bDescriptorType        36
> >         bDescriptorSubtype      5 (PROCESSING_UNIT)
> >         bUnitID                 2
> >         bSourceID               1
> >         wMaxMultiplier      16384
> >         bControlSize            2
> >         bmControls     0x00000001
> >           Brightness
> >         iProcessing             0
> >         bmVideoStandards     0x 0
> >       VideoControl Interface Descriptor:
> >         bLength                 9
> >         bDescriptorType        36
> >         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> >         bTerminalID             3
> >         wTerminalType      0x0101 USB Streaming
> >         bAssocTerminal          0
> >         bSourceID               2
> >         iTerminal               0
> >       Endpoint Descriptor:
> >         bLength                 7
> >         bDescriptorType         5
> >         bEndpointAddress     0x83  EP 3 IN
> >         bmAttributes            3
> >           Transfer Type            Interrupt
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0010  1x 16 bytes
> >         bInterval               8
> >         bMaxBurst               0
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        3
> >       bAlternateSetting       0
> >       bNumEndpoints           1
> >       bInterfaceClass        14 Video
> >       bInterfaceSubClass      2 Video Streaming
> >       bInterfaceProtocol      0
> >       iInterface              0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            14
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  1 (INPUT_HEADER)
> >         bNumFormats                         1
> >         wTotalLength                      115
> >         bEndPointAddress                  132
> >         bmInfo                              0
> >         bTerminalLink                       3
> >         bStillCaptureMethod                 0
> >         bTriggerSupport                     0
> >         bTriggerUsage                       0
> >         bControlSize                        1
> >         bmaControls( 0)                    27
> >       VideoStreaming Interface Descriptor:
> >         bLength                            27
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
> >         bFormatIndex                        1
> >         bNumFrameDescriptors                2
> >         guidFormat
> > {59555932-0000-1000-8000-00aa00389b71}
> >         bBitsPerPixel                      16
> >         bDefaultFrameIndex                  1
> >         bAspectRatioX                       0
> >         bAspectRatioY                       0
> >         bmInterlaceFlags                 0x00
> >           Interlaced stream or variable: No
> >           Fields per frame: 2 fields
> >           Field 1 first: No
> >           Field pattern: Field 1 only
> >           bCopyProtect                      0
> >       VideoStreaming Interface Descriptor:
> >         bLength                            38
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> >         bFrameIndex                         1
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                            640
> >         wHeight                           360
> >         dwMinBitRate                 18432000
> >         dwMaxBitRate                 55296000
> >         dwMaxVideoFrameBufferSize      460800
> >         dwDefaultFrameInterval         666666
> >         bFrameIntervalType                  3
> >         dwFrameInterval( 0)            666666
> >         dwFrameInterval( 1)           1000000
> >         dwFrameInterval( 2)           5000000
> >       VideoStreaming Interface Descriptor:
> >         bLength                            30
> >         bDescriptorType                    36
> >         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
> >         bFrameIndex                         2
> >         bmCapabilities                   0x00
> >           Still image unsupported
> >         wWidth                           1280
> >         wHeight                           720
> >         dwMinBitRate                 29491200
> >         dwMaxBitRate                 29491200
> >         dwMaxVideoFrameBufferSize     1843200
> >         dwDefaultFrameInterval        5000000
> >         bFrameIntervalType                  1
> >         dwFrameInterval( 0)           5000000
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
> >         bEndpointAddress     0x84  EP 4 IN
> >         bmAttributes            2
> >           Transfer Type            Bulk
> >           Synch Type               None
> >           Usage Type               Data
> >         wMaxPacketSize     0x0400  1x 1024 bytes
> >         bInterval               0
> >         bMaxBurst               0
> >
> >
> > On the device's side I don't get any failure logs. Is there any known
> > limitation to the UVC driver similar to the RNDIS one in Windows
> > hosts? Does it forcefully need to be defined as the first function to
> > work?
> >
> > Thank you in advance,
> > --
> > Marisol Zeled=C3=B3n C=C3=B3rdoba
> > Embedded Software Engineer
> > RidgeRun Embedded Solutions
> > San Jos=C3=A9, Costa Rica
>
>
>
> --
> Ricardo Ribalda



--=20

Marisol Zeled=C3=B3n C=C3=B3rdoba
Embedded Software Engineer
RidgeRun Embedded Solutions
San Jos=C3=A9, Costa Rica
