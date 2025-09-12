Return-Path: <linux-media+bounces-42393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CAFB54405
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 09:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6C894E27A9
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 07:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68CA2D1F4E;
	Fri, 12 Sep 2025 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="ZqUQ6Wr1"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00B2D0275;
	Fri, 12 Sep 2025 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662652; cv=none; b=h79SlE7de/K5pNYDJn69L0sRowZxw33nR40ovb5F0+5PwzkNbaX0D9epXQ0/SoATMxNsObjfXYelbk3EypXPU1+6hiO+BvSN7M8ktAwyJT0j8EzdxzCSS1HeLEMDmHYY/KgIcCMIJ0C7zZ3S1R+W2ltM2tkH9kGjvBi0EH9SaeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662652; c=relaxed/simple;
	bh=otXdfEFmhEWFvHLmENWq/LeGqYVbbqtvKgbHLa+LImI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m3fGNekVggQWvrbQ8qaLXPugvsHC92RQd5+pn3g1p0CAdqGPWT8zaCRH1MEKCcETGSL6s03jZHDrX9XwtCgJiiERWozZoL6OkcWWTvMDVcs6UzqZusBdauf0esBEivfrAERxaDB1BQYOWUGU2CfaPW+zEkTil3bg2T3j/5MEeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=ZqUQ6Wr1; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OJRKg/kA9AqnWia5YCVq3lzJGRkUdrtoW6qzbaRQ3sU=; b=ZqUQ6Wr1icPUU5Tte4ibl4YJ2H
	sy979HyfPINsHLnTBYVg/eLciZW2oCI2EiDvmXVqlgppbpJi3yvtLbLPD9AnpIiDCBUiikUncrA9I
	TNGhFtbujjdDR/2PU2BftrpW6BBSpSMv2592Mu+FONLVOuKObkHE5F3AqtdgN3Ws8aoc=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:49496 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uwyLE-008rCR-IO; Fri, 12 Sep 2025 09:37:10 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH v3 0/2] media: add Himax HM1246 image sensor
Date: Fri, 12 Sep 2025 09:37:05 +0200
Message-Id: <20250912-hm1246-v3-0-3b89f47dfa43@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHNw2gC/2WMyw6CMBBFf4XM2prpFFpw5X8YF30hXYCmJY2G8
 O8WFmri8tzccxZIPgaf4FQtEH0OKdynAuJQgR30dPMsuMJASA3WKNgwcqol66RB67RRSlgo50f
 0fXjuocu18BDSfI+vvZv5tv4lMmfIBHYdOsWNrensx95P7qhn2BKZvlpD8qNR0aRpW2pJaaGbX
 21d1zcwuelv0wAAAA==
X-Change-ID: 20250403-hm1246-96b0cdab773c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Tarang Raval <tarang.raval@siliconsignals.io>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Jingjing Xiong <jingjing.xiong@intel.com>, 
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hao Yao <hao.yao@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hello,

this series adds support for the Himax HM1246 image sensor.
The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
array size of 1296 x 976.
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
Changes in v3:
- Bindings: Remove bus-type and add default polarity values
- Select V4L2_CCI_I2C
- Convert additional macros to use HZ_PER_*
- Replace cur_mode with v4l2_find_nearest_size()
- Remove duplicates in the register init sequence
- Use container_of_const
- Check return of hm1246_update_controls()
- Correct multi-line comments
- Replace hm1246_cci_write_cmu()
- Consistently use hm1246->dev
- Use pm_runtime_put_autosuspend()
- Remove v4l2 event handling
- Convert to devm_v4l2_sensor_clk_get()
- Configure PM before registering subdev
- Link to v2: https://lore.kernel.org/r/20250526-hm1246-v2-0-6b882827a3a5@emfend.at
- Depends-on: https://lore.kernel.org/all/20250707143253.167910-1-mehdi.djait@linux.intel.com/

Changes in v2:
- Use macros for 64-bit division
- Avoid compiler warnings about potentially uninitialized variables
- Fix two uses of dev_err_probe
- Link to v1: https://lore.kernel.org/r/20250403-hm1246-v1-0-30990d71bc42@emfend.at

---
Matthias Fend (2):
      media: dt-bindings: i2c: add Himax HM1246 image sensor
      media: i2c: add Himax HM1246 image sensor driver

 .../bindings/media/i2c/himax,hm1246.yaml           |  113 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   10 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/hm1246.c                         | 1427 ++++++++++++++++++++
 5 files changed, 1559 insertions(+)
---
base-commit: 7aac71907bdea16e2754a782b9d9155449a9d49d
change-id: 20250403-hm1246-96b0cdab773c

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


