Return-Path: <linux-media+bounces-40883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98122B3372B
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3216C3BBE9F
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA31929AAFD;
	Mon, 25 Aug 2025 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bve5Rjhn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063C5288CA6;
	Mon, 25 Aug 2025 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105303; cv=none; b=Z0oBGOmvKIYL0dHf0fsD1jrzcC/Jl5oZsZQ3ZV3MZ+4h3hUI2wPpbXOrlaqdGZd2YpK+UB5WX2z6lSrMohQoLA0/5Ewbvb1c+kiW2Zjpe7HVum5MW+5Tfygkwf7ABgin2m3Fr7+v86lcd59jjq37xRYPa4nhTNEJuDp0E1Rri/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105303; c=relaxed/simple;
	bh=VPYr7cSjczXy4Fpfhaf/msNZRN4gG37Qjd4Za8VrptQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ByR6il4xvopfHfolDbwt4MRTUZTiMDh5dfbkx0cbJBeg4RkhP872K/DaIC/IODvXCIF26w0babuv/UwBUfZBuTnMQmDRB6+zQBN5pGrv2BgTarMRwOCO0o9SkgsBYQfJuyiMMTyw/Fqf4++h4MJJCC6hxep1RDvUH/IRPD1Zgtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bve5Rjhn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONps8D012900;
	Mon, 25 Aug 2025 07:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMpMi8VzkUjk85YgesvBKXxi+9ajO7rd2sEnPQSaPuE=; b=bve5RjhnB/rW3zcs
	8oJA61k0VMU5UNHBiO9H2x7BX76V6rsTvkdEENDyDIBmCp/+OWGXmtQbLuDdALRW
	RduSawXPr/axEsd38txbU2BRSMlLinuqCbd2teG3jGPV3kDjHjlkryu/4p0bf88i
	0d6BLEL1hPaXpFruowKk4MsYh23aRIfjvzJeaO6J5iEJCDK2XShLnneOPMIWHt2z
	4pvzsja5GAc7AnpQToZ12P8ivo2I9hFSWs24RgL9rHjQGi3Q+ZNTwASok4PhqRDn
	g7z+x1CgbPnXufZewHAeImWrq6QB2hOD1pEe4SIASa5KudWPNpWLKIYNALo9ag7B
	yvd+ww==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc40js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P717jV008623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:07 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:01:03 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:30 +0530
Subject: [PATCH v4 06/26] media: iris: Always destroy internal buffers on
 firmware release response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-6-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
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
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=2270;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=VPYr7cSjczXy4Fpfhaf/msNZRN4gG37Qjd4Za8VrptQ=;
 b=pjHu76xkYdKc2ihTk0hXP2Rx9qrhVlXkghPPrIpOIcfha/INMCjLbGhGWhVYJCBF8aDD336Nl
 zTFQybL20ByDKdxvzCa3g3McJEKs1KAYuT+OWVbUFXFA8mqGzxgLUGN
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX6hUge6GA0YDH
 uqk8C9zgInZAuXDTV2KHD+sYrZ8lvRRrcxcLMqZhIGwmHJ22B7dz2aNmkYXDWjKCyPIsfFcx4PN
 wtZJqQrLHJWuJBgtQ0J85JsDwX9CH7zkHCA3IMxRpgyR15gOaimvwAzMsyt7BXHCvzRzPoTkqR+
 97IONXgUphN8mBPZZVkfYMF8oA2lEYhhTTNKOn/f7KjnnFswzs5ezp32LiUbY5XJ75X16hSWDFt
 auK66RYo3KYbwX133qrXsC6lKw5F/Qt54aXMs7xhb23N883jx5vVVbZDDxfczTPd73nOQsk/TUL
 H2j1eTK5CY2s09RiTnrA+yJHS6NfyZ1goDH8809Ka2EzcQOPDwZliK0kPQv0pUfZHAckLVyRihm
 y7bWUlJ5
X-Proofpoint-ORIG-GUID: 9JmPY4w1E55BOUQfbT78xGndSK-vxM7W
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac0a34 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=Xei55S-jlXPzQILQ8u0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9JmPY4w1E55BOUQfbT78xGndSK-vxM7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

Currently, internal buffers are destroyed only if 'PENDING_RELEASE' flag
is set when a release response is received from the firmware, which is
incorrect. Internal buffers should always be destroyed when the firmware
explicitly releases it, regardless of whether the 'PENDING_RELEASE' flag
was set by the driver. This is specially important during force-stop
scenarios, where the firmware may release buffers without driver marking
them for release.
Fix this by removing the incorrect check and ensuring all buffers are
properly cleaned up.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index a8c30fc5c0d0668cc9980f2fcfcf21072cf9ef0a..dda775d463e916f70da0b879702d96df18ea8bf7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -424,7 +424,6 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 	struct iris_buffers *buffers = &inst->buffers[buf_type];
 	struct iris_buffer *buf, *iter;
 	bool found = false;
-	int ret = 0;
 
 	list_for_each_entry(iter, &buffers->list, list) {
 		if (iter->device_addr == buffer->base_address) {
@@ -437,10 +436,8 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 		return -EINVAL;
 
 	buf->attr &= ~BUF_ATTR_QUEUED;
-	if (buf->attr & BUF_ATTR_PENDING_RELEASE)
-		ret = iris_destroy_internal_buffer(inst, buf);
 
-	return ret;
+	return iris_destroy_internal_buffer(inst, buf);
 }
 
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,

-- 
2.34.1


