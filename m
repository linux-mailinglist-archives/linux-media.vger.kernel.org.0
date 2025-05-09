Return-Path: <linux-media+bounces-32101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 595DFAB0D8E
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BC5F9C0E9A
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B955280CEE;
	Fri,  9 May 2025 08:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZOqpcOte"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459F276021;
	Fri,  9 May 2025 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780023; cv=none; b=JrJ/mFwfiuSgFI+/fWVHRVV8cuGbu/jdOxKIsRLMCtM4dtJ0Q606Q2aydFA/FVeu1xJNUAmaj2VaBdVkD5JMcQvYqUqDMlBuUWcHHZNj16YsQhhgyV3hqEnBD4dRqBuic3lpL49dq4NUMMDv04uSIcFq+MU7Pk9tTO4xtzEeeeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780023; c=relaxed/simple;
	bh=XXj1oNRwypz5WvQNDTyMQ6yX8egfGIoeXAAXQV9q0r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JppZJnM5LNMvGOqvWE9vbk/QWWYvPoYJT2N8I94bLxJgDUuN5RZRfELAHSB68UChVF4GrZYU3Ny97Lvb820vflKrZb1hfLudF8Qsh7NGekRiG6VwVazjLwn1cgCB6QiI9y+TDNEnd/kQ5eozYLov0TgsKnPsV/FdxT4+H3sDkFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZOqpcOte; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491eQCt014298;
	Fri, 9 May 2025 08:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQ4gnvJqoaqJpYV4SnIYU5axM4mLnp+OzSnmH0W36Eg=; b=ZOqpcOteVLlFln2n
	FQxtmGJzLwyOkSdV1FUUXbznKuXAhki8brm6txsKOlO7dWI5RvorSr75PtEld3MC
	ZSjeXCegHo8zg/QjQxrE35HixE3SdUJif1SZM0DQPp8m1UtAxLLKsXNjeKFJutcA
	rKctvykNAGuapQBdaFv+kZRfWUiyKBn9TwJqFKI+9+VcHInEt7KE2IoJ3DfTK0lT
	QC+Uvs4k3vnkzc5o7qsSYfjrM8g4XCK1nusc8PB6JyVI9N6mMR7x635oSF6+iEdn
	FAVsHvNYLPB72qBNmcE+XGmrxW7mF29n4TfSdhF6aAWnXmccqDRnFI0jTBch8atv
	zzP7dQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4m05y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498eGeQ000439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:17 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:12 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:02 +0530
Subject: [PATCH v5 16/26] media: iris: Remove unnecessary re-initialization
 of flush completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-16-59b4ff7d331c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=1621;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=XXj1oNRwypz5WvQNDTyMQ6yX8egfGIoeXAAXQV9q0r4=;
 b=aAWZxwVHV7XjgGJ50+4fjOEo5nhegTeW568eIlyxouFjB+ZsOCBBHOK1wzX3ka7Difj2lew8F
 uQxORveJ5unByde8x0wlACjqEcRMXyJlpir3J7c0nF56ufraNzFh0mw
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9A32DUhvyJDahNkfBtxbVdGCcaXT2zQa
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681dbf72 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=6av5jTddOrEJwTo9HyEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX3lMwQgruvQsn
 nPnPm2l9I7P9fIDYZeWeaAZE9g4P4Z+ccNuIr5BIVrCBGgmUs7ekOpS6VWsXAvY4lKTmk+H1mvN
 8tJAaOX4p/cGdP96RPS0Cb0/m00MSeNm2sp2/IXDkA7dUk59PdUl7vZrAXbUv5mMhun7dclSi/L
 MSkIbKOpJxLi+qbV36DQwkpfdfPHYELFmxO7R0NPIfJ2gQ6uyWDCd0htmdhJAoVosnSGCNSp/Va
 qyq+wav9TG4FVpxrrr3GZ8wcG32y6DEhycXf8YICFG0cpkqAVoyNMZHPeaO7xSsFrppFw/UwG1O
 V4tyBhRO4O4mZ10H+8eEqKbRBWzV92igl7gxzLJnjfvYHGI873y5FVsSe0rtAJTACn3SKr5im0Y
 y8e9nPw9Je08DfkwafwCixUL69uhrxeshICNAkQ54Ve3az9q5CsrtGESwMUAz5vpfdSDvqMI
X-Proofpoint-ORIG-GUID: 9A32DUhvyJDahNkfBtxbVdGCcaXT2zQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Currently, The flush completion signal is being re-initialized even
though no response is expected during a sequence change.

Simplify the code by removing re-initialization of flush completion
signal as it is redundant.

Cc: stable@vger.kernel.org
Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index aaad32a70b9ecba94b4c3bfadd8687db7d22a5b4..c8c0aa23536b73a1d29f560c21900238e704c74d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -201,7 +201,6 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
 	iris_hfi_gen1_read_changed_params(inst, pkt);
 
 	if (inst->state != IRIS_INST_ERROR && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
-		reinit_completion(&inst->flush_completion);
 
 		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
 		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;

-- 
2.34.1


