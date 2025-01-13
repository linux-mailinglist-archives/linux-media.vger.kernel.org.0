Return-Path: <linux-media+bounces-24672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B7CA0B200
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E39B188213E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 09:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A5C23A56D;
	Mon, 13 Jan 2025 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="zB/xkpxP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616C4239797;
	Mon, 13 Jan 2025 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758825; cv=none; b=f8z5bHfQbEx+L4FdR9y57puh6caCKoq7c5z5htLKPmaCnd5yDBPpkUxMXBzBsxuJN6ZSN4BCGhM3dyHx+wBPzCS+904lPK20u8BvCOhXKVKtigCbQbmmTzRqmbY5puIFlnK4Ps6/pBCZEHL/I2bAkPJyuF1E6kGrfaRA2QYdI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758825; c=relaxed/simple;
	bh=J7McqQhoHET+3zEwTef0K8lLrd1I37S5/1zZ2FQGv3g=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=PPSW6vCKB5U+zZH8Npxny+tIWRzITAqtmuFdqEswuiJmFVpFDvV2GmAyH52+VDsj2j8PQYvk/gTdTvf5n/STogSruHAszvh+dPLwhhc2tsRyEwiWHl6IWDjMBDoNelt66IOdVP7VB8iVXy8D5HNDW2vf/hF8c0A4VP1Iue5qOKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=zB/xkpxP; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5kEGo011711;
	Mon, 13 Jan 2025 10:00:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=IBTkV7f3tHLL3a0/+LFUjq
	8XSR+FbJv2mVoRlaCf1rc=; b=zB/xkpxP3y7ogr9OMuZMglx/AL5ur2pcsS3ggR
	P7ZlZyHRSXBjoPdh0ECDzpo80CxJvjS23OSX6rPNQPHx5y6gnNNNfJLZIwzf9Aqs
	mlrPGLRlV/KgvGA6guQkEKHuURhlvzT7k3BCO38fQW0iw5YN3o8tWAse3Zxk/kx0
	ihVMYbfhVQJjipl1a0F6/khTUQA4e8cp6WS4xXiscaO2WJbugRChmp2lwj4lRtsa
	C8Nyr+WHWTD6g+TAnYYKcFhCUcoJ0HKgA0WVPBcdb832T5EQ5lXJ0iZclZKKB8Ut
	RMORrVSMniExrWVEQY82CIrKSs2uJm5iu6MlSkgzccw8Uq5Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444vyr0p8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 041934004F;
	Mon, 13 Jan 2025 09:59:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49A4A231332;
	Mon, 13 Jan 2025 09:58:12 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:11 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v3 0/9] media: stm32: csi / dcmipp corrections
Date: Mon, 13 Jan 2025 09:57:50 +0100
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7VhGcC/43NTQqDMBCG4atI1o1MosHYVe9RitRkrFnkB0ekR
 bx7o9BFV+3y/RieWRnh5JDYuVjZhIsjF0OO6lQwM97DA7mzuZkEWQspGm7IddZ4l1Lnk1Qdhnx
 m0GOYiesWAXEQbd0PLBNpwsE9D/56yz06muP0Or4tYl//hBfBgcu+rqQGZUVjL0MkKmkuTfRsp
 xf54RQI0D84mTlQGrRBBViLb27btjdkw5BjGQEAAA==
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
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Various fixes within the stm32 csi bindings/drivers and
stm32 dcmipp driver.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Changes in v3:
- Add commit 'media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound'
- Link to v2: https://lore.kernel.org/r/20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com

Changes in v2:
- Correct commit message within the dt-binding commit, related to
  removal of bus-type property from the example.
- Link to v1: https://lore.kernel.org/r/20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com

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


