Return-Path: <linux-media+bounces-40365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B19CB2D7C4
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 348881782AC
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F54C2DE1E0;
	Wed, 20 Aug 2025 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IrY8JQ9u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAFB2E7631;
	Wed, 20 Aug 2025 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680923; cv=none; b=eSqcx5YTB/JLwCSs0ickww537fpd5ii44dfTxQ2Ws19pDQs3lq0j8Ucme93b59CStE7m0ViDu2Pfrukfl4+FfB/MuZxZtn/e3ITdK3H2gZ+Mk73AcBC8FEQe2ods0Ud+hPyIHZX2XlX0Gz7NBfAaNou4ARvC9POgTkiCTaaC9lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680923; c=relaxed/simple;
	bh=gl2L6WMPdr5RmAe5mDR9125+fI9XFgJATRWZC151y30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YuzQUZVYZsSPBaE8adPMrmclsG/jwexomEw7Z+j117NKdYCwhLaCnGzWSKNJPart3lDs926ra17GiF5cLjOHiuBW15g/CQ8Z1Oz20nBi8kbCSTj0SyO6t8GVm0M9VA/ZfolQG9yhMePoFop9Ni0ulAZfOxRu2G82ZtSLSXfApkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IrY8JQ9u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ocS7025141;
	Wed, 20 Aug 2025 09:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	23IhVaHhMSDAxZO8a1GF9OHiYRWiIj0Q5i4jHSAMXhk=; b=IrY8JQ9upqz88302
	dTVqdLDzNzNQJL+kHo9GhpuH2+O3fPJbqgirTXsoptSzIKABdVAPDzO5KBc++KDy
	d5LZ1wZK+8WADnL7C0lr8UepEa29j4ALmtACd+KAAhS7uLRbsfL1IqiIwGsf1SnG
	6VKHAnIikLMiAFqbfFM2+adulD1bo8tpunMsleWFTXjAXS//ixI+iVWA9tnz9d1V
	MaORBHpcpmhM8Jyv8ffQbm9Lzi/S9NYdEflEwbK0/5ETbzWxeByBTJ3yGZovQ+aj
	OBnPif71ExzYnPxvXtdM8YIwnbksLhwz/w3/aQrpqgD4QvgtLiwhRaaTuFKEHX+z
	QydN4A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a94v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98YrW022422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:34 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:30 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:49 +0530
Subject: [PATCH v3 11/26] media: iris: Fix missing LAST flag handling
 during drain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-11-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=3463;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=gl2L6WMPdr5RmAe5mDR9125+fI9XFgJATRWZC151y30=;
 b=Oum1ZZI/AgbN8SaUDDEaEOf1UongzBB25p7YBOBZu95hR9uKjh3T6rtkpk/tlOW0iC8wAYiaH
 RRo5TPDsUBrBwP+caJwOjYCMgupXQgoHWybIpwkDlK5uXUpTtE4irR/
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 24a3IWUDekBQhivGSNVAqd3Q1GokqOGF
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a59093 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=0wdjZXPW0me86wH4VXQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 24a3IWUDekBQhivGSNVAqd3Q1GokqOGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6egVvofR9C+1
 DX33Aex2u3IrHTxdXpf6rZc/pIKplsXPSxE7H4WifWEgaB6hdMi+tMSd0tgiVBMsk6aF8JNhvLJ
 W2cDzG6JdiFdKNV4K//76mIUXysjZbu5x12xTsuebKXdOz8Qv3bKskysZw01kFGuM3O6HuxKrYM
 e14yDpiFel1fO1AL1Bv0qyqXpgdSHWTObTVSWa6josKcPEqn3Q6SdcFupM0hueil4EAfdDS83g9
 euIndSpMNYZkdFQWecFIxK4hRJs2ZMAZP7DXZXH6BfFPtQorUrOi8g0sAWzOXCm2+xaYRzmN0fm
 q7jlefM1qWpp87qhI+wD2Yp51nDBGsOwI5ulGDSyW/Xrsxc+pOZGAuhGB5OazInfmwrbAiiqj5g
 YxpPEGF26RCefb88+9i9xh/W6b4l6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Improve drain handling by ensuring the LAST flag is attached to final
capture buffer when drain response is received from the firmware.

Previously, the driver failed to attach the V4L2_BUF_FLAG_LAST flag when
a drain response was received from the firmware, relying on userspace to
mark the next queued buffer as LAST. This update fixes the issue by
checking the pending drain status, attaching the LAST flag to the
capture buffer received from the firmware (with EOS attached), and
returning it to the V4L2 layer correctly.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 +---
 drivers/media/platform/qcom/iris/iris_state.c             | 2 +-
 drivers/media/platform/qcom/iris/iris_state.h             | 1 +
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 8d1ce8a19a45ebb2b29457e0fef7d72c1c0d9785..2a96458833835422d30c9386d15cc1e4fb226e3d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -416,8 +416,6 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 			inst->flush_responses_pending++;
 
 		iris_inst_sub_state_change_drain_last(inst);
-
-		return;
 	}
 
 	if (iris_split_mode_enabled(inst) && pkt->stream_id == 0) {
@@ -462,7 +460,7 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 		timestamp_us = (timestamp_us << 32) | timestamp_lo;
 	} else {
 		if (pkt->stream_id == 1 && !inst->last_buffer_dequeued) {
-			if (iris_drc_pending(inst)) {
+			if (iris_drc_pending(inst) || iris_drain_pending(inst)) {
 				flags |= V4L2_BUF_FLAG_LAST;
 				inst->last_buffer_dequeued = true;
 			}
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index a21238d2818f9606871953bd0bee25382cca0474..d1dc1a863da0b0b1af60974e9ed2ef68ea225cdd 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -252,7 +252,7 @@ bool iris_drc_pending(struct iris_inst *inst)
 		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
 }
 
-static inline bool iris_drain_pending(struct iris_inst *inst)
+bool iris_drain_pending(struct iris_inst *inst)
 {
 	return inst->sub_state & IRIS_INST_SUB_DRAIN &&
 		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index e718386dbe0402417f408d8fc696a33e5c7f23b3..b09fa54cf17eeee0c9ae254588964ad959c82c80 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -141,5 +141,6 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
 bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
 bool iris_drc_pending(struct iris_inst *inst);
+bool iris_drain_pending(struct iris_inst *inst);
 
 #endif

-- 
2.34.1


