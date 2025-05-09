Return-Path: <linux-media+bounces-32092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A46AB0D5B
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C44791BC85ED
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCAE27A10C;
	Fri,  9 May 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n5lGIegB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287572749FF;
	Fri,  9 May 2025 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779981; cv=none; b=fGn1CXlEEsgParxSEnluuQ5WW43TR9EOBrSdknchjdiLhhED2jI4E8dMzt77YK5yIknD2RHDffePi/zCUjlmrtHbjFmdEIQpuw0l2Z5r9ctwnYGZ893hq/cOBvYsU1YJx9F8Dn5ZiWlSvq0uxvwTsxFoozNyHuyz1j3XB4eh3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779981; c=relaxed/simple;
	bh=dUio6uHD0ioAcJX1rEVcBxYjJdnRABJMCLIT4YdO5FU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jwITd9ol0gCTSObgWhjTDw3eXIkjKh6oOSNEFoWQn3ozYZ+dreal+iP9bvq2Am3gPndmTA+WHgJVJHhIaXhz+II2j1E7KC7X5oFLCdKXUAHdR8tw/+d3cFfFc7HYlCC5A0xf5OteCHnRigJGxYpRU59dLrMurJcUeyEiP82JK/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n5lGIegB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548L8a1Y012245;
	Fri, 9 May 2025 08:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUM/M5rSmiKQRrpcSO7zeroBFx9RRvF9YfgeNpAo16k=; b=n5lGIegBSCOzPv3L
	d5vPiBrrjT1+MbiTUuZUuHX0nqLKLefw8nZkwI6XU99SEeKpN3eIVECoGS44kvys
	KgFqZ90HqS+zeE8MoPF561oExkVfvbKoIRRKPUxTJwoGH/r+rLX7i14IBJ8vfgJJ
	F82SpHqF2ziyiR/1URoWnbxUaptV5UVxhsN0qzc3nfziGk124sOUbPFxM6i/kMkB
	lAV1nmJxmm5S2C/d7cJefc0lW1yc6Ne3XGoGGmbujNtHcYGzgwdR3aE8yOV79XER
	AHytWHMznaLlhsAbhn/HdcTFDqN14jyiXMHiL+KrrDZzpGq3XMmpg5ZmyVfFtkFA
	5T9HXw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52u5ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 08:39:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5498dZ3N031668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:39:35 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 9 May 2025 01:39:30 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 9 May 2025 14:08:53 +0530
Subject: [PATCH v5 07/26] media: iris: Remove error check for non-zero v4l2
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-video-iris-hevc-vp9-v5-7-59b4ff7d331c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746779937; l=1242;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=dUio6uHD0ioAcJX1rEVcBxYjJdnRABJMCLIT4YdO5FU=;
 b=N9DRDkCQKgMrL2+eUJgojJ2D/Tq8VmZ5k/tG6t3NLDu3aBGuJwlLqumRzjUIgQE03dFqFIU6O
 XPt1aPiDBegBR0EHbJsjKiaO2aQz1kC/XSrvPj8H78qC1Z9xa8clk/i
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4MyBTYWx0ZWRfX/WWeMIDMZkX3
 gLE9HUlAtShg5okf/T8iyltf6g3b3N+vyv4M7zPdKJVROI+B9Bm6dRrp7Bc82BHcyNu5s5GnpHh
 OJlxLb0nWbCcz/uu1iihh7Ikoi8iiTpTjliKI6JwXHQQA/bPfeOD0egUixW7f9RGRlFKV+eh6sd
 SLZWFlcU6FKChgdL6K0oAVbbjbKzvqh/3eLuHbzsqUXEk8X5uhfSzcjG87htTuTqJUWmPVa4YlJ
 Y22+k9fvXv73f77fsEjK9m1btnXQzIcDkFpArT3QheYz2BoRAOG9WPHj1qA8x62IukS3mw7TDNJ
 ht4dNnQK6CPvy/E2aoH8WpKWEU/NNEGV1oqPxru2kblVxAePM8Nc0WvrvyUMRcTvSVt+XJKlePf
 7F8o7o7whkwBT3xrxsO6jM1l1yLHq2WtR2DNKc6+4Bwo6U/jqfi5zVVXMiV/Wl5DeFrTm0/S
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681dbf48 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=H48V7kcHFEvExAIw7t0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fbYdDSPEnoqoQj7YaZdIRUu4n-yc_E6c
X-Proofpoint-GUID: fbYdDSPEnoqoQj7YaZdIRUu4n-yc_E6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=728 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090083

Remove the check for non-zero number of v4l2 controls as some SOCs might
not expose any capability which requires v4l2 control.

Cc: stable@vger.kernel.org
Fixes: 33be1dde17e3 ("media: iris: implement iris v4l2_ctrl_ops")
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index b690578256d59e54c08b5442611a16ca0dba5787..6a514af8108e92e95993916b155425fa47422e93 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -84,8 +84,6 @@ int iris_ctrls_init(struct iris_inst *inst)
 		if (iris_get_v4l2_id(cap[idx].cap_id))
 			num_ctrls++;
 	}
-	if (!num_ctrls)
-		return -EINVAL;
 
 	/* Adding 1 to num_ctrls to include V4L2_CID_MIN_BUFFERS_FOR_CAPTURE */
 

-- 
2.34.1


