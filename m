Return-Path: <linux-media+bounces-32491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE8AB6CED
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66236171D54
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B57B27BF93;
	Wed, 14 May 2025 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WMAO7100"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4BC27A930;
	Wed, 14 May 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229925; cv=none; b=icre5RfxaDp2OzKoGuh+cuxnCZEoMnRilzQyNqxZR9spJMn/Np8/9XrcietSnhsWi8zqwPxm6/gYM78f5V1MQI2SQ2zgwukSH9DYGc4dX/Eo8mH4Vb2ByZ8NVLxbf+/hmgr95jXGriYbnw7np923G77pVjHfpfWie1pgHoE8ygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229925; c=relaxed/simple;
	bh=ViT92dV/WX5vPUTLMYfXd1GkGEcFzabpJOsjT+0/cCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NTBZKNRW/NtcW0GtUoRreCltfSbzMnGLnAN1IdjFmB4rzbDvHHGA8agEn2ih1Zcx5mtf65tCvKTPhO1hz4Vf/VY9rQXIXcor+j7W/ng870VrHoyxGJFY4Bs+hoZnS+GMJaZ2KDTrPsI+VaS3FaUVjEytqslCgplRnn+DJ0Vnhvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WMAO7100; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAutGR009068;
	Wed, 14 May 2025 13:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8iOE9eSml9eukOvw4bYaXUY4z+r92F8Bgs9giDrmjM=; b=WMAO710001HqLN0D
	WAH1I9DlTuOYmstAxGeUN6PDO+5K1HvqRT0p8RT3EXYa6riy+yN7yzRSkR5rRHSz
	+zu5KRHyY4d7ufuUVe9E+0Z0TnhMKdJUL5PJrlH5+O5dW/A9hYvau2Zth99RwOJQ
	+yx5a1GXg4rMIlZR/FXWpPfM7Ni5bfyVWGDBT6k6e7enoG+C+w1EcakYIIqK32Kr
	x79JwEYvIjivUwxJLAoaeQRkm1MN8AOx7L/4jXj+fZ3Qklt83btEsiqnb04Hn0Vo
	RyCoo2l/i1lUn3m0OifEr8cXvnBEeIB39MGuQD/NZrycnZ6I0lvj7Y64iKw37jg1
	Oq95FA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcptu4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:38:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EDccaK001546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:38:38 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 May 2025 06:38:35 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 14 May 2025 19:08:09 +0530
Subject: [PATCH v3 2/2] media: venus: Fix OOB read due to missing payload
 bound check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250514-venus-fixes-v3-2-32298566011f@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
In-Reply-To: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil
	<hans.verkuil@cisco.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747229908; l=6415;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=fCzxABpKTS+NMjdoPuOwlZQdpRHZqLzxxjVVBEHgXyU=;
 b=kMaY3D90m2ZgeTulw8+yy7Ke9ChL0/Y2ASafLKlt7uVJ2uYoswf1oRHNI8M3wRZAS+ZVWd0LC
 33WR8v4WOtmAlqeH6YF6ABV8NriOraUvlp8E8lnTPFFHIMWpzM9jK10
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fj9T8VxpTk-A9PfTGBqmF8oNbL42Xpnf
X-Proofpoint-ORIG-GUID: fj9T8VxpTk-A9PfTGBqmF8oNbL42Xpnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEyMSBTYWx0ZWRfX1GFVtDYqsvwB
 2yyO8n5hzCBT/IAREzzWDwrMm6e916izLk+FXUIChsG81UHefcUH9/r4zyEJd3ixrIKTLz+QUfC
 GJAO1btlpRLkptZgI6m1sRvAYWEFfUyhVGapRGJXgqjIoorhFAImaN8p/5RikWf5SEwl/QCbLtV
 Fbakz5rHROGTFmukDtTnwQzeuU79kQuyp2j3yg2iALEavgMZpTVWJ2hRYsezeRdkQ9g+XAKVNLo
 ptShY0zRIkqDgzQhhf6la9h+1no/WhauR+Ti+xREfOQuW1Rtz9AHEMO11nu3YEKKVT7YJqAcpgG
 SOFoKaV62Lz33aH21qgPGrZt4GhbBR5g6Xuug3IUJRiQ3X8xJytNRUBNl1WHaWq+g0wtFB28ocL
 ni6//ocj/bQZGs+UGMp6CkIYgkqJlr17TNTMbH268PwY5cfTWwYfsL0uaeQnPji1w97MdJeT
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68249cdf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=czAQvarDjluRZCkWtMUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140121

From: Vedang Nagar <quic_vnagar@quicinc.com>

Currently, The event_seq_changed() handler processes a variable number
of properties sent by the firmware. The number of properties is indicated
by the firmware and used to iterate over the payload. However, the
payload size is not being validated against the actual message length.

This can lead to out-of-bounds memory access if the firmware provides a
property count that exceeds the data available in the payload. Such a
condition can result in kernel crashes or potential information leaks if
memory beyond the buffer is accessed.

Fix this by properly validating the remaining size of the payload before
each property access and updating bounds accordingly as properties are
parsed.

This ensures that property parsing is safely bounded within the received
message buffer and protects against malformed or malicious firmware
behavior.

Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 83 +++++++++++++++++++---------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 0a041b4db9efc549621de07dd13b4a3a37a70d11..cf0d97cbc4631f907faf255a338ceca673eaab2b 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -33,8 +33,9 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 	struct hfi_buffer_requirements *bufreq;
 	struct hfi_extradata_input_crop *crop;
 	struct hfi_dpb_counts *dpb_count;
+	u32 ptype, rem_bytes;
+	u32 size_read = 0;
 	u8 *data_ptr;
-	u32 ptype;
 
 	inst->error = HFI_ERR_NONE;
 
@@ -44,86 +45,118 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 		break;
 	default:
 		inst->error = HFI_ERR_SESSION_INVALID_PARAMETER;
-		goto done;
+		inst->ops->event_notify(inst, EVT_SYS_EVENT_CHANGE, &event);
+		return;
 	}
 
 	event.event_type = pkt->event_data1;
 
 	num_properties_changed = pkt->event_data2;
-	if (!num_properties_changed) {
-		inst->error = HFI_ERR_SESSION_INSUFFICIENT_RESOURCES;
-		goto done;
-	}
+	if (!num_properties_changed)
+		goto error;
 
 	data_ptr = (u8 *)&pkt->ext_event_data[0];
+	rem_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
+
 	do {
+		if (rem_bytes < sizeof(u32))
+			goto error;
 		ptype = *((u32 *)data_ptr);
+
+		data_ptr += sizeof(u32);
+		rem_bytes -= sizeof(u32);
+
 		switch (ptype) {
 		case HFI_PROPERTY_PARAM_FRAME_SIZE:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_framesize))
+				goto error;
+
 			frame_sz = (struct hfi_framesize *)data_ptr;
 			event.width = frame_sz->width;
 			event.height = frame_sz->height;
-			data_ptr += sizeof(*frame_sz);
+			size_read = sizeof(struct hfi_framesize);
 			break;
 		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_profile_level))
+				goto error;
+
 			profile_level = (struct hfi_profile_level *)data_ptr;
 			event.profile = profile_level->profile;
 			event.level = profile_level->level;
-			data_ptr += sizeof(*profile_level);
+			size_read = sizeof(struct hfi_profile_level);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_bit_depth))
+				goto error;
+
 			pixel_depth = (struct hfi_bit_depth *)data_ptr;
 			event.bit_depth = pixel_depth->bit_depth;
-			data_ptr += sizeof(*pixel_depth);
+			size_read = sizeof(struct hfi_bit_depth);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_pic_struct))
+				goto error;
+
 			pic_struct = (struct hfi_pic_struct *)data_ptr;
 			event.pic_struct = pic_struct->progressive_only;
-			data_ptr += sizeof(*pic_struct);
+			size_read = sizeof(struct hfi_pic_struct);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_colour_space))
+				goto error;
+
 			colour_info = (struct hfi_colour_space *)data_ptr;
 			event.colour_space = colour_info->colour_space;
-			data_ptr += sizeof(*colour_info);
+			size_read = sizeof(struct hfi_colour_space);
 			break;
 		case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(u32))
+				goto error;
+
 			event.entropy_mode = *(u32 *)data_ptr;
-			data_ptr += sizeof(u32);
+			size_read = sizeof(u32);
 			break;
 		case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_buffer_requirements))
+				goto error;
+
 			bufreq = (struct hfi_buffer_requirements *)data_ptr;
 			event.buf_count = hfi_bufreq_get_count_min(bufreq, ver);
-			data_ptr += sizeof(*bufreq);
+			size_read = sizeof(struct hfi_buffer_requirements);
 			break;
 		case HFI_INDEX_EXTRADATA_INPUT_CROP:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_extradata_input_crop))
+				goto error;
+
 			crop = (struct hfi_extradata_input_crop *)data_ptr;
 			event.input_crop.left = crop->left;
 			event.input_crop.top = crop->top;
 			event.input_crop.width = crop->width;
 			event.input_crop.height = crop->height;
-			data_ptr += sizeof(*crop);
+			size_read = sizeof(struct hfi_extradata_input_crop);
 			break;
 		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
-			data_ptr += sizeof(u32);
+			if (rem_bytes < sizeof(struct hfi_dpb_counts))
+				goto error;
+
 			dpb_count = (struct hfi_dpb_counts *)data_ptr;
 			event.buf_count = dpb_count->fw_min_cnt;
-			data_ptr += sizeof(*dpb_count);
+			size_read = sizeof(struct hfi_dpb_counts);
 			break;
 		default:
+			size_read = 0;
 			break;
 		}
+		data_ptr += size_read;
+		rem_bytes -= size_read;
 		num_properties_changed--;
 	} while (num_properties_changed > 0);
 
-done:
+	inst->ops->event_notify(inst, EVT_SYS_EVENT_CHANGE, &event);
+	return;
+
+error:
+	inst->error = HFI_ERR_SESSION_INSUFFICIENT_RESOURCES;
 	inst->ops->event_notify(inst, EVT_SYS_EVENT_CHANGE, &event);
 }
 

-- 
2.34.1


