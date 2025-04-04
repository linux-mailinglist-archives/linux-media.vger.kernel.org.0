Return-Path: <linux-media+bounces-29410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC2A7BFF9
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 16:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12D69173A25
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 14:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5951F5402;
	Fri,  4 Apr 2025 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DcKaLlwv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176481F427D;
	Fri,  4 Apr 2025 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778451; cv=none; b=EOB60ZF3cMDwr8724w+Smlv5NuAL/ZBgLD1VQx8cXue4DQCJPmlh+rg2uvOhqJci+wGer8/ImFaAuUkHxJKTET3Oglx0MWgPvlU6RT6k9znO+lzuuY0fBu0nWf/d0xG/jMwJPBYCXFpJIB+ZPKaD4uo43iyNe5xjXlY9acG5Od8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778451; c=relaxed/simple;
	bh=UStvosSNAQmkr31Xk9qwjYeXXCSO22rLfxuxakC6PCM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=B6mHsoPHrPPZQauMA0ehCqwl74n5jLXHwakNS3SBSZEYzg6HU5HiDzVITD8KQTrrmLDWv+AaOS+a9fI98d0j+lgLs/vSWDo9JIUd5LK6U8PPXe36binv7EuqExEWjrMyExmXNoBNjJjBI+FVhcIhfBkA5yCZ8q2VAanoFMhbYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DcKaLlwv; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534C53uR025369;
	Fri, 4 Apr 2025 16:53:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=jD1SktgJEa/ehkjgrs+b4u
	O3+aClm9z3KUsPiS3Ue78=; b=DcKaLlwvKW9UKBuj1UxvIWqnnUZInxuFhk8rbr
	GSigQyVKuWhjpZbp85m0mR0w3GvLu80Zq9uueb5Sd+FbPczlO4pLp87jpSv2m9UN
	bQ9hvZRHvUzm9Szb6qDjwj1KxZCa+UFOh23S915LJlFXYMgsa2+QRtMd0gLbiXdx
	9yHLqK86NrKFw0gw4rbG3FB0dSLk0j/PKRwQRY9wml1ThLYj2UcwZOfqCHqOb+H5
	jxznL5QaMYG8RmMspBvHvKPNYMqz0LBGrHi/gd30oZwO7Gka5Pebk2QVpimAUhF5
	HRUGilU1p/B72uTokVvZRNgYhxgu2NQ8C9bOqCrGHCH9fEZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45t2cs3syp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 16:53:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A82524004B;
	Fri,  4 Apr 2025 16:52:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C937893CD83;
	Fri,  4 Apr 2025 16:50:53 +0200 (CEST)
Received: from localhost (10.252.23.40) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Apr
 2025 16:50:53 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v5 0/2] media: Add support for ST VD55G1 camera sensor
Date: Fri, 4 Apr 2025 16:50:50 +0200
Message-ID: <20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMrx72cC/3XOTW7DIBAF4KtErEs0DDMxdNV7RF3wm7BoXJkIN
 Yp89xpv6rTp8iG+9+YuappKquJ1dxdTaqWW8bIEftmJcHaXU5IlLlkgIAMiS0+yReaTkj56C9E
 nbb0Wy//PKeXytXYd35d8LvU6Tre1uqn++qylKQlSR3ZgMEN29i2Pte7rdR/Gj167Go3mtzFRH
 Ty5wWZ8NH274c8egdpaXCwE47xxZALzX6u3FrdW91uttoYJaOAnu/SvpX4zeZWZwmGA8Gjnef4
 G72msR4wBAAA=
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
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_06,2025-04-03_03,2024-11-22_01

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

 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |  132 ++
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/vd55g1.c                         | 2005 ++++++++++++++++++++
 5 files changed, 2158 insertions(+)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250225-b4-vd55g1-bdb90dbe39b3

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


