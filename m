Return-Path: <linux-media+bounces-32102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E27DCAB0D86
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 818ED1C256BD
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BEA283FC6;
	Fri,  9 May 2025 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oa5gB1s4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9202820B1;
	Fri,  9 May 2025 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780027; cv=none; b=E2eCVjMLCH7WKVwqu2OQyvC3FPt1BtZyoxmXwdAZLO1DkQpWUzPivUxf3X0Zlh60DtrIvXKNgTYQ1wZrGVWC10wqZt0GiPJL9sbd0fpN4UifR7f+b56VSHOVvECSS4veqiEGbVBH7MTqaRRZI/EyxrDgihpJxog0KkIY9VlRB7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780027; c=relaxed/simple;
	bh=JT2hcRmTlMdrai7swzzzPYdB5jLoGQ/J/JFeB4ZR5F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IqhCPsvouomEVVEsMI7rArJH1UQO0D94MONV97Y/8lGsAVo+vfoBYqLBzAsvAWPfsBKB19e1aLAnWmLdn5g4edlN7/13Rzym4KUOmOtcCwvWdJSIATwQd4LxZJSYWPyUlfARebYw+iEZOYAVpRMhj+9u0ObHKsCqjdn6UjgA5q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oa5gB1s4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492ejTk011591;
	Fri, 9 May 2025 08:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XBDfZpnqanv88GISojmVk/6+yZ84liyGL3tiSetNb4=; b=oa5gB1s4EiVA3wQ4
	VDz1v1rU3zvlmW1MvGTIjJxsa0uuwe0gIa4JqxGPMXsR/M6P/1zCdSTaYXmb3KM2
	q0AVx1PcRIqouirwfIhKs5tj54XCTm8dxI+kEVPXMVdtK/18tmbKymKyVwp6iQBg
	B5PgxD2HgsiMIoYuwr5/Wi+sAifsu6vTF/9AkdhOUqxERIQZTDCFSrSDzGpDA+Vn
	p3M09/0RsZFQ3xfsFa0Fpj9fsX+ie0JjV2uchbIuZczzWBuznQYyRMMO2YGmJs4N
	2R6EwVbjpoUyIrNl1a6I3qbl6oO00YEOUDIKe7JK/CPsju6TWYkM/VvR4g76epN4
	aawjtw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmkym8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498eLbh013644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:21 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:17 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:03 +0530
Subject: [PATCH v5 17/26] media: iris: Add handling for corrupt and drop
 frames
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-17-59b4ff7d331c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=3336;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=JT2hcRmTlMdrai7swzzzPYdB5jLoGQ/J/JFeB4ZR5F4=;
 b=GxLI+tL6EEzY1brg16+k9fv1/ZXtbyv32PU+eO64+y8hqL+mMItypSq2aBYCpNFucO0jpMx/s
 S7kHHmaV5XmCWI8xk2RcTI/ve75bf2bX3Wcu+RaaENN01LQLCaMoR3F
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681dbf76 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=TdiaMWi7zJQ5k-ChqB0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: h8nJAsj5lEltiOK2eQBJY7T0zImN4h6N
X-Proofpoint-GUID: h8nJAsj5lEltiOK2eQBJY7T0zImN4h6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfXzuqkBbHd3L9S
 r4dZW3L464/MhHuspnk5mzu51GJs310BKrAli7UOTe2EIaZOye1yS+CXNqjYjf/9l1G11hLjEbk
 2CHaBmkaOUfw7wT3dqLpCub285x737+ovg7lIrOvsts74fzmlBgzNeLzmqvqiVbdRMe7X2d1mTY
 RX3dDVcosFTEFTj8H3qOD+xM8LXYbLf4LV60C6zwCwP4b2bUGfNLUhPpgSS4VINol7ITCzRRLV+
 nY7/Njj4L/++hg0IDy5OhWmpJS/X7kUjsQgJ16hXuSSJa2RQCHaCBYc6KZkVkhiX3iIa7T6daFz
 U4mmTjBH4G9fqoPWjvF5dZyMrZ/lBx5g3KrU7FY0RWbI6VvM/BbEhQy/ljCHDQCcfIZ7+XKVZdV
 F8HI/HxmQHEpfGaHh9yOJ2yBRsG0LWGsE2+MzBM58fGr0PIvkdDy9DnHsLFabjD1Sbl9eSc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Firmware attach DATACORRUPT/DROP buffer flags for the frames which
needs to be dropped, handle it by setting VB2_BUF_STATE_ERROR for these
buffers before calling buf_done.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c            | 11 ++++++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h  |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c |  6 ++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 981fedb000ed5bf7aa79d34b8b581a5b4ca378a5..018334512baed23f72aad7c2f36b61c50751ca97 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -611,10 +611,13 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	vb2 = &vbuf->vb2_buf;
 
-	if (buf->flags & V4L2_BUF_FLAG_ERROR)
+	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
 		state = VB2_BUF_STATE_ERROR;
-	else
-		state = VB2_BUF_STATE_DONE;
+		vb2_set_plane_payload(vb2, 0, 0);
+		vb2->timestamp = 0;
+		v4l2_m2m_buf_done(vbuf, state);
+		return 0;
+	}
 
 	vbuf->flags |= buf->flags;
 
@@ -634,6 +637,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 			v4l2_m2m_mark_stopped(m2m_ctx);
 		}
 	}
+
+	state = VB2_BUF_STATE_DONE;
 	vb2->timestamp = buf->timestamp;
 	v4l2_m2m_buf_done(vbuf, state);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index e178604855c13f71e085e7e41ed3b53e7c90c57d..adffcead58ea770f992d991dd6bb3c3c7cb843b7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -116,6 +116,8 @@
 #define HFI_FRAME_NOTCODED				0x7f002000
 #define HFI_FRAME_YUV					0x7f004000
 #define HFI_UNUSED_PICT					0x10000000
+#define HFI_BUFFERFLAG_DATACORRUPT			0x00000008
+#define HFI_BUFFERFLAG_DROP_FRAME			0x20000000
 
 struct hfi_pkt_hdr {
 	u32 size;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index c8c0aa23536b73a1d29f560c21900238e704c74d..14d8bef62b606acaee514d986eba2f213d1d8c9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -483,6 +483,12 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	buf->attr |= BUF_ATTR_DEQUEUED;
 	buf->attr |= BUF_ATTR_BUFFER_DONE;
 
+	if (hfi_flags & HFI_BUFFERFLAG_DATACORRUPT)
+		flags |= V4L2_BUF_FLAG_ERROR;
+
+	if (hfi_flags & HFI_BUFFERFLAG_DROP_FRAME)
+		flags |= V4L2_BUF_FLAG_ERROR;
+
 	buf->flags |= flags;
 
 	iris_vb2_buffer_done(inst, buf);

-- 
2.34.1


