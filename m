Return-Path: <linux-media+bounces-31450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13480AA4AE2
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 899E11BA74E4
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18F025B1D3;
	Wed, 30 Apr 2025 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JGCEzYGs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B082550B3;
	Wed, 30 Apr 2025 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015458; cv=none; b=MzRcJqW0qB6cVRZHrgKmFw//cmRV9EUP3Phed3ZrIGXVk7uIcbtGJ8CV5E4xLDKA2QBc3clayZ/JLoUajQRKg7uT4dUKuitioWOpPiro2VnVUWoLc9c0p6Jj9oyoPdUBZXsaW84d26w7EhJKqPfgaFqd/6lgAjVG432CApponms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015458; c=relaxed/simple;
	bh=mTMLc/grEsMk9tdWZaAjExvtqZMAqAYePZboVGY5WvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Z/KX8P+3IZRsnaMrCEZ/IvxvWyxzJa1G1NbbQh0k9lBG5sayDsEiIgUqbyJXM042rQPE2IveRgpsmd+sO4i/a33SyZwnDkyzkOlsjUsP8NNzJu7pBi6af3Q/qp7fqVl6EO38wRDUOyHlXc/ABWtHsZtvxoqvUfTMb9/prJgWi9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JGCEzYGs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U960io012214;
	Wed, 30 Apr 2025 12:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dR7JRev4UWJ18b/yknGbjv7JNxutNiQRsQw8n2kq/K0=; b=JGCEzYGsrZmKvrkj
	N+Jrg6OYbrAkbi3B/eQYD3WqWi0CVS/tAf3XGRUGjTXd9aOnJiggSBmbYfGhPvXh
	hofOmYL9fAbcE6SlpLdI/LrZd5zG2bLvTlfW7/gXZYVoMS8sp7vD7CLDKMXIeUwv
	zU3GkujOit2tSGPikBFbrRwSuBiQKr5GlO0bHt75Cxpoqo150zoKLQPiHCjYuDtL
	nf5Bf4uKZSjQqE3bL55IZ/HCEZUEoMoKKXEakxTP7Efc1zsNfXAd5E7U3M/G5z6N
	S1HwEDullypbWDcu2Qxg3v/8mWaDBDRx3Rgctu0OB94E07oIq3b5PlO6lhvxIwQd
	ZTUCgA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3t3j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UCHUin007664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:30 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 05:17:25 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Wed, 30 Apr 2025 17:47:07 +0530
Subject: [PATCH v6 1/5] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250430-qcs8300_iris-v6-1-a2fa43688722@quicinc.com>
References: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
In-Reply-To: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
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
	<konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746015441; l=1266;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=mTMLc/grEsMk9tdWZaAjExvtqZMAqAYePZboVGY5WvU=;
 b=TM+2zSKolSqY2eqNWFKqMIYD1e5KPbKv0ls0tWMpBPxWr3LB6b/MBbbe37cypfG2+4p+bFF7S
 p/C4wYXwndDBb7H/L1WRbzrq8EpKQFhyYXPtDMOyLvWf5DDinALZx3o
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=681214db cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=vMvmzzE8Xnitjmo8DM4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DSZhNsRxjkmzRZuCUdYi5GuBYITSvNuY
X-Proofpoint-ORIG-GUID: DSZhNsRxjkmzRZuCUdYi5GuBYITSvNuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4NyBTYWx0ZWRfX+ZCqo2H6TRcZ axOxb6O2ZyRTH8qktg+w8qT5oViK7cnv3E+nkXpsf5TL6/kxA4HULrgKvyzkpMLhiF/yOD9pbij fGhyQaIbyvVbqgsLXnXNAqZ1kmOOc3pew/BnxGjSSyMeOzdErNAfifqd1kFy4J17YrUOsLudnAf
 fqdKVyjjjGgwGyFCr6nVVXh/MBrP/xEGdJz0KbQU0ikDOcfD9+8UKGI9zPSNf2EDIZ21bqYXV1Z 9TniR3YfIyhZwKw8udDWvXKpJER3wxaYWcwk56dhNeESiyBcXp6GwVwqf8icuRTU8ga4zp8+b4P fF3xP55/ulV0itg5OUlsGg+g7h2H5/YsnxXYEl+2rkcphr5W2QXuSGKUiATznftwDFc8hP1+DJz
 /l4tDzwAlCpo4OPQFdlhgbhkVjIex/qCSz+Y1wQS47xHu1TM7bSUAkW3GflwlOjsJvhe3M9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300087

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
index f567f84bd60d439b151bb1407855ba73582c3b83..c79bf2101812d83b99704f38b7348a9f728dff44 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,sa8775p-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
 

-- 
2.34.1


