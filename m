Return-Path: <linux-media+bounces-32103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9BAB0D98
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88250A08175
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32CD2857EB;
	Fri,  9 May 2025 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FZj+Vqly"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D622820B1;
	Fri,  9 May 2025 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780033; cv=none; b=OkRptXxZvKrEdSNUnph6yZJTswlTosUm+35U+4oWk6C/qNQdsyMYWLBRrmvCnABXmhwREK2dWip++z+/P8SRrQy/Zb/avqfoPOsuyQg8ebwEIQy4rwh6aVJn1Dra+h9qXnPyEtXI6kn2FC0UUk+mq2URWuaeLlmH1rPWpg37i84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780033; c=relaxed/simple;
	bh=e6fqQAWvbnRasczbU6XMZjKYdT8pZBH8kj9g7yhKcqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HA56XHOChp5nPHyToHN/QX3K70+9d0KV2udfoyZ1OQx3AfjVdpOxE4SkXwXtYZ4GDrAYr6YzTuftVHdEK11f1IQsxOP1d1kNX4HSoWvhckVDaLsx66FqdFIr2LexPKB30i0WBpqhFNDNEP5RDX8s/rB8+KdZ3mh1jS3lPBcbr38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FZj+Vqly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549331a1002620;
	Fri, 9 May 2025 08:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ypvsp4uRNvJzqLaMDgJMq2YiDNYtyTBOLsJier0CfwA=; b=FZj+VqlyxcaHlQAh
	XOab4dojNeNRQgZXUir+737edW4pDv3SoHGG/U12sklSEvnWL7FwC3qy0FixWaTQ
	qxhhPPBfiFsdw1sl7TomYUEytTcdpMM/jITi6BvXUo4h+Iqi7AomyCyhEpB0ckwq
	l2jQbSTHHROQFLUrPlNbD4IUlhVIAZ8FwiNemJyjYDpZbo3VLUM3CYbvrf3Pr29N
	e1SeYhKBJN1UYcNaOvkc//EEHwrZnkvwQYmDjankaXSuY3Vipv/hFdAtf0/MIuzQ
	2HlwY7KCOyc+3307sY/vZjg1qjwWBBEbwYcT9vUzrmaE8HCMIIbOVhcDwZEW1MSJ
	zeO3ag==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5bxd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498ePUP000597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:25 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:21 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:04 +0530
Subject: [PATCH v5 18/26] media: iris: Add handling for no show frames
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-18-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=2354;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=e6fqQAWvbnRasczbU6XMZjKYdT8pZBH8kj9g7yhKcqc=;
 b=bkQbvZgLvh/pJFMRIEWwfb5s61b2kKjaNZHxLftVR/OM9WvfOJGZJpcX7a9qdAC/TORUR9z0u
 RcUfzJrBPX+Adn7zdwN3iXZrII7znPBvuOe9nO5kAu7fDHtp3eNMx+s
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681dbf7a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=jWvzItAkzE0BTinG1IUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bNPKBnCP_NVkKC1nXMAUPsqPOjuzoYIX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX6lc8WwDFDo1J
 3ux6JMC9V89qAZ5Rb9MOvW5ENnCP+dcrWqsZAPnyUv5cS/pUXTQZty2iJFjNFB49ZOQ16kz1uGD
 WR6mN1hOv0xtFSJK1z3S2c0CfoAKyXv58DvPQ6kawg3qKoqqZMHJQZYzvvQXBiPFGybsDRn+V2q
 3JK1rHbtsMIm4csAHd1NOi9TEH/p2WkQB+6eMoXd4Rd833MwCcN3062j0XljTC2u583nsPzukbc
 jw9LiftkIej2o+T5Y/1wMMlspZnvUV1gkBQjoyp3c9N/OT6upqZvC9XqqpUM1La/LiG3vYOg/rO
 Vb11EB0UM1xC5hBRcZTPatHrwv3mKac2Axk42trr5hU6CrA8XIyzvd6LjSBWMh+cwtgpFLLBr4D
 3x2EU0Whj1T/tYY9iKShG36Iu5wusWDW5Yj0S5FYWBu/79q6ky3LKaAkmUONM7msNPGSFKOm
X-Proofpoint-ORIG-GUID: bNPKBnCP_NVkKC1nXMAUPsqPOjuzoYIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=896 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090083

Firmware sends the picture type as NO_SHOW for frames which are not
supposed to be displayed, add handling for the same in driver to drop
them.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h  | 1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 806f8bb7f505d25cafcfd5e75a39d0f00eaeac42..666061a612c304698067337f63ac9332c75c5d36 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -113,6 +113,7 @@ enum hfi_picture_type {
 	HFI_PICTURE_I				= 0x00000008,
 	HFI_PICTURE_CRA				= 0x00000010,
 	HFI_PICTURE_BLA				= 0x00000020,
+	HFI_PICTURE_NOSHOW			= 0x00000040,
 };
 
 enum hfi_buffer_type {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index d2cede2fe1b5a82cbd4dd399860c43ef044d687f..b6d0ff860d7866c85c7768ec263f0d30b42446a6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -91,7 +91,9 @@ static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 driver_flags = 0;
 
-	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
+	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_NOSHOW)
+		driver_flags |= V4L2_BUF_FLAG_ERROR;
+	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
 		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
 	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_P)
 		driver_flags |= V4L2_BUF_FLAG_PFRAME;

-- 
2.34.1


