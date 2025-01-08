Return-Path: <linux-media+bounces-24412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2EA05CA7
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E998E18826F1
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5516D1FBEBE;
	Wed,  8 Jan 2025 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="n1FELsl3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189E31F9F64;
	Wed,  8 Jan 2025 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342537; cv=none; b=ViK45SONdYZrzHA1TWBoisAjXqmqbWvQzHy6pG6WQBBaW5NzrSO/FAEDERbYeo19veXpQ+dqDisJRd4HS+lsoPfxxHWUkxgCBPovLk0ia37t1k5IMWqG99Fs/VIdiTpUQXTctuXBK5KFeB1YcjMH9qimdG+88RzALJ+5zAjFYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342537; c=relaxed/simple;
	bh=Hbacsucq4dqLttPfiuFlREj+2dKd1s0JiRCYtjNEUjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dFwMwXOrmHt1juEP1vqPfv8P3J/sn4d5a03qSiGQXLoLNqY38SKDe11QGezX94616tEzS5qs4VoAPHylFpG0QRwHYlvPqZRvRAxlFcbNfoGhCZ5kn+k62w+OxcAB+RUj/40o7Rt4FcnNLfpW2m+c2uuKItx3AgFjweNSojXJo8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=n1FELsl3; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508DL90P003051;
	Wed, 8 Jan 2025 14:22:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JbpwNe7H/nYAZqga9/+6DPVfcnSEXkS2J7ZN0f7NL8A=; b=n1FELsl3p37Pu62t
	yPHc3xzsr46g5mucwC54OICqHBMsfdl060XfzkSXh8q6r1hNLiw2cfhN90jfqKHh
	9D696cZaIkcGzGq52epFQ1lp8iNirakFbQgSmVnPGapLQqDYp4w926KH7bHpUSad
	exVEvuFrii1bNTtLwHdxyh3pFYJ4MWR831PsREQuxTCWGeYuCkcSPymcg7pvPdS2
	13gzTnccLkt42MBjyDQ7EcbdqD905RflJoJOtEr0c1nSI28pkzVekc5ppaY5Oj/U
	Uc+OG5roB3FI/YVrHb0ocJp/kWH+HnLPwINYq5JTPShGgUHMY8/FmPA7R6qgurdF
	OIiN5g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441kvw1rw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:22:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AAEEB4006C;
	Wed,  8 Jan 2025 14:20:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 884D0270597;
	Wed,  8 Jan 2025 14:16:16 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:16 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 8 Jan 2025 14:16:09 +0100
Subject: [PATCH v2 6/8] media: stm32: csi: remove useless
 fwnode_graph_get_endpoint call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-6-05808ce50e41@foss.st.com>
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


