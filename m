Return-Path: <linux-media+bounces-29648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6BBA810FA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 17:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D15FA7B1D38
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B33523E34F;
	Tue,  8 Apr 2025 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NXqWgpeW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B67241105;
	Tue,  8 Apr 2025 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127747; cv=none; b=ShxRgpm6OU9CDyJkclAIo8+XggBXtxaj32ECemsijUWZaL02Hzhqx4xWG7cUR8BrpnQ0m83mvdXqo8PHghfdPodVlP+vFHYTnmZbQ1RDWPY1BWU80fvbHAhoIY8ksbh1kJM4F1KyZPVnCs9Yi5XEm2uKYXZ2j7wVLMd2mJtT1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127747; c=relaxed/simple;
	bh=ySsCq1qRS0ga9nr5FjWP3RPbHeAS4VXYyRPg+WJ9ToY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Y5PVYT+VbuQSU633JpD9vQ0nasiFj0PcLu5/0bB9VR01UUf8IKgRXaGwQ0kZH7YSDXo//Endnlju2rK+gmBZ2fbsbDSZ0dDosByfmWuhnmCVSw5I4p+ro7CAilqwsllr1Q7hMycrwL3TW2GmjEcWxNh0AbE5nMk9KQmZOTaG/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NXqWgpeW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AxwoM014111;
	Tue, 8 Apr 2025 15:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBL4mUGoBFR5XMjzgAR7xSlvrK978p8iElbGSgID0WM=; b=NXqWgpeW4kh1UMgi
	w6MHfibzWD9bYaqQKlff2aku5hN16q0de48PHUpgH62R2Q067K0INNCQ8bi9Lq1T
	yc10Q2SeGldSEfxGjOar8fAS9MoBCE8WAU4w1aj494q+4GmGT+Pe0VaJcdnERySM
	au+IZ8qKF7qC+7cQMtfou08whJ+53yCJ8VhY3TVXwo33f9GFO4vWHwY5woWdpAGw
	qx8he5U3Tok/FdXxRPgyS7kDD/a5OcXdtaooBUgKTqOwngSgaYbDqhChNGyVKyri
	1g5DJhvLAspi+VZR4aSe8COhcf3Xwbpq4eMBZdAV5UFk3yk1OKICMMwSwn0RlkYu
	YFea1Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm88yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:55:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538FtgWc004141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:55:42 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:55:37 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 8 Apr 2025 21:24:26 +0530
Subject: [PATCH 12/20] media: iris: Fix missing function pointer
 initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250408-iris-dec-hevc-vp9-v1-12-acd258778bd6@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
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
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=1249;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=ySsCq1qRS0ga9nr5FjWP3RPbHeAS4VXYyRPg+WJ9ToY=;
 b=s2twC/3Mus2f5LFqETqQZlqLWx2PMBdXOvOlhmYaeEaTJTq50AM3FOh8+YqcDa0LpO6cYunk2
 xWgUIKrDJRMDRno6y5qIoFnnGy0IergFv5FtG0rcClXR9CqEw20mR29
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: apS1JQnViyDKEqxtsuKokl6IUhYZ0p3u
X-Proofpoint-ORIG-GUID: apS1JQnViyDKEqxtsuKokl6IUhYZ0p3u
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f546ff cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KBDEKiRkX8NPVKSMWrcA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080110

The function pointers responsible for setting firmware properties were
never initialized in the instance capability structure, causing it to
remain NULL. As a result, the firmware properties were not being set
correctly.

Fix this by properly assigning the function pointers from the core
capability to the instance capability, ensuring that the properties are
correctly applied to the firmware.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 915de101fcba..13f5cf0d0e8a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -157,6 +157,7 @@ void iris_session_init_caps(struct iris_core *core)
 		core->inst_fw_caps[cap_id].value = caps[i].value;
 		core->inst_fw_caps[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps[cap_id].hfi_id = caps[i].hfi_id;
+		core->inst_fw_caps[cap_id].set = caps[i].set;
 	}
 }
 

-- 
2.34.1


