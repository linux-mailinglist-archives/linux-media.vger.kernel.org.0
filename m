Return-Path: <linux-media+bounces-40288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8BCB2C79C
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41F131BC5A2E
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3C828314B;
	Tue, 19 Aug 2025 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NxSnAqm8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C344279351;
	Tue, 19 Aug 2025 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615081; cv=none; b=jkpPkRsZoCqYUAYI2nFer6wv6NcT3xULkafH98GnzDIaPyc3jd/yEKHYOuXimFaMzVt181fsKaJ1C1TDV0VViF70nn69KuAADJnod8qOV5DPSeiER/PunzRccUHZt1ZNIUm3BXoIVh8WfQV+PuYMSRGbIAQoy3YgRUbHwQMLmZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615081; c=relaxed/simple;
	bh=ThBHGtPKYvhMxyBJR4R6NNzpP7faBpaTSxbgTppVZCk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Y8Gi6jIdoGMw+A+4nh1YZRAI9FpVHPNiiRuD6UvZR0DW9R9dOOwEPOv6PB4X3VUTpcrEapyYh9wAQPusNACRWDTpfszkfSoiLnTCO3bZ1DMO1ff/DWcscumLbebLabX4kQDIHkEOQESBSzkNGCDfH6uRe96R/TxRQ1aaBuxzAXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NxSnAqm8; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JEQlse022536;
	Tue, 19 Aug 2025 16:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=ebOIIZZ3DRVN0g4QYrPpIA
	WIJHsQWEwswQw/dE8omoI=; b=NxSnAqm8oiito/2M7Upo1R9G2KX1utqpVzArM9
	hiz0iBLUWCpHo1gDCvbijp7i5nLseHQZAHEVLRz3iirCbMClwntH5rcQnxtpdDFD
	qy75K6Hz7TFtS08tnM1Eyt/XaPx5GJyQn4aegI4lVPdxQ4OArHwfwlkLeZKUrIQa
	IdwTT3QCTmljqew+nAbtaBHMDjiNaDHlj8BEoui8U1Tu7oUYm5ahTeJK0yFs7yIP
	CCYeuSPyZDZm1OW+usPSp0NeoQADdpuNsvy3v2KXmq9d/i/aY1gFcZA7PQmwVG/N
	m0m5JkmABG2M+3SyKUjl3mfUF7MQcI47w+6srsCue8Rna5IQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jfdkbqd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 16:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8D0FF40044;
	Tue, 19 Aug 2025 16:50:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CA6F7392E7;
	Tue, 19 Aug 2025 16:49:53 +0200 (CEST)
Received: from localhost (10.130.78.67) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 16:49:53 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v2 0/2] media: i2c: vd55g1: Support vd65g4 RGB variant
Date: Tue, 19 Aug 2025 16:47:40 +0200
Message-ID: <20250819-vd55g1_add_vd65g4-v2-0-500547ac4051@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyOpGgC/22NQQqDMBBFryKzbiRJMyHtqvcoItaMmkWNZCS0i
 HdvKnTX5Xvw39+AKQViuFYbJMqBQ5wL6FMF/dTNI4ngC4OWGqVTTmSPOKq2877N3uJohCOHytF
 gUVoouyXREF5H894UngKvMb2Pi6y+9le7/KllJaR4GGeNNWh7fb4Nkbnmte7jE5p93z9qDa2Vt
 AAAAA==
X-Change-ID: 20250818-vd55g1_add_vd65g4-8e8518ef6506
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01

This serie adds the support for the vd65g4, the color variant of the
vd55g1.

First patch is the device tree bindings update, while the second is the
driver support per se.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
Changes in v2:
- Fix smatch warning about vd55g1_mbus_formats_bayer potential overflow
- Fix vd55g1_mbus_formats_bayer dimensions
- Link to v1: https://lore.kernel.org/r/20250819-vd55g1_add_vd65g4-v1-0-b48646456c23@foss.st.com

---
Benjamin Mugnier (2):
      media: dt-bindings: vd55g1: Add vd65g4 compatible
      media: i2c: vd55g1: Add support for vd65g4 RGB variant

 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |   6 +-
 drivers/media/i2c/vd55g1.c                         | 234 +++++++++++++++------
 2 files changed, 172 insertions(+), 68 deletions(-)
---
base-commit: 2412f16c9afa7710778fc032139a6df38b68fd7c
change-id: 20250818-vd55g1_add_vd65g4-8e8518ef6506

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


