Return-Path: <linux-media+bounces-23629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 791289F54F9
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9071A166BBC
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C9A1FA156;
	Tue, 17 Dec 2024 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ClbHpWdO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC55D1F9416;
	Tue, 17 Dec 2024 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457313; cv=none; b=maPd5WjzRf+QijO7M/LNQqU8UumNIFPmWu0fI1BwhMXx1aGJjMXTjVksUAGrFpvIq2pWkGRVopBOxUm0RyZY7VQxJTJNc0OsIIqOehSk4OdGuLZ0PI+FRffGdLOKCAjqlg18SkoIrGDBl92QtTRJcQSVA3711IjA10edPsLA+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457313; c=relaxed/simple;
	bh=Hbacsucq4dqLttPfiuFlREj+2dKd1s0JiRCYtjNEUjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=abPQrUBZshu1PlCzpUql7mcVQUjTaJiq82DWBc4UY5nAzIYkFV2dQS+E0/Jm+sdw9mCr0PsVeJKbKNxuuNnSLg8f5cnpOKdGiApEw/+Y+9OjsGX1JnZJCMH/zQtlVvPIEPvgLLAd9HO5PzGYfDdlmwTWPeBCl6INiHd2Xcy+XFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ClbHpWdO; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHCtt5Q001007;
	Tue, 17 Dec 2024 18:41:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JbpwNe7H/nYAZqga9/+6DPVfcnSEXkS2J7ZN0f7NL8A=; b=ClbHpWdOqUo6m+lk
	beI5nB4wu4lBpS0+JNaWk5ySIEiwvuK3OOKFaYHOOhXveCsUVP54Ly3AcikaA4PA
	iyPJ57ULtbVrudeRoHhEhtt/9g+kbJ29yEn/VNYX+3ZdEWtP6N+NFY8kPUZ1E+dR
	rGodh+U6MaIpMY4CVGTD+CvFLIxHD2lkKul+WgwZUnQ/ZwhyCkyTw4Ckgi8LsoYZ
	Y/KycKYymQxopD8AYCAE519OylQNsKciuhTMjJUQ+CWaNe0g2uc/Ud/UtnnlrKvQ
	uwGjD+kB1/y14SOrFzipmolJRBvdzNijrc1pj1uGw5idUau4xx5y6fImXkfDY3zh
	6QoFFQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5ngavvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 18:41:40 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9E4AE4004D;
	Tue, 17 Dec 2024 18:40:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E79AF2928A8;
	Tue, 17 Dec 2024 18:39:31 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 17 Dec 2024 18:39:24 +0100
Subject: [PATCH 7/9] media: stm32: csi: remove useless
 fwnode_graph_get_endpoint call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-7-2b432805d17d@foss.st.com>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
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

The endpoint is already retrieved at the beginning of the function
stm32_csi_parse_dt hence keep the endpoint pointer until the end
instead of getting a new one.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 4affbc00b042..1be12c9dcf55 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -932,38 +932,32 @@ static int stm32_csi_parse_dt(struct stm32_csi_dev *csidev)
 	}
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
-	fwnode_handle_put(ep);
 	if (ret) {
 		dev_err(csidev->dev, "Could not parse v4l2 endpoint\n");
-		return ret;
+		goto out;
 	}
 
 	csidev->num_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
 	if (csidev->num_lanes > STM32_CSI_LANES_MAX) {
 		dev_err(csidev->dev, "Unsupported number of data-lanes: %d\n",
 			csidev->num_lanes);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	memcpy(csidev->lanes, v4l2_ep.bus.mipi_csi2.data_lanes,
 	       sizeof(csidev->lanes));
 
-	ep = fwnode_graph_get_next_endpoint(dev_fwnode(csidev->dev), NULL);
-	if (!ep) {
-		dev_err(csidev->dev, "Failed to get next endpoint\n");
-		return -EINVAL;
-	}
-
 	v4l2_async_subdev_nf_init(&csidev->notifier, &csidev->sd);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csidev->notifier, ep,
 					      struct v4l2_async_connection);
 
-	fwnode_handle_put(ep);
 
 	if (IS_ERR(asd)) {
 		dev_err(csidev->dev, "Failed to add fwnode remote subdev\n");
-		return PTR_ERR(asd);
+		ret = PTR_ERR(asd);
+		goto out;
 	}
 
 	csidev->notifier.ops = &stm32_csi_notifier_ops;
@@ -972,9 +966,11 @@ static int stm32_csi_parse_dt(struct stm32_csi_dev *csidev)
 	if (ret) {
 		dev_err(csidev->dev, "Failed to register notifier\n");
 		v4l2_async_nf_cleanup(&csidev->notifier);
-		return ret;
+		goto out;
 	}
 
+out:
+	fwnode_handle_put(ep);
 	return ret;
 }
 

-- 
2.34.1


