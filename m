Return-Path: <linux-media+bounces-32104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E9AAB0D8C
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D8161C24BC8
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FDB286D71;
	Fri,  9 May 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cOs+GDbW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7227E28689F;
	Fri,  9 May 2025 08:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780037; cv=none; b=KBR7mYUrJCyr75eiQWYSl3Snn2Ujc4uVV+ke2l8Moq8BfbanbDhTCKrixnV47v3yu80XWz67GPUBsHG4BUYeEmWf76ebXGfFZkmxXj8uy/RdWkJhi51aSkP8xSk2Gy1W6B7G32cM2HMj/PA4cWZWbbgq23V/VWxZbiY0PmbDQjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780037; c=relaxed/simple;
	bh=Bn7WSr31LkSX3LzA9TSkUUGiMhQqoh31qjsT4D8J+xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=maAf/45/edbW53E0c+wnKM433DD7ltJ2JH0ivO6j4S2N8//CN8QqQk2Ps/l1Rn0TyGdGgdorwJ4ub0rA3ooPzxfeBVPR6YSEMokP1ICCoKGXn1dpFrnBghi2OLkZJXxWh5DW+qr+G8wGyacmpvd8A+lsF8wq1P/Lb3A3BJguMkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cOs+GDbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491gmeN025053;
	Fri, 9 May 2025 08:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLFZnLrIs3pHXAcsSqrckqsLJ3AB0JXCoxO+kbRCJZA=; b=cOs+GDbWf23N9RNK
	3iuO7664j4X5zcSBWvcjWgzudYk+DNUuXmh7dSxeZB9UDPutKmbxvA/4nZpJYv6l
	L2uWBLtK/KShHmqCaiL8WaOK1VWyoAd5h23igbVp9ZLfP60wgi1Iiz4HCKCugT7u
	JdZYxGksvpqCCrJSoTIHzapG7aGRAwBQbygibNekFvUnlcLL4jHsa215vKzZNVdJ
	iJXDNlqLJ7mXr6AvhhgtFXq83JyzRXdvWkahafk8mN6hWzPjrKuBKFIadLjYUzM3
	UPx+Mu41KDiX/E64w6EMgMv4uRb1A5VQ022321NtS5dkVVimkjKni9GZKk3zg9yN
	CS012g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp14194-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498eTES022864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:29 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:25 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:05 +0530
Subject: [PATCH v5 19/26] media: iris: Improve last flag handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-19-59b4ff7d331c@quicinc.com>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=4799;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Bn7WSr31LkSX3LzA9TSkUUGiMhQqoh31qjsT4D8J+xo=;
 b=0aoAn8t2gdj44HbyA9jGnNcSXypqOUqnVpIi35VJlAVp9yxxy+6KChkdIGFhg4XMzpxdiHfeq
 IklMJdXgxO5Csxe6S4YiFSaLCjuyFpai2avOheam8Dr4/ApdoXuIfyN
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX8kCmNRD3x+6N
 COB6MgVKwv5Ayvzw9VjNB9VV9uIGKLgrMfLRnndl1NLdbIxZjLPG4rHgRCr0mkmVsaPf8Gcc5Ca
 ssW7H6LkMgbrrp0DHIJvuCA4xGS4v87xucf93pXXUfiUWn+x1LKaPIR3SBchlw5g/O/WgisXwj7
 rDjMox/vKzUl/9UgxKQxuQXo+WrEUXlh0Viv13ZIKZkDeeTI4jEuDngGp6k9Za6nhAtMbseewoO
 H3r64FwlrxZ6SR7iSLn2KqaaFaPTUAp32P6YUt5CPhW0+vCC45LMjS9t+r0JC0ZXukfKm6US9mI
 qBBLlJuKghg1xNl+k2Uh6LwIMCfClJthewsL68gYcSjZCT3LK+un+PAL/Zgpa9iAYDmWPM2SYBU
 1/l/wIY6gviCBJMCe+/N2Ai9Ng8XvHhCFpjSV8Mgwe5qRAdNd0KijMSfSK0ZL5P52n6e9aFE
X-Proofpoint-GUID: ZY4_MJj2ES-2i-TahJPHRXnNUwnP9cN_
X-Proofpoint-ORIG-GUID: ZY4_MJj2ES-2i-TahJPHRXnNUwnP9cN_
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681dbf7f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=2cYQn0pMhZIMXRX04kcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Improve the handling of the V4L2_BUF_FLAG_LAST flag in the driver:
- Ensure that the last flag is not sent multiple times.
- Attach the last flag to the first capture buffer returned during
  flush, triggered by a sequence change, addressing cases where the
  firmware does not set the last flag.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c            | 1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_instance.h          | 2 ++
 drivers/media/platform/qcom/iris/iris_vb2.c               | 3 ++-
 drivers/media/platform/qcom/iris/iris_vdec.c              | 2 ++
 5 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 018334512baed23f72aad7c2f36b61c50751ca97..7dbac74b1a8de0f5bc09d0ea5307e86d8cbab101 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -636,6 +636,7 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 			v4l2_event_queue_fh(&inst->fh, &ev);
 			v4l2_m2m_mark_stopped(m2m_ctx);
 		}
+		inst->last_buffer_dequeued = true;
 	}
 
 	state = VB2_BUF_STATE_DONE;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 14d8bef62b606acaee514d986eba2f213d1d8c9a..926acee1f48cc4fa8a4ebb3d83f51a45549b59a0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -457,7 +457,12 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 		timestamp_us = timestamp_hi;
 		timestamp_us = (timestamp_us << 32) | timestamp_lo;
 	} else {
-		flags |= V4L2_BUF_FLAG_LAST;
+		if (pkt->stream_id == 1 && !inst->last_buffer_dequeued) {
+			if (iris_drc_pending(inst)) {
+				flags |= V4L2_BUF_FLAG_LAST;
+				inst->last_buffer_dequeued = true;
+			}
+		}
 	}
 	buf->timestamp = timestamp_us;
 
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 06a7f1174ad55e8028096b103b1a2c66f49c3aa7..5ec6368b2af711fd0b78854ddbf18ae58e3dcdc6 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -43,6 +43,7 @@
  * @sequence_out: a sequence counter for output queue
  * @tss: timestamp metadata
  * @metadata_idx: index for metadata buffer
+ * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
  */
 
 struct iris_inst {
@@ -74,6 +75,7 @@ struct iris_inst {
 	u32				sequence_out;
 	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
 	u32				metadata_idx;
+	bool				last_buffer_dequeued;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index b3bde10eb6d2f05696e14fe0e7c44de013bec39e..8b17c7c3948798326ed4732ca50ebd98b833401f 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -305,7 +305,7 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 		goto exit;
 	}
 
-	if (V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
+	if (!inst->last_buffer_dequeued && V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
 		if ((inst->sub_state & IRIS_INST_SUB_DRC &&
 		     inst->sub_state & IRIS_INST_SUB_DRC_LAST) ||
 		    (inst->sub_state & IRIS_INST_SUB_DRAIN &&
@@ -319,6 +319,7 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 				v4l2_event_queue_fh(&inst->fh, &eos);
 				v4l2_m2m_mark_stopped(m2m_ctx);
 			}
+			inst->last_buffer_dequeued = true;
 			goto exit;
 		}
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d342f733feb995cef5e541dda1aa18fc86996465..de4e3fe8ed5ac7a905071362d32d9a87a52b6731 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -487,6 +487,8 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->last_buffer_dequeued = false;
+
 	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
 }
 

-- 
2.34.1


