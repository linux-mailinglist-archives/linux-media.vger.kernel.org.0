Return-Path: <linux-media+bounces-41717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8D7B424E7
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5B08683CE8
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16484258CF1;
	Wed,  3 Sep 2025 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="ErY3l/KV"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14E63CF;
	Wed,  3 Sep 2025 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912611; cv=none; b=kbczkalBrbmuZ6URa6JsI17icbe1dEzR8cdxuWcvSouyO9NQMMMMJo8KkwSr2ho333H6YW7788ntw++XqcOzCM8urX8yFRHyyvw7q8mio3hE36aUBTjyevenAxoQLrzh9PtNbk2P5eUz3K6J0Tnf2jrT5NB3WxZAA5bTgisAmjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912611; c=relaxed/simple;
	bh=ttg+OChwUbkpoVDWCw3xGKa0n3d+t7aSDC55RG2VqSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPUO4dspRjA6SnZ1vMSE2qOdaDQWxKeLKvvUruLq6NHPfUV5V8uSpbf9KrNK4kO5LDSmmWSInjPl/AnJubrKPTAASL2vQA/Wysxrsjp2x4SGlz/ltqcCmdPZOKes5Cp//d9a5ErlVJLxq/5W1OR12ETpqMKuCaDclhSSgYzB1eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=ErY3l/KV; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=a3G9xHdW/VxHSePvTIzerhYn95SpSnVWLe7bCZKfh6U=; b=ErY3l/KVYqsCbtBZ+lyIGVK6W5
	WIbVl4M+Tc128AqaMRvcelzBJaKWXq8+iGnxTyjvVOzsNAU7D9LLM61gxtDs5DVXK9RVlMOIQ75vW
	duwF15DALAsLbMOX3tYlNgNiFfAsR09Jr49oSG+WNy284Vx7xELoC4QkQ5ZlYs1bUmSk=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:61793 helo=[192.168.0.207])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1utpDx-005LvW-4e; Wed, 03 Sep 2025 17:16:38 +0200
Message-ID: <8417d761-114b-4e41-8a4a-9eac2600637f@emfend.at>
Date: Wed, 3 Sep 2025 17:16:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: add Himax HM1246 image sensor
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250526-hm1246-v2-0-6b882827a3a5@emfend.at>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20250526-hm1246-v2-0-6b882827a3a5@emfend.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi all,

since I sent the first version of this patch series quite some time ago 
and, apart from the bindings there has been no feedback, I wanted to 
check whether there might be any fundamental concerns (such as the 
sensor being somewhat older)?

If there are no general objections to this driver, I would be very 
grateful for any comments or suggestions for improvement.

Thanks
  ~Matthias

Added Sakari and Laurent to CC.

Am 26.05.2025 um 08:59 schrieb Matthias Fend:
> Hello,
> 
> this series adds support for the Himax HM1246 image sensor.
> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
> array size of 1296 x 976. The datasheet can b
> Currently, only the native RAW mode is supported. Other modes and the
> internal image signal processing pipeline are not currently supported.
> The data sheet is available on the manufacturer's website [1].
> Tested on i.MX8MP hardware. A Toshiba TC358746 bridge was used to convert
> the sensor's parallel video output into MIPI signals for the i.MX8MP.
> 
> Best regards
>   ~Matthias
>   
> [1] https://www.himax.com.tw/wp-content/uploads/2024/03/HM1246-AWD_DS_v01.pdf
> 
> v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> 
> Compliance test for device /dev/v4l-subdev4:
> 
> Driver Info:
>          Driver version   : 6.12.0
>          Capabilities     : 0x00000000
>          Client Capabilities: 0x0000000000000003
> streams interval-uses-which
> Required ioctls:
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/v4l-subdev4 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 15 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
> 
> Total for device /dev/v4l-subdev4: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
> Changes in v2:
> - Use macros for 64-bit division
> - Avoid compiler warnings about potentially uninitialized variables
> - Fix two uses of dev_err_probe
> - Link to v1: https://lore.kernel.org/r/20250403-hm1246-v1-0-30990d71bc42@emfend.at
> 
> ---
> Matthias Fend (2):
>        media: dt-bindings: i2c: add Himax HM1246 image sensor
>        media: i2c: add Himax HM1246 image sensor driver
> 
>   .../bindings/media/i2c/himax,hm1246.yaml           |  111 ++
>   MAINTAINERS                                        |    8 +
>   drivers/media/i2c/Kconfig                          |    9 +
>   drivers/media/i2c/Makefile                         |    1 +
>   drivers/media/i2c/hm1246.c                         | 1421 ++++++++++++++++++++
>   5 files changed, 1550 insertions(+)
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250403-hm1246-96b0cdab773c
> 
> Best regards,


