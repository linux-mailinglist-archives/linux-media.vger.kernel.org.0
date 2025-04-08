Return-Path: <linux-media+bounces-29637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CEAA81115
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C73868A1807
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D365022B8A1;
	Tue,  8 Apr 2025 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j4EzQvIW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0BB22D782;
	Tue,  8 Apr 2025 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127698; cv=none; b=q/AT4HJm5oJuottPR6mRqqTYCvOUYs5+i93LQSzVt040VZaT+xUIajaFf2QINinkuL9c55jik3OCqjZWxz+iqMkJATRKTNyjQkf5LL4JLgtBQLwag+jes9roZKlrOMPfqLZYyOu6Ni4hsA6UDq7H6yZUv0wPhNG90J19P+iA+54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127698; c=relaxed/simple;
	bh=Tq1gxDCGVRHC4kymkmPVoYLqEcxaF/cbk7FM/AGb4u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=N7Gp81zwqKNZYIDP8NvycIbtjKmZLHZwRrU559VBAqpqv04R9k3+ov1JkDOh/ikhjqO4sn8jveMtfd0TwS9hjBRtqitjWut4SbqTSiYgy0En09i8ttIqQGPtHGdGweS+GFjqdSrVwhUGoXmXc8jozDTght7cM0+MCXvdGBBOlmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j4EzQvIW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Bc9kP020149;
	Tue, 8 Apr 2025 15:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAdr3LJfNJ0XAzn1GQAU++nSFRjXZXsRNBv5IsB57o0=; b=j4EzQvIWe0ngoZq/
	crz5JO+LOUOXQVPwOjbrE5MOxLI+xCAw3P8DUINF9KAkwsj1pcopjFYLmeEE1EA1
	hzcML4Ss0zKti/KWJ0QDOuouJtKI0DbRqQew2TAdTatbRdF+1mBc59kQTCTsyhe8
	tSdpL3v5oBUdlsyGaDHe3c4b8k9UyUgzQhP4B+5hhL6YljAbgcNd7YF9FLzgxXFB
	WOjyg8SX8e/KM6geQI8xjXjMQVYwAx0aM0HrsFeC/2HS8wx0lN1zLlfOOQt72oEQ
	SP84HnaIV/+OsEf4tJTK4jDcg6eV2RI2OX50XRmsDGIHI4A7brP9UJhc5190G/kw
	vN7RgQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2rahp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:54:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538FsjxE015532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:54:45 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:54:40 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 8 Apr 2025 21:24:15 +0530
Subject: [PATCH 01/20] media: iris: Skip destroying internal buffer if not
 dequeued
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=1178;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Tq1gxDCGVRHC4kymkmPVoYLqEcxaF/cbk7FM/AGb4u8=;
 b=9uRskaTDKuAYa3CMMamJxebmZxjW+M659DacEBFPHYCTHhp14kNs/Qg3rrzEaBQ57ndkIYNx6
 tWYEVsD3Oa9CyzKmz1INKQVu+6/K1GvAdsq7Pb15X/0MnKGKFaZgEo3
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FD13x1GUJo46yoz6n6unv4a02mT0Z0q_
X-Proofpoint-GUID: FD13x1GUJo46yoz6n6unv4a02mT0Z0q_
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f546c6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=koQBp3Y6DNsLUkExdoYA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080110

Firmware might hold the DPB buffers for reference in case of sequence
change, so skip destroying buffers for which QUEUED flag is not removed.

Cc: stable@vger.kernel.org
Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index e5c5a564fcb8..75fe63cc2327 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -396,6 +396,13 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
 	for (i = 0; i < len; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
 		list_for_each_entry_safe(buf, next, &buffers->list, list) {
+			/*
+			 * skip destroying internal(DPB) buffer if firmware
+			 * did not return it.
+			 */
+			if (buf->attr & BUF_ATTR_QUEUED)
+				continue;
+
 			ret = iris_destroy_internal_buffer(inst, buf);
 			if (ret)
 				return ret;

-- 
2.34.1


