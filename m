Return-Path: <linux-media+bounces-31445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4437AA4ABC
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EE7617C284
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6CC25A2DB;
	Wed, 30 Apr 2025 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JfbO6cRz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9849C1DC9BB;
	Wed, 30 Apr 2025 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014935; cv=none; b=nDm7xUCKC5Fu1kRIsEKOCjWXGt8YFLrweLYH5UFMhs2NHeCiMdS3LUCuht3dlXcg8jl7+cjnxTlE7qiDD0GOKnKwZALy0dNl57wSEhfYColTK7gsnZPGrjrZpJ0qPIaTwiVjv/JFy550CiG7N8FbquoMBFeKn0PC9cdC80SzWBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014935; c=relaxed/simple;
	bh=SgKvyzH82dDsJ9cckjQ9snw/SaJ/mjS84En29HfGEVE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OYkqyRoGQG17f0tQW3jLE1C7k+/pgEVYzlDE38YzEuFrsHBVbv1YTlX5jnS2QvE1tYk17brHCpO8U0DbD8wZVh57YS7GK8r0I7hgbxPz8wyDTOeWbft9guNcUeK+74He6E2NF12q2RW6SFKPn8L0H/+gaPRYfbBYv8hm1v2wgHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JfbO6cRz; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U7VUlh004545;
	Wed, 30 Apr 2025 14:08:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	selector1; bh=lup72bCm83vqE2HmKaYnCv/x0iH/O0m14VmJPv2k+kE=; b=Jf
	bO6cRzA9IkDKys9/gsTALiQm/yIK6zw7Fa+dVruBDbbNT+RpTwwLBU1OGRN2kIw7
	Thn1XZjpxPwYmMSvjZWHmoZqdoXfC94AwSBxVLoeaSA0L1GB1V5lI37xOBFR3Vgc
	QBWsSUyRFM7xDrl8+HXDTPBUpuKIG0jCCnK90IdvnB+Q8Q1ENmPx/tT5sTbG1Xsf
	gx7zPndxqQEfhSIWOjh5XZo6eVE+HGGSRMD8DzkHiZOVt05bOZLsGKDeChsewbXk
	ln5SnYNZpB1T4c5K1F8Rg1OUQyjzf7eqLcO+4qwapL/OMIxXFwBYohOdpeHJbWS+
	/s9nCYSVZDJujftXQQUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tf2y6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 14:08:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E467340079;
	Wed, 30 Apr 2025 14:07:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD4B8A77C63;
	Wed, 30 Apr 2025 14:05:13 +0200 (CEST)
Received: from localhost (10.130.72.242) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 14:05:13 +0200
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
To: <benjamin.mugnier@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tomm.merciai@gmail.com>
Subject: [PATCH v7 0/2] media: Add driver for ST VD56G3 camera sensor
Date: Wed, 30 Apr 2025 14:05:07 +0200
Message-ID: <20250430120509.17873-1-sylvain.petinot@foss.st.com>
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
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01

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

v6 -> v7
- driver: Make use of pm_runtime_dont_use_autosuspend() in probe/remove
- driver: Fix Ctrl handler lock that might not be free in vd56g3_subdev_init
- driver: Adjust log/error messages (No trailing dot, add '\n')
- driver: Make 'nb_gpios_leds' an unsigned variable

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
 drivers/media/i2c/vd56g3.c                    | 1583 +++++++++++++++++
 5 files changed, 1743 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
 create mode 100644 drivers/media/i2c/vd56g3.c

-- 
2.17.1


