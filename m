Return-Path: <linux-media+bounces-39758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8CB24592
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4CE5560E68
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F4D2F2903;
	Wed, 13 Aug 2025 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lFI3V9Fr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC662ED16F;
	Wed, 13 Aug 2025 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077912; cv=none; b=r2LKDHKPzOTwJ4g7q5FcCZEMexmwcCrODtjOMJkbxHnPon9bUjSCVEBhMadBWn+L4L4Gx9p9W32qWdJi3np18culr+kJUWkgglFDmPq+Uj31VEH4K2qNhvMnHKx3S7Ycd9mswSIx7+EnO9MRH1piwAygYSg6Q9THX/0CFF2TGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077912; c=relaxed/simple;
	bh=Y/u+eYBvKUv2agrCG2n+i9DmWUGbieeoGBaXcQNGCCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DCG0yD8c2HB5vmQUUM2F2MF1xA0lasx3cjOCDWtX7HHk3EMwoq4yAZtuMkcMC7ntMf/X/Z6mneRrPW8v1faDI95no+w6n7rZYHJ+dduAckupHUqQ9A4nN1DGeUpKvvtwAs/mmy0Cc61MGz55DCem7xw2E3cCc21E/diwaHbx9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lFI3V9Fr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mGrN027019;
	Wed, 13 Aug 2025 09:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Ndvp/8ZXS2FK8UiIFIiCM7v31/5ydGGVIokxsvmFbo=; b=lFI3V9Fr0e2CL06G
	uYft8Z1oGeKl7zVNASo8c0jgSxKAbhVRqbeENmLo8CvAVmiaDyLgmqLpmSmdLIOG
	ju9OSv2ezQ1A9pEsGPktI7ImVpJteHm/aFG8THMBlnm19DLeuxULw04LWjiKkjm5
	5EC6klT4zTjdeWqRwmF36HMtnahZPkpLrxhUmMbu2GeHhKpU0jaFrNkM7K35nKOq
	GGHl2v194MaWQFnpncCf0tXSU8fqGFBLunCSN1UE0DNvJbUKpb8uCvh1jiYmQqhb
	7neS9SRRA6kUz7vcIJS5xfPJbqjK8KuVd1Pz40AcL3RdR1T7+nqVCtCTOHfwzC10
	HuDc5Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmb73j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9cP3K002971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:25 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:21 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:07:51 +0530
Subject: [PATCH v2 01/24] media: iris: Fix buffer count reporting in
 internal buffer check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-1-c725ff673078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077895; l=1399;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Y/u+eYBvKUv2agrCG2n+i9DmWUGbieeoGBaXcQNGCCc=;
 b=jl77x752GtWOL9rdbN6zOqunX09nX/DBuj3K/OkPgVu+yv6Q/peROScXG239XdO59IPcZYg9z
 h0IewYeesWhDTFKiukf9/doSLChMg9Ae/ghE48DYRccxjzYpuEsagK6
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX4IQG3MhmB7Nc
 bKf9cVdgO5FtnJfFmRIWbr4a6/l0PCfJjWFBD6B7/fgVwgIt+fQynX2E8Wh1x4KsKPUzlaEW3Ml
 uLV0EnEQUIqxX8l3V9OV+3CuqFkG1PkTzVDhpVi2V6hjm8iliGBAUOPccnMqy8L3XWWXWALNoIu
 ybGdi+1144k4m/RmO+UO5bKLFiLGofWgxnRIxb26hw5tRBJJHAfvs3x4LglnWnw3ugrKj8Q7w0u
 h+F5btBYpBDv+neswBMv+6p5dpVCpBcqmBERQxHL/ClWH7WMU6QuqW81ol/kBBwbGK6oG7ZVC9I
 76Vr03kCAw4vq0respzbcYc+/0cAkm3kfWzmChgr0WuBB5UP0RZuooXdhSSHXLhav0+y2C9aqoI
 n52ArW7X
X-Proofpoint-GUID: QUpp1eh9_nLl1nbCjBppv41_km7vxUzr
X-Proofpoint-ORIG-GUID: QUpp1eh9_nLl1nbCjBppv41_km7vxUzr
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689c5d12 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=-BUsXMgqhKYdWNcrEH8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

Initialize the count variable to zero before counting unreleased
internal buffers in iris_check_num_queued_internal_buffers().
This prevents stale values from previous iterations and ensures accurate
error reporting for each buffer type. Without this initialization, the
count could accumulate across types, leading to incorrect log messages.

Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index c417e8c31f806e03555cd5e2a662a6efe5d58f3e..8285bdaf9466d4bea0f89a3b1943ed7d6c014b7d 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -240,6 +240,7 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
+		count = 0;
 		list_for_each_entry_safe(buf, next, &buffers->list, list)
 			count++;
 		if (count)

-- 
2.34.1


