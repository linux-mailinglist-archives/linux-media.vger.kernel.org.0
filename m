Return-Path: <linux-media+bounces-31517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6925EAA63BB
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 566B04A4561
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276252288C6;
	Thu,  1 May 2025 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P0tYjuj5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D904226D18;
	Thu,  1 May 2025 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126871; cv=none; b=RAVzUwoh8IbRwVtTM4hK/fC4GPatlpLjlBiu0GZk2sKcTY/TOzJT8AVggMtP/Pwma4qAn9cG82/Nb5aHPzDpt6OmMaiL21E7vi/2l04i5IJhO4UidAIMKvQK3NXuHz7SS0i9nxFDNEG1zYJas2j7klvEVTA0bWGanGS8kbu8H8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126871; c=relaxed/simple;
	bh=GiqKr2yz/u9Dr+D9vr+i0Hp56T51FHrRfWBSi+vV4eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NMW2nfu5TtzvQ77TKxLnuzIAtOK0sZUEjZY4tMKnEqhw8vDTOs+QBfXSNzFAKlDJAiBe/ae19YmWLG9js9GcngM1VcfpbOs75gQ+KZ++iERvCcxpSUQfz8+7pum02qq/eLtWCUvhUO9ZBT8JFy2AenQ1bOsFn+zsP8/eYEIi0sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P0tYjuj5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D2AWG019117;
	Thu, 1 May 2025 19:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gqJ+N4pxNkuPTeFe/t/bL8sey0Lz+wbK88Lpp7q1DYQ=; b=P0tYjuj5BeWUs/od
	v1H2FrAdkb86Vwp4DPwNb6Qi31wUNSX0XALys9LR3zwbGU5GQ1y9Z0unkjeUR+2x
	CcWgI2NIG4xQvMIaJkPS/WqJhKfFImaSA+ezLM0rbodAWIzy1xIKtIROK2RMYYNA
	0KwL1Asp24PZ0WR8/FRN3xDwfPK5YnQd/5rBw1TZBbBw0jdq4TGtY6UDzMv9lM4U
	LOxbIADD/NqIaJYPkdKyr4Kr1aCyslFSmROeTiVuGa901Dbm5A8tQXJgu+D5SImr
	mO8kVyRh2lHONMLFeFvCQ/Papwx/nf6w2t1YX2rAENkaE9bJdSFVPGqtywQ/hGS4
	cPOA0A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8e469-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:14:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JEP8o002405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:14:25 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:14:19 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:35 +0530
Subject: [PATCH v3 05/23] media: iris: Prevent HFI queue writes when core
 is in deinit state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-5-552158a10a7d@quicinc.com>
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=1403;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=GiqKr2yz/u9Dr+D9vr+i0Hp56T51FHrRfWBSi+vV4eM=;
 b=eLQ8OaUsP+B2uJgmL6vuFh1ArDu03LZNF6jjtDUKYvxaI2f2+YM9yiVql9Nu2JzdNVBccI3O1
 ViVBhzA80sUA8I3NmDrkNL6+qxsQ1+giw1tub5tGxAY5rjQ0Rw2ba0n
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6813c812 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=TuTThgpRNTc_Uxy4z7QA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: r45D_8c2_PLZLIFHI02tBwbSAI_z8mPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfXyiWbL0vqv03a g5d1TG6xxutJV3pL/vwebHHkPMhhTU+9dbKP6KQ6ux69SGYPGfE+uZ//EhQDjZjTwfWT3/fEUuc 6i+IcAFRO4p0fxxonElXnfUaywI4LEqt8DMoQzkpxPrHvYaPylcxGQCotXCMh39MMKsFaxG4tlA
 O2DCEkkJRtOc7POvA1xP6xJpubpnNG365c7kxgZ6/yWmEC7npUrCrDhwFh9xLx923Mz8G0JsrOo uK9SECc2qm+8hi5Y/BmzSMWeH9xcRB3MionhWkbcDEg0hsWdUV+FFzzCRVGFnDKlXoCmRlrEkTG sfu4dLC0+/jJBTr64P6lP4JtQ2nOX3EtctkBqdWl41GqXAJ6oUIu7TeNrHvWYPRTfnYGf7oZtDR
 ayjV9+FVfZ/prqUlhTnFH8C26RZmzpdiwNsGkb2Pm8JhEGW0WVoRIr2bzBsuK1Ii4Thik4Mk
X-Proofpoint-ORIG-GUID: r45D_8c2_PLZLIFHI02tBwbSAI_z8mPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

The current check only considers the core error state before allowing
writes to the HFI queues. However, the core can also transition to the
deinit state due to a system error triggered by the response thread.
In such cases, writing to the HFI queues should not be allowed.

Fix this by adding a check for the core deinit state, ensuring that
writes are rejected when core is not in a valid state.

Cc: stable@vger.kernel.org
Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index fac7df0c4d1a..221dcd09e1e1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -113,7 +113,7 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_s
 {
 	struct iris_iface_q_info *q_info = &core->command_queue;
 
-	if (core->state == IRIS_CORE_ERROR)
+	if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
 		return -EINVAL;
 
 	if (!iris_hfi_queue_write(q_info, pkt, pkt_size)) {

-- 
2.34.1


