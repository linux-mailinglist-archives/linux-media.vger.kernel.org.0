Return-Path: <linux-media+bounces-31910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B675FAAD8A2
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEB227A94E2
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561C1226D0F;
	Wed,  7 May 2025 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NydBKecn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB85226865;
	Wed,  7 May 2025 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603690; cv=none; b=iGHIvtRZLyQFe5vvcaA5KbWhJIiAQ2kNovAqb4mmDBY+s5gcwh1xTauEg3nlhjZB/tavhqmG1M9C0xqyhzLEhI+EKIHBog3m5m4MhvomkCuqrKcbNyuDxQM9Ms8G6bWDiK8jGeblQFu5LjNmqAI/UxTUHaF9N/LbMec5nfarS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603690; c=relaxed/simple;
	bh=bmMImPyMoq3zg7LVcxr2a+fUAnsBX5GFiZjrlX2Fo4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ALP/3d7vUWwgNnuCRpMJvRVDn8ZvtgrDwrgb0Lay9Dpf+DFk24ZfTDiH6Rh1QuGZ6yEKcojPOFbwN1lhRdm9V6nkKW8nnzXTqTi8nOOgT6kIisMXn1dzc5VP4sBraivZyede02GBi2DM/8hk1CuG+U9bpEbfQZIZkjD3hjzXv8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NydBKecn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H3Td024555;
	Wed, 7 May 2025 07:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	14BkC88b37BUxrlW1254jjVLEhYS4/p7/Mwu5J9JAmE=; b=NydBKecnQ7lBlcON
	pR3gQKL9+p2S/D8Vu8fwjBz6sF1FhG9gSHppaTjmJ4gwiXJFQHqX4ij3sXVDc8R0
	geefmphJsqpVNEWnhrPvTprdGAWsyAv1lGDTVbfGqFMVZ3v/Kf4e1dWvrt8Z0TyD
	GneUUMsWogP11GH/cZZRbe5asL/wtZrlgweY3X6Jp/qIhAdznZInMYxULGFoKGOH
	d/kIbjhon3CiCIHKAbrh5AE/9ihQsjzhhx5TCFJMRzVfCNn70r/+r7tEFY3GejZr
	FM042mMdm6ZuITq76kBK4c87ag/T1vAtXwwwzUTbCfovAcTueZ0o9siQy1zFhHM0
	jdNoVA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3cud0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:41:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477fOD2000529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:41:24 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:41:20 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:46 +0530
Subject: [PATCH v4 15/25] media: iris: Remove unnecessary re-initialization
 of flush completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-15-58db3660ac61@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=1337;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=bmMImPyMoq3zg7LVcxr2a+fUAnsBX5GFiZjrlX2Fo4c=;
 b=8LURN0NPGH4QUj2Kmk18DEVqWkIIOhAc+xTuv0c26fbvM99JGggg7+Ut/U91CmikcMP4xT4hx
 s0GTm6DOEaMAa/7TqAO3dx3lXuc5Ot3d3AGPTRENrzYMop/ph9FQ1Cn
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfXxi0Efap3Wf9X
 v8dTde8WW/k90HuQpbBu5FYaTTNqdUs9SYLjE/vJetULLj3cYlDy4XxH59AAxQ+uZjxVHl5ZsOD
 fu0BGaVqSh2IKq0WCggqQZhcZHCjp3cEMFWBybeBm3cdADnS3wGCVDApNlG2EP4y00sujHOdM6q
 AWBrT4bb7J+LuvaDwf6QWxFYs3QdHCDfsDX5n3lyqqz5fqz6WTJbhIdI7HleTshPkEizpqhJJr3
 7Sp4qg4YUa4hZm7dc5mfmS5viuxU37eOwr+vUbdT1UO/1BAXD+JDQFNjF6Ppaxy4gLIGM0j62an
 dHh7KWkI9XaLXPnVor1xftrSOFPH4hTqgtskzg+TWBk3XcKpw8v3sjsI1Bgj8nzUl9R4ZCquQ29
 ynwXx87X2PW57yzQv9vJpzbORIs+eol8Uzsd4+aG6xoFIp2nRIw1b8ZYiY5LzT0TQapbyNxC
X-Proofpoint-GUID: NmRgGyOb8pAqHJRYRT1k9lz04UFZqia1
X-Proofpoint-ORIG-GUID: NmRgGyOb8pAqHJRYRT1k9lz04UFZqia1
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681b0ea5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=6av5jTddOrEJwTo9HyEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=982 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

Currently, The flush completion signal is being re-initialized even
though no response is expected during a sequence change.

Simplify the code by removing re-initialization of flush completion
signal as it is redundant.

Cc: stable@vger.kernel.org
Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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


