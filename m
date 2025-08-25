Return-Path: <linux-media+bounces-40879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6BB3371D
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23B0C7A6A59
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2A6289802;
	Mon, 25 Aug 2025 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SUYVLJFU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63239293B73;
	Mon, 25 Aug 2025 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105292; cv=none; b=H0hGcVdC/7ASPBEciTAH7mZt4X94fiB5iJ4CbxJZpwN1lCCbKCleAt7uogktm7yFWvDDI0K+zHUgQr8muFmNPT1i0InhIoCWIc17KmjFKO0ztIEExbLL3tbXpWvbvHjOTRBhClHSP5c74HAWSWNe/mJm51E0wzn0qJalt5MHhjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105292; c=relaxed/simple;
	bh=MMqsaIXcmHSdFXiUwbqDVQd0I+YX88sitQIyxxlBITA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jeYEelTndiR0CcVvNbipal/owlabgoSQSx35xHFMhZXQMP15PglIpq4Duh7bR0H2PCd6tAp2FLYGaC2HhOXRQ9P8KgHXyyvCjxeVFcEB2oGHeP6z3OOXqP4WR8Zjib+iAO5QgyZiZ0DEWOIq4xzuRptZcpdxY6/iEF3MthrouLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SUYVLJFU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMdL7X009700;
	Mon, 25 Aug 2025 07:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4178enPx5qsPwfGG8HkpSU9FQOnMjSw1TevvnOIWric=; b=SUYVLJFUV0bzwVIp
	DYf/8TsCtq9VcrPDIKxLY/retz4MDeC69JwFjdL3vfy9db5epy+6qODu4G6pWm0y
	FbcOGQsVWq5dL6G5dA+kiRoGDIm0bSuVGr3gPYbz4B0kc6fdYwy4qH9WW/CpIFep
	WEFWb71nw9pqmsDakmdJbyNbePSMjwWEuw3CwCXo+F7lSgunp5NCFAbtX6zQEOIq
	y+HrrItwFIKpXmSIfUdM5+FA0v5mAAWi/DfJuiNw0rn1AHL/FgxwnLMvSJpt6nXj
	LtsPx3NTTHGZ7nzWxWagZZJ8kZ6YIKmBZAZcIoLsfVsM1CrByUtNOkIzif4cJgsF
	CIsHLg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2m61j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P713a4008449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:03 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:00:58 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:29 +0530
Subject: [PATCH v4 05/26] media: iris: Allow substate transition to load
 resources during output streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-5-84aa2bc0a46b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=1894;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=MMqsaIXcmHSdFXiUwbqDVQd0I+YX88sitQIyxxlBITA=;
 b=CWCz9cD+wBMZ4//vYVWl0HhSlMfU/ZLc/gWzEiUL3o/ukjXWOgAh6oUJ0EUbw2nnrwj00h8hY
 Nh1BQ921KTkB6HmNWD57s7bTkxybiDCj9R0jrva0cd4qc6zTTIMaxl8
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac0a2f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=obbvyrX-RHgrhnFnxo4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8RAzvH4L/CcZ
 HsB+3kgoAAaeruiADaJcxMZG9pLcVxSU7XVcqKik3yqREeHHiUI5G2jbvN5swqcZzDr0mjb1IrP
 VB4o8vkE+RwsIXC4nCfAc4Ziw4s7dWTjF2FUQLAUG3htAFNWnAentV/RD+DU+vrjcstXUgVPQut
 7GX9xIt8GMiU0Dy9g05YP5yirjOZrhN7o9qMFjY1EpPOEBAL7W5ZFbRa7OTaj6RfnD7+E/8YYAC
 mlItzTMLEpXvh1fVi2AcdLVhzj47o5nazjFxvTpA2rvRuYMVP4iiLIUASPTRujNml5XQcOqTInG
 byUl3fkcA64zxRGKTcOT4so2uRmBf1d8bOxb7fjdKR61g81f5VKYT4ml1i/QRtJCcIcPohXjgv7
 a8nPN4CQ
X-Proofpoint-GUID: l8F88TH6mTqAvbaXaXBP8zr_kerFVNOJ
X-Proofpoint-ORIG-GUID: l8F88TH6mTqAvbaXaXBP8zr_kerFVNOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

A client (e.g., GST for encoder) can initiate streaming on the capture
port before the output port, causing the instance state to transition to
OUTPUT_STREAMING. When streaming is subsequently started on the output
port, the instance state advances to STREAMING, and the substate should
transition to LOAD_RESOURCES.

Previously, the code blocked the substate transition to LOAD_RESOURCES
if the instance state was OUTPUT_STREAMING. This update modifies the
logic to permit the substate transition to LOAD_RESOURCES when the
instance state is OUTPUT_STREAMING, thereby supporting this client
streaming sequence.

Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transitions")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 104e1687ad39dab93ff66450ba3a97c309b1e1e1..a21238d2818f9606871953bd0bee25382cca0474 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -122,7 +122,8 @@ static bool iris_inst_allow_sub_state(struct iris_inst *inst, enum iris_inst_sub
 		return false;
 	case IRIS_INST_OUTPUT_STREAMING:
 		if (sub_state & (IRIS_INST_SUB_DRC_LAST |
-			IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE))
+			IRIS_INST_SUB_DRAIN_LAST | IRIS_INST_SUB_OUTPUT_PAUSE |
+			IRIS_INST_SUB_LOAD_RESOURCES))
 			return true;
 		return false;
 	case IRIS_INST_STREAMING:

-- 
2.34.1


