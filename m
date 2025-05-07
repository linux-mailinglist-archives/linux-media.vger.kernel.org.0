Return-Path: <linux-media+bounces-31909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6DAAD8BD
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC70B3B0EAD
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A42226188;
	Wed,  7 May 2025 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P3icmDo3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6BC2253F2;
	Wed,  7 May 2025 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603687; cv=none; b=G6me7o4Fxp5Iay+G0USMpbbIRARXbjn8o2tAVYiPS1nZt5kiHjB6cPwwUpV0hT6Ujfrtt1wOkWdYQRmV6QVhZvSf9V7592os6nwcrD7KryJEyOpkuooZ37qgAaMu3EKhgi5dQztdNbJNsuOIc2ILpqfk0tvZgR6Shr1JbLRf2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603687; c=relaxed/simple;
	bh=uzOwIM7ifZmWrebOUCMB2ul0UkKRfXkzrcfqkmW8xyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XPL/awUX40Npzya0pk0vFKvWtDYceCPvf4HOWyolSdTVr4IpW44icf77fn5yHPUM0zHeqCsAoSfFTx7AY9g+QNr8DUTZ+1zG7BC08l33av6DMDjuhCU05QR6wSXQdiN/D2nqEWnmo1TJ1JfJa9MBbF6O32C4v6gbqw1i23DZM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P3icmDo3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HIiP010452;
	Wed, 7 May 2025 07:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	776ik9r6CMXtRvVFPbDd4GfrtuTj5LEtKTYNFb1sh7Q=; b=P3icmDo3e9mfaifS
	vIwCdvMEgR4rf/R1et4MVlfXKG4L7sYlCIgAZACpta0HDL+tU1f2v8UwKmafkCOF
	bN5ivf3al+MqGA+W9yrT2+v51NtXh4MujAE0XppCiw8O+UOGNmrVfjCZEQLaKVeo
	B+pFgC8Jtr4Wasx8z0zpQf7j+aBCAnkt3zEdcswRiEhxNKmAwmQaqSkDQCcfNb/5
	gyRF4RyvvmflHQoGoAuutgDqaX+945dnEbDvVAd/h+IEJq5HdiE5MQfwlDjl1r0y
	kxElj8jIzgmoF3/lD9/+eJOHAgqrz2ep5Izim97JWICVKwwLcKy9iB01NB3eT0JK
	SzTFcQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1j1nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:41:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477fKrI021515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:41:20 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:41:16 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:45 +0530
Subject: [PATCH v4 14/25] media: iris: Skip flush on first sequence change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-14-58db3660ac61@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=1283;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=uzOwIM7ifZmWrebOUCMB2ul0UkKRfXkzrcfqkmW8xyw=;
 b=5Vkqe+8CMgYXJE64Rv5xeE9Eoh96Sm5NIa02fCpKZYTuzkI7O3YMbnPLdbuMypdZWcICAcf1H
 jYThBwYzItAChwtCeAKAiiJR4fKtFj43GIpDEvM9/kuhRq3tVfUPPY+
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HIJoK5hU_g-ucz4rY8IOpvQ9WLn4SyTf
X-Proofpoint-ORIG-GUID: HIJoK5hU_g-ucz4rY8IOpvQ9WLn4SyTf
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681b0ea1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=PmrpfJqh8gS3DHDx6swA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX9PiGA6ah04JM
 /VwO88eZcfnwqiSLr8zljZSxepS0Vv1VU9ni4/WmWD3IZokq9+MjsPr59lteK3zsGDDiVESulrB
 BS7a2UppD5IbiHeSvoAEU5XouRuHRfyxY5h4KAWtpDNGiyZtKzr082SMnmpBf+tn+Utjty97uxq
 2d3iZGm3XtbHSBtrczuQe19B4jZawJqP623evIXJWYqsz+H5Yl/V8jS83+EfdbUThxhF1HZWndR
 bIa3WrgSzVecIEPc92MBdyTE+5YtsKr2EVg37oFbuaU1hWBjkKNuzkdf+3azWBv+AqIkKOLIFAq
 EeLCzaeaMJgOBXBV5K/zbSw7dffGArW4ur5sMnoARCxh+bWdtz1Exr4Q3/jE+WZdOrYFFq8HFvk
 tJYgsqbw758ksTmM1e3ykpfvBU2FX8zvxl+vwf8lXwQB04RTbeOVXgb2LGJJ54ja9a5V19RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=836 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

Add a condition to skip the flush operation during the first sequence
change event. At this point, the capture queue is not streaming, making
the flush unnecessary.

Cc: stable@vger.kernel.org
Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 271e1446922311e2be6b7b2f9b68e26fa14ead9c..aaad32a70b9ecba94b4c3bfadd8687db7d22a5b4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -200,7 +200,7 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
 
 	iris_hfi_gen1_read_changed_params(inst, pkt);
 
-	if (inst->state != IRIS_INST_ERROR) {
+	if (inst->state != IRIS_INST_ERROR && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
 		reinit_completion(&inst->flush_completion);
 
 		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);

-- 
2.34.1


