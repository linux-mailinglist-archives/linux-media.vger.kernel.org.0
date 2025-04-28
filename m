Return-Path: <linux-media+bounces-31171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC3A9ECE0
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CB67174EF9
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C9A274FEF;
	Mon, 28 Apr 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i79z2gN7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2CC2627EA;
	Mon, 28 Apr 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832690; cv=none; b=WDl4KNbp0dJiYwbrTjnEwk6uP9D5rNGJE7vP5PIa6PKloLj6qHXlFY3e53ZmUaYGVOtKKeuZ/cCwuyQdcl6MxCsRWuyKzrQHttCuQxMgxyHY4eJCYlh2GBdyXEuzjllVQzyFATtXQ+qjStXU77wWHIA031L5fp9sDTJTWY+/i6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832690; c=relaxed/simple;
	bh=0PkXhM41Mpn3kYfoTJlk+dKG1IPKjqbdFiPaQdAo5Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eXDiDyLh9PFq3kU+U+q1TmsrquoOIJoqqR7gwdixpPuCLdbIMnvfWNIUb3bdKTQW0FjKqXAI6hKpa4OSZPauM0WHCbsTI3Ru0d84tAmH/AKukXbNzvyf5l7Cma/yZmYBiuDJgT09bgSg2cnIMewVsAa5aSBb9+Ub2+EXWjvDknU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i79z2gN7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S7hQBW009760;
	Mon, 28 Apr 2025 09:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RcRiW1feEKEdNjXqQGm7uUWUXdt4S1nI3kzYuSUcPD4=; b=i79z2gN7sx70+/ZU
	QemHc8O9vEFIjJgzIzdkc8jZ6nhcQDHsFO9Wi7O92UzrZi7834dnNzOBQ8dSi/w4
	CPYtbf7+DeSk2lK4y1pL2aKgQVPYIyYYpQ5rAOBAbOocxWJ4/vQUuwz+eQo4ptrP
	AWtGR4Dx6nKu54eiMFqwh5ZQiKqcQB6z/Lc2O6j0yqO89NYfAJFBUwmImtP7zo2N
	OoGrV7Clp5rYqXl730Qv7kPC4/CC6FaWBj3A3Idpb1zQo1qmiIKAlXVEclryG19E
	fYFvqiQ9ZL/5KUJh9IOnm90G1AVp4d381sKtVb06NacKXIlxSLYDafnq+idvpe4N
	XU7+Sg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jfsgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9VNIk030887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:23 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:31:17 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:59:05 +0530
Subject: [PATCH v2 17/23] media: iris: Track flush responses to prevent
 premature completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-17-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=4978;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=0PkXhM41Mpn3kYfoTJlk+dKG1IPKjqbdFiPaQdAo5Bw=;
 b=RHngh8n9xsW0OVeJ37XVrz64A5uJ6ydd/quE/9gwophgq4hTjRefRfuNFYkZmJhzPQSgOl2S2
 uKxrTE2Y8ZKDxVMyhL/yYh9MhrfyxjVsZEcZNdxfnBBeH8X/tAntzKR
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX9/9FNriZNaa8 k/FqHf4+OalxgYFj7HHpGruztxOgac1/NF0v0TCzfNNwkKOgKTqcTa5GllJpw6BnXsh9z0erhXz OJogeIZ1J1fmWmgyLVptTcpopl4Dimigf8V7XkCxQtUanOwhF4O0HURhhLCbLwHhCOf8Qzx7F6O
 a3nJzyCvrMcqeePyLhxyphXaCigoqCky7+DsuUk2J/1DJzWUptxRIBGA5FnYkcaYlfHpRBgwsvW +cr96K1akihh6eXay3kKWZI3xlvN5tjeGNbIoJW34lb3MVG66Bzu91ddAdcv7kAswcipUPSTcJC FxvqPeMuHiYpTsVf7c0Vz56HnlDe3vZDA4rSokoQwesJD16lOPkVPAlM9VdpccNm/m2UUElZudl
 wGnpNai6alzOEoKS/aHSEGpGYb7sekUOt00YeYMGNVRsGnEO+6Geu4tc3EiOqmqLX6Vy0PPJ
X-Proofpoint-GUID: bQnadig9BCdtF6fMG-Hb2RW9v82Xv5Pw
X-Proofpoint-ORIG-GUID: bQnadig9BCdtF6fMG-Hb2RW9v82Xv5Pw
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680f4aec cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LJxFFEd629w47lnb3LgA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

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
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../media/platform/qcom/iris/iris_hfi_gen1_command.c    |  4 +++-
 .../media/platform/qcom/iris/iris_hfi_gen1_response.c   | 17 +++++++++++------
 drivers/media/platform/qcom/iris/iris_instance.h        |  2 ++
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index f9f3e2d2ce29..ef3ca676d2ea 100644
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
index dfca45d85759..01338baf3788 100644
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
@@ -570,7 +573,6 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 	const struct iris_hfi_gen1_response_pkt_info *pkt_info;
 	struct device *dev = core->dev;
 	struct hfi_session_pkt *pkt;
-	struct completion *done;
 	struct iris_inst *inst;
 	bool found = false;
 	u32 i;
@@ -631,9 +633,12 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			if (shdr->error_type != HFI_ERR_NONE)
 				iris_inst_change_state(inst, IRIS_INST_ERROR);
 
-			done = pkt_info->pkt == HFI_MSG_SESSION_FLUSH ?
-				&inst->flush_completion : &inst->completion;
-			complete(done);
+			if (pkt_info->pkt == HFI_MSG_SESSION_FLUSH) {
+				if (--inst->flush_responses_pending <= 0)
+					complete(&inst->flush_completion);
+			} else {
+				complete(&inst->completion);
+			}
 		}
 		mutex_unlock(&inst->lock);
 
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 5150237f0020..9ed197799ee7 100644
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
@@ -59,6 +60,7 @@ struct iris_inst {
 	struct iris_hfi_rect_desc	crop;
 	struct completion		completion;
 	struct completion		flush_completion;
+	u32				flush_responses_pending;
 	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
 	struct iris_buffers		buffers[BUF_TYPE_MAX];
 	u32				fw_min_count;

-- 
2.34.1


