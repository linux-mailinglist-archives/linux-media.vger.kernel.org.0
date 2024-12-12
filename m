Return-Path: <linux-media+bounces-23275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A91B29EE2C2
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4868A16076A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D937213E7F;
	Thu, 12 Dec 2024 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="pqZwY8PI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7B6212F99;
	Thu, 12 Dec 2024 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995241; cv=none; b=ho8aR8FE10i8uu2C25p1/XlxNZi8uFx6uTf2dVhiy6WIU7QQWdSAcfi6K/atlHRbLat/19vmFpXfh9EOlg6TqqYIQJBpOTtsI4lAO4LPglHKTV+qOheHfZGjcsS0Vwr5WPk7j4vxHRJGpV4IpMjWaB77vGbQInA5UqDOlGmbTJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995241; c=relaxed/simple;
	bh=UKj2xf+pWng4AoiuGOxQyQNjWKkqcgICB+PDDHGWGl4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=dhdN9Jf2DNYlw3T02k/k4OiglncLFSS84vpy3kZo2OP+3D/lB6TGss/weS0Ss9YaG+jDJXOxvcoMPktLWUlQ9g5C8fs/MGMc2RQ8W180ZMfQgh2ZV5V5RP0cwOpM2tQysI1BWQ4OToWFeTnRAlPFwg393zzP3x/tiet6sMJ6t2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=pqZwY8PI; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC70UnJ004975;
	Thu, 12 Dec 2024 10:20:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=94mzxY38CGhTvaAMfw+0SS
	d7dOdgEYOTDKxFJ47+YNE=; b=pqZwY8PIZxe2bLyJgSlNR4uZ3s/cGN3ofFsjWn
	dz05cWUcHI5IiykMAcRNnrdHSpWDEeJdWMQNQTFs5c95qiLDknVtX0Gdbcoes8VZ
	AlI9th/l7dVEYgpzTboWfALM/vd3wRJRNUgKSq5dQqNr8OIeatvfeG3+Gl8fSJoz
	Oj54d6Z9Hw6LIiFNBYAGaBgi56Gs0JUXGYq6I1HVQeGP77ZWMWjcY+UIhYx1DVyC
	sVm9AvQKRq4tB5L6Vfau1zLdPHkBBYqxAKEJ5Ob6WGX43JC1sCaLs+Ng0/OadYrs
	1ef+pRil1bVSWjBf8OG2+ylMYHNH9OG26JavcPu8wJ6njUJw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnmf78x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:20:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8F93C40052;
	Thu, 12 Dec 2024 10:19:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CED6F25011F;
	Thu, 12 Dec 2024 10:18:02 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:02 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v4 00/15] media: stm32: introduction of CSI / DCMIPP for
 STM32MP25
Date: Thu, 12 Dec 2024 10:17:24 +0100
Message-ID: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACSqWmcC/23OSw6CMBCA4auQri2ZaakFV97DGFL6kC6whBKiI
 dzdggs1uPwnmW9mJtEO3kZyymYy2MlHH+4pikNGdKvuN0u9SU0YsAIBJNXR10Z3vu/rrmeCSim
 rI6AT0iiStvrBOv/YxMs1devjGIbndmDi6/RtIZY7a+IUqMYKC+UaUODOLsSYxzHXoSOrNrEvA
 cReYEloKqdLJZnkmu0F/AgAf37AJFjuDFgjiobjr7Asywvc6z8mNAEAAA==
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Hans
 Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        <stable@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

This series introduces the camera pipeline support for the
STM32MP25 SOC.  The STM32MP25 has 3 pipelines, fed from a
single camera input which can be either parallel or csi.

This series adds the basic support for the 1st pipe (dump)
which, in term of features is same as the one featured on
the STM32MP13 SOC.  It focuses on introduction of the
CSI input stage for the DCMIPP, and the CSI specific new
control code for the DCMIPP.
One of the subdev of the DCMIPP, dcmipp_parallel is now
renamed as dcmipp_input since it allows to not only control
the parallel but also the csi interface.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Changes in v4:
* stm32-dcmipp: correct patch 13/15 with clk error handling in
  dcmipp_runtime_resume function
- Link to v3: https://lore.kernel.org/r/20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com

Changes in v3:
* stm32-csi: use clk_bulk api
* stm32-csiL perform reset control within the probe
- Link to v2: https://lore.kernel.org/r/20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com

---
Alain Volmat (15):
      media: stm32: dcmipp: correct dma_set_mask_and_coherent mask value
      dt-bindings: media: add description of stm32 csi
      media: stm32: csi: addition of the STM32 CSI driver
      media: stm32: dcmipp: use v4l2_subdev_is_streaming
      media: stm32: dcmipp: replace s_stream with enable/disable_streams
      media: stm32: dcmipp: rename dcmipp_parallel into dcmipp_input
      media: stm32: dcmipp: add support for csi input into dcmipp-input
      media: stm32: dcmipp: add bayer 10~14 bits formats
      media: stm32: dcmipp: add 1X16 RGB / YUV formats support
      media: stm32: dcmipp: avoid duplicated format on enum in bytecap
      media: stm32: dcmipp: fill media ctl hw_revision field
      dt-bindings: media: add the stm32mp25 compatible of DCMIPP
      media: stm32: dcmipp: add core support for the stm32mp25
      arm64: dts: st: add csi & dcmipp node in stm32mp25
      arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-ev1

 .../devicetree/bindings/media/st,stm32-dcmipp.yaml |   53 +-
 .../bindings/media/st,stm32mp25-csi.yaml           |  125 +++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   23 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   85 ++
 drivers/media/platform/st/stm32/Kconfig            |   14 +
 drivers/media/platform/st/stm32/Makefile           |    1 +
 drivers/media/platform/st/stm32/stm32-csi.c        | 1137 ++++++++++++++++++++
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |    2 +-
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  128 ++-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  119 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |    4 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  122 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  |  540 ++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c        |  440 --------
 15 files changed, 2224 insertions(+), 577 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241007-csi_dcmipp_mp25-7779601f57da

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


