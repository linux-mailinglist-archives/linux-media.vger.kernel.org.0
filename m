Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518E23BB6DB
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 07:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhGEFgT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 01:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhGEFgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 01:36:17 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65639C0613DF
        for <linux-media@vger.kernel.org>; Sun,  4 Jul 2021 22:33:40 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id r135so27319349ybc.0
        for <linux-media@vger.kernel.org>; Sun, 04 Jul 2021 22:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=PPIQSLsk/AQvrbAfZ4T13rEdzBV9ErsawOcaxxlEAwE=;
        b=SDSfVRpWqDYnFlUTELd7b5QK6e5Z9qtkU7QLhI+PbjI643Y1C3J1dPqzFHgjSpvNWa
         jscpvI3NlsAMVNKAvf0xADjU6yhOA+32YqJ2kYuyVYOLF2sK7Txw5vR3/OH9BybhaLAr
         aGP/IdKf0Da2Z6va8E5Pop893vdGX6qgPg9blyq6O5JelHc9prJAs7l19YXQE6hDOhLI
         nHQZQ9jn11M5w/rR9qP3Unm3reImaPGOYKxPk0sw0vjPhb/rcfcRyi5N4sR7oNQ49zsW
         gwN60p8hjRjXNcAlukBq45PsJLsbDAPzS04LkgIBJCHa+cTsT6+D/6bfPexXyWFhJrNW
         xphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=PPIQSLsk/AQvrbAfZ4T13rEdzBV9ErsawOcaxxlEAwE=;
        b=DrPljDHgytrW1NNv7adYSeiffEWTNPU/fMXVqfuJDb1lfvmVT72worth4fEzxjfxwX
         ajSstsoiwz0YuDGdxzBeRzmbDuBcsAATPz3WjG925lKSOoj72ZdEdcwRP7DxYIaTSCjZ
         1uszFFLpphyX3mtpV8eZqYCab0ftkCbsICYkafs89AFNUwp6uZk//1952bpdhZazkqjw
         Ba//WzNCkRbbxXvbeyVLYnzG0uzJorMyJkH/Cjts3L4HwcIvww7Uk1HLmEA7/BDBgYZJ
         ETh2kBbEB1FSFcjH+BRwgmA6b68b+F8Xt6hrvalH3nDBhkZfRfYsFHIsKaroHu9689BG
         Ptuw==
X-Gm-Message-State: AOAM5318a7QdwlvUXG/Z0vMXfFqJBiL0BVvb2ykerqVjdXbWNLRVE4jX
        37fzBktbCo5u+uOcPIxfMdAB009Unkl+dbHRqvSILWePCRw=
X-Google-Smtp-Source: ABdhPJyr6BtKR0CHY4ZXP7ntf/1BJ4HypzgAyA+TXzVcaCIOxaeuchi9zfUaeZqPgbcjcb3IeMthwxoADYA2JNNzD6M=
X-Received: by 2002:a25:ba10:: with SMTP id t16mr15179991ybg.87.1625463219317;
 Sun, 04 Jul 2021 22:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAK1+2apifa=G+7JBQgVei8Axgg1o6L2A9hj8o94Aux2wbPETtw@mail.gmail.com>
In-Reply-To: <CAK1+2apifa=G+7JBQgVei8Axgg1o6L2A9hj8o94Aux2wbPETtw@mail.gmail.com>
From:   James Carthew <jcarthew@gmail.com>
Date:   Mon, 5 Jul 2021 15:33:28 +1000
Message-ID: <CAK1+2apFiyaBU1fQM6XeER=rJs5_ATAnZZRcrPCWLdgsYoa6Hw@mail.gmail.com>
Subject: Fwd: Realtek Camera from Razer Latpop
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This device ID is not listed on the supported UVC device page at:
http://www.ideasonboard.org/uvc/

Bus 001 Device 003: ID 0bda:579f Realtek Semiconductor Corp. USB Camera

This device works correctly at 640x480 and 320x240 but fails when
higher resolution modes are selected. There is a bug that was filed
against the Linux Kernel Mailing list but no further action has been
taken. Bug 207045:
https://www.spinics.net/lists/linux-usb/msg193254.html

lsusb -s001:003 -vvv

Bus 001 Device 003: ID 0bda:579f Realtek Semiconductor Corp. USB Camera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x0bda Realtek Semiconductor Corp.
  idProduct          0x579f
  bcdDevice            0.02
  iManufacturer           3 11121119-000JD71B2
  iProduct                1 USB Camera
  iSerial                 2 200901010001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0311
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
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               5 USB Camera
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
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
        bmControls           0x00000004
          Auto-Exposure Priority
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
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
        INTERFACE CLASS:  0f 24 01 02 8d 02 81 00 03 02 01 00 01 00 00
        INTERFACE CLASS:  1b 24 04 01 08 59 55 59 32 00 00 10 00 80 00
00 aa 00 38 9b 71 10 01 00 00 00 00
        INTERFACE CLASS:  22 24 05 01 00 80 02 e0 01 00 00 65 04 00 00
ca 08 00 60 09 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 05 02 00 a0 00 78 00 00 50 46 00 00 a0
8c 00 00 96 00 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 05 03 00 b0 00 90 00 00 d0 5c 00 00 a0
b9 00 00 c6 00 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 05 04 00 40 01 f0 00 00 40 19 01 00 80
32 02 00 58 02 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 05 05 00 00 05 d0 02 00 00 65 04 00 00
ca 08 00 20 1c 00 40 42 0f 00 02 40 42 0f 00 80 84 1e 00
        INTERFACE CLASS:  22 24 05 06 00 00 05 20 03 00 00 e2 04 00 00
c4 09 00 40 1f 00 40 42 0f 00 02 40 42 0f 00 80 84 1e 00
        INTERFACE CLASS:  1e 24 05 07 00 00 05 00 04 00 00 40 06 00 00
40 06 00 00 28 00 80 84 1e 00 01 80 84 1e 00
        INTERFACE CLASS:  1e 24 05 08 00 80 07 38 04 00 40 e3 09 00 40
e3 09 00 48 3f 00 80 84 1e 00 01 80 84 1e 00
        INTERFACE CLASS:  1a 24 03 00 05 80 02 e0 01 00 05 d0 02 00 05
20 03 00 04 00 03 80 07 38 04 00
        INTERFACE CLASS:  06 24 0d 01 01 04
        INTERFACE CLASS:  0b 24 06 02 08 01 01 00 00 00 00
        INTERFACE CLASS:  22 24 07 01 00 80 02 e0 01 00 00 65 04 00 00
ca 08 00 60 09 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 07 02 00 a0 00 78 00 00 50 46 00 00 a0
8c 00 00 96 00 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 07 03 00 b0 00 90 00 00 d0 5c 00 00 a0
b9 00 00 c6 00 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 07 04 00 40 01 f0 00 00 40 19 01 00 80
32 02 00 58 02 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 07 05 00 00 05 d0 02 00 00 2f 0d 00 00
5e 1a 00 20 1c 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 07 06 00 00 05 20 03 00 00 a6 0e 00 00
4c 1d 00 40 1f 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 07 07 00 00 05 00 04 00 00 c0 12 00 00
80 25 00 00 28 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  22 24 07 08 00 80 07 38 04 00 c0 a9 1d 00 80
53 3b 00 48 3f 00 15 16 05 00 02 15 16 05 00 2a 2c 0a 00
        INTERFACE CLASS:  1a 24 03 00 05 80 02 e0 01 00 05 d0 02 00 05
20 03 00 04 00 03 80 07 38 04 00
        INTERFACE CLASS:  06 24 0d 01 01 04
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x000c
  bNumDeviceCaps          1
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
  (Bus Powered)
