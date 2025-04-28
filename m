Return-Path: <linux-media+bounces-31159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F141A9ECB6
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 391FC7AD3FF
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F6426A0BA;
	Mon, 28 Apr 2025 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M1EvrhtD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C126981B;
	Mon, 28 Apr 2025 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832614; cv=none; b=Q+BMx6g3JZUENu6K/+GTJXK+GOioLqCC8/b2jvA3k5+13yskYIjZ8cKFm8kqHEF66HiWt2bdQ6skR+VK9mz0QR/fcUX5v96wC7e+o68NkWf28kn3iZcWvSywTSwaJ+C54/m11gteNr0v5GaleBRRO3zg8TcWxFRNLdIziVCYVUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832614; c=relaxed/simple;
	bh=Doic77g6hWxSyKb+SG5pqSqHjXA2npY0Qe9X8zUsDL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ijxWP81FGcbzbcp3SQCWXmoVDblcN0ncAKqtVoqhZuru57TA8AIr+6tsLunSguupyxoB3AB9hIVGgSpmA7FEMLIscQClWV4HnsDBpmT4DK3tKnfJ55HKSXuagmYOqfhaJIdq7L/AfwjUHqpaHAMYNX4WXfeToC9O25o31xN/dU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M1EvrhtD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6g07Z005895;
	Mon, 28 Apr 2025 09:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LcgOdvROOIm2yVrCgcR+gL4CuOIpoKg3qkEy5YeaFw=; b=M1EvrhtDI/9zEIez
	J+qWWXLcUKk+BxZmuZ7HVYP+M0wT+87RYEfExuUX/z4SX2VDnd7MoD/S8NBi589r
	f9tlsmI/e7JkRvH8VGF8gCL9Qhe3P3X4RQz4nDEm2QWi9wIezxgLBLj+7n4TtGKv
	eX20zE1UXcBdUx2rFbZKKeNK3TdafnIK9XWnOj5S2cnyKosyGxEhQc/EhLSWFngY
	dYeIpNSvd2rTiVeebFw/s3ygsltqVHb36OJFVQXVuk77KQF5Vr8oXMV6eDqF2dD5
	V4qLbjvCCg5Ccr4q4sdV4cWLUt1dEJeqvPK8Ni50DArSdPhQUngZXxRjOY366VFj
	/B+xIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5fnak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9U86P021116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:08 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:30:02 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:53 +0530
Subject: [PATCH v2 05/23] media: iris: Send V4L2_BUF_FLAG_ERROR for buffers
 with 0 filled length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-5-3a6013ecb8a5@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1204;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Doic77g6hWxSyKb+SG5pqSqHjXA2npY0Qe9X8zUsDL8=;
 b=Rwi6uidRHVgSFoX9eC81YAc5EUbfEl7Vkot4EX7qzQ03CftkJrfVAfcQfDgKK+9eJfekw1Jwc
 SvrcytyGycABtKc2eTYl69i0ZCvDvTMKYi7XgWBgDPuofZSe+1ekaja
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1lzWpXtVlVMdbqxIfJuLI-huHTM7ZbKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfXyT1iOvpUnemU iQcdWslRxKxxfRrSG3W2w709aCN648p5spiuMMyShAq76y9GUBNBTdh1BdSvUWgbXm/JEg9JWhK GRP/6ykYqnlhdrqbwUFnG2AL/MgoYazVTrYBFn0oLpvgMccRcsMdRmGbCDs7qSJBfMYlECq0J5k
 gVOI6nWap/femqJxAUjkZ9wzYUsRDs19tmLvhycXL6IFP65VjhObfiOsrix3QST/wxoivlGOecm 5+epNblta7DTq0/kSpiDf331OFUYqD+OERJURnTTmo2tii2JiS+VFqCTM7IJ/B0/AdJmsWqLyB+ gl67qDorEHYKdJ/Tc4pbx75bEGexwM05tXfcJr0SUoIcDQJ2fVLOfpipAVMAKba1IFuA2O5J6+M
 xuA7tojxFT+aE/lLk7gh39F5PVLj2gZ1xxnaKCwwhHLRuratMmbCqFJAApJtcG3eaOvw3lCa
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680f4aa0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=nmLn8oLEv6AdYNmoJw4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1lzWpXtVlVMdbqxIfJuLI-huHTM7ZbKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=794 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Firmware sends buffers with 0 filled length which needs to be dropped,
to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
Also make sure:
- These 0 length buffers are not returned as result of flush.
- Its not a buffer with LAST flag enabled which will also have 0 filled
  length.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 0e889d07e997..0eb7549da606 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -377,6 +377,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
+	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
+	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
+		buf->flags |= V4L2_BUF_FLAG_ERROR;
+	}
+
 	return 0;
 }
 

-- 
2.34.1


