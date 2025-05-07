Return-Path: <linux-media+bounces-31920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569EAAD8F1
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 410D63ADA15
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D0222DF83;
	Wed,  7 May 2025 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aXda1QDO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7951C22D9F2;
	Wed,  7 May 2025 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603732; cv=none; b=REKS2d6gLbGjdzbZ1uUCS3hh5RFJB5vmw9PcGhEbOq3eM5mWIX/ADbb7LjZ9m7EK0CEav8sGh6VhnD+nMbnvbnt80/JtHtnNw93PlpiFXDNXD/WzRf7Al4SHOtrW1oMKKBnFmSAqIsUx0RhA1PZ5eyeJzMd8OZVlqzS8gVDZc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603732; c=relaxed/simple;
	bh=IwzhpHikuKvOMW5dbENCNY+S4k9r5Kg51FWPS36yDKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mhT7REKU5C7iPmU95Yb0d6eBod5dyy0V0jRbjFgqvRkTShjhECOLLbJpqw05LbzhBP//th04m0j2RL51wyyJyny7Lm3nl0/8gkmlisc3dfvslzJVVsi7BtiXY2ZhwDuOqOn5JJU6t7Z6Tgo6NVjvMITxv8ClVjunVBzVjaIWeus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aXda1QDO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HOm0025471;
	Wed, 7 May 2025 07:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF2joQfD46QXPfh+MX6feeOx8IOFOfj4RFSDsj4k46s=; b=aXda1QDObOoZ+1xy
	e9TLEq13rE81uGOrX8ZfG2mNTZ0gvocxPyIKrevVnU8qbsDHw2eJi99/7CJWnNlJ
	LzWCoPBQiCw8tQSAmuvYa6GZOKYZa7c3ltOBKQak9mZdQmmhBewSIeJhJ7Vbf2AA
	/W3EpmD63MSN6/zd1WLdFX9wFSifVCqJwY5xxT6a9dAmnXTSHMzaXkxVQfAgB2B2
	bPbEWfqS5ltwxLOQH/W3AYsEkTQ6fPHXKtbiqmo4VSiNPv7q/FEEJ9TMVIl2jECr
	0Mg6bJRjojvbjhoubGROolq0dgMDk3ftI9Uy7/IMErquNgyRH4/nSSI3LiS8HXgW
	1oX+HA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3cuf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:42:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477g7Ju002521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:42:07 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:42:03 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:56 +0530
Subject: [PATCH v4 25/25] media: iris: Add codec specific check for VP9
 decoder drain handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-25-58db3660ac61@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=2248;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=IwzhpHikuKvOMW5dbENCNY+S4k9r5Kg51FWPS36yDKk=;
 b=C8MCPcFEv0v2eBQ7rZyqu/8jAWov22vptV1XjLB5JHBhxyAcRPXW/BALJUoyQ1fw0aqFtdcvu
 g3orpTNg9RuAn2PXzb36fAY7fKrSyON+rFpVJjfVkiHKqQVoiFU4V92
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX7GbUf9I/ebk8
 xjEkvY+C4BZb8jmbcyRIJgeEJSmt1w3Yy9y2Z2rUyiOrbfloLRKsRS3zuBmg5sK8A60Mb80CceN
 vD462QX/jvFlrc4qsYOr4srv068cBxxGwqbWvsjn/P9IOYZ9Cx83tqTPDGRJ6CAoud6iRZKwbhI
 Plu3fw3NRefPj6gLHL5WdkXcBJ5F+4p4qJQUxoJ9LLjGJ0Jl6WaxRVA5RJW+c7N4m8nbO+/hlGT
 rxx8OXxDLzunR3qHBaYGS2AljrD67R44zD2cXxAWPFDygRnWErzGbVH2Q3Hcs8wc2XSLscIBM1Z
 z4hTsju/R3+2MAaL8+s8xcOdB1NQAowehcqKdpuqP2nf6323EU3vj1SHiUIaLRmHks1bgajorp7
 fd+kAijkmH2elXg9jOpcUBWnwiRrzWW9OVNaH3405Z7mP7irM4/Hw6wnz0QcpELq5+dpy4uc
X-Proofpoint-GUID: oeWSfgd4DxKsXqFH72XbmwJiZgkehtal
X-Proofpoint-ORIG-GUID: oeWSfgd4DxKsXqFH72XbmwJiZgkehtal
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681b0ed0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=4-NhuqtsghaPV3yzw-AA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

Add a codec specific for the VP9 decoder to ensure that a non-null
buffer is sent to the firmware during drain. The firmware enforces a
check for VP9 decoder that the number of buffers queued and dequeued on
the output plane should match. When a null buffer is sent, the firmware
does not return a response for it, leading to a count mismatch and an
assertion failure from the firmware.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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


