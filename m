Return-Path: <linux-media+bounces-31523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD1AA63DA
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3243C7A27CF
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F43238C09;
	Thu,  1 May 2025 19:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pp1B3pbA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDDD233706;
	Thu,  1 May 2025 19:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126910; cv=none; b=flKylR5JhrOZVzZTFx+cVNmyN026bnX7s/U5UvBexiR2nVLLmyKOjOUQH8Uvj/a2/g7cisJ7jHUT1RUG+SRWZZ90HwdWxt8qke9c7jgPD7dCSwUct6WdJAHIyDNk0A/Iw4QiaBISQDSjY1govOf0LO7EN3iMo3/fzOcrMJo5YdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126910; c=relaxed/simple;
	bh=IsoArjNAMr9vGOrVuWwxTWCJLLltxwrsx/iVARSRLx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=X2QswOrBCQgChoxbP/a9x71ZiHKR+iRWDwZjuar1WCgU1a+LHFG3vr2QBebEWXixZEQvzKY+Ol0CY2BSKhyLxAHpxvPX13fEHDTH2ClDSSAosdOI1XuQ4XVi6yOAPQCuFMIcifFyVHFZz7aVTBYv9sV+nSX+QNBk/m/m0o6njFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pp1B3pbA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D25mU013882;
	Thu, 1 May 2025 19:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O8/wG7gYEgEsImGrujMio15b+qP+0x1WTiiBqMFP4c4=; b=Pp1B3pbAjm3d5k62
	WZGF45sw6TgieAqk+2z8C7Kv0G8bTSokV0sxQ6i+CM8V0HhZYHpkUFKOQZASP7xI
	H73/pZ/Th6K62JNSmqnDT/AeOdFGu9MlwNKKvqVUDY9Y9KCmyqsuCOsqU2966Nu7
	rjiwmZ66BgDf/RSykSfo/KaURAs0coLBIrJ0m/D78I49e9rtWuBPN9eMIKhNSjl0
	jPKQrGWamiCtaoOre0zN3/fqyBH3QhW6hxdqNQ1EuaXhlD9jjTBxzX/ZMsYZFe8x
	Bn3DiBF74EhR782AyowZdtrrNtbTWjKXyfrsf05CpmtVkgIxss/sagCR3gVAphNG
	3aMdhw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1x8kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:15:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JF3GS003954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:15:03 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:14:57 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:41 +0530
Subject: [PATCH v3 11/23] media: iris: Fix buffer preparation failure
 during resolution change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-11-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=1817;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=IsoArjNAMr9vGOrVuWwxTWCJLLltxwrsx/iVARSRLx0=;
 b=N5XoPD8RGs5Lyql8mOawrLYBLzRfBCnVxx6rDYii6t2RiY9ecO10/VbnTL12i+xWD9Xjhku/N
 KrYwUulq2/JCUE61R4AWo5aSOWURalwCvlNCiLPAuLlIFAsO1JZVOH3
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6813c838 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cZZdrgoR5-lzdedOY2QA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NSBTYWx0ZWRfXyIk18lscQ8tm ja/ffd+SJSMM1uuQP5V+hoeTjPXCg+40C/696UTbpO57ojCPWjCOiNQ/Co2k9KiuvS9tDrPJpMq Eln4iyKTdrf3ofdu4KSZ8Kc3mjHuEb01WA/lCI7p7T6m1h+wspTaPdRBOpgj0lEI+5PjXqOb//s
 787DTLst3cqsZ/yYKabuewweD2RHm7wFjpihrLIQL6mpYJdfY8wDIT1hPmFZmjWrzKV7ICgdkUo s8e0leGT6wwiBgkrkXHfwVxirqNXO4fDJC8DE1eVU1NOmz2uzHOEIVXP2PDsyM550DEZs1DWH69 8bx4KMlLb7iNqY95nsM+391J8iPI64Sjvmsq2bFVWQZGzrMKV/Pg6tN+oUKa+A9aV0AK6+Ov0FJ
 exzgou4AxdgOjfYLYFMJ0t3+Z+seLVVVWAeyeolDOdaRD/HgINDVZjL4qi/qCyaek9unkpSF
X-Proofpoint-GUID: AmiEU1Gldct9E7_7Zs2B74ArI4zrtT_8
X-Proofpoint-ORIG-GUID: AmiEU1Gldct9E7_7Zs2B74ArI4zrtT_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010145

When the resolution changes, the driver internally updates the width and
height, but the client continue to queue buffers with the older
resolution until the last flag is received. This results in a mismatch
when the buffers are prepared, causing failure due to outdated size.

Introduce a check to prevent size validation during buffer preparation
if a resolution reconfiguration is in progress, to handle this.

Cc: stable@vger.kernel.org
Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index cdf11feb590b..b3bde10eb6d2 100644
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


