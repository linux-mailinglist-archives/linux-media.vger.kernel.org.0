Return-Path: <linux-media+bounces-32099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F0AB0D88
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43C523A3F72
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFA827FB2C;
	Fri,  9 May 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KI4Kndx2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0862227F16B;
	Fri,  9 May 2025 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780013; cv=none; b=d9+bEiHQUAM3wFeP7qIZhU65WUvAOj88t933xRyeQoD7oG7oHPmUT2fHl2OEtYlgAGcI8iM6cUMvGktweAXAJiyjlr/wO6IrD6gNeRHpBV/CS98wEMZwRhTMXGdFjoy60CalVC16o6hBmxjRuVUZaC6PBcslQ3R4iOssKUkTxX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780013; c=relaxed/simple;
	bh=UUV+aVIgUrZz3xh13Lb4YKC066GyDBdky3+aeQ1yVkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qJWo5iTMod1aWYw1XwZlzH9wY1xSp6etPewbBvkM+/4+4dQe7datoaS1Gw7PVZHIjv9axZFbKTytn7c7jSgIz7ilype6iXCZLJIv3bPOdHxmZKrrYW66vctfaZOitkXAE12SYnhCgRcMptbVITPUmH1vPa/6mAkqks/GvMkjD6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KI4Kndx2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493MkWA022873;
	Fri, 9 May 2025 08:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vr92y2y1oZNqSlwRVVwwqa8/lkj1iAB4KPlKwa7yRI4=; b=KI4Kndx2iYJuzUdb
	SIFJOWaJSuApVGbwBiEz+60sBkTYmOcwP64NRGk8y42hXDO/LRizcfZ5+Gk5hnKR
	AEHI6jMrGMQXFiHoJuRtN/tmUvzqj6xyX69Wbo6sYflKLS+Zerj3VVnz7dGaHs4F
	Jtq8LMkCM79BCC2ecswzy0yfu+wfM227mG18z5no0OwpQKZyv07HPzqWG24NBCWD
	h0I9/DA8hUYD3DnSVKsCmX6rluhxYvaJplRodHoxy2Nq4NtzuE5skyheAHXfmsBi
	274Mz9RXae5qLbEyL1Zf6BRkORvqt3Ydxrd4Sx3v1SoOeXJgAWT61hut2F6ljaFx
	Y6Zh7g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp840ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:40:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498e7tB013129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:40:07 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:40:03 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:09:00 +0530
Subject: [PATCH v5 14/26] media: iris: Send V4L2_BUF_FLAG_ERROR for capture
 buffers with 0 filled length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-14-59b4ff7d331c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=1689;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=UUV+aVIgUrZz3xh13Lb4YKC066GyDBdky3+aeQ1yVkg=;
 b=UWXEjs3wSoWaXOccv+9t7oyw0VtLsUBcCQMWUvYYLx4LW10lNV2UHIdM/i9771aExInKUzvFf
 Fcz1Bojf24GDdQ9jiRKc0x0mbTc+Vp24B7dBdjO9bJsKJ5NXNSmCQLv
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681dbf68 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=LvXDYVKuO090uWtrTYMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DFuJ8zD-nRKMxCEoLAxnOnFZ1cm75nu-
X-Proofpoint-GUID: DFuJ8zD-nRKMxCEoLAxnOnFZ1cm75nu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfXzk8cSkWYSSpi
 k1rtU9zlI7glh68xYYjy18hq7fZbRRfC5jCvKGU38yWSV5rBJoqhIWMZHrsoj0jPYd0s+9sSp+v
 9dTJR1KP5ik1SwkVBG+o9s5daHddvNMMg/Q1Tb5JW2OPtEdzz2H8MJ0p53f6SGlEyEI2jhacQ8O
 /G9Nvajt0/v+c4KYA9YzR8dxq9XYurfd7svGRyZEVzipMsT5vJgmHY7OiLKCvadJ7BpAerLTQbm
 uWqZrcCx64V3DNJM48D5lDI8JrGmHnDeXWBJq46mfGWLM1Pwi5DSst6BDtfNUIiocIVIEYOghUB
 Igll6ucvvn7FfAstRGESFYWF/x0r1pqcBGJWky6PATgxMfexqQXmuCgWWMbFM00LP1WSfen962Y
 /hiCNNE91lz3GM1vajIJfzS7HClh41CXsr1VsoxXuc2rChqjUB2Uw0qz2XzpxTZXF64vV8gJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=696 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090083

Firmware sends capture buffers with 0 filled length which are not to be
displayed and should be dropped by client.
To achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers by making
sure:
- These 0 length buffers are not returned as result of flush.
- Its not a buffer with LAST flag enabled which will also have 0 filled
  length.

Cc: stable@vger.kernel.org
Fixes: d09100763bed ("media: iris: add support for drain sequence")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 4488540d1d410b58af02ab82a3238ccbe40f7093..d2cede2fe1b5a82cbd4dd399860c43ef044d687f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -378,6 +378,11 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
+	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
+		buf->flags |= V4L2_BUF_FLAG_ERROR;
+	}
+
 	return 0;
 }
 

-- 
2.34.1


