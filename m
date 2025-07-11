Return-Path: <linux-media+bounces-37509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE5B01D2A
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C22871CC01AA
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AF72E54D5;
	Fri, 11 Jul 2025 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bJMVvB1J"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51CA2D373C;
	Fri, 11 Jul 2025 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752239582; cv=none; b=FNx+iOYiLOEB4HrfgQEPBiu33Wy8bfoG1Lr1eeRy2xQEf1hic9lp6B4MLPEwdvTK4zxyGnp3E1OdEtFqLAWwWn5SxbRp3cQ6vBiReCy35R6gJQnWGCaCzpS2hV5Wg/vN3wu2QDlfUsBVlHPk7qYKdKepQbBNn1tTAyzoTUCAnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752239582; c=relaxed/simple;
	bh=skae1NKSSkRvlXtaJFWXSTMeeuILEpTVIklL26psB1s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e1JTeMmGDt8qZKoofKBadgIujqETka+sHQmbRyt/Of4SUQi7MxJHXkD6ZSawIELeDYPqohYWHPMUnGW9W00lxsd812V01QBXEuM16n48X3Widq0gi8tzqTzh4tNzPDkTPTEfeB79PQBBBR7flLeEhNdj+DglVD+2VcLl/Yzrres=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bJMVvB1J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BARiTi018184;
	Fri, 11 Jul 2025 13:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bn+2EfPxrW74YCVLrUQ7XmafitrVBvkYEYL0uehflMQ=; b=bJMVvB1Jqbo71wJc
	nKVBtGf8jJfcB2QiiLoK0ZdLSxbrnog4ZKOUhuq5faeB7GFBQvv3SZGbG84r4+to
	37Nq/OWEVBK66RykkaK/IdyyGlvELFstrORvUbYUL8gomURXo1wjDRw04jSjb82v
	Y13Fl9x+vrET0ajkP56BUeen3M89+yS2G8YbBmmXZIrm/kTapdXKGG6rBhSSo8vT
	a99f7ihefrzgNiF2urtq4pjdW9g41+DzlOHx2BKMjkpOpqzzhWdHXQyMpaP2mcKQ
	lA+XIHutyGL4dx26aG5KcaUr9o2ZozBsVGI5h6hLqZE4b/8o/U3D+UuSBYc/BGes
	0KIodQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf32j6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BDClBQ021644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:47 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 06:12:42 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 7/7] media: qcom: camss: Enumerate resources for QCS8300
Date: Fri, 11 Jul 2025 18:41:34 +0530
Message-ID: <20250711131134.215382-8-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MyBTYWx0ZWRfXxC8aVI6XJP1O
 Xp8xDr+op1eogsEtsbeYOp6Cv30bRRkm6GppYyfWTlFikzeCRi6YJ9yLom3e69+boi7ZXEh8TVu
 TqXr0Zh53/WCNG4j/DSpEKJKHDSyyphZmO6vHsGKdsl/iWIPR8TAmIiiIvm+vo9ORlZjKoqMDye
 fPQIwM990HCeP7Cvc0uKHfkQOSTUw13i3PjHPykZ97glDC0D8gECmmaqVLrmHI+b2O3QXXLJngO
 8BvwuhFYf2li9mA2MO+oYYERZ8YMvExNp62EmWapaNFOU/+NZTEeDra/vcjQjlexP5Z7VCbZii4
 0uHFOUf6vn9AZRG7Gn4lVRPKAWlQxiuwpAwBXR+xqHN0fESHf7ykSRFJ+c6RRpc02fqQVsVi4iD
 1U9h/m5RPy7a2ffN3MyJz7iYxm2VuYo5ffydKFhduebwWObKrLVtUfMDtHCVv2T+sMH2lTOk
X-Proofpoint-GUID: DsF0ThitgJVYzCklWyN-iT9MqQnjrSWS
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=68710dd0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=5xgrgTx84zIufkjN8CwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DsF0ThitgJVYzCklWyN-iT9MqQnjrSWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110093

Enumerate csiphy, csid and vfe resources for qcs8300.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 124bb56167cd..6cd6a5116f5e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4569,7 +4569,14 @@ static const struct camss_resources msm8996_resources = {
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


