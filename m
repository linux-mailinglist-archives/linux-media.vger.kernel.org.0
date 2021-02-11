Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8278331959A
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 23:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhBKWLk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 17:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhBKWLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 17:11:38 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68436C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 14:10:58 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id m7so7876789oiw.12
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 14:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=+UMyixwCsM9qGLaFHVIm+h78OFhWreBSlX/ug//J5FM=;
        b=rsHGPpwxsaM9pqE8NfQlUUTzixR9Jd+Muigu4TQLTdG3qFnPwiu4uka7ig56XvI5iS
         u57GKTf4L3AbphMFTfWgHqMJUtcSBGS0JMJKeF6wfisagBNG07LjY/Y8kKdWgj0p4f+w
         uZQVd1/uh4PbHQ8jbKFPGhETijz5+U1kz9Eeu58frRcJSQeDYJSY8ehaG6cNXNIznFs1
         VxD2Quo7a80jdDauBu9solmcrZQqj6XRjLabgm163jddy5Oi6/yCDftKuZUVyeKLoDUM
         8Gzn2on03rIcyy5vfgODLpZkBlwlXBJFjVzMOJypgb4JlE/fA8XgrG8pSZ0B6Hi93+ic
         b/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=+UMyixwCsM9qGLaFHVIm+h78OFhWreBSlX/ug//J5FM=;
        b=CoIYYjhnFarzIjoCaH/ZcO2GKrbttWD9DBDFsNs4QO9on0DMex0rc6pStKOsn1LS+4
         aOaky4j9NrzwKwGM3S3uDOFZKkvSXwrtD7d7QNaJrMkGRzQ1kX/rR1mEBRFOBqrNBX2m
         EGn7Ws/VR49QfRdWYrcsdB9gci3WML/oCZsXP2xtlJUuwemABmAgh4EG0CKt/cgSr8sG
         +bWzQ4r7JBDo3uaX0TO6H9nuBhBVbHne3q/TuS2LJ3tM/+LxXd1LtWBQR2xN73aapaPT
         tzujXBYRjDm9COB9+TV5keexSX8CVZlDeYLNXfGjMFE+EWD4KgHVfj2BstYAmVHCcnvp
         qWYA==
X-Gm-Message-State: AOAM533G6q+6Wx3qHhWFl5W0NSezDZFZwVYL7aChc33JsGr+NEIOoK6A
        TK4feDfB3VAdv8PFcBsZSwtLSeexEcAYrfM5
X-Google-Smtp-Source: ABdhPJyD9Wt1/wnU0X41z9y/WAdq1gOpvrx9EVDEVaGJM41saPwshcOxwxfDSwST428s5ApRROuCMg==
X-Received: by 2002:a05:6808:486:: with SMTP id z6mr4264916oid.121.1613081457539;
        Thu, 11 Feb 2021 14:10:57 -0800 (PST)
Received: from [192.168.33.84] (li108-102.members.linode.com. [69.164.193.102])
        by smtp.gmail.com with ESMTPSA id w13sm1267148otp.51.2021.02.11.14.10.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 14:10:56 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   Luis Cortes <mrluiscortes@gmail.com>
Subject: kernel 5.9 cause webcam to fail
Message-ID: <04deaa36-6b59-cc0e-a005-6f9059fad5fc@gmail.com>
Date:   Thu, 11 Feb 2021 15:10:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------2D33F71842D103E03CA83437"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------2D33F71842D103E03CA83437
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi:

I used an older laptop and my new webcam works fine on kernel 
4.15.0-45.  When I use my daily driver laptop running fedora 32 on 
kernel 5.9.16-100 it fails to work.  I have attached dmesg and lsusb, 
let me know if I can help any other way.


thanks,

Luis.



--------------2D33F71842D103E03CA83437
Content-Type: text/x-log; charset=UTF-8;
 name="lsusb.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="lsusb.log"


Bus 001 Device 004: ID 1d6c:0103 SHENZHEN Fullhan HD 4MP WEBCAM
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1d6c 
  idProduct          0x0103 
  bcdDevice            0.10
  iManufacturer           1 SHENZHEN Fullhan
  iProduct                2 HD 4MP WEBCAM
  iSerial                 3 20200506
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x060f
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          4 config
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
      iFunction               5 HD 4MP WEBCAM
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 HD 4MP WEBCAM
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004e
        dwClockFrequency       48.000000MHz
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
        bmControls           0x0000000a
          Auto-Exposure Mode
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000165b
          Brightness
          Contrast
          Saturation
          Sharpness
          White Balance Temperature
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
        bmVideoStandards     0x1b
          None
          NTSC - 525/60
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {a29e7641-de04-47e3-8b2b-f4341aff8888}
        bNumControl            16
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            2
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              5 HD 4MP WEBCAM
      VideoStreaming Interface Descriptor:
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x04fe
        bEndPointAddress                  131
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
        bmaControls( 2)                     0
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors               12
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
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     7372800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1382400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     7372800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors               12
        guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       0
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     1
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        3
        bNumFrameDescriptors               11
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
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
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1382400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
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
      iInterface              5 HD 4MP WEBCAM
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x13fc  3x 1020 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              5 HD 4MP WEBCAM
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       2 Streaming
      bFunctionProtocol       0 
      iFunction               6 HD 4MP WEBCAM
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              0 
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
        bNrChannels             1
        wChannelConfig     0x0000
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               5
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        iFeature                0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                255 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                20
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            4 Discrete
        tSamFreq[ 0]         8000
        tSamFreq[ 1]        16000
        tSamFreq[ 2]        32000
        tSamFreq[ 3]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
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

--------------2D33F71842D103E03CA83437
Content-Type: text/x-log; charset=UTF-8;
 name="dmesg.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="dmesg.log"

[    0.000000] microcode: microcode updated early to revision 0xe2, date = 2020-07-14
[    0.000000] Linux version 5.9.16-100.fc32.x86_64 (mockbuild@bkernel02.iad2.fedoraproject.org) (gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9), GNU ld version 2.34-6.fc32) #1 SMP Mon Dec 21 14:10:00 UTC 2020
[    0.000000] Command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.9.16-100.fc32.x86_64 root=/dev/mapper/fedora_lightmessenger-root ro rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 resume=/dev/mapper/fedora_lightmessenger-swap rd.lvm.lv=fedora_lightmessenger/root rd.lvm.lv=fedora_lightmessenger/swap rhgb quiet
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009c7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009c800-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000060ad5fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000060ad6000-0x0000000060ad6fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000060ad7000-0x0000000060b00fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000060b01000-0x000000006d185fff] usable
[    0.000000] BIOS-e820: [mem 0x000000006d186000-0x000000006de64fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000006de65000-0x000000006e1fdfff] usable
[    0.000000] BIOS-e820: [mem 0x000000006e1fe000-0x000000006f09dfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000006f09e000-0x000000006ff7efff] reserved
[    0.000000] BIOS-e820: [mem 0x000000006ff7f000-0x000000006fffefff] usable
[    0.000000] BIOS-e820: [mem 0x0000000070000000-0x00000000700fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000485ffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: ASUSTeK COMPUTER INC. K501UW/K501UW, BIOS K501UW.301 09/13/2016
[    0.000000] tsc: Detected 2600.000 MHz processor
[    0.000681] tsc: Detected 2599.992 MHz TSC
[    0.000681] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000682] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000688] last_pfn = 0x486000 max_arch_pfn = 0x400000000
[    0.000692] MTRR default type: write-back
[    0.000693] MTRR fixed ranges enabled:
[    0.000694]   00000-9FFFF write-back
[    0.000695]   A0000-BFFFF uncachable
[    0.000695]   C0000-FFFFF write-protect
[    0.000696] MTRR variable ranges enabled:
[    0.000698]   0 base 0080000000 mask 7F80000000 uncachable
[    0.000698]   1 base 0078000000 mask 7FF8000000 uncachable
[    0.000699]   2 base 0074000000 mask 7FFC000000 uncachable
[    0.000700]   3 base 0072000000 mask 7FFE000000 uncachable
[    0.000701]   4 base 0071000000 mask 7FFF000000 uncachable
[    0.000701]   5 base 0070800000 mask 7FFF800000 uncachable
[    0.000702]   6 disabled
[    0.000702]   7 disabled
[    0.000703]   8 disabled
[    0.000703]   9 disabled
[    0.001043] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.001177] last_pfn = 0x6ffff max_arch_pfn = 0x400000000
[    0.009469] found SMP MP-table at [mem 0x000fcc90-0x000fcc9f]
[    0.009544] Using GB pages for direct mapping
[    0.010042] RAMDISK: [mem 0x33961000-0x35ca8fff]
[    0.010050] ACPI: Early table checksum verification disabled
[    0.010052] ACPI: RSDP 0x00000000000F05B0 000024 (v02 _ASUS_)
[    0.010056] ACPI: XSDT 0x000000006E3020A8 0000CC (v01 _ASUS_ Notebook 01072009 AMI  00010013)
[    0.010060] ACPI: FACP 0x000000006E328388 00010C (v05 _ASUS_ Notebook 01072009 AMI  00010013)
[    0.010065] ACPI: DSDT 0x000000006E302200 026183 (v02 _ASUS_ Notebook 01072009 INTL 20120913)
[    0.010067] ACPI: FACS 0x000000006F09CF80 000040
[    0.010069] ACPI: APIC 0x000000006E328498 000084 (v03 _ASUS_ Notebook 01072009 AMI  00010013)
[    0.010072] ACPI: FPDT 0x000000006E328520 000044 (v01 _ASUS_ Notebook 01072009 AMI  00010013)
[    0.010074] ACPI: FIDT 0x000000006E328568 00009C (v01 _ASUS_ Notebook 01072009 AMI  00010013)
[    0.010076] ACPI: MCFG 0x000000006E328608 00003C (v01 _ASUS_ Notebook 01072009 MSFT 00000097)
[    0.010078] ACPI: HPET 0x000000006E328648 000038 (v01 _ASUS_ Notebook 01072009 AMI. 0005000B)
[    0.010080] ACPI: SSDT 0x000000006E328680 000315 (v01 SataRe SataTabl 00001000 INTL 20120913)
[    0.010082] ACPI: ECDT 0x000000006E328998 0000C1 (v01 _ASUS_ Notebook 01072009 AMI. 00000005)
[    0.010085] ACPI: LPIT 0x000000006E328A60 000094 (v01 INTEL  SKL-ULT  00000000 MSFT 0000005F)
[    0.010087] ACPI: SSDT 0x000000006E328AF8 000248 (v02 INTEL  sensrhub 00000000 INTL 20120913)
[    0.010089] ACPI: DBGP 0x000000006E328D40 000034 (v01 INTEL           00000000 MSFT 0000005F)
[    0.010091] ACPI: DBG2 0x000000006E328D78 000054 (v00 INTEL           00000000 MSFT 0000005F)
[    0.010093] ACPI: SSDT 0x000000006E328DD0 003D5F (v02 DptfTa DptfTabl 00001000 INTL 20120913)
[    0.010096] ACPI: SSDT 0x000000006E32CB30 005882 (v02 SaSsdt SaSsdt   00003000 INTL 20120913)
[    0.010098] ACPI: UEFI 0x000000006E3323B8 000042 (v01                 00000000      00000000)
[    0.010100] ACPI: SSDT 0x000000006E332400 000E73 (v02 CpuRef CpuSsdt  00003000 INTL 20120913)
[    0.010103] ACPI: SSDT 0x000000006E333278 0007B3 (v02 SgRef  SgPch    00001000 INTL 20120913)
[    0.010105] ACPI: DMAR 0x000000006E333A30 0000F0 (v01 INTEL  SKL      00000001 INTL 00000001)
[    0.010107] ACPI: TPM2 0x000000006E333B20 000034 (v03        Tpm2Tabl 00000001 AMI  00000000)
[    0.010110] ACPI: SSDT 0x000000006E333B58 001A7D (v01 OptRef OptTabl  00001000 INTL 20120913)
[    0.010112] ACPI: MSDM 0x000000006DC26F18 000055 (v03 _ASUS_ Notebook 00000000 ASUS 00000001)
[    0.010119] ACPI: Local APIC address 0xfee00000
[    0.010230] No NUMA configuration found
[    0.010230] Faking a node at [mem 0x0000000000000000-0x0000000485ffffff]
[    0.010241] NODE_DATA(0) allocated [mem 0x485fd5000-0x485ffffff]
[    0.040968] Zone ranges:
[    0.040969]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.040970]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.040971]   Normal   [mem 0x0000000100000000-0x0000000485ffffff]
[    0.040972]   Device   empty
[    0.040973] Movable zone start for each node
[    0.040976] Early memory node ranges
[    0.040977]   node   0: [mem 0x0000000000001000-0x000000000009bfff]
[    0.040978]   node   0: [mem 0x0000000000100000-0x0000000060ad5fff]
[    0.040979]   node   0: [mem 0x0000000060b01000-0x000000006d185fff]
[    0.040979]   node   0: [mem 0x000000006de65000-0x000000006e1fdfff]
[    0.040980]   node   0: [mem 0x000000006ff7f000-0x000000006fffefff]
[    0.040980]   node   0: [mem 0x0000000100000000-0x0000000485ffffff]
[    0.041188] Zeroed struct page in unavailable ranges: 19185 pages
[    0.041189] Initmem setup node 0 [mem 0x0000000000001000-0x0000000485ffffff]
[    0.041191] On node 0 totalpages: 4142351
[    0.041192]   DMA zone: 64 pages used for memmap
[    0.041192]   DMA zone: 21 pages reserved
[    0.041193]   DMA zone: 3995 pages, LIFO batch:0
[    0.041218]   DMA32 zone: 6934 pages used for memmap
[    0.041219]   DMA32 zone: 443764 pages, LIFO batch:63
[    0.044373]   Normal zone: 57728 pages used for memmap
[    0.044374]   Normal zone: 3694592 pages, LIFO batch:63
[    0.071439] Reserving Intel graphics memory at [mem 0x71000000-0x78ffffff]
[    0.071690] ACPI: PM-Timer IO Port: 0x1808
[    0.071691] ACPI: Local APIC address 0xfee00000
[    0.071697] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.071698] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.071698] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.071699] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.071725] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.071727] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.071728] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.071729] ACPI: IRQ0 used by override.
[    0.071730] ACPI: IRQ9 used by override.
[    0.071732] Using ACPI (MADT) for SMP configuration information
[    0.071733] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.071735] TSC deadline timer available
[    0.071736] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.071752] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.071753] PM: hibernation: Registered nosave memory: [mem 0x0009c000-0x0009cfff]
[    0.071754] PM: hibernation: Registered nosave memory: [mem 0x0009d000-0x0009ffff]
[    0.071754] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.071755] PM: hibernation: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.071756] PM: hibernation: Registered nosave memory: [mem 0x60ad6000-0x60ad6fff]
[    0.071757] PM: hibernation: Registered nosave memory: [mem 0x60ad7000-0x60b00fff]
[    0.071758] PM: hibernation: Registered nosave memory: [mem 0x6d186000-0x6de64fff]
[    0.071759] PM: hibernation: Registered nosave memory: [mem 0x6e1fe000-0x6f09dfff]
[    0.071760] PM: hibernation: Registered nosave memory: [mem 0x6f09e000-0x6ff7efff]
[    0.071761] PM: hibernation: Registered nosave memory: [mem 0x6ffff000-0x6fffffff]
[    0.071762] PM: hibernation: Registered nosave memory: [mem 0x70000000-0x700fffff]
[    0.071762] PM: hibernation: Registered nosave memory: [mem 0x70100000-0x70ffffff]
[    0.071763] PM: hibernation: Registered nosave memory: [mem 0x71000000-0x78ffffff]
[    0.071763] PM: hibernation: Registered nosave memory: [mem 0x79000000-0xdfffffff]
[    0.071764] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.071764] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xfdffffff]
[    0.071764] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.071765] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.071765] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.071766] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfedfffff]
[    0.071766] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.071767] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.071767] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.071769] [mem 0x79000000-0xdfffffff] available for PCI devices
[    0.071770] Booting paravirtualized kernel on bare hardware
[    0.071773] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.077722] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
[    0.077868] percpu: Embedded 54 pages/cpu s184320 r8192 d28672 u524288
[    0.077874] pcpu-alloc: s184320 r8192 d28672 u524288 alloc=1*2097152
[    0.077874] pcpu-alloc: [0] 0 1 2 3 
[    0.077897] Built 1 zonelists, mobility grouping on.  Total pages: 4077604
[    0.077898] Policy zone: Normal
[    0.077900] Kernel command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.9.16-100.fc32.x86_64 root=/dev/mapper/fedora_lightmessenger-root ro rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 resume=/dev/mapper/fedora_lightmessenger-swap rd.lvm.lv=fedora_lightmessenger/root rd.lvm.lv=fedora_lightmessenger/swap rhgb quiet
[    0.078890] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.079326] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.079375] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.123187] Memory: 16140232K/16569404K available (14339K kernel code, 2518K rwdata, 9408K rodata, 2516K init, 4580K bss, 428912K reserved, 0K cma-reserved)
[    0.123195] random: get_random_u64 called from __kmem_cache_create+0x2e/0x550 with crng_init=0
[    0.123306] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.123319] Kernel/User page tables isolation: enabled
[    0.123339] ftrace: allocating 44240 entries in 173 pages
[    0.140302] ftrace: allocated 173 pages with 5 groups
[    0.140383] rcu: Hierarchical RCU implementation.
[    0.140384] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=4.
[    0.140385] 	Trampoline variant of Tasks RCU enabled.
[    0.140385] 	Rude variant of Tasks RCU enabled.
[    0.140386] 	Tracing variant of Tasks RCU enabled.
[    0.140386] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.140387] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.143726] NR_IRQS: 524544, nr_irqs: 1024, preallocated irqs: 16
[    0.144202] random: crng done (trusting CPU's manufacturer)
[    0.147786] Console: colour VGA+ 80x25
[    0.147790] printk: console [tty0] enabled
[    0.147809] ACPI: Core revision 20200717
[    0.148122] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.148192] APIC: Switch to symmetric I/O mode setup
[    0.148194] DMAR: Host address width 39
[    0.148195] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.148200] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 7e3ff0505e
[    0.148201] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.148205] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.148206] DMAR: RMRR base: 0x0000006dc06000 end: 0x0000006dc25fff
[    0.148207] DMAR: RMRR base: 0x00000070800000 end: 0x00000078ffffff
[    0.148208] DMAR: [Firmware Bug]: No firmware reserved region can cover this RMRR [0x0000000070800000-0x0000000078ffffff], contact BIOS vendor for fixes
[    0.148209] DMAR: [Firmware Bug]: Your BIOS is broken; bad RMRR [0x0000000070800000-0x0000000078ffffff]
               BIOS vendor: American Megatrends Inc.; Ver: K501UW.301; Product Version: 1.0       
[    0.148211] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
[    0.148211] DMAR: ANDD device: 2 name: \_SB.PCI0.I2C1
[    0.148213] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.148213] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.148214] DMAR-IR: x2apic is disabled because BIOS sets x2apic opt out bit.
[    0.148215] DMAR-IR: Use 'intremap=no_x2apic_optout' to override the BIOS setting.
[    0.149813] DMAR-IR: Enabled IRQ remapping in xapic mode
[    0.149813] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.153814] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.158131] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x257a34a6eea, max_idle_ns: 440795264358 ns
[    0.158135] Calibrating delay loop (skipped), value calculated using timer frequency.. 5199.98 BogoMIPS (lpj=2599992)
[    0.158137] pid_max: default: 32768 minimum: 301
[    0.158167] LSM: Security Framework initializing
[    0.158178] Yama: becoming mindful.
[    0.158185] SELinux:  Initializing.
[    0.158239] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.158268] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.158553] mce: CPU0: Thermal monitoring enabled (TM1)
[    0.158570] process: using mwait in idle threads
[    0.158573] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.158573] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.158576] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.158578] Spectre V2 : Mitigation: Full generic retpoline
[    0.158578] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.158578] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.158580] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.158580] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[    0.158582] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.158586] SRBDS: Mitigation: Microcode
[    0.158586] MDS: Mitigation: Clear CPU buffers
[    0.158869] Freeing SMP alternatives memory: 40K
[    0.161208] smpboot: CPU0: Intel(R) Core(TM) i7-6500U CPU @ 2.50GHz (family: 0x6, model: 0x4e, stepping: 0x3)
[    0.161348] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.161359] ... version:                4
[    0.161360] ... bit width:              48
[    0.161360] ... generic registers:      4
[    0.161361] ... value mask:             0000ffffffffffff
[    0.161361] ... max period:             00007fffffffffff
[    0.161362] ... fixed-purpose events:   3
[    0.161362] ... event mask:             000000070000000f
[    0.161401] rcu: Hierarchical SRCU implementation.
[    0.161774] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.161819] smp: Bringing up secondary CPUs ...
[    0.161888] x86: Booting SMP configuration:
[    0.161889] .... node  #0, CPUs:      #1 #2
[    0.163777] MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
[    0.164157]  #3
[    0.164643] smp: Brought up 1 node, 4 CPUs
[    0.164643] smpboot: Max logical packages: 1
[    0.164643] smpboot: Total of 4 processors activated (20799.93 BogoMIPS)
[    0.165708] devtmpfs: initialized
[    0.165708] x86/mm: Memory block size: 128MB
[    0.166201] PM: Registering ACPI NVS region [mem 0x60ad6000-0x60ad6fff] (4096 bytes)
[    0.166202] PM: Registering ACPI NVS region [mem 0x6e1fe000-0x6f09dfff] (15335424 bytes)
[    0.167147] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.167147] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.167192] xor: automatically using best checksumming function   avx       
[    0.167196] pinctrl core: initialized pinctrl subsystem
[    0.167348] PM: RTC time: 18:28:02, date: 2021-02-11
[    0.167462] NET: Registered protocol family 16
[    0.167592] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allocations
[    0.167597] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.167602] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.167608] audit: initializing netlink subsys (disabled)
[    0.167617] audit: type=2000 audit(1613068082.016:1): state=initialized audit_enabled=0 res=1
[    0.167617] thermal_sys: Registered thermal governor 'fair_share'
[    0.167617] thermal_sys: Registered thermal governor 'bang_bang'
[    0.167617] thermal_sys: Registered thermal governor 'step_wise'
[    0.167617] thermal_sys: Registered thermal governor 'user_space'
[    0.167617] cpuidle: using governor menu
[    0.167617] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.167617] ACPI: bus type PCI registered
[    0.167617] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.167617] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.167617] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.167617] PCI: Using configuration type 1 for base access
[    0.168136] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.169406] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.169406] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.310338] cryptd: max_cpu_qlen set to 1000
[    0.312210] alg: No test for 842 (842-generic)
[    0.312210] alg: No test for 842 (842-scomp)
[    0.314309] raid6: skip pq benchmark and using algorithm avx2x4
[    0.314309] raid6: using avx2x2 recovery algorithm
[    0.314309] ACPI: Added _OSI(Module Device)
[    0.314309] ACPI: Added _OSI(Processor Device)
[    0.314309] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.314309] ACPI: Added _OSI(Processor Aggregator Device)
[    0.314309] ACPI: Added _OSI(Linux-Dell-Video)
[    0.314309] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.314309] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.335419] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.RP01.PXSX], AE_NOT_FOUND (20200717/psargs-330)
[    0.335423] ACPI: Ignoring error and continuing table load
[    0.335424] ACPI Error: Skipping While/If block (20200717/psloop-427)
[    0.358009] ACPI: 8 ACPI AML tables successfully acquired and loaded
[    0.359491] ACPI: EC: EC started
[    0.359492] ACPI: EC: interrupt blocked
[    0.361383] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.361384] ACPI: EC: Boot ECDT EC used to handle transactions
[    0.362761] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.369413] ACPI: Dynamic OEM Table Load:
[    0.369418] ACPI: SSDT 0xFFFF9E32B3A9F000 000660 (v02 PmRef  Cpu0Ist  00003000 INTL 20120913)
[    0.370853] ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked
[    0.372278] ACPI: Dynamic OEM Table Load:
[    0.372282] ACPI: SSDT 0xFFFF9E32B3499800 00037F (v02 PmRef  Cpu0Cst  00003001 INTL 20120913)
[    0.373670] ACPI: Dynamic OEM Table Load:
[    0.373673] ACPI: SSDT 0xFFFF9E32B39F3240 00008E (v02 PmRef  Cpu0Hwp  00003000 INTL 20120913)
[    0.374937] ACPI: Dynamic OEM Table Load:
[    0.374940] ACPI: SSDT 0xFFFF9E32B3438C00 000130 (v02 PmRef  HwpLvt   00003000 INTL 20120913)
[    0.376891] ACPI: Dynamic OEM Table Load:
[    0.376896] ACPI: SSDT 0xFFFF9E32B3A9C000 0005AA (v02 PmRef  ApIst    00003000 INTL 20120913)
[    0.378524] ACPI: Dynamic OEM Table Load:
[    0.378527] ACPI: SSDT 0xFFFF9E32B3438400 000119 (v02 PmRef  ApHwp    00003000 INTL 20120913)
[    0.379889] ACPI: Dynamic OEM Table Load:
[    0.379892] ACPI: SSDT 0xFFFF9E32B3438A00 000119 (v02 PmRef  ApCst    00003000 INTL 20120913)
[    0.383044] ACPI: Interpreter enabled
[    0.383089] ACPI: (supports S0 S3 S4 S5)
[    0.383090] ACPI: Using IOAPIC for interrupt routing
[    0.383129] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.383825] ACPI: Enabled 7 GPEs in block 00 to 7F
[    0.386935] ACPI: Power Resource [WRST] (off)
[    0.387090] ACPI: Power Resource [WRST] (off)
[    0.387242] ACPI: Power Resource [WRST] (off)
[    0.387390] ACPI: Power Resource [WRST] (off)
[    0.387541] ACPI: Power Resource [WRST] (off)
[    0.387587] ACPI: Power Resource [PC09] (on)
[    0.388539] ACPI: Power Resource [WRST] (off)
[    0.388690] ACPI: Power Resource [WRST] (off)
[    0.388839] ACPI: Power Resource [WRST] (off)
[    0.389181] ACPI: Power Resource [WRST] (off)
[    0.389569] ACPI: Power Resource [WRST] (off)
[    0.389744] ACPI: Power Resource [WRST] (off)
[    0.389899] ACPI: Power Resource [WRST] (off)
[    0.390046] ACPI: Power Resource [WRST] (off)
[    0.390197] ACPI: Power Resource [WRST] (off)
[    0.390345] ACPI: Power Resource [WRST] (off)
[    0.390500] ACPI: Power Resource [WRST] (off)
[    0.390649] ACPI: Power Resource [WRST] (off)
[    0.390800] ACPI: Power Resource [WRST] (off)
[    0.390948] ACPI: Power Resource [WRST] (off)
[    0.401645] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.401652] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.403154] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
[    0.403155] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.403844] PCI host bridge to bus 0000:00
[    0.403846] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.403848] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.403849] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.403850] pci_bus 0000:00: root bus resource [mem 0x79000000-0xdfffffff window]
[    0.403850] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
[    0.403852] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.403866] pci 0000:00:00.0: [8086:1904] type 00 class 0x060000
[    0.403985] pci 0000:00:02.0: [8086:1916] type 00 class 0x030000
[    0.403994] pci 0000:00:02.0: reg 0x10: [mem 0xdd000000-0xddffffff 64bit]
[    0.404001] pci 0000:00:02.0: reg 0x18: [mem 0xb0000000-0xbfffffff 64bit pref]
[    0.404005] pci 0000:00:02.0: reg 0x20: [io  0xf000-0xf03f]
[    0.404169] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.404180] pci 0000:00:04.0: reg 0x10: [mem 0xdf320000-0xdf327fff 64bit]
[    0.404439] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.404458] pci 0000:00:14.0: reg 0x10: [mem 0xdf310000-0xdf31ffff 64bit]
[    0.404535] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.404717] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.404736] pci 0000:00:14.2: reg 0x10: [mem 0xdf338000-0xdf338fff 64bit]
[    0.405042] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[    0.405243] pci 0000:00:15.0: reg 0x10: [mem 0xdf337000-0xdf337fff 64bit]
[    0.406383] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[    0.406590] pci 0000:00:15.1: reg 0x10: [mem 0xdf336000-0xdf336fff 64bit]
[    0.407598] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.407620] pci 0000:00:16.0: reg 0x10: [mem 0xdf335000-0xdf335fff 64bit]
[    0.407702] pci 0000:00:16.0: PME# supported from D3hot
[    0.407889] pci 0000:00:17.0: [8086:9d03] type 00 class 0x010601
[    0.407903] pci 0000:00:17.0: reg 0x10: [mem 0xdf330000-0xdf331fff]
[    0.407911] pci 0000:00:17.0: reg 0x14: [mem 0xdf334000-0xdf3340ff]
[    0.407919] pci 0000:00:17.0: reg 0x18: [io  0xf090-0xf097]
[    0.407927] pci 0000:00:17.0: reg 0x1c: [io  0xf080-0xf083]
[    0.407935] pci 0000:00:17.0: reg 0x20: [io  0xf060-0xf07f]
[    0.407943] pci 0000:00:17.0: reg 0x24: [mem 0xdf333000-0xdf3337ff]
[    0.407989] pci 0000:00:17.0: PME# supported from D3hot
[    0.408181] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x060400
[    0.408262] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.408551] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
[    0.408632] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.408901] pci 0000:00:1c.5: [8086:9d15] type 01 class 0x060400
[    0.408981] pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
[    0.409267] pci 0000:00:1f.0: [8086:9d48] type 00 class 0x060100
[    0.409541] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.409557] pci 0000:00:1f.2: reg 0x10: [mem 0xdf32c000-0xdf32ffff]
[    0.409777] pci 0000:00:1f.3: [8086:9d70] type 00 class 0x040300
[    0.409801] pci 0000:00:1f.3: reg 0x10: [mem 0xdf328000-0xdf32bfff 64bit]
[    0.409836] pci 0000:00:1f.3: reg 0x20: [mem 0xdf300000-0xdf30ffff 64bit]
[    0.409891] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.410211] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[    0.410267] pci 0000:00:1f.4: reg 0x10: [mem 0xdf332000-0xdf3320ff 64bit]
[    0.410336] pci 0000:00:1f.4: reg 0x20: [io  0xf040-0xf05f]
[    0.410628] pci 0000:01:00.0: [10de:139b] type 00 class 0x030200
[    0.410644] pci 0000:01:00.0: reg 0x10: [mem 0xde000000-0xdeffffff]
[    0.410657] pci 0000:01:00.0: reg 0x14: [mem 0xc0000000-0xcfffffff 64bit pref]
[    0.410669] pci 0000:01:00.0: reg 0x1c: [mem 0xd0000000-0xd1ffffff 64bit pref]
[    0.410678] pci 0000:01:00.0: reg 0x24: [io  0xe000-0xe07f]
[    0.410686] pci 0000:01:00.0: reg 0x30: [mem 0xdf000000-0xdf07ffff pref]
[    0.410705] pci 0000:01:00.0: Enabling HDA controller
[    0.410810] pci 0000:01:00.0: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:00:1c.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x16 link)
[    0.410940] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.410943] pci 0000:00:1c.0:   bridge window [io  0xe000-0xefff]
[    0.410946] pci 0000:00:1c.0:   bridge window [mem 0xde000000-0xdf0fffff]
[    0.410950] pci 0000:00:1c.0:   bridge window [mem 0xc0000000-0xd1ffffff 64bit pref]
[    0.411030] pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000
[    0.411050] pci 0000:02:00.0: reg 0x10: [io  0xd000-0xd0ff]
[    0.411078] pci 0000:02:00.0: reg 0x18: [mem 0xdf204000-0xdf204fff 64bit]
[    0.411095] pci 0000:02:00.0: reg 0x20: [mem 0xdf200000-0xdf203fff 64bit]
[    0.411207] pci 0000:02:00.0: supports D1 D2
[    0.411208] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.411466] pci 0000:00:1c.4: PCI bridge to [bus 02]
[    0.411469] pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
[    0.411471] pci 0000:00:1c.4:   bridge window [mem 0xdf200000-0xdf2fffff]
[    0.411596] pci 0000:03:00.0: [8086:095a] type 00 class 0x028000
[    0.411646] pci 0000:03:00.0: reg 0x10: [mem 0xdf100000-0xdf101fff 64bit]
[    0.411872] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.412213] pci 0000:00:1c.5: PCI bridge to [bus 03]
[    0.412217] pci 0000:00:1c.5:   bridge window [mem 0xdf100000-0xdf1fffff]
[    0.414603] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.414655] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.414702] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.414748] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.414793] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.414839] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.414884] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.414929] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.415634] ACPI: EC: interrupt unblocked
[    0.415634] ACPI: EC: event unblocked
[    0.415645] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.415646] ACPI: EC: GPE=0x50
[    0.415648] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot ECDT EC initialization complete
[    0.415649] ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions and events
[    0.415733] iommu: Default domain type: Translated 
[    0.415733] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.415733] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.415733] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.415733] vgaarb: loaded
[    0.415733] SCSI subsystem initialized
[    0.415733] libata version 3.00 loaded.
[    0.415733] ACPI: bus type USB registered
[    0.415733] usbcore: registered new interface driver usbfs
[    0.415733] usbcore: registered new interface driver hub
[    0.415733] usbcore: registered new device driver usb
[    0.415733] pps_core: LinuxPPS API ver. 1 registered
[    0.415733] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.415733] PTP clock support registered
[    0.415733] EDAC MC: Ver: 3.0.0
[    0.416251] NetLabel: Initializing
[    0.416251] NetLabel:  domain hash size = 128
[    0.416252] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.416263] NetLabel:  unlabeled traffic allowed by default
[    0.416267] PCI: Using ACPI for IRQ routing
[    0.444237] PCI: pci_cache_line_size set to 64 bytes
[    0.444366] e820: reserve RAM buffer [mem 0x0009c800-0x0009ffff]
[    0.444367] e820: reserve RAM buffer [mem 0x60ad6000-0x63ffffff]
[    0.444368] e820: reserve RAM buffer [mem 0x6d186000-0x6fffffff]
[    0.444369] e820: reserve RAM buffer [mem 0x6e1fe000-0x6fffffff]
[    0.444370] e820: reserve RAM buffer [mem 0x6ffff000-0x6fffffff]
[    0.444370] e820: reserve RAM buffer [mem 0x486000000-0x487ffffff]
[    0.444374] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.444374] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.446149] clocksource: Switched to clocksource tsc-early
[    0.465478] VFS: Disk quotas dquot_6.6.0
[    0.465489] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.465545] pnp: PnP ACPI init
[    0.465943] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.465944] system 00:00: [io  0xffff] has been reserved
[    0.465945] system 00:00: [io  0xffff] has been reserved
[    0.465946] system 00:00: [io  0xffff] has been reserved
[    0.465947] system 00:00: [io  0x1800-0x18fe] has been reserved
[    0.465948] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.465953] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.466056] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.466092] system 00:02: [io  0x1854-0x1857] has been reserved
[    0.466095] system 00:02: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[    0.466241] system 00:03: [io  0x0240-0x0259] has been reserved
[    0.466242] system 00:03: [io  0x0380-0x038f] has been reserved
[    0.466244] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.466283] pnp 00:04: Plug and Play ACPI device, IDs ATK3001 PNP030b (active)
[    0.466452] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.466454] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.466455] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.466456] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.466457] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.466458] system 00:05: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.466459] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.466460] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.466462] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.466463] system 00:05: [mem 0xdffe0000-0xdfffffff] has been reserved
[    0.466466] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.466506] system 00:06: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.466507] system 00:06: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.466508] system 00:06: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.466510] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be reserved
[    0.466511] system 00:06: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.466512] system 00:06: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.466513] system 00:06: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.466515] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.466850] system 00:07: [io  0xff00-0xfffe] has been reserved
[    0.466853] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.468089] system 00:08: [mem 0xfdaf0000-0xfdafffff] has been reserved
[    0.468090] system 00:08: [mem 0xfdae0000-0xfdaeffff] has been reserved
[    0.468091] system 00:08: [mem 0xfdac0000-0xfdacffff] has been reserved
[    0.468095] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.469044] pnp: PnP ACPI: found 9 devices
[    0.474666] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.474720] NET: Registered protocol family 2
[    0.474862] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.474880] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.475002] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.475121] TCP: Hash tables configured (established 131072 bind 65536)
[    0.475190] MPTCP token hash table entries: 16384 (order: 6, 393216 bytes, linear)
[    0.475257] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.475288] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.475347] NET: Registered protocol family 1
[    0.475354] NET: Registered protocol family 44
[    0.475365] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.475368] pci 0000:00:1c.0:   bridge window [io  0xe000-0xefff]
[    0.475372] pci 0000:00:1c.0:   bridge window [mem 0xde000000-0xdf0fffff]
[    0.475374] pci 0000:00:1c.0:   bridge window [mem 0xc0000000-0xd1ffffff 64bit pref]
[    0.475379] pci 0000:00:1c.4: PCI bridge to [bus 02]
[    0.475380] pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
[    0.475384] pci 0000:00:1c.4:   bridge window [mem 0xdf200000-0xdf2fffff]
[    0.475390] pci 0000:00:1c.5: PCI bridge to [bus 03]
[    0.475393] pci 0000:00:1c.5:   bridge window [mem 0xdf100000-0xdf1fffff]
[    0.475400] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.475401] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.475402] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.475403] pci_bus 0000:00: resource 7 [mem 0x79000000-0xdfffffff window]
[    0.475404] pci_bus 0000:00: resource 8 [mem 0xfd000000-0xfe7fffff window]
[    0.475405] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
[    0.475406] pci_bus 0000:01: resource 1 [mem 0xde000000-0xdf0fffff]
[    0.475407] pci_bus 0000:01: resource 2 [mem 0xc0000000-0xd1ffffff 64bit pref]
[    0.475408] pci_bus 0000:02: resource 0 [io  0xd000-0xdfff]
[    0.475409] pci_bus 0000:02: resource 1 [mem 0xdf200000-0xdf2fffff]
[    0.475410] pci_bus 0000:03: resource 1 [mem 0xdf100000-0xdf1fffff]
[    0.475544] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.476077] PCI: CLS 0 bytes, default 64
[    0.476104] Trying to unpack rootfs image as initramfs...
[    1.030277] Freeing initrd memory: 36128K
[    1.030309] DMAR: ACPI device "device:6b" under DMAR at fed91000 as 00:15.0
[    1.030312] DMAR: ACPI device "device:6c" under DMAR at fed91000 as 00:15.1
[    1.030327] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.030328] software IO TLB: mapped [mem 0x69186000-0x6d186000] (64MB)
[    1.030978] Initialise system trusted keyrings
[    1.030994] Key type blacklist registered
[    1.031051] workingset: timestamp_bits=36 max_order=22 bucket_order=0
[    1.032295] zbud: loaded
[    1.032692] integrity: Platform Keyring initialized
[    1.041843] NET: Registered protocol family 38
[    1.041845] Key type asymmetric registered
[    1.041846] Asymmetric key parser 'x509' registered
[    1.041852] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    1.041887] io scheduler mq-deadline registered
[    1.041888] io scheduler kyber registered
[    1.041909] io scheduler bfq registered
[    1.041971] atomic64_test: passed for x86-64 platform with CX8 and with SSE
[    1.042251] pcieport 0000:00:1c.0: PME: Signaling with IRQ 122
[    1.042307] pcieport 0000:00:1c.0: AER: enabled with IRQ 122
[    1.042524] pcieport 0000:00:1c.4: PME: Signaling with IRQ 123
[    1.042570] pcieport 0000:00:1c.4: AER: enabled with IRQ 123
[    1.042768] pcieport 0000:00:1c.5: PME: Signaling with IRQ 124
[    1.042813] pcieport 0000:00:1c.5: AER: enabled with IRQ 124
[    1.042891] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.042912] intel_idle: MWAIT substates: 0x11142120
[    1.042913] intel_idle: v0.5.1 model 0x4E
[    1.043151] intel_idle: Local APIC timer is reliable in all C-states
[    1.043345] ACPI: AC Adapter [AC0] (on-line)
[    1.043419] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[    1.043436] ACPI: Lid Switch [LID]
[    1.043458] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    1.043484] ACPI: Sleep Button [SLPB]
[    1.043508] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
[    1.043526] ACPI: Power Button [PWRF]
[    1.044964] thermal LNXTHERM:00: registered as thermal_zone0
[    1.044965] ACPI: Thermal Zone [THRM] (49 C)
[    1.045141] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.047614] Non-volatile memory driver v1.3
[    1.047639] Linux agpgart interface v0.103
[    1.053650] tpm_crb MSFT0101:00: [Firmware Bug]: ACPI region does not cover the entire command/response buffer. [mem 0xfed40000-0xfed4087f flags 0x200] vs fed40080 f80
[    1.053655] tpm_crb MSFT0101:00: [Firmware Bug]: ACPI region does not cover the entire command/response buffer. [mem 0xfed40000-0xfed4087f flags 0x200] vs fed40080 f80
[    1.056026] battery: ACPI: Battery Slot [BAT0] (battery present)
[    1.070003] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    1.075325] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    1.080637] ahci 0000:00:17.0: version 3.0
[    1.080809] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0x5 impl SATA mode
[    1.080811] ahci 0000:00:17.0: flags: 64bit ncq pm led clo only pio slum part deso sadm sds apst 
[    1.081162] scsi host0: ahci
[    1.081355] scsi host1: ahci
[    1.081452] scsi host2: ahci
[    1.081491] ata1: SATA max UDMA/133 abar m2048@0xdf333000 port 0xdf333100 irq 125
[    1.081492] ata2: DUMMY
[    1.081494] ata3: SATA max UDMA/133 abar m2048@0xdf333000 port 0xdf333200 irq 125
[    1.081631] libphy: Fixed MDIO Bus: probed
[    1.081700] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.081702] ehci-pci: EHCI PCI platform driver
[    1.081712] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.081713] ohci-pci: OHCI PCI platform driver
[    1.081719] uhci_hcd: USB Universal Host Controller Interface driver
[    1.081878] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.081909] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    1.082983] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000081109810
[    1.083042] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    1.083221] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.09
[    1.083222] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.083223] usb usb1: Product: xHCI Host Controller
[    1.083224] usb usb1: Manufacturer: Linux 5.9.16-100.fc32.x86_64 xhci-hcd
[    1.083225] usb usb1: SerialNumber: 0000:00:14.0
[    1.083307] hub 1-0:1.0: USB hub found
[    1.083323] hub 1-0:1.0: 12 ports detected
[    1.084005] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.084028] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    1.084030] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    1.084061] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.09
[    1.084062] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.084063] usb usb2: Product: xHCI Host Controller
[    1.084064] usb usb2: Manufacturer: Linux 5.9.16-100.fc32.x86_64 xhci-hcd
[    1.084065] usb usb2: SerialNumber: 0000:00:14.0
[    1.084141] hub 2-0:1.0: USB hub found
[    1.084152] hub 2-0:1.0: 6 ports detected
[    1.084509] usbcore: registered new interface driver usbserial_generic
[    1.084512] usbserial: USB Serial support registered for generic
[    1.084532] i8042: PNP: PS/2 Controller [PNP030b:PS2K] at 0x60,0x64 irq 1
[    1.084532] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    1.085181] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.085271] mousedev: PS/2 mouse device common for all mice
[    1.085483] rtc_cmos 00:01: RTC can wake from S4
[    1.085964] rtc_cmos 00:01: registered as rtc0
[    1.086062] rtc_cmos 00:01: setting system clock to 2021-02-11T18:28:03 UTC (1613068083)
[    1.086063] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
[    1.086099] device-mapper: uevent: version 1.0.3
[    1.086147] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[    1.086186] intel_pstate: Intel P-state driver initializing
[    1.086419] intel_pstate: HWP enabled
[    1.086518] hid: raw HID events driver (C) Jiri Kosina
[    1.086544] usbcore: registered new interface driver usbhid
[    1.086544] usbhid: USB HID core driver
[    1.086623] intel_pmc_core INT33A1:00:  initialized
[    1.086684] drop_monitor: Initializing network drop monitor service
[    1.086753] Initializing XFRM netlink socket
[    1.086834] NET: Registered protocol family 10
[    1.090091] Segment Routing with IPv6
[    1.090092] RPL Segment Routing with IPv6
[    1.090111] mip6: Mobile IPv6
[    1.090113] NET: Registered protocol family 17
[    1.090521] microcode: sig=0x406e3, pf=0x80, revision=0xe2
[    1.090534] microcode: Microcode Update Driver: v2.2.
[    1.090537] IPI shorthand broadcast: enabled
[    1.090542] AVX2 version of gcm_enc/dec engaged.
[    1.090543] AES CTR mode by8 optimization enabled
[    1.095899] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
[    1.107071] sched_clock: Marking stable (1099961309, 7103537)->(1120866515, -13801669)
[    1.107153] registered taskstats version 1
[    1.107175] Loading compiled-in X.509 certificates
[    1.107745] Loaded X.509 cert 'Fedora kernel signing key: f46597828bec427540a0d0725fb0c323a1db591e'
[    1.107762] zswap: loaded using pool lzo/zbud
[    1.107852] Key type ._fscrypt registered
[    1.107852] Key type .fscrypt registered
[    1.107853] Key type fscrypt-provisioning registered
[    1.107994] Btrfs loaded, crc32c=crc32c-generic
[    1.110488] Key type encrypted registered
[    1.110501] ima: Allocated hash algorithm: sha256
[    1.156330] ima: No architecture policies found
[    1.158011] PM:   Magic number: 9:636:493
[    1.158178] RAS: Correctable Errors collector initialized.
[    1.391671] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.391699] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.392884] ata1.00: ATA-9: WDC WD10SPCX-24HWST0, 01.01A01, max UDMA/133
[    1.392888] ata1.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    1.393016] ata3.00: ATA-9: SanDisk SD8SN8U512G1002, X4131002, max UDMA/133
[    1.393020] ata3.00: 1000215216 sectors, multi 1: LBA48 NCQ (depth 32), AA
[    1.394063] ata1.00: configured for UDMA/133
[    1.394377] scsi 0:0:0:0: Direct-Access     ATA      WDC WD10SPCX-24H 1A01 PQ: 0 ANSI: 5
[    1.394744] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    1.394873] sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
[    1.394879] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    1.394907] sd 0:0:0:0: [sda] Write Protect is off
[    1.394910] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.394934] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.395100] ata3.00: configured for UDMA/133
[    1.401281] usb 1-8: new full-speed USB device number 2 using xhci_hcd
[    1.405243] ahci 0000:00:17.0: port does not support device sleep
[    1.405671] scsi 2:0:0:0: Direct-Access     ATA      SanDisk SD8SN8U5 1002 PQ: 0 ANSI: 5
[    1.406054] sd 2:0:0:0: Attached scsi generic sg1 type 0
[    1.406117] sd 2:0:0:0: [sdb] 1000215216 512-byte logical blocks: (512 GB/477 GiB)
[    1.406149] sd 2:0:0:0: [sdb] Write Protect is off
[    1.406153] sd 2:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    1.406193] sd 2:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.407450]  sdb: sdb1 sdb2
[    1.408462] sd 2:0:0:0: [sdb] Attached SCSI disk
[    1.530848] usb 1-8: New USB device found, idVendor=8087, idProduct=0a2a, bcdDevice= 0.01
[    1.530852] usb 1-8: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.558606]  sda: sda3
[    1.559290] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.561812] Freeing unused decrypted memory: 2040K
[    1.562799] Freeing unused kernel image (initmem) memory: 2516K
[    1.564268] Write protecting the kernel read-only data: 26624k
[    1.565482] Freeing unused kernel image (text/rodata gap) memory: 2044K
[    1.565955] Freeing unused kernel image (rodata/data gap) memory: 832K
[    1.643346] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.643349] rodata_test: all tests were successful
[    1.643350] x86/mm: Checking user space page tables
[    1.694088] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.694094] Run /init as init process
[    1.694094]   with arguments:
[    1.694095]     /init
[    1.694095]     rhgb
[    1.694096]   with environment:
[    1.694096]     HOME=/
[    1.694097]     TERM=linux
[    1.694097]     BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.9.16-100.fc32.x86_64
[    1.702731] systemd[1]: systemd v245.8-2.fc32 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=unified)
[    1.714545] systemd[1]: Detected architecture x86-64.
[    1.714547] systemd[1]: Running in initial RAM disk.
[    1.714569] systemd[1]: Set hostname to <LightMessenger>.
[    1.778468] systemd[1]: Created slice system-systemd\x2dhibernate\x2dresume.slice.
[    1.778519] systemd[1]: Reached target Slices.
[    1.778531] systemd[1]: Reached target Swap.
[    1.778540] systemd[1]: Reached target Timers.
[    1.778666] systemd[1]: Listening on Journal Audit Socket.
[    1.778737] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.778812] systemd[1]: Listening on Journal Socket.
[    1.778885] systemd[1]: Listening on udev Control Socket.
[    1.778931] systemd[1]: Listening on udev Kernel Socket.
[    1.778941] systemd[1]: Reached target Sockets.
[    1.779588] systemd[1]: Starting Create list of static device nodes for the current kernel...
[    1.780186] systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
[    1.781818] systemd[1]: Starting Journal Service...
[    1.782826] systemd[1]: Starting Load Kernel Modules...
[    1.783671] systemd[1]: Starting Setup Virtual Console...
[    1.784250] systemd[1]: Finished Create list of static device nodes for the current kernel.
[    1.785148] systemd[1]: Starting Create Static Device Nodes in /dev...
[    1.793517] systemd[1]: Finished Create Static Device Nodes in /dev.
[    1.860277] fuse: init (API version 7.31)
[    1.861536] systemd[1]: Finished Load Kernel Modules.
[    1.861581] audit: type=1130 audit(1613068084.274:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-modules-load comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.862384] systemd[1]: Starting Apply Kernel Variables...
[    1.862824] systemd[1]: Started Journal Service.
[    1.862954] audit: type=1130 audit(1613068084.275:3): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.870214] audit: type=1130 audit(1613068084.282:4): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    1.924971] audit: type=1130 audit(1613068084.336:5): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-vconsole-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.027666] audit: type=1130 audit(1613068084.439:6): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.039151] tsc: Refined TSC clocksource calibration: 2591.999 MHz
[    2.039156] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x255cb5c6a11, max_idle_ns: 440795249002 ns
[    2.039168] clocksource: Switched to clocksource tsc
[    2.067049] audit: type=1130 audit(1613068084.478:7): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-udev comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.067052] audit: type=1334 audit(1613068084.479:8): prog-id=6 op=LOAD
[    2.067053] audit: type=1334 audit(1613068084.479:9): prog-id=7 op=LOAD
[    2.108697] audit: type=1130 audit(1613068084.521:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udevd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    2.355620] i2c_hid i2c-FTE1001:00: supply vdd not found, using dummy regulator
[    2.355650] i2c_hid i2c-FTE1001:00: supply vddl not found, using dummy regulator
[    2.411339] r8169 0000:02:00.0: can't disable ASPM; OS doesn't have ASPM control
[    2.432151] libphy: r8169: probed
[    2.432316] r8169 0000:02:00.0 eth0: RTL8168gu/8111gu, 38:d5:47:4b:23:54, XID 509, IRQ 127
[    2.432318] r8169 0000:02:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
[    2.595894] r8169 0000:02:00.0 enp2s0: renamed from eth0
[    2.614901] asus_wmi: ASUS WMI generic driver loaded
[    2.635603] input: FTE1001:00 0B05:0101 as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-FTE1001:00/0018:0B05:0101.0001/input/input4
[    2.639155] asus 0018:0B05:0101.0001: input,hidraw0: I2C HID v1.00 Mouse [FTE1001:00 0B05:0101] on i2c-FTE1001:00
[    2.931987] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.934601] Console: switching to colour dummy device 80x25
[    2.949550] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    2.951234] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/skl_dmc_ver1_27.bin (v1.27)
[    2.989402] [drm] Initialized i915 1.6.0 20200715 for 0000:00:02.0 on minor 0
[    2.991516] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    2.997478] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input5
[    2.997548] ACPI: Video Device [PEGP] (multi-head: no  rom: yes  post: no)
[    2.997575] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:22/LNXVIDEO:01/input/input6
[    3.002576] fbcon: i915drmfb (fb0) is primary device
[    3.018202] Console: switching to colour frame buffer device 240x67
[    3.042275] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.635763] PM: Image not found (code -22)
[    4.241575] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: (null)
[    4.619864] systemd-journald[222]: Received SIGTERM from PID 1 (systemd).
[    4.809062] SELinux:  Runtime disable is deprecated, use selinux=0 on the kernel cmdline.
[    4.809066] SELinux:  Disabled at runtime.
[    4.897031] systemd[1]: systemd v245.8-2.fc32 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=unified)
[    4.909448] systemd[1]: Detected architecture x86-64.
[    4.909809] systemd[1]: Set hostname to <LightMessenger>.
[    5.208600] systemd[1]: /etc/systemd/system/teamviewerd.service:9: PIDFile= references a path below legacy directory /var/run/, updating /var/run/teamviewerd.pid → /run/teamviewerd.pid; please update the unit file accordingly.
[    5.307787] kauditd_printk_skb: 47 callbacks suppressed
[    5.307788] audit: type=1334 audit(1613068087.720:58): prog-id=15 op=LOAD
[    5.308068] audit: type=1334 audit(1613068087.720:59): prog-id=16 op=LOAD
[    5.308103] audit: type=1334 audit(1613068087.720:60): prog-id=17 op=LOAD
[    5.309747] audit: type=1131 audit(1613068087.722:61): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    5.310100] systemd[1]: initrd-switch-root.service: Succeeded.
[    5.310219] systemd[1]: Stopped Switch Root.
[    5.310355] audit: type=1130 audit(1613068087.723:62): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=initrd-switch-root comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    5.310358] audit: type=1131 audit(1613068087.723:63): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=initrd-switch-root comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    5.310607] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
[    5.310764] systemd[1]: Created slice Virtual Machine and Container Slice.
[    5.310971] systemd[1]: Created slice system-getty.slice.
[    5.311194] systemd[1]: Created slice system-modprobe.slice.
[    5.311403] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[    5.311565] systemd[1]: Created slice User and Session Slice.
[    5.311609] systemd[1]: Condition check resulted in Dispatch Password Requests to Console Directory Watch being skipped.
[    5.311689] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    5.311852] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    5.311907] systemd[1]: Reached target Login Prompts.
[    5.311948] systemd[1]: Stopped target Switch Root.
[    5.311990] systemd[1]: Stopped target Initrd File Systems.
[    5.312007] systemd[1]: Stopped target Initrd Root File System.
[    5.312049] systemd[1]: Reached target Slices.
[    5.312144] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    5.312274] systemd[1]: Listening on LVM2 poll daemon socket.
[    5.312338] systemd[1]: Listening on multipathd control socket.
[    5.313355] systemd[1]: Listening on Process Core Dump Socket.
[    5.313452] systemd[1]: Listening on initctl Compatibility Named Pipe.
[    5.313579] systemd[1]: Listening on udev Control Socket.
[    5.313649] systemd[1]: Listening on udev Kernel Socket.
[    5.313742] systemd[1]: Listening on User Database Manager Socket.
[    5.314329] systemd[1]: Activating swap /dev/mapper/fedora_lightmessenger-swap...
[    5.315051] systemd[1]: Mounting Huge Pages File System...
[    5.315987] systemd[1]: Mounting POSIX Message Queue File System...
[    5.316280] audit: type=1334 audit(1613068087.729:64): prog-id=15 op=UNLOAD
[    5.317042] systemd[1]: Mounting Kernel Debug File System...
[    5.318121] systemd[1]: Mounting Kernel Trace File System...
[    5.318364] systemd[1]: Condition check resulted in Kernel Module supporting RPCSEC_GSS being skipped.
[    5.319402] systemd[1]: Starting Create list of static device nodes for the current kernel...
[    5.320655] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[    5.320796] systemd[1]: Condition check resulted in Load Kernel Module drm being skipped.
[    5.321698] systemd[1]: Starting Preprocess NFS configuration convertion...
[    5.321956] systemd[1]: plymouth-switch-root.service: Succeeded.
[    5.322186] systemd[1]: Stopped Plymouth switch root service.
[    5.322274] audit: type=1131 audit(1613068087.735:65): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=plymouth-switch-root comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    5.323484] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
[    5.323565] systemd[1]: Stopped Journal Service.
[    5.323619] audit: type=1130 audit(1613068087.736:66): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    5.323644] audit: type=1131 audit(1613068087.736:67): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    5.324169] Adding 8175612k swap on /dev/mapper/fedora_lightmessenger-swap.  Priority:-2 extents:1 across:8175612k SSFS
[    5.325355] systemd[1]: Starting Journal Service...
[    5.327088] systemd[1]: Starting Load Kernel Modules...
[    5.328201] systemd[1]: Starting Remount Root and Kernel File Systems...
[    5.329340] systemd[1]: Starting Repartition Root Disk...
[    5.330283] systemd[1]: Starting udev Coldplug all Devices...
[    5.331400] systemd[1]: sysroot.mount: Succeeded.
[    5.335523] systemd[1]: Activated swap /dev/mapper/fedora_lightmessenger-swap.
[    5.336530] systemd[1]: Mounted Huge Pages File System.
[    5.336699] systemd[1]: Mounted POSIX Message Queue File System.
[    5.336868] systemd[1]: Mounted Kernel Debug File System.
[    5.337017] systemd[1]: Mounted Kernel Trace File System.
[    5.337476] systemd[1]: Finished Create list of static device nodes for the current kernel.
[    5.337860] systemd[1]: nfs-convert.service: Succeeded.
[    5.338034] systemd[1]: Finished Preprocess NFS configuration convertion.
[    5.338132] EXT4-fs (dm-0): re-mounted. Opts: (null)
[    5.338917] systemd[1]: Reached target Swap.
[    5.340591] systemd[1]: tmp.mount: Directory /tmp to mount over is not empty, mounting anyway.
[    5.341294] systemd[1]: Mounting Temporary Directory (/tmp)...
[    5.341743] systemd[1]: Finished Remount Root and Kernel File Systems.
[    5.342052] systemd[1]: Condition check resulted in OSTree Remount OS/ Bind Mounts being skipped.
[    5.342085] systemd[1]: Condition check resulted in First Boot Wizard being skipped.
[    5.346853] systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
[    5.347720] systemd[1]: Starting Load/Save Random Seed...
[    5.347805] systemd[1]: Condition check resulted in Create System Users being skipped.
[    5.348881] systemd[1]: Starting Create Static Device Nodes in /dev...
[    5.350449] systemd[1]: Finished Load Kernel Modules.
[    5.350914] systemd[1]: Finished Repartition Root Disk.
[    5.351155] systemd[1]: Mounted Temporary Directory (/tmp).
[    5.352267] systemd[1]: Mounting FUSE Control File System...
[    5.353220] systemd[1]: Starting Apply Kernel Variables...
[    5.360115] systemd[1]: Mounted FUSE Control File System.
[    5.364982] systemd[1]: Finished Load/Save Random Seed.
[    5.372582] systemd[1]: Started Journal Service.
[    5.380410] systemd-journald[582]: Received client request to flush runtime journal.
[    5.388795] systemd-journald[582]: File /var/log/journal/c8dde5031934492dac933fa317e70215/system.journal corrupted or uncleanly shut down, renaming and replacing.
[    5.653384] input: Asus Wireless Radio Control as /devices/LNXSYSTM:00/LNXSYBUS:00/ATK4002:00/input/input7
[    5.808556] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    5.808891] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    5.876235] asus_wmi: Initialization: 0x1
[    5.876275] asus_wmi: BIOS WMI version: 7.9
[    5.883466] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    5.896680] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    5.896709] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    5.896961] asus_wmi: SFUN value: 0xa0065
[    5.896966] asus-nb-wmi asus-nb-wmi: Detected ATK, not ASUSWMI, use DSTS
[    5.896968] asus-nb-wmi asus-nb-wmi: Detected ATK, enable event queue
[    5.902759] input: PC Speaker as /devices/platform/pcspkr/input/input8
[    5.906658] intel_rapl_common: Found RAPL domain package
[    5.906659] intel_rapl_common: Found RAPL domain dram
[    5.907096] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THERMAL_PCI
[    5.907713] input: Asus WMI hotkeys as /devices/platform/asus-nb-wmi/input/input9
[    5.912100] i2c i2c-6: 2/4 memory slots populated (from DMI)
[    5.914013] i2c i2c-6: Successfully instantiated SPD at 0x52
[    5.978040] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    5.978904] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.993604] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[    5.993605] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    5.993606] RAPL PMU: hw unit of domain package 2^-14 Joules
[    5.993606] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    5.993607] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    5.993607] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    6.015501] nvidia: loading out-of-tree module taints kernel.
[    6.015516] nvidia: module license 'NVIDIA' taints kernel.
[    6.015518] Disabling lock debugging due to kernel taint
[    6.099154] nvidia: module verification failed: signature and/or required key missing - tainting kernel
[    6.186964] intel_rapl_common: Found RAPL domain package
[    6.186966] intel_rapl_common: Found RAPL domain core
[    6.186967] intel_rapl_common: Found RAPL domain uncore
[    6.186968] intel_rapl_common: Found RAPL domain dram
[    6.189798] iTCO_vendor_support: vendor-support=0
[    6.193929] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    6.193990] iTCO_wdt: Found a Intel PCH TCO device (Version=4, TCOBASE=0x0400)
[    6.197823] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[    6.206942] ee1004 6-0052: 512 byte EE1004-compliant SPD EEPROM, read-only
[    6.225952] Intel(R) Wireless WiFi driver for Linux
[    6.246756] iwlwifi 0000:03:00.0: loaded firmware version 29.198743027.0 7265D-29.ucode op_mode iwlmvm
[    6.250771] nvidia-nvlink: Nvlink Core is being initialized, major device number 237
[    6.347289] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[    6.385979] snd_hda_codec_conexant hdaudioC0D0: CX20751/2: BIOS auto-probing.
[    6.387482] snd_hda_codec_conexant hdaudioC0D0: autoconfig for CX20751/2: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    6.387484] snd_hda_codec_conexant hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    6.387486] snd_hda_codec_conexant hdaudioC0D0:    hp_outs=1 (0x16/0x0/0x0/0x0/0x0)
[    6.387487] snd_hda_codec_conexant hdaudioC0D0:    mono: mono_out=0x0
[    6.387488] snd_hda_codec_conexant hdaudioC0D0:    inputs:
[    6.387490] snd_hda_codec_conexant hdaudioC0D0:      Internal Mic=0x1a
[    6.387491] snd_hda_codec_conexant hdaudioC0D0:      Mic=0x19
[    6.409212] iwlwifi 0000:03:00.0: Detected Intel(R) Dual Band Wireless AC 7265, REV=0x210
[    6.427324] iwlwifi 0000:03:00.0: base HW address: 7c:b0:c2:b7:24:0b
[    6.427945] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input10
[    6.428001] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input11
[    6.428048] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[    6.428102] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input13
[    6.428161] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input14
[    6.428723] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
[    6.428827] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
[    6.488799] Bluetooth: Core ver 2.22
[    6.488822] NET: Registered protocol family 31
[    6.488823] Bluetooth: HCI device and connection manager initialized
[    6.488912] Bluetooth: HCI socket layer initialized
[    6.488914] Bluetooth: L2CAP socket layer initialized
[    6.488918] Bluetooth: SCO socket layer initialized
[    6.494291] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  460.39  Thu Jan 21 21:54:06 UTC 2021
[    6.494319] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[    6.494997] thermal thermal_zone9: failed to read out thermal zone (-61)
[    6.516829] nvidia_uvm: module uses symbols from proprietary module nvidia, inheriting taint.
[    6.524214] iwlwifi 0000:03:00.0 wlp3s0: renamed from wlan0
[    6.563159] nvidia-uvm: Loaded the UVM driver, major device number 235.
[    6.577200] nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver for UNIX platforms  460.39  Thu Jan 21 21:49:04 UTC 2021
[    6.584179] [drm] [nvidia-drm] [GPU ID 0x00000100] Loading driver
[    6.606647] ACPI Warning: \_SB.PCI0.RP01.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20200717/nsarguments-59)
[    6.650633] usbcore: registered new interface driver btusb
[    6.665493] Bluetooth: hci0: read Intel version: 370810011003110e00
[    6.666016] Bluetooth: hci0: Intel Bluetooth firmware file: intel/ibt-hw-37.8.10-fw-1.10.3.11.e.bseq
[    6.968781] Bluetooth: hci0: unexpected event for opcode 0xfc2f
[    6.986809] Bluetooth: hci0: Intel BT fw patch 0x32 completed & activated
[    7.054678] [drm] Initialized nvidia-drm 0.0.0 20160202 for 0000:01:00.0 on minor 1
[    7.351726] loop: module loaded
[    7.405275] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    7.429427] EXT4-fs (sdb1): mounted filesystem with ordered data mode. Opts: (null)
[    7.510629] EXT4-fs (sda3): recovery complete
[    7.546022] EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: 
[   11.277273] kauditd_printk_skb: 30 callbacks suppressed
[   11.277275] audit: type=1130 audit(1613068093.690:98): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-fsck@dev-mapper-fedora_lightmessenger\x2dhome comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   11.287823] EXT4-fs (dm-2): mounted filesystem with ordered data mode. Opts: (null)
[   11.293640] audit: type=1130 audit(1613068093.706:99): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=dracut-shutdown comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   11.307031] audit: type=1130 audit(1613068093.719:100): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=import-state comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   11.308572] audit: type=1130 audit(1613068093.721:101): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=plymouth-read-write comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   11.345167] audit: type=1130 audit(1613068093.758:102): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   11.356330] audit: type=1305 audit(1613068093.769:103): op=set audit_enabled=1 old=1 auid=4294967295 ses=4294967295 res=1
[   11.394244] RPC: Registered named UNIX socket transport module.
[   11.394245] RPC: Registered udp transport module.
[   11.394246] RPC: Registered tcp transport module.
[   11.394246] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   11.730450] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   11.730452] Bluetooth: BNEP filters: protocol multicast
[   11.730455] Bluetooth: BNEP socket layer initialized
[   12.600229] vboxdrv: Found 4 processor cores
[   12.633244] vboxdrv: TSC mode is Invariant, tentative frequency 2591972143 Hz
[   12.633245] vboxdrv: Successfully loaded version 6.1.16 (interface 0x00300000)
[   12.852224] VBoxNetFlt: Successfully started.
[   12.859280] VBoxNetAdp: Successfully started.
[   13.627138] Generic FE-GE Realtek PHY r8169-200:00: attached PHY driver [Generic FE-GE Realtek PHY] (mii_bus:phy_addr=r8169-200:00, irq=IGNORE)
[   13.790544] r8169 0000:02:00.0 enp2s0: Link is Down
[   14.047366] ahci 0000:00:17.0: port does not support device sleep
[   19.008977] wlp3s0: authenticate with 60:38:e0:78:03:ef
[   19.014086] wlp3s0: send auth to 60:38:e0:78:03:ef (try 1/3)
[   19.029701] wlp3s0: authenticated
[   19.030072] wlp3s0: associate with 60:38:e0:78:03:ef (try 1/3)
[   19.034305] wlp3s0: RX AssocResp from 60:38:e0:78:03:ef (capab=0x431 status=0 aid=1)
[   19.036049] wlp3s0: associated
[   19.128560] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[   20.444572] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[   20.466016] tun: Universal TUN/TAP device driver, 1.6
[   20.466807] virbr0: port 1(virbr0-nic) entered blocking state
[   20.466808] virbr0: port 1(virbr0-nic) entered disabled state
[   20.466846] device virbr0-nic entered promiscuous mode
[   20.979100] Bluetooth: RFCOMM TTY layer initialized
[   20.979106] Bluetooth: RFCOMM socket layer initialized
[   20.979110] Bluetooth: RFCOMM ver 1.11
[   21.157214] virbr0: port 1(virbr0-nic) entered blocking state
[   21.157216] virbr0: port 1(virbr0-nic) entered listening state
[   21.209462] virbr0: port 1(virbr0-nic) entered disabled state
[   21.683776] L1TF CPU bug present and SMT on, data leak possible. See CVE-2018-3646 and https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/l1tf.html for details.
[   29.365454] nf_conntrack: default automatic helper assignment has been turned off for security reasons and CT-based  firewall rule not found. Use the iptables CT target to attach helpers instead.
[  119.229787] wlp3s0: authenticate with 60:38:e0:78:03:ef
[  119.233550] wlp3s0: send auth to 60:38:e0:78:03:ef (try 1/3)
[  119.300069] wlp3s0: send auth to 60:38:e0:78:03:ef (try 2/3)
[  119.359788] wlp3s0: send auth to 60:38:e0:78:03:ef (try 3/3)
[  119.414789] wlp3s0: authentication with 60:38:e0:78:03:ef timed out
[  193.684282] wlp3s0: authenticate with 60:38:e0:78:03:ef
[  193.687801] wlp3s0: send auth to 60:38:e0:78:03:ef (try 1/3)
[  193.693138] wlp3s0: authenticated
[  193.694463] wlp3s0: associate with 60:38:e0:78:03:ef (try 1/3)
[  193.712608] wlp3s0: RX AssocResp from 60:38:e0:78:03:ef (capab=0x431 status=0 aid=1)
[  193.715119] wlp3s0: associated
[  193.733562] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[  453.286814] wlp3s0: deauthenticating from 60:38:e0:78:03:ef by local choice (Reason: 3=DEAUTH_LEAVING)
[  458.411581] wlp3s0: authenticate with 60:38:e0:78:03:f0
[  458.414643] wlp3s0: send auth to 60:38:e0:78:03:f0 (try 1/3)
[  458.416922] wlp3s0: authenticated
[  458.417325] wlp3s0: associate with 60:38:e0:78:03:f0 (try 1/3)
[  458.419795] wlp3s0: RX AssocResp from 60:38:e0:78:03:f0 (capab=0x11 status=0 aid=1)
[  458.421499] wlp3s0: associated
[  458.429984] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[ 1583.705047] wlp3s0: deauthenticating from 60:38:e0:78:03:f0 by local choice (Reason: 3=DEAUTH_LEAVING)
[ 1611.170878] wlp3s0: authenticate with 60:38:e0:78:03:f0
[ 1611.173920] wlp3s0: send auth to 60:38:e0:78:03:f0 (try 1/3)
[ 1611.184451] wlp3s0: authenticated
[ 1611.186815] wlp3s0: associate with 60:38:e0:78:03:f0 (try 1/3)
[ 1611.191440] wlp3s0: RX AssocResp from 60:38:e0:78:03:f0 (capab=0x11 status=0 aid=1)
[ 1611.193904] wlp3s0: associated
[ 1611.210385] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[ 1617.791389] wlp3s0: deauthenticating from 60:38:e0:78:03:f0 by local choice (Reason: 3=DEAUTH_LEAVING)
[ 1618.928498] wlp3s0: authenticate with 60:38:e0:78:03:ef
[ 1618.931072] wlp3s0: send auth to 60:38:e0:78:03:ef (try 1/3)
[ 1618.942321] wlp3s0: authenticated
[ 1618.944220] wlp3s0: associate with 60:38:e0:78:03:ef (try 1/3)
[ 1618.947819] wlp3s0: RX AssocResp from 60:38:e0:78:03:ef (capab=0x431 status=0 aid=1)
[ 1618.949552] wlp3s0: associated
[ 1618.962654] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[ 1670.651754] wlp3s0: deauthenticated from 60:38:e0:78:03:ef (Reason: 3=DEAUTH_LEAVING)
[ 1674.354213] wlp3s0: authenticate with 60:38:e0:78:03:ef
[ 1674.356701] wlp3s0: send auth to 60:38:e0:78:03:ef (try 1/3)
[ 1674.422100] wlp3s0: send auth to 60:38:e0:78:03:ef (try 2/3)
[ 1674.479880] wlp3s0: send auth to 60:38:e0:78:03:ef (try 3/3)
[ 1674.544736] wlp3s0: authentication with 60:38:e0:78:03:ef timed out
[ 1683.147285] wlp3s0: authenticate with 60:38:e0:78:03:f0
[ 1683.150817] wlp3s0: send auth to 60:38:e0:78:03:f0 (try 1/3)
[ 1683.153302] wlp3s0: authenticated
[ 1683.157840] wlp3s0: associate with 60:38:e0:78:03:f0 (try 1/3)
[ 1683.160736] wlp3s0: RX AssocResp from 60:38:e0:78:03:f0 (capab=0x11 status=0 aid=1)
[ 1683.164714] wlp3s0: associated
[ 1683.186712] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[ 1906.989800] i2c_hid i2c-FTE1001:00: i2c_hid_get_input: incomplete report (30/57074)
[ 3701.973465] wlp3s0: authenticate with 60:38:e0:78:03:f0
[ 3701.976250] wlp3s0: send auth to 60:38:e0:78:03:f0 (try 1/3)
[ 3702.027648] wlp3s0: send auth to 60:38:e0:78:03:f0 (try 2/3)
[ 3702.081074] wlp3s0: send auth to 60:38:e0:78:03:f0 (try 3/3)
[ 3702.139152] wlp3s0: authentication with 60:38:e0:78:03:f0 timed out
[ 3786.389166] wlp3s0: authenticate with 60:38:e0:78:03:f0
[ 3786.391928] wlp3s0: send auth to 60:38:e0:78:03:f0 (try 1/3)
[ 3786.394418] wlp3s0: authenticated
[ 3786.395549] wlp3s0: associate with 60:38:e0:78:03:f0 (try 1/3)
[ 3786.398004] wlp3s0: RX AssocResp from 60:38:e0:78:03:f0 (capab=0x11 status=0 aid=1)
[ 3786.403136] wlp3s0: associated
[ 3786.410574] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[ 3993.216367] r8169 0000:02:00.0 enp2s0: Link is Up - 100Mbps/Full - flow control off
[ 3993.216377] IPv6: ADDRCONF(NETDEV_CHANGE): enp2s0: link becomes ready
[ 3994.720428] r8169 0000:02:00.0 enp2s0: Link is Down
[ 3997.127325] r8169 0000:02:00.0 enp2s0: Link is Up - 100Mbps/Full - flow control off
[ 4007.647572] wlp3s0: deauthenticating from 60:38:e0:78:03:f0 by local choice (Reason: 3=DEAUTH_LEAVING)
[ 4054.010963] r8169 0000:02:00.0 enp2s0: Link is Down
[ 4057.911795] r8169 0000:02:00.0 enp2s0: Link is Up - 100Mbps/Full - flow control off
[ 4233.776899] r8169 0000:02:00.0 enp2s0: Link is Down
[ 4338.765485] wlp3s0: authenticate with 60:38:e0:78:03:f0
[ 4338.768841] wlp3s0: send auth to 60:38:e0:78:03:f0 (try 1/3)
[ 4338.775240] wlp3s0: authenticated
[ 4338.777665] wlp3s0: associate with 60:38:e0:78:03:f0 (try 1/3)
[ 4338.780112] wlp3s0: RX AssocResp from 60:38:e0:78:03:f0 (capab=0x11 status=0 aid=1)
[ 4338.782936] wlp3s0: associated
[ 4338.790663] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[ 4341.373249] wlp3s0: deauthenticating from 60:38:e0:78:03:f0 by local choice (Reason: 3=DEAUTH_LEAVING)
[ 4353.341059] wlp3s0: authenticate with e4:6f:13:31:1d:2a
[ 4353.345342] wlp3s0: send auth to e4:6f:13:31:1d:2a (try 1/3)
[ 4353.347062] wlp3s0: authenticated
[ 4353.349043] wlp3s0: associate with e4:6f:13:31:1d:2a (try 1/3)
[ 4353.350407] wlp3s0: RX AssocResp from e4:6f:13:31:1d:2a (capab=0x411 status=0 aid=1)
[ 4353.350741] wlp3s0: AP has invalid WMM params (AIFSN=0 for ACI 0), will use 2
[ 4353.350745] wlp3s0: AP has invalid WMM params (CWmin/max=0/0 for ACI 0), using defaults
[ 4353.352255] wlp3s0: associated
[ 4353.374057] wlp3s0: Limiting TX power to 37 (40 - 3) dBm as advertised by e4:6f:13:31:1d:2a
[ 4353.590206] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[ 4613.371369] wlp3s0: deauthenticated from e4:6f:13:31:1d:2a (Reason: 6=CLASS2_FRAME_FROM_NONAUTH_STA)
[ 4613.404151] wlp3s0: authenticate with e4:6f:13:31:1d:2a
[ 4613.408674] wlp3s0: send auth to e4:6f:13:31:1d:2a (try 1/3)
[ 4613.411522] wlp3s0: authenticated
[ 4613.413312] wlp3s0: associate with e4:6f:13:31:1d:2a (try 1/3)
[ 4613.414632] wlp3s0: RX AssocResp from e4:6f:13:31:1d:2a (capab=0x401 status=0 aid=1)
[ 4613.414994] wlp3s0: AP has invalid WMM params (AIFSN=0 for ACI 0), will use 2
[ 4613.414998] wlp3s0: AP has invalid WMM params (CWmin/max=0/0 for ACI 0), using defaults
[ 4613.416832] wlp3s0: associated
[ 4613.576332] wlp3s0: Limiting TX power to 37 (40 - 3) dBm as advertised by e4:6f:13:31:1d:2a
[ 4614.297577] wlp3s0: disassociated from e4:6f:13:31:1d:2a (Reason: 8=DISASSOC_STA_HAS_LEFT)
[ 4647.189435] wlp3s0: authenticate with e4:6f:13:31:1d:2a
[ 4647.192572] wlp3s0: send auth to e4:6f:13:31:1d:2a (try 1/3)
[ 4647.194157] wlp3s0: authenticated
[ 4647.194800] wlp3s0: associate with e4:6f:13:31:1d:2a (try 1/3)
[ 4647.196142] wlp3s0: RX AssocResp from e4:6f:13:31:1d:2a (capab=0x411 status=0 aid=1)
[ 4647.196433] wlp3s0: AP has invalid WMM params (AIFSN=0 for ACI 0), will use 2
[ 4647.196437] wlp3s0: AP has invalid WMM params (CWmin/max=0/0 for ACI 0), using defaults
[ 4647.198002] wlp3s0: associated
[ 4647.222882] wlp3s0: Limiting TX power to 37 (40 - 3) dBm as advertised by e4:6f:13:31:1d:2a
[ 4647.573744] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[ 6533.649242] asus_wmi: Unknown key cf pressed
[ 8256.146503] usb 1-1: new high-speed USB device number 3 using xhci_hcd
[ 8256.274200] usb 1-1: New USB device found, idVendor=1d6c, idProduct=0103, bcdDevice= 0.10
[ 8256.274201] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 8256.274202] usb 1-1: Product: HD 4MP WEBCAM
[ 8256.274203] usb 1-1: Manufacturer: SHENZHEN Fullhan
[ 8256.274204] usb 1-1: SerialNumber: 20200506
[ 8256.327723] mc: Linux media interface: v0.10
[ 8256.348034] videodev: Linux video capture interface: v2.00
[ 8256.358166] usbcore: registered new interface driver snd-usb-audio
[ 8256.370296] uvcvideo: Found UVC 1.00 device HD 4MP WEBCAM (1d6c:0103)
[ 8261.696670] uvcvideo: Failed to set UVC probe control : -110 (exp. 26).
[ 8266.816709] uvcvideo: Failed to query (129) UVC probe control : -110 (exp. 26).
[ 8266.816714] uvcvideo: Failed to initialize the device (-5).
[ 8266.816936] usbcore: registered new interface driver uvcvideo
[ 8266.816940] USB Video Class driver (1.1.1)
[ 8277.056679] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8282.176842] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8287.296871] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8292.416760] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8297.537028] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8302.656913] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8307.776680] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8312.896616] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8318.016338] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8323.136576] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8328.256626] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8333.376513] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8338.496270] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8343.616343] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8348.736502] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8353.856490] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8358.976323] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8364.096095] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8369.216201] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8374.336087] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8379.457505] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8384.576313] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8389.696298] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8394.816214] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8399.936117] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8405.055799] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8410.176319] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8415.296037] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8420.416032] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8425.535913] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8430.655949] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8435.775947] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8440.895895] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8446.015571] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8451.135527] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8456.255526] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8461.375604] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8466.495455] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8471.615679] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8476.735652] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8481.855493] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8486.976399] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8492.095319] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8497.215691] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8502.335223] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8507.455521] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8512.575535] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8517.695440] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8522.815333] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8527.935364] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8533.055062] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8538.175340] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8543.296286] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8548.415187] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8553.535151] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8558.654914] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8563.775133] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8568.895106] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8574.014881] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8579.135195] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8584.255706] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8589.375005] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8594.495266] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8599.615037] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8604.734805] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8609.854991] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8614.974540] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8620.094483] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8625.215052] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8630.335461] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8635.454504] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8640.574831] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8645.694648] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8650.814726] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8655.934708] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8661.054282] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8666.174560] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8671.294202] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8676.414522] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8681.534673] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8686.654529] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8691.774663] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8696.894352] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8702.014115] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8707.134217] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8712.254226] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8717.375164] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8722.494301] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8727.613830] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8732.734055] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8737.854140] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8742.973793] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8748.093701] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8753.213709] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8758.333653] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8763.453825] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8768.574699] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8773.693605] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8778.813767] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8783.934905] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8789.053493] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8794.173723] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8799.293548] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8804.413719] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8809.533514] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8814.653553] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8819.773592] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8824.893501] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8830.013335] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8835.133562] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8840.253518] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8845.373557] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8850.493089] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8855.613441] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8860.733235] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8865.853037] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8870.973414] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8876.093886] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8881.213311] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8886.332809] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8891.452866] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8896.573361] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8901.693155] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8906.813059] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8911.933002] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8916.348584] threaded-ml[40908]: segfault at 24 ip 000055cc63a783b9 sp 00007f575bbb7510 error 4 in chrome[55cc62fc8000+7cd1000]
[ 8916.348601] Code: 01 00 00 5b 41 5c 41 5d 41 5e 41 5f 5d c3 e8 ce ad 21 07 cc cc cc cc cc cc cc cc cc cc cc cc cc cc 55 48 89 e5 53 50 48 89 d3 <8b> 46 24 89 82 c8 00 00 00 0f b6 46 28 89 82 cc 00 00 00 48 8b 76
[ 8917.053044] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8922.172933] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8927.292879] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8932.412770] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8937.532885] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8942.652856] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8947.772780] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8952.892563] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8958.012623] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8963.132598] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8968.252583] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8973.372557] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8978.492771] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8983.612676] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8988.732484] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8993.852355] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 8998.972399] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9004.092606] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9009.212058] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9014.332031] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9019.452103] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9024.572346] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9029.692206] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9034.812192] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9039.932351] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9045.052262] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9050.172125] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9055.292223] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9060.412217] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9065.531957] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9070.651906] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9075.771772] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9080.892047] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9086.012131] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9091.131976] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9096.251815] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9101.372018] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9106.492084] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9111.611804] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9116.731776] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9121.851681] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9126.971475] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9132.091301] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9137.211358] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9142.331382] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9147.451232] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9152.571365] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9157.691489] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9162.811613] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9167.931176] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9173.051202] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9178.172006] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9183.291132] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9188.411838] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9193.531372] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9198.651238] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9203.771132] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9208.891249] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9214.011273] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9219.131803] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9224.250960] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9229.370909] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9234.490833] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9239.610993] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9244.731070] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9249.850894] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9254.971039] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9260.091318] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9265.210576] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9270.330468] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9275.450795] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9280.570748] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9285.690726] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9290.810807] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9295.930584] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9301.050390] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9306.170353] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9311.290568] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9316.410510] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9321.530254] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9326.651371] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9331.770515] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9336.890352] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9342.011243] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9347.130357] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9352.250283] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9357.370015] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9362.490315] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9367.609884] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9372.730010] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9377.849930] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9382.969917] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9388.089751] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9393.209922] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9398.329703] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9403.449581] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9408.569932] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9413.689976] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9418.809884] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9423.929817] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9429.049674] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9434.169729] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9439.289586] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9444.409714] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9449.529656] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9454.650580] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9459.769328] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9464.889512] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9470.010500] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9475.129487] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9480.250077] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9485.369459] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9490.489093] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9495.609347] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9500.729475] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9505.849357] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9510.969618] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9516.090246] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9521.209000] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9526.328864] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9531.448873] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9536.569306] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9541.689004] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9546.809082] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9551.928856] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9557.049347] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9562.168910] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9567.289140] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9572.408861] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9577.528963] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9582.648962] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9584.167988] i2c_hid i2c-FTE1001:00: i2c_hid_get_input: incomplete report (30/4160)
[ 9587.768524] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9592.889696] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9598.008435] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9603.128446] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9608.248614] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9613.368495] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9618.488278] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9623.608319] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9628.728441] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9633.848284] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9638.968134] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9644.088275] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9649.209070] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9654.329134] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9659.448397] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9664.568199] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9669.688192] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9674.808245] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9679.928135] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9685.048124] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9690.167979] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9695.288046] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9700.409361] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9705.528118] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9710.647983] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9715.768002] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9720.887854] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9726.007884] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9731.127914] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9736.247856] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9741.367908] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9746.487858] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9751.607870] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9756.727684] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9761.847815] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9766.967584] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9772.087999] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9777.208320] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9782.327334] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9787.447535] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9792.567524] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9797.687477] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9802.807393] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9807.927291] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9813.047624] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9818.167446] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9823.287326] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9828.407258] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9833.528149] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9838.647288] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9843.766983] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9848.887276] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9854.006996] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9859.127140] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9864.247037] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9869.366958] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9874.486839] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9879.606897] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9884.727077] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9889.847843] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9894.966785] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9900.086709] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9905.206541] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9910.326489] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9915.447472] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9920.567037] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9925.686440] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9930.806817] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9935.926430] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9941.046448] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9946.166394] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9951.286598] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9956.406451] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9961.527527] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9966.646351] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9971.767420] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9976.886241] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9982.006166] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9987.126379] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9992.246086] usb 1-1: 3:1: usb_set_interface failed (-110)
[ 9997.366240] usb 1-1: 3:1: usb_set_interface failed (-110)
[10002.486181] usb 1-1: 3:1: usb_set_interface failed (-110)
[10007.606370] usb 1-1: 3:1: usb_set_interface failed (-110)
[10012.726169] usb 1-1: 3:1: usb_set_interface failed (-110)
[10017.846480] usb 1-1: 3:1: usb_set_interface failed (-110)
[10022.965923] usb 1-1: 3:1: usb_set_interface failed (-110)
[10028.085771] usb 1-1: 3:1: usb_set_interface failed (-110)
[10033.205872] usb 1-1: 3:1: usb_set_interface failed (-110)
[10038.325965] usb 1-1: 3:1: usb_set_interface failed (-110)
[10043.445833] usb 1-1: 3:1: usb_set_interface failed (-110)
[10048.566137] usb 1-1: 3:1: usb_set_interface failed (-110)
[10053.686158] usb 1-1: 3:1: usb_set_interface failed (-110)
[10058.805747] usb 1-1: 3:1: usb_set_interface failed (-110)
[10063.925929] usb 1-1: 3:1: usb_set_interface failed (-110)
[10069.046052] usb 1-1: 3:1: usb_set_interface failed (-110)
[10074.165638] usb 1-1: 3:1: usb_set_interface failed (-110)
[10079.285649] usb 1-1: 3:1: usb_set_interface failed (-110)
[10084.405645] usb 1-1: 3:1: usb_set_interface failed (-110)
[10089.525962] usb 1-1: 3:1: usb_set_interface failed (-110)
[10094.645866] usb 1-1: 3:1: usb_set_interface failed (-110)
[10099.765643] usb 1-1: 3:1: usb_set_interface failed (-110)
[10104.885303] usb 1-1: 3:1: usb_set_interface failed (-110)
[10110.005548] usb 1-1: 3:1: usb_set_interface failed (-110)
[10115.125477] usb 1-1: 3:1: usb_set_interface failed (-110)
[10120.245499] usb 1-1: 3:1: usb_set_interface failed (-110)
[10125.365213] usb 1-1: 3:1: usb_set_interface failed (-110)
[10130.485578] usb 1-1: 3:1: usb_set_interface failed (-110)
[10135.605591] usb 1-1: 3:1: usb_set_interface failed (-110)
[10140.725250] usb 1-1: 3:1: usb_set_interface failed (-110)
[10145.845159] usb 1-1: 3:1: usb_set_interface failed (-110)
[10150.965452] usb 1-1: 3:1: usb_set_interface failed (-110)
[10156.084961] usb 1-1: 3:1: usb_set_interface failed (-110)
[10161.204978] usb 1-1: 3:1: usb_set_interface failed (-110)
[10166.324893] usb 1-1: 3:1: usb_set_interface failed (-110)
[10171.445306] usb 1-1: 3:1: usb_set_interface failed (-110)
[10176.565407] usb 1-1: 3:1: usb_set_interface failed (-110)
[10181.685028] usb 1-1: 3:1: usb_set_interface failed (-110)
[10186.805074] usb 1-1: 3:1: usb_set_interface failed (-110)
[10191.925071] usb 1-1: 3:1: usb_set_interface failed (-110)
[10197.044753] usb 1-1: 3:1: usb_set_interface failed (-110)
[10202.164913] usb 1-1: 3:1: usb_set_interface failed (-110)
[10207.284969] usb 1-1: 3:1: usb_set_interface failed (-110)
[10212.404770] usb 1-1: 3:1: usb_set_interface failed (-110)
[10217.524830] usb 1-1: 3:1: usb_set_interface failed (-110)
[10222.644996] usb 1-1: 3:1: usb_set_interface failed (-110)
[10227.764954] usb 1-1: 3:1: usb_set_interface failed (-110)
[10232.884697] usb 1-1: 3:1: usb_set_interface failed (-110)
[10238.004723] usb 1-1: 3:1: usb_set_interface failed (-110)
[10243.124842] usb 1-1: 3:1: usb_set_interface failed (-110)
[10248.245587] usb 1-1: 3:1: usb_set_interface failed (-110)
[10253.364631] usb 1-1: 3:1: usb_set_interface failed (-110)
[10258.484578] usb 1-1: 3:1: usb_set_interface failed (-110)
[10263.604501] usb 1-1: 3:1: usb_set_interface failed (-110)
[10268.724526] usb 1-1: 3:1: usb_set_interface failed (-110)
[10273.844554] usb 1-1: 3:1: usb_set_interface failed (-110)
[10278.965491] usb 1-1: 3:1: usb_set_interface failed (-110)
[10284.084503] usb 1-1: 3:1: usb_set_interface failed (-110)
[10289.204310] usb 1-1: 3:1: usb_set_interface failed (-110)
[10294.324082] usb 1-1: 3:1: usb_set_interface failed (-110)
[10299.444210] usb 1-1: 3:1: usb_set_interface failed (-110)
[10304.564207] usb 1-1: 3:1: usb_set_interface failed (-110)
[10309.684173] usb 1-1: 3:1: usb_set_interface failed (-110)
[10314.804418] usb 1-1: 3:1: usb_set_interface failed (-110)
[10319.924181] usb 1-1: 3:1: usb_set_interface failed (-110)
[10325.044201] usb 1-1: 3:1: usb_set_interface failed (-110)
[10330.164140] usb 1-1: 3:1: usb_set_interface failed (-110)
[10335.285038] usb 1-1: 3:1: usb_set_interface failed (-110)
[10340.404063] usb 1-1: 3:1: usb_set_interface failed (-110)
[10345.523891] usb 1-1: 3:1: usb_set_interface failed (-110)
[10350.644050] usb 1-1: 3:1: usb_set_interface failed (-110)
[10355.763831] usb 1-1: 3:1: usb_set_interface failed (-110)
[10360.884804] usb 1-1: 3:1: usb_set_interface failed (-110)
[10366.003826] usb 1-1: 3:1: usb_set_interface failed (-110)
[10371.123964] usb 1-1: 3:1: usb_set_interface failed (-110)
[10376.243782] usb 1-1: 3:1: usb_set_interface failed (-110)
[10381.363625] usb 1-1: 3:1: usb_set_interface failed (-110)
[10386.483635] usb 1-1: 3:1: usb_set_interface failed (-110)
[10391.603716] usb 1-1: 3:1: usb_set_interface failed (-110)
[10396.724773] usb 1-1: 3:1: usb_set_interface failed (-110)
[10401.843657] usb 1-1: 3:1: usb_set_interface failed (-110)
[10406.964309] usb 1-1: 3:1: usb_set_interface failed (-110)
[10412.083423] usb 1-1: 3:1: usb_set_interface failed (-110)
[10417.203351] usb 1-1: 3:1: usb_set_interface failed (-110)
[10422.323501] usb 1-1: 3:1: usb_set_interface failed (-110)
[10427.443506] usb 1-1: 3:1: usb_set_interface failed (-110)
[10432.563643] usb 1-1: 3:1: usb_set_interface failed (-110)
[10437.683686] usb 1-1: 3:1: usb_set_interface failed (-110)
[10442.803542] usb 1-1: 3:1: usb_set_interface failed (-110)
[10447.923297] usb 1-1: 3:1: usb_set_interface failed (-110)
[10453.043290] usb 1-1: 3:1: usb_set_interface failed (-110)
[10458.163351] usb 1-1: 3:1: usb_set_interface failed (-110)
[10463.283210] usb 1-1: 3:1: usb_set_interface failed (-110)
[10468.403238] usb 1-1: 3:1: usb_set_interface failed (-110)
[10473.523227] usb 1-1: 3:1: usb_set_interface failed (-110)
[10478.643194] usb 1-1: 3:1: usb_set_interface failed (-110)
[10483.763139] usb 1-1: 3:1: usb_set_interface failed (-110)
[10488.883095] usb 1-1: 3:1: usb_set_interface failed (-110)
[10494.003053] usb 1-1: 3:1: usb_set_interface failed (-110)
[10499.122897] usb 1-1: 3:1: usb_set_interface failed (-110)
[10504.244016] usb 1-1: 3:1: usb_set_interface failed (-110)
[10509.362998] usb 1-1: 3:1: usb_set_interface failed (-110)
[10514.483151] usb 1-1: 3:1: usb_set_interface failed (-110)
[10519.602853] usb 1-1: 3:1: usb_set_interface failed (-110)
[10524.722973] usb 1-1: 3:1: usb_set_interface failed (-110)
[10529.842877] usb 1-1: 3:1: usb_set_interface failed (-110)
[10534.963016] usb 1-1: 3:1: usb_set_interface failed (-110)
[10540.082824] usb 1-1: 3:1: usb_set_interface failed (-110)
[10545.202545] usb 1-1: 3:1: usb_set_interface failed (-110)
[10550.323472] usb 1-1: 3:1: usb_set_interface failed (-110)
[10555.442911] usb 1-1: 3:1: usb_set_interface failed (-110)
[10560.562662] usb 1-1: 3:1: usb_set_interface failed (-110)
[10565.682588] usb 1-1: 3:1: usb_set_interface failed (-110)
[10570.802649] usb 1-1: 3:1: usb_set_interface failed (-110)
[10575.922565] usb 1-1: 3:1: usb_set_interface failed (-110)
[10581.042690] usb 1-1: 3:1: usb_set_interface failed (-110)
[10586.162364] usb 1-1: 3:1: usb_set_interface failed (-110)
[10591.282464] usb 1-1: 3:1: usb_set_interface failed (-110)
[10596.402581] usb 1-1: 3:1: usb_set_interface failed (-110)
[10601.522422] usb 1-1: 3:1: usb_set_interface failed (-110)
[10606.642335] usb 1-1: 3:1: usb_set_interface failed (-110)
[10611.762395] usb 1-1: 3:1: usb_set_interface failed (-110)
[10616.882404] usb 1-1: 3:1: usb_set_interface failed (-110)
[10622.002321] usb 1-1: 3:1: usb_set_interface failed (-110)
[10627.122452] usb 1-1: 3:1: usb_set_interface failed (-110)
[10632.243206] usb 1-1: 3:1: usb_set_interface failed (-110)
[10637.362183] usb 1-1: 3:1: usb_set_interface failed (-110)
[10642.482319] usb 1-1: 3:1: usb_set_interface failed (-110)
[10647.602132] usb 1-1: 3:1: usb_set_interface failed (-110)
[10652.723091] usb 1-1: 3:1: usb_set_interface failed (-110)
[10657.842132] usb 1-1: 3:1: usb_set_interface failed (-110)
[10662.962052] usb 1-1: 3:1: usb_set_interface failed (-110)
[10668.082316] usb 1-1: 3:1: usb_set_interface failed (-110)
[10673.202686] usb 1-1: 3:1: usb_set_interface failed (-110)
[10678.322360] usb 1-1: 3:1: usb_set_interface failed (-110)
[10683.441932] usb 1-1: 3:1: usb_set_interface failed (-110)
[10688.562100] usb 1-1: 3:1: usb_set_interface failed (-110)
[10693.681822] usb 1-1: 3:1: usb_set_interface failed (-110)
[10698.801807] usb 1-1: 3:1: usb_set_interface failed (-110)
[10703.921852] usb 1-1: 3:1: usb_set_interface failed (-110)
[10709.041790] usb 1-1: 3:1: usb_set_interface failed (-110)
[10714.161775] usb 1-1: 3:1: usb_set_interface failed (-110)
[10719.281407] usb 1-1: 3:1: usb_set_interface failed (-110)
[10724.401799] usb 1-1: 3:1: usb_set_interface failed (-110)
[10729.521958] usb 1-1: 3:1: usb_set_interface failed (-110)
[10734.641678] usb 1-1: 3:1: usb_set_interface failed (-110)
[10739.761623] usb 1-1: 3:1: usb_set_interface failed (-110)
[10744.881529] usb 1-1: 3:1: usb_set_interface failed (-110)
[10750.001467] usb 1-1: 3:1: usb_set_interface failed (-110)
[10755.121483] usb 1-1: 3:1: usb_set_interface failed (-110)
[10760.242173] usb 1-1: 3:1: usb_set_interface failed (-110)
[10765.361856] usb 1-1: 3:1: usb_set_interface failed (-110)
[10770.481847] usb 1-1: 3:1: usb_set_interface failed (-110)
[10775.601323] usb 1-1: 3:1: usb_set_interface failed (-110)
[10780.721343] usb 1-1: 3:1: usb_set_interface failed (-110)
[10785.841313] usb 1-1: 3:1: usb_set_interface failed (-110)
[10790.961516] usb 1-1: 3:1: usb_set_interface failed (-110)
[10796.080906] usb 1-1: 3:1: usb_set_interface failed (-110)
[10801.200996] usb 1-1: 3:1: usb_set_interface failed (-110)
[10806.320903] usb 1-1: 3:1: usb_set_interface failed (-110)
[10811.441137] usb 1-1: 3:1: usb_set_interface failed (-110)
[10816.561054] usb 1-1: 3:1: usb_set_interface failed (-110)
[10821.680978] usb 1-1: 3:1: usb_set_interface failed (-110)
[10826.801138] usb 1-1: 3:1: usb_set_interface failed (-110)
[10831.921137] usb 1-1: 3:1: usb_set_interface failed (-110)
[10837.040757] usb 1-1: 3:1: usb_set_interface failed (-110)
[10842.160712] usb 1-1: 3:1: usb_set_interface failed (-110)
[10847.281017] usb 1-1: 3:1: usb_set_interface failed (-110)
[10852.402024] usb 1-1: 3:1: usb_set_interface failed (-110)
[10857.521047] usb 1-1: 3:1: usb_set_interface failed (-110)
[10862.640919] usb 1-1: 3:1: usb_set_interface failed (-110)
[10867.760845] usb 1-1: 3:1: usb_set_interface failed (-110)
[10872.880603] usb 1-1: 3:1: usb_set_interface failed (-110)
[10878.000509] usb 1-1: 3:1: usb_set_interface failed (-110)
[10883.120538] usb 1-1: 3:1: usb_set_interface failed (-110)
[10888.240599] usb 1-1: 3:1: usb_set_interface failed (-110)
[10893.360575] usb 1-1: 3:1: usb_set_interface failed (-110)
[10898.480599] usb 1-1: 3:1: usb_set_interface failed (-110)
[10903.600581] usb 1-1: 3:1: usb_set_interface failed (-110)
[10908.720687] usb 1-1: 3:1: usb_set_interface failed (-110)
[10913.840453] usb 1-1: 3:1: usb_set_interface failed (-110)
[10918.960635] usb 1-1: 3:1: usb_set_interface failed (-110)
[10924.080401] usb 1-1: 3:1: usb_set_interface failed (-110)
[10929.200117] usb 1-1: 3:1: usb_set_interface failed (-110)
[10934.320118] usb 1-1: 3:1: usb_set_interface failed (-110)
[10939.440458] usb 1-1: 3:1: usb_set_interface failed (-110)
[10944.560325] usb 1-1: 3:1: usb_set_interface failed (-110)
[10949.680532] usb 1-1: 3:1: usb_set_interface failed (-110)
[10954.800425] usb 1-1: 3:1: usb_set_interface failed (-110)
[10959.920225] usb 1-1: 3:1: usb_set_interface failed (-110)
[10965.039936] usb 1-1: 3:1: usb_set_interface failed (-110)
[10970.160047] usb 1-1: 3:1: usb_set_interface failed (-110)
[10975.280071] usb 1-1: 3:1: usb_set_interface failed (-110)
[10980.400287] usb 1-1: 3:1: usb_set_interface failed (-110)
[10985.520076] usb 1-1: 3:1: usb_set_interface failed (-110)
[10990.640122] usb 1-1: 3:1: usb_set_interface failed (-110)
[10995.760202] usb 1-1: 3:1: usb_set_interface failed (-110)
[11000.879998] usb 1-1: 3:1: usb_set_interface failed (-110)
[11005.999878] usb 1-1: 3:1: usb_set_interface failed (-110)
[11011.119819] usb 1-1: 3:1: usb_set_interface failed (-110)
[11016.240056] usb 1-1: 3:1: usb_set_interface failed (-110)
[11021.359783] usb 1-1: 3:1: usb_set_interface failed (-110)
[11026.479962] usb 1-1: 3:1: usb_set_interface failed (-110)
[11031.599691] usb 1-1: 3:1: usb_set_interface failed (-110)
[11036.719696] usb 1-1: 3:1: usb_set_interface failed (-110)
[11041.839613] usb 1-1: 3:1: usb_set_interface failed (-110)
[11046.959772] usb 1-1: 3:1: usb_set_interface failed (-110)
[11052.079690] usb 1-1: 3:1: usb_set_interface failed (-110)
[11057.199419] usb 1-1: 3:1: usb_set_interface failed (-110)
[11062.319265] usb 1-1: 3:1: usb_set_interface failed (-110)
[11067.439537] usb 1-1: 3:1: usb_set_interface failed (-110)
[11072.559491] usb 1-1: 3:1: usb_set_interface failed (-110)
[11077.679419] usb 1-1: 3:1: usb_set_interface failed (-110)
[11082.799378] usb 1-1: 3:1: usb_set_interface failed (-110)
[11087.919450] usb 1-1: 3:1: usb_set_interface failed (-110)
[11093.039244] usb 1-1: 3:1: usb_set_interface failed (-110)
[11098.159249] usb 1-1: 3:1: usb_set_interface failed (-110)
[11103.279254] usb 1-1: 3:1: usb_set_interface failed (-110)
[11108.399483] usb 1-1: 3:1: usb_set_interface failed (-110)
[11113.519262] usb 1-1: 3:1: usb_set_interface failed (-110)
[11118.639272] usb 1-1: 3:1: usb_set_interface failed (-110)
[11123.759316] usb 1-1: 3:1: usb_set_interface failed (-110)
[11128.879102] usb 1-1: 3:1: usb_set_interface failed (-110)
[11133.999100] usb 1-1: 3:1: usb_set_interface failed (-110)
[11139.119088] usb 1-1: 3:1: usb_set_interface failed (-110)
[11144.239209] usb 1-1: 3:1: usb_set_interface failed (-110)
[11149.359215] usb 1-1: 3:1: usb_set_interface failed (-110)
[11154.478986] usb 1-1: 3:1: usb_set_interface failed (-110)
[11159.599777] usb 1-1: 3:1: usb_set_interface failed (-110)
[11164.718840] usb 1-1: 3:1: usb_set_interface failed (-110)
[11169.838895] usb 1-1: 3:1: usb_set_interface failed (-110)
[11174.958937] usb 1-1: 3:1: usb_set_interface failed (-110)
[11180.078808] usb 1-1: 3:1: usb_set_interface failed (-110)
[11185.198475] usb 1-1: 3:1: usb_set_interface failed (-110)
[11190.318492] usb 1-1: 3:1: usb_set_interface failed (-110)
[11195.438960] usb 1-1: 3:1: usb_set_interface failed (-110)
[11200.558929] usb 1-1: 3:1: usb_set_interface failed (-110)
[11205.678711] usb 1-1: 3:1: usb_set_interface failed (-110)
[11210.798755] usb 1-1: 3:1: usb_set_interface failed (-110)
[11215.918740] usb 1-1: 3:1: usb_set_interface failed (-110)
[11221.038648] usb 1-1: 3:1: usb_set_interface failed (-110)
[11226.158360] usb 1-1: 3:1: usb_set_interface failed (-110)
[11231.278647] usb 1-1: 3:1: usb_set_interface failed (-110)
[11236.398388] usb 1-1: 3:1: usb_set_interface failed (-110)
[11241.518639] usb 1-1: 3:1: usb_set_interface failed (-110)
[11246.638595] usb 1-1: 3:1: usb_set_interface failed (-110)
[11251.758279] usb 1-1: 3:1: usb_set_interface failed (-110)
[11256.878400] usb 1-1: 3:1: usb_set_interface failed (-110)
[11261.998298] usb 1-1: 3:1: usb_set_interface failed (-110)
[11267.118343] usb 1-1: 3:1: usb_set_interface failed (-110)
[11272.238230] usb 1-1: 3:1: usb_set_interface failed (-110)
[11277.358392] usb 1-1: 3:1: usb_set_interface failed (-110)
[11280.309866] usb 1-1: 3:1: usb_set_interface failed (-71)
[11280.309875] usb 1-1: USB disconnect, device number 3
[11285.311748] usb 1-1: new high-speed USB device number 4 using xhci_hcd
[11285.439432] usb 1-1: New USB device found, idVendor=1d6c, idProduct=0103, bcdDevice= 0.10
[11285.439442] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[11285.439447] usb 1-1: Product: HD 4MP WEBCAM
[11285.439451] usb 1-1: Manufacturer: SHENZHEN Fullhan
[11285.439455] usb 1-1: SerialNumber: 20200506
[11285.440686] uvcvideo: Probing generic UVC device 1
[11285.440875] uvcvideo: Found format MJPEG.
[11285.440879] uvcvideo: - 1920x1080 (30.0 fps)
[11285.440882] uvcvideo: - 2560x1440 (30.0 fps)
[11285.440885] uvcvideo: - 320x240 (30.0 fps)
[11285.440888] uvcvideo: - 640x360 (30.0 fps)
[11285.440891] uvcvideo: - 640x480 (30.0 fps)
[11285.440893] uvcvideo: - 800x600 (30.0 fps)
[11285.440896] uvcvideo: - 960x720 (30.0 fps)
[11285.440899] uvcvideo: - 1024x576 (30.0 fps)
[11285.440902] uvcvideo: - 1280x720 (30.0 fps)
[11285.440904] uvcvideo: - 1920x1080 (30.0 fps)
[11285.440907] uvcvideo: - 2560x1440 (30.0 fps)
[11285.440910] uvcvideo: - 1920x1080 (30.0 fps)
[11285.440913] uvcvideo: Found format H.264.
[11285.440916] uvcvideo: - 1920x1080 (30.0 fps)
[11285.440919] uvcvideo: - 2560x1440 (30.0 fps)
[11285.440922] uvcvideo: - 320x240 (30.0 fps)
[11285.440925] uvcvideo: - 640x360 (30.0 fps)
[11285.440927] uvcvideo: - 640x480 (30.0 fps)
[11285.440930] uvcvideo: - 800x600 (30.0 fps)
[11285.440933] uvcvideo: - 960x720 (30.0 fps)
[11285.440936] uvcvideo: - 1024x576 (30.0 fps)
[11285.440938] uvcvideo: - 1280x720 (30.0 fps)
[11285.440941] uvcvideo: - 1920x1080 (30.0 fps)
[11285.440944] uvcvideo: - 2560x1440 (30.0 fps)
[11285.440947] uvcvideo: - 1920x1080 (30.0 fps)
[11285.440949] uvcvideo: Found format YUV 4:2:2 (YUYV).
[11285.440952] uvcvideo: - 1280x720 (30.0 fps)
[11285.440955] uvcvideo: - 640x480 (30.0 fps)
[11285.440957] uvcvideo: - 320x240 (30.0 fps)
[11285.440960] uvcvideo: - 640x360 (30.0 fps)
[11285.440963] uvcvideo: - 640x480 (30.0 fps)
[11285.440966] uvcvideo: - 800x600 (30.0 fps)
[11285.440968] uvcvideo: - 960x720 (30.0 fps)
[11285.440971] uvcvideo: - 1024x576 (30.0 fps)
[11285.440974] uvcvideo: - 1280x720 (30.0 fps)
[11285.440977] uvcvideo: - 640x480 (30.0 fps)
[11285.440980] uvcvideo: - 1280x720 (30.0 fps)
[11285.440989] uvcvideo: Found a Status endpoint (addr 81).
[11285.440993] uvcvideo: Found UVC 1.00 device HD 4MP WEBCAM (1d6c:0103)
[11285.441004] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1 entity 1
[11285.442785] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[11285.442790] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 1 entity 1
[11285.442952] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[11285.442956] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1 entity 2
[11285.443095] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[11285.443098] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1 entity 2
[11285.443236] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[11285.443239] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1 entity 2
[11285.443398] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[11285.443401] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1 entity 2
[11285.443538] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[11285.443544] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1 entity 2
[11285.443742] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[11285.443746] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 1 entity 2
[11285.443951] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[11285.443956] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1 entity 2
[11285.444106] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[11285.444109] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1 entity 2
[11285.444250] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[11285.444255] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[11285.444264] uvcvideo: Found a valid video chain (1 -> 4).
[11285.445162] input: HD 4MP WEBCAM: HD 4MP WEBCAM as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/input/input17
[11285.445269] uvcvideo: UVC device initialized.
[11285.584504] uvcvideo: uvc_v4l2_open
[11285.599289] uvcvideo: uvc_v4l2_release
[11285.725852] uvcvideo: uvc_v4l2_open
[11285.725986] uvcvideo: Control 0x009a0908 not found.
[11285.725988] uvcvideo: Control 0x009a0909 not found.
[11285.725990] uvcvideo: Control 0x009a090d not found.
[11285.726217] uvcvideo: uvc_v4l2_release
[11285.744719] uvcvideo: uvc_v4l2_open
[11285.744850] uvcvideo: Control 0x009a0908 not found.
[11285.744852] uvcvideo: Control 0x009a0909 not found.
[11285.744854] uvcvideo: Control 0x009a090d not found.
[11285.745047] uvcvideo: uvc_v4l2_release
[11293.111595] uvcvideo: Suspending interface 1
[11293.111596] uvcvideo: Suspending interface 0

--------------2D33F71842D103E03CA83437--
