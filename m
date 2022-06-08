Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D35E543008
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 14:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238723AbiFHMMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 08:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238724AbiFHMMh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 08:12:37 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810373B01E
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 05:12:35 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id q184so10853541oia.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+aea/OIliFM1OapmEkJHw9MUp4dCxCNvOVGCnVsG6qE=;
        b=kjNzZ1VFz9xEryyAjWB6SMJzELGLeJ106R4yacVGJv4iHFP4ILEtJ5vYYjEuDpsEM/
         xQ64hoWkxbDHApFUnMNN1Z8o2kXuaihG2ru0/yr4R44nH3oIBT/ypbWXc/IotEPHQA63
         Kpq/vAJlwuez+tBkf69qnEKMsfiBGMxsTQSLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+aea/OIliFM1OapmEkJHw9MUp4dCxCNvOVGCnVsG6qE=;
        b=SNHu5g8HslKq40vvNWETWNzceCVU0H1FIxOCRxo0jsFfHNQO2advZNtcNvlqFgRpTR
         l1xgiikpzo6P4C/vo0+oMNUHoOwI/OJpwSDPf/wmgLTKT47LABskX7nw5Hti83VA5l/R
         r2lcBcfhH1COKvH6X2mBHG4sOG/Wi3i9w2Vh4IHOhAQXQr/rO3itfWmpZ0k8qoaEm5Xm
         XfnZ0Qx3OM4ZD0NeRQriCIa61bTLj6XZrvA0nOuAMumgAv05lRpY8+GUUHcKIZpbtTyZ
         tFsIbcfzJoyt8L974nf3kyZDpUjpzKB/0fgqyu4C7DFeDEk2FTrVB4arHm3irgHXAikG
         ddYA==
X-Gm-Message-State: AOAM531UcEQvR8d8vr9ouuoQctRrlY64oPBf2ZlbY+AAi8Ra7VtQtzhj
        XvtJ8Ndaf8Z1Odu9HMDz0gOs7rM6xCIkoKyL
X-Google-Smtp-Source: ABdhPJxslibhyUO2Sj3qtw+LNaDNpn5lHFt7qRPBG1B4gLHV8uVgPdvmIoMiy2j8ZmrKv61PM5taEQ==
X-Received: by 2002:a54:4f8c:0:b0:32e:a764:7536 with SMTP id g12-20020a544f8c000000b0032ea7647536mr2175590oiy.156.1654690354571;
        Wed, 08 Jun 2022 05:12:34 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id a7-20020a056870618700b000f1b1ff7b8bsm9632356oah.51.2022.06.08.05.12.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 05:12:33 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-f16a3e0529so26962621fac.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 05:12:33 -0700 (PDT)
X-Received: by 2002:a05:6870:4799:b0:f1:46f8:6ea4 with SMTP id
 c25-20020a056870479900b000f146f86ea4mr2119961oaq.223.1654690353301; Wed, 08
 Jun 2022 05:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220608065005.23014-1-laurent.pinchart@ideasonboard.com> <20220608065005.23014-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220608065005.23014-4-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 8 Jun 2022 14:12:22 +0200
X-Gmail-Original-Message-ID: <CANiDSCs5NKmR=-Efd=2kMXdwPvCeFk6AmVRZfAhJKdqpg78o=g@mail.gmail.com>
Message-ID: <CANiDSCs5NKmR=-Efd=2kMXdwPvCeFk6AmVRZfAhJKdqpg78o=g@mail.gmail.com>
Subject: Re: [RFC PATCH v4 3/7] media: uvcvideo: Limit power line control for
 Quanta UVC Webcam
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, 8 Jun 2022 at 08:50, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Ricardo Ribalda <ribalda@chromium.org>
>
> The device does not implement the power line control correctly. Add a
> corresponding control mapping override.
>
> Bus 001 Device 003: ID 0408:3090 Quanta Computer, Inc. USB2.0 HD UVC WebCam
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x0408 Quanta Computer, Inc.
>   idProduct          0x3090
>   bcdDevice            0.04
>   iManufacturer           3 Quanta
>   iProduct                1 USB2.0 HD UVC WebCam
>   iSerial                 2 0x0001
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x02ef
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          4 USB Camera
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0
>       iFunction               5 USB2.0 HD UVC WebCam
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0
>       iInterface              5 USB2.0 HD UVC WebCam
>       VideoControl Interface Descriptor:
>         bLength                13
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdUVC               1.00
>         wTotalLength       0x006b
>         dwClockFrequency       15.000000MHz
>         bInCollection           1
>         baInterfaceNr( 0)       1
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
>         bmControls           0x0000000e
>           Auto-Exposure Mode
>           Auto-Exposure Priority
>           Exposure Time (Absolute)
>       VideoControl Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>       Warning: Descriptor too short
>         bUnitID                 2
>         bSourceID               1
>         wMaxMultiplier          0
>         bControlSize            2
>         bmControls     0x0000157f
>           Brightness
>           Contrast
>           Hue
>           Saturation
>           Sharpness
>           Gamma
>           White Balance Temperature
>           Backlight Compensation
>           Power Line Frequency
>           White Balance Temperature, Auto
>         iProcessing             0
>         bmVideoStandards     0x09
>           None
>           SECAM - 625/50
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             3
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               6
>         iTerminal               0
>       VideoControl Interface Descriptor:
>         bLength                27
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                 4
>         guidExtensionCode         {1229a78c-47b4-4094-b0ce-db07386fb938}
>         bNumControls            2
>         bNrInPins               1
>         baSourceID( 0)          2
>         bControlSize            2
>         bmControls( 0)       0x00
>         bmControls( 1)       0x06
>         iExtension              0
>       VideoControl Interface Descriptor:
>         bLength                29
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                 6
>         guidExtensionCode         {26b8105a-0713-4870-979d-da79444bb68e}
>         bNumControls            1
>         bNrInPins               1
>         baSourceID( 0)          4
>         bControlSize            4
>         bmControls( 0)       0x02
>         bmControls( 1)       0x00
>         bmControls( 2)       0x00
>         bmControls( 3)       0x00
>         iExtension              7 Realtek Extended Controls Unit
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval               6
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       VideoStreaming Interface Descriptor:
>         bLength                            15
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         2
>         wTotalLength                   0x01e5
>         bEndpointAddress                 0x81  EP 1 IN
>         bmInfo                              0
>         bTerminalLink                       3
>         bStillCaptureMethod                 2
>         bTriggerSupport                     1
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>         bmaControls( 1)                     0
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        1
>         bNumFrameDescriptors                6
>         bFlags                              1
>           Fixed-size samples: Yes
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
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                442368000
>         dwMaxBitRate                442368000
>         dwMaxVideoFrameBufferSize     1843200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            160
>         wHeight                           120
>         dwMinBitRate                  9216000
>         dwMaxBitRate                  9216000
>         dwMaxVideoFrameBufferSize       38400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            176
>         wHeight                           144
>         dwMinBitRate                 12165120
>         dwMaxBitRate                 12165120
>         dwMaxVideoFrameBufferSize       50688
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            320
>         wHeight                           240
>         dwMinBitRate                 36864000
>         dwMaxBitRate                 36864000
>         dwMaxVideoFrameBufferSize      153600
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            352
>         wHeight                           288
>         dwMinBitRate                 48660480
>         dwMaxBitRate                 48660480
>         dwMaxVideoFrameBufferSize      202752
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                147456000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
>         bEndpointAddress                 0x00  EP 0 OUT
>         bNumImageSizePatterns               6
>         wWidth( 0)                       1280
>         wHeight( 0)                       720
>         wWidth( 1)                        160
>         wHeight( 1)                       120
>         wWidth( 2)                        176
>         wHeight( 2)                       144
>         wWidth( 3)                        320
>         wHeight( 3)                       240
>         wWidth( 4)                        352
>         wHeight( 4)                       288
>         wWidth( 5)                        640
>         wHeight( 5)                       480
>         bNumCompressionPatterns             0
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       VideoStreaming Interface Descriptor:
>         bLength                            27
>         bDescriptorType                    36
>         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
>         bFormatIndex                        2
>         bNumFrameDescriptors                6
>         guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
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
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                147456000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize     1843200
>         dwDefaultFrameInterval        1000000
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)           1000000
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            160
>         wHeight                           120
>         dwMinBitRate                  9216000
>         dwMaxBitRate                  9216000
>         dwMaxVideoFrameBufferSize       38400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            176
>         wHeight                           144
>         dwMinBitRate                 12165120
>         dwMaxBitRate                 12165120
>         dwMaxVideoFrameBufferSize       50688
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            320
>         wHeight                           240
>         dwMinBitRate                 36864000
>         dwMaxBitRate                 36864000
>         dwMaxVideoFrameBufferSize      153600
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            352
>         wHeight                           288
>         dwMinBitRate                 48660480
>         dwMaxBitRate                 48660480
>         dwMaxVideoFrameBufferSize      202752
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                147456000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            333333
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
>         bEndpointAddress                 0x00  EP 0 OUT
>         bNumImageSizePatterns               6
>         wWidth( 0)                       1280
>         wHeight( 0)                       720
>         wWidth( 1)                        160
>         wHeight( 1)                       120
>         wWidth( 2)                        176
>         wHeight( 2)                       144
>         wWidth( 3)                        320
>         wHeight( 3)                       240
>         wWidth( 4)                        352
>         wHeight( 4)                       288
>         wWidth( 5)                        640
>         wHeight( 5)                       480
>         bNumCompressionPatterns             0
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0080  1x 128 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       2
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       3
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       4
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0b00  2x 768 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       5
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0c00  2x 1024 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       6
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x1380  3x 896 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       7
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x1400  3x 1024 bytes
>         bInterval               1
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
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v3:
>
> - Turn the power line quirk into a control mapping overrides array
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 31 ++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 6c86faecbea2..559d8a240f76 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2643,6 +2643,23 @@ MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
>   * Driver initialization and cleanup
>   */
>
> +static const struct uvc_menu_info power_line_frequency_controls_limited[] = {
> +       { 1, "50 Hz" },
> +       { 2, "60 Hz" },
> +};
> +
> +static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
> +       .id             = V4L2_CID_POWER_LINE_FREQUENCY,
> +       .entity         = UVC_GUID_UVC_PROCESSING,
> +       .selector       = UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> +       .size           = 2,
> +       .offset         = 0,
> +       .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> +       .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
> +       .menu_info      = power_line_frequency_controls_limited,
> +       .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
> +};
> +
>  static const struct uvc_device_info uvc_quirk_probe_minmax = {
>         .quirks = UVC_QUIRK_PROBE_MINMAX,
>  };
> @@ -2673,6 +2690,20 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>   * though they are compliant.
>   */
>  static const struct usb_device_id uvc_ids[] = {
> +       /* Quanta USB2.0 HD UVC Webcam */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x0408,
> +         .idProduct            = 0x3090,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> +               .mappings = (const struct uvc_control_mapping *[]) {
> +                       &uvc_ctrl_power_line_mapping_limited,
> +                       NULL, /* Sentinel */
> +               },
> +         } },

What about: ?

diff --git a/drivers/media/usb/uvc/uvc_driver.c
b/drivers/media/usb/uvc/uvc_driver.c
index b8df40546b29..ea8c8d572ef2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2660,6 +2660,13 @@ static const struct uvc_control_mapping
uvc_ctrl_power_line_mapping_limited = {
        .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
 };

+static const struct uvc_device_info uvc_power_line_limited = {
+       .mappings = (const struct uvc_control_mapping *[]) {
+               &uvc_ctrl_power_line_mapping_limited,
+               NULL, /* Sentinel */
+       },
+};
+
 static const struct uvc_device_info uvc_quirk_probe_minmax = {
        .quirks = UVC_QUIRK_PROBE_MINMAX,
 };
@@ -2698,12 +2705,7 @@ static const struct usb_device_id uvc_ids[] = {
          .bInterfaceClass      = USB_CLASS_VIDEO,
          .bInterfaceSubClass   = 1,
          .bInterfaceProtocol   = 0,
-         .driver_info          = (kernel_ulong_t)&(const struct
uvc_device_info){
-               .mappings = (const struct uvc_control_mapping *[]) {
-                       &uvc_ctrl_power_line_mapping_limited,
-                       NULL, /* Sentinel */
-               },
-         } },
+         .driver_info          = (kernel_ulong_t)&uvc_power_line_limited },


I can probably test it on real hw today



>         /* LogiLink Wireless Webcam */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
