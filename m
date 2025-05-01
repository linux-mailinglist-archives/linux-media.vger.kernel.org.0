Return-Path: <linux-media+bounces-31527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C2AA63E9
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48AD19C444F
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F1C23C4FC;
	Thu,  1 May 2025 19:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Co2KSUhv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD60226CE4;
	Thu,  1 May 2025 19:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126938; cv=none; b=ihjVvMLxK4J5k7tCqp/ILQq6ajaYjF6V60WVwFeh3NnLbK/1rgUhtsFjwwWjeBvteDzCXcKz/mHj61VZYSoVr9qvWi4IuPsX9r7Mosv+uRbFREF57hPL4XRBG2FzEt2aJoN4hX/P3oh8gSahKhz9s4xAttzlm/8hc3+DXMkJ9x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126938; c=relaxed/simple;
	bh=zDpeBU/QCTsfnVwQyXbsg96xJF+DOLnnXnLi8XBSoEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lTuIaasBZp1S6GE21F+eruWVM+9zJ8z/MiMS7J5zep6DDCMVg3lD0AOnANDr2xDP6Dx0F4ztsZnYy7ybmoq9HyyZzF0Q/rmjeIcIRwjOkbnlWQ2TbDypkkva8JLvvHsIMRvqywwy+RQOL7FQrnvaLlD0iCi5sQ4LKTVmUDjrd7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Co2KSUhv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D1s9m032370;
	Thu, 1 May 2025 19:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kfQnLyJbcgT3/uDUPXW5DwgJwwUXUyIn//MaKubiTY=; b=Co2KSUhv5CE1SS3P
	uig3F8s2CyX1vNMhsKA3kDNDcDRgMBtdprJbewV5yKf4WKiOzeLfJcfXPQlNoU2D
	ckA0HH1nNMwiMhu1gNjy8dOIQHPmuKGV6VimWC40gozarGJjKEOwCPi5U0kTOfhN
	dSTl7SciANjz5PX7ESh2RZfsjESKmE0RBq+zNudotizY4HNhCXeNPAjiTzPrBl0u
	2w/+7gFSiOjZ8xBT4NNUTCsTIBEvm/ypeVphHCUpxeTIGMgzxEyWV2foPme7zj7V
	5jBMu9MOq0d+QNx5+5J0k8i/Gjtq0k2Bn+WRAUgzaXiqn6fRl4xuaGs7W1ZWTNl4
	TsYsrQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u768ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:15:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JFXgH031396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:15:33 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:15:27 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:46 +0530
Subject: [PATCH v3 16/23] media: iris: Skip flush on first sequence change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-16-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=1351;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=zDpeBU/QCTsfnVwQyXbsg96xJF+DOLnnXnLi8XBSoEw=;
 b=Lh8WNNWHCPImAlD1YkUJUeiIJEeiMXxs/pZUEzfCKqfhbs0UaXdiUytqr3qI/DEhIkbqI9/XC
 foqAvjoZq8rCo3BlV6qEBTytWCuEBxiEH+XEYh2heJKXERRh7+uCP7F
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfXxkXVX1R+85d/ +gctInTltDNL2hQbkwqbuMwXcfN8A0V+eSaFWeQ8vueuoiWNwInFMxqFsi/U5JRKJTwzD6JyWu3 7IOFLOCbfjG2btxnK3DRnEgp+ztnYNFiBd+F4MJ6FfZHv4L9PxM8lnTcsDk4+4GPd1q89oq6Ocs
 zilEXeIikOGdvnwdVD8+RWdSjYcolgZoBli+P3nX6tjUY8WLQJkRrTUhetEqM+j0QOMAK/exMId Q0CUp7Hlv5vcze+eQmkxOxhHWjEda5kG2HZYlC2SGsT6RNWFL9X0ZFFNrkdhrhRL6EPlZnRpj1e WiqBgQ1RY0xpiV1niMcxwxU2kuquahPuvW8udllrTHfApZHT9TxIhy2XmdXV+UFI8akblbWaPEY
 MFrVNllQ+dC3Go9kSs0+aGRKaVquzp62/jlMvATPjQut9Kr8NpnpQ49NbcN8QAQ3TRhUw0nk
X-Proofpoint-GUID: yL_q2W8C_yx5ddWBen8DjE2_3XnEP0tN
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6813c855 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=bTiEC21CLpSyVAFLm5UA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yL_q2W8C_yx5ddWBen8DjE2_3XnEP0tN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=945 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

Add a condition to skip the flush operation during the first sequence
change event. At this point, the capture queue is not streaming, making
the flush unnecessary.

Additionally, remove the reinit_completion call for the flush completion
signal, as it is not needed. This simplifies the code and avoids
unnecessary reinitialization.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 19ced1b3ee74..926acee1f48c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -200,8 +200,7 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
 
 	iris_hfi_gen1_read_changed_params(inst, pkt);
 
-	if (inst->state != IRIS_INST_ERROR) {
-		reinit_completion(&inst->flush_completion);
+	if (inst->state != IRIS_INST_ERROR && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
 
 		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
 		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;

-- 
2.34.1


