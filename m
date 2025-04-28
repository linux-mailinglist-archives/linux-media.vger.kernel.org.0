Return-Path: <linux-media+bounces-31166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89AA9ECC9
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D295F16AD84
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CEC270EC8;
	Mon, 28 Apr 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z66qrvy2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E809F27055F;
	Mon, 28 Apr 2025 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832663; cv=none; b=NH2KW21cO9O03Sp5jJM0Nxh78lE//RNrkUrURpA+MKIgFYS2v2bOc4X0td2gyAvShbqKPI1AtRyEA4R/+YzT8bGror+laqdpK6qc5LPRJhpg9OIbSGmi2js+v+ulgCAMlrsERGHBELEZ672NPDfF7n6iNIZzmkgmmqiTQHghdrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832663; c=relaxed/simple;
	bh=ySsCq1qRS0ga9nr5FjWP3RPbHeAS4VXYyRPg+WJ9ToY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Pmzjew6XwdHwY/QkQhM6qM/TxVECDh3xvfOa+CtfVf6bkhgLh7pcbFOYHMkNgYszawc1VfAADWv6pH9CcdiGfgoLKnlmwOgD68q8tsNDQdHNISyloN7huCpuV+3HSTxwjqzCFPGy+KnA5MUkLOaphD1YGKgks89Q4TFVIXW96js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z66qrvy2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S7QJj8012966;
	Mon, 28 Apr 2025 09:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBL4mUGoBFR5XMjzgAR7xSlvrK978p8iElbGSgID0WM=; b=Z66qrvy2rqiObruW
	xUP9/9gN53U2Co0Dc9nhgtQnRMPIMjZflcrcm9pN/dfP2Mn2GBVytjTf7MrZBcPQ
	NUHsy7nEXG8Bwpg7MhxKBwP3FtAVZkX1WZKV8kXtTRlh01kSRVUNpkBXwXBKOm8j
	QIKiUSZ78mHwCWKE/Qtc7gON27I+HDeVBK4a2j+n1ZzEoaLO8l18jSUdsFGuM6bE
	C7Dk8Gmk5OBgzIcwXsKwNFVp3lJUXNaO6UqQT91INQf6Mb8D1R84chq/MfchzWAZ
	rZVgah8xVtc60e2zRv1or1TgN6igLtgtz6ir7r5216TpuT+x8L4uZjtdOfXxydSd
	3Sk0Zg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5fngj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9Uv2F022714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:57 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:30:51 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:59:01 +0530
Subject: [PATCH v2 13/23] media: iris: Fix missing function pointer
 initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-13-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1249;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=ySsCq1qRS0ga9nr5FjWP3RPbHeAS4VXYyRPg+WJ9ToY=;
 b=K6th7mvCq5kmd6C8zJyiVXmsMA4v38w4ic+Zx6q2ReX+TnNoIgu+jnbaztTpDt54bZJLjXeWa
 9EINKQ4RnAWA7hiFuRtXcbqe/rd+JAcnCAJHT+IpUgTftymBjX8JgCM
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rxQLhaQ7sGGzsve-A3-v1oh4ACnEmrfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfXwaTg/S2W7qAe as4QRAA0YceO97RaHFbAnByiN6AKhsZfH8I+KL5Pyrndx97jsRTLKEqLV1ha9XV/mleEHbuhrxL wgiq/6LSwzD35NA4NDjTjR0UzaWEbmzyPaKLmFIbU4k6YUf7otqMyUZLb6pRxN3PMM/HA+WnsF1
 tlmJT3D8N4hQu/YekIG/HmyWGOnUUNZ4jl+fBwTb6dU4UR3wfslZRpo5KmaJKF/Isyl6AIQsgWc Z7InGfUqiQ8cxjhHpil6zkaRQ1Aat7+TC4UbTjbk5DyR0wmKtWRFZetfAKsUE2oa/n9D+gWjcqu C0Nm81wAxy7V0YDE0SMpWP857z7SJspaN9TmYG9HvWFntBNusq4l5YcDnGEj+1dHFWRR2VZcBnw
 4V2Jv64liCLjFSlFd4Y83gZc1QT+ECFSVPYz71tvZRxELGBPNlNK/gAzfIaMm/mSArQIThy/
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680f4ad2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KBDEKiRkX8NPVKSMWrcA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rxQLhaQ7sGGzsve-A3-v1oh4ACnEmrfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

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


