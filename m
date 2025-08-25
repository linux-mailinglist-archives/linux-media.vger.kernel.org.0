Return-Path: <linux-media+bounces-40881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E725AB3372A
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8802E20202A
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90F629AAFA;
	Mon, 25 Aug 2025 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iBXhS4DC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8476288C89;
	Mon, 25 Aug 2025 07:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105302; cv=none; b=PSqq1SCPIMy0VunkbYu6WJFT8NHnCchhdqLreQE/g4okvbttlo8ar2LoFuH/5miCRrLc7ePl0vfZ4hLIOLmIhF+gzu3b4iGjNjIakRrrHHN7kkWwt6cXkxMFMhQcK01WfLX63GTWH1cMpoTb0LW/x9zWKCPD31ZK7TP5oplPIXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105302; c=relaxed/simple;
	bh=V36BXGglAklwmS4u0yaFYqaC8pi6PycSrjmx7WZn930=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k6KcwUQ91fwBMPoYE+UzkwGhObnVGG1fWZaohsbsg/wvQnCj4YQ816Ux1c5RjnZb8LsBVjx59R0EPcf5mIISsDeC2h8NyERu1PAnnAY6n2mr3q6k1Jpn1cE4MdAlVEDm+MtY1/nrKC/P689dEKFC1EQ9zXIV4qQgJWvOtDTJkgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iBXhS4DC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P0EFG7009151;
	Mon, 25 Aug 2025 07:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i09yrM0LAXVY30lMfttvmoIDcbGI4wSID/Zip3Zhypk=; b=iBXhS4DC6iB6wUVk
	AEMbum1AhfsxY2/eqHeMAF+YvvcWfsBe7UEGuCQwv/vVu7D7x3uKRfRVDIFm5Tbb
	w2oWdxR59LOqRUbsxj24LmdkY8T+tKol1oPy/FhsT/j4HNYLNfn4KQ9EoB7eTTA9
	dirCL/9Sj6f0sJi/C0GC4Kp/q3Eb3mq0ySr08Lc81Hf56hsLSBbRMLV4AB4jWeSm
	vEj8uzYCqIiiVslWu9TPTFw6xs/c4Hep0x9vJlBHt7letvOeno3wm390jN2cx6D0
	UxDg/1blWpWUUzP8TaR95D2tmN6EVNV1wIrbDpqZCLjcQKqmo5v9nT+92w5uBdEo
	SGzfnw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfc400-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P71FBT003914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:15 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:01:11 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:32 +0530
Subject: [PATCH v4 08/26] media: iris: Simplify session stop logic by
 relying on vb2 checks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-8-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
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
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=3350;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=V36BXGglAklwmS4u0yaFYqaC8pi6PycSrjmx7WZn930=;
 b=bYg3OdFQryBKjXMTvoW+ZgMc70PWS1Oe6GlLlJvbVp3oYSGNq9mjiBRWek8mRQbhyIISTb9qP
 I3Pp3ClyqGnAYjvt82+EMpl++Bq5yCVMMEmDCos1wdfzQovXz7p/lnf
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4Qs7MQhww3uc
 aKVmDQTtWGLYXgy8Fr3NJLH9b+R0ko+Q4bS5YRKx+PIUG0xA6o0Z9uYEwIKjUM0VmJYUgxl22hI
 hMS7oWE46Y0VwfzSCdLfPGebW/VSI+9anYWdBJdhLbmWCU8pz6z5hRsuj7T0Hm4lAyebtM5othv
 LEzCJ+VLlzNanO5c5o7RjtMAwe3YjT0fqkeRZm655hri+Nmwg3+gtYEjDXiVuCJMu8oSTp3FGIM
 yQ4L506lxZmqWbRL4spCg5SGY5vCgg8GLXyWRSj1klhuL1UyozLBprfv9Y1tC6pWwqJwrgXxqfb
 u5DNBLrosu/SylkynfMg1JlMIxna8+P8lU3UK8V+dDZREF8UMr+fKiIkLGM2McV80HL/QBKJP75
 p7cld2jP
X-Proofpoint-GUID: AwelVAliyYaAZiwf8_WYnPRkXNloiRs_
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac0a3c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=IcaLs1R6myz3_H0jQrwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AwelVAliyYaAZiwf8_WYnPRkXNloiRs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Remove earlier complex conditional checks in the non-streaming path that
attempted to verify if stop was called on a plane that was previously
started. These explicit checks are redundant, as vb2 already ensures
that stop is only called on ports that have been started, maintaining
correct buffer state management.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 42 ++++++++++------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5fc30d54af4dc34616cfd08813940aa0b7044a20..3e41c8cb620ebe51636a4cc5202909bb043ed4ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -184,11 +184,25 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 	u32 flush_type = 0;
 	int ret = 0;
 
-	if ((V4L2_TYPE_IS_OUTPUT(plane) &&
-	     inst->state == IRIS_INST_INPUT_STREAMING) ||
-	    (V4L2_TYPE_IS_CAPTURE(plane) &&
-	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
-	    inst->state == IRIS_INST_ERROR) {
+	if (inst->state == IRIS_INST_STREAMING) {
+		if (V4L2_TYPE_IS_OUTPUT(plane))
+			flush_type = HFI_FLUSH_ALL;
+		else if (V4L2_TYPE_IS_CAPTURE(plane))
+			flush_type = HFI_FLUSH_OUTPUT;
+
+		reinit_completion(&inst->flush_completion);
+
+		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
+		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
+		flush_pkt.shdr.session_id = inst->session_id;
+		flush_pkt.flush_type = flush_type;
+
+		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
+		if (!ret) {
+			inst->flush_responses_pending++;
+			ret = iris_wait_for_session_response(inst, true);
+		}
+	} else {
 		reinit_completion(&inst->completion);
 		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
 		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
@@ -207,24 +221,6 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 					 VB2_BUF_STATE_ERROR);
 		iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
 					 VB2_BUF_STATE_ERROR);
-	} else if (inst->state == IRIS_INST_STREAMING) {
-		if (V4L2_TYPE_IS_OUTPUT(plane))
-			flush_type = HFI_FLUSH_ALL;
-		else if (V4L2_TYPE_IS_CAPTURE(plane))
-			flush_type = HFI_FLUSH_OUTPUT;
-
-		reinit_completion(&inst->flush_completion);
-
-		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
-		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
-		flush_pkt.shdr.session_id = inst->session_id;
-		flush_pkt.flush_type = flush_type;
-
-		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
-		if (!ret) {
-			inst->flush_responses_pending++;
-			ret = iris_wait_for_session_response(inst, true);
-		}
 	}
 
 	return ret;

-- 
2.34.1


