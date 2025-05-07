Return-Path: <linux-media+bounces-31901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F07CAAD882
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23FF4188DAF9
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8FF221FDD;
	Wed,  7 May 2025 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eA78N5v+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA3221FAA;
	Wed,  7 May 2025 07:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603650; cv=none; b=Agg9HZidbApTm1bFrqLiuwg2eoiVpgJf9IXM6AFMTVtE635pEkMwoM3Mq5VoS3mE3PekvpON+URUdIyvG/iZ0VP2gp7Bb5J+4zjL5jVj4NdL2B7C+3Zg7ZgNmaWugVpGxFN0Gh0I33zp+CpA6P5kyallrjnK2Wo2cEpaJgu98Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603650; c=relaxed/simple;
	bh=ZsppfXVYb3voj58waWNWKmIoItzq1GLIP/StKiBFnz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Piz4DtJ+WhLmWuMqGWoMUlWKhON35scUOeH7uw0x7n9c0lUsoSXWhWK9GzZiQaSKSJUXw35f8CGVqojjNBy97QYK/kXDRBVeKyPg7w/itcTaHZWxRp+IgXqigvlsC7Lapw672TtlRmqYDBYv174c1WNNxSoec13iuQCOmaZa6+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eA78N5v+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HgEh005104;
	Wed, 7 May 2025 07:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uMFc49K6MjvM0B3dfjCz5/YoSFwvk0jtZucxHTW2RfI=; b=eA78N5v+qJJi6Hja
	BJ3gPR6hnPuqrQGrwmh955/Wq6jnrcdf/iH6JWfe0HXuV0IOAcaMq2Q25fbqAW7P
	tu0HUURVxHHKzmqHduvDtnCgiMdOR/eb1iLeT7SrNcVTVOKQOQyWWJ8mTG+ufWwV
	gnSh3tn55GF/whWeBQSvedGqhOPq6fjBVqFYwV33VqNsokMe9An1DodWi5k7p1IR
	UoIEuygMv0JhklBVxqXJZ6tD3hqawJsWp70YlLev1uppQyhFJqlWsaDXlmVjsX8d
	2rIHxXv/UvaLLx/KCmx3SPVre09ZtboQRqlCAZayaWOhvnUC0DS3/88q8jC8TuHS
	7JAFpQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv4xhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477ehec019439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:39 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 7 May 2025 13:09:37 +0530
Subject: [PATCH v4 06/25] media: iris: Remove error check for non-zero v4l2
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-video-iris-hevc-vp9-v4-6-58db3660ac61@quicinc.com>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=958;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=ZsppfXVYb3voj58waWNWKmIoItzq1GLIP/StKiBFnz0=;
 b=S28YLREY5yl5cXjhD6fIBMTW5/QCwC5zRZmiLrcZENRym+uOtlgcVyVQ7WqJOVJ8mmN63bU0W
 SECRs7rx+ITBHRF8SsPjFgzSGrq7lWj07tbD49BupeLLHJMX22n3xnq
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3F70UAf_ip5iOnRKiljUp4wnpxi-MXAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfXxGdGwif3inq4
 zfCwdC5CqHq+sSp+Bb2ndgXDZSq1Seeq5UMiwTUmXxAyIbvnuFkMw5WuwBpurl/WtyVMhebHOZt
 IF6kbNbjnD9ulhDP0dfbycvDNQMx9qfhA0SmbkyU+6BGlF5RoGDNesGganhv94pgQ59Vj8Tc2BG
 1XNVGYHRrewuIlN/MU5cR/d41ztiR8t2QzGVowqtCkB3sbw4rdSp73QgN8B+Z9gVhIAJ4Gq79BO
 +oTKP6qnPoyy5RYCDyeDZO+qkg1f/tz7BLPA8kNMZh8/4pmlW/vrKK+I206l/8nK9tq7qwOrKkD
 D44PjDpGPBaKuXNSTW7JJAOaVnBUX7ibxee767jFr+8IP3uqpSzyU7suw+e8NKTNbUpL+xgcltu
 1Vrzewly69fL/xFXl2yztOk5QzQuvZTzmXmJqFe+ZLPRXXkFkI5lc4rKc04Vn5BM8/n01n6T
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=681b0e7c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=iyCdwB937AfhnT6krSIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3F70UAf_ip5iOnRKiljUp4wnpxi-MXAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=681 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

Remove the check for non-zero number of v4l2 controls as some SOCs might
not expose any capability which requires v4l2 control.

Cc: stable@vger.kernel.org
Fixes: 33be1dde17e3 ("media: iris: implement iris v4l2_ctrl_ops")
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


