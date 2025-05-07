Return-Path: <linux-media+bounces-31908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18FAAD89B
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85BA91C04462
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF702253EF;
	Wed,  7 May 2025 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m2AS4J3g"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3D2253A1;
	Wed,  7 May 2025 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603684; cv=none; b=a+ep72HMHiM6zy3PPeFKSV5hicP83Pc0TiLhCRZ67c1uh/XOhsA4d5kH3JLPD9HOdFvuPr3RC1C+U4my830h2tuE8FlMGfB6eZed3MaX5+aJl0aGp39M59y8nTVt6qQ/K8pXUKl1v42p5RNODtP4T2OWj7FovyG7YRyCWYxYG1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603684; c=relaxed/simple;
	bh=UUIuSXUB9kRToCiTKEKE+pX2gTLFT/nwZVoj4M/Lt8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YH4uqNVSLSiiDk/hRwcedEZq757TawvbADyTTtq6acFw4zuHtlpDEsIAI47euuygvRek8Z86XEneOuBsV5lInh5Fit2C6krG3whEeEM3w15G8sVnPzUTmPcSxsODyqeyXZ5SUU3PZwcBC3GdFlnCvXOojsQqxD2Im/SyZr1EG6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m2AS4J3g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H2V9024523;
	Wed, 7 May 2025 07:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQlEiTomN/Y3tEk5FPnCx87V1DhzZNpnpLALIlwvGv4=; b=m2AS4J3gqSpdx5+y
	Oa7FBQPzVtoPt2VCaldcybU2LUfv+n5aXPlnooLo0VSY9sIxInEwg2NG4wBalHds
	c+gPP4jhvEgjp3eXGAA3wAo/iNWkAelVz7SuARKwcP4papzkigJH8DeooBh++PPY
	OQwNWiaq+GU5+dLHFOWTyllar4gCf5EBr9pWl2RbcORrWSK/hcolheCL4po1Ho/+
	eL2uxUSoqs+eEcmHiFKe0HVLsI+gVxdvBL5cgLfREa65/1a1B9en0/XWtzCJK5pU
	ApasuSsaqBwqQ4CjZD2aicQjr8lVpi6t4RxPAqvH1M6y8Dmie9U2BKXXdhQG4uPa
	/loALA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3cuck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:41:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477fFId000425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:41:15 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:41:11 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:44 +0530
Subject: [PATCH v4 13/25] media: iris: Send V4L2_BUF_FLAG_ERROR for capture
 buffers with 0 filled length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-13-58db3660ac61@quicinc.com>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=1405;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=UUIuSXUB9kRToCiTKEKE+pX2gTLFT/nwZVoj4M/Lt8c=;
 b=7CNwg8LjM7TMt1IiUHz13/hjtuYx5SmZM0B0Q6j1HQ4WdQ+ebcHfOQArj+09H3Np9AGGrpBkS
 OdXc8audlgeADq1G5Kyc92U1ZREsCv0LwQWI1TF2/JXQaKL+fKD+O4b
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX1/02EuUDWseR
 o+ivd1oKEP+KPXGNM2DvgIhOmRQuvloMgv3w1tsQuwi7CF2msxfcAwL9IguTkEdn6e3LMEN26zm
 VEHsIMTtASEo8DuVVMQFpZsIpH1CRuJwA3yyg7VCVuNxmz5fMbo5eKUWQoGIeqozxZZsRHwqYAE
 KMoRAMQNf8X4WPpbFREnDSFvmT27Xq/9bi0vgONbW5i/V2cW79PZ/XXlbF62/WEi6zhTRiY2BKz
 xeEDhRsBlGg9o2X0Y0Q+kh3ELfHAOS3tdcRBVHfxHQ8roWbXISbvPYhtNaUSCIUy1TpHAZASw7d
 9hLXKf+zK9yS4XkZIk/CBtBbUEOcilvLtv0e2/DEFXOVnHtbbAjxflYgj8B9fcds9aubHDQVshM
 fmByGzI+XTpgBsZ3SnkwGxopp6jF221KuqQrlbqrIcZQf6G2n7FO3oUXLM+q9CFrG6RklUwI
X-Proofpoint-GUID: cojBuc4-ovkTpaJMSH3xYU4nawWz2uZi
X-Proofpoint-ORIG-GUID: cojBuc4-ovkTpaJMSH3xYU4nawWz2uZi
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681b0e9c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=LvXDYVKuO090uWtrTYMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=651 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

Firmware sends capture buffers with 0 filled length which are not to be
displayed and should be dropped by client.
To achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers by making
sure:
- These 0 length buffers are not returned as result of flush.
- Its not a buffer with LAST flag enabled which will also have 0 filled
  length.

Cc: stable@vger.kernel.org
Fixes: d09100763bed ("media: iris: add support for drain sequence")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 4488540d1d410b58af02ab82a3238ccbe40f7093..d2cede2fe1b5a82cbd4dd399860c43ef044d687f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -378,6 +378,11 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
+	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
+		buf->flags |= V4L2_BUF_FLAG_ERROR;
+	}
+
 	return 0;
 }
 

-- 
2.34.1


