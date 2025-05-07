Return-Path: <linux-media+bounces-31906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBED1AAD88F
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B2D5012DD
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7838F22069A;
	Wed,  7 May 2025 07:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IGJTIzb1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F0D22129E;
	Wed,  7 May 2025 07:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603674; cv=none; b=UsF1bRkWPo3PO/LYRB1/UgfazdmL22eqwJsz90dVvbETZdU1GqHM9O0KrvuSwlUNN+vK6GW8nosNJd1l8eEW5GkudDv9M29auqdlVqpibatC+MtqbyrK/lea9iKCtsGWobMuTan3mYXOk0IMxV8/hkYFFTEg6EIn4DrUtcXdBZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603674; c=relaxed/simple;
	bh=PEbkT9PS7RAyXHIjuYDaz28m84DD1DKyQUe8XXxB6uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZWamdjQMmm5s8PwUJlOmcoRsixJ5KSLv9KvwzG/uEZE79dVxMRGWJSTK5iHHHO+W92ybJ8VIsp4mPTYT+XOhuDqQvMqXCop+xgCErv+c+3acav2hWRs4hU1leCEoemF9d9xh2ZWHDhZkM7acblvqIgRibtvB04MDav5n3dwSrEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IGJTIzb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GlH0015210;
	Wed, 7 May 2025 07:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a+98LMd58sR9+Dg6dxNaQ2Y2NNK+d4aHkZ1pzrfUg/4=; b=IGJTIzb10We0eqlQ
	Z5gMcTw5PcxYtWx39YomjfX9NEf0di2AENJG2itu8kN+qKqTX8MFMK9uvvknnlfM
	fgfaPbe0Xg8dxetuzshB/VQiabrfFwqNgCW7FGlndhbAAgduoai40nD2XkCyzhNm
	ytLro1IU7V1VlAPxLiwNWoAlq6WGgvdUDCbqVyRbuxej+s3nPXHesu8a24DOzKO/
	u145d2PZrm3xVRSLAQXViqoPTQpY3ZV4rGApCaru5F8pWL0p2cxm3uvm57AT+K1z
	cyuQQ6HaPGCkXpW19CSzlVSRFpcaUAxop8qFq+N+hx6O3aAm3Z0CXM/sjpbzFZCz
	GvNcPw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u44wdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:41:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477f69x000532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:41:06 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:41:02 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:42 +0530
Subject: [PATCH v4 11/25] media: iris: Track flush responses to prevent
 premature completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-11-58db3660ac61@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=5201;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=PEbkT9PS7RAyXHIjuYDaz28m84DD1DKyQUe8XXxB6uA=;
 b=tKHEyH6MyYt2/OxfkBeLO97R47Os/MxVwiHDNLD9WNJEi6OSBL3ReG+LFVph2HOaFavDfE5Sk
 1FPelhswvO4A8frQFFH9id/Fg8onVoWMHeLWuOqkKL4QKhLZb+Farkt
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681b0e93 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=9N5asa1Zfmtpwkv7HToA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -eg-kYGXSimmit7_2ukZhXy8X3U0QV-G
X-Proofpoint-ORIG-GUID: -eg-kYGXSimmit7_2ukZhXy8X3U0QV-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX7zEuRsUJGsAG
 jJ23KpkfBG3RrYs8gMT3rKlggF/GfI6rehOZDsFdMvPV6+GEYf2D2v690VAJuAO4VL64KuVlF2/
 lMdiFH1bPNo+yywajJZ+Ak5NL+6aP1l+AJYLFHFC2NnWyYD45OiJWW+aBQOV09r7aqWdNbUq6dF
 DLz4g/LVl3kHJIRaqWivSYAad4jObxDEMFoUKaKqWfL6E0MTQYyEXromhO01o5fZRW7J5NGnFfe
 SQt89YbFHe/HxCD1Hx911GfeROnwtClOA7rGUXLAJul+IUA+tn3gWfTpxfdjdj39KQ83xS6PxYp
 5oGufRddiec8MBMGuqPgopMOjfmSKy2oLDfMA648lxROtyx3LNxvkYLBSbBaxngPugkCNom3tGg
 Iisk9StuUunKpNJXYkK7nWST4/1dkF6+qjetv0WD21o+nAc5B26s76Ds50NgEg4hLvpt2ld1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

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


