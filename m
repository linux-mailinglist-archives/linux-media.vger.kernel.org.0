Return-Path: <linux-media+bounces-31163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF0A9ECCD
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E8BF7AE111
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7019026E179;
	Mon, 28 Apr 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ec0MaavF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E594262FE5;
	Mon, 28 Apr 2025 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832644; cv=none; b=RoMrykDvvYlMUTek4Jqb1u37OgcrEq1rmL5xhkWT3nG857aAWRBWrqNIneiQUiYNPYQWCFTK5m85lRR3SRZmWVlVehclDzZvAWM2kjijqcInInvgMB7SF+wzvBwl+geWSm7Zwf+cVuME2FoxNlDdxUdAU/hSTvwGSZ4VNHGS7Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832644; c=relaxed/simple;
	bh=9cgfIJPo13nVcJSIDHHqC8F3QDl6D0/+VyXTs6soU+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cuemGSFyfD/NwpfI5xu8O8sScuLkXuVjEWtkSj2OAnG9QCOY0AUqnFFcvQMyrvAsAWmo9rEZpChCXPyPcS/wFIRGKkD40L5es01iCBqsSed0jPt398W/oHQ8IQfaLlU0GubaYdlz/UgxbmB15YqwC74S1feYft5mAqGzsRTxMKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ec0MaavF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S8IjUa026812;
	Mon, 28 Apr 2025 09:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNVy6x5tCC2ATkH3o5b/ImkuBnPR3ltvMGsn9NYEp28=; b=Ec0MaavFpwfCxSGf
	JfYip5+rPwnCAzQokKi9z3kn2C/Nr9+azSLivDpCfa/DT0ZzqTHQ4mq+zU/vmROR
	SShVIVZOYwqPA0efUdh7E7RtXh1K2qwvlaDHDQtO6ODGcVChDveYM/s3Mr7aqQBC
	iIDtIyk11ZIYx1MlxWpd0rbjSKN7AtrZKciMgJmxnl8c0fGU4gaI1AgUVqGGO3SW
	ge/q1fPCGJesuYTxZfWpAgw8qXpSYMZxKXHp2D2AbbohUsw5WtdeprPek0ZOIphm
	MfJs0M6aDNK3SS4ro1fbdEZcG7PtWXMbbtMdllveb5CpYPr53th2R2veUo+az19M
	HenRVw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb7fnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9UcYS007291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:30:38 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:30:32 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 28 Apr 2025 14:58:58 +0530
Subject: [PATCH v2 10/23] media: iris: Prevent HFI queue writes when core
 is in deinit state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-10-3a6013ecb8a5@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=1349;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=9cgfIJPo13nVcJSIDHHqC8F3QDl6D0/+VyXTs6soU+w=;
 b=o8culkfFeeJrsFnRQZo3+V6rRx0qN0i3aXdVn6FnA6GYl9pmaKADOPrE8GScNaMEFqtku9EIE
 hvhM/aM/F6uAgNiZpuXDSUW+8/l3qyp8ZDoA3nrYK+IxwBamT1k9EQp
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfXwM+XjtgXoDW/ KeGsMgraGZpidQO2o3YmXYW5Z/RW8ReSOhnAZ+bIAcKpP/zB8/rVRNm4pVVEuDnKVNB01FCflnA HGVtjlxpfCL9OLxuCgxlsAJbBgVNyp0TyYfFAt/t9tpoTDQKCtupxtXKezk5PpzwhXrx11t7enI
 fDbEz+Rhri1ukP53XdvtOU8FFg/3xzlBgJiZpeGTJgc1shUb6p5DzO4LYfy+yJMGvpINhSbqxbk YTaukLkD6u6zgcFJdH2Kw1M5MZvC/d2taAmdPTc84kG/ujagDzFf4OyuwwSPpX7CQt834TLJIYX aR37pQowBuPYVzG8foXBhfMrAb3Y0UmS+w/1LK3tiu1oxJOiord6wTo0PSJqENX4EDwJrBTMqb+
 rS5fXHzDn2jbSrwU/hM9Io34UYrXPCNgsToqQ5mF4QE5+YYeveYbG9MXFRO2opsBCCyj0Z1U
X-Proofpoint-GUID: gQcF4MDPHFRw6EdgLLAh_0-qoZau1kBj
X-Proofpoint-ORIG-GUID: gQcF4MDPHFRw6EdgLLAh_0-qoZau1kBj
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680f4abf cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=TuTThgpRNTc_Uxy4z7QA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

The current check only considers the core error state before allowing
writes to the HFI queues. However, the core can also transition to the
deinit state due to a system error triggered by the response thread.
In such cases, writing to the HFI queues should not be allowed.

Fix this by adding a check for the core deinit state, ensuring that
writes are rejected when core is not in a valid state.

Cc: stable@vger.kernel.org
Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index fac7df0c4d1a..221dcd09e1e1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -113,7 +113,7 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_s
 {
 	struct iris_iface_q_info *q_info = &core->command_queue;
 
-	if (core->state == IRIS_CORE_ERROR)
+	if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
 		return -EINVAL;
 
 	if (!iris_hfi_queue_write(q_info, pkt, pkt_size)) {

-- 
2.34.1


