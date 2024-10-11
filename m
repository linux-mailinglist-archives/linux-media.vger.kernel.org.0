Return-Path: <linux-media+bounces-19425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 510E099A5EB
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 812C91C23410
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B780721B42A;
	Fri, 11 Oct 2024 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ltps0kap"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF2D517;
	Fri, 11 Oct 2024 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655831; cv=none; b=bra1xIKtyG+OZ5qCP4EeqDjMk1ZqmjjoHwYQlNr1sipwKK436PqSgxJFSsSbSvwzx0/y253+FTUlxR/ZFhGaFOj2GfWebYnLQrmCraYjuZ/01JUXs8d5h4rS5KD3Oeq3NgUehZPLM+RAnBB8zUkgSDe9c60iQ/yxoNKB/klIiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655831; c=relaxed/simple;
	bh=Brgos7CnbGWGJd2NtGmjE5E3I+CrnBntojNJAEtJTMs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTkILvsz8BHzpbNrYWzJ2QMJvxADVNg3kMRiAvoi/B2JUNDaviKGdZ5169HbvVSreqLvgwQ2bwUeLHpgt6CssEdZKPNButr44C7taGVboiQZ+8TjWkJdiKFOyg8w0+3S3KF0VYppDgudsEbpbNuF39VmRAHV0MyGmdg0uZYNCj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ltps0kap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8opDK002583;
	Fri, 11 Oct 2024 14:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gqsoG9dX1i/Jsd1PxLP9Cg2HimFmmvo9dg/nrBtxc7g=; b=ltps0kap7j0WfZVJ
	UAfN8CuiVKWCK+pvom7yTdw/5e45BANmQCga7+YTrPOuK+mgK+uXl7BveCQB9T/6
	S/4ubk/r3tRUg6NVyq/pNn3Nct2P7LegsVHAwKVRj6k3j6IiVCtAcDVed2EeQaGY
	+XuRShBLXS83y4fFw1pylPs5VMOeNuOGOpqk4GAoSjc6sSqlqb9q6rJ67+//UsgQ
	bEzo0knFXWkU4p7RmyQPlgSIrjiLHilsT0ew9lyI3Eq+RTy89aU7PxTaEXIwn+NM
	NuZ8dsz+OhZRs6ifZ6tAdG14eg56UaYgWfVb3DcYSeDU3XrWaDAZjcpsmsOiS9U9
	ovv2Ww==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426nc2jhs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BEAF49004511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:15 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 07:10:06 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 3/8] media: qcom: camss: Fix potential crash if domain attach fails
Date: Fri, 11 Oct 2024 19:39:27 +0530
Message-ID: <20241011140932.1744124-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WqnmlZC38mq4WpLIPdIrESwRRWUSQxPf
X-Proofpoint-GUID: WqnmlZC38mq4WpLIPdIrESwRRWUSQxPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110098

Fix a potential crash in camss by ensuring detach is skipped if attach
is unsuccessful.

Fixes: d89751c61279 ("media: qcom: camss: Add support for named power-domains")
CC: stable@vger.kernel.org
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d64985ca6e88..b6658df37709 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2131,8 +2131,7 @@ static int camss_configure_pd(struct camss *camss)
 		camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
 							    camss->res->pd_name);
 		if (IS_ERR(camss->genpd)) {
-			ret = PTR_ERR(camss->genpd);
-			goto fail_pm;
+			return PTR_ERR(camss->genpd);
 		}
 	}
 
@@ -2149,7 +2148,7 @@ static int camss_configure_pd(struct camss *camss)
 			ret = -ENODEV;
 		else
 			ret = PTR_ERR(camss->genpd);
-		goto fail_pm;
+		return ret;
 	}
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
 					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
-- 
2.25.1


