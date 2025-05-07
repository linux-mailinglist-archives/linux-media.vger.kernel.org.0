Return-Path: <linux-media+bounces-31897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CC9AAD86F
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C895B17B087
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BD622128E;
	Wed,  7 May 2025 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eroAWnds"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEA9220F5A;
	Wed,  7 May 2025 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603633; cv=none; b=q7C1Wyv3jRWETR6EEMeyx/xY/boctGDidO0L7EAValTRede0iPaAgRk3vC0yRqtFmBV4alhPM22U/jzTebC5UoSkSvjsVqIjK8PMUVvwLeelwVibMwM/pah18/EDbauX9PzzH9u1GRfah7OZbyD3qdo+X9KasLOpk4IajH+HwX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603633; c=relaxed/simple;
	bh=FuaR9yXR1I7OKS1I5pl3pkyIoWBUJEEN6TqjTN3sSpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dgycGQ30LX9ScV0Si1szehyL5OZzLkmCQ1ziuOCWwUDNAftiVGdfJSm0IQmZutpyl7WjmxtFw0AYlm7BmfeYeIGpMHSj5gD15+WiL8eakGDCgzGfHBF8lAyHq0AZiKIazSi2zKKxCOLFLlYWXEK+574rXSk1O7eCUdgbXG1gpsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eroAWnds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H7dL009770;
	Wed, 7 May 2025 07:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAGy3wG2SQ9gmchrfHnHCvj9pcjv3vGddiNYao0Im6w=; b=eroAWndssAAmih7x
	bELFZA0eS1wpy3wq0V5XOEdvNAIFme9cQI86CDPeRz2/ontEL0McxVO8j9dHX2xA
	DYN/uPs32StzWdjsOlHGVFE/YdrLIVR2OB09iaQxSeGB3VYScYjY+8KjwrbhqMV0
	at1qS1lutEdd8nTla7+uDQXF7Ha7sww60xRMp8mPPSQo1fTDy4jksE4/8myEVXnK
	aMjwDql6OlrCNj3y/SHkvFF0PcQy9oSPvjyWylf00Gs+ptcwV83LTXUPVV1U0h6V
	EIFK9JqqxnqkAc5+6/ULuyVf0P1xwQXwV+Z7Qev6LfAcbQBNr3woNNR2Ok/tQOgb
	M8Ub+A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1j1ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477ePxM031031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:25 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:21 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:33 +0530
Subject: [PATCH v4 02/25] media: iris: Update CAPTURE format info based on
 OUTPUT format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-2-58db3660ac61@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=1510;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=FuaR9yXR1I7OKS1I5pl3pkyIoWBUJEEN6TqjTN3sSpI=;
 b=cZoDdA3lo8ZTzQi+Tg3bcW0Y/QBZkJSlUeyqQBydeyuJ2ZFXBrgOmG17iXaN5peYDyN8n71Bt
 8Vllz1mddDvADyL1xAls/6frpHB0lsSWeIgIFgJ9oH0HzWD2jN5ECTn
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3BwIviXh1c6STFoAawjYRzUh44jZ2eAK
X-Proofpoint-ORIG-GUID: 3BwIviXh1c6STFoAawjYRzUh44jZ2eAK
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681b0e6a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=H4aCPc18VLGkYZj90ZUA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX+5q/eJG0Ekkn
 TjfrStZGgPNxE+FEBhjgaw0qj9RR9k3XAvRXOsRrAShuz9qKNvyTbWoQlvirVH3SSdWkVrb3+3/
 EAsRN5gihiz0wT2h4CFG39OJJ9GuI5dSTChGlzUKAbsLR/5UqBB0vIbqe0mIsmKgOC3OzyTGk6L
 HzVc6aymO2G0LyJ/HLr5XBG6IeoNzUpIFjjyf2hLyHVzl7FPLVq33drgnRH46Zy7TNPBd12h8mB
 1eB/0xV08Jq6QRnbZGBL4xNjKOHHIi6DjKm41rmmRA77aH7vxGFO0FtWO8wpvg2NtLn5K3RneZV
 sSg4AJXOS4a2f5sgD6agFKGKCBR388TTkYZy4q11/8HU0CbOjVvtxvgNYNo12tSnU24/SEnY288
 kywaREWFXfmmqDiWhm/HNGlayQvB34Yro907Wliu9awwb2DHJST5l19JoYRCRC2k9ya6gqzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=933 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

Update the width, height and buffer size of CAPTURE based on the
resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
updated capture resolution to firmware when S_FMT is called only for
OUTPUT.

Cc: stable@vger.kernel.org
Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9c049b9671ccc6bff6c3af37b77fbe73a8ae3f2b..d342f733feb995cef5e541dda1aa18fc86996465 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -171,6 +171,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
 		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
+		/* Update capture format based on new ip w/h */
+		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
+
 		inst->crop.left = 0;
 		inst->crop.top = 0;
 		inst->crop.width = f->fmt.pix_mp.width;

-- 
2.34.1


