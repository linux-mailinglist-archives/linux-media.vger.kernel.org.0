Return-Path: <linux-media+bounces-29136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D84D8A7794D
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 13:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81D2516675A
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515AF1F17EB;
	Tue,  1 Apr 2025 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Ret/io8W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102D135942;
	Tue,  1 Apr 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743505629; cv=none; b=E2ga6BHLw6jtlviKFxvpJyVXTGSxQuLClEPfZKTKfMA8q0KxMjVCndsdiT4hu4RDgI/zqhtyNe9lcO82fA9I8FwuuWi2+n421H4wlOUsxpGdMnMVkVRQ7nsJ+L9C4nUQST4OESyG2jRo/er3KzyBzKf3aumaPElHzYm+E0Vg3Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743505629; c=relaxed/simple;
	bh=HpP45tlUj9k5nFCmol7sPovLnD/Pv2YvLR0S//RDm2o=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=MLPkzUtw1h/coOlr2FuAm2wnhpBPiHpCuD8ngQtygom2gU3lOwYIFtavMauv/FvWYAGLHCE7F4L7EyPzDUlVfJ7X39ofuTLKm5W25y7ulm7hrNfOXxbL28RvBcieRJcpoXajmJRa/42ZvJr/fRRSQkSKH663NcUpvaLUr0S6vj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Ret/io8W; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5316tjxU010077;
	Tue, 1 Apr 2025 13:06:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=yQOjsrTOygO4w5JNn247mn
	lqyBtWQHvzueG0y756GJU=; b=Ret/io8WgjjJgKb+puLebviLf6b/isU2zXT8Ok
	wZtEy5WTqcwoiLaOHO0/RVhO81LN43F6TEQ5oEV1SrGLsXu/IQyF1jJHBfeeCUED
	CimOwVBvLe05Aopd6uVsA6mJEvD+WPx+NloAteM2cqYYBQwKmd47q1+yv+BTtx+B
	yuiW67RPg4SwOPziwijw/NafbkRPpA9XSWm4slIGTO0dqfCgOgA1aQDb2KdATb9H
	l7qw2GtEF2xYuTRt10dXEcq2oc9Ol7s6f8xKVgS8/ciWLapIzm93KeoxLR5fjlu5
	45aiRZsuxGrcnQL5mJ1lZ7q6cWsq7OxNH00tKI285JhHSxnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45pua7te6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 13:06:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9CAB34004A;
	Tue,  1 Apr 2025 13:05:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 424D86975E1;
	Tue,  1 Apr 2025 13:05:59 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 13:05:59 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v2 0/2] media: Add support for ST VD55G1 camera sensor
Date: Tue, 1 Apr 2025 13:05:57 +0200
Message-ID: <20250401-b4-vd55g1-v2-0-0c8ab8a48c55@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJXI62cC/22MQQ7CIBQFr9KwlgY+RYsr72G6gAItC4vhN0TT9
 O5SdhqX8/JmNoIuBYfk2mwkuRwwxKUAnBoyznqZHA22MAEGkgFIajqarZQTp8YaxaxxQhlByv+
 ZnA+v2roPheeAa0zvms78WP9VMqeMCis168Ezr9XNR8QW13aMjyNbHQH9r9NbfjadvigP386w7
 /sHjlOSS9gAAAA=
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
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_04,2025-03-27_02,2024-11-22_01

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
      media: dt-bindings: Add ST VD55G1 camera sensor binding
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


