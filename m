Return-Path: <linux-media+bounces-27596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC517A4FC9E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93D633B0164
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10D322759C;
	Wed,  5 Mar 2025 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AelMkM7G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BB0221F2D;
	Wed,  5 Mar 2025 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171497; cv=none; b=ladP/qAKNwPzt4sduAMKbNpX+uxW6Gm3ZZM4LjUEp5KOjHRqNPVRwPVoIjS6E9Ov5lrGDop2DhO76k9fvPMU5QEJoatYTjeZc0k1A1QX01oSjgvKXHAwe0V9RRRrS8hCeoh3elQClSSyD/qvG2ALIDV8PRiHwnn7fDr2+nFRQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171497; c=relaxed/simple;
	bh=3Synh7M/cstbEQ7pm66YKpTXPHYny0ns9J+wevosxOQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWpAHRBdivzIKjuHnbiURwyaHRSN8LjALearr1CsgjspVWleHsf4jFSfWh1yLUuM+d/pAsRoQVgVJlHoT1tYRyb1P5s6lvtRl4de95jJhWohh3BPN+nteflE7qDY4lE/vOtGPI9UXgSWr+A3qD2yERiNf8M7hOIpAU6tXuZ7+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AelMkM7G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NAYwI030419;
	Wed, 5 Mar 2025 10:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+H8tMl9Dc4ZXJKreFqOfTcD5P3+8jIEJFObStWAYdIY=; b=AelMkM7G6cpNTDuO
	Rs5vlVrd22TM9w9+Hc6RnszpchcH5GfVN56Lr5ixbd3ikN0GFI+6mAfqYhDf5QvN
	OVMyu/XsDH5CenPgrkUvLMkuTNpzGMuLz8hbODJR4oBCHy3v7I76W/bVZFHZQbEb
	WGrfKJvI4/94iblEXwPhxieavDeOJA9G5iH8jF3drZ5bvYnfdBAXsY5I3BfvFdSJ
	nQVU+DL/+LhchYieLwCginl+4+rm9wWbA2AHLQ6A7lcu7rtNIt6sr5U0fbVO+YfI
	vcmOJuDtlkVQWFyKDYl/CDBLKUOOkya3/DF+Vz7HqxA1Y5NIqBbvL+i25NYJoxF+
	EWxPiw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vcyjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525Aio2o006560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:50 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:47 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 08/12] media: iris: Avoid updating frame size to firmware during reconfig
Date: Wed, 5 Mar 2025 16:13:31 +0530
Message-ID: <20250305104335.3629945-9-quic_dikshita@quicinc.com>
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
X-Proofpoint-ORIG-GUID: X5MTvH0vqJTIJzoTD9E-IEDcXLjE2TnH
X-Authority-Analysis: v=2.4 cv=bPnsIO+Z c=1 sm=1 tr=0 ts=67c82b24 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=zvpBKIUlNp06I66NV7IA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: X5MTvH0vqJTIJzoTD9E-IEDcXLjE2TnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

During the reconfig, firmware sends the resolution aligned by 8 byte,
if driver set the same resoluton to firmware, it will be aligned to 16
byte causing another sequence change which would be incorrect.
Fix this by not setting the updated resolution to firmware during
reconfig.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c    | 15 ++++++++-------
 .../platform/qcom/iris/iris_hfi_gen1_response.c   |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h  |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c      |  4 ++++
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index a160ae915886..d5e81049d37e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -562,14 +562,15 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst)
 	struct hfi_framesize fs;
 	int ret;
 
-	fs.buffer_type = HFI_BUFFER_INPUT;
-	fs.width = inst->fmt_src->fmt.pix_mp.width;
-	fs.height = inst->fmt_src->fmt.pix_mp.height;
-
-	ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
-	if (ret)
-		return ret;
+	if (!inst->in_reconfig) {
+		fs.buffer_type = HFI_BUFFER_INPUT;
+		fs.width = inst->fmt_src->fmt.pix_mp.width;
+		fs.height = inst->fmt_src->fmt.pix_mp.height;
 
+		ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
+		if (ret)
+			return ret;
+	}
 	fs.buffer_type = HFI_BUFFER_OUTPUT2;
 	fs.width = inst->fmt_dst->fmt.pix_mp.width;
 	fs.height = inst->fmt_dst->fmt.pix_mp.height;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 91d95eed68aa..6576496fdbdf 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -155,6 +155,7 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 		inst->crop.height = event.height;
 	}
 
+	inst->in_reconfig = true;
 	inst->fw_min_count = event.buf_count;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index d8f076936c2b..625325f7f9b0 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -43,6 +43,7 @@
  * @tss: timestamp metadata
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
+ * @in_reconfig: a flag raised by decoder when the stream resolution changes
  */
 
 struct iris_inst {
@@ -74,6 +75,7 @@ struct iris_inst {
 	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
 	u32				metadata_idx;
 	u32				codec;
+	bool				in_reconfig;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 16ae83948076..d5127d88d103 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -453,6 +453,8 @@ static int iris_vdec_process_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->in_reconfig = false;
+
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
 
@@ -544,6 +546,8 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->in_reconfig = false;
+
 	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
 }
 
-- 
2.34.1


