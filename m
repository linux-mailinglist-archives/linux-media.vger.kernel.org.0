Return-Path: <linux-media+bounces-31129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2DA9E475
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 21:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 523EB189C4EB
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 19:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8621FCFEF;
	Sun, 27 Apr 2025 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="V7jV7xiE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B8F9D6;
	Sun, 27 Apr 2025 19:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745782414; cv=none; b=hmq/iY+XvWuPdu593zKXuEEiW5BF0fLmE2uKPVN7U0qI1C3DntQMG6z23IsUHmSFZT77azba1JWIEhjRjTzqYVMfLe7euTAMaj/VU9372DyJJSPIseo0EsYvDqRyP7Wi4iaD3kPXx/afM3InNnpMdx0Spg+i94drYIZBXVu4/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745782414; c=relaxed/simple;
	bh=9oi4yplSnlzJMTzQ2p+mhRZecKRRt3pazDy7rZvx+RA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VOCv7YHeXeuabxel9Kacn325ILONzYzY2h8DAqKa9CxbkG94p+XWniFilkieY3fPnsQ7rjtXATGoH8yi2xj6kG5C4N3ux1EM4Dq/qU7iG4XYhYGVz5LYw88jhRtqv5lLfXsjA6tGqY5bWB2Q3ig+bTYHbbXzO6PYn8bE1MixhGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=V7jV7xiE; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RGRuAE028805;
	Sun, 27 Apr 2025 21:33:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	selector1; bh=ah6fpeQh4L2NS5icT0jQjBgPqxmiQjO7jfltmhHBCEg=; b=V7
	jV7xiETPxuU7ixVWTJMNXfurVCAycOXjULuGmSLLP8JapalWESHR9YofTMwUEUyl
	A2y8QmqeJF0xvWj3cZMiMTme9c8o0k3+UWmtLMszclEp8eXlxS67Pbylr4X4qLIZ
	NOs+BopkKdfpsAxwYoHjF8wo1VN9CIcXRDOTaFd1oAUrzrBG+pWyKwjyCHV70+pu
	n3Op10+Z+45DBLvaNl1/EhAgvdmxo7LOLUBghWY3ywQ6Nqo0bh4wenEnDsdFp1jG
	slpXQbxL0QAriTwzXJm0x2ILajHOdjPAhNg292/XFejoc4iKsYPU4hM6LIONUCmv
	dTN6Y4F1DfSzrUV3hswQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468mwkv7p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 21:33:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F27FF40045;
	Sun, 27 Apr 2025 21:31:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B200A2E2F4;
	Sun, 27 Apr 2025 21:31:03 +0200 (CEST)
Received: from localhost (10.130.72.242) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 27 Apr
 2025 21:31:03 +0200
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
To: <benjamin.mugnier@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tomm.merciai@gmail.com>
Subject: [PATCH v6 0/2] media: Add driver for ST VD56G3 camera sensor
Date: Sun, 27 Apr 2025 21:30:48 +0200
Message-ID: <20250427193050.23088-1-sylvain.petinot@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_06,2025-04-24_02,2025-02-21_01

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

Driver tested on RB5 and RPI (with and without libcamera) for V1. V2, V3, V4,
V5 and V6 mainly tested on RPI.

---

v5 -> v6
Changes are mainly related to Laurent's comments on VD55G1 series [2] (which
could also apply to this driver):
- driver: Fix vd56g3_disable_stream() could failed at lowest framerate
- driver: Make vd56g3_power_off the exact opposite of power_on
- driver: Define macros for Min and Max External Clock Freq
- driver: Replace ctrl_to_sd by ctrl_to_vd56g3
- driver: struct vd56g3 keep pointer on struct device
- driver: Make test pattern naming more explicit

v4 -> v5
Following Sakari's comment on VD55G1 series [1], use device_property*()
instead of of_property*() and drop OF dependency.

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

[1] https://lore.kernel.org/r/20250402-b4-vd55g1-v4-0-84b1f54c670c@foss.st.com
[2] https://lore.kernel.org/all/20250422150746.GA23173@pendragon.ideasonboard.com/


Sylvain Petinot (2):
  media: dt-bindings: Add ST VD56G3 camera sensor
  media: i2c: Add driver for ST VD56G3 camera sensor

 .../bindings/media/i2c/st,vd56g3.yaml         |  139 ++
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/vd56g3.c                    | 1572 +++++++++++++++++
 5 files changed, 1732 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
 create mode 100644 drivers/media/i2c/vd56g3.c

-- 
2.17.1


