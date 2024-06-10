Return-Path: <linux-media+bounces-12867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74809902511
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 17:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15DF2B20626
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 15:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA2C13C3CA;
	Mon, 10 Jun 2024 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="8DB3wpxx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCAC1E4A0;
	Mon, 10 Jun 2024 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032303; cv=none; b=oilyJXRrlbR+NOwmHkoioYR2udPqUnNtn6XxAmgh8MkjzNmuzCEe56y7eIHoWD+/1+re48J7kY4qt7l6t5resnNKus4DEotcu8YS43LOjqG4CJVPFPIMghgcQsg3yIKUHig6qfpRpiqo/PuHpXw9Xl2au7qq3fVVfkij4KTqU0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032303; c=relaxed/simple;
	bh=tpHyKPGu/MAWjoatWWjJZ50Flk36rDbQoSmxaJRTcUs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Re3BHOJj6TjaUl1b9V0MACM+FZXANa4Wty+esr/c6s93x6s+oXFdUx4GCgYU/fY9/lLhAqnmqtV9pKPW+2hfeOzZ230LTJ7xaT3+NWkTSYxGaSBK5q2ukeDSENpiW9SoFyhfncMknyM+5lZktsyOpxbC/48h3lossXY+gc/2rvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=8DB3wpxx; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ACQpDH023421;
	Mon, 10 Jun 2024 17:11:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Nw0npG5Je8L9GpDDDrmZQv
	OmOFQeiNRiS9yVch0TPfQ=; b=8DB3wpxxw2Lj/nNcdFxXNQzSMVtVpyd0cqr+FU
	QXIhTOtDBMkyPokSP4kn37ctCTBxs5P1Shdahn/CEebRzuUAzCNC1pZzC1X2snY2
	I9SH4rPzL7lzSjLWtCi8nYAD7I7jMuNTobPRf6+FQJExc+I29C4FewnPZu16u1Zo
	K2MTW6vfeKAyCZy1ks0q2t37WjetxMfB7jwFG2ofWRueMEAqbxocE11pMhT2tzCi
	hJvQvKynBMB4s0uM3Sxxt7mV/YRV7Cq22UpQwNAwwDyQHt1AtleBbPOe7ozc8GLC
	jMA7mX+zuXHm9KAAnXYG7KLzil6MKDyYk5o45diFrmZtSPKQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yn0v15d67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 17:11:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8002C4002D;
	Mon, 10 Jun 2024 17:11:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B1B821ED2D;
	Mon, 10 Jun 2024 17:10:45 +0200 (CEST)
Received: from localhost (10.130.72.241) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 17:10:44 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>
Subject: [PATCH 0/3] media: vgxy61: Remove vendor prefix from driver name
Date: Mon, 10 Jun 2024 17:08:12 +0200
Message-ID: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01

This is a follow up of the discussion we had [1] on drivers naming scheme.
Basically the vendor prefix should not be part of the driver's name.

This series renames the driver from 'st-vgxy61' to 'vgxy61' and the device tree
compatible string from 'st,st-vgxy61' to 'st-vgxy61', therefore avoiding the
vendor prefix duplication.
Backward compatibility is preserved.
Makes the vgxy64 driver consistent with the soon to come v3 of the vd56g3
series.

Thanks,
Benjamin

[1] https://lore.kernel.org/lkml/ZlToLtUkVqzrZf4p@valkosipuli.retiisi.eu/

Benjamin Mugnier (3):
  media: vgxy61: Fix driver name
  media: vgxy61: Add legacy compatible string
  media: vgxy61: Add MODULE_ALIAS()

 .../media/i2c/{st,st-vgxy61.yaml => st,vgxy61.yaml}       | 6 +++---
 Documentation/userspace-api/media/drivers/index.rst       | 2 +-
 .../media/drivers/{st-vgxy61.rst => vgxy61.rst}           | 0
 MAINTAINERS                                               | 8 ++++----
 drivers/media/i2c/Kconfig                                 | 2 +-
 drivers/media/i2c/Makefile                                | 2 +-
 drivers/media/i2c/{st-vgxy61.c => vgxy61.c}               | 8 +++++++-
 7 files changed, 17 insertions(+), 11 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{st,st-vgxy61.yaml => st,vgxy61.yaml} (95%)
 rename Documentation/userspace-api/media/drivers/{st-vgxy61.rst => vgxy61.rst} (100%)
 rename drivers/media/i2c/{st-vgxy61.c => vgxy61.c} (99%)

-- 
2.25.1


