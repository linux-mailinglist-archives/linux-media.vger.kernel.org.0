Return-Path: <linux-media+bounces-49582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEC7CDF160
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 23:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02D813007CBE
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 22:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6513284881;
	Fri, 26 Dec 2025 22:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b="Z8Tqfzou"
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster5-host1-snip4-2.eps.apple.com [57.103.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA044347C6
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766788032; cv=none; b=BhAATiHCONdWXaE2vDn/uGYUBmFlZy544GwT0XekydzumOIMRmOj1AQ6s5DQf3II2IKWFTDqUcWxKh79h33sAbNa/90mAeeYtN74yYk/TstM96Pnr54MaaowPIC/MynAlwvlxwseuaqzGg5tTL9YDRPw69cP48XQ8uhCHU3AGg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766788032; c=relaxed/simple;
	bh=AKRBjYA69s96niiEU8EBbSZOh/BckGDy0jo7b4ltOEg=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=lk1rCr5+kvzmZVedY+jWeOyHdsELdk3/YA7IXnyp96FrhSuI7Xxj54fLBtUzc1lputyElZ5AiIzQO5biUqRNimWEEW5McRUq/LduIk6S3WF5Qhw2pqCRgq3PogaOcbaQ07q51ahLbEb5E1ecDQwGMfux6dYMF17VRU6tbYtv+Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com; spf=pass smtp.mailfrom=mac.com; dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b=Z8Tqfzou; arc=none smtp.client-ip=57.103.66.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mac.com
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-11 (Postfix) with ESMTPS id CD95F1800121;
	Fri, 26 Dec 2025 22:27:04 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai; bh=uU7r6dIrtUeffnbJQiwQSy5/qrhbqBjX2pBWsnK0P5I=; h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:To:x-icloud-hme; b=Z8Tqfzoukuu6ZoG2RxR1JduS++fmUb41W0Biri/xbhFXRse7Z9SL3LVfr/EzTcofNW++/rNd9K8+xKP4s9Ocwu9xTbHWvALrM4vA2KEvihbzuH6N3OaqOHeoZjIAdgShvLm3Q3VFP5asAGNSxMSUbkdcqzEhQ9MchuYHt1s68aln747wDBYRnocruaD4Ym7dGW/fzZs2xXHZV9nuQvxAbFDnJK3jdclJVnKwq7Q6a3q0fwxzX/bXDNwoT1Aic76t0r9tknv7VtMgNvK3Pj0Solo5hqu5UD3KtmrvWJrJwZDP+C6ZTjeI0/DPXKPPQNOSJAdtoim4aowMMg2YSm48Wg==
Received: from smtpclient.apple (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-11 (Postfix) with ESMTPSA id ED2BA18002EF;
	Fri, 26 Dec 2025 22:27:02 +0000 (UTC)
From: Oliver Collyer <ovcollyer@mac.com>
Message-Id: <F9865198-1EA7-4FFE-9FE3-A631A9D2E10A@mac.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_395F480C-E579-46B0-8D55-5BA41EE33EE6"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCH v2] media: uvcvideo: Add support for P010 pixel format
Date: Fri, 26 Dec 2025 22:26:50 +0000
In-Reply-To: <20251226204201.GA4094@pendragon.ideasonboard.com>
Cc: hansg@kernel.org,
 linux-media@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <25886965-BB9A-4AFB-BEBA-E845B6CAB43A@mac.com>
 <20251226065718.95504-1-ovcollyer@mac.com>
 <20251226204201.GA4094@pendragon.ideasonboard.com>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-GUID: Unkq23R6nJnxamimsycKcBrgl26nr5bp
X-Authority-Info: v=2.4 cv=FL4WBuos c=1 sm=1 tr=0 ts=694f0bb9 cx=c_apl:c_pps
 a=azHRBMxVc17uSn+fyuI/eg==:117 a=azHRBMxVc17uSn+fyuI/eg==:17
 a=wP3pNCr1ah4A:10 a=x7bEGLp0ZPQA:10 a=_fXtljRHFhkA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LSfnbbHH7Ex-YOpA9o0A:9 a=QEXdDO2ut3YA:10
 a=OlMgajI3IG3Op8EiZcMA:9 a=m-Z_27IZkzAA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=P1BnusSwAAAA:8 a=n-kJSqksAAAA:8 a=wlInbV_nswK4ie2ax1wA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=fMAGXkzVR7cRuVcbbVfL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDIxMiBTYWx0ZWRfX1MO+NHJM+76H
 UdunzYlp4EqLV+ad+NC7+tD4WKDtlY6D4HXUhbjSPGBegG/KQkyuZ63uBRVm9hntrdKuItn479N
 +DbgzVNENVeg6+PDv/ygPI2AIvHFNVtbPsU0Uhx6Whl48UpkOwWbx+htGu2xlcAakOhantcCl+r
 4mm79lU/Q2fyXZpLToNx8cXVoAV+YR7nHddro710MhwlEPoWSRkyltvwZSVS0RKX5PK/1e9oAN5
 is5dZkuhb3ZLcI/bi4kVN13huKvh/tQt8pwGNjPh+JFNbk9MRiYe1Pr8460qEmLaLMmLy/VGKvR
 R5t7Knp0cwO5ndAvu56
X-Proofpoint-ORIG-GUID: Unkq23R6nJnxamimsycKcBrgl26nr5bp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_07,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512260212
X-JNJ: AAAAAAABEBwkyOGW4wcdPOwnwP0nsqd+kvqcHhGTwHeFAVx0pXkqQyMPfnH7f4CAL/7POxVkJPZI0x85qOeyTbAHyfqUow8bH8Q0DpsQUBunX6txXYvyRjdz/3giO6X8Ah8NBO5XNqWp75VXKXnMkOKx1zoMguh5A+xgz3q6wpL+/FQZWQLqwr+9kjFNoRzFid0rH9EC01LkjRrmdBhFhL8mJMfQ2B/0tdVxIKaIpZTMH98OOpSBHTwsB6yoLvCkuP/7nc4b3m1ZioGoVERQyVRGI8lEuzaNwGc/XVxAlE5ZltisXCn2MCEh6q8GEeUaBhKTFRY/YJs66jjxXQxfZ2X9BnZN+muHLbC+vW9vAD8XBwXnqM6NbpiH62vvYMsjhopGkno/4iAjyoOL1hZSQqf49eoqr4YYTVJdacCaHgeX9foOLpPSTq0VyNBvAnrYvw195tmaLjqmjSP2iDxlIJzK3EfWKwD0XUc7+FtHbYLaGWyVdlZw50q3xwAQrIPTAmRjfA5pq15PnmPAy1AvHQUVdrx8fMdQhjdVau5JhMQmcVkclMptUyML0OqxEmQxy0LXChpoBXH3ILiWiptAp50POZveAn+5dpL+NfQcYJGXdKJ4AXyvrUNuDcHAQMqPVYD7u5mnzAxLi2//IA8Q1SFveqsztfaQfw==


--Apple-Mail=_395F480C-E579-46B0-8D55-5BA41EE33EE6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello Laurent

Please find attached the relevant output from =E2=80=98lsusb -v=E2=80=99 =
for the device.

I=E2=80=99m not sure what is wrong with my email setup or what exactly =
you=E2=80=99re seeing but I=E2=80=99ll try and figure it out, sorry!

Kind Regards

Oliver


--Apple-Mail=_395F480C-E579-46B0-8D55-5BA41EE33EE6
Content-Disposition: attachment;
	filename="Magewell USB Capture HDMI 4K Pro.txt"
Content-Type: text/plain;
	x-unix-mode=0644;
	name="Magewell USB Capture HDMI 4K Pro.txt"
Content-Transfer-Encoding: quoted-printable

Bus 002 Device 014: ID 2935:0015 Magewell USB Capture HDMI 4K Pro
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0         9
  idVendor           0x2935 Magewell
  idProduct          0x0015 USB Capture HDMI 4K Pro
  bcdDevice            1.00
  iManufacturer           1 Magewell
  iProduct                2 USB Capture HDMI 4K Pro
  iSerial                 3 B215240918133636730d1
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x10f2
    bNumInterfaces         11
    bConfigurationValue     1
    iConfiguration          4 USB Capture HDMI 4K Pro
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              800mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0=20
      iFunction               5 USB Capture HDMI 4K Pro
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0=20
      iInterface              6 USB Capture HDMI 4K Pro
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.10
        wTotalLength       0x0050
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
        iTerminal               0=20
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x00000000
      VideoControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            2
        bmControls     0x0000000f
          Brightness
          Contrast
          Hue
          Saturation
        iProcessing             0=20
        bmVideoStandards     0x00
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {a8bd5df2-1a98-474e-8dd0-d92672d194fa}
        bNumControls            1
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            3
        bmControls( 0)       0x00
        bmControls( 1)       0x80
        bmControls( 2)       0x00
        iExtension              0=20
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              6 USB Capture HDMI 4K Pro
      VideoStreaming Interface Descriptor:
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x0e83
        bEndpointAddress                 0x81  EP 1 IN
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
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors               24
        guidFormat                            =
{32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                 23
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 92160000
        dwMaxBitRate                217497600
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                122880000
        dwMaxBitRate                289996800
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                138240000
        dwMaxBitRate                326246400
        dwMaxVideoFrameBufferSize      691200
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                165888000
        dwMaxBitRate                391495680
        dwMaxVideoFrameBufferSize      829440
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            768
        wHeight                           576
        dwMinBitRate                176947200
        dwMaxBitRate                417595392
        dwMaxVideoFrameBufferSize      884736
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                192000000
        dwMaxBitRate                453120000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            856
        wHeight                           480
        dwMinBitRate                164352000
        dwMaxBitRate                387870720
        dwMaxVideoFrameBufferSize      821760
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                207360000
        dwMaxBitRate                489369600
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                235929600
        dwMaxBitRate                556793856
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           768
        dwMinBitRate                314572800
        dwMaxBitRate                742391808
        dwMaxVideoFrameBufferSize     1572864
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                368640000
        dwMaxBitRate                869990400
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                409600000
        dwMaxBitRate                966656000
        dwMaxVideoFrameBufferSize     2048000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                491520000
        dwMaxBitRate                1159987200
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                          1024
        dwMinBitRate                524288000
        dwMaxBitRate                1237319680
        dwMaxVideoFrameBufferSize     2621440
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        15
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1368
        wHeight                           768
        dwMinBitRate                420249600
        dwMaxBitRate                991789056
        dwMaxVideoFrameBufferSize     2101248
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        16
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1440
        wHeight                           900
        dwMinBitRate                518400000
        dwMaxBitRate                1223424000
        dwMaxVideoFrameBufferSize     2592000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        17
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                          1200
        dwMinBitRate                768000000
        dwMaxBitRate                1812480000
        dwMaxVideoFrameBufferSize     3840000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        18
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1680
        wHeight                          1050
        dwMinBitRate                705600000
        dwMaxBitRate                1665216000
        dwMaxVideoFrameBufferSize     3528000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        19
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                829440000
        dwMaxBitRate                1957478400
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        20
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1200
        dwMinBitRate                921600000
        dwMaxBitRate                2174976000
        dwMaxVideoFrameBufferSize     4608000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        21
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2048
        wHeight                          1080
        dwMinBitRate                884736000
        dwMaxBitRate                2087976960
        dwMaxVideoFrameBufferSize     4423680
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        22
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                1474560000
        dwMaxBitRate                3479961600
        dwMaxVideoFrameBufferSize     7372800
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        23
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                3317760000
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize    16588800
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        24
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           4096
        wHeight                          2160
        dwMinBitRate                3538944000
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize    17694720
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
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
        bNumFrameDescriptors               24
        guidFormat                            =
{3231564e-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      12
        bDefaultFrameIndex                 23
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 69120000
        dwMaxBitRate                163123200
        dwMaxVideoFrameBufferSize      345600
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 92160000
        dwMaxBitRate                217497600
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                103680000
        dwMaxBitRate                244684800
        dwMaxVideoFrameBufferSize      518400
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                124416000
        dwMaxBitRate                293621760
        dwMaxVideoFrameBufferSize      622080
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            768
        wHeight                           576
        dwMinBitRate                132710400
        dwMaxBitRate                313196544
        dwMaxVideoFrameBufferSize      663552
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                144000000
        dwMaxBitRate                339840000
        dwMaxVideoFrameBufferSize      720000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            856
        wHeight                           480
        dwMinBitRate                123264000
        dwMaxBitRate                290903040
        dwMaxVideoFrameBufferSize      616320
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                155520000
        dwMaxBitRate                367027200
        dwMaxVideoFrameBufferSize      777600
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                176947200
        dwMaxBitRate                417595392
        dwMaxVideoFrameBufferSize      884736
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           768
        dwMinBitRate                235929600
        dwMaxBitRate                556793856
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                276480000
        dwMaxBitRate                652492800
        dwMaxVideoFrameBufferSize     1382400
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                307200000
        dwMaxBitRate                724992000
        dwMaxVideoFrameBufferSize     1536000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                368640000
        dwMaxBitRate                869990400
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                          1024
        dwMinBitRate                393216000
        dwMaxBitRate                927989760
        dwMaxVideoFrameBufferSize     1966080
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        15
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1368
        wHeight                           768
        dwMinBitRate                315187200
        dwMaxBitRate                743841792
        dwMaxVideoFrameBufferSize     1575936
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        16
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1440
        wHeight                           900
        dwMinBitRate                388800000
        dwMaxBitRate                917568000
        dwMaxVideoFrameBufferSize     1944000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        17
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                          1200
        dwMinBitRate                576000000
        dwMaxBitRate                1359360000
        dwMaxVideoFrameBufferSize     2880000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        18
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1680
        wHeight                          1050
        dwMinBitRate                529200000
        dwMaxBitRate                1248912000
        dwMaxVideoFrameBufferSize     2646000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        19
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                622080000
        dwMaxBitRate                1468108800
        dwMaxVideoFrameBufferSize     3110400
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        20
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1200
        dwMinBitRate                691200000
        dwMaxBitRate                1631232000
        dwMaxVideoFrameBufferSize     3456000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        21
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2048
        wHeight                          1080
        dwMinBitRate                663552000
        dwMaxBitRate                1565982720
        dwMaxVideoFrameBufferSize     3317760
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        22
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                1105920000
        dwMaxBitRate                2609971200
        dwMaxVideoFrameBufferSize     5529600
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        23
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                2488320000
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize    12441600
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        24
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           4096
        wHeight                          2160
        dwMinBitRate                2654208000
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize    13271040
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
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
        bFormatIndex                        3
        bNumFrameDescriptors               24
        guidFormat                            =
{30313050-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      24
        bDefaultFrameIndex                 23
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                138240000
        dwMaxBitRate                326246400
        dwMaxVideoFrameBufferSize      691200
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                184320000
        dwMaxBitRate                434995200
        dwMaxVideoFrameBufferSize      921600
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                207360000
        dwMaxBitRate                489369600
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           576
        dwMinBitRate                248832000
        dwMaxBitRate                587243520
        dwMaxVideoFrameBufferSize     1244160
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            768
        wHeight                           576
        dwMinBitRate                265420800
        dwMaxBitRate                626393088
        dwMaxVideoFrameBufferSize     1327104
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                288000000
        dwMaxBitRate                679680000
        dwMaxVideoFrameBufferSize     1440000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            856
        wHeight                           480
        dwMinBitRate                246528000
        dwMaxBitRate                581806080
        dwMaxVideoFrameBufferSize     1232640
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                311040000
        dwMaxBitRate                734054400
        dwMaxVideoFrameBufferSize     1555200
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                353894400
        dwMaxBitRate                835190784
        dwMaxVideoFrameBufferSize     1769472
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           768
        dwMinBitRate                471859200
        dwMaxBitRate                1113587712
        dwMaxVideoFrameBufferSize     2359296
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                552960000
        dwMaxBitRate                1304985600
        dwMaxVideoFrameBufferSize     2764800
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                614400000
        dwMaxBitRate                1449984000
        dwMaxVideoFrameBufferSize     3072000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                737280000
        dwMaxBitRate                1739980800
        dwMaxVideoFrameBufferSize     3686400
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                          1024
        dwMinBitRate                786432000
        dwMaxBitRate                1855979520
        dwMaxVideoFrameBufferSize     3932160
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        15
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1368
        wHeight                           768
        dwMinBitRate                630374400
        dwMaxBitRate                1487683584
        dwMaxVideoFrameBufferSize     3151872
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        16
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1440
        wHeight                           900
        dwMinBitRate                777600000
        dwMaxBitRate                1835136000
        dwMaxVideoFrameBufferSize     3888000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        17
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                          1200
        dwMinBitRate                1152000000
        dwMaxBitRate                2718720000
        dwMaxVideoFrameBufferSize     5760000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        18
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1680
        wHeight                          1050
        dwMinBitRate                1058400000
        dwMaxBitRate                2497824000
        dwMaxVideoFrameBufferSize     5292000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        19
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                1244160000
        dwMaxBitRate                2936217600
        dwMaxVideoFrameBufferSize     6220800
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        20
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1200
        dwMinBitRate                1382400000
        dwMaxBitRate                3262464000
        dwMaxVideoFrameBufferSize     6912000
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        21
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2048
        wHeight                          1080
        dwMinBitRate                1327104000
        dwMaxBitRate                3131965440
        dwMaxVideoFrameBufferSize     6635520
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        22
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                2211840000
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize    11059200
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        23
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           3840
        wHeight                          2160
        dwMinBitRate                4294967295
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize    24883200
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        24
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           4096
        wHeight                          2160
        dwMinBitRate                4294967295
        dwMaxBitRate                4294967295
        dwMaxVideoFrameBufferSize    26542080
        dwDefaultFrameInterval         200000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            166667
        dwFrameInterval( 1)            166833
        dwFrameInterval( 2)            200000
        dwFrameInterval( 3)            333333
        dwFrameInterval( 4)            333667
        dwFrameInterval( 5)            400000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
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
        bMaxBurst               3
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       1 Control Device
      bFunctionProtocol       0=20
      iFunction              25 USB Capture HDMI 4K Pro Speaker
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0=20
      iInterface             26 USB Capture HDMI 4K Pro Speaker
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
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0=20
        iTerminal              10 Speaker
      AudioControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            2
        bmaControls(0)     0x0003
          Mute Control
          Volume Control
        bmaControls(1)     0x0000
        bmaControls(2)     0x0000
        iFeature                0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0302 Headphones
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             26 USB Capture HDMI 4K Pro Speaker
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             26 USB Capture HDMI 4K Pro Speaker
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           1
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
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
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes           13
          Transfer Type            Isochronous
          Synch Type               Synchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         4
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       1 Control Device
      bFunctionProtocol       0=20
      iFunction              13 USB Capture HDMI 4K Pro HDMI
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0=20
      iInterface             14 USB Capture HDMI 4K Pro HDMI
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x002b
        bInCollection           1
        baInterfaceNr(0)        5
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0602 Digital Audio Interface
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0=20
        iTerminal               7 HDMI
      AudioControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               4
        bControlSize            2
        bmaControls(0)     0x0003
          Mute Control
          Volume Control
        bmaControls(1)     0x0000
        bmaControls(2)     0x0000
        iFeature                0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             6
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               5
        iTerminal               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             14 USB Capture HDMI 4K Pro HDMI
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             14 USB Capture HDMI 4K Pro HDMI
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           6
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
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
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes           13
          Transfer Type            Isochronous
          Synch Type               Synchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         6
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       1 Control Device
      bFunctionProtocol       0=20
      iFunction              16 USB Capture HDMI 4K Pro Mic
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        6
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0=20
      iInterface             17 USB Capture HDMI 4K Pro Mic
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x002b
        bInCollection           1
        baInterfaceNr(0)        7
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             7
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0=20
        iTerminal               8 Mic
      AudioControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 8
        bSourceID               7
        bControlSize            2
        bmaControls(0)     0x0003
          Mute Control
          Volume Control
        bmaControls(1)     0x0000
        bmaControls(2)     0x0000
        iFeature                0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             9
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               8
        iTerminal               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        7
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             17 USB Capture HDMI 4K Pro Mic
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        7
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             17 USB Capture HDMI 4K Pro Mic
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           9
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
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
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes           13
          Transfer Type            Isochronous
          Synch Type               Synchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         8
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       1 Control Device
      bFunctionProtocol       0=20
      iFunction              22 USB Capture HDMI 4K Pro Computer
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        8
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0=20
      iInterface             23 USB Capture HDMI 4K Pro Computer
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x002b
        bInCollection           1
        baInterfaceNr(0)        9
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID            10
        wTerminalType      0x0602 Digital Audio Interface
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0=20
        iTerminal              11 Computer
      AudioControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                11
        bSourceID              10
        bControlSize            2
        bmaControls(0)     0x0003
          Mute Control
          Volume Control
        bmaControls(1)     0x0000
        bmaControls(2)     0x0000
        iFeature                0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            12
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID              11
        iTerminal               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        9
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             23 USB Capture HDMI 4K Pro Computer
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        9
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface             23 USB Capture HDMI 4K Pro Computer
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          12
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
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
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes           13
          Transfer Type            Isochronous
          Synch Type               Synchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bMaxBurst               0
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
      bInterfaceNumber       10
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0=20
      iInterface              0=20
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.01
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength     977
          Report Descriptors:=20
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               1
        bMaxBurst               0

--Apple-Mail=_395F480C-E579-46B0-8D55-5BA41EE33EE6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 26 Dec 2025, at 20:42, Laurent Pinchart =
<laurent.pinchart@ideasonboard.com> wrote:
>=20
> Hi Oliver,
>=20
> Thank you for the patch.
>=20
> On Fri, Dec 26, 2025 at 06:57:18AM +0000, Oliver Collyer wrote:
>> Add support for the P010 (10-bit Y/UV 4:2:0) pixel format to the
>> uvcvideo driver. This format is exposed by USB capture devices such =
as
>> the Magewell USB Capture HDMI 4K Pro when capturing HDR10 content.
>=20
> Could you pelase provide the 'lsusb -v' output for that device ?
>=20
>> P010 stores 10-bit Y and interleaved UV samples in 16-bit =
little-endian
>> words, with data in the upper 10 bits and zeros in the lower 6 bits.
>> This requires 2 bytes per sample, so bytesperline is wWidth * 2.
>>=20
>> V4L2_PIX_FMT_P010 was added to the V4L2 core in commit 5374d8fb75f3
>> ("media: Add P010 video format").
>>=20
>> Based on the community DKMS patch from awawa-dev/P010_for_V4L2.
>>=20
>> Link: https://lore.kernel.org/linux-media/[email protected]/
>=20
> Please fix your e-mail setup to avoid this.
>=20
>> Link: https://github.com/awawa-dev/P010_for_V4L2
>> Signed-off-by: Oliver Collyer <ovcollyer@mac.com>
>> ---
>> drivers/media/common/uvc.c       | 4 ++++
>> drivers/media/usb/uvc/uvc_v4l2.c | 3 +++
>> include/linux/usb/uvc.h          | 3 +++
>> 3 files changed, 10 insertions(+)
>>=20
>> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
>> --- a/include/linux/usb/uvc.h
>> +++ b/include/linux/usb/uvc.h
>> @@ -109,6 +109,9 @@
>> #define UVC_GUID_FORMAT_M420 \
>> 	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
>> 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>> +#define UVC_GUID_FORMAT_P010 \
>> +	{ 'P',  '0',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
>> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>>=20
>> #define UVC_GUID_FORMAT_H264 \
>> 	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
>> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
>> --- a/drivers/media/common/uvc.c
>> +++ b/drivers/media/common/uvc.c
>> @@ -40,6 +40,10 @@ static const struct uvc_format_desc uvc_fmts[] =3D =
{
>> 		.guid		=3D UVC_GUID_FORMAT_M420,
>> 		.fcc		=3D V4L2_PIX_FMT_M420,
>> 	},
>> +	{
>> +		.guid		=3D UVC_GUID_FORMAT_P010,
>> +		.fcc		=3D V4L2_PIX_FMT_P010,
>> +	},
>> 	{
>> 		.guid		=3D UVC_GUID_FORMAT_UYVY,
>> 		.fcc		=3D V4L2_PIX_FMT_UYVY,
>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c =
b/drivers/media/usb/uvc/uvc_v4l2.c
>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>> @@ -235,6 +235,9 @@ static u32 uvc_v4l2_get_bytesperline(const struct =
uvc_format *format,
>> 	case V4L2_PIX_FMT_M420:
>> 		return frame->wWidth;
>>=20
>> +	case V4L2_PIX_FMT_P010:
>> +		return frame->wWidth * 2;
>> +
>> 	default:
>> 		return format->bpp * frame->wWidth / 8;
>> 	}
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart


--Apple-Mail=_395F480C-E579-46B0-8D55-5BA41EE33EE6--

