Return-Path: <linux-media+bounces-40355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C034B2D7A7
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A0E8721F68
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E582DBF75;
	Wed, 20 Aug 2025 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J93od+gK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52D22E2DC5;
	Wed, 20 Aug 2025 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680883; cv=none; b=e8mxvy4iOjKfaUvLLa6WjyHst5PX2i/7sL/t0E7JnRwp+cFB6s0yw7bUCVhLwHaysu75CoPGbCK3UJE+KECQ5RAdArFbByXYgEtO2s/WQnJIirOkv6S09JN4RDYAUtdSLaGpcd445wEAJDj7uEnjubtbcAmz6+Tn64FBziaReo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680883; c=relaxed/simple;
	bh=9zW8qJ2bfi8gb0Ua6KM6MHtq/FKluqImqYFhNwezn4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=I5KP0xSceB+kUdtHaUTljHZHIB2Dp2NU0fBwyiR6JSWm0CiBEXmcWxIrYe2pSeir8unLNGHKy6Go873ADvSYmLC4pu7c4SNAPqbxd1E3AjyXEz5alnCk6a5isjOn/R5RKNy+vzk5TQkh/OtSdq4ZzzhVSbh/soGdzzgprSAuD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J93od+gK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1onCj002700;
	Wed, 20 Aug 2025 09:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0nV9fk8nIsuqGOyi6FsD+wSU9mtOJ6TpCsUatAm7NA=; b=J93od+gKGmEGGQFA
	2IKPEharVpti1D1sTZUw9eb6kuSE8w9mzHLko1Tr/dWqPYLjVy4RtsP3LHMYLBHS
	UzJp4qe2wkNQRXBK91JD/lNPqwukZB5If1HJiuq1VNrCA623GG12Yo23tkgFvi3Y
	GLO3IXQUgYCHFXeaJr6/K+gnaZP1L8gQJ1qqinz/cdj+iqlPqdPVgmXJrU1KGgT8
	1fvJ9v4ZwqEmahUbzIDT6z1piEjrxWlQEgH6ACr5+lcA3tsgUyyilFe2Is5DAZJ+
	w0o6a3MqbWeDm/cgJjCP3gH7+fi0RHA915VnsCRmOb9X4dJJPlQxtHFWJqLbjEgW
	IdrTzA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528s3jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:07:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K97t5X025767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:07:55 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:07:51 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:39 +0530
Subject: [PATCH v3 01/26] media: iris: Fix buffer count reporting in
 internal buffer check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-1-80ab0ba58b3d@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
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
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=1399;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=9zW8qJ2bfi8gb0Ua6KM6MHtq/FKluqImqYFhNwezn4A=;
 b=bXRIM89G+LDcAbcSLKirUOLcNn6mqgK6ViIb44XDTkRHZkhH8Xt399F7AgivxV0KYKvXZjoPE
 KeY6U1zPT0FCCPnlnHHlIBnsqs8jO/CTZICyiTbEctLoX9JuCn32nKX
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a5906c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=-BUsXMgqhKYdWNcrEH8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: WJOvsC8mt3EsEjs7h2LSD8oit7z7ABhl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwQSrmzmMK+7J
 MWYM8QroNsvT7nYzgkC5yDrTRcV64ElX/8ir5NpJF4hHxM8lFd7Em4LD2t4Kopdx7JdxWZz7Y/B
 B/XNkAGbmgw8biwAifj2uO6KwbQS5BsauNHywmFlGP2fX6ZD/htNMZyizh/M8gf1OS8GjMUwBs/
 8OWswioGhLNfitiC+xbId0fTbAE8SFAMT4WTfERwDokivI2mLxKltuZ64RUe7nrWkyGKk0PjhpA
 hkzAklt9pJPX2v0d1WXotYhwN3KbvuhU/62B7jm0/vpOxw009yixfdngdgBhzTMJPY+wd5m2Nq0
 NMGuAYOY6miljQd6v4h1ZLUcBGkAx5QB4cbloPgOp24+Dr8K8IFlMKzbbUzZ55oH8duWhf8b7/W
 gz62BakFBd7Sr50Pm+uExgx0CBSW7A==
X-Proofpoint-ORIG-GUID: WJOvsC8mt3EsEjs7h2LSD8oit7z7ABhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Initialize the count variable to zero before counting unreleased
internal buffers in iris_check_num_queued_internal_buffers().
This prevents stale values from previous iterations and ensures accurate
error reporting for each buffer type. Without this initialization, the
count could accumulate across types, leading to incorrect log messages.

Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 541ae86f7892ab7ca89e9d5856ef10d189b2fb32..cf150b32d6c2f9c7e1da7abfd5211fdfc469d96f 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -239,6 +239,7 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
+		count = 0;
 		list_for_each_entry_safe(buf, next, &buffers->list, list)
 			count++;
 		if (count)

-- 
2.34.1


