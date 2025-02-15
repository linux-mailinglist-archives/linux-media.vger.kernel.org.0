Return-Path: <linux-media+bounces-26176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F7A36FB4
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 18:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 078DE3B08A7
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 17:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284331EA7DE;
	Sat, 15 Feb 2025 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qz9HLoz3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD713AD18;
	Sat, 15 Feb 2025 17:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739639995; cv=none; b=hm6GNEx7B8guTnBhGS/hjT9IdnKRTJHDERpsnwNUwPBlyKE86zschHhCm47+MtXekXjFLPULJpob+vn5QDwGsEsw3VqDMocKP+eilJL+ug29iTVT/mmKxBufbGqsHsbJf+KqNhAexHyg8WkHKpml/EqJlA/ZvwPswfhHD7ItseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739639995; c=relaxed/simple;
	bh=dgjjcElggPgENOE5K+FmF3RMIRI4v6bMx/P0WZrYpHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Cbn1zMnyBa/yA/3T9pUAO5Xl+wya9XvRsybHQCN9YoUZ4gcs53NEl9myVml8DLle2WdFB+rg3wWDEbcuKVDQJSdKfR5+awdpxFjc3siEyIY0b5dcLesW6n0viHLmPmVIDNZICVw/GwU/aJ935SFT/ZnAIWn+ol+vizKtlLChoBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qz9HLoz3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51FFeJvC008578;
	Sat, 15 Feb 2025 17:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTzoMuMga7c1Y3uPllqCLVcDt0Tf3o5KT/N4Kzz+848=; b=Qz9HLoz33dI5aPXc
	YHfMTLGBXOe4NayIZ2GLjL65500kPJYYH2eNUmu+qU7hBs0ONweQqMRTb7+bvIZv
	xmtoDcwbPuPc8nbS5ee76dAoq4IX4hpsutP7r5tK3PY2uBbmsKE2wjucoAeB8uw6
	2Cz0gODvIXr7PhHk2rFigyA7sae+o7/0RbbB8h+UINJ7o6d7J4DrmojvrhVQkr/3
	YINBQ7wQkDFrF0LSJY381CvKkp11kjJJ9uzuWLAog7DP5uHgXz+4dn/Pa93gH4fa
	kYrUQY9GXN3Nibwg1aa0wWOVEm4j5EgycmUUqQQZLtG2B427GsTo5ZMiT2nMgNFg
	IuQ0PQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44tkqp0tsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 17:19:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51FHJm6J029895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 17:19:48 GMT
Received: from [10.213.96.105] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 15 Feb
 2025 09:19:45 -0800
From: Vedang Nagar <quic_vnagar@quicinc.com>
Date: Sat, 15 Feb 2025 22:49:33 +0530
Subject: [PATCH v2 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250215-venus-security-fixes-v2-2-cfc7e4b87168@quicinc.com>
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
In-Reply-To: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739639980; l=5721;
 i=quic_vnagar@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=dgjjcElggPgENOE5K+FmF3RMIRI4v6bMx/P0WZrYpHQ=;
 b=6jBDcN4z/5kbnp8zXAd6EMVRt8LTVnxYvHTjl/6k+rZ7ufbG9fYDlGYXJb/YViqZaqUnHUHJN
 BNdgij2rkBHBg3gMGfJ7uHdI7nxjNqF35SrpF7bEo64DJ6hG9akZDIM
X-Developer-Key: i=quic_vnagar@quicinc.com; a=ed25519;
 pk=GHqLT8NPue4v+CDHbZork8Ps39CBHq345GQKvCZ1glE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 01G6tNkdijn1JYegA01XdiS5FEUR6ef8
X-Proofpoint-ORIG-GUID: 01G6tNkdijn1JYegA01XdiS5FEUR6ef8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150153

num_properties_changed is being read from the message queue but is
not validated. Value can be corrupted from the firmware leading to
OOB read access issues. Add fix to read the size of the packets as
well and crosscheck before reading from the packet.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 72 ++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 0a041b4db9efc549621de07dd13b4a3a37a70d11..2ad60a3fbfe0286de09a44664fc3b30259aa0368 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -19,6 +19,16 @@
 #define VER_STR_SZ		128
 #define SMEM_IMG_OFFSET_VENUS	(14 * 128)
 
+static inline int increment_data_ptr(u8 *data_ptr, u32 *rem_bytes)
+{
+	if (*rem_bytes < sizeof(u32))
+		return -EINVAL;
+	data_ptr += sizeof(u32);
+	*rem_bytes -= sizeof(u32);
+
+	return 0;
+}
+
 static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 			      struct hfi_msg_event_notify_pkt *pkt)
 {
@@ -33,8 +43,8 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 	struct hfi_buffer_requirements *bufreq;
 	struct hfi_extradata_input_crop *crop;
 	struct hfi_dpb_counts *dpb_count;
+	u32 ptype, rem_bytes;
 	u8 *data_ptr;
-	u32 ptype;
 
 	inst->error = HFI_ERR_NONE;
 
@@ -56,66 +66,108 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 	}
 
 	data_ptr = (u8 *)&pkt->ext_event_data[0];
+	rem_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
+	if (rem_bytes - 4 < 0) {
+		inst->error = HFI_ERR_SESSION_INSUFFICIENT_RESOURCES;
+		goto done;
+	}
+
 	do {
 		ptype = *((u32 *)data_ptr);
 		switch (ptype) {
 		case HFI_PROPERTY_PARAM_FRAME_SIZE:
-			data_ptr += sizeof(u32);
+			if (increment_data_ptr(data_ptr, &rem_bytes))
+				break;
+			if (rem_bytes < sizeof(struct hfi_framesize))
+				break;
 			frame_sz = (struct hfi_framesize *)data_ptr;
 			event.width = frame_sz->width;
 			event.height = frame_sz->height;
 			data_ptr += sizeof(*frame_sz);
+			rem_bytes -= sizeof(struct hfi_framesize);
 			break;
 		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT:
-			data_ptr += sizeof(u32);
+			if (increment_data_ptr(data_ptr, &rem_bytes))
+				break;
+			if (rem_bytes < sizeof(struct hfi_profile_level))
+				break;
 			profile_level = (struct hfi_profile_level *)data_ptr;
 			event.profile = profile_level->profile;
 			event.level = profile_level->level;
 			data_ptr += sizeof(*profile_level);
+			rem_bytes -= sizeof(struct hfi_profile_level);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH:
-			data_ptr += sizeof(u32);
+			if (increment_data_ptr(data_ptr, &rem_bytes))
+				break;
+			if (rem_bytes < sizeof(struct hfi_bit_depth))
+				break;
 			pixel_depth = (struct hfi_bit_depth *)data_ptr;
 			event.bit_depth = pixel_depth->bit_depth;
 			data_ptr += sizeof(*pixel_depth);
+			rem_bytes -= sizeof(struct hfi_bit_depth);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT:
-			data_ptr += sizeof(u32);
+			if (increment_data_ptr(data_ptr, &rem_bytes))
+				break;
+			if (rem_bytes < sizeof(struct hfi_pic_struct))
+				break;
 			pic_struct = (struct hfi_pic_struct *)data_ptr;
 			event.pic_struct = pic_struct->progressive_only;
 			data_ptr += sizeof(*pic_struct);
+			rem_bytes -= sizeof(struct hfi_pic_struct);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE:
-			data_ptr += sizeof(u32);
+			if (increment_data_ptr(data_ptr, &rem_bytes))
+				break;
+			if (rem_bytes < sizeof(struct hfi_colour_space))
+				break;
 			colour_info = (struct hfi_colour_space *)data_ptr;
 			event.colour_space = colour_info->colour_space;
 			data_ptr += sizeof(*colour_info);
+			rem_bytes -= sizeof(struct hfi_colour_space);
 			break;
 		case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-			data_ptr += sizeof(u32);
+			if (increment_data_ptr(data_ptr, &rem_bytes))
+				break;
+			if (rem_bytes < sizeof(u32))
+				break;
 			event.entropy_mode = *(u32 *)data_ptr;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
 			break;
 		case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
-			data_ptr += sizeof(u32);
+			if (increment_data_ptr(data_ptr, &rem_bytes))
+				break;
+			if (rem_bytes < sizeof(struct hfi_buffer_requirements))
+				break;
 			bufreq = (struct hfi_buffer_requirements *)data_ptr;
 			event.buf_count = hfi_bufreq_get_count_min(bufreq, ver);
 			data_ptr += sizeof(*bufreq);
+			rem_bytes -= sizeof(struct hfi_buffer_requirements);
 			break;
 		case HFI_INDEX_EXTRADATA_INPUT_CROP:
-			data_ptr += sizeof(u32);
+			if (increment_data_ptr(data_ptr, &rem_bytes))
+				break;
+			if (rem_bytes < sizeof(struct hfi_extradata_input_crop))
+				break;
 			crop = (struct hfi_extradata_input_crop *)data_ptr;
 			event.input_crop.left = crop->left;
 			event.input_crop.top = crop->top;
 			event.input_crop.width = crop->width;
 			event.input_crop.height = crop->height;
 			data_ptr += sizeof(*crop);
+			rem_bytes -= sizeof(struct hfi_extradata_input_crop);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
-			data_ptr += sizeof(u32);
+			if (increment_data_ptr(data_ptr, &rem_bytes))
+				break;
+			if (rem_bytes < sizeof(struct hfi_dpb_counts))
+				break;
 			dpb_count = (struct hfi_dpb_counts *)data_ptr;
 			event.buf_count = dpb_count->fw_min_cnt;
 			data_ptr += sizeof(*dpb_count);
+			rem_bytes -= sizeof(struct hfi_dpb_counts);
 			break;
 		default:
 			break;

-- 
2.34.1


