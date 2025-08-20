Return-Path: <linux-media+bounces-40360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F76B2D7B6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 535E03B9C60
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABBC2E5408;
	Wed, 20 Aug 2025 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P8FmR6hq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E92E4264;
	Wed, 20 Aug 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680902; cv=none; b=uabyZkg6J/lwIG/5ABsMPW/L7Btbs0V285+RZDSqWyqcO9eoE5sixrtR6TQmw6T3/afp1veCu/6eSveZUG3oWkekR+1l+Xr4IGnG9B9FX+MZHcAqglq2R4earB7fsH3sUaSLJe3yCTCB5zFz0dUh1y+fF9ceOUWsPqSWhekp4lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680902; c=relaxed/simple;
	bh=X9civkustG0N9IjMJkrwgw2XmVohegxIHOPzeOeA37o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TtLMrUrJMFpJwRxAToIo4A3tcXrF4+NutgwA9l/q4ZeOLQ79IW27G+AnjalewWTo1b5DXYTVmPXOgfZMMXs9f5S5+8u/hcm3g3LBbYWZAvo7Pg3j/xnO5gbFnu0zW1TL0PEO9uLhG9AsszIDvANVAtUouu++gxHNbXpOpfLH5dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P8FmR6hq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oWlD006121;
	Wed, 20 Aug 2025 09:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87QtSVp91tgv8c0mHfICgDm87fjrq+ck+Iyo5BsL8D8=; b=P8FmR6hqYrXgl82X
	ohspcSF5/iy1NJK5qD9RHG76rX4Fgveo3sxWIzEUJiJ914dSQQXP9mHdaoFjjIBJ
	8mG3fd0ZSrw8EfSsw40YRtikv22QSQSiRktcPTD6Nemlq14HcsLXXcw3Pg3acpak
	tdglSoAOUMpUMQm+dK5g1mAhyQINwgQa3uwSO2BNo8WRFhOTkqbLA8eEdXP2x3I+
	Trg8HPAHhjekI97YHkPDF/Buz37uOc6kI+EYs2zT9xxct6xpSLuort8wrt7FQvWD
	bkPpRbiZCmqvLni0jFMW7blA00WBZvjP35Ix5PU9AeTZL/VLrBlCACK91J9rqM6O
	GlMjXw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52913x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98FTI004197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:15 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:11 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:44 +0530
Subject: [PATCH v3 06/26] media: iris: Always destroy internal buffers on
 firmware release response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-6-80ab0ba58b3d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=2128;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=X9civkustG0N9IjMJkrwgw2XmVohegxIHOPzeOeA37o=;
 b=Qu06mwvoXbhcUmhEY+3PMt5uBhoTQXXfsNN4tdePreCWhDxbIANTICfKNb7XMM1KvBewBfLTl
 r3F3+LXtV+zCcyFhkbwFqsXy49qbkszv87q4kmT7+qJIVKVvN81B3op
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a59080 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=Xei55S-jlXPzQILQ8u0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: cdN5GXJlysXNZ6HGKPS6oLaWfVUmzDkv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4YoB23+rl0d+
 KU4phePcwdkH2LchhCZZZSH5+LVI3h+pkGx/fkC1Pk+v9Ue8FtZvdXy5trQy2Uv/iVRIs+mTV/z
 S9j5IBY/vZMVXglRHRbWb91Gl13wuvo9aW77wn4arXx56FVnjtX6FkLbH+TQlqb9nf0ET7hC8SZ
 Uj8Q7pYAbzdx9KaSC/xbzOWMEC+2p0ZDNPXgu4ThapUtDNzYvf3kBqxVHuMvFPd490BT/4VZXYB
 pSXQQb635vO5ZEXaV4IBk8vm+WtTqjN4ruR9IOEMKx5mMPCeltC7FY2GVfvXtfDGvUijMmz6FkW
 hoO8qucPUN8y8SH1bMEd55AviUcSMUecFJ1+Wt2zuFQTosCAmBXg9jvt1mqNTD88epB/yC3vqSB
 yFJlAxW2VVgCEjmtg5L1ls/ctSDwHg==
X-Proofpoint-GUID: cdN5GXJlysXNZ6HGKPS6oLaWfVUmzDkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

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


