Return-Path: <linux-media+bounces-24404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F7DA05C87
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A12901669CB
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F271FA8D9;
	Wed,  8 Jan 2025 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DSXIc+F9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C401F2C44;
	Wed,  8 Jan 2025 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342302; cv=none; b=js+94pV6MKq5SCltnb6jwPkUHuPbgwzKNqSdLkTg/P5wYqvix+rek9oACSJFsovEzJRBKawBew6mAYbxVLV6UmS8n9aqB0XIGwp9n+axPpZxLBaMwRJpsbnDpZxdScyFWqif0F9xPN1/WDRYmaGTZDEQMmuLCzL9mWg2Q7FZpSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342302; c=relaxed/simple;
	bh=JRxlvY1bzvaa9SX+yQICk+foK6PAPFNZ40xYjRS1Fus=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BuA0CMtPJ7ZhEGPmBlpRFy2DLJc0UGude0kOUS5/nB5RnZNiRPkyP5JXoONFPmqV7m+bgtT/2ZBVS19J6NNcv3eMX/YHDS3dc34GEAI/BwLHEN7DZMxb5juG2SN65zLpH0TBMq05WcNs7XoUu5frui9M08KAayHnO2uNo71+KkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DSXIc+F9; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089XEEX008924;
	Wed, 8 Jan 2025 14:18:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=smtjz2MWbY4Pc3cvI3V0Qv
	2Ac+AUvAjZmdApDUX6F/k=; b=DSXIc+F9xlB1Ue5EQRXDCxoBtNPskYUIFcsLFd
	FbrimWQScduTNX9iFWcRHAbdKGCLCkS4aNlP7lg3GPcJYp5fQLYwgVrDFKY4s0P2
	ER9zsAFQQx1I/2SW5bwlyHjVlV8I08qWLSTcg3fKL9LMJWZWTCEKORnVma1RJv0+
	TGkW0vOTM/k8PvNY630jt9j/iVno/2LPq/sh8a7p9xWReBU6halG+IAWwsIt9DRW
	GSXEjoYGW5rIVnPUfVoSGXigUlN1UdAdIGP67ee6YsOTgYbwtX8OKRMtSgAXipma
	cnDkSLUuOL4whcLMZKamFcOrwk1UqZ2MaBvvEX625+WKF6fg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441pu4rw6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:18:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C975640044;
	Wed,  8 Jan 2025 14:16:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D99512795F3;
	Wed,  8 Jan 2025 14:16:09 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:09 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v2 0/8] media: stm32: csi / dcmipp corrections
Date: Wed, 8 Jan 2025 14:16:03 +0100
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN6fmcC/42NTQqDMBBGryJZN5JMFbWr3qOI1GRSZ5EfMiIt4
 t2beoIu3+PjfbtgzIQsbtUuMm7EFEMBuFTCLM/wQkm2sAAFjQbdScM0WeMppcknaCcMZWbQY1h
 Z9gMqRKeHZnaiJFJGR+8z/xgLL8RrzJ/zbdM/+2d401JJmJsr9Kq1urN3F5lrXmsTvRiP4/gCA
 b96EcoAAAA=
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
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
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
Changes in v2:
- Correct commit message within the dt-binding commit, related to
  removal of bus-type property from the example.
- Link to v1: https://lore.kernel.org/r/20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com

---
Alain Volmat (8):
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
base-commit: 0e420e3a0a9a0d8d0b9d3d262baa240ef2369c88
change-id: 20241217-csi_dcmipp_mp25_enhancements-89e0eef194bf

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


