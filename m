Return-Path: <linux-media+bounces-29350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8674A7AFDD
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 23:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14B8C3BF7E2
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 20:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E9B2676E5;
	Thu,  3 Apr 2025 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6PHFAiaF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C762673B3;
	Thu,  3 Apr 2025 19:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743709443; cv=none; b=k0Ezv0MotmCqfjTjdfT/Vr8U4o1YWzIptMRrv0XAgpd5u3jS7dlbdIEDIY1majxOHOSeKyn8E7N5gDGimUN/RgjCuYl2Rrps9O7GwE2nCN8hpcjwNGCczOEfhZGNgm3L/6ROgzGcKj9Sq8jciYJWWA1H8oc45LtTdONsvYINKqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743709443; c=relaxed/simple;
	bh=qF9Zj3PjrQic1A7PpKJ4c/FD9M3b2SUmVmAcwCGxI0U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Npfs+Q488812Q4KKmJTNCYe0eIm8j7GszGYSU9B0BkWFcublqsQFfA2DCWD5W7NfzicO8x/t4eBWWQ3DYRa7YyFQ0NlZ2gxTz1hBiuWH73RY9MBjm8vKcRiRYJPBk3a04n8Fc6SfXCy8XjxwuAZ8bc9bnRyGUTjCLpIIwL5LDxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6PHFAiaF; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533DHOKb014638;
	Thu, 3 Apr 2025 21:43:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	selector1; bh=Vz4wecqC/0d7dNYyMnoNHC/GR55ejTkOcvNdw4GzVz4=; b=6P
	HFAiaFetkkl1X/U1ynu0SU1wbiGNPymgyNSbYyhtsUQJ4unZoVAESfFSipUfruF/
	TR8wzc1GtyQoMJNzNcUBkr3zFXh/ACBBai8zGeEHf/GuqHSVDyzDJlzUc2s3+PpF
	FgAbamN6PW+wQDQZ1n6eDpXQLnsrNs8K6d2YvGxn0Fnu+D1cJ8tc46APHGaThUot
	VVpAJIYhojiRQzAEViIrYBpaELMdsEP9cIKAIEfnYLUMylQ2u/aP9JUtUchbeeOp
	jtO1grKOPCytTK3VK6yT2x4oqJk/G7F/kfkN+Ykn8NDNi3+l2VcMloofhV8GDekd
	yGPEKfZZwJX9xczfRg0w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45ryyfruvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 21:43:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1946E4004C;
	Thu,  3 Apr 2025 21:42:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4ED0F90F8E6;
	Thu,  3 Apr 2025 21:40:58 +0200 (CEST)
Received: from localhost (10.130.72.242) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 21:40:58 +0200
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
To: <benjamin.mugnier@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tomm.merciai@gmail.com>
Subject: [PATCH v4 0/2] media: Add driver for ST VD56G3 camera sensor
Date: Thu, 3 Apr 2025 21:40:32 +0200
Message-ID: <20250403194034.2324-1-sylvain.petinot@foss.st.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_08,2025-04-03_03,2024-11-22_01

Hello,

This serie adds support for STMicroelectronics VD56G3 camera sensor.
This is a 1.5M pixel global shutter camera available in both Mono (VD56G3) and
colour (VD66GY) variants.

The following features are supported:
- Auto exposure with expo bias or
- Manual exposure with analog / digital gain
- H/V flip
- vblank/hblank/link freq
- Test pattern
- Supported resolutions in both raw8/raw10 :
   - 1124x1364
   - 1120x1360
   - 1024x1280
   - 1024x768
   - 768x1024
   - 720x1280
   - 640x480
   - 480x640
   - 320x240

This driver supports coldstart parameters for internal AE feature.
To make it work, the driver save gain/expo values in ctrl's cur.val during
poweroff phase. This implementation transgress V4L2 rules... Any advice to make
it proper would be greatly appreciated.

Driver tested on RB5 and RPI (with and without libcamera) for V1. V2, V3 and V4
mainly tested on RPI.

---

v3 -> v4:
- driver: Revert to pm_runtime_put_autosuspend()
- driver: Drop HAS_EVENTS and event handlers
- driver: Make native resolution the default one
- driver: Implements get_frame_desc() operation
- driver: Use enable_streams and disable_streams ops
- driver: Move asm/unaligned.h to linux/unaligned.h
- driver: Variable data read using cci_read() doesn't require initialization
- driver: Drop enum vd56g3_expo_state definition

v2 -> v3:
- driver: Unify PM vd56g3_resume/suspend functions with vd56g3_power_on/off
- driver: Add v4l2_fwnode ctrls parse and addition
- driver: Exposure is bounded by a minimum number of lines
- driver: Minor improvements while handling return values
- driver: Move to __pm_runtime_put_autosuspend()
- driver: Follow rules and convention for driver naming
- dt-bindings: Improve st-leds description
- dt-bindings: Add missing additionnalProperties on 'port'
- dt-bindings: vd56g3 is a video-interface-device type of device 
- dt-bindings: Follow rules and convention for bindings naming

v1 -> v2:
- driver: Drop VD56G3_NUM_SUPPLIES
- driver: Rename 'ext_clock' to 'xclk_freq'
- driver: Make use of 'container_of_const' instead of 'container_of'
- driver: Drop usage of WARN()
- driver: Move a few variables to unsigned int
- driver: Add defines for the different Cut revisions
- driver: Replace dev_warn() by dev_err() in situation we're returning errors
- driver: Ensure sensor has dedicated 3.5ms to boot after reset
- driver: Take into account return value of __v4l2_ctrl_modify_range() and
  __v4l2_ctrl_s_ctrl() functions
- driver: Merge vd56g3_power_on() and vd56g3_boot()
- dt-bindings: Lowercase power supply names
- dt-bindings: Drop clock-lanes property
- dt-bindings: Drop unecessary 'items' contraint for lane-polarities
- dt-bindings: Drop unused labels

Sylvain Petinot (2):
  media: dt-bindings: Add ST VD56G3 camera sensor
  media: i2c: Add driver for ST VD56G3 camera sensor

 .../bindings/media/i2c/st,vd56g3.yaml         |  139 ++
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/vd56g3.c                    | 1569 +++++++++++++++++
 5 files changed, 1729 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
 create mode 100644 drivers/media/i2c/vd56g3.c

-- 
2.17.1


