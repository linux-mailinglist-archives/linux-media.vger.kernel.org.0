Return-Path: <linux-media+bounces-24406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCCAA05C8A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 260781884D23
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560D71FC11D;
	Wed,  8 Jan 2025 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kRZihFMd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2EA1F9F64;
	Wed,  8 Jan 2025 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342302; cv=none; b=VweJXg0LfCB0x9d6+P8ZrnY4LPttRVrd6zGi4BEyzIIHPeTEWOH+8W/X2V+2TsaM2GW0kT+TptpPkvnr5bEmkuXCGl/aKNqHXKi1Ocv8/VZj9HyHYcOksgX0m6MZ5xf15cUhpLWqYl7R0wM5UlEcxgJ9nW4OQyIcAdQxLA+MeqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342302; c=relaxed/simple;
	bh=r0AJlSN7QqihCiLwaihti1kJ+4heRiIoggwRFK3Zq4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uqv44HvHczTxhIy9r0Zl0qEjgxPeMF2MMyEoXrpmeghYqTqqoF0pbcL3+CqvqAv7FKYb/+ztA9lf8w14/jzHp5UNfNaL+MSTTqLSxJYf1ouXz04WgAMI6LAhNCBUKf5MufoDXhHqUFR9VDX7okxvqO55Ypw2bX4WN+6QvH616Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kRZihFMd; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089S6hV024342;
	Wed, 8 Jan 2025 14:18:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KypdGnyKgLl4nhvMId8FZobhUoEfqEaVUPzgI6v5dkk=; b=kRZihFMdMm4/V/5j
	KLBRxAjDqBfFEVDxaXFsPr/tmRQgkCFThqx3QuYGyO0d1oE3MRA/L1TtUyN+upDS
	r0CBFTPxgicSNK4qmoKoSRwgZVj+pGZzceEfzECaF2uIO1NeEcbBLUrgMvYSm3lU
	sdVXbhpwiVPsX1WVqAWIjrMUWO6F7izU5dGugfPt37elLsfe+tObFXjG0wkAzS5z
	4mN2R84vIlB5II31tf9NYeJ/SDCvJ+pUixiWAzjHgMH+Wa7jCSO68zCXwgBRvFEC
	g/WXAy7HG96gc5srZFjPxXixAirhNoL1m8cLaGt0F+DkucJQmSlSOTlzuBVU9/C2
	BehfNQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441at8k7tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:18:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C79F04004A;
	Wed,  8 Jan 2025 14:17:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D52E2795F4;
	Wed,  8 Jan 2025 14:16:13 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:12 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 8 Jan 2025 14:16:06 +0100
Subject: [PATCH v2 3/8] media: stm32: csi: register subdev only at end of
 probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-3-05808ce50e41@foss.st.com>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
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

Call v4l2_async_register_subdev only whenever all initialization
are completed at the end of the probe function.
Remove as well useless err_free_priv label by returning directly
upon error.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index e2f63bb47d33..89fcd7d07904 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -991,11 +991,11 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 	ret = stm32_csi_get_resources(csidev, pdev);
 	if (ret)
-		goto err_free_priv;
+		return ret;
 
 	ret = stm32_csi_parse_dt(csidev);
 	if (ret)
-		goto err_free_priv;
+		return ret;
 
 	csidev->sd.owner = THIS_MODULE;
 	csidev->sd.dev = &pdev->dev;
@@ -1020,10 +1020,6 @@ static int stm32_csi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_cleanup;
 
-	ret = v4l2_async_register_subdev(&csidev->sd);
-	if (ret < 0)
-		goto err_cleanup;
-
 	/* Reset device */
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc)) {
@@ -1050,6 +1046,10 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	ret = v4l2_async_register_subdev(&csidev->sd);
+	if (ret < 0)
+		goto err_cleanup;
+
 	dev_info(&pdev->dev,
 		 "Probed CSI with %u lanes\n", csidev->num_lanes);
 
@@ -1057,7 +1057,6 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 err_cleanup:
 	v4l2_async_nf_cleanup(&csidev->notifier);
-err_free_priv:
 	return ret;
 }
 

-- 
2.34.1


