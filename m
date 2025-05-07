Return-Path: <linux-media+bounces-31898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C523AAD892
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D1E3A62CE
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A091E3787;
	Wed,  7 May 2025 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kh+2IXZ4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1D921FF58;
	Wed,  7 May 2025 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603636; cv=none; b=hvA0ifbbGgg2iGEw+Q51FI/iIR0rac247celUn8qQB3I4zBQ8OK9CfCi9DANtoEMUy+9tT67akSqHyhl7TTBYtK0xzojULGPr0KWVbZd3/HsXWcchjtrJDraFv5oMLku5LtUuQVso+XmtIdBgz6hRe9LdhBNjBvHB9iygeU5Yo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603636; c=relaxed/simple;
	bh=MQB45bUMMK6m9exe+3C/zb7oCFReqfFVxFPe3fLTjZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=M5yCV/4g7Pz3jw4M1c3SloeFiwu998FgIw7c5Ii1O0VVAzK5eZRc32vYEJz6t36+66TKWjh8rIxNxHhSQ4eM5XN6U5uPUF/5vzdvUcO6bLa7uYq/vWGTd2wR2Z23i34sEJ9SoDVLHqRe/lGmWEpc1ikgF1U8OjyEthHM351VE7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kh+2IXZ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H2V7024523;
	Wed, 7 May 2025 07:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rH8zUBtGBuU/yQie22TZxwWP5aOOnDBi86eXlbjD88M=; b=kh+2IXZ4W+mI6Dxn
	P8s784xBwmsyUdFOPJ1yIgyPY95dYWCuJ5MzqFVsI2BMNhRkae+pikSznTY/KfG/
	muvNVIyi0nslGXcAlvIdlJAM5vbAnIM0bCc3vPjjTGZJZuyQE4Hg6CH168dKaniX
	o3jfbxYlAtOJfmndMzfpLIkx4FT2LUVyxkGE+GrwLynZBc2iZoaXnVtp8y74fFtv
	+M57fLJwK+197fubv6wNE/br6ux7isbjaSap2nAdMuIZ9iEvKLZeDbJT4sd97Yxp
	0268bJkV5GFGF7wsX8gvB5Px+nf4EfTxx7q5Zp74CSlhHvba2IW7tJwrQSzWVc4D
	DxenWw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3cuac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477eUjm005823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:30 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:25 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:34 +0530
Subject: [PATCH v4 03/25] media: iris: Avoid updating frame size to
 firmware during reconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-3-58db3660ac61@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=3301;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=MQB45bUMMK6m9exe+3C/zb7oCFReqfFVxFPe3fLTjZs=;
 b=Kb0hHkfnamLc/W4e+R+dtEVnMqD5JTiqanQEZtkf7LccpKMA2+oqtwQUDM6DdytrqBI3rnDac
 U0PiPyQ4ziBABjO96zN9uf7Ck+FiW1J8j4DDQbcMMUG2+r3RvA2ZzdB
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX/dckkb7VFAud
 pY9T3cJEOd4ezVNEyeh/pnW2jyPDfq0ZpN4Ju85y/OnPgKfw5/g5jbenEsuFcP0Lg1TjjfEk7+4
 g5HDLSWqh2b/PNZN04crw2LwBTrkSayyl/buwl9WilIH1zTTR+cTRoVE7CelNdAaYnTNgclfPmh
 GtxXGjPVLPIQkWVqTT4bD5LF/J7ig5S/Nk+2mlE1VgBKCm/A97TUntrobmmC2hxSYfoqTC6xOeu
 PQaEYZmY5329v0xaK8dHHXmx1gXMna+WAWjdaV1KJRyo0VnyETBUItYqmreGgSva2vKM6Xr8a9H
 A41Fu/hyf+kBehWErSBa75HIg7Qx6jl/A1XPhk2O4q9yFYxWg5y3ouZe2RPAA0P36f+O87IMKh6
 FDjRz4lLGzJDVnhxAbchrOP8+QRuRlpF8XgUk1wHNIEVbXrERNrxIlXZvCJsog4e+lpQhrZ6
X-Proofpoint-GUID: h3rj46UgHXwEecVchVGZpAn8Gkh9n7mM
X-Proofpoint-ORIG-GUID: h3rj46UgHXwEecVchVGZpAn8Gkh9n7mM
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681b0e6f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=E3BzaMTQMFddoOmk_uQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

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
index 64f887d9a17d739cc404d83f1185dec5742c273b..2a86c27443eaf2e65eef8ec1bb89545fbd5ffa50 100644
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
index 5976e926c83d13ad06cd17bb9eefc31d532b2da8..104e1687ad39dab93ff66450ba3a97c309b1e1e1 100644
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
index 78c61aac5e7e0e1c7ee6d3fb6f9b121b61481a2f..e718386dbe0402417f408d8fc696a33e5c7f23b3 100644
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


