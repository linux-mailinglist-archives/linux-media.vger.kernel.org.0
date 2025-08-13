Return-Path: <linux-media+bounces-39763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59844B245B5
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9080723B29
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977562F2908;
	Wed, 13 Aug 2025 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EByOEfIu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57752F6586;
	Wed, 13 Aug 2025 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077937; cv=none; b=g98viobm4hEcDswoWofOIx5tqyxd77qeixsAA1YsyXiVjmjYwyhYO1wKckFqt/uABbEo66XICtuQuUq0rTlf7+5moegGvF5lKS2mElP4TaayKvFPhUffQ4GqMfNQLwKRbkjBF1ttoLBBTNFeCoyyUwO4vMkk1w0ioQyL32PouiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077937; c=relaxed/simple;
	bh=hgCyyXyEoe6+WnAnu7eJU+Siab88YJQpWr5pQwfNLws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Xbt2equfJVHYSm+NkDZuXSotxp71kDSajlPM9matub+31W9ZLC2XKLRjRRnpTo0qAGa5tAh4vyhBKVb0wmz/nDzm1Kxs90L898BsYJhBQ9gYEgO4iAhGqcRUmpyM/24Wn5d9BfnhCI9c4g9iRjRyuYgXhVUiHsG8aYUmn39c3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EByOEfIu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6memG026744;
	Wed, 13 Aug 2025 09:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZI/pkzmLhlSDzaTzJW6k8KnlnEEQW24G8jibHS0/0Vo=; b=EByOEfIuoM2cSefQ
	TslSun0XGfG94k4ehlovAj8ji5c2M29lMAzaC713saxA/XuD0xKfInHyyKMjQWfH
	2wML0oLD1k0jQoDnRcd0lTuPxawpXlV99K8NVG5VrPAZtxf3mwGRSkDOqN1hVogf
	y48MGtrQ8jCNcLzy8m5MD0/5jkN8CLQ/ZWHFg/JJ/f/UDg7WK6Tp4phgTbw3PlfS
	ZaqOStmehRU8mWaQ/xumGRwFhM8t+vNKMtxjh7p/1Q8sjVyMGz08WEaoJ6IJHe2v
	8wbHcCmGdcGeBzLcvumYp+3O1wbVES5gLr97i1baS7IHJfjSN7fu5I2wSoQ3/f9s
	X3UpUg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sugm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9cmlr030991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:48 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:44 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:07:57 +0530
Subject: [PATCH v2 07/24] media: iris: Update vbuf flags before
 v4l2_m2m_buf_done
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-7-c725ff673078@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=1488;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=hgCyyXyEoe6+WnAnu7eJU+Siab88YJQpWr5pQwfNLws=;
 b=QTvtvbM6mbHV+NbUAOVtHcFbJPlanxwbyUxzVyiX3JE4y94VscPNPwxbFYjBXhjz24q2TjYNk
 l1L1FmK1XBiB3JPYaAeNWOfbV1dP3gTpOQn944BQ44NvfN5IYR5ZBgo
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c5d29 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=MjMrax0v_7cEApFHy6YA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -_aVe-_8_5M13XIr8VHqHFGmN6-kaEbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXxbSL+xKjI04Q
 aOAiI0nmrafCwNb+Ni6xEK93Byb5VnCawCU4grIDOi+WKzYpUK3yUtUFgl+x135+yBcohKrrr37
 xon4fx1x+iruMNP02/qKhYuCMND0+9dfEB0z+wfdem5dI2l0LslIZaOyPv47y09RpSF98kNmDev
 on3aMDKd0TpkhtWZbkyoCnMwuDLMXWaotgaJechoPeKav/ZKZY797vMfX42bftTK0CZD82CnYbS
 enSSpvo1iPs6msC+uEdvKE6BOi4GlC/IJJtIxV+LzZ22sWc+BgrLm/4GcCac6LoYp9lxvtJ1/EQ
 272w+XDBt3DaCqM1iNMduU/PACt1WBkS5u7RjSVqYKPgYro20HbLupqL4cIs2+ps4PmlHj+V/+r
 6TXC19pP
X-Proofpoint-GUID: -_aVe-_8_5M13XIr8VHqHFGmN6-kaEbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Update the vbuf flags appropriately in error cases before calling
v4l2_m2m_buf_done(). Previously, the flag update was skippied in error
scenario, which could result in incorrect state reporting for buffers.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 23cac5d1312913b8dac44347ae66cb80a6a15deb..38548ee4749ea7dd1addf2c9d0677cf5217e3546 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -651,6 +651,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	vb2 = &vbuf->vb2_buf;
 
+	vbuf->flags |= buf->flags;
+
 	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
 		state = VB2_BUF_STATE_ERROR;
 		vb2_set_plane_payload(vb2, 0, 0);
@@ -659,8 +661,6 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 		return 0;
 	}
 
-	vbuf->flags |= buf->flags;
-
 	if (V4L2_TYPE_IS_CAPTURE(type)) {
 		vb2_set_plane_payload(vb2, 0, buf->data_size);
 		vbuf->sequence = inst->sequence_cap++;

-- 
2.34.1


