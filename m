Return-Path: <linux-media+bounces-31169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E6A9ECE3
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3756D7AEEFD
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB22B2749F7;
	Mon, 28 Apr 2025 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eEvaWt8G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2F2741B7;
	Mon, 28 Apr 2025 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832675; cv=none; b=UG3GlC/aWTqOvmR1GAarJFLCNnz+eAEiBGTUaYRoQThQB11V4EGU2RYUS3JJRfWAlvhw6s/YpOA14y8gZwOkZmFd/JZn6ZoF3hGeQfSF+5hXQrZ8RuvuNXxuNjgtn8ro3ubaIu9g7z9Br5AeUTWWp+xR+3KTtgeK3fBuhdLrUwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832675; c=relaxed/simple;
	bh=4R4CG8zkDSiZq+c+veSlUt/D/1zSodzhhk7ivVJok1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Acttd/LCpNZYJB7riUh9y86vr+T4TFtY+lgdOW651qDtJffWx3+56NHk35ULyLF11qxtx/YGZTm1KO7OosH4lNN5eS+zcnpde0t3HyobD+B8JEMSBRlkIf5byNQG2MTAG2zRCN2RPDK+warv4qdpBL5Vh3nZiP/IvLGl4kHtBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eEvaWt8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8MMJs012306;
	Mon, 28 Apr 2025 09:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BrxRVQJZ5TL24ijA79iU2uaUdyHgtOR2mdrY77s6U6s=; b=eEvaWt8GwnmzHgDa
	1CiG70L91/Yy4hD0oTn1KGPS1G9t1VkWuJKmXcXecZrMXzk560ORKWg+ffAqFtGq
	HbR6/u9PERpkCZzQJ67t3GkfRS/i01Wz17OMg/ziuXdfETna20l3ffAu4+G1FiUZ
	c9h+VrRSKdIRgs95+Zn8KSeNRHN9d93FTObyBCS4Kcnj97CLH4YTm0RPJVV/ylfY
	u7Yy++OJJef53tDbiDYndbX3ztHNttMk349Jgw5pXl3oFafAQSWl672Sqicqn/CI
	JztpaGMgvrvB8LS2ZzV/HeeN+BmdoDGsD0i8V483idvBVXBCYwoRzMFG8j8qvx4g
	nYg2GQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hqg78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9VAkI023156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:31:10 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:31:03 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:59:03 +0530
Subject: [PATCH v2 15/23] media: iris: Fix typo in depth variable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-15-3a6013ecb8a5@quicinc.com>
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1852;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=4R4CG8zkDSiZq+c+veSlUt/D/1zSodzhhk7ivVJok1Q=;
 b=HfyEwW0N/MzcMVBZmu8kEsfeNZjKL6AzbDKh37qqtHQojNqvHnc4Jl47XvyqR9thaR9T6Rbni
 KsmH1oZOFK8Co5miafmMOptIhu1hB4uEyUH8az3L2Fpi0WBx+sX+mNi
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SViy6Onj4CsVh9I5dyqwefJO52d8OqfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX1t5WrpyK9bbN N/2pYwC2Oi/Ys+W8B5TvzfmSR7p3BfMMcw/KUpxy2s3ZaaSHxIN0qFQPNp7EM/hAEtqiYh9PQiY ZY+RxArkJd9G+sucNJBGqOOf3mfY19fhjDI9w4++rLyPICTzhKXiUh8UCzUUFyNQNGUJCKoNlRr
 Gv5ASax8vpPGd+2Rh/2CQ5qSqcg7VXmdRxW8khj9PPxAk5zp2016j3CRYuPPI1FncPl+Gh8x+4F LD1gl89jm/DwZ+8cLHMnmrsuaEjzHlBSBPq5WSR3plFyvqzlumfdUKuPbQkRre4UZnCg14w+Poa yojAUSPLLwjUFdjIhbjlqootDKtU3k6RZsJDGnp9yGl/gLPO7herJVuvgSOF5qkYuqOis/BHjbj
 OUXZ9woDLyDzXjoQiojyDI706RxPxkJ5qBwXFnebunFdnVothxB9DXmb8FJpXgBQtciB4yb6
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680f4ade cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=rB4S86NHfeBpNGRUqi0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SViy6Onj4CsVh9I5dyqwefJO52d8OqfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Correct a typo from "dpeth" to "depth".

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index a908b41e2868..802fa62c26eb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -178,7 +178,7 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst)
 						  sizeof(u64));
 }
 
-static int iris_hfi_gen2_set_bit_dpeth(struct iris_inst *inst)
+static int iris_hfi_gen2_set_bit_depth(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
@@ -378,7 +378,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_BITSTREAM_RESOLUTION,       iris_hfi_gen2_set_bitstream_resolution   },
 		{HFI_PROP_CROP_OFFSETS,               iris_hfi_gen2_set_crop_offsets           },
 		{HFI_PROP_CODED_FRAMES,               iris_hfi_gen2_set_coded_frames           },
-		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_dpeth              },
+		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_depth              },
 		{HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT, iris_hfi_gen2_set_min_output_count       },
 		{HFI_PROP_PIC_ORDER_CNT_TYPE,         iris_hfi_gen2_set_picture_order_count    },
 		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },

-- 
2.34.1


