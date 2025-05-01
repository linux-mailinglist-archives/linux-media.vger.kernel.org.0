Return-Path: <linux-media+bounces-31515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ABFAA63B1
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9727317E1CF
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D0A22ACE3;
	Thu,  1 May 2025 19:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AyKsk4sB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22B8225416;
	Thu,  1 May 2025 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126861; cv=none; b=algiYUK3A+WijV7zNCyjutwVSitL6cPqpG77L6bKOnDz2UPjudp1dP9f1nAK38jDBkj6LGGTc7ry4t+tFelWKW7cJ+G4A32QSe3BEXLrKiMAXiyHgbfxBrbxNZwePsHhJiJu+Z5VWPdmOxI8/F+jqSQob4Gq+a4loZ26c0Y3kd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126861; c=relaxed/simple;
	bh=y165cTa45su+cTeFGOtvZqLTD4r73enD7Rnstvvo/7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NMUpXloGfyYY02GJrRijUh6JTnkB5opKm1OtHFe0rtkFYb0DjwJnwShyB7bwW1wqzl/7zN6/TeaHPo0XPmRzTnIIQqiQxvzSstBcmRzunVypm39U2XRpWEdN1GitkYkiggdp/LTdaAEwl90D/2IVVBAFt02MCGM5dcccJJBU1ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AyKsk4sB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D2GIg019237;
	Thu, 1 May 2025 19:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qluYI5aUPC65mtlu49hOw4lLuMf0QNJdU6hvj5hJhEk=; b=AyKsk4sB/w8Mg/Iw
	rWhwEMzeC6unWIEk2nATacRNyjVQxlmgKGtf0Zg7/Uawiv8ORCTqiSqpNuBIEhc9
	ROUHNclJs87IIS8+JNi07r/LzsL21032dFeZkOk0vFFakKgN5vLmQSlsMNAm6pdE
	xGEYYgPRYCee6cMtLCcMs/FZesgU83U2y37TIv8x5pMwvTjxE9cbtmu8Zgs4ImBm
	FIbI2lyIYrpbbhqD1/jofDUHjVRIdx+FR7P//V/847yc8jisg03+xFcu27mzq3xi
	mzeYEmQS9eEb+EWWYI/8nuAj5FXw+l2idVXSZ34JYjGDq0F3rP8kIidXzEFWxQzl
	ytWyCQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8e45v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:14:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JEDL9014648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:14:13 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:14:07 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:33 +0530
Subject: [PATCH v3 03/23] media: iris: Avoid updating frame size to
 firmware during reconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-3-552158a10a7d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=3133;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=y165cTa45su+cTeFGOtvZqLTD4r73enD7Rnstvvo/7c=;
 b=zeoYKQa2Sxcoe7ElcA0mcTD40Gqh2T8lpsYZbArc7Vwo3dUj6vZlnwXKDnP50++0E1XZ2t1V8
 jK35OIc3UMtBn+n7mS0Nc0rjKa5GApOqiubc90eGU0T3iRzu5JIeG/W
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6813c806 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=E3BzaMTQMFddoOmk_uQA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1tAFtHNYNKyPMYNU3_H3of30htMKJtmv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfXxc4w9AynK/VG eRnUPXIZSEHWAh+37N3BkIXrOM3MVVotJD3rDgT3CFiqzJPHrD+EZtW/naiGF6mEgFQ5GsrbR2q VvZcy0TommwkBjSoA/eZSXhVF7hQsac+RLclgs9BSoOEBXBdRRd5lIHoqsrzfUS+eBn/5UQeeWm
 6zQw+KsB6T/MxEY7bS2MKLcqNgMBou2TVvEEWZyg7CUuMFAS34pZnjpYif5W/a1ZX9HUK9M55cz Bt1vV2rkhiaEu7f2RbI4HcRSe5yIuf5cfhjQi+29k4YMq7tEzimvp3QopWf+G0Db5ntHLPkZ+Az bA8aupFg0FSEPllVNvekNjfrzrFLJnNPBgX6xQvGf+RPlPWZncidRtRevOyheKz7vSJ5Yu11IH8
 E9ON+Us9Q8tkvivFqA/x0wU7ZZihgdxE4EbCuDQvcZnctv7LMH8d6IgRp8l+pNvF6VLv+mck
X-Proofpoint-ORIG-GUID: 1tAFtHNYNKyPMYNU3_H3of30htMKJtmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

During reconfig, the firmware sends the resolution aligned to 8 bytes.
If the driver sends the same resolution back to the firmware the resolution
will be aligned to 16 bytes not 8.

The alignment mismatch would then subsequently cause the firmware to
send another redundant sequence change event.

Fix this by not setting the resolution property during reconfig.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 15 ++++++++-------
 drivers/media/platform/qcom/iris/iris_state.c            |  2 +-
 drivers/media/platform/qcom/iris/iris_state.h            |  1 +
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 64f887d9a17d..2a86c27443ea 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -546,14 +546,15 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst)
 	struct hfi_framesize fs;
 	int ret;
 
-	fs.buffer_type = HFI_BUFFER_INPUT;
-	fs.width = inst->fmt_src->fmt.pix_mp.width;
-	fs.height = inst->fmt_src->fmt.pix_mp.height;
-
-	ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
-	if (ret)
-		return ret;
+	if (!iris_drc_pending(inst)) {
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
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 5976e926c83d..104e1687ad39 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -245,7 +245,7 @@ int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane)
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
 
-static inline bool iris_drc_pending(struct iris_inst *inst)
+bool iris_drc_pending(struct iris_inst *inst)
 {
 	return inst->sub_state & IRIS_INST_SUB_DRC &&
 		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index 78c61aac5e7e..e718386dbe04 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -140,5 +140,6 @@ int iris_inst_sub_state_change_drain_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
 int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
 bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
+bool iris_drc_pending(struct iris_inst *inst);
 
 #endif

-- 
2.34.1


