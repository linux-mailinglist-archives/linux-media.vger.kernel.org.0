Return-Path: <linux-media+bounces-27595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C7EA4FCA2
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1F341896640
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D61221F09;
	Wed,  5 Mar 2025 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JpWkALMi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DF21B9DA;
	Wed,  5 Mar 2025 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171493; cv=none; b=s76mvTpHeaIlZw/Nx7X/rZmVluvN//R/jyXtfn8R3jO6FdbfGJhBfyoLsUAI1zfyoqKGpdnDFqDrZw5pHsB5D/UgEHlHXQqHbVyj8PcRy1qHov/8gN6tYWefp64ZS80k5AVXwrpSH6f+a/wGBt9zAgMFD4ciVML5BJ0+Fi1CYjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171493; c=relaxed/simple;
	bh=w2GGld3i01xE/TWsgsoc+rD2/e4LmutsOXqfjdiQ1oE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uP/S9sWl9mEoD5QO4km8OYVjqs2nbgKVwSmcnNoSwAnHc9Tg3lq5zZ4G3aWJ4SbN0UaYYfqoJpSTXoPbxBkJk0KLG5olteeS/aVedZuNyg0isG7WGirdrugHnfR3TtO3r9/g1HhkzltpA+D25x5Pc/kaWq04VqA2hg2Br9znPp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JpWkALMi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525AcjST029024;
	Wed, 5 Mar 2025 10:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYfitqWtD4RwV/G1X2F3QvRF1QLAla3cZAdrZIfSAII=; b=JpWkALMimkWnLwO6
	yd7rLKcbn3Hsr5yCn5hYYhhrygTHuux5z20Ct6wTUy9jWfju0ul1fyrke5V2mn2d
	REs2hwT8vcwFzkfDaBTD92SXXgOj+C33pxm28aKH0OKrv2dCTSA/3rWaCu2x9Oco
	JYnXkuUKgvHOgpJLzidhl4irKe9azvSDx0siDF/IN4KtyY42PHfbC+eIixqyPHR8
	uHbvPrb3b1XGofYmzKJXiWEh4x2KCxcsQfl7uRYpnULghODssk3AlSrt3EU+aUYH
	YatIEwbOP9rWP0GHqb0A0fiV8bCp5LYH1ehVNOWFQLQSF9eWgSck5PqfzDkaebHb
	vEI57A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tn1ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525Ail9Y013795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:48 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:44 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 07/12] media: iris: Add handling for corrupt and drop frames
Date: Wed, 5 Mar 2025 16:13:30 +0530
Message-ID: <20250305104335.3629945-8-quic_dikshita@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c82b20 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=_gkRxyOrLczHTu_9YvMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3pM-0nraCb5qrJDvYhJ7DOAvL2PsvC9X
X-Proofpoint-GUID: 3pM-0nraCb5qrJDvYhJ7DOAvL2PsvC9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

Firmware attach DATACORRUPT/DROP buffer flags for the frames which
needs to be dropped, handle it by setting VB2_BUF_STATE_ERROR for these
buffers before calling buf_done.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c        | 11 ++++++++---
 .../media/platform/qcom/iris/iris_hfi_gen1_defines.h  |  2 ++
 .../media/platform/qcom/iris/iris_hfi_gen1_response.c |  6 ++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 305b630ca269..e5180340383b 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -603,10 +603,13 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
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
 
@@ -626,6 +629,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 			v4l2_m2m_mark_stopped(m2m_ctx);
 		}
 	}
+
+	state = VB2_BUF_STATE_DONE;
 	vb2->timestamp = buf->timestamp;
 	v4l2_m2m_buf_done(vbuf, state);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 3bea643068f9..bfeeea643300 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -119,6 +119,8 @@
 #define HFI_FRAME_NOTCODED				0x7f002000
 #define HFI_FRAME_YUV					0x7f004000
 #define HFI_UNUSED_PICT					0x10000000
+#define HFI_BUFFERFLAG_DATACORRUPT			0x00000008
+#define HFI_BUFFERFLAG_DROP_FRAME			0x20000000
 
 struct hfi_pkt_hdr {
 	u32 size;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index b72d503dd740..91d95eed68aa 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -481,6 +481,12 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
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


