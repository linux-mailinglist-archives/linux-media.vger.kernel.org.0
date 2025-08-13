Return-Path: <linux-media+bounces-39765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96404B245C3
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F7F1BC4859
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339222F90F7;
	Wed, 13 Aug 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y9LF0xIX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206212F83CC;
	Wed, 13 Aug 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077940; cv=none; b=j7L8w0z8wNCyQvptIvwXMOEhjU8nO0iksW642jzWMtTyKFd94lUmKRruyfCoy0gGEQL2i9plO/i0KilwdomSBoJvZsfuFDEazxE9qKtR5PZ5qS2UaWuQtCktu6CVx5D+nkc+qwNq6B0U7DpNn16bfkI37vxf9VMM5cGTjihUMLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077940; c=relaxed/simple;
	bh=mej7gwFjK6P+WNnDSclAeKLSqFfQ3cnS30fvxIYdeI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C0wjFjmb/JOYBjqPrB2f5+Y58NhdOkKHm5+9Azpjd/+RYcuaZyP5aoiLn47ltV0KcIpp6TbHLl/vJbXuBwrP5fppHf4m/6mBzbNfaPYbf+JL/irjSb1mLRdL/2w0UKfypolhI3B8Y8yEnlORIX+JDPTNegWAOmgLMfczBkm09is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y9LF0xIX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mRRO028954;
	Wed, 13 Aug 2025 09:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26UVnRfTMd35fzwZQ/t2lpMAUaZJGvf7Ro7Uuktai+8=; b=Y9LF0xIXcBNsO9BR
	WoqP989BTfxPcjwqtQNda2jBYbxTEvqX7w2bWV6sLk5SaUjlBLovWa4tzQkrkuTD
	dTOuthFJuDgj+rZhwxOPOMQ24OlDoR4SYBO92IGD0S4tRmVUDMW9+9CJbtJq9X5r
	m6KWDE3LRDdGyBZ4wapsSIRHKla8T7j/9rC6/7tCbY9Gi2T6HuftwEtQitxN473t
	w9jMqZBa5YT53m5QSho9ROZBLl92/htx126AAFfhTn8E5MJw4bQ+I5YA/mqkIsON
	VMKATUwo+ShY1ndoaTbPGnuRQ/uqZJStGI0drx67JK/pqmU7nWu6PpWzdFX5GWdD
	++X6sw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj4b9vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9cqPA028592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:52 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:48 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:07:58 +0530
Subject: [PATCH v2 08/24] media: iris: Allow stop on firmware only if start
 was issued.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-8-c725ff673078@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=1791;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=mej7gwFjK6P+WNnDSclAeKLSqFfQ3cnS30fvxIYdeI4=;
 b=c7kvX7bE9N94K6uP0ztpCR9Xc4V3t/EC8d+Ie05Wfu7HxdT+fB4MPqswL9QUpVytcY1jt3Huh
 GT1a6sddII7Btflosy45fbHokyAIcV1gmITr9ib39yM84xz0OihxCXX
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX8DR2L5lsUju5
 10KWlPacQihU6rcAUey5t/5S4ijQnvQiONvixDhbnIR3SvoHR6Xl1r9Rpnt3niK8lbqnfzLlpAw
 zTTIcrju/EU57Ggyd+hK07p3s8tlSf2mJYCWanOP8gyjJ/gHZDrdMpUtcBL5P36HY6FqDCRmKa5
 cWA4/2BKHWvcDDmpDdSjFjt5+gNRNbb8U6uunU1VP69dGiidT288kRu2lcd5zmZPXs4JuUTiucC
 4atIyAuOk4774xY1LkXs2J62+y2Bx3dQyLR/Stwe3PDQA1Ld3pnVc3E7ZJG8k6B4rz157Mc0Ycs
 KgVa0NILFyIUqch90Y4XkaRX1gJSlMATNq0ofWpOqQ/7aEBx+p92aG/8hCLYxBnNNOX84/K/k5T
 qz/sJMIq
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689c5d2d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=rsWgEMF2Pf62jCDWMwkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XPuUwxK6-UYvSZzoi7GQHZDqKwFSAi8I
X-Proofpoint-GUID: XPuUwxK6-UYvSZzoi7GQHZDqKwFSAi8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

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
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 5fc30d54af4dc34616cfd08813940aa0b7044a20..5f1748ab80f88393215fc2d82c5c6b4af1266090 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -184,11 +184,12 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
 	u32 flush_type = 0;
 	int ret = 0;
 
-	if ((V4L2_TYPE_IS_OUTPUT(plane) &&
-	     inst->state == IRIS_INST_INPUT_STREAMING) ||
+	if (((V4L2_TYPE_IS_OUTPUT(plane) &&
+	      inst->state == IRIS_INST_INPUT_STREAMING) ||
 	    (V4L2_TYPE_IS_CAPTURE(plane) &&
 	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
-	    inst->state == IRIS_INST_ERROR) {
+	    inst->state == IRIS_INST_ERROR) &&
+		inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
 		reinit_completion(&inst->completion);
 		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
 		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);

-- 
2.34.1


