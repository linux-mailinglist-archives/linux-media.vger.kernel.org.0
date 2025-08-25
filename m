Return-Path: <linux-media+bounces-40874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC4B3370D
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8997E3BF643
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7D11DE4CE;
	Mon, 25 Aug 2025 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SB57aSea"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13828688F;
	Mon, 25 Aug 2025 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105251; cv=none; b=CeEd51Z6PmC79y+2rwzDI+6D+Z5u7ub1z3TTWvXY7caulS2HLY4dCr0Uh5AhOmjSfH6Y+NjEEsF4aRmnuTWq9d0oTBqWY1sXVyieUUqG0ghY/McgCnG13B0rvdjbEXlBR6Q+IerduE/ufq27GBGeP4JBVQgmg/X06miFEXLUeXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105251; c=relaxed/simple;
	bh=eLzJxzCCdPwY4aGeT5PhrBkrOh3EW3h97umQuGRD07w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=H/fOMgrNbSQb1m/f2cwo+oAvwwmfFrDx09gwm4q9f3YDc0q5yhCrS81CeY1MtW8JhITrm8BPcfg2CVfHShszrl3VNUiJw84YegD1Q4YXRT0tehlu+PxVJ1eiO6oBVRX26QGrtx5UZkz8pyv1u2N1Gk5HoZHugt/G4cSZSRN4l5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SB57aSea; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OHPHBM030813;
	Mon, 25 Aug 2025 07:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eAVwu0fFXnnP1tisgNTYYL0hpA49uc0kxtUjfrjGQY=; b=SB57aSea+eIu2B3V
	M+2G06rJi1ySW/J7JRza17bTdrXK87ugPnyyHT96iIOuS+9cxEB+dz9fuxH7rZ/W
	YwXoK6IDAj01cvyKyQKVXWABPyphkMoAy5b/7Nf4Lk2g8HH0oSjVvc5E81nV2Ngj
	+/OWXybc2nQvsqGtlXE6JQBsSQmcTQ4AbgradYKROL9PCJ1jlGLEcqXKKWuOsqA3
	Dchk8D4iVhtWzErscm5C6GcZeJ5+sT3mDrRrlVoCGqYtPwxLC+Mag91ALddj2IXp
	z3VZYZ6WGaRZdx8OlzRxoNfRDSBKItk+92MSNlOd25Qka9Pv/KiVep4LObqZd5da
	O9kqVA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfc3x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:00:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P70hT0016681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:00:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:00:39 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:25 +0530
Subject: [PATCH v4 01/26] media: iris: Fix buffer count reporting in
 internal buffer check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-1-84aa2bc0a46b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=1541;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=eLzJxzCCdPwY4aGeT5PhrBkrOh3EW3h97umQuGRD07w=;
 b=EHc/nXNvCoUXNUz0WN8qfcEf9avZg+xg3bhZv6iycStBJCH5xOXVQ1+DdNQ9EC4Bdkga3tNbL
 Iz9QftIXE5eD8ztvjSRcqw92I6zSE/qq064PbHLB3PGOKCAEQUzuWGu
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwbB6xu98QGYd
 /LorLSciaQMv/hXVAbSi8S12JUcHmNYbN6Civi3fI/4jtQtda+xPF+ej2twPrSbvjab5YhsgTwE
 SZbazD50h3/iPKCvEg8qK7dFT4Evz31OMtWTU7mxHaL8uiZB+wL3aC6MhlJ/K2vJG7L3qD3UiYV
 r2DrjrTBo4S22stjklom3euJOKkqGxPKcKJkR8QDgWsGNEqGt/Svcndt9kC0+z8RABhC1k2G06I
 idROFsgB/GLR9VWvOACp8sCbKpK6Mi5O+p8PtYTTjfNl5yvhU2DKrZKPg9px9r/FthyQ1TajuLN
 pR/0LPoSHJDHgo2x+AYDcmQA7gbHNZA7Kcsj/ZWRQlytcZR76QLob2tArYDjxaVv/NrSlRZ27E/
 ZhpAr0w9
X-Proofpoint-GUID: b6VwJAXA56PQUUwv2Mec0oSO3Bz3FC5O
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac0a1c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=-BUsXMgqhKYdWNcrEH8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: b6VwJAXA56PQUUwv2Mec0oSO3Bz3FC5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Initialize the count variable to zero before counting unreleased
internal buffers in iris_check_num_queued_internal_buffers().
This prevents stale values from previous iterations and ensures accurate
error reporting for each buffer type. Without this initialization, the
count could accumulate across types, leading to incorrect log messages.

Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 541ae86f7892ab7ca89e9d5856ef10d189b2fb32..cf150b32d6c2f9c7e1da7abfd5211fdfc469d96f 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -239,6 +239,7 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
+		count = 0;
 		list_for_each_entry_safe(buf, next, &buffers->list, list)
 			count++;
 		if (count)

-- 
2.34.1


