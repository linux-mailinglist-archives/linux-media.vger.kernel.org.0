Return-Path: <linux-media+bounces-31525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CE2AA63E6
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB3851C000F4
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832A222B5AA;
	Thu,  1 May 2025 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NpIvRRr/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D4622B5A3;
	Thu,  1 May 2025 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126923; cv=none; b=bW1l5uj7BykEL0Zmcpzxz1mAmYbliH8Jw3Clr9M80L2X0BPCW9kCLHIsyeOYIBq4uvB1CBR5bJhJbiVCaKrduhMgXPLtkknzaDgeLH0dH2Y2NhFBWF775uvB7069gLMki+WlRLvxxwzteFSFis4lEbk/Sx6LztxPgUgQTAzqpLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126923; c=relaxed/simple;
	bh=H2sLNS/OXda9+rtuEctUv4VzQdkkCtVMe8ZbFQ46H9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PeqjqxFJlmwV96CU59hRXhBNhSoXMpYwjqCHIVl0aybhKvCy8G6OLwBeFa2bHLOFqH9Od/yJgMNPcD3g7W7GHHohDgBkR/TLxxGWEhHSDu8j0S78wgcg9H8UFHFVLO2oVHWvMJUNTYU+bRJvkHbg3skkKCngoR1Fpq4Pb9dtiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NpIvRRr/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D23FH014432;
	Thu, 1 May 2025 19:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMJ4WaG2ql/7C9ZUhCzRG58yTrpCHmLbGMwmYQYll/Y=; b=NpIvRRr/Tsr/IXYm
	yBzOqICw5N9uXtkgXrlLzhqNzS05MHd0FTyj2DHh4/rQkrIjXAQWg10Q4Qns1ToI
	2Ar07Gbpv/69Yz5NjiB8l+lkOqGVNslbbT4+rcGOm6QqOHwQbcABwFVFaACVEHaf
	nMDkDz7uqIZ7h7hrgU6XFhPJxXgFV8P+zwO6OsNjATqAqQV/0D0me9Zh2ghUJlwi
	KtCLDWA481s0yWfLGUg8WPjJ+nFHCVNj58bdkUJ+7eI5ohU8cYYz/r+fFyhvGO6T
	dYxz9F1QZbdv+sZjvkwyb+Uup59YWrLiyZpBlVU2cAXWzNvl/ZESE4H+rbTriCCA
	nX68bQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u766vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:15:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JFFKA016512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:15:15 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:15:09 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:43 +0530
Subject: [PATCH v3 13/23] media: iris: Send V4L2_BUF_FLAG_ERROR for buffers
 with 0 filled length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=1258;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=H2sLNS/OXda9+rtuEctUv4VzQdkkCtVMe8ZbFQ46H9E=;
 b=OaOhjtqfJKm9ZF+hI75OaVe9fMVGTCh2t+ZeYeW/8yEF/pONsSZFSmBqDdxvAzWiN2xhI2oe9
 nZu7y12BVXLCXElE6vv9rDt/44a7cM0Fi0A3P1K9RRdwQZ0mXxqzZlZ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfXxfigAJRDh1+A q0UZIx9pJiLywOz4UKaUJNOHua7FmP9uWCRhqLe7mbDnBugXnWNIzJ+5BHGrnVpvkPRIsuFfxjG SLzc4DTzhUQbLE+wr/32U9ZRhPVL6kjxaDADKA6gHJV3SIZN+iSw4i0oRavomiHFBB8vyX4i3pj
 0bqTGHXAcs8UanJ6T/rAcZlH5JyGVHP5kEctuXHPdJ9yC73syKuMRn8WUar3NhcxyjG7mE3rpUu GsJJ7BCp/QoY6/0HxIY6HMvZMUnKywxyoycR8YNABQXxcyk7fTJlV1qZ/jnb45zZvdqxXTf5GM9 5T91KKalVs+499U2jLw8TYqAv7WwU8bkQMCPihb7q35uqzx0NiTtPoZj7N+N+swZOIwDuSDHTKb
 yUkg/UNVY8v0qxvTIyWBDBsUqdN0tXQINNx88PTK7xFXULy6wtm2g/Xv5o84t3gxm/sKEAeq
X-Proofpoint-GUID: vapTZIhcfHeTUpzQOjtP7ajRP0eS0Q3J
X-Proofpoint-ORIG-GUID: vapTZIhcfHeTUpzQOjtP7ajRP0eS0Q3J
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=6813c844 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=nmLn8oLEv6AdYNmoJw4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=792 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

Firmware sends buffers with 0 filled length which needs to be dropped,
to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
Also make sure:
- These 0 length buffers are not returned as result of flush.
- Its not a buffer with LAST flag enabled which will also have 0 filled
  length.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 4488540d1d41..3bb326843a7b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -378,6 +378,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
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


