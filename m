Return-Path: <linux-media+bounces-17604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB8696C1B7
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 17:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07DDCB2ACBF
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 15:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB0D1DCB06;
	Wed,  4 Sep 2024 15:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="xq1+/M09"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862EB1DA2FE;
	Wed,  4 Sep 2024 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725462031; cv=none; b=llQjJ0DT49YzP8Zf7lOlNXJrRiIqOlKxj235AhRip+FlKyOQ1oJUS8wg288omNjRB092OzhozJYQlpeoVtlozTsvXyY48YvkdJVdHD/jg5Z+p9Gxv7kYJS7aTbTfzvfYesLnRVsnL8Gxnp1tppYUB2g9VocGBv+qaa7a/E+QlZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725462031; c=relaxed/simple;
	bh=zW4e45CB60Z3HQ+n2e3GFwm04wI38LW0ND8LG2idp9w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X4AFkf1pPM5Gahan6I9d3hpcsAlzGidYhPdHzW86NGhfeO6wQZk5EcaDiLOtg6rkFrRRJXZoVmxxGUrob2l/BPkdPfzdlej9z1acgsgVi2ko6wxB/jKzMczsHTVInWApPhO5Ob1NIgQUcE5HGjfd4GerztHt6uFvmzDNMd0nQZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=xq1+/M09; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484BRIhx000324;
	Wed, 4 Sep 2024 17:00:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	selector1; bh=rcWgdV/egi7FK/6UdgKIDWLx60pHLS+ExR89ETmusZA=; b=xq
	1+/M09qIBAgmqEbcwemTBS5KkPChFLlgk8aV1yWOCF/CuBR7XrdjMrXL69IVbzmM
	zRwUiAEUG2PfgMnDXCLlo7Sr1sNfM8EDgrqUmxFGcByZCD0hFItikxfUD3zqkfVk
	LwNzMw6MbE6N9tVsQ3yfQ5To5MWwpjlxutc92fEWt9/q+Yg7QvbRbAGcnUVfN/Ox
	bXNSqeybDadO70m4ZRWZtBTWIHxL38eaGuDFiFQ9btma2TtR27MtwjpTf/MED8Ay
	vjBtQ+7e7GTCygm89tluW3yLHo1O9YwU63KCbJCFIIQ8DFC67JsEoVG3VMLwbpEw
	ABDfev8H2I4nlGisg+Jw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41bt2d9qv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 17:00:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8868940053;
	Wed,  4 Sep 2024 16:58:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AED4E2828CD;
	Wed,  4 Sep 2024 16:53:01 +0200 (CEST)
Received: from localhost (10.130.72.242) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 4 Sep
 2024 16:53:01 +0200
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
To: <benjamin.mugnier@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tomm.merciai@gmail.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 0/2] media: Add driver for ST VD56G3 camera sensor
Date: Wed, 4 Sep 2024 16:52:36 +0200
Message-ID: <20240904145238.21099-1-sylvain.petinot@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_12,2024-09-04_01,2024-09-02_01

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

Driver tested on RB5 and RPI (with and without libcamera) for V1. V2 and V3
mainly tested on RPI.

---

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
 drivers/media/i2c/vd56g3.c                    | 1599 +++++++++++++++++
 5 files changed, 1759 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
 create mode 100644 drivers/media/i2c/vd56g3.c

-- 
2.17.1


