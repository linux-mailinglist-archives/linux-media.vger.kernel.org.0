Return-Path: <linux-media+bounces-21534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE09D1254
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 14:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAEC81F216B5
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 13:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650721BDABE;
	Mon, 18 Nov 2024 13:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hHX18/pz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFCA1ABEBA;
	Mon, 18 Nov 2024 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937220; cv=none; b=jFXYiHQVaTB2VKd5pFvb4HsNEHUDVh+uXrnvekqttsggiz/YqWzXY08/k33xL5j1KKcnetEf/hhUnNsbhpvAPWOx7G7TBpqfF5WwJadnHVeCrnYSGGh4BzNawEmry0Sa7C12H87alETI4vdMBhEpZUMaRT1AY1HWhubpfeFXPy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937220; c=relaxed/simple;
	bh=DV8WgtfiJ3jSHJlxMtKq/+R3q5ybHbBcGIdrmJZDwp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rtgp/qfqB87yufUtu9IBUy7ranaixkspyLoosmeqkbRGskeJRWxaJRavOduGtmgxxdRnZHQQvEEPL1sL93eDWYGwPppPrjEE4nAwVtsBNFcezrX/1sGs21TRf6PnUNR8M9vIfl5TpEwkYmHmHEswNcJzGEsrntuLpbGhRv4nrvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hHX18/pz; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIBMjHi001561;
	Mon, 18 Nov 2024 14:39:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Rc3oBPTl0l/qKEzDpFWg02aAFeNOrXK/95DogEMtNjc=; b=hHX18/pzqzEtNDLZ
	OioOCVtEpHzYFSL+MCdUINOfBfWaIvaffrCyu4+0lnZ5HGLAlkPPtRUbTg3XCmGv
	J7IQc8zUqM1gCBZ+CCM51KywpVFffC28lvhDP4QM0jM42wD3XPX6pHTJs22xc6nj
	t+M1zWHfzrZ4nk+lwp8EXKtgzkAmmH+95Xcwdx81yQBlwP7dYnH8i7AZow9SXqxI
	fhqg/75pY+WsQrFxQ536aoyGNJjQc0VRy9M7r2phOUuHYv3pVAQxutf5r4zzXJN2
	QrOmuZpjeBGPPVPyGEfT/XkEoGxiM0R7yc0rIXQy0DT/jxdk5KEpcnzaHoag21pd
	YAURpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y77n504q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:39:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E334C4005A;
	Mon, 18 Nov 2024 14:38:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDF352721D0;
	Mon, 18 Nov 2024 14:35:26 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:35:26 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 18 Nov 2024 14:35:24 +0100
Subject: [PATCH v3 01/15] media: stm32: dcmipp: correct
 dma_set_mask_and_coherent mask value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-csi_dcmipp_mp25-v3-1-c1914afb0a0f@foss.st.com>
References: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
In-Reply-To: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
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
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
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
index 9f768f011fa25a0981cd0d1d3f114b02e58223d4..0f6918f4db383f4e0762030218101f759f375e95 100644
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


