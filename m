Return-Path: <linux-media+bounces-48384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F48CACD3F
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 11:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04FAB3052B30
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 10:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B0130102B;
	Mon,  8 Dec 2025 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYbgLihu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533B22DBF7C;
	Mon,  8 Dec 2025 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765188702; cv=none; b=Gpho2+r2Y0Ks404f9SpulxPEc9cilQuZ1kuHarp9SUqdTglPh2ViZOCSYEsD97sF7Yvlios9sgYcxBcDW4eAO/RmZCgZESuo8rqk+35QyTAU0hoP1twT5Mc2qmowEtamYYH6dxq28/Mjp1UKV+aFye3maLjwTWOq23rC5FpkCtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765188702; c=relaxed/simple;
	bh=wxxoTXn/UDvoagFjdqDDSwsW5EYPfPGzpLXoD7qn3as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkVpVL8R3fRlqdmVANk9lK1KnXujfOXwRf9AQ6EgMPnQML49JjSs6zYYczbjrDif73KNEoJVCsyhz1Ll3EmjdpW9qIVWcGaLBDwtddoVtGX4obLYVBpX0jXoasTqbV/9Lx3crQcbeRilpmM0lwzymRUzmssuBBtyqrnj9QthO40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYbgLihu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41B3C4CEF1;
	Mon,  8 Dec 2025 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765188701;
	bh=wxxoTXn/UDvoagFjdqDDSwsW5EYPfPGzpLXoD7qn3as=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RYbgLihuH1YWgCbez+jZqKuncVUZg/4HVJQpMV6n8YNSIDsi00dW0xDhkbTUti05J
	 CKqhVd5nhKvSjYZMoTRDf6YGbcmPP6Jz3gXSaTBXZ9EzUGKRWIUAKdOa1LtIs+9fy5
	 unDtxtHAszPwUdNjNGcdxACzYk7mpKjxCBhFIZkHgum+sOVQGXdqXNGK3AuK5TlSd1
	 vnPdMa5a6EHb/UpXv26AcxdOrY8hGinFIKqeCGWR5D0X/slX8s9jusTBcJB748fSDx
	 SDL03PgO7pVx6RpdQ2AgG/kt1a044ov2SKTfGMSr66SvlMQRRfFEA3WNmCTWSbLYOv
	 2gHnMnLx+acQA==
Message-ID: <f31f9b67-2a70-42e6-9ac2-ba342d8cfc57@kernel.org>
Date: Mon, 8 Dec 2025 11:11:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v6] media: uvcvideo: UVC minimum relative
 pan/tilt/zoom speed fix.
To: Gergo Koteles <soyer@irl.hu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Bauer <johnebgood@securitylive.com>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20251201160653.1569062-1-soyer@irl.hu>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20251201160653.1569062-1-soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1-Dec-25 5:06 PM, Gergo Koteles wrote:
> From: John Bauer <johnebgood@securitylive.com>
> 
> In Video4Linux, a negative value in V4L2_CID_ZOOM_CONTINUOUS,
> V4L2_CID_PAN_SPEED and V4L2_CID_TILT_SPEED indicates a movement in the
> "opposite" direction to the standard direction.
> 
> Currently, we were using -UVC_GET_MIN as the negative value, which
> resulted in the camera moving in the slowest possible speed.
> 
> Quirk the driver to return -UVC_GET_MAX for the affected controls.
> 
> Note that the get/set function from the mapping cannot be used for
> this, because we need to use the information from GET_MAX for GET_MIN
> and hacking uvc_ctrl_populate_cache seems like a worse alternative.

Sorry for being slow with processing things and thank you for your
perseverance in getting this upstream.
 
The patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

I've merged this into my local uvc/for-next branch which I will push out later
today.

Regards,

Hans




> 
> Tested on OBSBOT Tiny 2.
> 
> lsusb -v:
> 
> Bus 008 Device 002: ID 3564:fef8 Remo Tech Co., Ltd. OBSBOT Tiny 2
> Negotiated speed: SuperSpeed (5Gbps)
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               3.10
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0         9
>   idVendor           0x3564 Remo Tech Co., Ltd.
>   idProduct          0xfef8 OBSBOT Tiny 2
>   bcdDevice            4.09
>   iManufacturer           1 Remo Tech Co., Ltd.
>   iProduct                2 OBSBOT Tiny 2
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x04fc
>     bNumInterfaces          4
>     bConfigurationValue     1
>     iConfiguration          4 OBSBOT Multifunction
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower                0mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0
>       iFunction               5 OBSBOT Tiny 2 StreamCamera
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0
>       iInterface              5 OBSBOT Tiny 2 StreamCamera
>       VideoControl Interface Descriptor:
>         bLength                13
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdUVC               1.00
>         wTotalLength       0x0050
>         dwClockFrequency       48.000000MHz
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
>         bmControls           0x00023e3e
>           Auto-Exposure Mode
>           Auto-Exposure Priority
>           Exposure Time (Absolute)
>           Exposure Time (Relative)
>           Focus (Absolute)
>           Zoom (Absolute)
>           Zoom (Relative)
>           PanTilt (Absolute)
>           PanTilt (Relative)
>           Roll (Absolute)
>           Focus, Auto
>       VideoControl Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>       Warning: Descriptor too short
>         bUnitID                 3
>         bSourceID               1
>         wMaxMultiplier        400
>         bControlSize            2
>         bmControls     0x0000f7df
>           Brightness
>           Contrast
>           Hue
>           Saturation
>           Sharpness
>           White Balance Temperature
>           White Balance Component
>           Backlight Compensation
>           Gain
>           Power Line Frequency
>           White Balance Temperature, Auto
>           White Balance Component, Auto
>           Digital Multiplier
>           Digital Multiplier Limit
>         iProcessing             0
>         bmVideoStandards     0x1d
>           None
>           PAL - 625/50
>           SECAM - 625/50
>           NTSC - 625/50
>       VideoControl Interface Descriptor:
>         bLength                29
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                 2
>         guidExtensionCode         {9a1e7291-6843-4683-6d92-39bc7906ee49}
>         bNumControls           19
>         bNrInPins               1
>         baSourceID( 0)          3
>         bControlSize            4
>         bmControls( 0)       0xff
>         bmControls( 1)       0xff
>         bmControls( 2)       0x04
>         bmControls( 3)       0x00
>         iExtension              0
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             7
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               2
>         iTerminal               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval               8
>         bMaxBurst               0
>         VideoControl Endpoint Descriptor:
>           bLength                 5
>           bDescriptorType        37
>           bDescriptorSubtype      3 (EP_INTERRUPT)
>           wMaxTransferSize       16
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              6 Video Streaming
>       VideoStreaming Interface Descriptor:
>         bLength                            16
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         3
>         wTotalLength                   0x03f8
>         bEndpointAddress                 0x81  EP 1 IN
>         bmInfo                              0
>         bTerminalLink                       7
>         bStillCaptureMethod                 0
>         bTriggerSupport                     0
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     4
>         bmaControls( 1)                     0
>         bmaControls( 2)                     4
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        1
>         bNumFrameDescriptors                6
>         bFlags                              0
>           Fixed-size samples: No
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
>         bLength                            62
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                995328000
>         dwMaxBitRate                1990656000
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  9
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            166833
>         dwFrameInterval( 2)            200000
>         dwFrameInterval( 3)            333333
>         dwFrameInterval( 4)            333666
>         dwFrameInterval( 5)            400000
>         dwFrameInterval( 6)            416666
>         dwFrameInterval( 7)            500000
>         dwFrameInterval( 8)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           3840
>         wHeight                          2160
>         dwMinBitRate                1327104000
>         dwMaxBitRate                1327104000
>         dwMaxVideoFrameBufferSize    16588800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            333666
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            62
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                221184000
>         dwMaxBitRate                884736000
>         dwMaxVideoFrameBufferSize     1843200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  9
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            166833
>         dwFrameInterval( 2)            200000
>         dwFrameInterval( 3)            333333
>         dwFrameInterval( 4)            333666
>         dwFrameInterval( 5)            400000
>         dwFrameInterval( 6)            416666
>         dwFrameInterval( 7)            500000
>         dwFrameInterval( 8)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           960
>         dwMinBitRate                294912000
>         dwMaxBitRate                1179648000
>         dwMaxVideoFrameBufferSize     2457600
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1440
>         dwMinBitRate                663552000
>         dwMaxBitRate                1327104000
>         dwMaxVideoFrameBufferSize     5529600
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            46
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           4000
>         wHeight                          3000
>         dwMinBitRate                1920000000
>         dwMaxBitRate                1920000000
>         dwMaxVideoFrameBufferSize    24000000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  5
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            416666
>         dwFrameInterval( 3)            500000
>         dwFrameInterval( 4)            666666
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
>         bNumFrameDescriptors                7
>         guidFormat           {32595559-0000-0010-8000-00aa00389b71}
>         bBitsPerPixel                      16
>         bDefaultFrameIndex                  5
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 2 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           360
>         dwMinBitRate                 55296000
>         dwMaxBitRate                221184000
>         dwMaxVideoFrameBufferSize      460800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                 73728000
>         dwMaxBitRate                294912000
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                221184000
>         dwMaxBitRate                884736000
>         dwMaxVideoFrameBufferSize     1843200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           960
>         dwMinBitRate                294912000
>         dwMaxBitRate                1179648000
>         dwMaxVideoFrameBufferSize     2457600
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            46
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                497664000
>         dwMaxBitRate                995328000
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  5
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            416666
>         dwFrameInterval( 3)            500000
>         dwFrameInterval( 4)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            46
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1440
>         dwMinBitRate                663552000
>         dwMaxBitRate                1327104000
>         dwMaxVideoFrameBufferSize     5529600
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  5
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            416666
>         dwFrameInterval( 3)            500000
>         dwFrameInterval( 4)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            30
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         7
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           3840
>         wHeight                          2160
>         dwMinBitRate                1990656000
>         dwMaxBitRate                1990656000
>         dwMaxVideoFrameBufferSize    16588800
>         dwDefaultFrameInterval         666666
>         bFrameIntervalType                  1
>         dwFrameInterval( 0)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       VideoStreaming Interface Descriptor:
>         bLength                            28
>         bDescriptorType                    36
>         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
>         bFormatIndex                        3
>         bNumFrameDescriptors                5
>         guidFormat           {34363248-0000-0010-8000-00aa00389b71}
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
>         bVariableSize                     1
>       VideoStreaming Interface Descriptor:
>         bLength                            62
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                497664000
>         dwMaxBitRate                1990656000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  9
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            166833
>         dwFrameInterval( 2)            200000
>         dwFrameInterval( 3)            333333
>         dwFrameInterval( 4)            333666
>         dwFrameInterval( 5)            400000
>         dwFrameInterval( 6)            416666
>         dwFrameInterval( 7)            500000
>         dwFrameInterval( 8)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           3840
>         wHeight                          2160
>         dwMinBitRate                1327104000
>         dwMaxBitRate                1327104000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            333666
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            62
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                221184000
>         dwMaxBitRate                884736000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  9
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            166833
>         dwFrameInterval( 2)            200000
>         dwFrameInterval( 3)            333333
>         dwFrameInterval( 4)            333666
>         dwFrameInterval( 5)            400000
>         dwFrameInterval( 6)            416666
>         dwFrameInterval( 7)            500000
>         dwFrameInterval( 8)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           960
>         dwMinBitRate                294912000
>         dwMaxBitRate                1179648000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1440
>         dwMinBitRate                663552000
>         dwMaxBitRate                1327104000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            416666
>         dwFrameInterval( 4)            500000
>         dwFrameInterval( 5)            666666
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               0
>         bMaxBurst              13
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         2
>       bInterfaceCount         2
>       bFunctionClass          1 Audio
>       bFunctionSubClass       0 [unknown]
>       bFunctionProtocol       0
>       iFunction               8 OBSBOT Tiny2 Audio
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      1 Control Device
>       bInterfaceProtocol      0
>       iInterface              8 OBSBOT Tiny2 Audio
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdADC               1.00
>         wTotalLength       0x0027
>         bInCollection           1
>         baInterfaceNr(0)        3
>       AudioControl Interface Descriptor:
>         bLength                12
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             3
>         wTerminalType      0x0201 Microphone
>         bAssocTerminal          0
>         bNrChannels             2
>         wChannelConfig     0x0003
>           Left Front (L)
>           Right Front (R)
>         iChannelNames          13 Capture Channels
>         iTerminal              12 OBSBOT Tiny2 Microphone
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             4
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               5
>         iTerminal              14 Capture Output terminal
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      6 (FEATURE_UNIT)
>         bUnitID                 5
>         bSourceID               3
>         bControlSize            2
>         bmaControls(0)     0x0003
>           Mute Control
>           Volume Control
>         iFeature                0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0
>       iInterface             17 OBSBOT Tiny2 Microphone
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0
>       iInterface             18 Capture Active
>       AudioStreaming Interface Descriptor:
>         bLength                 7
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink           4
>         bDelay                  1 frames
>         wFormatTag         0x0001 PCM
>       AudioStreaming Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bNrChannels             2
>         bSubframeSize           2
>         bBitResolution         16
>         bSamFreqType            1 Discrete
>         tSamFreq[ 0]        48000
>       Endpoint Descriptor:
>         bLength                 9
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x00c0  1x 192 bytes
>         bInterval               4
>         bRefresh                0
>         bSynchAddress           0
>         bMaxBurst               0
>         AudioStreaming Endpoint Descriptor:
>           bLength                 7
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x01
>             Sampling Frequency
>           bLockDelayUnits         0 Undefined
>           wLockDelay         0x0000
> Binary Object Store Descriptor:
>   bLength                 5
>   bDescriptorType        15
>   wTotalLength       0x0016
>   bNumDeviceCaps          2
>   USB 2.0 Extension Device Capability:
>     bLength                 7
>     bDescriptorType        16
>     bDevCapabilityType      2
>     bmAttributes   0x00000006
>       BESL Link Power Management (LPM) Supported
>   SuperSpeed USB Device Capability:
>     bLength                10
>     bDescriptorType        16
>     bDevCapabilityType      3
>     bmAttributes         0x00
>     wSpeedsSupported   0x000f
>       Device can operate at Low Speed (1Mbps)
>       Device can operate at Full Speed (12Mbps)
>       Device can operate at High Speed (480Mbps)
>       Device can operate at SuperSpeed (5Gbps)
>     bFunctionalitySupport   1
>       Lowest fully-functional device speed is Full Speed (12Mbps)
>     bU1DevExitLat           1 micro seconds
>     bU2DevExitLat         500 micro seconds
> Device Status:     0x0001
>   Self Powered
> 
> Signed-off-by: John Bauer <johnebgood@securitylive.com>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 62 ++++++++++++++++++++++++++------
>  1 file changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 2905505c240c..123689b3f8ef 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -483,6 +483,7 @@ static int uvc_ctrl_get_zoom(struct uvc_control_mapping *mapping, u8 query,
>  		return 0;
>  
>  	case UVC_GET_MIN:
> +		/* Not used, we use -UVC_GET_MAX */
>  	case UVC_GET_MAX:
>  	case UVC_GET_RES:
>  	case UVC_GET_DEF:
> @@ -526,8 +527,7 @@ static int uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
>  		*out = (sign == 0) ? 0 : (sign > 0 ? value : -value);
>  		return 0;
>  	case UVC_GET_MIN:
> -		*out = -value;
> -		return 0;
> +		/* Not used, we use -UVC_GET_MAX */
>  	case UVC_GET_MAX:
>  	case UVC_GET_RES:
>  	case UVC_GET_DEF:
> @@ -1517,6 +1517,17 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
>  	return ~0;
>  }
>  
> +static bool uvc_ctrl_is_relative_ptz(__u32 ctrl_id)
> +{
> +	switch (ctrl_id) {
> +	case V4L2_CID_ZOOM_CONTINUOUS:
> +	case V4L2_CID_PAN_SPEED:
> +	case V4L2_CID_TILT_SPEED:
> +		return true;
> +	}
> +	return false;
> +}
> +
>  /*
>   * Maximum retry count to avoid spurious errors with controls. Increasing this
>   * value does no seem to produce better results in the tested hardware.
> @@ -1576,18 +1587,32 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
>  		break;
>  	}
>  
> -	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> -		v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> -				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> -	else
> -		v4l2_ctrl->minimum = 0;
> -
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
>  		v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
>  	else
>  		v4l2_ctrl->maximum = 0;
>  
> +	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
> +		/*
> +		 * For relative PTZ controls, UVC_GET_MIN for
> +		 * b(Pan|Tilt|Zoom)Speed returns the minimum speed of the
> +		 * movement in direction specified in the sign field.
> +		 * See in USB Device Class Definition for Video Devices:
> +		 * 4.2.2.1.13 Zoom (Relative) Control
> +		 * 4.2.2.1.15 PanTilt (Relative) Control
> +		 *
> +		 * For minimum value, use maximum speed but in negative direction.
> +		 */
> +		if (uvc_ctrl_is_relative_ptz(v4l2_ctrl->id))
> +			v4l2_ctrl->minimum = -v4l2_ctrl->maximum;
> +		else
> +			v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping,
> +				UVC_GET_MIN, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> +	} else {
> +		v4l2_ctrl->minimum = 0;
> +	}
> +
>  	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
>  		v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> @@ -2449,6 +2474,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
>  
>  static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
>  			  struct uvc_control *ctrl,
> +			  u32 v4l2_id,
>  			  struct uvc_control_mapping *mapping,
>  			  s32 *value_in_out)
>  {
> @@ -2466,10 +2492,24 @@ static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
>  				return ret;
>  		}
>  
> -		min = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> -					  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
>  		max = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
>  					  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +		/*
> +		 * For relative PTZ controls, UVC_GET_MIN for
> +		 * b(Pan|Tilt|Zoom)Speed returns the minimum speed of the
> +		 * movement in direction specified in the sign field.
> +		 * See in USB Device Class Definition for Video Devices:
> +		 * 4.2.2.1.13 Zoom (Relative) Control
> +		 * 4.2.2.1.15 PanTilt (Relative) Control
> +		 *
> +		 * For minimum value, use maximum speed but in negative direction.
> +		 */
> +		if (uvc_ctrl_is_relative_ptz(v4l2_id))
> +			min = -max;
> +		else
> +			min = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> +					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> +
>  		step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
>  					   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
>  		if (step == 0)
> @@ -2583,7 +2623,7 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>  		return -EACCES;
>  
> -	ret = uvc_ctrl_clamp(chain, ctrl, mapping, &xctrl->value);
> +	ret = uvc_ctrl_clamp(chain, ctrl, xctrl->id, mapping, &xctrl->value);
>  	if (ret)
>  		return ret;
>  	/*


