Return-Path: <linux-media+bounces-31903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5A9AAD8AA
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 154453B9CC8
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5F22236E5;
	Wed,  7 May 2025 07:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jp4BVby6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E10220681;
	Wed,  7 May 2025 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603663; cv=none; b=jxmej+X+pt1VLlpZMb0zejiDSV0jkwE53QqTxTBSIGio39q5hpdJtH/da5oRIbbFN2tSHOuqRGSomb60IgrxSWHoeImac+ynuDtXsC4LFrLhH0iKXIFReel1W4UDU3ex9MnCH3VasBvWMDIQVNV+qmeRjr9OuybH9DOCblZw5do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603663; c=relaxed/simple;
	bh=Pph8quA6nCQSQu7tQJ9Ybu3Gfr0yy6Kd2G6qOi55BLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=N5Nr6suEpYSo/108Ekksu/75a4bfEq21ByWauwBoravwODWmtlX9i2OpgX+TGaR7s5ofXfWEAWpbLmOKiWLID/5iL+IGKO+qRVeEni5HLS93OEMs7zCESH8GF7ilD9E/9bleXApnqkGn8GCdiRComjUiFViSnl2FXW0sy9vEPsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jp4BVby6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HNxP010625;
	Wed, 7 May 2025 07:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ts7FQPxcaqdby2MjFt94T0YQjB2BqlXCejr4HI+ihCo=; b=Jp4BVby64LYYA6ga
	Zlrr3HbDkRyH7iR1/vzjp332GrvQo4KcF1hpLEBHBb3NEYVrk1hHTslCaZ/HSgV3
	MTFiyPLEZ+UuuwCDK/8cFj0K9TPbfuMcTd7BUk4Zi9m1puldV6u/FF6mcE7Ulobk
	Y+yBmFKuUjTHLcxkeyYkBPBrA7rLedLnbDEhKaCmlMVSf7htl/0UfE5LFpNDRLa8
	6w/o+WX2HvXtON0bdMgELLYUSbPBv1+NJNOAGJCy8+8shshDActOhUJwU+oUxh4e
	XnB4QOIcQZK5BFdNFAvaqRPw4EBmqCxTolecLQ4ZfkU3zLw+9dtJ0SbOYo0Q+QeN
	+4cKOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1j1kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477eruk030897
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:53 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:48 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:39 +0530
Subject: [PATCH v4 08/25] media: iris: Fix missing function pointer
 initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-8-58db3660ac61@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=1419;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Pph8quA6nCQSQu7tQJ9Ybu3Gfr0yy6Kd2G6qOi55BLE=;
 b=pWn0UJBpfgV8b/C3FK54JIf9iR/JE43/Tv0igJRoQmL8oNac6n/xoJWgg93AY+OU1ItOT3DDi
 CZgt2V9J9zoD/wRS+/9yGZn6r1Cn1ZCBlZ1RWr32/DkV3Lnub54f1Xy
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7NTPv4HFNvPY0HIDuDF2aASGVFpecP3b
X-Proofpoint-ORIG-GUID: 7NTPv4HFNvPY0HIDuDF2aASGVFpecP3b
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681b0e85 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=KBDEKiRkX8NPVKSMWrcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX84vt0whjMwGX
 wPOTqiCIlOGHv6Rdb8uMIimP6APRx5kbR0NCJnW/41OwENkwg9PA5GGsQBZ7/jRz9ysEpS935Ww
 UA0G7CnmZt3l299am5DkfT0NsfbeRfPGl/MyqKxB/Lq+bRQN6iX0lL1pZv70MXH2xSqDsnslnAl
 F0T5Ryj5xY38O1s6VLW5RZdZgvrMm1SXze9Gfz+ihhAKT2xWVQrK6/sTTeD6Qx+AdQj/O/9p+7i
 69zU2UUxivC9SSZvWoxSluIpxxw9zjowkXvwDGAVo3cgodQz+JkeLqzTOWG+VZD9np3dVGA5zqH
 JZfRmIZjc9ejA/fMeX7+dSoXJ6ZM0XoHOU0WVdhxnd6SkaaP6Pv+a0KSumTArnOv6cTF2cB5NwW
 zXMWBJlViexVbSTEakmrHiMirlszQEJMrMoYHD/+LqO5qKG0Q0Me20ue+sC40/bTPQ5sTSJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

The function pointers responsible for setting firmware properties were
never initialized in the instance capability structure, causing it to
remain NULL. As a result, the firmware properties were not being set
correctly.

Fix this by properly assigning the function pointers from the core
capability to the instance capability, ensuring that the properties are
correctly applied to the firmware.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 915de101fcba47bf1d1d9019cc5e704b87e2b9bb..13f5cf0d0e8a445aa68fa87a3569bd99ac23a32a 100644
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


