Return-Path: <linux-media+bounces-24242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2CCA0129A
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 06:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B3721884BE5
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 05:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C95155C9E;
	Sat,  4 Jan 2025 05:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CDUqlMFf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89F914C5AA;
	Sat,  4 Jan 2025 05:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735969326; cv=none; b=OKuavx+oqungoGbOAVX6SfNDlHvMrN5Q1/7NevJ8HrcPH7iM/4yd8XhSJZQ/xec7skxwhumZciQiBmamZjSb+tCuJnoTB5YczPULpfzb26TLqTXqKJ+Idp2T7gbk7Hc8XwyR+TCKeRooSCSTiqWO5tRV2GzzvUywiL/TeMtk/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735969326; c=relaxed/simple;
	bh=LAsSTmvz3OtcE8QURJk84GGff9I5n58G3Sh+J6ZZiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fVGxPYB/Nj8OoNTHAIyhEIN2JMtHBaxowX787V/6qYxGeZUyWIHbTBTYJS8z0Ks6RI/AOFRz+r0idMmSll7/XYs6cbfSpg7ScsdtKThfVdAUh11q5YZK2F6LtKfDinNaw04w1Td54f/RCWZidwOdXh1dwgkTy0PU1fjEWriZ8BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CDUqlMFf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50446OcB027086;
	Sat, 4 Jan 2025 05:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q47ygRB0QOW3cDcv/BaoQWclltakKDao79RZaI8CKos=; b=CDUqlMFfMQCtISJy
	qHlMz7uNVGZ4pLkr5N3ofhHJvWjcY0ATbtbvt+GcPt4N4iB6l/K6+RdHih1q6B6B
	L4yysVuTLYtZu+f7asI0qkTUKYrXr7Noqv/wNVBjiXt8xvESclZCcYGrBqfm/nn6
	tgBJRqMies9cO+bl+QAaiONWTWUXykKXvMaZTy4aeC1nE6ca6+acF5q8NVr6YOAL
	wChbLDLUYoWaDDhsSYZSSGokAAzYwfywW1va/j+qALpnNlBKnfFt1Cs9sMbnorrC
	ehZriRMUq3GnRAQSk7hnzVvHEBPLw2s0T34sQSt4wovjjfFf3U/IWjFkVIHOg6Qm
	C0hz2Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xvaf888a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 05:42:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5045fxRo015157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 Jan 2025 05:41:59 GMT
Received: from [10.213.96.105] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 21:41:57 -0800
From: Vedang Nagar <quic_vnagar@quicinc.com>
Date: Sat, 4 Jan 2025 11:11:37 +0530
Subject: [PATCH 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250104-venus-security-fixes-v1-2-9d0dd4594cb4@quicinc.com>
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
In-Reply-To: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735969311; l=5411;
 i=quic_vnagar@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=LAsSTmvz3OtcE8QURJk84GGff9I5n58G3Sh+J6ZZiQQ=;
 b=BftFox6NwC+krArDlM4Wye0+z6AD8ZZreLCPTy3F+v5ZwuFgsmbcOoRVsZTPS9T108Lhg9Ykz
 /MzQ1P8ly9YA7YI+62DF+TlfCuUqGVpSPsadg+/7Egozbku0hkfrMVO
X-Developer-Key: i=quic_vnagar@quicinc.com; a=ed25519;
 pk=GHqLT8NPue4v+CDHbZork8Ps39CBHq345GQKvCZ1glE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TzbKJfqyoc-Lhin4Pvj4TVTqOYGhM2FF
X-Proofpoint-GUID: TzbKJfqyoc-Lhin4Pvj4TVTqOYGhM2FF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1011 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501040046

num_properties_changed is being read from the message queue but is
not validated. Value can be corrupted from the firmware leading to
OOB read access issues. Add fix to read the size of the packets as
well and crosscheck before reading from the packet.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 62 +++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 0a041b4db9efc549621de07dd13b4a3a37a70d11..3fff21ea744b0171e204dd0851fc46cb468e1979 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -33,8 +33,8 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 	struct hfi_buffer_requirements *bufreq;
 	struct hfi_extradata_input_crop *crop;
 	struct hfi_dpb_counts *dpb_count;
+	u32 ptype, rem_bytes;
 	u8 *data_ptr;
-	u32 ptype;
 
 	inst->error = HFI_ERR_NONE;
 
@@ -56,66 +56,126 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
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
+			if (rem_bytes < sizeof(u32))
+				break;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_framesize))
+				break;
 			frame_sz = (struct hfi_framesize *)data_ptr;
 			event.width = frame_sz->width;
 			event.height = frame_sz->height;
 			data_ptr += sizeof(*frame_sz);
+			rem_bytes -= sizeof(struct hfi_framesize);
 			break;
 		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT:
+			if (rem_bytes < sizeof(u32))
+				break;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_profile_level))
+				break;
 			profile_level = (struct hfi_profile_level *)data_ptr;
 			event.profile = profile_level->profile;
 			event.level = profile_level->level;
 			data_ptr += sizeof(*profile_level);
+			rem_bytes -= sizeof(struct hfi_profile_level);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH:
+			if (rem_bytes < sizeof(u32))
+				break;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_bit_depth))
+				break;
 			pixel_depth = (struct hfi_bit_depth *)data_ptr;
 			event.bit_depth = pixel_depth->bit_depth;
 			data_ptr += sizeof(*pixel_depth);
+			rem_bytes -= sizeof(struct hfi_bit_depth);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT:
+			if (rem_bytes < sizeof(u32))
+				break;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_pic_struct))
+				break;
 			pic_struct = (struct hfi_pic_struct *)data_ptr;
 			event.pic_struct = pic_struct->progressive_only;
 			data_ptr += sizeof(*pic_struct);
+			rem_bytes -= sizeof(struct hfi_pic_struct);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE:
+			if (rem_bytes < sizeof(u32))
+				break;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_colour_space))
+				break;
 			colour_info = (struct hfi_colour_space *)data_ptr;
 			event.colour_space = colour_info->colour_space;
 			data_ptr += sizeof(*colour_info);
+			rem_bytes -= sizeof(struct hfi_colour_space);
 			break;
 		case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
+			if (rem_bytes < sizeof(u32))
+				break;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
+			if (rem_bytes < sizeof(u32))
+				break;
 			event.entropy_mode = *(u32 *)data_ptr;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
 			break;
 		case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+			if (rem_bytes < sizeof(u32))
+				break;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_buffer_requirements))
+				break;
 			bufreq = (struct hfi_buffer_requirements *)data_ptr;
 			event.buf_count = hfi_bufreq_get_count_min(bufreq, ver);
 			data_ptr += sizeof(*bufreq);
+			rem_bytes -= sizeof(struct hfi_buffer_requirements);
 			break;
 		case HFI_INDEX_EXTRADATA_INPUT_CROP:
+			if (rem_bytes < sizeof(u32))
+				break;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
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
+			if (rem_bytes < sizeof(u32))
+				break;
 			data_ptr += sizeof(u32);
+			rem_bytes -= sizeof(u32);
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


