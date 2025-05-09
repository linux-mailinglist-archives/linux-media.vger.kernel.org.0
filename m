Return-Path: <linux-media+bounces-32111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D8AB0DA6
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E5E8163E27
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5522D28A1CD;
	Fri,  9 May 2025 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ItZFsGlE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325642749EC;
	Fri,  9 May 2025 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780067; cv=none; b=Cr8IboUFTi7wwIWUQKm8UBEmSwy717+g+eZ9zKHu4agZt3mkd9izF9SGP/FFuqyhtMuFf7S6p/qgz+ECo6DA40Xg3sgCzUXyHuLRy2SQx7ygh5WFAhc7Q53L9LQSdfobgGmggf711NDTTGp0/fV0IlE8OcZhPUdpCVup3HD1+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780067; c=relaxed/simple;
	bh=KDfEb/HZuUaoViO/SHMf9/ivmckjV0E1VEkxLLWHnX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lrPQlv4ljWapUXekvHcGp0zaWJtPi4fDnqonYwcqhKXVOl8THRAhmTu4SLZfXrOwhhcR1GsPo9i4sE0ewtPrzeUf5ckjamCLkbXbQPKp7cvLeh9GTLJqRlyzLgf9IUNm84YLieyt48XLmSvd0JtP8WBex7L9qWuC+xF9bxCIdJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ItZFsGlE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492muee022870;
	Fri, 9 May 2025 08:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LKB2PogFE7AwyTJl2H604jqHUlx1YZbKcoZ03GXztaI=; b=ItZFsGlEGSHchDy1
	ID70nkHxIObu1YAlEXtNxNlvZWpH6otnaVfiG85RGxEWctrIBuqkEdZRW9P+euWh
	eaQkwA83pCG+H9JioEM/NDzaEjgZrnLyFCdKnop1496YMm7NJI1aJ8UZXyeOo2NB
	AGa0ps/EfnGMZRWfc7gY1sSpaI3/O5KMhxAVWNUoqPsxUhFiKi41F2SGimi8Unga
	XAeC84j5UxNXWA7Fj5P9PeNlXjC1z79GExhddIZYsdL1CSAst4K9lFuCqA/i7jK7
	sLXjOVM+nlYeMJ/eeCyiFzGAYB0RIYJgjH+8L0w3sr4LXg54iFD/VpfzjUj+7TsC
	bb4X/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp840n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:41:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498f07m023895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:41:00 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:56 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:12 +0530
Subject: [PATCH v5 26/26] media: iris: Add codec specific check for VP9
 decoder drain handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-26-59b4ff7d331c@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=2532;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=KDfEb/HZuUaoViO/SHMf9/ivmckjV0E1VEkxLLWHnX0=;
 b=MQX2uLJkjpHZ5UISr47M5XuD8hu00RUDSvroHu5Oyhn0XyWf5U82GqJ43h2o1iyMey/EoJGv3
 tYlJU9ikmzRB9vaYWHC61QFZ6U9UxHVdj5IqJP8zha+iyY6qv3fRkgb
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681dbf9d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=4-NhuqtsghaPV3yzw-AA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: D3E5YUHHfvrqr8Y3rA_7UToAwAFdOLqo
X-Proofpoint-GUID: D3E5YUHHfvrqr8Y3rA_7UToAwAFdOLqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfXxP1Mak2U66Tx
 xKzL003jDrzc0GvX86xYKvcfGOjUMFT0LnlKP3ZvlzXAYG2E/zUkG2jWtczUgqESXeVKMBFHnCI
 athU/Xj2JQ6u8SuytTT2/94NZ+DwGIkRy5IxPPcujpjTcYSDAUInXeWh4EccJEVkq5sfD6YEN37
 p61N+7dShkbcwo15CRMiEpDBYSkNu0vVzWM4e6JlQLGAxhDYI2QwNowRrEQYgWt+kxXdwN+SXJS
 YqIqq+NuM28/o/LYTQcTIX6665DlVc5xbykO8DogD2JR8YTPJeTVmd3WyNonkfw5ulp4nDv2L5w
 rM6Ms6O8qc2ad/aXov0MJLqYhQjAmZM/oTaexyqcFzwxl/ltN/bCsNcPDQzeIUxeI5Tv5J/Xq0d
 TYLxQyShsWbFdw1m7JtJzgy9wzhoDCglx0TiskVHd9OvvF+9CCFmQMyUEjPKv5OcDCbhGQKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090083

Add a codec specific for the VP9 decoder to ensure that a non-null
buffer is sent to the firmware during drain. The firmware enforces a
check for VP9 decoder that the number of buffers queued and dequeued on
the output plane should match. When a null buffer is sent, the firmware
does not return a response for it, leading to a count mismatch and an
assertion failure from the firmware.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  | 2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 2e3f5a6b2ff11f273aecc4bae28399c260229af0..5fc30d54af4dc34616cfd08813940aa0b7044a20 100644
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
index 926acee1f48cc4fa8a4ebb3d83f51a45549b59a0..8d1ce8a19a45ebb2b29457e0fef7d72c1c0d9785 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -348,6 +348,10 @@ static void iris_hfi_gen1_session_etb_done(struct iris_inst *inst, void *packet)
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


