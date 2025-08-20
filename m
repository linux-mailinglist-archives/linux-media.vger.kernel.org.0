Return-Path: <linux-media+bounces-40363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA93B2D7D4
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 731631C443A8
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949CA2E612C;
	Wed, 20 Aug 2025 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ce6ty4y6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621C2DCF65;
	Wed, 20 Aug 2025 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680916; cv=none; b=a7pyzWW6It2G1X+eGfs2ZMqyJTwaLi/opyNDccLfkVSY87RBrt5j8Ss5k7tefKJYvZT8oR6k+x3w2XrAiuhkASeSBpTCyQBV/98ymUsErKMVxS77Kdwfj/5F3ycVyp6JhlKDgywwnBBIktRBGRDNtutaYM3UHloJXnsdew9zSqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680916; c=relaxed/simple;
	bh=Cg5n6HpFqJccXAnC5bkkpT8HZsnBFo9IB1vQALP6o+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lsLhdwD7QHOt/b5RLt4UcsD1qbm6wzC2mse+b94JILEpFPjfT8IVHOalHvwaYYqONc/Vn/zVOdZfGpgV+nkeo+ip2F5b8mnNN00vXJcGqIzNecOGlEzbr18Il8QT8sfON//qbUGSbYZx1TzVfz59HdVqMb6tjk4kEI58u3wk4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ce6ty4y6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oXdh002009;
	Wed, 20 Aug 2025 09:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+5F0/9U+F2ASpSkhZx7Cy5WwayQQ7P5EXLdBEakCYM=; b=Ce6ty4y69Z6OKkOd
	xGpGeYq0iZ0iWAk1kE24sv2hAXz9dlQnXnrRv/oqX61Bw37gD5O/3VOL6jAcSSrP
	sawvYf7Y/ie/faEf1T3OX+aoXASJKmzpyZTXyp9OrB7ic1A/JHcSu8mjhsaG5IBq
	lbaNHXXNbLIrRZmA/4575zYhTBj4nPyBpJug80zGdeIbVsIni3IFpvGzn2yAacIc
	6m7JAGIdEBEt3hPEFiy/DcO5kbQnxUNl776V1b52ouUGNHAB3+qieCxv7LaDhp94
	VpCf+fRLunHssLB0yUWq4cpuBkXxlLtM0jsRrjkIDRyruXGQcigTIf7GAmRu7axn
	ID5xiQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528s3n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98Q1f022251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:26 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:22 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:47 +0530
Subject: [PATCH v3 09/26] media: iris: Allow stop on firmware only if start
 was issued.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-9-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=1501;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Cg5n6HpFqJccXAnC5bkkpT8HZsnBFo9IB1vQALP6o+E=;
 b=rSazdkjAHA0Xy50wn5FAMe4dUkjt84hmLc6gHeXPJzRfmOqM8FeCPczfm5sj0+KmJlUzwqKXR
 UxFPvQ8E4EGDqb3qqfjb11egkPuZqfagD03KVDXglP4SGhuvF3NanRd
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a5908b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=qy3FSly7IIgnPcZaVksA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Cjg6hATUp3YxirQXY2lfjfrgpeJa2PuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXw3UWnog4v8J3
 mEQuTVxkHiTCDByE5eyMJgLLfmMsu1xZKSrL185ittQnGHVH42qRNlIh0uJCMoDDgjZD2YJVQaL
 +9E3yZGKD8hii5f98g8kxmVpQRizvcF0gZznsncGGDj8+47wyL9I7w5G3hCTk/EXHQ3ZwynKPad
 ddu2MwYhSk3KMAPLhMnD2Ngry4sUXQTovcpL+qIXCu739CptR5QbIV1+Oavx11hPVHwg/dFllfE
 IHKCOvAq6vPXDtElFPm2RPTPV+BxtY3NSmE3fci52fWJt42o+/K6NIIlh2oxZiZgBqy2w5u9IQ4
 LVNeV4wDXglgbhYF2k8Qvkm6XambZwqdDtscKE9bd5IdarEkNRscCnMlw37YvUu1K5Ubv7zuPAo
 qJrSVDI91SFKZ22iAb6TQq7mPUJQMA==
X-Proofpoint-ORIG-GUID: Cjg6hATUp3YxirQXY2lfjfrgpeJa2PuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

For HFI Gen1, the instances substate is changed to LOAD_RESOURCES only
when a START command is issues to the firmware. If STOP is called
without a prior START, the firmware may reject the command and throw
some erros.
Handle this by adding a substate check before issuing STOP command to
the firmware.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 3e41c8cb620ebe51636a4cc5202909bb043ed4ab..a3461ccf170ab1abb3a9ce70c4d93415773b2772 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -202,7 +202,7 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 			inst->flush_responses_pending++;
 			ret = iris_wait_for_session_response(inst, true);
 		}
-	} else {
+	} else if (inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
 		reinit_completion(&inst->completion);
 		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
 		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);

-- 
2.34.1


