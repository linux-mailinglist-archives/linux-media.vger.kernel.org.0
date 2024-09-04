Return-Path: <linux-media+bounces-17558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2930996B9C7
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAB032859BD
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5E41D04B8;
	Wed,  4 Sep 2024 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hxt8zByh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769A91D04B3;
	Wed,  4 Sep 2024 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448326; cv=none; b=BD7Cu9PSO0A0kEfGR/TQOoaWPSE3/Q8lV1A02z+5sajiWRqKNrh0fNZ92nWVoGl4Ahe7h6upmbz3KwoXHkwypD+m6lx0lRKzZIwhLJEUSuOfACkl5fwJ10yOKdwLO+c8ZJIqwdO275yl8fT7klZZBb8MZL6HMd+6B6+zV4AOn2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448326; c=relaxed/simple;
	bh=Qfo4SG04JA1avzMunJkHpOPgO4ke3s3rGLlQH1I3nyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=m/6LDfSrB1tFNQmpD9BYF9LfZK027MbDUSEpD6ywL73/2yskEKI37O1/fPxmTrz6gw48mTBY53/HAVSp357XWeNUyjZXgrwRxyaNuqUzXxqR/Bk3Sk2jYL4b2/lYQo74/qr6KMgGN2wCLoWN950geJIsxxU+qE97bfpzZWSnOQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hxt8zByh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4849vUX6029938;
	Wed, 4 Sep 2024 11:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWlGfHBVtQOmxS9NVYbXksZ8cvR3jgjROa3dS+WJ5xU=; b=Hxt8zByhrPSmKOQc
	y6uLf2Rl5Z+brr32Rio8FzxbUZjsqR3UOvJf2d5jon00/HF4FgdQnT5VJDOiIeVk
	RzslXBfiyKHJdcSMzt1o8hIbpJbifFAaKFqlkme41di2/Zl6ueJ53gUca+JRcoYp
	d0c4LWxmB2487nh3K7ZIgwz6P+qewqz/GJGyxIZbSKLbh9zyvuaYRr+Y4CV0xyRL
	7ohemALJoxFRMT6D0jYJ0oagTutwruR5wHE+CBvH/HZWBGWkJiLtsds6Op3W9iGm
	rE1y2NQKoBRdiCZB92rPASFzWo4z66jxwhkpAuLVCq0mghMNiNSKvQkrD8xSg11c
	4D79dw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy23wt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 11:11:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484BBse5002289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 11:11:54 GMT
Received: from [169.254.0.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 04:11:48 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Wed, 4 Sep 2024 16:40:09 +0530
Subject: [PATCH 03/10] media: qcom: camss: Fix potential crash if domain
 attach fails
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-3-b18ddcd7d9df@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725448289; l=1333;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=Qfo4SG04JA1avzMunJkHpOPgO4ke3s3rGLlQH1I3nyk=;
 b=wAtJvj1IJ4SSelejjIF4WasEAIO8cqACdGS3sGDSchgU6EypI00JHnGxqFlr+O5l/qCHCI6cq
 JiO2wdtPtc5AWq42hm0tBC/NBnYTPu5GcaGTBftF8OpQJwhyinmZAyI
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cjBJNoG6w3gpnKxVfNv_GfhM86DHbszL
X-Proofpoint-ORIG-GUID: cjBJNoG6w3gpnKxVfNv_GfhM86DHbszL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_09,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040084

Fix a potential crash in camss by ensuring detach is skipped if attach
is unsuccessful.

Fixes: d89751c61279 ("media: qcom: camss: Add support for named power-domains")
CC: stable@vger.kernel.org
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d64985ca6e88..447b89d07e8a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2132,7 +2132,7 @@ static int camss_configure_pd(struct camss *camss)
 							    camss->res->pd_name);
 		if (IS_ERR(camss->genpd)) {
 			ret = PTR_ERR(camss->genpd);
-			goto fail_pm;
+			goto fail_pm_attach;
 		}
 	}
 
@@ -2149,7 +2149,7 @@ static int camss_configure_pd(struct camss *camss)
 			ret = -ENODEV;
 		else
 			ret = PTR_ERR(camss->genpd);
-		goto fail_pm;
+		goto fail_pm_attach;
 	}
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
 					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
@@ -2164,6 +2164,7 @@ static int camss_configure_pd(struct camss *camss)
 fail_pm:
 	dev_pm_domain_detach(camss->genpd, true);
 
+fail_pm_attach:
 	return ret;
 }
 

-- 
2.25.1


