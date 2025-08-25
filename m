Return-Path: <linux-media+bounces-40899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D81B33769
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10F5117884C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0B6292910;
	Mon, 25 Aug 2025 07:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KYx8gJIk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D652C08CC;
	Mon, 25 Aug 2025 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105371; cv=none; b=PD+l73IFgLINkJ69gzcA1N6AnHF6L0vJFIqHCvJyLsEo7rGJ22UJhcY6BYfy+qug6rnyp0UeGu9oH9oXqqmT7NvWalzMfE84WDk6PahXx25ucm7KgCQ5n2Cv7J3KxQBm3529FhtDdwczqbeHvTYnG21OrFmrBk1yt1HNrOz2NEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105371; c=relaxed/simple;
	bh=8BLy6j+h9oObouXa+55g4t9oOsZtluS2Qeb6TG2g6OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C9N+NTqpEHjT9IVqYSe1fmXeGhxU9zpc3oTGmyNcw6JV4ZF0tNWQtmI5m3jWlJwsbSdou22gudDNqfUJJINjmYYz7iR+w68bTaIGms7CkvJrctVq0wcG9OmTY+5NDNnApexz2k5p0QMqs6n/9rP80dlYCecKvt4dT0L8Qx8FTvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KYx8gJIk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OKL80N011679;
	Mon, 25 Aug 2025 07:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5Fu1k/RjbTVBZYF7uakM0Irgv4lzNsFiliKo+X0Fug=; b=KYx8gJIkkoDyYSTB
	DNJ3pv/xTPpXo+aSwkoWCeeqGEpiA2mF1l0VNTNThukOlcOA0NiV8xJqYseTvRgi
	7Z9VbYxyY9maIPB43cS7xpTlb9GPpCTubLrP2/WkuaPicdEvOCm3dryq+x6LIh0m
	AWlxeBjqADzQY25okM7Ps0Dzkdf+fixHizvURtKWO2CiCEWCnFoZYqXEEoPYH6AP
	2AAe5mVm4+PG+6FqCD9yuw9X09zIRRaNZ/rQDEVGz6K/z0SwpZb1nPA2dxlcdKpA
	ujF32gR/ocraZPOWEiE1TM5j0UGgx9f1rGlVKmhfMSorrGMjAKi9KQhHR/OekeXz
	Pmgs2Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um44u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:02:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P72Rl9006319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:02:27 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:02:23 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:49 +0530
Subject: [PATCH v4 25/26] media: iris: Add support for buffer management
 ioctls for encoder device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-25-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
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
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=21604;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=8BLy6j+h9oObouXa+55g4t9oOsZtluS2Qeb6TG2g6OE=;
 b=2N9AJ6B9p6lN6G+WF8kZDd0u3ToF5baEsS3+KF7gYtj2SYN4fsK4qQOW60ESVMlggH9kUA42R
 5VMcuoYRuCdD1wQOibIaLPmxx9+Mv/DPCHVl8F8IIZw7+pqjraaYF5x
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac0a84 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=TxmKZD_FJr-keLG-z2EA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX1qbOfKcsZZ1U
 /IkQK4fo6d0Cvq41tHtTMATAvF88ddkY5lHQVHPsCL6H8il1wcwnfHTp6/739ivOwyn9eqN7/Pj
 36iFp+00u81bDM+IceO28oAfJKXIVIXt+nhKMu9Cc9jeT1k7XsBdog22WShiMrfM3zD2fFvPV4Q
 x0WNtYx1ejrCqzfkv5TqpPOQ1klvKdelVkGNNN9NHOQ2zWdNW4oOR3ypJfR4UVahngFZmTAqEq9
 PttOtmBjtd3V2t5WsYMB3JZ3KvNz9K73HAeN1x9ZQngYXVg0KEHfFF9XEITAknwF2kt30AB3WJe
 P4nJmSsATxBKX3XgwdixJkYqgkXzMtTKD9L3MSsGT6PLjE/et87Pm77WiKunaAgUo+yudYvhHUZ
 ijfKQra/
X-Proofpoint-GUID: _v_UNa6IWIKOYh4bcuQviWhg8GbYL_05
X-Proofpoint-ORIG-GUID: _v_UNa6IWIKOYh4bcuQviWhg8GbYL_05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

Implement support for queuing and dequeuing input and output buffers
for the encoder video device using the appropriate V4L2 buffer
management ioctls.

This enables userspace applications to manage streaming buffers
required for encoding operations.

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_common.c     | 36 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_common.h     |  2 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 53 +++++++++++++++-------
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 37 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 43 +++++++++++++-----
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 23 ++++++----
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 22 ++++++---
 drivers/media/platform/qcom/iris/iris_vb2.c        |  5 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 40 +---------------
 drivers/media/platform/qcom/iris/iris_venc.c       | 26 +++++++++++
 drivers/media/platform/qcom/iris/iris_venc.h       |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  8 ++++
 12 files changed, 215 insertions(+), 81 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index d6a9271bcec77f142919070bf0566d0cf8a39562..9fc663bdaf3fc989fe1273b4d4280a87f68de85d 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -10,6 +10,42 @@
 #include "iris_instance.h"
 #include "iris_power.h"
 
+int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
+
+	buf->type = iris_v4l2_type_to_driver(vb2->type);
+	buf->index = vb2->index;
+	buf->fd = vb2->planes[0].m.fd;
+	buf->buffer_size = vb2->planes[0].length;
+	buf->data_offset = vb2->planes[0].data_offset;
+	buf->data_size = vb2->planes[0].bytesused - vb2->planes[0].data_offset;
+	buf->flags = vbuf->flags;
+	buf->timestamp = vb2->timestamp;
+	buf->attr = 0;
+
+	return 0;
+}
+
+void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
+{
+	u32 mask = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
+	struct vb2_buffer *vb = &vbuf->vb2_buf;
+	u64 ts_us = vb->timestamp;
+
+	if (inst->metadata_idx >= ARRAY_SIZE(inst->tss))
+		inst->metadata_idx = 0;
+
+	do_div(ts_us, NSEC_PER_USEC);
+
+	inst->tss[inst->metadata_idx].flags = vbuf->flags & mask;
+	inst->tss[inst->metadata_idx].tc = vbuf->timecode;
+	inst->tss[inst->metadata_idx].ts_us = ts_us;
+	inst->tss[inst->metadata_idx].ts_ns = vb->timestamp;
+
+	inst->metadata_idx++;
+}
+
 int iris_process_streamon_input(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
index f385eeb53910555f17602f3951e7a6e9636a9ba2..b2a27b781c9aceb60ff43eff855d759ea95e23d9 100644
--- a/drivers/media/platform/qcom/iris/iris_common.h
+++ b/drivers/media/platform/qcom/iris/iris_common.h
@@ -9,6 +9,8 @@
 struct iris_inst;
 struct iris_buffer;
 
+int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
+void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
 int iris_process_streamon_input(struct iris_inst *inst);
 int iris_process_streamon_output(struct iris_inst *inst);
 int iris_session_streamoff(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 49173db84b9122655fe0186cfa59497a643226c3..d10a23a3d592c2c5eb6c82f67e330957a01baa8a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -273,23 +273,44 @@ static int iris_hfi_gen1_session_continue(struct iris_inst *inst, u32 plane)
 
 static int iris_hfi_gen1_queue_input_buffer(struct iris_inst *inst, struct iris_buffer *buf)
 {
-	struct hfi_session_empty_buffer_compressed_pkt ip_pkt;
+	struct hfi_session_empty_buffer_compressed_pkt com_ip_pkt;
+	struct hfi_session_empty_buffer_uncompressed_pkt uncom_ip_pkt;
 
-	ip_pkt.shdr.hdr.size = sizeof(struct hfi_session_empty_buffer_compressed_pkt);
-	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
-	ip_pkt.shdr.session_id = inst->session_id;
-	ip_pkt.time_stamp_hi = upper_32_bits(buf->timestamp);
-	ip_pkt.time_stamp_lo = lower_32_bits(buf->timestamp);
-	ip_pkt.flags = buf->flags;
-	ip_pkt.mark_target = 0;
-	ip_pkt.mark_data = 0;
-	ip_pkt.offset = buf->data_offset;
-	ip_pkt.alloc_len = buf->buffer_size;
-	ip_pkt.filled_len = buf->data_size;
-	ip_pkt.input_tag = buf->index;
-	ip_pkt.packet_buffer = buf->device_addr;
-
-	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
+	if (inst->domain == DECODER) {
+		com_ip_pkt.shdr.hdr.size = sizeof(struct hfi_session_empty_buffer_compressed_pkt);
+		com_ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
+		com_ip_pkt.shdr.session_id = inst->session_id;
+		com_ip_pkt.time_stamp_hi = upper_32_bits(buf->timestamp);
+		com_ip_pkt.time_stamp_lo = lower_32_bits(buf->timestamp);
+		com_ip_pkt.flags = buf->flags;
+		com_ip_pkt.mark_target = 0;
+		com_ip_pkt.mark_data = 0;
+		com_ip_pkt.offset = buf->data_offset;
+		com_ip_pkt.alloc_len = buf->buffer_size;
+		com_ip_pkt.filled_len = buf->data_size;
+		com_ip_pkt.input_tag = buf->index;
+		com_ip_pkt.packet_buffer = buf->device_addr;
+		return iris_hfi_queue_cmd_write(inst->core, &com_ip_pkt,
+						com_ip_pkt.shdr.hdr.size);
+	} else {
+		uncom_ip_pkt.shdr.hdr.size =
+			sizeof(struct hfi_session_empty_buffer_uncompressed_pkt);
+		uncom_ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
+		uncom_ip_pkt.shdr.session_id = inst->session_id;
+		uncom_ip_pkt.time_stamp_hi = upper_32_bits(buf->timestamp);
+		uncom_ip_pkt.time_stamp_lo = lower_32_bits(buf->timestamp);
+		uncom_ip_pkt.view_id = 0;
+		uncom_ip_pkt.flags = buf->flags;
+		uncom_ip_pkt.mark_target = 0;
+		uncom_ip_pkt.mark_data = 0;
+		uncom_ip_pkt.offset = buf->data_offset;
+		uncom_ip_pkt.alloc_len = buf->buffer_size;
+		uncom_ip_pkt.filled_len = buf->data_size;
+		uncom_ip_pkt.input_tag = buf->index;
+		uncom_ip_pkt.packet_buffer = buf->device_addr;
+		return iris_hfi_queue_cmd_write(inst->core, &uncom_ip_pkt,
+						uncom_ip_pkt.shdr.hdr.size);
+	}
 }
 
 static int iris_hfi_gen1_queue_output_buffer(struct iris_inst *inst, struct iris_buffer *buf)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 21853921483b90604b69001064550a50bb9629ad..42226ccee3d9b9eb5f793c3be127acd8afad2138 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -216,6 +216,23 @@ struct hfi_session_empty_buffer_compressed_pkt {
 	u32 data;
 };
 
+struct hfi_session_empty_buffer_uncompressed_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 view_id;
+	u32 time_stamp_hi;
+	u32 time_stamp_lo;
+	u32 flags;
+	u32 mark_target;
+	u32 mark_data;
+	u32 alloc_len;
+	u32 filled_len;
+	u32 offset;
+	u32 input_tag;
+	u32 packet_buffer;
+	u32 extradata_buffer;
+	u32 data;
+};
+
 struct hfi_session_fill_buffer_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 stream_id;
@@ -461,6 +478,26 @@ struct hfi_msg_session_empty_buffer_done_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_fbd_compressed_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 time_stamp_hi;
+	u32 time_stamp_lo;
+	u32 error_type;
+	u32 flags;
+	u32 mark_target;
+	u32 mark_data;
+	u32 stats;
+	u32 offset;
+	u32 alloc_len;
+	u32 filled_len;
+	u32 input_tag;
+	u32 output_tag;
+	u32 picture_type;
+	u32 packet_buffer;
+	u32 extradata_buffer;
+	u32 data[];
+};
+
 struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 stream_id;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 82d3e8de7bff0ac53a971b4763ae848ff8c61ff2..a55d214c84048c6a3ac19a041c0f78f7e58918b8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -387,24 +387,43 @@ static void iris_hfi_gen1_session_etb_done(struct iris_inst *inst, void *packet)
 
 static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 {
-	struct hfi_msg_session_fbd_uncompressed_plane0_pkt *pkt = packet;
+	struct hfi_msg_session_fbd_uncompressed_plane0_pkt *uncom_pkt = packet;
+	struct hfi_msg_session_fbd_compressed_pkt *com_pkt = packet;
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	struct v4l2_m2m_buffer *m2m_buffer, *n;
 	struct hfi_session_flush_pkt flush_pkt;
-	u32 timestamp_hi = pkt->time_stamp_hi;
-	u32 timestamp_lo = pkt->time_stamp_lo;
+	u32 timestamp_hi;
+	u32 timestamp_lo;
 	struct iris_core *core = inst->core;
-	u32 filled_len = pkt->filled_len;
-	u32 pic_type = pkt->picture_type;
-	u32 output_tag = pkt->output_tag;
+	u32 filled_len;
+	u32 pic_type;
+	u32 output_tag;
 	struct iris_buffer *buf, *iter;
 	struct iris_buffers *buffers;
-	u32 hfi_flags = pkt->flags;
-	u32 offset = pkt->offset;
+	u32 hfi_flags;
+	u32 offset;
 	u64 timestamp_us = 0;
 	bool found = false;
 	u32 flags = 0;
 
+	if (inst->domain == DECODER) {
+		timestamp_hi = uncom_pkt->time_stamp_hi;
+		timestamp_lo = uncom_pkt->time_stamp_lo;
+		filled_len = uncom_pkt->filled_len;
+		pic_type = uncom_pkt->picture_type;
+		output_tag = uncom_pkt->output_tag;
+		hfi_flags = uncom_pkt->flags;
+		offset = uncom_pkt->offset;
+	} else {
+		timestamp_hi = com_pkt->time_stamp_hi;
+		timestamp_lo = com_pkt->time_stamp_lo;
+		filled_len = com_pkt->filled_len;
+		pic_type = com_pkt->picture_type;
+		output_tag = com_pkt->output_tag;
+		hfi_flags = com_pkt->flags;
+		offset = com_pkt->offset;
+	}
+
 	if ((hfi_flags & HFI_BUFFERFLAG_EOS) && !filled_len) {
 		reinit_completion(&inst->flush_completion);
 
@@ -418,7 +437,8 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 		iris_inst_sub_state_change_drain_last(inst);
 	}
 
-	if (iris_split_mode_enabled(inst) && pkt->stream_id == 0) {
+	if (iris_split_mode_enabled(inst) && inst->domain == DECODER &&
+	    uncom_pkt->stream_id == 0) {
 		buffers = &inst->buffers[BUF_DPB];
 		if (!buffers)
 			goto error;
@@ -459,7 +479,8 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 		timestamp_us = timestamp_hi;
 		timestamp_us = (timestamp_us << 32) | timestamp_lo;
 	} else {
-		if (pkt->stream_id == 1 && !inst->last_buffer_dequeued) {
+		if (inst->domain == DECODER && uncom_pkt->stream_id == 1 &&
+		    !inst->last_buffer_dequeued) {
 			if (iris_drc_pending(inst) || iris_drain_pending(inst)) {
 				flags |= V4L2_BUF_FLAG_LAST;
 				inst->last_buffer_dequeued = true;
@@ -551,7 +572,7 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	},
 	{
 	 .pkt = HFI_MSG_SESSION_FILL_BUFFER,
-	 .pkt_sz = sizeof(struct hfi_msg_session_fbd_uncompressed_plane0_pkt),
+	 .pkt_sz = sizeof(struct hfi_msg_session_fbd_compressed_pkt),
 	},
 	{
 	 .pkt = HFI_MSG_SESSION_FLUSH,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 5aae8162ca1c3b969c30e6ea53b1de88f5ad51cc..4ce71a14250832440099e4cf3835b4aedfb749e8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1045,13 +1045,19 @@ static int iris_hfi_gen2_session_drain(struct iris_inst *inst, u32 plane)
 					inst_hfi_gen2->packet->size);
 }
 
-static u32 iris_hfi_gen2_buf_type_from_driver(enum iris_buffer_type buffer_type)
+static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type buffer_type)
 {
 	switch (buffer_type) {
 	case BUF_INPUT:
-		return HFI_BUFFER_BITSTREAM;
+		if (domain == DECODER)
+			return HFI_BUFFER_BITSTREAM;
+		else
+			return HFI_BUFFER_RAW;
 	case BUF_OUTPUT:
-		return HFI_BUFFER_RAW;
+		if (domain == DECODER)
+			return HFI_BUFFER_RAW;
+		else
+			return HFI_BUFFER_BITSTREAM;
 	case BUF_BIN:
 		return HFI_BUFFER_BIN;
 	case BUF_COMV:
@@ -1091,16 +1097,17 @@ static int iris_set_num_comv(struct iris_inst *inst)
 						   &num_comv, sizeof(u32));
 }
 
-static void iris_hfi_gen2_get_buffer(struct iris_buffer *buffer, struct iris_hfi_buffer *buf)
+static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
+				     struct iris_hfi_buffer *buf)
 {
 	memset(buf, 0, sizeof(*buf));
-	buf->type = iris_hfi_gen2_buf_type_from_driver(buffer->type);
+	buf->type = iris_hfi_gen2_buf_type_from_driver(domain, buffer->type);
 	buf->index = buffer->index;
 	buf->base_address = buffer->device_addr;
 	buf->addr_offset = 0;
 	buf->buffer_size = buffer->buffer_size;
 
-	if (buffer->type == BUF_INPUT)
+	if (domain == DECODER && buffer->type == BUF_INPUT)
 		buf->buffer_size = ALIGN(buffer->buffer_size, 256);
 	buf->data_offset = buffer->data_offset;
 	buf->data_size = buffer->data_size;
@@ -1117,7 +1124,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 	u32 port;
 	int ret;
 
-	iris_hfi_gen2_get_buffer(buffer, &hfi_buffer);
+	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
 		ret = iris_set_num_comv(inst);
 		if (ret)
@@ -1144,7 +1151,7 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 	struct iris_hfi_buffer hfi_buffer;
 	u32 port;
 
-	iris_hfi_gen2_get_buffer(buffer, &hfi_buffer);
+	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	hfi_buffer.flags |= HFI_BUF_HOST_FLAG_RELEASE;
 	port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 6b8e637ac6d82aee8699db59ee2f04de9e715275..2f1f118eae4f6462ab1aa1d16844b34e6e699f1e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -480,12 +480,22 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
 	if (!iris_hfi_gen2_is_valid_hfi_port(pkt->port, buffer->type))
 		return 0;
 
-	if (buffer->type == HFI_BUFFER_BITSTREAM)
-		return iris_hfi_gen2_handle_input_buffer(inst, buffer);
-	else if (buffer->type == HFI_BUFFER_RAW)
-		return iris_hfi_gen2_handle_output_buffer(inst, buffer);
-	else
-		return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
+	if (inst->domain == DECODER) {
+		if (buffer->type == HFI_BUFFER_BITSTREAM)
+			return iris_hfi_gen2_handle_input_buffer(inst, buffer);
+		else if (buffer->type == HFI_BUFFER_RAW)
+			return iris_hfi_gen2_handle_output_buffer(inst, buffer);
+		else
+			return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
+	} else {
+		if (buffer->type == HFI_BUFFER_RAW)
+			return iris_hfi_gen2_handle_input_buffer(inst, buffer);
+		else if (buffer->type == HFI_BUFFER_BITSTREAM)
+			return iris_hfi_gen2_handle_output_buffer(inst, buffer);
+		else
+			return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
+	}
+	return 0;
 }
 
 static int iris_hfi_gen2_handle_session_drain(struct iris_inst *inst,
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index fbf8ebb74193284dc847c54f76f908656b3098c9..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -327,7 +327,10 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 
-	ret = iris_vdec_qbuf(inst, vbuf);
+	if (inst->domain == DECODER)
+		ret = iris_vdec_qbuf(inst, vbuf);
+	else
+		ret = iris_venc_qbuf(inst, vbuf);
 
 exit:
 	if (ret) {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index f8d10340f7463490311ab242a44957cf2ddcb3bd..ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -377,44 +377,6 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
 	return ret;
 }
 
-static int
-iris_vdec_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf)
-{
-	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
-
-	buf->type = iris_v4l2_type_to_driver(vb2->type);
-	buf->index = vb2->index;
-	buf->fd = vb2->planes[0].m.fd;
-	buf->buffer_size = vb2->planes[0].length;
-	buf->data_offset = vb2->planes[0].data_offset;
-	buf->data_size = vb2->planes[0].bytesused - vb2->planes[0].data_offset;
-	buf->flags = vbuf->flags;
-	buf->timestamp = vb2->timestamp;
-	buf->attr = 0;
-
-	return 0;
-}
-
-static void
-iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
-{
-	u32 mask = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
-	struct vb2_buffer *vb = &vbuf->vb2_buf;
-	u64 ts_us = vb->timestamp;
-
-	if (inst->metadata_idx >= ARRAY_SIZE(inst->tss))
-		inst->metadata_idx = 0;
-
-	do_div(ts_us, NSEC_PER_USEC);
-
-	inst->tss[inst->metadata_idx].flags = vbuf->flags & mask;
-	inst->tss[inst->metadata_idx].tc = vbuf->timecode;
-	inst->tss[inst->metadata_idx].ts_us = ts_us;
-	inst->tss[inst->metadata_idx].ts_ns = vb->timestamp;
-
-	inst->metadata_idx++;
-}
-
 int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
 	struct iris_buffer *buf = to_iris_buffer(vbuf);
@@ -422,7 +384,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	struct vb2_queue *q;
 	int ret;
 
-	ret = iris_vdec_vb2_buffer_to_driver(vb2, buf);
+	ret = iris_vb2_buffer_to_driver(vb2, buf);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 9f9565bfc2060fbd3a9ba36cb00c0595545675dc..3270c0da668e739d4f98f008db780a0eb5d3dca4 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -10,6 +10,7 @@
 #include "iris_common.h"
 #include "iris_ctrls.h"
 #include "iris_instance.h"
+#include "iris_power.h"
 #include "iris_venc.h"
 #include "iris_vpu_buffer.h"
 
@@ -493,3 +494,28 @@ int iris_venc_streamon_output(struct iris_inst *inst)
 
 	return ret;
 }
+
+int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
+{
+	struct iris_buffer *buf = to_iris_buffer(vbuf);
+	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	struct vb2_queue *q;
+	int ret;
+
+	ret = iris_vb2_buffer_to_driver(vb2, buf);
+	if (ret)
+		return ret;
+
+	if (buf->type == BUF_INPUT)
+		iris_set_ts_metadata(inst, vbuf);
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, vb2->type);
+	if (!vb2_is_streaming(q)) {
+		buf->attr |= BUF_ATTR_DEFERRED;
+		return 0;
+	}
+
+	iris_scale_power(inst);
+
+	return iris_queue_buffer(inst, buf);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index 941b5c186e4550e3eb6325d5ae3eeac4fcee4675..bbf3b635288dd6cc39719bdde1942918357791aa 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -20,5 +20,6 @@ int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
 int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
 int iris_venc_streamon_input(struct iris_inst *inst);
 int iris_venc_streamon_output(struct iris_inst *inst);
+int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 9f2e76a3704fcf3ff5fd10b29c43a6937b9ffe1f..245a68248a3f0fdda13b993ece45fa4c0a45aff9 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -664,6 +664,14 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
 	.vidioc_g_parm                  = iris_g_parm,
 	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
+	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf                = v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs             = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf             = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_expbuf                  = v4l2_m2m_ioctl_expbuf,
+	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf                   = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_remove_bufs             = v4l2_m2m_ioctl_remove_bufs,
 };
 
 void iris_init_ops(struct iris_core *core)

-- 
2.34.1


