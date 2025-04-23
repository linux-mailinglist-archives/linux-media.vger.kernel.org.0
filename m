Return-Path: <linux-media+bounces-30868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF7A9988A
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F9C13BB1DE
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FA629345C;
	Wed, 23 Apr 2025 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y8IyQkyA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F272367DF;
	Wed, 23 Apr 2025 19:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436837; cv=none; b=IoK/9lV4iVmoQGzBHNSJMFDlyT5KGdPLQhOkJ6hoxEstmA6RSuTKXGpGBesBEB6ah2mwWnqVWNdrad+0EAhSSPrBbW3lIPCgzZlztFjEUPOWfUo1+Zg2phldnMuVUb1PZuqguY2Xkn6HKRIbmiJqdL/jFQOr1aXHjs3NrGndcn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436837; c=relaxed/simple;
	bh=V04YZ2/T1y0NZ3inkq+TAL/HM9cflBNsS0K+gfyWlGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TU2Fi6uBjtj3dM6uM75Lax/TR23g8WZxf1AP92w9OSUMOipYJgm3Hu5bmbZT47VJBU4KoXCBQhj9qfYXNzKHJ0fXWbBqDJBnw893miUWCozMBLGwwqfgT38jZ0rHEq8nITvRQq46YPFmImlVp2t+wEtVualsGoWQt03kC2UjAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y8IyQkyA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NANghH022421;
	Wed, 23 Apr 2025 19:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7m8QTreG6EuwlNcda6u0pivsX7T9h8xYqYIUkoCouCg=; b=Y8IyQkyAHbIpiZhT
	YxXPBOfw34Z8/Q3Vxd8Uz866BqHW8rP45O+KQz4F0/e5bh1Ciw08/5FhKlpTBbGl
	WlLU3SydeQyx5hGq0qrQzEvAKyrFVzKIIGi0RehE9yz1oinaQAlyd0K1WOvJ+r2D
	Cb9yIvNLB1TA76qJby2BK/sNia4Pdk4vL2sZSsmVro48t1xUI1UsKv6Zna7Z/EAI
	W9knKcRHhtWfRAZTGoDUBMRgngTn72RHyfR8iXHZruFZ82o9g40NgN8mhoxd+BFN
	QfkyKQm33FBBIEzBTKV2rzaF4+y+9MbbVxm128qkT6lkwjjbF1UICYE9fWM5v+x1
	liGe0A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2b7q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:33:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NJXoS1021820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:33:50 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 12:33:46 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 24 Apr 2025 01:03:31 +0530
Subject: [PATCH v4 1/5] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs8300_iris-v4-1-6e66ed4f6b71@quicinc.com>
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
In-Reply-To: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745436821; l=1229;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=V04YZ2/T1y0NZ3inkq+TAL/HM9cflBNsS0K+gfyWlGE=;
 b=w5zSqbvSth5lFQNo2+daDrMGsM/UqOL4AjIljNDaHiJTCdOcZWGeObgCYVAch6QoEiRqplxUP
 8pV4zAbwpuhBHyxQqpSrqsFsllCylMX7TC4sUpLL2EzB17tVCHKUoVb
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bDDJQzXTRNGBA9s9Z1jUn9xTcdp1p7ow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEzNSBTYWx0ZWRfXzgtq4zJPcqCB 4l8uTWycDfh1XPnohIKU6/WBiVKBLdxM9tmhNM+ddx8/X7ly977EXrBRuHQrw08faznHs9qmWAV XZ9K+CqKpHvPIXUzoiqRMuJ3aQg3nCGtf12ntwIbzcE/0ZQUHjWo19TVdGK2tbHHsF5CGFuYaZc
 JpLzji7yUwySB9IF1JBim8EYSsegTL2pAVkFCcx3h3QxPzCYNL72N+sERLuvCjWO7bIStmXtHPX gZp44gMkEMbGgahAWwE7JjpxnFvqg/cDN9MiOYh1FluNx0IZqjoetjID9VRepfWMKPMtYRmjEws q6Jgph2a60eD/wnwoPGuVbTWekXEGap9u5Q7Dc0ncNka/G9UO3UfUexLswRkU2YcxwV3AsFn5JY
 vEdh6lciCfg03OxqyS9mPz3D7OZRIUGiKWMapuWnhMwydKNqu7osy319j5ZMw6at7QYLdvuL
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6809409f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=vMvmzzE8Xnitjmo8DM4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bDDJQzXTRNGBA9s9Z1jUn9xTcdp1p7ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230135

Document the IRIS video decoder/encoder accelerator found in the QCS8300
platform. It belongs to same iris v3 family as that of SM8550 but is a
downscaled version of SM8550. It has 2 frame processing hardware blocks
while SM8550 has 4. Thereby QCS8300 have fewer capabilities than those
of SM8550.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
This patch depends on patch
https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index f567f84bd60d439b151bb1407855ba73582c3b83..3dee25e99204169c6c80f7db4bad62775aaa59b5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,qcs8300-iris
 
   power-domains:
     maxItems: 4

-- 
2.34.1


