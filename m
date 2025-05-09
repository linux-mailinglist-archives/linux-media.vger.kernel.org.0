Return-Path: <linux-media+bounces-32095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF7AB0D74
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8306A9E4077
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B51E27AC3F;
	Fri,  9 May 2025 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o3uIjo5c"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA1D27AC25;
	Fri,  9 May 2025 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779996; cv=none; b=bVh5lmdzX/eaz3usi8sKOSNHSL73jZ658Jt0efCwOyF/+/o/8Kq+h6WQJ23DhJgYKw6VkBWSUmHEZBWIIPw4NGMgJlkQxcBR8FdPEWFWn7mPQWkGiEk7HSxUrp2Ll4Mih1FDiL11q7oMYbujlDY7EZuyVUGVV5WdnuM0gUwZy10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779996; c=relaxed/simple;
	bh=9K88b3NBjGh8PvgF0Qrn9R9ZJUs8Aeig35evXgrw5rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=B0Ra0ExkFomY24uK0TL4UCDikHgCs+cuN2xMhU82kRn+HnoJhNkqBTG5C3op6+b2jt/ZmIEDF6nEpyJjkfjtR+pVNIydm9iG2THyL4GABKGeD42/lXMF5RW/W6dC903oO8zHDXSLUxknPJ+zLBg5rlGdP3UN0VphDUKP/hVH3OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o3uIjo5c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493VEFT009212;
	Fri, 9 May 2025 08:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLP5vXimpOxacFrWODUwy+SckQzf4gcsjGTj1hOQ8iA=; b=o3uIjo5ciXOAW6Zi
	Ts3fjWzzaoEXRjVLg5NBvC8ZX4PG7tFhitpDri5dny7sdJbtRpheV/7M72F2R7rJ
	AF+kKuS/DVSSHZVNb4uRviZ5WDjAtih2lXU5wZ1lONAWx43Qre3gmIp2+/Npscf3
	H6t4m/0Cs0ID2xVdXk2hm2Q5zZZNYA/rCix2Y2/PG871sS1I7NKGBHp0b9wjNdEg
	3gUuNZNIAALSLlaijldZByRMbTnPQZo94C9Bkvw7ZsPYeq3MPGJX4QpgvJUscFne
	XS6XNn5oK83AzqjkdiCUNoh6CSWli1Gxdn+Sz6WshT0JEBxJ8qUS4QPKBdzz1PSe
	NqDRDg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpeuw21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498dnFl031618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:49 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:45 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:56 +0530
Subject: [PATCH v5 10/26] media: iris: Fix NULL pointer dereference
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-10-59b4ff7d331c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=1843;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=9K88b3NBjGh8PvgF0Qrn9R9ZJUs8Aeig35evXgrw5rA=;
 b=rZ/2TJ4SkM8sn6s35EsPC1EXvUdNL0dpsUbg0Z/z7PlHboqcvdTKhOrHhNP5IOU1Q69g7b3cl
 C5w8oQnsfuMAfiof5iCJGBXwPem56JfWoa5XZaFPERBjfJnovtJtQqM
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX4aSirg3bPTc0
 nrXbkfC92rENiePvp/TSPo9vE9B6TL+VynOmtKuQzA2/wt76sw7P9anWgAr8DpIfGH8vU/vfXQy
 5ghCrdIx7LiGra8lFJa5bvEDDHxGGMRmvEEkEmFfBDiiHajQTUAKq7n8OePhZWWBBPD5KtZ951f
 E61cmV8tDyLDxin+iA0HS7QCfPcdRoSQCxhT+qYuKkNcGeI8BGwmN1JZIIK6ysM0mH/ksPQzQYz
 JbMnE8/h9jSYV2JOoZfSxNPbSoB/7qsGv6pasy90q71E4mekeDBQxNp0zEW/EXnZlHQ8nYwY3jj
 VexwjPuC0DMNs09h4hZgbeuPvf6nLC9WGFLavbfkb02HsCUYFeicwTeHDEfR00OST3U+JDURgqL
 w3upLB1uU75dXvRcH8UYifjzysRD/H9Cb3EW2yZF5xPlzlm2lZKX/9Wwwic1HJcJXmOWBehu
X-Proofpoint-ORIG-GUID: Xh_amKlPwhBsIiEzNGDOG4XrhlhI43e_
X-Proofpoint-GUID: Xh_amKlPwhBsIiEzNGDOG4XrhlhI43e_
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681dbf56 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=_9w-BpbxiFVjEEnp1AAA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

A warning reported by smatch indicated a possible null pointer
dereference where one of the arguments to API
"iris_hfi_gen2_handle_system_error" could sometimes be null.

To fix this, add a check to validate that the argument passed is not
null before accessing its members.

Cc: stable@vger.kernel.org
Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index d1a2a497a7b2e6a1a810f2acf7d8d6f332d3d63d..4488540d1d410b58af02ab82a3238ccbe40f7093 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -265,7 +265,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
 {
 	struct iris_inst *instance;
 
-	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
+	if (pkt)
+		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
 
 	core->state = IRIS_CORE_ERROR;
 

-- 
2.34.1


