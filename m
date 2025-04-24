Return-Path: <linux-media+bounces-30917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2247EA9A6F7
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C29B7B1D69
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 08:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE5422A4F6;
	Thu, 24 Apr 2025 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aPLqnH8s"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38FB22A7FF;
	Thu, 24 Apr 2025 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484686; cv=none; b=Sc/cjts+vd6uzv+bLKurOC9VpcQfZJtWRimDvP5szAX8rnIrblRMtjbxdOv5kHIPMI8nxRi8MDfU4lQx/d5t1r109NZJ7vMZnyR+q5+z8DyogGldPClpFqkAEt/q/v4QYi87y38cTGPbVQZPhCEb1aqXI3gLakjx4CMo1lsH4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484686; c=relaxed/simple;
	bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ajmarpDULN6D/PZuPSVmkOt/p6G8kHk6VcukpzI72kitY3b2HuvVREC0Byk76HQkkAQn8WBcd9GI7KpS2861vTQmjBNNtm+DqdIvJ6X8eYw6UH63rd7xpk4nE+Geojd2GNCGrQLDm0AztZh5hhRlfa9nGy7Gsg+tSeQQAraWd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aPLqnH8s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FjHj017994;
	Thu, 24 Apr 2025 08:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSy+SgCL5lGpQjeRIMvTtjJ3CYYax4gjcpMJGDuJbbw=; b=aPLqnH8s8XEKd5xP
	BSUaNa99GTFzckUgJPt7wg1li+EzpbX1pmcL5a9pX/S1+gRG4GWwQ9+gdRY7FosT
	mU2Kma+oso/Jb56IHqFu6U0nn/lNRsDKAaYocUvBeQodlwbf0GNrvuSMb6ibwVmC
	SzWN7MCfUz2ggAUehYu1bDcvLJLtscpQiW3W2EAs9uGwqXqEkIQ6ugoyI6DQZ2+5
	W+H6d1acJRQ9hTjW69hkbcSNmfb1IM1SET8J2LFqmSCJNPNGJ+cblh/q3Z6KxdmX
	kG/MQN1gdQ1fEso3P0aaqIprkLadFkzqptB+66bQS+Kv4r3dWLTjR1lmk5Xtr4w6
	uYpxEg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh14ub5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O8pKdI019496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:20 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 01:51:16 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 24 Apr 2025 14:20:49 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: qcs8300-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs8300_iris-v5-5-f118f505c300@quicinc.com>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
In-Reply-To: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745484655; l=696;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
 b=5TCJ4AA3DHyeJAI43ijZ7Gke5z+zNJfFjKb/JOtS+frO3KDiRya/BpXv8UshJouJO1XSWeQzp
 RsFVVZxF8vbA5vxq0ghc9wbR2XGuwU2lzPEsMjNzsg7czdTi1g2dpEi
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xfelfvAx7f7kQtK9_y9_OowlWlPzkxGC
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6809fb89 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=HJafQcN7i5IhSkUYFLQA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xfelfvAx7f7kQtK9_y9_OowlWlPzkxGC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1OCBTYWx0ZWRfX+eN6HzzLHMiS qwgDHG1wuccPnzRE5ii4QXHideJW8APBXEb33E4Zg0lIpZ0lYlat+hitMHt9JyinprDM6YK9Ywy SJckQNYVSOO6klY0a7zkS2PP/vYSTvUJ2+U0Ll+fFA1I5mXRSMpW7nLEzFPmlQPMJmTCFVCwT9H
 4Gxapn1QZvCp3R4cFi/lQTIgiLKss1bgD/2WZ4QYvwPZuTRB6AXRGBdGHBeL7y7HuwQwV1mzCZz Wq4EJbSuj83tj77zXWjXcHgXGS02wd0CC1wUuwnA+7HbPdN8MYXXR0VrWGRbnOWv5Fr4WRGwrqT J4tqlrHDLQzif8+JMgqa90I1iCl1RhiuYm8znkD+sczCYBVZC3BiKLSDIAVPxjTMf/cImxeiOFl
 QKynv/1EpSNtKsNw5zvnJ063oNVYlEBTUg17ALJwHUYavE0dcllkE7wBjnPiYmkulgOG7tIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=845 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240058

Enable video nodes on the qcs8300-ride board.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index b5c9f89b34356bbf8387643e8702a2a5f50b332f..87114a349fedd80296abaf3d2f5f284b5adbbdfe 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -285,6 +285,10 @@ queue3 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


