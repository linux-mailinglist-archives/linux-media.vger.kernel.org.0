Return-Path: <linux-media+bounces-29205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32363A78A9B
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 11:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB9F73B26B0
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600F223645D;
	Wed,  2 Apr 2025 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="i5T7LZdI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66BE2356CA;
	Wed,  2 Apr 2025 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584582; cv=none; b=RkNa9FnLI7tAXkoYo4+1wDguSpSZOC5t8UjggzEyymKtttCkLQiQfOISs31eY1HVyC6mJu8/jb63AQV166GwsIcyMMnIvAn6sY4SulQEfR4R83BoRqrM/sEZMxHAK5+8ROacIOeCXHnsE8hYpnCoqNjRTX56Aiib/Wok4NdwYrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584582; c=relaxed/simple;
	bh=kPI8+m6kjrBpwYbQqzYKlo2bm8lf82CiCj4PT2Ly8Yk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=YfAQDLvjd7Ceyq1oykscZxcaUfLMFDX8H00YCv1luY6Gja+J0XsioK/Rj1BLG+REGVbNfdhxIEzGWN1VVATWovXF+MtN66ytLOPiICGs018HOq+3L0bYxavLq0m1NLrbgolFNgZmTAl72Q9OUR1ZYKD6RDosNIKtB5RkBxynTbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=i5T7LZdI; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5325gfaI010091;
	Wed, 2 Apr 2025 11:02:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=eskE5Y77HHK+7D5qMo1eVg
	7hZS0cZSUbXVc6OhLjd/k=; b=i5T7LZdIOu29jzuGSXLTk+bXTYdWcjnB+ZybW4
	jAA4mX1bYf61x4wCAsZ7zoq2V/yR7pS8jSqmdkNWNoSGE2KQHd1vcZOwbVMsXcbd
	kk+yd4EoUIaiA2NyCAZveHU37oXaWUgbCljDpTnAp2hazrhErH+fD5qbCUeebBxu
	oC7Du1IlC/ZGeVyCtj4JsxfL8NKOoMJI8R//WJHOca+BJjCk3a2h7KKM2MY0nNSj
	HFFg19o9nckWfwJ/3qOOShlX9TLvWJaC0tjd/tLrLWOXm5RTu7a0FERm2OUZXEi2
	ZCXFtfIIyy0ScqNhwxpbbno5WP9vvHGmdGBXebArW711jmOQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p6vd9g36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 11:02:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E7160400B3;
	Wed,  2 Apr 2025 11:01:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45DDB8FCAFC;
	Wed,  2 Apr 2025 11:00:38 +0200 (CEST)
Received: from localhost (10.252.30.87) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 11:00:37 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v3 0/2] media: Add support for ST VD55G1 camera sensor
Date: Wed, 2 Apr 2025 11:00:18 +0200
Message-ID: <20250402-b4-vd55g1-v3-0-393985404759@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKL87GcC/22NzQ7CIBAGX6XhLA0sRcGT72E88NtysBhoiKbpu
 0t70RqPs9mZb0bZpeAyOjczSq6EHOJYgR0aZAY19g4HWxkBAU4AONYdLpbznmJttSRWOyY1Q/X
 /kZwPz611vVUeQp5iem3pQtfrv0qhmGBmuSICPPFKXnzMuc1Ta+J9zW4OA/HrCEuPulMn6WHvr
 NsFPnsdod8uVJcYobRQnTCc791lWd7gzTAPFAEAAA==
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
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01

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
 drivers/media/i2c/vd55g1.c                         | 1993 ++++++++++++++++++++
 5 files changed, 2147 insertions(+)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250225-b4-vd55g1-bdb90dbe39b3

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


