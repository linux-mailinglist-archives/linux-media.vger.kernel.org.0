Return-Path: <linux-media+bounces-27599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29740A4FCA4
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18872173B57
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CB123314E;
	Wed,  5 Mar 2025 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ny1kiY0M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC10522F388;
	Wed,  5 Mar 2025 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171504; cv=none; b=CAoUiZVBNQjiiWaPC+qRSegEHbpSkTSyA8kE1BfVJjSeQ+klBho/zA7VHTdZnBBBkdTgAvDgn5GU4q+DH8sR+fl7dmezEIfnjEcYll/+gGW8+ft1EtPz++J0+5XMqfi1vSdrPjvLVtmO6//j2icnN1b5Ngq6SoJGXYlkEKeu9W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171504; c=relaxed/simple;
	bh=LexYX/w8KIn87VtrnlPCM+lxaBOU8GyjSqG7UoVXqx4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=arlZKR02MzmKr4tQ4fDjS1hK7MFXfYXY/0GUqr/TrATNekGtfM3FE/mGv+86R2emGGV49PIGQihfvNUzlQyClhe3YigtPsJ8f0PxwIINFcBhTudk2rBhyNLukYolbmjhQg3YT2YOWHgSZGsfygB8Lq08Dsyt+6jBdY+UEyoC1ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ny1kiY0M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524N9vJS024320;
	Wed, 5 Mar 2025 10:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/PPB0jO8cWXHVlF4nOMw4onu2hRd3ElaVu0QhnNVWA=; b=ny1kiY0MaOMMp7N0
	hQSy3EXCBbHBsOnlljHUBYfmfW36vc6uYEU47W8rVFwRpTGd/E2JCGiUhaFhuOiR
	TGKaWGUbhxVkxyahuQHsA/nGiTxttIsLVI8u1awyyOdQSHx7P8DS07L7Pj0Bcndb
	c99HYoPSfS/sQ0mMEq+QL4DX0NGk8QwzvDNRAj+Y2Wze1zmQGECUHlf1h3mGUyTO
	mREhLkk9g4ojADX4ochCaoZDIRSI8fgZ+qCSnDnfWefRJTUYXEet6MdtF5sIxG/A
	KR0lpHtJg0LPn061fvBGHKyP/uXfMLjmq0DijIBN6rKFlMTBPWq3YXTTmE3f5sPQ
	RdvhJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p935115-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:45:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525AixxA013871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:59 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:56 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 11/12] media: iris: Fix handling of eos buffer during drain
Date: Wed, 5 Mar 2025 16:13:34 +0530
Message-ID: <20250305104335.3629945-12-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Me2Wu4/f c=1 sm=1 tr=0 ts=67c82b2c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=yp9ok1f2csKGxHfJMiwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jjn6IP07JepcgijsZqCaniljTb00JzxS
X-Proofpoint-ORIG-GUID: jjn6IP07JepcgijsZqCaniljTb00JzxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

To handle drain, a NULL EOS buffer is queued to firmware, for which
the firmware doesn't return a response. For VP9 codec, firmware has a
check to compare etb and ebd count, and asserts if it doesn't match.
Fix this by queuing a non NULL buffer to the firmware in drain.
Also, make sure to avoid calling vb2_buffer_done for the same buffer
when response is received from the firmware.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  | 1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index d5e81049d37e..cb3519cf6542 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -402,6 +402,7 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
 	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
 	ip_pkt.shdr.session_id = inst->session_id;
 	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
+	ip_pkt.packet_buffer = 0xdeadb000;
 
 	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 6576496fdbdf..f7792ecaeaf5 100644
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


