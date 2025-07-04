Return-Path: <linux-media+bounces-36772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B948DAF8B34
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21D31BC2064
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F65D288535;
	Fri,  4 Jul 2025 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Js5lWSvK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11480288513;
	Fri,  4 Jul 2025 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615634; cv=none; b=VfxoOFwS34R6Weca016yjcaVic9Ynm0901VRRJUa69ETeUZUr7VkrnwnzYaf6UMAtKG/0J0do6Wt5yVtp6BmXsbYFRF1iAhzX6iAvWBom8i7wzyyz41GrzGXVwwzLJcB2iZ4d1AE349QXgF22tgLyxevv0N5XPxzUVqWfP1/zB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615634; c=relaxed/simple;
	bh=qKNLIuy3ZoF5RP+o/JvuAy3nbPtUGAGxVYj197qD6Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cE3lSLLZhNiyGeElfZp7UmDN0m7IaLJIDMZHtgCisL8hKKOI6cj+G25m2nuAwEjE9krVFThYCnXv5e0uXzfBhTYT+o3/0+KwBMCPjKQwm2WcuS1rT/NYIwlD7Drf+wE/n+MOchbDl6scBdV9SEPbq1A2yukOiPd5A8zcw3of4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Js5lWSvK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644Ldkd000729;
	Fri, 4 Jul 2025 07:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xuOO8TwhPY5Xa1BQRz9JYIK/SvvIW7/0oHoaOoVq7wg=; b=Js5lWSvKPOZmaeiB
	vXbsjcs+MCxcRQcQvg3w018VdkBUJYEcWcEgN54XHxrroXoDvHplhVIofpqlwKcC
	6TgICln8QJtl+c4tk+QK68pnY7nfZYdUgGRK9mgjWlVFM1cK8q7bPhL6WKxANe8v
	kD8WN0uUT94inwz8zoYTT/1JG57/Ij43Ds/c0ZBY0iZsndBacCi5cYgr4uimh6dX
	f+E5ahyvh73DmGbxKn0QMGDksEBDSi0db1L0gKp4d3jj9CaTlnnGP+80R84M2Iuw
	SP4zCRMWR+IbCSuQlQ1FVi/4H49ywp7P1g83tm9gHVSUCIxlH42QK01dbddfH1m3
	jPs1ig==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47p7ut0gdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647rlXM018886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:47 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:43 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:07 +0530
Subject: [PATCH 07/25] media: iris: Always destroy internal buffers on
 firmware release response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-7-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=1945;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=qKNLIuy3ZoF5RP+o/JvuAy3nbPtUGAGxVYj197qD6Ew=;
 b=1qD2MewfHHu4Gao/BCIciw1+yvi7LTPluLzqG2weut0Lhf3RFg2F1QKhyDBZ1kUOH5n36OPXu
 rJIXF6fPyjED0LV+z+z/H2gUzSOPVFz567SVsWynAdbUHMHpWy7gzt9
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX2ETE6+JQRSb8
 A+L3ckCPwX8Y/ROKfyRl9rvQLOLJWYvfnkLNB3ZzLRu6CFVToUrpHN15vdevsMuS2aNONooHC24
 /mYME6PUE0aWkT1GGgtikK7GzMu34KhXsZG4c3NQGcYUgNC66lrR5o0szeD/a+DXnrKbfyZrf/j
 TQsWahfD8C9IuAXGkbqAG5jwV/Iibeb5tezAfxujMmIAIW70q6S3IzHtKemsMSGmIgYD+BueW0G
 vt/a6jAYAq6i9QJKGFB3IYn887l+CO9p6stHdDOH7cm81+fQO9CxA8jFWkXOkcqcaJ8a1PXE2Lc
 X1OIFHtPPKUNaoCF2a92a+eMe8qWHfEj/zDiG1887Zzx+a4mutZUvgQTeGYZ079HKKKao1sndkq
 QNnNU2+9VBVCPbEZzS7cRv94Xt0jX/Qw+cTydhj8jUbjXq1cLBCmZn8HB4F2R+dSwTEbvi5U
X-Proofpoint-GUID: vjuuqlsIognHLNA3W2aBeYBaKxC_fgp5
X-Authority-Analysis: v=2.4 cv=Ncfm13D4 c=1 sm=1 tr=0 ts=6867888b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=cv9jiV36alrmsoyKlDgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vjuuqlsIognHLNA3W2aBeYBaKxC_fgp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

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


