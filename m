Return-Path: <linux-media+bounces-39760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA56B245AE
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04026188F421
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92632EFD88;
	Wed, 13 Aug 2025 09:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HaC2JQW0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46D62F49F6;
	Wed, 13 Aug 2025 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077920; cv=none; b=GCVkeHytT4ysAd7ETq846onjz4ozjnoW56Itv4jNfvo7zTfWIq9Eda/ELrYZx/EvGkUg/TFBe1lRcA1t6uJOaR+gMJZIb0OxNA/KtcdkJ4GFJMOA3YtYTZWawI1EWFXAcMNRnAOANuW/pLI+kwxQHFU0GZyqBVfv6U8h/QpCNnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077920; c=relaxed/simple;
	bh=6lnoT2bxuSitJvWa8XfZ/AuaHSSJ9uP6CosWqPhEWIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kBd6vvJyO2j+nMEOwuqtYySxhNRk+m/yRiUS0AHSO2zvPjtffOdUDG4m3lyujtERVHP5S5THpM3E0VoqPCvb1WejtXh/2cTXSlstuREvVWdnPJlByGu6WRkuIBijXO1Cuo1/X5f8d0N/UcMFYp7fqOmPC4uF4xNzG4YUNewpIpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HaC2JQW0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mJs6003971;
	Wed, 13 Aug 2025 09:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShDpKRPOdED+3EQK0Ut0gkcrHVmGm35whpFDh+hbndU=; b=HaC2JQW0ILK3lu2E
	aH8sHMn/xDughBf3wNbQPFSCCE7c0kmXfE97TRlGBPkxm/snnyJ3wvbvcj1xv64w
	vowp0Be38cHpY9vg9JeZRlimQ4g2SLhvSrpwrVtGOxhSNf0xbYloM8gMeBl0MNmj
	PyfaQwC/0AsQLs2xZIffVmla3D6Zs6OttAyBsQXBte9n23hL6crrfkDjatrfgjYs
	m73nN8VIxgst7krhiu8itPzl70VW1hOxZeVI2AvDFIOY2T30zmcheZEBp3u2kMrL
	h4ufOhpOKCqpkcqSeeQpapJYC5KgQox6NzI3saDTH/fbbj3nYf+Wwq33fvBgTAn9
	PZzLIA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vp74u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9cXU3030691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:33 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:29 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:07:53 +0530
Subject: [PATCH v2 03/24] media: iris: Fix memory leak by freeing untracked
 persist buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-3-c725ff673078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=1425;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=6lnoT2bxuSitJvWa8XfZ/AuaHSSJ9uP6CosWqPhEWIY=;
 b=suVRoLv43UY7RFEwQcoJhIyg3EfD5NnH2FJ4WkCWhnDgQJT+193gv1NejyAX6DQ5EnarH5Zdt
 WooiYCyqmInA0O24pGI922j0xREC5UMDPh95h0aTc/sZJW6IPa6jtPs
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX9GHLLVtIzNxX
 fX/VPgtLDBsm7Ukl4zTGFBed//lhT8yDekQJ4GoFajvmnaSr+bnUOHgJinsdzpeV/IRtztvhT85
 /UuA2XKV6W+qx32a49NRCPQwqbWTgmZ3h1tOBSPyaLr6hQMIafZd9yLblF+EMKW0Fv9c1LbFk/o
 vxU87pz5YF6xg9RkbAkyEDpWgboMlqEv8CK0sB/3A8aizo7fWXbCINIlk4SFVqPonZwM7hzOAnc
 hhtit7x3BJ0BozZrRaSyJqn+MRbrwmy9UonuyyD1A9CTcWJ/vCqE9PahtvuAyJnv8Ek/jFqFrBL
 AEXYc9Hn0zFtJLdzM9tmoXW06sFLoPYUnO4fyL/oEIsINFdT7n1fxwemlfBXSlY3iuuXLPWGuuH
 XFBc4IZK
X-Proofpoint-GUID: J6-SxP_jm4O3lREVx90jN7RMLXEEMhX0
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689c5d1a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=GUxkLdxIJ5orBtzUV8IA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J6-SxP_jm4O3lREVx90jN7RMLXEEMhX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

One internal buffer which is allocated only once per session was not
being freed during session close because it was not being tracked as
part of internal buffer list which resulted in a memory leak.

Add the necessary logic to explicitly free the untracked internal buffer
during session close to ensure all allocated memory is released
properly.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 6425e4919e3b0b849ba801ca9e01921c114144cd..9f664c241149362d44d3a8fa65e2266f9c2e80e0 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -413,6 +413,16 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 		}
 	}
 
+	if (force) {
+		buffers = &inst->buffers[BUF_PERSIST];
+
+		list_for_each_entry_safe(buf, next, &buffers->list, list) {
+			ret = iris_destroy_internal_buffer(inst, buf);
+			if (ret)
+				return ret;
+		}
+	}
+
 	return 0;
 }
 

-- 
2.34.1


