Return-Path: <linux-media+bounces-32098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BC2AB0D71
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A36A64C7744
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1893627F182;
	Fri,  9 May 2025 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hj+ha0GL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E489327E1D0;
	Fri,  9 May 2025 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780011; cv=none; b=VSkCzlj3wxHZUJBkQRu4eCOlwGMw1/qmu6WR3Pr51LAdhBt9QHReZNVJRHK2VuiulllxoHEyuquHJ17v21ZxkQ/VzEGtiB9IeLI+27GY5CeuMRC9gcRg+vllK+RBq7IdjqTJ6qjHD/2NzXZb8Ctm7INDuv746TwD0toVlWcJ6V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780011; c=relaxed/simple;
	bh=j1VZTozgcLwa21ZleLfFVPu/d3PP4zbs9E/QRsF1U8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=b2Vran7Fy+IKiDBxtrCQgwoYDbg2SmnVunKS7ZWUa3k1ZtC3bfb4A8EI78mgEa987VfuvPQVN08R0cM33ARv8z2DW6UZmpFjrnuNv9+oOQiMcvjTeee0fVxG3j1vp/3ilQYgIVvJlvkgeUsFMOGF/g0Dn9fvbKRuhpdw+Sw/S6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hj+ha0GL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491eE4m002489;
	Fri, 9 May 2025 08:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sAI7/lciJLr1bHD7yWzWZkjRt56isDIajoCTXsHcybY=; b=hj+ha0GLWPMPTyOu
	CXzoYAf6KE9oM2TBVj5AZCfPKNfOsjbAWuTYMOKZaoSiDx8CKcFZdSepN9UUX0le
	wzVWd6nzIpfiouEhopCgik5p3WYy3XDGCVh+vL31iKO8JtXMORgAAE40xmBulm60
	nAXtG86kQe/e0nial5X9Z297v+y4zxrzDGTkBjS/oBcVn6YG9za65H6DdQ7TvLog
	Og2IuCpbUz7G6KMXXDl7sz8gtoSIee1bz6ish06mvfLEiyg0ohXmD+uaKoUDGsJv
	wACNjKTPjgv6PUdQKPaKagysS2bylwSRb4pvh2VilMZGbZzB+vhXLIKSprQPa6YR
	afjTqw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5bxce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498e3eE021884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:03 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:58 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:59 +0530
Subject: [PATCH v5 13/26] media: iris: Fix buffer preparation failure
 during resolution change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-13-59b4ff7d331c@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=2157;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=j1VZTozgcLwa21ZleLfFVPu/d3PP4zbs9E/QRsF1U8U=;
 b=BEwY16fc3CadaUcFE9y6FrfiyW8zc+8IvULuWLJ7qUbHmyI6I5Pq2eZyeptSLQWnhuGyMNd6P
 hJ0HBbx24JPCwkd0WCBorR3pSi7IytV59z61SiDCy60n+M7cNwpP7Tj
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681dbf64 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=F5OP8gyUoVIZWM9qK6AA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: aA7EwIZ_IT0jq56ZPg9ap9gpDiouoSJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX2Rboq5F53Ysc
 JOiDe7Ce/y+ITOZUBg+2PonovYWFMhDsP6MKUc+QSwGGVtVQPncgWAqUsyh1y+h9QJ7G+8cO08Z
 UjXz7FBx5q7qVY5YJpKi5QCa2CV5pAfiturJCJ9xkk70XyXSCRj0RwEjSbwILa0dBm6t1Q2TAfu
 7nBuBn36FuWz9eBvYOdC+Lj6YSEk8V53DXJCEw4TADNVlssCcCuCGzl/Zwa/BJO5K0Y9J84iewx
 EsOD3BycdjnjfJR2nKcf3WD56pLh6nsOw3cqLnxzUvEUK7w5yTZfqiIbJaOm9QGRbQYrMwZhY7k
 sbLlwUTAVlflc0wWoyyeCVPOk2EAAtSazBAQGyR1dErKh0qt+4vwUx1VRvtO8JrK3aNRoXMszHV
 f/sP9WB2al05deD14ihFf4nQRIOmkN8tX6q6sxoHB4SnPbjaWku4KHp8QFkLbA9rS0XG/jFu
X-Proofpoint-ORIG-GUID: aA7EwIZ_IT0jq56ZPg9ap9gpDiouoSJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090083

When the resolution changes, the driver internally updates the width and
height, but the client continue to queue buffers with the older
resolution until the last flag is received. This results in a mismatch
when the buffers are prepared, causing failure due to outdated size.

Introduce a check to prevent size validation during buffer preparation
if a resolution reconfiguration is in progress, to handle this.

Cc: stable@vger.kernel.org
Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index cdf11feb590b5cb7804db3fcde7282fb1f9f1a1e..b3bde10eb6d2f05696e14fe0e7c44de013bec39e 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -259,13 +259,14 @@ int iris_vb2_buf_prepare(struct vb2_buffer *vb)
 			return -EINVAL;
 	}
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
-	    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_OUTPUT))
-		return -EINVAL;
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
-	    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_INPUT))
-		return -EINVAL;
-
+	if (!(inst->sub_state & IRIS_INST_SUB_DRC)) {
+		if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+		    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_OUTPUT))
+			return -EINVAL;
+		if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+		    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_INPUT))
+			return -EINVAL;
+	}
 	return 0;
 }
 

-- 
2.34.1


