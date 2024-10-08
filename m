Return-Path: <linux-media+bounces-19219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B20994685
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07C1AB23191
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F99C1D2786;
	Tue,  8 Oct 2024 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="s6TpWhiI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45099199E92;
	Tue,  8 Oct 2024 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386481; cv=none; b=AP+NgWD/YUQgSP6lqXLCTnf+L0wrXS9yKOPngfrjjxFzU549dBLDjLge4GBDNvfbByd1m4YnFXk1JgeS1YFQtSP0DMSUfssugZpUzAR5NkZw+s/bap1f5kLvHCCqLXu3FJVnAZk/oJUsHuRxttyPyBDvuaK2rvR7paVQn0wvrf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386481; c=relaxed/simple;
	bh=LykEdxSO49aaoH0KmMqunv4a7HuZQstj9yyl3nT1YBA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=R1x4X/L5A01iSDQia29YZrjVHfR1Pbqi3ru37ZNViRByzgELNtgyB0HTr7dg9XXBIyu7o3ELnafW0NjcWmzjN1m6UzDg9BLk0CpdROB/rdUIoixxGm3BnLh8OQXJ1APVo+JOKyNl/pBp7Vm863rZZr0be78GSjGxSW3VxU9lU8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=s6TpWhiI; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989iRMb023105;
	Tue, 8 Oct 2024 13:21:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=PrLR1FSoG364PmBEJPDnHR
	HbRh23KLrRCGJoIZfeH28=; b=s6TpWhiI+L3zgNKWoxb+2+d2PnqAU0IO9ih1NU
	QeLJ0HoGsVz7I5csdmcbqafj31Tyf4YGLVdVv2wZS7E1CpCeTnn0m+crP4f0OvLu
	ZV2QNrBqvHHcaijCspTRBHtbOiQ9BYm39X+jagaYtptsDZMMtvnUl702UZz9DJXk
	RYWvOxbDfA+LptUGr4JAHMrH9oHa2rJQSI5fLlbpo7/5QpIcv/b07oW3SYQ4hneL
	V4ZYwL5vUOuqPagB5vVa0rnMB/YxyXdq06X/L55MEuw9vcKOn9KBK8/ZCXO+9VJa
	++5LVFE8/jiq7SkEvCBF0JVyJ7/rHAygGjQgvPfMPmMaBcxw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xtq5pyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D1AFF4004C;
	Tue,  8 Oct 2024 13:19:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD109285187;
	Tue,  8 Oct 2024 13:18:13 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:13 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 00/15] media: stm32: introduction of CSI / DCMIPP for
 STM32MP25
Date: Tue, 8 Oct 2024 13:18:02 +0200
Message-ID: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoUBWcC/x3MQQqAIBBA0avErBNUsqGuEiGhU81CE4UIpLsnL
 d/i/wqFMlOBuauQ6ebCV2xQfQfu3OJBgn0zaKkHJSUKV9h6FzglG5I2AhGnUardoN+gVSnTzs9
 /XNb3/QBfFgf9YQAAAA==
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
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
Alain Volmat (15):
      media: stm32: dcmipp: correct dma_set_mask_and_coherent mask value
      dt-bindings: media: addition of stm32 csi driver description
      media: stm32: csi: addition of the STM32 CSI driver
      media: stm32: dcmipp: use v4l2_subdev_is_streaming
      media: stm32: dcmipp: replace s_stream with enable/disable_streams
      media: stm32: dcmipp: rename dcmipp_parallel into dcmipp_input
      media: stm32: dcmipp: add support for csi input into dcmipp-input
      media: stm32: dcmipp: add bayer 10~14 bits formats
      media: stm32: dcmipp: add 1X16 RGB / YUV formats support
      media: stm32: dcmipp: avoid duplicated format on enum in bytecap
      media: stm32: dcmipp: fill media ctl hw_revision field
      dt-bindings: media: addition of stm32mp25 compatible of DCMIPP
      media: stm32: dcmipp: add core support for the stm32mp25
      arm64: dts: st: add csi & dcmipp node in stm32mp25
      arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-ev1

 .../devicetree/bindings/media/st,stm32-csi.yaml    |  129 +++
 .../devicetree/bindings/media/st,stm32-dcmipp.yaml |   53 +-
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   23 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   87 ++
 drivers/media/platform/st/stm32/Kconfig            |   14 +
 drivers/media/platform/st/stm32/Makefile           |    1 +
 drivers/media/platform/st/stm32/stm32-csi.c        | 1150 ++++++++++++++++++++
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |    2 +-
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  128 ++-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  119 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |    4 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  116 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  |  540 +++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c        |  440 --------
 15 files changed, 2238 insertions(+), 576 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241007-csi_dcmipp_mp25-7779601f57da

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


