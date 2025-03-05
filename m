Return-Path: <linux-media+bounces-27598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF1A4FC9A
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0128E7A1AF9
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8486C22D7AF;
	Wed,  5 Mar 2025 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RuQPD4+1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B89D22AE6B;
	Wed,  5 Mar 2025 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171501; cv=none; b=na5s+N5OsKLwa8dbnio0ukbP0sahG2ZkPXoDlliZW7zQ7egqIR4YtyTudgMWc2QdSqY4q52c9y6ojm2g7FDOGMmq6J3/dZMkVxk03z18bcHuKSnF97QihtOt+JsLIrfktiVKDmriAEtPleUJ3KlxZFWGgl6HyGIrv6wD596Tna0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171501; c=relaxed/simple;
	bh=J2tezvAV6uiTc8ynP6wMM660R8FTuVVq8z2hquy/5uo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TArVHaBZmZX95xpI8Lklyq4bT1LGBAMmY0OqU12khI8trBKy/pUHntgt9pw3fi2vj7t4lCpotl4rwAuLumx1IfDjQ384+yoH/fYEBqe2rs+IT2VUrPHX8QvIQYXOVlvP0VFOo8QHRUjiUBft36OQJxNSK52vYK10HnI2uQk8udg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RuQPD4+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525AVYAg021601;
	Wed, 5 Mar 2025 10:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	usHjEvU4/IVQc+3PZuo9Zuxq03rTtW6kefKUwkBLTSc=; b=RuQPD4+1Fitwybi2
	OTMplkL1EhF/o7rZOSIhViraRkfSC3psN1YvugiIHe7y5tLCWVNmpYY6u48KNbc9
	qg9oQKfQDlQARI+4G+x7WE0L7HdxHli/HCwWF5b9t8N7qDua95x/jG9IIgxl3Kj0
	8NmTRtlUstDg2gz4BWSfNFgId/KBfNCCbAoNUmQ5kLAO4oQM4Zs9AqIlg0rViagr
	D7K77ATOHe4L+aO8dg8kieXOkQQ+sZWGzAfSGbwTMIrOyxGDB6UsyHxWuNNK1115
	Ew95Pc7Ez6f3Dt+e91TE0/ywL+YNrjCs3x2LTFV3qrc2PNFQaQQK9myY5X7kyY9R
	cqxdug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t530g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525AiuXK013849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:56 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:53 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 10/12] media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
Date: Wed, 5 Mar 2025 16:13:33 +0530
Message-ID: <20250305104335.3629945-11-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R1D73TdsmQMUTv-twtGz4ln-YoOYTjX0
X-Authority-Analysis: v=2.4 cv=P5XAhjAu c=1 sm=1 tr=0 ts=67c82b29 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=nmLn8oLEv6AdYNmoJw4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: R1D73TdsmQMUTv-twtGz4ln-YoOYTjX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=746 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

Firmware sends buffers with 0 filled length which needs to be dropped,
to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
Also make sure:
- These 0 length buffers are not returned as result of flush.
- Its not a buffer with LAST flag enabled which will also have 0 filled
  length.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 6846311a26c3..bb0ecb79fc24 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -377,6 +377,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
+	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
+	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
+		buf->flags |= V4L2_BUF_FLAG_ERROR;
+	}
+
 	return 0;
 }
 
-- 
2.34.1


