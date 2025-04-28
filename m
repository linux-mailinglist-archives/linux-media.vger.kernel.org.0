Return-Path: <linux-media+bounces-31177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C00BA9ED02
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B04101770C4
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CD628DF1C;
	Mon, 28 Apr 2025 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q+RzsIPr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD51227585C;
	Mon, 28 Apr 2025 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832737; cv=none; b=uC3dGbAMJPgx8jp7hFMh4RpJvBkFKsSo3nJPw54MVMNJ1bJNYwcRC8CtN01iSFg3PiXIZIAd4uce/MUuQPXGWhqfSLw3InPdTyk7v4cUhcqzDLgtHqGGOYfoUEK9XpH1Duiui1wufpbfBWja/WgYuJBNcoN1ukKoD75IvT/QiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832737; c=relaxed/simple;
	bh=J38rTbd2oPdA2zwweI3yMdVHHvcm1LLZilo7yGHUJio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OQHtMh3VIwEhOeZ1lPt52zooz5f5Eqe+iNRZVbIMxrezPHG0J9uiaofL609DqqAUIsNJ6OPFZoZl3GC0G+IPKZcxlcY/syAcfwut5sNKQgFjrucC66resLSGAwmSr5c0wBbmRPImcVyaLl8AD6zS1GcUosdaeoEVNb2QmgurMpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q+RzsIPr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6bTVG023077;
	Mon, 28 Apr 2025 09:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pyoBtweLPq0Jn2zQ9WkGiu35jzbCDsuC6pYTBtMQBIA=; b=Q+RzsIPrZ9Y/TEra
	e3Epgm2ehyvnfaLiGPUfZDg6j/+0XFXM7zASZkuw1ixEj4143rxbKO9SVmvA/W1p
	BuTv2kGPi3qoVkQZyBdLvx/zZkims9UzfMWZeDao2bHAznX7NxoVP5NF1mcA8KSo
	trJMvNOvlO66FbmtnfH3im/0lMD1yi9Eep75NyokCyogn42k3UzO6FgubIzbm/OG
	DkDEyzPTVmFFM5k+U7xQC5sN5Cco4rAJO5qEr/DDYfgobnrU4PmxEs9Blcl7NhrH
	Nfs47d0D37NtPovI67sk2bS0SC+P2AqhkEdbyU9LQ2gFtrKipRKNDsZOYNkkGq0r
	ZbjcLA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb7g2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:32:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9W0v7024599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:32:00 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:31:54 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:59:11 +0530
Subject: [PATCH v2 23/23] media: iris: Add codec specific check for VP9
 decoder drain handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-23-3a6013ecb8a5@quicinc.com>
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=2082;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=J38rTbd2oPdA2zwweI3yMdVHHvcm1LLZilo7yGHUJio=;
 b=B1IdNBKfRDtSa4521NI7wE/+LsOt52H4MDjgKAp27ZATHbEnlvd9QxixQ9wljX3GaXNqngFoe
 hJW3GXlY0g7CaHNzUFYRlIA67g3LkyRubBZVxk1Oct7ubzfqJtSqIct
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX8KwT0Q85mmVL pnnswm66LgSbkfP5xIFRhY7StgngFkY29b+UkX7uDtQwks+8IlhG9nVyj67OlI22hZolrQNs+wH f0uQCx9nglxEA6lNLFwIngqVcy/jQy9HlPH+pNJmbXnu9kLhVj2li5b4cLVyiDr7OAX0xAfRdAt
 h5KJY6RGMsI8uHmuEleuz594dgcezN813W4+Ma7uUl/+ImeXezVpdUdPckb6kT1BIfCvdX23423 hwCNPh3j0uCK6kItoRse6j/lchRAICMB7lwF8uOVjy0S2pzd9CEpAjqbXFwnskBTJmyKSGAxEJw qunEqd663fivPPVExsdYJY9ZNuNVDZ8OSZ2t/WL7FtI1zMXe7QF8LadsoOBi+pEskBTOr9Ow58x
 k/tojEHzbKSuIDoxdd6N5wLPRYJ6DFVsKkE4Ko+LSXeCKXdB2jLLzm3mxL/Yth7NGICFHYGU
X-Proofpoint-GUID: N43o2Hzu7VM9yQDkb2zqhSO5CNlYtvbv
X-Proofpoint-ORIG-GUID: N43o2Hzu7VM9yQDkb2zqhSO5CNlYtvbv
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680f4b1a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=uk1rlkFWm520LKNewhEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Add a codec specific for the VP9 decoder to ensure that a non-null
buffer is sent to the firmware during drain. The firmware enforces a
check for VP9 decoder that the number of buffers queued and dequeued on
the output plane should match. When a null buffer is sent, the firmware
does not return a response for it, leading to a count mismatch and an
assertion failure from the firmware.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  | 2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 837643741dc3..bc63189fc43c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -401,6 +401,8 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
 	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
 	ip_pkt.shdr.session_id = inst->session_id;
 	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
+	if (inst->codec == V4L2_PIX_FMT_VP9)
+		ip_pkt.packet_buffer = 0xdeadb000;
 
 	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 01338baf3788..d39226efb3d9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -349,6 +349,10 @@ static void iris_hfi_gen1_session_etb_done(struct iris_inst *inst, void *packet)
 	struct iris_buffer *buf = NULL;
 	bool found = false;
 
+	/* EOS buffer sent via drain won't be in v4l2 buffer list */
+	if (pkt->packet_buffer == 0xdeadb000)
+		return;
+
 	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, m2m_buffer, n) {
 		buf = to_iris_buffer(&m2m_buffer->vb);
 		if (buf->index == pkt->input_tag) {

-- 
2.34.1


