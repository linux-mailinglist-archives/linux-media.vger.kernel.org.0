Return-Path: <linux-media+bounces-44024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 803E7BC6D80
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 01:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE71E406B90
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 23:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A2D29AB13;
	Wed,  8 Oct 2025 23:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew4yoVFK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182F423B63E
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759965416; cv=none; b=oqvuWL/u3IPVBAqMWOkr6Jd2ne7Q0ZNOHhH1ujILe2ixDACSRhDzUX4zME9XySqsIIyI5ZkMfP46FipshaDq68RXA6+FghPMJ9fx0/KxyM4D8U2jCWLV92kRWhA8w7I11fFBnTWfuzajX626OvSMWEvET4j3qi+DNMMphwGr+K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759965416; c=relaxed/simple;
	bh=4qdyYasky93MxT0ORlltzpfacOT6l4RS5qcDp9gLgMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiB7x5EJ4iOlfZ7gfyiBKB29Dmkq7uM5Eh29QqydSAzvXanBgic8biCZwUv1eEhDfrydWgKkY270yb/BxKMvvZjpnDbCrynlttz9I51acGPM86kmf0mWlLfX10PW7+R+UY/4xr5w6N1fz89fBQHtqNcbU0NlOFyBwmg/WJ8z7PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew4yoVFK; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so256908b3a.2
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759965413; x=1760570213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2Hn+JJ5QHAYeIJvfIWYa7d32qB/cKZyWLjWjwxeF4A=;
        b=Ew4yoVFKGY+KxA7s5Q+da4gPShkfDbjNsgbaqKSW4sltytEySSw6KiHk/xSOQwfUx7
         YkMhpz9xEgbOn6Gj7vTQAinITfNQsI1hkDhXZFcnDsYVbhGUP2ym/ORl5ZDPwKK+zEm0
         hRbzHvnEIiUUsVErtyXXJ8KEnEMFP7zmLoF0ryXqWJ3mZzjuPt5uZt8G/tlsh7GLs1AF
         tGY9+Ybxvi+xC50Oc3Oxq4RvWP038zN9bpHKgJvxaLB0KyBaWUbda9afsplH8kBE2/8L
         U6kqpiFNx1YpprhPDlgZ/ZV6t1rSJSBQGa9jP2/4hKaQvnRyY5otWZc0N+3X2C6DKwP9
         0Rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759965413; x=1760570213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2Hn+JJ5QHAYeIJvfIWYa7d32qB/cKZyWLjWjwxeF4A=;
        b=R9BPtDiyICiDSi0XJRUSflKvxGOas+kIzDwv03wCZXJTcWIXqPXT9nxYBlkPHIcSSs
         9EUlpSA8xKFa15wEfdyVZCKrCVoAA/II1LV5pXP/bwxQxxBPiLm2C0yfwm6WQmat+kHX
         wndb1P4uRHMBvW6cNGVw+FBnqioVi2yupabQDh8+HMbVYiLIZasmSA5ETWvuMU9s9m/6
         Zmz+Zhul2RqWJA61duRvqJBxgAy9lDlCLUo2T4IV/8C+TaiaSF8CATrpeN4MGd6j1nGr
         E74wR3wTZlLM0wXJ7QnIBF/YgqbHXXzEpf+oUM4uOw1Z14YXAiUtPdcxnTpRKmX1+ts8
         oA7g==
X-Forwarded-Encrypted: i=1; AJvYcCUfdaZ6nSTztkIzZqFiPv1ql/Fr2OR+HdAL1u6wG0HjTrkZl2gVLoKlRYWJ/UbFhB0tSRKVnbRkfXNRBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3C9gYCP53jKCkM4YXcR5unHfIN3okm85zX7RTI57LVI4VTNE8
	dCeZhVGpUy6ptqg+4LC6eN6tq6vssFHSShr21hOeDt/Iv+0y6G0J+JRx
X-Gm-Gg: ASbGnctR8vH2suiMZx6+p0irbp3unpkyY8y/7CbWHPS3YSgioUBUD3syxDWuDMFyzIG
	b7ll2WIHNCLyNdcNRBKYfi5neXmc/CGtEaCxkKSKAb8/9A1xOIrytemJbuWYCIO2jq7+4toZndd
	mhQ99xF/AQHBLBmSJnOkINBQVVRtZSrAeEqqW/drKjpJSFh1sGtTmyR4csVrzT9dyGT+LwSkWNp
	+v8GsTJxy4vGlRNFa3CZU0VW5f22PbeuH0bsP0ir14zE/qxq8fBBLa9hWyHVHXrzsHKmioaHpiT
	mW8X4LSS1J0/LtocfS0cApBnZNxLrcXMFtcL3J3m0mzVlYiUxoPUkWurc01WIZ6QEs6sta30Ehp
	8iInjanFjSLYL7+drQaC4is7bTJFkf4YGhtCBUzNNaSWJRakdjA==
X-Google-Smtp-Source: AGHT+IGtb2hrTVzktNQhhoJKhll/c6dtBoVA6z5Zbsk3ns+8AHfwHhJCYh8qmZ8Ytl8wxOzVuJD5Ww==
X-Received: by 2002:a05:6a20:2589:b0:32d:9131:98aa with SMTP id adf61e73a8af0-32da814a16bmr6802149637.24.1759965412949;
        Wed, 08 Oct 2025 16:16:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e191a52bsm847528b3a.58.2025.10.08.16.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 16:16:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 2A9E34233432; Thu, 09 Oct 2025 06:16:49 +0700 (WIB)
Date: Thu, 9 Oct 2025 06:16:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Angel4005 <ooara1337@gmail.com>, linux-media@vger.kernel.org
Cc: linux-uvc-devel@lists.sourceforge.net,
	Linux Regressions <regressions@lists.linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [REGRESSION] uvcvideo: Grandstream GUV3100 (2bab:0011) broken on
 recent kernels (including LTS)
Message-ID: <aObw4BRRheGO3_cg@archie.me>
References: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xemPk4f9OBn8+EoX"
Content-Disposition: inline
In-Reply-To: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>


--xemPk4f9OBn8+EoX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 03:56:20PM +0300, Angel4005 wrote:
> Hello,
>=20
> I encountered regression (breakage) for the Grandstream GUV3100 webcam
> (ID 2bab:0011) in the uvcvideo driver.
>=20
> Testing showed that the camera WORKS on kernel 6.16.8.arch3-1.
>=20
> However, it does NOT WORK on newer kernel versions, including the
> latest stable version (6.17.1.arch1-1) and the latest LTS kernel
> version (6.12.51-1).
>=20
> Problem: The driver finds the device but cannot start the video
> stream, resulting in an error in dmesg: =E2=80=9CNo streaming interface f=
ound
> for terminal 65535.=E2=80=9D
>=20
> I checked all known quirks (0x128, 0x100, 0x400) without success. The
> logs attached below were collected on a non-working kernel with the
> quirks=3D0x400 parameter applied.
>=20
> I hope this information will help restore device support.
>=20

Can you do bisection (see [1])?

[1]: https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions=
=2Ehtml

> Thank you for your work!
>=20
> --- 1. lsusb -d 2bab:0011 -v (Full USB descriptor) ---
>=20
>=20
> Bus 001 Device 004: ID 2bab:0011 GRANDSTREAM GUV3100 GRANDSTREAM GUV3100
> Negotiated speed: High Speed (480Mbps)
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x2bab GRANDSTREAM GUV3100
>   idProduct          0x0011 GRANDSTREAM GUV3100
>   bcdDevice            4.09
>   iManufacturer           4 GRANDSTREAM GUV3100
>   iProduct                5 GRANDSTREAM GUV3100
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0b33
>     bNumInterfaces          4
>     bConfigurationValue     1
>     iConfiguration          7 video
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower                2mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0
>       iFunction               8 GRANDSTREAM GUV3100
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0
>       iInterface              8 GRANDSTREAM GUV3100
>       VideoControl Interface Descriptor:
>         bLength                13
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdUVC               1.00
>         wTotalLength       0x0072
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
>         bmControls           0x00001e00
>           Zoom (Absolute)
>           Zoom (Relative)
>           PanTilt (Absolute)
>           PanTilt (Relative)
>       VideoControl Interface Descriptor:
>         bLength                12
>         bDescriptorType        36
>         bDescriptorSubtype      5 (PROCESSING_UNIT)
>         bUnitID                 2
>         bSourceID               1
>         wMaxMultiplier      16384
>         bControlSize            2
>         bmControls     0x0000177f
>           Brightness
>           Contrast
>           Hue
>           Saturation
>           Sharpness
>           Gamma
>           White Balance Temperature
>           Backlight Compensation
>           Gain
>           Power Line Frequency
>           White Balance Temperature, Auto
>         iProcessing             0
>         bmVideoStandards     0x00
>       VideoControl Interface Descriptor:
>         bLength                31
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                 3
>         guidExtensionCode         {a29e7641-de04-47e3-8b2b-f4341aff003b}
>         bNumControls           48
>         bNrInPins               1
>         baSourceID( 0)          2
>         bControlSize            6
>         bmControls( 0)       0xff
>         bmControls( 1)       0xff
>         bmControls( 2)       0xff
>         bmControls( 3)       0xff
>         bmControls( 4)       0xff
>         bmControls( 5)       0xff
>         iExtension              0
>       VideoControl Interface Descriptor:
>         bLength                31
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                 4
>         guidExtensionCode         {ffe52d21-8030-4e2c-82d9-f587d00540bd}
>         bNumControls           48
>         bNrInPins               1
>         baSourceID( 0)          2
>         bControlSize            6
>         bmControls( 0)       0xff
>         bmControls( 1)       0xff
>         bmControls( 2)       0xff
>         bmControls( 3)       0xff
>         bmControls( 4)       0xff
>         bmControls( 5)       0xff
>         iExtension              0
>       VideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             4
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               3
>         iTerminal               0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              9 Video Streaming
>       VideoStreaming Interface Descriptor:
>         bLength                            14
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         1
>         wTotalLength                   0x0a12
>         bEndpointAddress                 0x81  EP 1 IN
>         bmInfo                              0
>         bTerminalLink                       4
>         bStillCaptureMethod                 0
>         bTriggerSupport                     0
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>       VideoStreaming Interface Descriptor:
>         bLength                            27
>         bDescriptorType                    36
>         bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
>         bFormatIndex                        1
>         bNumFrameDescriptors                8
>         guidFormat
> {32595559-0000-0010-8000-00aa00389b71}
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
>         bLength                            34
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                 18432000
>         dwMaxBitRate                110592000
>         dwMaxVideoFrameBufferSize      460800
>         dwDefaultFrameInterval        1000000
>         bFrameIntervalType                  2
>         dwFrameInterval( 0)           1000000
>         dwFrameInterval( 1)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1024
>         wHeight                           576
>         dwMinBitRate                 47185920
>         dwMaxBitRate                283115520
>         dwMaxVideoFrameBufferSize     1179648
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            34
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           600
>         dwMinBitRate                 18432000
>         dwMaxBitRate                110592000
>         dwMaxVideoFrameBufferSize      460800
>         dwDefaultFrameInterval        1000000
>         bFrameIntervalType                  2
>         dwFrameInterval( 0)           1000000
>         dwFrameInterval( 1)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           448
>         dwMinBitRate                 28672000
>         dwMaxBitRate                172032000
>         dwMaxVideoFrameBufferSize      716800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            46
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                 24576000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         400000
>         bFrameIntervalType                  5
>         dwFrameInterval( 0)            400000
>         dwFrameInterval( 1)            500000
>         dwFrameInterval( 2)            666666
>         dwFrameInterval( 3)           1000000
>         dwFrameInterval( 4)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           360
>         dwMinBitRate                 18432000
>         dwMaxBitRate                110592000
>         dwMaxVideoFrameBufferSize      460800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         7
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            480
>         wHeight                           270
>         dwMinBitRate                 10368000
>         dwMaxBitRate                 62208000
>         dwMaxVideoFrameBufferSize      259200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
>         bFrameIndex                         8
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            320
>         wHeight                           180
>         dwMinBitRate                 18432000
>         dwMaxBitRate                110592000
>         dwMaxVideoFrameBufferSize      460800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        2
>         bNumFrameDescriptors               14
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
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                165888000
>         dwMaxBitRate                829440000
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1600
>         wHeight                           896
>         dwMinBitRate                114688000
>         dwMaxBitRate                688128000
>         dwMaxVideoFrameBufferSize     2867200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                 73728000
>         dwMaxBitRate                442368000
>         dwMaxVideoFrameBufferSize     1843200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1024
>         wHeight                           576
>         dwMinBitRate                 47185920
>         dwMaxBitRate                283115520
>         dwMaxVideoFrameBufferSize     1179648
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            960
>         wHeight                           540
>         dwMinBitRate                207360000
>         dwMaxBitRate                248832000
>         dwMaxVideoFrameBufferSize     1036800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           600
>         dwMinBitRate                 38400000
>         dwMaxBitRate                230400000
>         dwMaxVideoFrameBufferSize      960000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         7
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           448
>         dwMinBitRate                 28672000
>         dwMaxBitRate                172032000
>         dwMaxVideoFrameBufferSize      716800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         8
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            720
>         wHeight                           576
>         dwMinBitRate                 33177600
>         dwMaxBitRate                199065600
>         dwMaxVideoFrameBufferSize      829440
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         9
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            720
>         wHeight                           480
>         dwMinBitRate                 27648000
>         dwMaxBitRate                165888000
>         dwMaxVideoFrameBufferSize      691200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        10
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                 24576000
>         dwMaxBitRate                147456000
>         dwMaxVideoFrameBufferSize      614400
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        11
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           360
>         dwMinBitRate                 92160000
>         dwMaxBitRate                110592000
>         dwMaxVideoFrameBufferSize      460800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        12
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            480
>         wHeight                           270
>         dwMinBitRate                 10368000
>         dwMaxBitRate                 62208000
>         dwMaxVideoFrameBufferSize      259200
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        13
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            352
>         wHeight                           288
>         dwMinBitRate                  8110080
>         dwMaxBitRate                 48660480
>         dwMaxVideoFrameBufferSize      202752
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                        14
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            320
>         wHeight                           240
>         dwMinBitRate                  6144000
>         dwMaxBitRate                 36864000
>         dwMaxVideoFrameBufferSize      153600
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            28
>         bDescriptorType                    36
>         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
>         bFormatIndex                        3
>         bNumFrameDescriptors               14
>         guidFormat
> {34363248-0000-0010-8000-00aa00389b71}
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
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                165888000
>         dwMaxBitRate                829440000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1600
>         wHeight                           896
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                 73728000
>         dwMaxBitRate                442368000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1024
>         wHeight                           576
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            960
>         wHeight                           540
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           600
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         7
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           448
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         8
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            720
>         wHeight                           576
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         9
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            720
>         wHeight                           480
>         dwMinBitRate                 27648000
>         dwMaxBitRate                165888000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        10
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        11
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           360
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        12
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            480
>         wHeight                           270
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        13
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            352
>         wHeight                           288
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        14
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            320
>         wHeight                           240
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            28
>         bDescriptorType                    36
>         bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
>         bFormatIndex                        4
>         bNumFrameDescriptors               14
>         guidFormat
> {35363248-0000-0010-8000-00aa00389b71}
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
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                165888000
>         dwMaxBitRate                829440000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         2
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1600
>         wHeight                           896
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         3
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1280
>         wHeight                           720
>         dwMinBitRate                 73728000
>         dwMaxBitRate                442368000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         4
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1024
>         wHeight                           576
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         5
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            960
>         wHeight                           540
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         6
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           600
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         7
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            800
>         wHeight                           448
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         8
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            720
>         wHeight                           576
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                         9
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            720
>         wHeight                           480
>         dwMinBitRate                 27648000
>         dwMaxBitRate                165888000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        10
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           480
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        11
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            640
>         wHeight                           360
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        12
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            480
>         wHeight                           270
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        13
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            352
>         wHeight                           288
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
>         bFrameIndex                        14
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                            320
>         wHeight                           240
>         dwMinBitRate                103680000
>         dwMaxBitRate                124416000
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwBytesPerLine                      0
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
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
>       iInterface              9 Video Streaming
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
>       bAlternateSetting       2
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              9 Video Streaming
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
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         2
>       bInterfaceCount         2
>       bFunctionClass          1 Audio
>       bFunctionSubClass       0 [unknown]
>       bFunctionProtocol       0
>       iFunction              11 GRANDSTREAM GUV3100
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      1 Control Device
>       bInterfaceProtocol      0
>       iInterface             11 GRANDSTREAM GUV3100
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
>         bTerminalID             1
>         wTerminalType      0x0201 Microphone
>         bAssocTerminal          0
>         bNrChannels             1
>         wChannelConfig     0x0001
>           Left Front (L)
>         iChannelNames           0
>         iTerminal               0
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             3
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               5
>         iTerminal               0
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      6 (FEATURE_UNIT)
>         bUnitID                 5
>         bSourceID               1
>         bControlSize            1
>         bmaControls(0)       0x03
>           Mute Control
>           Volume Control
>         bmaControls(1)       0x00
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
>       iInterface              0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       AudioStreaming Interface Descriptor:
>         bLength                 7
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink           3
>         bDelay                  1 frames
>         wFormatTag         0x0001 PCM
>       AudioStreaming Interface Descriptor:
>         bLength                11
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bNrChannels             1
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
>         wMaxPacketSize     0x0060  1x 96 bytes
>         bInterval               4
>         bRefresh                0
>         bSynchAddress           0
>         AudioStreaming Endpoint Descriptor:
>           bLength                 7
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x01
>             Sampling Frequency
>           bLockDelayUnits         0 Undefined
>           wLockDelay         0x0000
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0001
>   Self Powered
>=20
>=20
> --- 2. dmesg (Kernel log after connecting to a broken kernel) ---
>=20
> [  363.567249] usb 1-1.3: new high-speed USB device number 6 using ehci-p=
ci
> [  363.658563] usb 1-1.3: New USB device found, idVendor=3D2bab,
> idProduct=3D0011, bcdDevice=3D 4.09
> [  363.658569] usb 1-1.3: New USB device strings: Mfr=3D4, Product=3D5,
> SerialNumber=3D0
> [  363.658571] usb 1-1.3: Product: GRANDSTREAM GUV3100
> [  363.658573] usb 1-1.3: Manufacturer: GRANDSTREAM GUV3100
> [  363.672993] uvcvideo 1-1.3:1.0: Found multiple Units with ID 4
> [  363.673014] usb 1-1.3: Found UVC 1.00 device GRANDSTREAM GUV3100 (2bab=
:0011)
> [  363.673017] usb 1-1.3: Forcing device quirks to 0x400 by module
> parameter for testing purpose.
> [  363.673018] usb 1-1.3: Please report required quirks to the
> linux-media mailing list.
> [  363.700829] usb 1-1.3: No streaming interface found for terminal 65535.
> [  363.710048] usb 1-1.3: Warning! Unlikely big volume range (=3D7680),
> cval->res is probably wrong.
> [  363.710052] usb 1-1.3: [5] FU [Mic Capture Volume] ch =3D 1, val =3D 5=
120/12800/1

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--xemPk4f9OBn8+EoX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaObw3AAKCRD2uYlJVVFO
oyR+AP4lXMPAJ7uj5tYJRCdu9YIQmXv5a1ML7pm/ZS4uR/BeTAD7BGOqKfcjMROr
xuLBaNR1sRR9DBD2ZJ2TgcthAGMvvQU=
=hOt4
-----END PGP SIGNATURE-----

--xemPk4f9OBn8+EoX--

