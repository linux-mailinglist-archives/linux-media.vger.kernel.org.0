Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608D565D0A1
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 11:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234815AbjADK1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 05:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbjADK1N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 05:27:13 -0500
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D152AF4
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 02:27:12 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id tz12so81489700ejc.9
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 02:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uHIXkjAyrksa1eCt526VShUzYZy7Xc1KReR6M4bjrYU=;
        b=KegPVkFkuGPXFLXK8xhvQ6B6zO3ngbT8cLguYY0WdvXbaXnfvz+qchk9uJ1fKDU4me
         FFstyEuHXwoeiKsGG+AXN8gPuogS2cgKGouB0xH77G2KpOd/G/hadXyI4kWVNmsiXvNo
         Gerzisjv5ARk5fLgsSqrdOZZOhAqgd6+IopVvvl0tOlwAqUBEfb0UGaCTGMYDDNUlgTy
         ocxsqFrK6ZcYkkHlHTQBVbqJNR/gXJfAsFAxLAPn8yOSUfeXZ8pCFJ+9991YzLaJbqi6
         mevU8Bsf0tjbUwaNZC+vpohujmZpOw7wZcETDXIigrMgLrGw0ZsMwAYtdcGF6xspvqmf
         cE5A==
X-Gm-Message-State: AFqh2koJZq1cAKDE9Ol54ELFDPBrU/boFGw7mofUKeEZ7OuyfQ8E7+UB
        yD9m9SCNGexccrjGUgUUh7zB9wYMwnw=
X-Google-Smtp-Source: AMrXdXtqVyeMfKlT4pMI4CQgqW5H7nL59viEf7rPsHl1wy0DwBZK447mc+P7JEYalVN0JDlYxlhpBg==
X-Received: by 2002:a17:906:d963:b0:83d:97fd:d421 with SMTP id rp3-20020a170906d96300b0083d97fdd421mr37815187ejb.38.1672828030751;
        Wed, 04 Jan 2023 02:27:10 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b008448d273670sm8349155eja.49.2023.01.04.02.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 02:27:10 -0800 (PST)
Message-ID: <afdc583c-22c1-b57b-7773-307c84550218@kernel.org>
Date:   Wed, 4 Jan 2023 11:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>
From:   Jiri Slaby <jirislaby@kernel.org>
Subject: EasyCAP (534d:0021) not offering native 720x576
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_FILL_THIS_FORM_SHORT autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

I bought a (cheap) video grabber to convert few remaining VHSs. It's 
this (full lsusb -v output at the end):
Bus 003 Device 014: ID 534d:0021 MacroSilicon MS210x Video Grabber 
[EasierCAP]
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x534d MacroSilicon
   idProduct          0x0021 MS210x Video Grabber [EasierCAP]
   bcdDevice            1.21
   iManufacturer           1 MACROSILICON
   iProduct                2 AV TO USB2.0
   iSerial                 3 20150130
   bNumConfigurations      1


But it offers resolutions only up to 720x480. In Windows, I can grab the 
standard PAL's 720x576. Is there any way to force the native res in UVC? 
Or can you point me the way how to debug/fix this?

Thanks.

Dumps and logs follow.


===============================


Three /dev/video devices are created. Two UVCs (3+5) and one real video (4):
$ for aa in 3 4 5; do echo "== $aa =="; v4l2-ctl -d /dev/video$aa --all; 
done
== 3 ==
Driver Info:
         Driver name      : uvcvideo
         Card type        : Integrated_Webcam_HD: Integrate
         Bus info         : usb-0000:00:14.0-5
         Driver version   : 6.1.2
         Capabilities     : 0x84a00001
                 Video Capture
                 Metadata Capture
                 Streaming
                 Extended Pix Format
                 Device Capabilities
         Device Caps      : 0x04a00000
                 Metadata Capture
                 Streaming
                 Extended Pix Format
Media Driver Info:
         Driver name      : uvcvideo
         Model            : Integrated_Webcam_HD: Integrate
         Serial           : 0001
         Bus info         : usb-0000:00:14.0-5
         Media version    : 6.1.2
         Hardware revision: 0x00006012 (24594)
         Driver version   : 6.1.2
Interface Info:
         ID               : 0x03000005
         Type             : V4L Video
Entity Info:
         ID               : 0x00000004 (4)
         Name             : Integrated_Webcam_HD: Integrate
         Function         : V4L2 I/O
Priority: 2
Format Metadata Capture:
         Sample Format   : 'UVCH' (UVC Payload Header Metadata)
         Buffer Size     : 10240
== 4 ==
Driver Info:
         Driver name      : uvcvideo
         Card type        : AV TO USB2.0
         Bus info         : usb-0000:3c:00.0-1.1
         Driver version   : 6.1.2
         Capabilities     : 0x84a00001
                 Video Capture
                 Metadata Capture
                 Streaming
                 Extended Pix Format
                 Device Capabilities
         Device Caps      : 0x04200001
                 Video Capture
                 Streaming
                 Extended Pix Format
Media Driver Info:
         Driver name      : uvcvideo
         Model            : AV TO USB2.0
         Serial           : 20150130
         Bus info         : usb-0000:3c:00.0-1.1
         Media version    : 6.1.2
         Hardware revision: 0x00000121 (289)
         Driver version   : 6.1.2
Interface Info:
         ID               : 0x03000002
         Type             : V4L Video
Entity Info:
         ID               : 0x00000001 (1)
         Name             : AV TO USB2.0
         Function         : V4L2 I/O
         Flags            : default
         Pad 0x01000007   : 0: Sink
           Link 0x0200000d: from remote pad 0x100000a of entity 
'Processing 2' (Video Pixel Formatter): Data, Enabled, Immutable
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
         Width/Height      : 720/480
         Pixel Format      : 'MJPG' (Motion-JPEG)
         Field             : None
         Bytes per Line    : 0
         Size Image        : 614400
         Colorspace        : sRGB
         Transfer Function : Rec. 709
         YCbCr/HSV Encoding: ITU-R 601
         Quantization      : Default (maps to Full Range)
         Flags             :
Crop Capability Video Capture:
         Bounds      : Left 0, Top 0, Width 720, Height 480
         Default     : Left 0, Top 0, Width 720, Height 480
         Pixel Aspect: 1/1
Selection Video Capture: crop_default, Left 0, Top 0, Width 720, Height 
480, Flags:
Selection Video Capture: crop_bounds, Left 0, Top 0, Width 720, Height 
480, Flags:
Streaming Parameters Video Capture:
         Capabilities     : timeperframe
         Frames per second: 25.000 (25/1)
         Read buffers     : 0
== 5 ==
Driver Info:
         Driver name      : uvcvideo
         Card type        : AV TO USB2.0
         Bus info         : usb-0000:3c:00.0-1.1
         Driver version   : 6.1.2
         Capabilities     : 0x84a00001
                 Video Capture
                 Metadata Capture
                 Streaming
                 Extended Pix Format
                 Device Capabilities
         Device Caps      : 0x04a00000
                 Metadata Capture
                 Streaming
                 Extended Pix Format
Media Driver Info:
         Driver name      : uvcvideo
         Model            : AV TO USB2.0
         Serial           : 20150130
         Bus info         : usb-0000:3c:00.0-1.1
         Media version    : 6.1.2
         Hardware revision: 0x00000121 (289)
         Driver version   : 6.1.2
Interface Info:
         ID               : 0x03000005
         Type             : V4L Video
Entity Info:
         ID               : 0x00000004 (4)
         Name             : AV TO USB2.0
         Function         : V4L2 I/O
Priority: 2
Format Metadata Capture:
         Sample Format   : 'UVCH' (UVC Payload Header Metadata)
         Buffer Size     : 10240




===============================




$ v4l2-ctl -d /dev/video4 --list-formats-ext
ioctl: VIDIOC_ENUM_FMT
         Type: Video Capture

         [0]: 'MJPG' (Motion-JPEG, compressed)
                 Size: Discrete 480x320
                         Interval: Discrete 0.040s (25.000 fps)
                 Size: Discrete 640x480
                         Interval: Discrete 0.040s (25.000 fps)
                         Interval: Discrete 0.050s (20.000 fps)
                         Interval: Discrete 0.067s (15.000 fps)
                         Interval: Discrete 0.100s (10.000 fps)
                 Size: Discrete 720x480
                         Interval: Discrete 0.040s (25.000 fps)
                         Interval: Discrete 0.050s (20.000 fps)
                         Interval: Discrete 0.067s (15.000 fps)
                         Interval: Discrete 0.100s (10.000 fps)
         [1]: 'YUYV' (YUYV 4:2:2)
                 Size: Discrete 480x320
                         Interval: Discrete 0.040s (25.000 fps)




===============================





dmesg (w/ debug enabled) says:
usb 3-1.1: New USB device found, idVendor=534d, idProduct=0021, 
bcdDevice= 1.21
usb 3-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 3-1.1: Product: AV TO USB2.0
usb 3-1.1: Manufacturer: MACROSILICON
usb 3-1.1: SerialNumber: 20150130
usb 3-1.1: Probing generic UVC device 1.1
usb 3-1.1: Found format MJPEG
usb 3-1.1: - 480x320 (25.0 fps)
usb 3-1.1: - 640x480 (25.0 fps)
usb 3-1.1: - 720x480 (25.0 fps)
usb 3-1.1: Found format YUV 4:2:2 (YUYV)
usb 3-1.1: - 480x320 (25.0 fps)
usb 3-1.1: Found UVC 1.00 device AV TO USB2.0 (534d:0021)
usb 3-1.1: Scanning UVC chain:
  OT 3 <- PU 2 <- IT 1
usb 3-1.1: Found a valid video chain (1 -> 3)
usb 3-1.1: UVC non compliance - GET_DEF(PROBE) not supported. Enabling 
workaround.
usb 3-1.1: UVC device initialized
hid-generic 0003:534D:0021.000F: hiddev98,hidraw7: USB HID v1.10 Device 
[MACROSILICON AV TO USB2.0] on usb-0000:3c:00.0-1.1/input4
usb 3-1.1: uvc_v4l2_open
usb 3-1.1: uvc_v4l2_release
usb 3-1.1: uvc_v4l2_open
usb 3-1.1: uvc_v4l2_release
usb 3-1.1: uvc_v4l2_open
usb 3-1.1: uvc_v4l2_release
usb 3-1.1: uvc_v4l2_open
usb 3-1.1: uvc_v4l2_release
usb 3-1.1: uvc_v4l2_open
usb 3-1.1: Control 0x00980900 not found
usb 3-1.1: uvc_v4l2_release
usb 3-1.1: uvc_v4l2_open
usb 3-1.1: uvc_v4l2_release
usb 3-1.1: uvc_v4l2_open
usb 3-1.1: Control 0x00980900 not found
usb 3-1.1: uvc_v4l2_release
usb 3-1.1: uvc_v4l2_open
usb 3-1.1: uvc_v4l2_release




===============================




Full lsusb:
Bus 003 Device 014: ID 534d:0021 MacroSilicon MS210x Video Grabber 
[EasierCAP]
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x534d MacroSilicon
   idProduct          0x0021 MS210x Video Grabber [EasierCAP]
   bcdDevice            1.21
   iManufacturer           1 MACROSILICON
   iProduct                2 AV TO USB2.0
   iSerial                 3 20150130
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x01bb
     bNumInterfaces          5
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
       iFunction               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      1 Video Control
       bInterfaceProtocol      0
       iInterface              0
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdUVC               1.00
         wTotalLength       0x0033
         dwClockFrequency       24.000000MHz
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
         bLength                11
         bDescriptorType        36
         bDescriptorSubtype      5 (PROCESSING_UNIT)
       Warning: Descriptor too short
         bUnitID                 2
         bSourceID               1
         wMaxMultiplier          0
         bControlSize            2
         bmControls     0x00000000
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
         bSourceID               2
         iTerminal               0
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
         bLength                            15
         bDescriptorType                    36
         bDescriptorSubtype                  1 (INPUT_HEADER)
         bNumFormats                         2
         wTotalLength                   0x00d1
         bEndpointAddress                 0x83  EP 3 IN
         bmInfo                              0
         bTerminalLink                       3
         bStillCaptureMethod                 0
         bTriggerSupport                     0
         bTriggerUsage                       0
         bControlSize                        1
         bmaControls( 0)                     0
         bmaControls( 1)                     0
       VideoStreaming Interface Descriptor:
         bLength                            11
         bDescriptorType                    36
         bDescriptorSubtype                  6 (FORMAT_MJPEG)
         bFormatIndex                        1
         bNumFrameDescriptors                3
         bFlags                              1
           Fixed-size samples: Yes
         bDefaultFrameIndex                  2
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 1 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         1
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            480
         wHeight                           320
         dwMinBitRate                   768000
         dwMaxBitRate                196608000
         dwMaxVideoFrameBufferSize      307200
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  1
         dwFrameInterval( 0)            400000
       VideoStreaming Interface Descriptor:
         bLength                            42
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                   768000
         dwMaxBitRate                196608000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  4
         dwFrameInterval( 0)            400000
         dwFrameInterval( 1)            500000
         dwFrameInterval( 2)            666666
         dwFrameInterval( 3)           1000000
       VideoStreaming Interface Descriptor:
         bLength                            42
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         3
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            720
         wHeight                           480
         dwMinBitRate                   768000
         dwMaxBitRate                196608000
         dwMaxVideoFrameBufferSize      691200
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  4
         dwFrameInterval( 0)            400000
         dwFrameInterval( 1)            500000
         dwFrameInterval( 2)            666666
         dwFrameInterval( 3)           1000000
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
         bNumFrameDescriptors                1
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
         wWidth                            480
         wHeight                           320
         dwMinBitRate                 36864000
         dwMaxBitRate                 36864000
         dwMaxVideoFrameBufferSize      307200
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  1
         dwFrameInterval( 0)            400000
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
         bEndpointAddress     0x83  EP 3 IN
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
       bFunctionClass          1 Audio
       bFunctionSubClass       1 Control Device
       bFunctionProtocol       0
       iFunction               4 USB2.0 MIC
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      1 Control Device
       bInterfaceProtocol      0
       iInterface              4 USB2.0 MIC
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               1.00
         wTotalLength       0x0026
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
         wChannelConfig     0x0003
           Left Front (L)
           Right Front (R)
         iChannelNames           0
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                 2
         bSourceID               1
         bControlSize            1
         bmaControls(0)       0x03
           Mute Control
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
       iInterface              4 USB2.0 MIC
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              4 USB2.0 MIC
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           3
         bDelay                  0 frames
         wFormatTag         0x0001 PCM
       AudioStreaming Interface Descriptor:
         bLength                11
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bNrChannels             1
         bSubframeSize           2
         bBitResolution         16
         bSamFreqType            1 Discrete
         tSamFreq[ 0]        96000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            1
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0100  1x 256 bytes
         bInterval               4
         bRefresh                0
         bSynchAddress           0
         AudioStreaming Endpoint Descriptor:
           bLength                 7
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bLockDelayUnits         0 Undefined
           wLockDelay         0x0000
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        4
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              0
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID               1.10
           bCountryCode           33 US
           bNumDescriptors         1
           bDescriptorType        34 Report
           wDescriptorLength      23
          Report Descriptors:
            ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              16
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   bNumConfigurations      0
Device Status:     0x0000
   (Bus Powered)

-- 
js
suse labs
