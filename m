Return-Path: <linux-media+bounces-23628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D14959F54F7
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 775BF16CBBE
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A97B1F9F79;
	Tue, 17 Dec 2024 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="pdqn0uvx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908F81F8F1D;
	Tue, 17 Dec 2024 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457313; cv=none; b=FWiP+XBDab3ZyYMBkK9aAxf9yTcTKfcEDp9GTwV+vVLlIHaL6+Eu2dzHuBRoc8J381x3fz8N9nGDbVYpGc3TRvVQhG3eV8ZxLPMPJmN6H1HRKqvLCtLg+yYinyuLgqvGfLhN+KVLXsAaKQWCaCufqrYFaGeiOcgwb11JbvdB2Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457313; c=relaxed/simple;
	bh=y66KXF6joPHuhOmcvKH0omVDoXQyKmDctP7zLNVWzro=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=YNKC1IK/FPLEHDFDxUY1ZRz0c63nT5RCqw9DN7oj13yhZOaodGRnHMvErscrMWGFxH9Tu4A94JbHXnaCfokPQfStWNLUQ24n4OXWIq2xKYClyyYxOXtS5JfrU1sekm3a9ekx82whACsYl1ZDM/koWVQd4pEYbV8cYHnqiXENeg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=pdqn0uvx; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDQcJQ030946;
	Tue, 17 Dec 2024 18:41:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=klpO7a4rKZ87Ajz1kwj0Lh
	obGu0p7g33e+yMsi/sDLQ=; b=pdqn0uvxqrUHeV8bI7lLPfR/ScE7uekK16iY3d
	JtUKXBzS5bxFJcY0uYYT4u6GjTZCDjmt3FJjbYfhMReGjn2wUkBTz3Ee442EJ7fT
	EX84+UHuZAahJi6IdbdzJUBKHHIxheHihu7eTbS8LdP8dYfrX7izohOLxORoTrNv
	Vww+9gg11yME5aXb7RnYih9acjTBz1fPkfdl+hYH73JVHHlzlAg+SCeD4elP2sg1
	+eTICDk37Pz7BJvM1O/anMNuH525l+GpZB2Uvu9b8LPtmuHqSKnprUXLvas1l/yq
	zYyOU8XWnJ0BjCk74T9RDDcanf5zBMgRhAkA2QqHZ6qgFuUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5c4u3br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 18:41:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B146B4004A;
	Tue, 17 Dec 2024 18:40:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12FD92839F3;
	Tue, 17 Dec 2024 18:39:24 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:23 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/9] media: stm32: csi / dcmipp corrections
Date: Tue, 17 Dec 2024 18:39:17 +0100
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEW3YWcC/x3MwQqEIBRG4VeJux4hpajmVWKQst+6C028EUH07
 iMtPzicmwSZIfStbso4WXiPBfpTkdumuELxUkymNo02ulNO2C4ucEo2JNNaxJI5BMRDVD+gBrw
 emtlTWaQMz9e7H3/P8wdo/mnebgAAAA==
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Various fixes within the stm32 csi bindings/drivers and
stm32 dcmipp driver.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (9):
      media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound
      dt-bindings: media: clarify stm32 csi & simplify example
      media: stm32: csi: add missing pm_runtime_put on error
      media: stm32: csi: register subdev only at end of probe
      media: stm32: csi: use ARRAY_SIZE to search D-PHY table
      media: stm32: csi: simplify enable_streams error handling
      media: stm32: csi: remove useless fwnode_graph_get_endpoint call
      media: stm32: csi: correct unsigned or useless variable settings
      media: stm32: dcmipp: add has_csi2 & needs_mclk in match data

 .../bindings/media/st,stm32mp25-csi.yaml           |   5 +-
 drivers/media/platform/st/stm32/stm32-csi.c        | 102 +++++++++++----------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  23 +++--
 3 files changed, 67 insertions(+), 63 deletions(-)
---
base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
change-id: 20241217-csi_dcmipp_mp25_enhancements-89e0eef194bf

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


