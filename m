Return-Path: <linux-media+bounces-39724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9300BB24068
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23F01174FF5
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 05:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A802D0C7B;
	Wed, 13 Aug 2025 05:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U6LBjXYU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16572BF3CF;
	Wed, 13 Aug 2025 05:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063525; cv=none; b=RnaRqSFUcZyZpskFBpK/9rwgum0tUFNGzdx7poG+DUMMiCDfFvyV3nw0AtAi5vZlJtehd5no7B/GvcUTXNj1JbJEV+vgGQwIOsNOYSGw+BQa6eTQHkEADPHPPcGsDCC6UQjOQTSHNqC+TgywZkJ258Vr/nqu2sRJCbMdgm54ffs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063525; c=relaxed/simple;
	bh=mc6ws8PSGJaqqaTkozs5c62nWvI2ZKZw8Bj6uGu123U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lPZ5PmwTNimllfG77WhMp7kfhTofCPQCeHvamRmJbBWrbO8zNcae9St9vgEyUTpyLriHgPs8Lhr9SukyEejNdOClDLCRV9fQVAoVs5CBpiFShyXGREjrAvgRNcIlt/yG+aSfvN/YvFAyTBLK64a6OqcEEt9asRV3aK9+5Lppj7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U6LBjXYU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nYrO011486;
	Wed, 13 Aug 2025 05:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZ0oTJ7BNPy/AuEtcunjTR7FnjQNVLvYIrYGkJCiqYA=; b=U6LBjXYUWsgYoVtX
	RFY9zB1rbvXb4139LLD4VT+T+9obiL2e1a1u1Id1Pt6S/NRd5G+P7TSjPymZfE5k
	KkbbkZt15OJxLx6a4I5rbgnvedDVwzdDc+BzjsOtCD9NPaW3Dx71vIrDVZknYpO9
	lHhvXzb3T+Qva3U/rTOBCLSJ0KcLReKZ9np1Ti93fAHYxSVlX0/z/EujdeRz8q9b
	sA4BMDaSpdCjM/qsNdqSi9dAQHfc60nLqzjVLVU+ceCZnYXK6dDkA2PtyGcCEerg
	8jqLxyjw2/8HHc4a622x0yoel129PpjZTT2sgxczpJJcIn6mmMT4f/H6wKGnQpEU
	L9Lcag==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjpcec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D5cYQ3025732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:34 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 22:38:29 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/7] media: qcom: camss: Enumerate resources for QCS8300
Date: Wed, 13 Aug 2025 11:07:23 +0530
Message-ID: <20250813053724.232494-7-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX1omN0NRxmtWZ
 qb/FscVkccr4/1CG5pyFr6MtoxhShDh1WXCnUCd3qN6L5kmvwn2NOksbkW4HM7gEANK9Td6rvkt
 LrytLUvAzY60g2Y3MxGImTt9wS8vHJ6rn9EyYFKdzRySbNMbrn2D0qWNseLJYy8ldMrvUV56Hx4
 7j2sC1/nMW1dp62i3lM2g2XTnO1tSuSZs+dx0g0GwhXpwalj3SodHiOaE3d7zbISrUUAJrWTbva
 tyh8votgrcgpcqUUUG5alrunE7OSJT64L0KJdrIcMdcUaCWR/0jm9UgvHE3lhST+2HTHfCvHYiS
 UFLc06IgV5Yaq0WG/iNEBy+60THzVIAeYZrHb/MhhxwjM999SWm83APFPQN8dbyIqpgLerSOEAh
 5DJUgmMr
X-Proofpoint-GUID: xlcmQg_avi1Xruu1g_YNVZABBUK1xUjt
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c24db cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=5xgrgTx84zIufkjN8CwA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xlcmQg_avi1Xruu1g_YNVZABBUK1xUjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

Enumerate csiphy, csid and vfe resources for qcs8300.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 410e188d26aa..ad88356b329a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4216,7 +4216,14 @@ static const struct camss_resources msm8996_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8300,
+	.csid_res = csid_res_8775p,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
+	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_qcs8300,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.csid_num = ARRAY_SIZE(csid_res_8775p),
+	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
 	.link_entities = camss_link_entities
 };
-- 
2.25.1


