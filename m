Return-Path: <linux-media+bounces-19220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B453199468D
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CB132820BA
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE6E1D362B;
	Tue,  8 Oct 2024 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="3XALsD9n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25EB1CFEBE;
	Tue,  8 Oct 2024 11:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386482; cv=none; b=TZDOwLKh13Y9XI2FS2ynx9dU3XqH8LJth+Ym18UiWhoXhRNtUutU9pFVI6urEqzJ29weEjslqq1H24WatX+eNVRx/BmWScmkT1JhYQPjFDonAH5NDjtzHh3PdQPrboX4WstedE+RTLYT3mmB+YRXNTbZFL0OYt+WwrMQjnzL9nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386482; c=relaxed/simple;
	bh=3N4LQzTbZUG0JjdslNdVNie/np0+4yZKEFBfVCpHALo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L9VuLiO2K/tskKAhVhnbptDeM1pnSlDlJa/YTwr/ypc1UiiuOkWxVnGhbnZ9qRfAQ4dKeXY+NKOtyOr62lHgC6CosHdDac9zS0vwcsBMtFEzDX+7kA6g5TI6D7TOVC/+HN8iWd9cEhL3BM9URmbVmVx1WZ8ZQLZLrG2qitkoIK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=3XALsD9n; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498AZQdP004331;
	Tue, 8 Oct 2024 13:21:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5/UQpxO8gCyIC+pWGZhq9XwxqNvxkSoNhhrrLOxHR9g=; b=3XALsD9nNVwqbuG0
	kEjT13ftlQRg5Kn5tUODkJu40nq7Y8Ott7Lch139EqOQUXa9/c60OTK5y91XNPEb
	jq1rPhNQzVPIskR/GN6tXq/xfAUVszDb2Gug5td670puudmremXLiKSWuly0ytoH
	1NoisZn2pG5d/Vz5SQRW2YzUTh3RDMKFMhKCaMdUEiUv78JSov3OHqlhN4QxeKoo
	hr9ocfnSIyDVWVxQ4yVUpuOuhEiA13pFzhA/WsXT1Q1fiK5RoNeP5yyfsvsUTBU/
	Ov82rBwZNapjqmFALI+ntR/5nUkJ08NpXL8wNy+IU3KTN5qJVlyAsmTcyLnnz2Zr
	omRhQQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv760p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D1A224004B;
	Tue,  8 Oct 2024 13:19:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AD93285188;
	Tue,  8 Oct 2024 13:18:14 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:14 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:03 +0200
Subject: [PATCH 01/15] media: stm32: dcmipp: correct
 dma_set_mask_and_coherent mask value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-1-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
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

Correct the call to dma_set_mask_and_coherent which should be set
to DMA_BIT_MASK(32).

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 9f768f011fa2..0f6918f4db38 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -893,7 +893,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 	q->dev = dev;
 
 	/* DCMIPP requires 16 bytes aligned buffers */
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32) & ~0x0f);
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "Failed to set DMA mask\n");
 		goto err_mutex_destroy;

-- 
2.25.1


