Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45F42DAEFB
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 15:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbgLOO3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 09:29:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729586AbgLOO3Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 09:29:24 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0846C0617A6
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 06:28:43 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id 143so19166274qke.10
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 06:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cUjQQ+PsjtvJxsRi2fXxB3NpzmKkm+ZHURavdcXsp3s=;
        b=Jw96oTnWHMbNgAQ/1F1YY4hCTK0SH7fd2h7vOuZFsKS6hNl+txFNH345b/WJjNL1TT
         +EJIUDESNHBv0GNjWzhQlER9CtlougsUmEIuaSlwXmewlOM8MvZVKUmzvO6/nEeaMcW0
         BFKRWrAhmHSkU1tiH66pzYdscxQKnx7BrJ1T7OnYm5RXWGYmsrY6+e8PzTgW0wXXeoZl
         7t6r09Y/uDmXRS4Wl3YgtjuV2kEd2FeU/22wqM/45kxUs0ohW45ZWB8qEnt6MIUKS0BW
         zrFwINoeC/VcI2MOwoOR5dSTsm6yTNswDu3ePZrPj9D+Fn2yzPJTO4btSB76EYKxctfJ
         hBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cUjQQ+PsjtvJxsRi2fXxB3NpzmKkm+ZHURavdcXsp3s=;
        b=msUn8bAyi6Ed1FVHBnmTBfcO98gh8M/twrDIVGKsQjUfdAAccMyGfC2WSu5ba3bO8x
         fKjeNkwFpOKk6D/Mi8/URjPvcaFGngsL+YGlOin8XdEd1gk2eagtg6xB08tk6237e3yp
         ZtK760/u1gNO5MCuDq3ugrYJSDzmBN0DyfsP+SweZYBSMzP3TqkV48480nim/a0bR0dV
         pPhhOHvEKM04bloXBVpKMYqEGEqk9G8H0fHE/40Xys6BglHBo4Pu7oAloHHlFW7Pd2qx
         AL+S4NvYFw9nufF2autyeqdjPJLq1akKl1TkQuzvAen7R2zxIozG62JYldgUxlQrpT/E
         FkuQ==
X-Gm-Message-State: AOAM5332rBPsMNSPsOx0Vb3eRSZHhMQicdHIBKMp/9X2UxI3B6LS9idx
        d0WmYJNYdf494s7B+Y7Bd7MS5zJvJDsQbLeeG58kndSb/z1k
X-Google-Smtp-Source: ABdhPJyhcxWDhAWKHcy/YpaO+TBCoUi6KohYCmMP8nE1QLYFH7ApWXiYuD1w9A7NXPhvGnARpDpBVqIBtWDrfl6mnfo=
X-Received: by 2002:ae9:dd83:: with SMTP id r125mr37869654qkf.322.1608042522549;
 Tue, 15 Dec 2020 06:28:42 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?TWF0ZXVzeiDFgcSFY2tp?= <mateusz.lacki@gmail.com>
Date:   Tue, 15 Dec 2020 15:28:31 +0100
Message-ID: <CAG2ZsMBKZLSDTdi007Xv9uR-2+Li-Puz_Hwax9w=dj2AF0WYzA@mail.gmail.com>
Subject: quirks list in uvcvideo - possible update
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear All,
I have seen the faq:
http://www.ideasonboard.org/uvc/faq/
and the compatibility list of the cameras.

I have the camera A4Tech PK-910H with the lsusb characteristics below.
I wish to report that it does not work out of the box but quirk 0x80
solves the issues and perhaps it would be worthwhile to add my camera
to the list.
The issues that the camera has is that it works when connected on Debian 10=
,

but after few seconds the camera shuts down and the following message
is in dmesg:
[2591407.297689] input: A4tech FHD 1080P PC Camera: A4t as
/devices/pci0000:00/0000:00:14.0/usb1/1-13/1-13:1.0/input/input41
[2591407.336309] usb 1-13: 3:1: cannot get freq at ep 0x84
[2591407.703777] usb 1-13: 3:1: cannot get freq at ep 0x84
[2591407.767024] usb 1-13: 3:1: cannot get freq at ep 0x84

Should more info be necessary please let me know I will happily provide it.

Best,
Mateusz =C5=81=C4=85cki


******************************************** lsusb
******************************************
Bus 001 Device 037: ID 09da:2691 A4Tech Co., Ltd.
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x09da A4Tech Co., Ltd.
  idProduct          0x2691
  bcdDevice            1.00
  iManufacturer           2
  iProduct                1
  iSerial                 3
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x02f7
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               5
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0
      iInterface              5
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x006c
        dwClockFrequency       15.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             5
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {28f03370-6311-4a2e-ba2c-6890eb334016}
        bNumControl            24
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            3
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0xff
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                29
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {bd5321b4-d635-ca45-b203-4e0149b301bc}
        bNumControl            32
        bNrPins                 1
        baSourceID( 0)          3
        bControlSize            4
        bmControls( 0)       0x03
        bmControls( 1)       0x80
        bmControls( 2)       0x3f
        bmControls( 3)       0x9f
        iExtension              0
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
        bmControls           0x0002002e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
          Focus (Absolute)
          Focus, Auto
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
        bmVideoStandards     0x40
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
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
        INTERFACE CLASS:  0f 24 01 02 df 01 82 00 05 00 00 00 01 00 00
        INTERFACE CLASS:  0b 24 06 01 07 00 01 00 00 00 00
        INTERFACE CLASS:  1e 24 07 01 00 80 07 38 04 00 80 53 3b 00 80
53 3b 4d 4a 3f 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 07 02 00 00 05 d0 02 00 00 5e 1a 00 00
5e 1a 4d 22 1c 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 07 03 00 00 04 00 03 00 00 80 16 00 00
80 16 4d 02 18 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 07 04 00 20 03 58 02 00 a0 bb 0d 00 a0
bb 0d 4d a8 0e 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 07 05 00 80 02 e0 01 00 00 ca 08 00 00
ca 08 4d 62 09 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 07 06 00 60 01 20 01 00 80 e6 02 00 80
e6 02 4d 1a 03 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 07 07 00 40 01 f0 00 00 80 32 02 00 80
32 02 4d 5a 02 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1b 24 04 02 07 59 55 59 32 00 00 10 00 80 00
00 aa 00 38 9b 71 10 01 00 00 00 00
        INTERFACE CLASS:  1e 24 05 01 00 80 02 e0 01 00 00 ca 08 00 00
ca 08 00 60 09 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 05 02 00 80 07 38 04 00 40 e3 09 00 40
e3 09 00 48 3f 00 80 84 1e 00 01 80 84 1e 00
        INTERFACE CLASS:  1e 24 05 03 00 00 05 d0 02 00 00 ca 08 00 00
ca 08 00 20 1c 00 40 42 0f 00 01 40 42 0f 00
        INTERFACE CLASS:  1e 24 05 04 00 00 04 00 03 00 00 80 07 00 00
80 07 00 00 18 00 40 42 0f 00 01 40 42 0f 00
        INTERFACE CLASS:  1e 24 05 05 00 20 03 58 02 00 a0 bb 0d 00 a0
bb 0d 00 a6 0e 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 05 06 00 60 01 20 01 00 80 e6 02 00 80
e6 02 00 18 03 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  1e 24 05 07 00 40 01 f0 00 00 80 32 02 00 80
32 02 00 58 02 00 15 16 05 00 01 15 16 05 00
        INTERFACE CLASS:  06 24 0d 01 01 04
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       0
      bFunctionProtocol       0
      iFunction               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              4
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x002b
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0000
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            2
        bmaControls(0)     0x0001
          Mute Control
        bmaControls(1)     0x0002
          Volume Control
        bmaControls(2)     0x0002
          Volume Control
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              4
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            3 Discrete
        tSamFreq[ 0]        16000
        tSamFreq[ 1]        44100
        tSamFreq[ 2]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
