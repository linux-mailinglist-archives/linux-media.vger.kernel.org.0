Return-Path: <linux-media+bounces-40356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 632DEB2D7AE
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EB15176F79
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEFA2E2F0D;
	Wed, 20 Aug 2025 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l9F+X+l1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF2D2E2EE5;
	Wed, 20 Aug 2025 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680887; cv=none; b=cpn203oCKcxedmHqaQrfSCf0gfJoY2+cDKUylHs6xnGcYXL+fx9i4P9XZ5Bn7FeD3AvZiQWy2mJ9Sa6HTTnXn8ON1wqNISCL3WnHpuowEFXNtyj1QeToWg/tiwo4XXBbP/IYRzirg2Ri4q9lI2CLsa7qCx9mF5wYFtY0NfLs14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680887; c=relaxed/simple;
	bh=+K7yzpXl8AanFY7sdTWmTqAVwMBoGXKx+9dzef2AJ7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nxzLzq5qPPaDkP0VoQNSKLqszPske+oSO3ctAXj4i8ZMSoUY8cDxFIkTebto1zT7IQ1HE9YzrGr3YZkgCJcTbCMfByXZUEyx0y3JzzIDGpPOS3uy9t7hdfvn086R9pnKfwxwUMk5ia1RoVa8RPNXf8ADetxiYmX24PJ7OB50bn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l9F+X+l1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oam2019735;
	Wed, 20 Aug 2025 09:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIlIY8jNsJIJIa/A2COaVil5MS8jN/pCXGW2JEv8M/Q=; b=l9F+X+l1VsSrPqWB
	fHU53t+HxQpf7ZpIosgO8ss0cquapSVmY2DAJLxLGdxGarEKNKuSwnExs/6RnrAA
	cD6A8P1FIJ/+AahW2LziE3uy7j/2MvA8EVuWQk/dgAaNvYwreAMgVI12TSAPqECk
	70Xy6xm3oUq6rvSj+WhpgoELLcM39KJixQDGQp8BfU6F+MnS5l1GfthdOtHySvoU
	dUBHaTMWkUEB9J9eYOQijgeErOppbkx0738rNfHYDmj5izO+ZJd3dS04E9nUO4jO
	heyFbAhbNafMh2pSuSxrP5Kx0zrKWEzn1NpotXpeux/oY5nrg2OaF1Xtazqz1QNT
	BipeMw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52913s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K97xYA021021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:07:59 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:07:55 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:40 +0530
Subject: [PATCH v3 02/26] media: iris: Report unreleased PERSIST buffers on
 session close
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-2-80ab0ba58b3d@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
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
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=1485;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=+K7yzpXl8AanFY7sdTWmTqAVwMBoGXKx+9dzef2AJ7M=;
 b=55BXnyZ7QfbHAuXpHB+K10ZNrcpORrFCmFLxMl8PmE0Y0JHNYLc83Wht5RGtO0+t5NevbhdaD
 fT4x0F7AdacDe8F9yhoDlZlNena4JUu0Tn5ggUiOx0PijlB3qGI0vsY
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d-bC-wwdI1_Z5ODQh8f0UiMXN8otXmtC
X-Proofpoint-ORIG-GUID: d-bC-wwdI1_Z5ODQh8f0UiMXN8otXmtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0v+r0SMlREG2
 G+CbrcpM9KhOQnWhna9fcZVE4XVab/Gch3BpvYVVuf2SKL0ewjXGO7Ihu4GBgvrOA9CSekMsOio
 15cO2SfV4uH2xg6XlxUtdwR6R3zcW62ldRbIcUjTI1NTJleMTGLS5rBAX+a1zujHc2987rwS2WE
 cq5aBJ7gKsjfXFAl1B0GtZudkO/0QxQ2i2urdq2fQvlIcQRq5ulbFf7WIw9+WVY0fJcExdZRbSu
 Ntv8oZhtH6mPlQ/xg/XYrZXEbWYlaoPm9cTrSXXzcEAizaudkuzNSpMazecOTtnzd5PXtumuzwI
 gB94TVDlbCFiY89KDOMo72cQ2jpvHfKeluJ14CrQ4cHECkWOqoeD5doq7pN0QLmcKUUvm87kVeO
 Gf1mVaPGpxzylPj/gEX2sej3LLtEUg==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a59070 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=r7dkYRASveuLtx3RUUQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add error reporting for unreleased PERSIST internal buffers in
iris_check_num_queued_internal_buffers(). This ensures all buffer types
are checked and logged if not freed during session close, helping to
detect memory leaks and improve driver robustness. No change to buffer
lifecycle or allocation logic.

Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index cf150b32d6c2f9c7e1da7abfd5211fdfc469d96f..5fe7699c611583463231a60058d6960b6749edf5 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -246,6 +246,14 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 			dev_err(inst->core->dev, "%d buffer of type %d not released",
 				count, internal_buf_type[i]);
 	}
+
+	buffers = &inst->buffers[BUF_PERSIST];
+
+	count = 0;
+	list_for_each_entry_safe(buf, next, &buffers->list, list)
+		count++;
+	if (count)
+		dev_err(inst->core->dev, "%d buffer of type BUF_PERSIST not released", count);
 }
 
 int iris_close(struct file *filp)

-- 
2.34.1


