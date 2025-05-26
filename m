Return-Path: <linux-media+bounces-33342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886DAAC3A72
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 200EC1707FB
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 07:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131E61DED40;
	Mon, 26 May 2025 07:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="HnX+VoA8"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A814B08A;
	Mon, 26 May 2025 07:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748243923; cv=none; b=U/StmaPRMLaHNeV1e7LM4KoqzvxCYIZx/u3t4Dq5QkxsGvbHOeH8aPBhDKgArnA2VjshNfW8lz7I37fT3+rtR6x1Q//5nixhKrHMEpS5qw7NXcwsv+KiFUGl6mz4ZbgGmm24uFHVapcm0g5ufdVbBfPZ23x5h25NoIARStA77OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748243923; c=relaxed/simple;
	bh=uYwsoGBRi4UEMldh/TOZkUyO2U3VyrozBxpBoaecFgM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=prQRXBUdyVBxZzIOkbbCxZDlnDDpgrodMkYDVS+7jtZzRAAk+dQ+dSX+4+HVTwf/rEismM+6HfOt2MlaGZiHkIifB3oT8eaJmOZH28oV6l/nVVPUUG6arv1HzBnepEgh+dwXNIsWFW3aXU3YcFhawfYsoXbOOfMcvFqSS11PXrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=HnX+VoA8; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=W7k8yWwZg01j6cbxI2o5cZM1DGrlB/tRDyaJlg6zKWY=; b=HnX+VoA89TnDler0SpqeXuCmbO
	gOWyZzzjc2sOUSV+/Er9si7Qll2a3xnZb+l9RnArRlhhhwQBt0P1BX/J4mvloXc7G1RBmuI8Us2Sg
	MA4AUiVfc1r9iUaEaz6w8pEHFyBdkuLDkrTBtJ27KC/e8mpBS3Xfi9N2JL1kM2COaP8Y=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:50860 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uJRo3-0004nZ-P9; Mon, 26 May 2025 08:59:32 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH v2 0/2] media: add Himax HM1246 image sensor
Date: Mon, 26 May 2025 08:59:26 +0200
Message-Id: <20250526-hm1246-v2-0-6b882827a3a5@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4RNGgC/2XMSw6CMBSF4a2QO7bm9iFNHbEPw6CPi+2AYlpCN
 IS9W5k6/E9Ovh0qlUQV7t0OhbZU05JbiEsHPtr8JJZCaxAobqhQsjhzoXpmeoc+WKe19NDOr0J
 Tep/QY2wdU12X8jndjf/WP2LjDJlEYzBo7rwSA80T5XC1K4zHcXwBTjcWh5wAAAA=
X-Change-ID: 20250403-hm1246-96b0cdab773c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hello,

this series adds support for the Himax HM1246 image sensor.
The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
array size of 1296 x 976. The datasheet can b
Currently, only the native RAW mode is supported. Other modes and the
internal image signal processing pipeline are not currently supported.
The data sheet is available on the manufacturer's website [1].
Tested on i.MX8MP hardware. A Toshiba TC358746 bridge was used to convert
the sensor's parallel video output into MIPI signals for the i.MX8MP.

Best regards
 ~Matthias
 
[1] https://www.himax.com.tw/wp-content/uploads/2024/03/HM1246-AWD_DS_v01.pdf

v4l2-compliance 1.28.1, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev4:

Driver Info:
        Driver version   : 6.12.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev4 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 15 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev4: 45, Succeeded: 45, Failed: 0, Warnings: 0

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Changes in v2:
- Use macros for 64-bit division
- Avoid compiler warnings about potentially uninitialized variables
- Fix two uses of dev_err_probe
- Link to v1: https://lore.kernel.org/r/20250403-hm1246-v1-0-30990d71bc42@emfend.at

---
Matthias Fend (2):
      media: dt-bindings: i2c: add Himax HM1246 image sensor
      media: i2c: add Himax HM1246 image sensor driver

 .../bindings/media/i2c/himax,hm1246.yaml           |  111 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |    9 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/hm1246.c                         | 1421 ++++++++++++++++++++
 5 files changed, 1550 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250403-hm1246-96b0cdab773c

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


