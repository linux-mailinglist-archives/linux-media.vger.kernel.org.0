Return-Path: <linux-media+bounces-32088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62184AB0D4C
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FE614C6401
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF1027465D;
	Fri,  9 May 2025 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cwh9i+r2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B542741D0;
	Fri,  9 May 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779965; cv=none; b=U5v53x+7rRLF1+J7kwG9luKkFoNXmJCDcvDBnKoEfZJeTB9FLHtba+VQquujPlT6jYfPZRur5RaGAXAg3lr5u0k8KDuzM3pnZtd/LcOCjWUanz4seOYB7J8NhOEkGUuMtCZDoAzWcmiiO+inZF3w23KWOoWvPfnnboQAjAF2FAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779965; c=relaxed/simple;
	bh=q8aBs5RYuczRYMW7/wHXd1bCGV5n0uqNwnR/gxEN0UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Xni28d1x713a61Or7neh7fFMeYzjuOYp57Vhz5CTs/eo7yYmmLdA3/ds+VmGxfnlfzJebqVTn31c/Fhx0Xz5PZNAgZMrlwlkQFhf3TMxpg0p2LuRhlDVkLKhg8zrCW91kPzt4paIW7chr2XobpZl7nieA/TguhvQ73W9JyGMi1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cwh9i+r2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491xBCT008621;
	Fri, 9 May 2025 08:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKM6F+aPwbU9gIOiyIzZdJcTlOMEl66Pvx1uxfoo0YY=; b=Cwh9i+r2UnDQWTiR
	KGS4gi2JwYLfy+qoOmh4uvh5NAiABmd7JDgos4laoCrAQSNQdfwXPsQv+K2m890X
	ef6B55Se+5j3DU1wFminZOJXwOWbJEoswYqKZ5o/bF6IHFxeaQpFKXq77yY9TUcT
	MITj0l6qYGEZfnTWUA75X//uzScaFbJcmir5suhnCjrM5iZnYCD3fC5W02HIBEkN
	ezJtWV/muFAxMC/z6jW2xpCj1iNBwkDL9yXnvaj1naPK/bbd/xme2AcM7T8vNzjN
	BSDmr2ICyopGp0NXHC/t2LXMc1dDkOF8EPLrtilyutuMLJuO21Thvsi6tLQHzSO4
	uM5RSg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5byc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498dGF6030877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:16 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:12 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:49 +0530
Subject: [PATCH v5 03/26] media: iris: Update CAPTURE format info based on
 OUTPUT format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-3-59b4ff7d331c@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=1794;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=q8aBs5RYuczRYMW7/wHXd1bCGV5n0uqNwnR/gxEN0UQ=;
 b=twtpTyueaXYLyFRw3gzzXxT2R4kcTwk0KJG1KA2h+TnHQSxrc4gWFKLxMYRloFEi9A3I/CqUd
 f5MX3StJb6XDaaQ7RXAQuZd4b9Piox7wmfbaou2c5oeqrmrCfRgj2Sg
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681dbf36 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=H4aCPc18VLGkYZj90ZUA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lmWkAwltXLAn6sqpHDUK7ujetTxz4sfd
X-Proofpoint-ORIG-GUID: lmWkAwltXLAn6sqpHDUK7ujetTxz4sfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX8KBcsZPRzf3G
 7YdAR9EpvQ6MJXPdV1eeJ7yud2La7j7RF7ION1fLJDVXA1VshddmXw2+Ck4gs1VQrQDIWUcAw/N
 6Hi0CPTqKKSl/80NnfsC0eF2bNX3Hk05qjhRtgFVHikefjuOQUCVXMZUDGBSObsnC/eb3NHJqm8
 Tr/vLdn8lSGY1QfyLHnDwWq7gSifU5VLOtdtP+Xkot2G0jrMa+5sr9woHghb9iKxwnGMThbYv+o
 wlax9xj8iCVMyqwKsAVj5QCVtvBWvMa7Xc0eifGtjG9+s8IrmkuvrPxEZ2zv85ONNO/+cqRGgkv
 MkNzaE/H2JnmWzgEcIwMrpWFPN0FxloPWeA8p82p43SZjgi6G0xh9qXQ426DTxVCUQ1IPTUX8UY
 QXufS+svy90iUFlzKOhe+mU7bUaHQjv1hITP+bPlud5L1Usynp5PlefXmT2tdcthLCAHEqp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=998
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Update the width, height and buffer size of CAPTURE based on the
resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
updated capture resolution to firmware when S_FMT is called only for
OUTPUT.

Cc: stable@vger.kernel.org
Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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


