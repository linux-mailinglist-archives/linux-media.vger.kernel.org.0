Return-Path: <linux-media+bounces-32097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95D3AB0D83
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CA4B9E6916
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7055D27CB04;
	Fri,  9 May 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="esM2rxSf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733627511F;
	Fri,  9 May 2025 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780006; cv=none; b=lbmUQsu0ZXpHCHMLZs3o2WmQbP4gRhUz1D7+OU6w1p5AZZQilesh32XG65cAnXVqmenmSLlRtbsRVHTf5ToIx7JuJfTWJxOIxyCqW6LoBByWuTQXupJvVebE4P/kWEijuAOedsbortqAJ5iv2GAwiz1PCyIsefoWqO2rrbLMT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780006; c=relaxed/simple;
	bh=R4ue63lnfzbOqwmUOzjsJSunvNC6Jfb60CL0C24GyJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VapA3QYPYIH/bJ6xFOJwS16cvq2/Z06R5FrpKSVbXOHa63uJxuCTEQpsagTIOhlUhTJK0abqbyJWYiWTsU5FMXpQ9/X6UzmwvRAyNDHngzmMIZXBsNW1uhIH15s5aF+TOr+M/0OnNX+rq4cJ9AGuq15ATMKFfWDHPNIjnNM99oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=esM2rxSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493OCBE002336;
	Fri, 9 May 2025 08:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Wd71wyXEh1znB00vvVlvrBpI6CsJUsroupR6FF15jE=; b=esM2rxSffFw6JRYo
	REiQbBBFaDJMBeGRmBu7Alms1EO6IqgSa9t4/OQEM816qKIZYOTZsZZ6LMDhf7v8
	rr483ki7VUf+QgQHBmSllrecYqgm8KtJhOdt2dTSlUhc49MHx7oukH/xn1bnPm6V
	/OURgiVdbxNpYBcEDrqOeRrPD27luJWjK+UnUq1cY3E8EGg0CypEAPuLaJzkfYsz
	EPvsS/QVTS3t7ill4AKvfFPKXo8WTOFNdIeuN5SO1SnMbfVBEc2bqrttYWzAmlTn
	UqxLgfXnKXLXNrEXyKp4rWuU7PlTDI5+7iu2iss97iXnmfgIYtfLd81YV14DhqqF
	8C00Eg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5bxbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498dwSb021572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:58 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:54 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:58 +0530
Subject: [PATCH v5 12/26] media: iris: Track flush responses to prevent
 premature completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-12-59b4ff7d331c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=5485;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=R4ue63lnfzbOqwmUOzjsJSunvNC6Jfb60CL0C24GyJU=;
 b=r2BPIKFI0OpXZ7AuhYKPmOwa8Hj1OIHxEQwHUz06TMVoNy3xYbr6psx+Y4/dpjmA3CdduYy+i
 f1HMN/mxw/7BN+bkJkRnGv0cJm1DGlKJMee5qPFT7lHuG6Zw/1J5/Vr
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681dbf60 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=9N5asa1Zfmtpwkv7HToA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fnxuA0VRmgWa1azUqpZ_3bRhHWbH83gF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfXwf9NbnFqRr+p
 XDdwfvqSVVggcxRSff0rNJdBsY/H4L7r463GLSsMrlQDn0Ykh+uiviNyNOvrDWy6IK9sVM5at6f
 Z6SM0CSzYVMM7dTyMLl4i83u0ERuiztieABLZb7+zXG0xalWVVOaHdZq8ggLg5cGQDV3RQWYSaR
 IY8sjG+QA3ZLQEo5cSbdmMfALqv1MVgM8P/wcyB+NA3BRkdsq2xr0dYlMFmpGGZf4Qq+X++uEp6
 o8yeuzGgfZE+34mvNwlF0fMe5701RRoKlVbj6yztK9uTd09gtWpQwmi+3l5AFekE4D5dVNGc+ou
 5bjr+YSeT9D5kVRNzKciP+4hJG9EmQbYz8RALPQ4c7p6BwgYo+AGhZw4wqTp6t2EwyntqFF0+T1
 v88wRnL6TGH5IKasnL62tjE0Yt4rTLXlKo01/jqFXYEQFqp5rIyoPNzS0VIOT0vxpVe8MzA6
X-Proofpoint-ORIG-GUID: fnxuA0VRmgWa1azUqpZ_3bRhHWbH83gF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090083

Currently, two types of flush commands are queued to the firmware,
the first flush queued as part of sequence change, does not wait for a
response, while the second flush queued as part of stop, expects a
completion response before proceeding further.

Due to timing issue, the flush response corresponding to the first
command could arrive after the second flush is issued. This casuses the
driver to incorrectly assume that the second flush has completed,
leading to the premature signaling of flush_completion.

To address this, introduce a counter to track the number of pending
flush responses and signal flush completion only when all expected
responses are received.

Cc: stable@vger.kernel.org
Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../media/platform/qcom/iris/iris_hfi_gen1_command.c    |  4 +++-
 .../media/platform/qcom/iris/iris_hfi_gen1_response.c   | 17 +++++++++++------
 drivers/media/platform/qcom/iris/iris_instance.h        |  2 ++
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index ce855a20ce4bf4973686dd3a90bcb605065673f3..bd9d86220e611e2eb39c9e114bceceac757f4d7b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -208,8 +208,10 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 		flush_pkt.flush_type = flush_type;
 
 		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
-		if (!ret)
+		if (!ret) {
+			inst->flush_responses_pending++;
 			ret = iris_wait_for_session_response(inst, true);
+		}
 	}
 
 	return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index b72d503dd74018c9bce704aae557ccdce326da4c..271e1446922311e2be6b7b2f9b68e26fa14ead9c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -207,7 +207,8 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
 		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
 		flush_pkt.shdr.session_id = inst->session_id;
 		flush_pkt.flush_type = HFI_FLUSH_OUTPUT;
-		iris_hfi_queue_cmd_write(inst->core, &flush_pkt, flush_pkt.shdr.hdr.size);
+		if (!iris_hfi_queue_cmd_write(inst->core, &flush_pkt, flush_pkt.shdr.hdr.size))
+			inst->flush_responses_pending++;
 	}
 
 	iris_vdec_src_change(inst);
@@ -408,7 +409,9 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
 		flush_pkt.shdr.session_id = inst->session_id;
 		flush_pkt.flush_type = HFI_FLUSH_OUTPUT;
-		iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
+		if (!iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size))
+			inst->flush_responses_pending++;
+
 		iris_inst_sub_state_change_drain_last(inst);
 
 		return;
@@ -558,7 +561,6 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 	const struct iris_hfi_gen1_response_pkt_info *pkt_info;
 	struct device *dev = core->dev;
 	struct hfi_session_pkt *pkt;
-	struct completion *done;
 	struct iris_inst *inst;
 	bool found = false;
 	u32 i;
@@ -619,9 +621,12 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			if (shdr->error_type != HFI_ERR_NONE)
 				iris_inst_change_state(inst, IRIS_INST_ERROR);
 
-			done = pkt_info->pkt == HFI_MSG_SESSION_FLUSH ?
-				&inst->flush_completion : &inst->completion;
-			complete(done);
+			if (pkt_info->pkt == HFI_MSG_SESSION_FLUSH) {
+				if (!(--inst->flush_responses_pending))
+					complete(&inst->flush_completion);
+			} else {
+				complete(&inst->completion);
+			}
 		}
 		mutex_unlock(&inst->lock);
 
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index caa3c65070061b3a9a2facd5b7b297c9f11b07d9..06a7f1174ad55e8028096b103b1a2c66f49c3aa7 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -27,6 +27,7 @@
  * @crop: structure of crop info
  * @completion: structure of signal completions
  * @flush_completion: structure of signal completions for flush cmd
+ * @flush_responses_pending: counter to track number of pending flush responses
  * @fw_caps: array of supported instance firmware capabilities
  * @buffers: array of different iris buffers
  * @fw_min_count: minimnum count of buffers needed by fw
@@ -57,6 +58,7 @@ struct iris_inst {
 	struct iris_hfi_rect_desc	crop;
 	struct completion		completion;
 	struct completion		flush_completion;
+	u32				flush_responses_pending;
 	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
 	struct iris_buffers		buffers[BUF_TYPE_MAX];
 	u32				fw_min_count;

-- 
2.34.1


