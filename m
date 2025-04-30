Return-Path: <linux-media+bounces-31380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE6AA455F
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C37C7AF597
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6419621ABB3;
	Wed, 30 Apr 2025 08:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bg/pJU9k"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F511DF98B;
	Wed, 30 Apr 2025 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001687; cv=none; b=KdJWEhPaOQ7rc21twWmlU4KsvkvgZ/WNPqX46NMWeSrfjWTKecKNPrx063cC3s0UyPlTQCKehUZFug4JmQraUEoJvW0aXaFarbboJYU4XIf6M5tqyG9w732xkrcDvxk5cnla2jw4nt8PATVj0PyCYKJ1ud0cBXFMlvUCV4D0di8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001687; c=relaxed/simple;
	bh=6q9qsUeVrZkFKWD/cX+YQyeHAlagANDwh1NSxGjeCjs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=FmpbE9oxZ96Puc2+Kn31QmVhHDD30eFwLmTdc23R95x8/QV/R5LVysvz9AVl0dh19VEiPSwhmoGQ3C6t4LjF4zHxfcIIMi/YrKU7tM48br5KWPAKIOk5QSpnhcZIf5H3ORvXI/KYXvPBZEazgfTanzuXSLSGZ7s6+GoBO2mFM5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bg/pJU9k; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U777fV004534;
	Wed, 30 Apr 2025 10:27:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=gjW9ik0Vdl+i9e3FBAPSXm
	84CQMS+y93ODapRLzXvIM=; b=bg/pJU9ktsNK6MVGwM8rTwJQI2GnY3fGtmbRJm
	Te+3VAyjYxidZiyTa8c05M36ZbYOhm0/Yx23RdvYfssD0NGktBgFyf37TQIGEMcH
	R4kRohT6Dl1EfaW7o5U00AofKsRLnLajPLbGMyOW+pGQk4VnjlXQt6j1OikEdFCg
	aBbtWcv4I/PzAIQidR8b+42CWSaJisej+91awQ+0i/J9mQpxVeBAOtkqTe7tU8xS
	RnwxRCGK6nPZLH3a9GxUKaCvQuurzVKvbNaXSnW86twNnsvMegT25bD3sVYKBvqP
	jXt7eg3FQBTDB3bRlqPJ38kMpsYPCu/NrvCg1XlGF0S10UqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tf1wp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:27:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 875034007A;
	Wed, 30 Apr 2025 10:26:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 059029AD323;
	Wed, 30 Apr 2025 10:24:40 +0200 (CEST)
Received: from localhost (10.252.1.18) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 10:24:39 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v7 0/2] media: Add support for ST VD55G1 camera sensor
Date: Wed, 30 Apr 2025 10:24:37 +0200
Message-ID: <20250430-b4-vd55g1-v7-0-761b72495ac3@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXeEWgC/3XQTW7DIBAF4KtErEsEw4wNXfUeVRf8JiwaRyZCr
 SLfvdibksZdDuJ7bzR3VuKcY2GvhzubY80lT5c2jC8H5s/2coo8hzYzEEACgLhDXgPRSXIXnBH
 BRWWcYu3/dY4pf21Z7x9tPudym+bvLbrK9XUvpUouuApkhYYkkjVvaSrlWG5HP32usZtRoP8aH
 eTg0I4mwaNZuyv89qGQvYVmhdfWaYvaEz1b1VvorVp3NcpoQoEj7fTivxbXndHJROiHUfhnS73
 F3lKzRqd2IIjR7/UOvR17OzQrNYkkdSsHfLTLsvwAcIslLwQCAAA=
X-Change-ID: 20250225-b4-vd55g1-bdb90dbe39b3
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01

Hi,

This serie adds support for the STMicroelectronics VD55G1 camera sensor.
The VD55G1 is a monochrome global shutter camera with a 804x704 maximum
resolution with RAW8 and RAW10 bytes per pixel.
Datasheets and other documentation can be found at st.com [1].
A lot of inspiration was taken from the imx219 and the vd56g3 serie.
It is compatible with libcamera. Tested on Raspberry Pi 4 and 5, with and
without libcamera.

[1] https://www.st.com/en/imaging-and-photonics-solutions/vd55g1.html#documentation

Regards,
Benjamin

---
Changes in v7:
- Fix autosuspend
- Rework active state
- Fix vd55g1_power_off() call order
- Merge vd55g1_check_sensor_revision() in vd55g1_detect()
- Fix mipi_rate semantics
- Add defines for XCLK and MIPI frequency bounds
- Fix data_rate not being u32
- Fix comment case
- Don't grab hblank_ctrl
- Rename vd55g1_lock_ctrls() to vd55g1_grab_ctrls()
- Remove spurious braces in vd55g1_update_expo_cluster()
- Move get_regulators() above probe()
- Add missing 'vd55g1_' prefix to some functions
- Factorize get_*_by_code()
- Refactor ctrl_to_sd() to ctrl_to_vd55g1()
- Simplify i2c_client->dev accesses
- Explicit pattern generator names
- Fix some registers values being defined as struct instead of macros
- Properly indent dynamic registers values
- binding: Split description in 2 paragraphs
- Link to v6: https://lore.kernel.org/r/20250407-b4-vd55g1-v6-0-1850f18b1f24@foss.st.com

Changes in v6:
- Use return 0 whenever possible
- Remove unneeded return values initializations
- Fix traces format
- Fix comment typo
- Link to v5: https://lore.kernel.org/r/20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com

Changes in v5:
- Include missing proprety.h header
- Move link_freq to device structure
- Update get_vblank_limits() prototype
- Add BUILD_BUG_ON() in vd55g1_update_patgen()
- Drop hdl->error check
- Use device_property*() instead of of_property*()
- Drop OF requirement
- Improve runtime pm usage
- Various syntax fixes
- Link to v4: https://lore.kernel.org/r/20250402-b4-vd55g1-v4-0-84b1f54c670c@foss.st.com

Changes in v4:
- Fix data-lanes syntax in binding
- Link to v3: https://lore.kernel.org/r/20250402-b4-vd55g1-v3-0-393985404759@foss.st.com

Changes in v3:
- Add maxItems to data-lanes in binding
- Drop redondant 'binding' in binding commit message
- Link to v2: https://lore.kernel.org/r/20250401-b4-vd55g1-v2-0-0c8ab8a48c55@foss.st.com

Changes in v2:
- Fix device tree binding mistakes
- Drop linux media git from MAINTAINERS file
- Fix coding style mistakes
- Drop vd55g1_err_probe wrapper
- Fix 32bits build
- Fix config symbol help paragraph being too short for checkpatch
- Link to v1: https://lore.kernel.org/r/20250328-b4-vd55g1-v1-0-8d16b4a79f29@foss.st.com

---
Benjamin Mugnier (2):
      media: dt-bindings: Add ST VD55G1 camera sensor
      media: i2c: Add driver for ST VD55G1 camera sensor

 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |  133 ++
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/vd55g1.c                         | 1965 ++++++++++++++++++++
 5 files changed, 2119 insertions(+)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250225-b4-vd55g1-bdb90dbe39b3

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


