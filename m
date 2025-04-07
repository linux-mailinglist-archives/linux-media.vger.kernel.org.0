Return-Path: <linux-media+bounces-29478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4697DA7D970
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEEAA188B98A
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AC423098D;
	Mon,  7 Apr 2025 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Nt4cLGpd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333D12309A7;
	Mon,  7 Apr 2025 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017545; cv=none; b=cU469jTf+jnDYt6/AbIt4aeGojirJA7ldxjiZooq71lANTk7oi5xR0Onqm32Gzl2PrD6ipAbmCv52sWdOtmILBvEsqHLckaGNVEIvcuSE8aMRru2KXLKX848jiE6jZHqn03guNzHSTxsDy6INaCqlY/nEQjnloPZciAC7zBLlRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017545; c=relaxed/simple;
	bh=V3UBWBz1dP9blhdNMV1eqFYjYZtuamSSLPyS2QAH8AI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jFjn5G/sb1wh6TGN1+OTBLRdCn6O6dWUZ+dhvfMCJBmY5b/dHQ5PXZQVBu1LgKaxrJN4InJOuSbromWRZNHUelbKSLkBDFZvL4z8nCOCi96W9gasaDXC8k7nrIWkg+KaIQjmgQeaMkjkNAopNsMj6DgBqQVHUOtwtnKv8Jcok4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Nt4cLGpd; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5377Hksf005166;
	Mon, 7 Apr 2025 11:18:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=N5AtXF30ZSEIavx9DvPLf6
	LlBFSsDfnGCmJ/CLj455o=; b=Nt4cLGpdki/I03x1poHeqB/lFIU/onWaGluIay
	RGep8dx/IFINaZT11gfpq6jE8jroKd0w0FhMZf6empBf/+JiGa7JGaQv6v/KoxFH
	2tzHs8poeBx7zJ1qo4o7AVpoCKeoTpj5JGcE2prQIoHGb5oD8so+4bOLhnM0JbIx
	ZBdahiZKRikBjEoDbWrx/x1h1OvLle9M3YvMAZxdFy3bj6rD91KT29dt2MC3vCdK
	bbU+I/NnrQpaxYTGuZrTjkFmzAdIxPJKjiDiGA4dTqm28AR5B9gql8k5yhP9udcB
	nI7GkIJiGIS75icAV7iTgodBYTLN7K5yUrfvlFI3OF4mXUWw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw2gpt24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 11:18:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D79FB40048;
	Mon,  7 Apr 2025 11:18:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 211EF94D580;
	Mon,  7 Apr 2025 11:17:36 +0200 (CEST)
Received: from localhost (10.252.1.150) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 11:17:35 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v6 0/2] media: Add support for ST VD55G1 camera sensor
Date: Mon, 7 Apr 2025 11:17:28 +0200
Message-ID: <20250407-b4-vd55g1-v6-0-1850f18b1f24@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACiY82cC/3XQTW7DIBAF4KtErEsEw4wNXfUeVRb8JiwaRyZCj
 SLfveBN3SRdDuJ7bzR3VuKcY2HvuzubY80lT+c2DG875k/2fIw8hzYzEEACgLhDXgPRUXIXnBH
 BRWWcYu3/ZY4pf69Zn4c2n3K5TvNtja6yv75KqZILrgJZoSGJZM1HmkrZl+veT189djUK9KPRQ
 Q4O7WgS/DW9u8JvHwq5tdCs8No6bVF7omertha2VvVdjTKaUOBIL3rxX4t9Z3QyEfphFP7Z0tb
 i1lKzRqd2IIjRP/Yuy/ID3WWoz8gBAAA=
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
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01

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

 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |  132 ++
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/vd55g1.c                         | 2006 ++++++++++++++++++++
 5 files changed, 2159 insertions(+)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250225-b4-vd55g1-bdb90dbe39b3

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


