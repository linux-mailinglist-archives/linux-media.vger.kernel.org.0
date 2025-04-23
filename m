Return-Path: <linux-media+bounces-30827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F596A9946D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E7551BC31D3
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BFF2C10B8;
	Wed, 23 Apr 2025 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fkO7wPfj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80FB29CB22;
	Wed, 23 Apr 2025 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422784; cv=none; b=B+cFmNCtU62tQZIjajxh5nzTi6KrbAJ3BkSx9/DYzPf4Usx5TYG/2x11AHQqcwpG4PLG9/cbd2sd4yNvNgeSspxR8fFMhhnwoIkmCTQSOYRMBT92h1NTtXmYEAckaA6emIl88mOfH89bnCwzD6J+4IQxSJa1blpnKvuW8sncKiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422784; c=relaxed/simple;
	bh=V04YZ2/T1y0NZ3inkq+TAL/HM9cflBNsS0K+gfyWlGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ufiCbmGPb0j4E6jVqQbYmvOxn3CxqQJX/6AcLe4MuohEo2ngsYsB27Xly1qLtIWPJzODuNp1wOQcefoaiA25k6QIJL5C8RKVUIYNuY4cJ37u92CUqmTnlyVjXAnp9O5SaTpuHWHUQEjGWbg3Bgqe4WTDk5WHo49lS8sgHzPREls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fkO7wPfj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAfudC021519;
	Wed, 23 Apr 2025 15:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7m8QTreG6EuwlNcda6u0pivsX7T9h8xYqYIUkoCouCg=; b=fkO7wPfjUhvb+Ezp
	y/cEmSgqyY1jj7vPfuhJjPbaOa8Q23aa2RcUIsrQTR3eulj4ZRTe+ZU6hFL2RnkM
	Unv4L+S2e0q5WAh2zoztSQgMjCLlP4z/WP67YB2SPGqYyk5TSYEfbNybCgtuC0Ea
	TXYWl1tLIsrhX8pc0kjsIvaFQfpF47J+6tjAkQGLJA0P1zV49U2JQ2CXdP3nmnyr
	bQXD42GERT1NQftVdW8EVCa/0O+fhLvjRpypFOQ0F4L/OJkMMYyR+0DgNjcnS0Gy
	LaZdYhVqwbnu8C9Wzj8YQWI1nfhILnhZSuCdol/fNL0lehwb7g1vXK+j4PAiHPbP
	D+gAGg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh22mcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 15:39:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NFddpQ029664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 15:39:39 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 08:39:35 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Wed, 23 Apr 2025 21:09:09 +0530
Subject: [PATCH v3 1/4] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-qcs8300_iris-v3-1-d7e90606e458@quicinc.com>
References: <20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com>
In-Reply-To: <20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745422770; l=1229;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=V04YZ2/T1y0NZ3inkq+TAL/HM9cflBNsS0K+gfyWlGE=;
 b=zfUQ7qie8R5r1fX1Z2GpuWyOUHJttRVjFbNvRjom5vOENB2SZFei19MMpXxdnfbrK8I3zb/o2
 +qWyW0LiqiuCGUOs6L0oT/a1VsG+PLawXJ2tfVZTbZ7KScdIn7ETgFr
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680909bb cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=vMvmzzE8Xnitjmo8DM4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Vo1hvs7lx8FZoOlHmpDPzPlq1HunzVYM
X-Proofpoint-ORIG-GUID: Vo1hvs7lx8FZoOlHmpDPzPlq1HunzVYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDExMCBTYWx0ZWRfX5jCzJ5s4ha1G Wcc28mh4jTVBOIxYsPiXrknL/OyfND10Tx17qnQnN6jbardGr8RnqgNEFB1gs68WhZt+Xxzr6a/ i5sg6hyWN6/z5csI8/4mF61Mhva+9IBLNQ3RVYPrJbOKmy8W4WV56ASJjY6WCvk5vw0PNDdyETd
 uTsCahRgGFHlziwc5CXOfb2dMcwymJLCI88Ltk8ZQH7v4THcCFyXID0VSkelY+W/8Cv6hI5hPMb gFXc09Iwkdq5yw1l+7zYwnn1/fj33XPKTtbMiPWitCd51vcM1NNKzILOaBZ82qNUIcZEy1f1owF 0tg6KaFzEKvRCAuKX1SMa3Eh47dz6EYMpUfBJGMmCcGLyBxChAqAv2u0VvJrGiiLmrNC6pRiMu5
 Shr4rWCcQvPspIdnbCGHyfiyWJ6QyipxIbPtr2hFQ+6dk64cLBUiJdldLEgBTk9x0jcsL0q0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_09,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230110

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


