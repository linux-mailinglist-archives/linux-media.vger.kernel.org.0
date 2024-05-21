Return-Path: <linux-media+bounces-11705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED88CB22F
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 18:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 892531F218A0
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 16:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEBB147C6B;
	Tue, 21 May 2024 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gVZEXW60"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1F1E4A4;
	Tue, 21 May 2024 16:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716309067; cv=none; b=Qqj6FvXsk1EmFgUGf+EnLwEcNNM0niBuBIE32/KBGiB+p2DyUH20MtRvOGtAIeYWJsUHkzKi/G3hBO1x+RzVgP1Cf5KVWgL4uS9QZ8NyV1/MOPuh+SsVjK+OeEQDr7ICbSWw/voNiBDR2NZQVADICZIkR0dKN/ec71DkhjdxUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716309067; c=relaxed/simple;
	bh=FMl+E4jfoN7oTa6YLwTsI1b/uL+7jKgcaO8OZlenVEw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aQBlfEkM/DVvFquiDGoKuchYj/2Rh15PtciNIU0ya74hIRHeh8q6jRPS1RCBg1Iw+v2db7iXXq8n+vknRHS8T9qGWJMXiLlWfXqyHAPmye8Ed9a5nvv4E7sAFzAxU2rkblMOh/68YcFNlKEWg1QMmRR0t2YKRdaOaOF+MBeo/pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gVZEXW60; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LGIeVt028299;
	Tue, 21 May 2024 18:30:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	selector1; bh=DZ3QqK4HUCKWcxC6Wcd8La1cfXmB3XP9BKGm8cABJ8E=; b=gV
	ZEXW60v/lzBv2FwfkzgFURQahk949//mRFuK7U3gZwLj/upTLngOkDev4L0zK4EQ
	O0fY+rmKKhkkkkkbKuhL6ub9OPn+AkHf0/SIyCJILVgEzeTM72dmmOMee+UTiPRu
	ROMZ4L8a/bAbG7RDWbUzFZj9x+eUwvyx+MJ0lAnXKwM+8cobm+OwG3WCgDLTUOgM
	J3O1ZMB+pLk9UJ0jHyryR44YOEt18QXkWV2jsgLrQhwH/ZMHXui9zuokMnACTgeC
	S/5dTXza/VC0L3D+rYin/XnDqlxsKI4aHbtSMUQ7Fb4fC6ELc7HFfQnkJwcqHoji
	TFjMpQcDMuGpAovYU9Mg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y8vqh8ntj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:30:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9AB0140044;
	Tue, 21 May 2024 18:30:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD7EB226FD7;
	Tue, 21 May 2024 18:30:22 +0200 (CEST)
Received: from localhost (10.130.72.242) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 18:30:22 +0200
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
To: <benjamin.mugnier@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] media: Add driver for ST VD56G3 camera sensor
Date: Tue, 21 May 2024 18:29:48 +0200
Message-ID: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01

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

Driver tested on RB5 and RPI (with and without libcamera) for V1. V2 mainly
tested on RPI.

---

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
  media: dt-bindings: Add ST VD56G3 camera sensor binding
  media: i2c: Add driver for ST VD56G3 camera sensor

 .../bindings/media/i2c/st,st-vd56g3.yaml      |  132 ++
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/st-vd56g3.c                 | 1608 +++++++++++++++++
 5 files changed, 1761 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
 create mode 100644 drivers/media/i2c/st-vd56g3.c

-- 
2.17.1


