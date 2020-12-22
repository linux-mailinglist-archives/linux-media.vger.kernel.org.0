Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B852E0640
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 07:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgLVGz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 01:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLVGzZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 01:55:25 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E61C0613D3
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 22:54:45 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id 6so16811133ejz.5
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 22:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vghYok1sGjSqj37pu5TYTWY/t/tXGDQM7yatWZO0SkQ=;
        b=CQEzbsbHqQuhMBFemmVKFXTaeUyIy6hR1ybYNy30kQFaWocaVIsJe7Y68gDZ/waplQ
         /WKaovjTRrMEvkvOBKIrLbxkB1jjMsZILq/y+F5QB2fB1dhURZQwsKXNKP5PnVrMQ5gN
         huDgFgIBjYnG1SmuOlFD8wOMPKwnORXDLToVzVejSQKIjMymee+VizWFA5hnrLF0pBcr
         0mvusHraLDbUlRFwdoBP9UDcuw9nGDISpC/JNky6TByikYKngwZ4UUwGKIp+19uJ4XRY
         8CYM/M3GqRQlPMOC9axHBq1+Jt84lQKtOaDLEAagdB3UBotY2+HIQ+catq6f/A+SXdnn
         EX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vghYok1sGjSqj37pu5TYTWY/t/tXGDQM7yatWZO0SkQ=;
        b=nEQVOWkzggxpVoLdojflCLO3yTrXUbc/djVnNIuUAFkO7Y/lT30lOeglB4mZkga28E
         WtgOI1kWQEjamdVd1gx1FU2ednWUAm/s7p0hZ0ugCc51z0lXu95nAuDywUZe+tScBgBS
         IqcTwj9Z7hlh2LxZnZVlhp8EkOhdb7x1MQNkUaG9J/F72h3zZLkjohQLpUA2plpx9AIo
         kOBxJIM+ibQZuBR47+oUza23JIkhClw3DccSUwZgPCeqx0aUMC1g3wwINfL0wX0aWvNR
         Q49Hf1C5+jPBXQ/z2wqsOJ3NW0uWdpsSQHumbyFU/bl2fMJAMHN69kDZYNitGuohIoNn
         O+Bg==
X-Gm-Message-State: AOAM533abJIEbCGHnsHGHynmDQF2XAjLMirtUJf3PIx/v19koGG9hUEp
        iIuLMeCR5bd1wTs85ZhJyuGAu9Hog9oSsG+VVzsTrX9aKYo=
X-Google-Smtp-Source: ABdhPJxseUmo20t/aBlOFqe2NTup9TyTaf4mDLP9qQyItOtcW5J+2JCyilVHLnzMP+NVbNVqEd69EN2KyR9ETqUyvoY=
X-Received: by 2002:a17:906:3c04:: with SMTP id h4mr18199231ejg.220.1608620083629;
 Mon, 21 Dec 2020 22:54:43 -0800 (PST)
MIME-Version: 1.0
From:   Shem Choi <revegins@gmail.com>
Date:   Tue, 22 Dec 2020 15:54:31 +0900
Message-ID: <CAFHmfx6qh1oWhRmqS99CGc8ccKzF2kB4tBar6kQ_8xXg=2Bs0A@mail.gmail.com>
Subject: Couldn't Initialize USB HDMI capture dongle well.
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Linux UVC developers:

Thanks for every support.
I tested one USB HDMI capture dongle on raspberry Pi.
And UVC couldn=E2=80=99t detect and initialize well.


Here=E2=80=99s the logs.



---- Kernel Log ----

[  131.830253] uvcvideo: Suspending interface 1

[  131.830266] uvcvideo: Suspending interface 0

[  132.699032] usb 1-1.1.3: USB disconnect, device number 31

[  133.395894] usb 1-1.1.3: new high-speed USB device number 32 using dwc_o=
tg

[  133.493419] usb 1-1.1.3: New USB device found, idVendor=3D1e4e, idProduc=
t=3D7016

[  133.493507] usb 1-1.1.3: New USB device strings: Mfr=3D0, Product=3D0,
SerialNumber=3D3

[  133.493521] usb 1-1.1.3: SerialNumber: 20000130041415

[  133.506389] uvcvideo: Probing generic UVC device 1.1.3

[  133.506744] uvcvideo: Found format MJPEG.

[  133.506758] uvcvideo: - 1920x1080 (60.0 fps)

[  133.506789] uvcvideo: Found UVC 1.00 device <unnamed> (1e4e:7016)

[  133.509005] uvcvideo: Scanning UVC chain: OT 2 <- XU 4 <- PU 3 <- IT 1

[  133.509500] uvcvideo: Found a valid video chain (1 -> 2).

[  133.514889] uvcvideo: UVC non compliance - GET_DEF(PROBE) not
supported. Enabling workaround.

[  133.517651] uvcvideo 1-1.1.3:1.0: Entity type for entity Extension
4 was not initialized!

[  133.517741] uvcvideo 1-1.1.3:1.0: Entity type for entity Processing
3 was not initialized!

[  133.517763] uvcvideo 1-1.1.3:1.0: Entity type for entity Camera 1
was not initialized!

[  133.519279] uvcvideo: UVC device initialized.

[  137.819033] usb 1-1.1.3: USB disconnect, device number 32

[  138.259275] usb 1-1.1.3: new high-speed USB device number 33 using dwc_o=
tg

[  138.358400] usb 1-1.1.3: New USB device found, idVendor=3D1e4e, idProduc=
t=3D7016

[  138.358419] usb 1-1.1.3: New USB device strings: Mfr=3D0, Product=3D0,
SerialNumber=3D3

[  138.358498] usb 1-1.1.3: SerialNumber: 20000130041415

[  138.365497] uvcvideo: Found UVC 1.00 device <unnamed> (1e4e:7016)

[  138.381746] uvcvideo: UVC non compliance - GET_DEF(PROBE) not
supported. Enabling workaround.

[  138.384747] uvcvideo 1-1.1.3:1.0: Entity type for entity Extension
4 was not initialized!

[  138.384773] uvcvideo 1-1.1.3:1.0: Entity type for entity Processing
3 was not initialized!

[  138.384794] uvcvideo 1-1.1.3:1.0: Entity type for entity Camera 1
was not initialized!





---- lsusb log ----

Bus 001 Device 078: ID 1e4e:7016

Device Descriptor:

  bLength                18

  bDescriptorType         1

  bcdUSB               2.10

  bDeviceClass          239

  bDeviceSubClass         2

  bDeviceProtocol         1

  bMaxPacketSize0        64

  idVendor           0x1e4e

  idProduct          0x7016

  bcdDevice            1.00

  iManufacturer           0

  iProduct                0

  iSerial                 3 20000130041415

  bNumConfigurations      1

  Configuration Descriptor:

    bLength                 9

    bDescriptorType         2

    wTotalLength          296

    bNumInterfaces          4

    bConfigurationValue     1

    iConfiguration          0

    bmAttributes         0xa0

      (Bus Powered)

      Remote Wakeup

    MaxPower              150mA

    Interface Association:

      bLength                 8

      bDescriptorType        11

      bFirstInterface         0

      bInterfaceCount         2

      bFunctionClass         14

      bFunctionSubClass       3

      bFunctionProtocol       0

      iFunction               0

    Interface Descriptor:

      bLength                 9

      bDescriptorType         4

      bInterfaceNumber        0

      bAlternateSetting       0

      bNumEndpoints           0

      bInterfaceClass        14

      bInterfaceSubClass      1

      bInterfaceProtocol      0

      iInterface              0

      VideoControl Interface Descriptor:

        bLength                13

        bDescriptorType        36

        bDescriptorSubtype      1 (HEADER)

        bcdUVC               1.00

        wTotalLength           77

        dwClockFrequency      120.000000MHz

        bInCollection           1

        baInterfaceNr( 0)       1

      VideoControl Interface Descriptor:

        bLength                18

        bDescriptorType        36

        bDescriptorSubtype      2 (INPUT_TERMINAL)

        bTerminalID             1

        wTerminalType      0x0201

        bAssocTerminal          0

        iTerminal               0

        wObjectiveFocalLengthMin      0

        wObjectiveFocalLengthMax      0

        wOcularFocalLength            0

        bControlSize                  3

        bmControls           0x00000000

      VideoControl Interface Descriptor:

        bLength                11

        bDescriptorType        36

        bDescriptorSubtype      5 (PROCESSING_UNIT)

      Warning: Descriptor too short

        bUnitID                 3

        bSourceID               1

        wMaxMultiplier          0

        bControlSize            2

        bmControls     0x00000000

        iProcessing             0

        bmVideoStandards     0x 9

          None

          SECAM - 625/50

      VideoControl Interface Descriptor:

        bLength                 9

        bDescriptorType        36

        bDescriptorSubtype      3 (OUTPUT_TERMINAL)

        bTerminalID             2

        wTerminalType      0x0101

        bAssocTerminal          0

        bSourceID               4

        iTerminal               0

      VideoControl Interface Descriptor:

        bLength                26

        bDescriptorType        36

        bDescriptorSubtype      6 (EXTENSION_UNIT)

        bUnitID                 4

        guidExtensionCode         {5b126dc6-8004-4408-8c26-b8363a84de63}

        bNumControl             3

        bNrPins                 1

        baSourceID( 0)          3

        bControlSize            1

        bmControls( 0)       0x07

        iExtension              0

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

        bLength                            14

        bDescriptorType                    36

        bDescriptorSubtype                  1 (INPUT_HEADER)

        bNumFormats                         1

        wTotalLength                       61

        bEndPointAddress                  137

        bmInfo                              0

        bTerminalLink                       2

        bStillCaptureMethod                 0

        bTriggerSupport                     0

        bTriggerUsage                       0

        bControlSize                        1

        bmaControls( 0)                    11

      VideoStreaming Interface Descriptor:

        bLength                            11

        bDescriptorType                    36

        bDescriptorSubtype                  6 (FORMAT_MJPEG)

        bFormatIndex                        1

        bNumFrameDescriptors                1

        bFlags                              0

          Fixed-size samples: No

        bDefaultFrameIndex                  1

        bAspectRatioX                       0

        bAspectRatioY                       0

        bmInterlaceFlags                 0x00

          Interlaced stream or variable: No

          Fields per frame: 1 fields

          Field 1 first: No

          Field pattern: Field 1 only

          bCopyProtect                      0

      VideoStreaming Interface Descriptor:

        bLength                            30

        bDescriptorType                    36

        bDescriptorSubtype                  7 (FRAME_MJPEG)

        bFrameIndex                         1

        bmCapabilities                   0x00

          Still image unsupported

        wWidth                           1920

        wHeight                          1080

        dwMinBitRate                497664000

        dwMaxBitRate                497664000

        dwMaxVideoFrameBufferSize     1036800

        dwDefaultFrameInterval         166666

        bFrameIntervalType                  1

        dwFrameInterval( 0)            166666

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

        bEndpointAddress     0x89  EP 9 IN

        bmAttributes            5

          Transfer Type            Isochronous

          Synch Type               Asynchronous

          Usage Type               Data

        wMaxPacketSize     0x1400  3x 1024 bytes

        bInterval               1

    Interface Association:

      bLength                 8

      bDescriptorType        11

      bFirstInterface         2

      bInterfaceCount         2

      bFunctionClass          1

      bFunctionSubClass       2

      bFunctionProtocol       0

      iFunction               0

    Interface Descriptor:

      bLength                 9

      bDescriptorType         4

      bInterfaceNumber        2

      bAlternateSetting       0

      bNumEndpoints           0

      bInterfaceClass         1

      bInterfaceSubClass      1

      bInterfaceProtocol      0

      iInterface              0

      AudioControl Interface Descriptor:

        bLength                 9

        bDescriptorType        36

        bDescriptorSubtype      1 (HEADER)

        bcdADC               1.00

        wTotalLength           38

        bInCollection           1

        baInterfaceNr( 0)       3

      AudioControl Interface Descriptor:

        bLength                12

        bDescriptorType        36

        bDescriptorSubtype      2 (INPUT_TERMINAL)

        bTerminalID             1

        wTerminalType      0x0201

        bAssocTerminal          0

        bNrChannels             1

        wChannelConfig     0x0000

        iChannelNames           0

        iTerminal               0

      AudioControl Interface Descriptor:

        bLength                 9

        bDescriptorType        36

        bDescriptorSubtype      3 (OUTPUT_TERMINAL)

        bTerminalID             2

        wTerminalType      0x0101

        bAssocTerminal          0

        bSourceID               3

        iTerminal               0

      AudioControl Interface Descriptor:

        bLength                 8

        bDescriptorType        36

        bDescriptorSubtype      6 (FEATURE_UNIT)

        bUnitID                 3

        bSourceID               1

        bControlSize            1

        bmaControls( 0)      0x03

          Mute Control

          Volume Control

        iFeature                0

    Interface Descriptor:

      bLength                 9

      bDescriptorType         4

      bInterfaceNumber        3

      bAlternateSetting       0

      bNumEndpoints           0

      bInterfaceClass         1

      bInterfaceSubClass      2

      bInterfaceProtocol      0

      iInterface              0

    Interface Descriptor:

      bLength                 9

      bDescriptorType         4

      bInterfaceNumber        3

      bAlternateSetting       1

      bNumEndpoints           1

      bInterfaceClass         1

      bInterfaceSubClass      2

      bInterfaceProtocol      0

      iInterface              0

      AudioStreaming Interface Descriptor:

        bLength                 7

        bDescriptorType        36

        bDescriptorSubtype      1 (AS_GENERAL)

        bTerminalLink           2

        bDelay                  1 frames

        wFormatTag              1 PCM

      AudioStreaming Interface Descriptor:

        bLength                11

        bDescriptorType        36

        bDescriptorSubtype      2 (FORMAT_TYPE)

        bFormatType             1 (FORMAT_TYPE_I)

        bNrChannels             2

        bSubframeSize           2

        bBitResolution         16

        bSamFreqType            1 Discrete

        tSamFreq[ 0]        48000

      Endpoint Descriptor:

        bLength                 9

        bDescriptorType         5

        bEndpointAddress     0x8a  EP 10 IN

        bmAttributes            5

          Transfer Type            Isochronous

          Synch Type               Asynchronous

          Usage Type               Data

        wMaxPacketSize     0x00c0  1x 192 bytes

        bInterval               4

        bRefresh                0

        bSynchAddress           0

        AudioControl Endpoint Descriptor:

          bLength                 7

          bDescriptorType        37

          bDescriptorSubtype      1 (EP_GENERAL)

          bmAttributes         0x01

            Sampling Frequency

          bLockDelayUnits         0 Undefined

          wLockDelay              0 Undefined

Binary Object Store Descriptor:

  bLength                 5

  bDescriptorType        15

  wTotalLength           22

  bNumDeviceCaps          2

  USB 2.0 Extension Device Capability:

    bLength                 7

    bDescriptorType        16

    bDevCapabilityType      2

    bmAttributes   0x00000006

      Link Power Management (LPM) Supported

  SuperSpeed USB Device Capability:

    bLength                10

    bDescriptorType        16

    bDevCapabilityType      3

    bmAttributes         0x00

    wSpeedsSupported   0x000e

      Device can operate at Full Speed (12Mbps)

      Device can operate at High Speed (480Mbps)

      Device can operate at SuperSpeed (5Gbps)

    bFunctionalitySupport   1

      Lowest fully-functional device speed is Full Speed (12Mbps)

    bU1DevExitLat           4 micro seconds

    bU2DevExitLat           4 micro seconds

Device Status:     0x0000

  (Bus Powered)
