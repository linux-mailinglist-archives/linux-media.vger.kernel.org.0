Return-Path: <linux-media+bounces-40359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E81B2D7C8
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA9E1C43292
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B0F2E3B19;
	Wed, 20 Aug 2025 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hYoMOC+X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABDD2E3AE0;
	Wed, 20 Aug 2025 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680898; cv=none; b=alKvF9b1cUJV74RqgLB7Qs5rFbORE7NKzqjMQv9UCCAYR0GTzK+CITankEJWZxAkv8lpwcne61onPe6GVOcX29up7+swXcg78nu6KJx4q1cOV8g1vZznCzBEUXdIpUZIFRO5YcSCkX/OP+5nocVj95qpRhvnPAbLW22aGQtPdtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680898; c=relaxed/simple;
	bh=kuWekWhENmCNRWUDgoliNLSdNKfeZNQQz+2rWHDz4G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=u2Xlvyb/wSUj2/lyRd/G8+8lB64WQ1colqiY3ViyQ+2+LMdyAdd4wcI2ZknSk5EA+kyBSQ9PNUjPr8HCu5Qqoyu1a/9GuTOav1YnBbxyODAhjmf/09NRGaQ17we7tkX9XFXb1O5PI9fAdlY1aXB8GR04xdeaGkw47Jzm62qQr/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hYoMOC+X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1pBRb031514;
	Wed, 20 Aug 2025 09:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DwPvCWvEU4N+F5CQDtP/mXz76OK6UtOnI+xm0Bh7zwo=; b=hYoMOC+Xyd2vThg/
	x7iv31lx/1KfFwCuIIvQd+1ajJMgM5jX+p+e+ZJy6lRfvgyzg+5J5yLqrmtttrcB
	00zrawHYSexOspKyGKlSbLPhXy+Pp0x07KORPVUSZY1kw6hdJW3ZrE8C2iHkMtIu
	Ww8pyiYBFmSYggRv4F/hpQW8J5K2fFCzaNwR/+x5bY9K9Ba68pY4onVngS1/GUHR
	YuYGV4H1xS3gftpiqRJ3W3yhBDIBUftEGvJy8vwYs4me5YWKM3Jij0nJzVOSNv6z
	Pv2UDayBTzTNXOSamzuXblT1icwn0hcJ8ueAObg4oSNhw1nuEXGtPzU2qbknsU94
	GfjrMw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dh3en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98BqQ001018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:11 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:07 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:43 +0530
Subject: [PATCH v3 05/26] media: iris: Allow substate transition to load
 resources during output streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-5-80ab0ba58b3d@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=1752;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=kuWekWhENmCNRWUDgoliNLSdNKfeZNQQz+2rWHDz4G0=;
 b=WPJbtyhQnJt8bEyKzh1n5NaVQpIfoDjzrVwLCoJLSPO36uVwmEzzDuOR7mkeoYGzWCPFKOiCF
 llR0a27BywrBcskSwUlpUy6QdvptvPsOgc+9y4wei22dJymgymH+jlV
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX64PG0wswNSXP
 HJwqWtMnhBWg++xY2iUlUntQ9wqAXFtpEmYTLQkRdLTa/rmiMV43BugMW8nBtWRy7uYqT7YIYBK
 1CvLhoUtMXeUYCcAV9M5P2hOSOMdiJMfESBswk8SGHV2SnOIBdvLZLsvNj/HpSHMc8tScGI8Og9
 8UqPKzCcl6WSjn4aVggMMOIZhhM5B+6Qps7pg/X0Kj7UkxWxJ3dz1oaby7dX/ggJyA87Dse8ZnT
 6CGS4lCU1kxEvPV3jesZJ7jgweVMIC4vYlvmJ41uA8B+cmOoBycjt9pS0sY7LdftnYwkkN2+9L+
 sQdUckr6/z4nvdnpRuSwJK2L9HcISS7ObyTTIt+yFrEA38VTP9CLbeg+deciPFgxx33X92l4i7t
 JpvcXY10SCwAVqMYc4rqtVvXHum+0Q==
X-Proofpoint-ORIG-GUID: l3n8SXPHhsLF5Aa10GrJIOlFerWf7MSz
X-Proofpoint-GUID: l3n8SXPHhsLF5Aa10GrJIOlFerWf7MSz
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a5907c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=obbvyrX-RHgrhnFnxo4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

A client (e.g., GST for encoder) can initiate streaming on the capture
port before the output port, causing the instance state to transition to
OUTPUT_STREAMING. When streaming is subsequently started on the output
port, the instance state advances to STREAMING, and the substate should
transition to LOAD_RESOURCES.

Previously, the code blocked the substate transition to LOAD_RESOURCES
if the instance state was OUTPUT_STREAMING. This update modifies the
logic to permit the substate transition to LOAD_RESOURCES when the
instance state is OUTPUT_STREAMING, thereby supporting this client
streaming sequence.

Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transitions")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 104e1687ad39dab93ff66450ba3a97c309b1e1e1..a21238d2818f9606871953bd0bee25382cca0474 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -122,7 +122,8 @@ static bool iris_inst_allow_sub_state(struct iris_inst *inst, enum iris_inst_sub
 		return false;
 	case IRIS_INST_OUTPUT_STREAMING:
 		if (sub_state & (IRIS_INST_SUB_DRC_LAST |
-			IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE))
+			IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE |
+			IRIS_INST_SUB_LOAD_RESOURCES))
 			return true;
 		return false;
 	case IRIS_INST_STREAMING:

-- 
2.34.1


