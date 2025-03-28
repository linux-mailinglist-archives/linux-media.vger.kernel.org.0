Return-Path: <linux-media+bounces-28924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE3A74BC5
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 14:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84D2F1B6246F
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 13:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D4622D7A1;
	Fri, 28 Mar 2025 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="mVR1xdqp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2EB226D0D;
	Fri, 28 Mar 2025 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169461; cv=none; b=F7wKiM4a4h7vANibBG84k00gIJ0dtXRIaQ9Ihim8v5C0KtlcQ+pxAVuQ5xEPGz+upzW6e8qOajlrEejdzW2iVmODYynjxwvstr3S2PW8TwGDyLp71DKWKKVUx3IeCs8dX6IKyjmIzyxsyThPpspUxjPT90nCjPHf66hc5OFEPsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169461; c=relaxed/simple;
	bh=wWjOpcD6UqBLdf0D/6xpvsM6guluhXQ09KcyBqcDQOM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=aNAd9bANFYkr50r+ndTLtch0x2uq1MEustCgiHJUGfg2jVPKoe+INFi0wfJtb02cHwmZkN5fQawxvjb4p/NTO2b5Ecj5cLDlSyR/3E2qeJ+eT6QX9ObPudmW0jD+SQ5bHJkPw77WY+eMtgme0pSYF8L83o5QaJSsY07Ft6WrHcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=mVR1xdqp; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S9H7QZ010146;
	Fri, 28 Mar 2025 14:44:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=8e9g8G1GJANlMo9IptKzMi
	7zqwHwISNES6lwQjbdDYA=; b=mVR1xdqp/DcLPGue572HIV4V4OhHSobmJDNf2n
	kBABLj0NOln/4WcBbSIz8kRLv46M5mWC14vf5za90Bkif5HEVXsx44wqW5BXe6Y4
	ziLcvvHRV9ofbkIe5Hxf43QTsuMtOimQgOQpX+YoJNbEx7WJfySYU+HGtElYyjGi
	+iBCLTQJ7RnjTjDkk0K2AvYR4lxh+wD5RAyiJACqOQYELLLIvepGBzD6vvpfQzl5
	TcZpzJ6eF1Hab15GXQpA/xTLI/WcKrpQLufh5Ztiw63De0LxLxz6NjjmhmmSWnOW
	M8KTcMOOJ9M49HbBHVlJt0LGhbYPjPldD90TedQLncdnniSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45me34srwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:44:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 301544004A;
	Fri, 28 Mar 2025 14:42:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 354CA8EA191;
	Fri, 28 Mar 2025 14:40:24 +0100 (CET)
Received: from localhost (10.252.9.227) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 14:40:23 +0100
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 0/2] media: Add support for ST VD55G1 camera sensor
Date: Fri, 28 Mar 2025 14:40:20 +0100
Message-ID: <20250328-b4-vd55g1-v1-0-8d16b4a79f29@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSm5mcC/23MywqDMBCF4VeRWXcklwZqV30PcZGYiWZRUzISW
 iTv3tR1l//h8B3AlCMx3LsDMpXIMW0t5KWDebXbQhh9a1BCGaGUQXfF4o1ZJDrvBuEd6cFpaP9
 XphDfpzVOrdfIe8qfky7yt/5TikSB2hsrbiqIYIdHSMw97/2cnjDVWr/dGruspAAAAA==
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
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01

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
Benjamin Mugnier (2):
      media: dt-bindings: Add ST VD55G1 camera sensor binding
      media: i2c: Add driver for ST VD55G1 camera sensor

 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |  135 ++
 MAINTAINERS                                        |   10 +
 drivers/media/i2c/Kconfig                          |    8 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/vd55g1.c                         | 2001 ++++++++++++++++++++
 5 files changed, 2155 insertions(+)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250225-b4-vd55g1-bdb90dbe39b3

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


