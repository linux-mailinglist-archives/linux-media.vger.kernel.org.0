Return-Path: <linux-media+bounces-16858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EC395F971
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 21:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56F632817AE
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E2F1991B0;
	Mon, 26 Aug 2024 19:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OtroHv7S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E893D18E058
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724699571; cv=none; b=LhXzjNN1DMjUtjnWcx/54l6BzCg2imuiVKMqnuS94TTN6Mw94OTmsMYsQH49AR3Q4DB5jAVFbtNPhdvEbxHfsB5IOrylE3aZ1glKRsUl4zX0B/zvTs1O5lLwZ59AIS4h8GGkdTUiL9DVWSbU74Au0MdikYnAHhAFN0qJ1A7Uz/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724699571; c=relaxed/simple;
	bh=R1sZ1CLxLxzR6HPJOFrsmd/I7uERxFJ/4RQlv3c3O+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqRPuXhzsOnPE6OtYtej2lY+bwiz95iTm2E+cUG4AFNCSeZhjeWRsY3unr0OCz5zNPpl7T8ZAnAxZS2+5Mf5vNyanX1YgtK38yG3J2GhmuoUAT3cUZX/8Q12LhAmkZ6eR8KrJpthF6dITMWXdD1dHkaSeUCgyjihsU2/M6DhqT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OtroHv7S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 581596CA;
	Mon, 26 Aug 2024 21:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724699499;
	bh=R1sZ1CLxLxzR6HPJOFrsmd/I7uERxFJ/4RQlv3c3O+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtroHv7S1YeNwezw86wb3CCBXk79D7r9pVgtuFDN1K9vwGNnB1LL2XmMYLVi/v+9l
	 7rlelyF4pWKRlEwSwxh+8Wm6agVC+ZTUqreAAQLWIwFeIa6pTfjIjpwggeQrm2IPVG
	 u/nCVXdjBfhyabbGYuCtX8yhTYxxhaMvyA4++VUk=
Date: Mon, 26 Aug 2024 22:12:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Perchanov <dmitry.perchanov@intel.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@iki.fi,
	demisrael@gmail.com
Subject: Re: [PATCH] media: uvcvideo: RealSense D421 Depth module metadata.
Message-ID: <20240826191242.GA7878@pendragon.ideasonboard.com>
References: <d1fbfbbff5c8247a3130499985a53218c5b55c61.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d1fbfbbff5c8247a3130499985a53218c5b55c61.camel@intel.com>

Hi Dmitry,

Thank you for the patch.

On Mon, Aug 26, 2024 at 05:27:50PM +0300, Dmitry Perchanov wrote:
> RealSense(R) D421 Depth module is low cost solution for 3D-stereo vision.
> The module supports extended sensor metadata format D4XX.
> USB descriptor: https://paste.debian.net/1327587/

Thank you for providing the USB descriptors.

As we can't guarantee the link will stay valid for a long time, I'll
drop it from the commit message when applying if that's fine with you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Here are the contents, to make sure they get recorded and indexed on
lore.kernel.org:

Bus 002 Device 007: ID 8086:1155 Intel Corp. Intel(R) RealSense(TM) Depth Camera 421
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x8086 Intel Corp.
  idProduct          0x1155
  bcdDevice           51.01
  iManufacturer           1 Intel(R) RealSense(TM) Depth Camera 421
  iProduct                2 Intel(R) RealSense(TM) Depth Camera 421
  iSerial                 3 012345678901
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x09a3
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              720mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               5 Intel(R) RealSense(TM) Depth Camera 421  Depth
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0
      iInterface              5 Intel(R) RealSense(TM) Depth Camera 421  Depth
      VideoControl Interface Descriptor:
        bLength                14
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.50
        wTotalLength       0x005b
        dwClockFrequency       48.000000MHz
        bInCollection           2
        baInterfaceNr( 0)       1
        baInterfaceNr( 1)       2
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
        bmControls           0x00200000
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            3
        bmControls     0x00000200
          Gain
        iProcessing             0
        bmVideoStandards     0x00
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {c9606ccb-594c-4d25-af47-ccc496435995}
        bNumControls           17
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            3
        bmControls( 0)       0xff
        bmControls( 1)       0xdd
        bmControls( 2)       0x01
        iExtension              6 Intel(R) RealSense(TM) Depth Camera 421  RGB
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             5
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               6
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              5 Intel(R) RealSense(TM) Depth Camera 421  Depth
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x02f3
        bEndpointAddress                 0x82  EP 2 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                8
        guidFormat                            {2036315a-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 53084160
        dwMaxBitRate                176947200
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    512
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            111111
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                8
        guidFormat                            {00000050-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            256
        wHeight                           144
        dwMinBitRate                 53084160
        dwMaxBitRate                176947200
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    512
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            111111
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              8 Intel(R) RealSense(TM) Depth Camera 421  Y
      VideoStreaming Interface Descriptor:
        bLength                            18
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         5
        wTotalLength                   0x05da
        bEndpointAddress                 0x83  EP 3 IN
        bmInfo                              0
        bTerminalLink                       5
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
        bmaControls( 2)                     0
        bmaControls( 3)                     0
        bmaControls( 4)                     0
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        1
        bNumFrameDescriptors                7
        guidFormat                            {00000032-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       8
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  4884480
        dwMaxBitRate                 73267200
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    424
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                  6220800
        dwMaxBitRate                 93312000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    480
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 11059200
        dwMaxBitRate                165888000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 14745600
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                 67840000
        dwMaxBitRate                203520000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    848
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 19537920
        dwMaxBitRate                293068800
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 44236800
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                7
        guidFormat                            {59565955-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors                7
        guidFormat                            {20203859-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       8
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  4884480
        dwMaxBitRate                 73267200
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    424
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                  6220800
        dwMaxBitRate                 93312000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    480
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 11059200
        dwMaxBitRate                165888000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 14745600
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    640
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                 67840000
        dwMaxBitRate                203520000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                    848
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 19537920
        dwMaxBitRate                293068800
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 44236800
        dwMaxBitRate                221184000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        4
        bNumFrameDescriptors                8
        guidFormat                            {20493859-0000-0010-8000-00aa00389b71}
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
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  9768960
        dwMaxBitRate                146534400
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    848
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            480
        wHeight                           270
        dwMinBitRate                 12441600
        dwMaxBitRate                186624000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                    960
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 22118400
        dwMaxBitRate                331776000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1280
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           100
        dwMinBitRate                135680000
        dwMaxBitRate                407040000
        dwDefaultFrameInterval          33333
        bFrameIntervalType                  2
        dwBytesPerLine                   1696
        dwFrameInterval( 0)             33333
        dwFrameInterval( 1)            100000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 39075840
        dwMaxBitRate                586137600
        dwDefaultFrameInterval         111111
        bFrameIntervalType                  5
        dwBytesPerLine                   1696
        dwFrameInterval( 0)            111111
        dwFrameInterval( 1)            166666
        dwFrameInterval( 2)            333333
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 88473600
        dwMaxBitRate                442368000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  3
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
        dwFrameInterval( 2)           1666665
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                245760000
        dwMaxBitRate                491520000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  2
        dwBytesPerLine                   2560
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        5
        bNumFrameDescriptors                2
        guidFormat                            {49323159-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      24
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           400
        dwMinBitRate                 92160000
        dwMaxBitRate                153600000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                   1920
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                368640000
        dwMaxBitRate                614400000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                   3840
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            666666
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     0 (Unspecified)
        bTransferCharacteristics            0 (Unspecified)
        bMatrixCoefficients                 0 (Unspecified)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0032
  bNumDeviceCaps          3
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000c
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   3
      Lowest fully-functional device speed is SuperSpeed (5Gbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
  Platform Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType      5
    bReserved               0
    PlatformCapabilityUUID    {d8dd60df-4589-4cc7-9cd2-659d9e648a9f}
    CapabilityData[0]    0x00
    CapabilityData[1]    0x00
    CapabilityData[2]    0x03
    CapabilityData[3]    0x06
    CapabilityData[4]    0x44
    CapabilityData[5]    0x02
    CapabilityData[6]    0x20
    CapabilityData[7]    0x00
Device Status:     0x0000
  (Bus Powered)

> 
> Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08c2d..427fa5759c3f 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3072,6 +3072,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +	/* Intel D421 Depth Module */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x8086,
> +	  .idProduct		= 0x1155,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>  	/* Generic USB Video Class */
>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },

-- 
Regards,

Laurent Pinchart

