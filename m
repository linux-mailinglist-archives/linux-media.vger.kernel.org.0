Return-Path: <linux-media+bounces-26154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D972A35AF8
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 10:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94FF516F7EF
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 09:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1215F25A62C;
	Fri, 14 Feb 2025 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cG1dOifW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F0E25A35E;
	Fri, 14 Feb 2025 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527007; cv=none; b=h0vNAnpOVvuy7HD7pEixT4YTv5UJ4nW1Jivz9T3isCredy55lHth7ETvMAXjtXUay65vWlXQynWElmv5l/ippcu0D/FtbRUcorfWSkrHvrafaft6uwV17hNSNWRfCQ+cwk1jUnOJsJZWgnu0sEI5955bk24vnt+TeJzIRKo1zjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527007; c=relaxed/simple;
	bh=2LO0cXJZgVMVTgsRdZr9kQEfeyBkSEdO1XQGhXms6V8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJbhV3lv+6DFzPjeYxibYWSerje4s5YzFYN1RgPahpOhATMaVBx/2z8DmM/smoyFBl6J0l+IsYEAqTXKFNex8xlVjHTOrgeFkUvpQqTojCsxJH93yMUhqV9ZsK0OSvgONRnxLnMVhkO5+wcfPgG5RVMSW9KeLRkpdjkKWasWZkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cG1dOifW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E8R23d027806;
	Fri, 14 Feb 2025 09:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbWj2224SpWSWtxrztfF1M/84AOkSFaVl56P/yckdPo=; b=cG1dOifWdaRdjfjl
	ErgX9yD5Krbnr3fu2QCh0doKCb4lEyQRHxXJPnW51HYCzN45bOmDMDiWXa6epccY
	7NLk10nHDYZj9nEXtw3uMSjHi4dnFf7FqQXjwkp3bEXy2NhUoWNMMumi6wLYAR7H
	RHyzEgu8x1nsvDc83GNEzzcVBT3e4idhM5ceKwXcjhO9Cnfyq2ugu8yM47LnNgZ2
	bBJaAXK2WGJw/CylOt5OdIdj9uEleQzaq1BRLdCnVZ0g/kkOJTA0Iv8vcqN4OwDA
	rlv082t9tfIVYflX65qhXBFGoSq8bSzxHwsqQCeTNi8W34Jn5RkASqeCDool3URC
	YEGT7A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebnbau5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E9ufwc000791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:41 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 01:56:39 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>
Subject: [PATCH v1 5/5] media: qcom: camss: Enumerate resources for QCS8300
Date: Fri, 14 Feb 2025 15:26:11 +0530
Message-ID: <20250214095611.2498950-6-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214095611.2498950-1-quic_vikramsa@quicinc.com>
References: <20250214095611.2498950-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: OaMLSnJ5kDKdAXi-W_K49TtrHVZGwIzs
X-Proofpoint-ORIG-GUID: OaMLSnJ5kDKdAXi-W_K49TtrHVZGwIzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140071

Enumerate csiphy, csid and vfe resources for qcs8300.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2ac3d8814b35..cef1b0854eaa 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4211,7 +4211,14 @@ static const struct camss_resources msm8996_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8300,
+	.csid_res = csid_res_8300,
+	.csid_wrapper_res = &csid_wrapper_res_qcs8300,
+	.vfe_res = vfe_res_8300,
 	.icc_res = icc_res_qcs8300,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.csid_num = ARRAY_SIZE(csid_res_8300),
+	.vfe_num = ARRAY_SIZE(vfe_res_8300),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
 	.link_entities = camss_link_entities
 };
-- 
2.25.1


