Return-Path: <linux-media+bounces-29241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 239F0A79078
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E4E81890C2F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A649E23BCFC;
	Wed,  2 Apr 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hA3P+25o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CAC23BCEF;
	Wed,  2 Apr 2025 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601880; cv=none; b=AYMnnte4rPdeQYMCnAsUb3Fut3UQpnUmLyBB/E28zXHUN5ixq5p3GMS2VPdussBcbz2oVee5e304HKfnSOen0cCoKOo2gXffjaDcIJEPpduFf33uSjuY++uI9YSMhutnyOCcdK5dKLubuPMx8+PZKyXbtXa0Vf4Ca1L67gUkGjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601880; c=relaxed/simple;
	bh=A9O5eS2l16DBgPICaEtUFjgi9RkWq9x3wPNStnQioQk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=bsCYF08pNW4xpHgDQoxD8s2YxFm7l4H1SXLIIWuurwuXSUA6jmy4mlDklxX/ARP2O2C77u1ZBQjBCEYtO+Gjkkt047AAVUES2uRhuE/Pe0pr+U0UdAaZNu+IeLpmq8RzNfnNwKnnyk3LNkiZBYGrl5JomJ3FKBqsNiFpaqo189U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hA3P+25o; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532CO6Ra018957;
	Wed, 2 Apr 2025 15:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=r5AsdiYb24Au02+ZUD6TST
	XwjJB6opLYfwASWD9NJAY=; b=hA3P+25oCetwJT8rY+/0zlX9KvUu+rK8k9sBi/
	K0L623ly7mlVcxJtOuQDsav9dYpXGKnAePJ9oVu8LdqTDRtLw96tbBpdE+dm902g
	eIV18CjEySeYnIBKbTDdKfconKD4X5uLAD7pnyYTrrAc3ebTOGXVjW38g7zjPaUq
	9B3iLyiNVN9HxxPlWtpZu7lA/GH3T6EypvM1cYYOhYvtk1fBDXhqKvP0vIPUZ4xN
	EPKBQZL8CY9v3O8jQs9LLUCaWrKP0VAEWJeTIwYCrbGJPk1GgLPqgxWHBO8jliAU
	xmBXOBusZ9ZgVNNxa6B3j+oXh9VgI6ikfMCJFdHYlpu1FY7g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p75qbtd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 15:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AA88040051;
	Wed,  2 Apr 2025 15:50:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E8C085F21C;
	Wed,  2 Apr 2025 15:50:09 +0200 (CEST)
Received: from localhost (10.252.30.87) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 15:50:09 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v4 0/2] media: Add support for ST VD55G1 camera sensor
Date: Wed, 2 Apr 2025 15:50:05 +0200
Message-ID: <20250402-b4-vd55g1-v4-0-84b1f54c670c@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI1A7WcC/23OQQ7CIBAF0KsY1tIMA6PgynsYF1BAWWhNMURje
 ndpN9bq8k94//NiOfQpZLZbvVgfSsqpu9ag1ivWnu31FHjyNTMEJEAk7hQvnugkuPPOgHdBGid
 ZfX/rQ0yPqetwrPmc8r3rn1N1EeP1X0sRHLj0ZEFjhGjNPnY5N/netN1lrJ2MRL002ouNU3ZrI
 n6bcbvgZ0+BmFusFlptnbZKt0S/Vs4tzq0c/2qk0aRAbWmxOwzDGwXpRw1QAQAA
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
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_02,2024-11-22_01

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
 drivers/media/i2c/vd55g1.c                         | 1993 ++++++++++++++++++++
 5 files changed, 2146 insertions(+)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250225-b4-vd55g1-bdb90dbe39b3

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


