Return-Path: <linux-media+bounces-30871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8EA99896
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8251B81DCB
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E36B29347D;
	Wed, 23 Apr 2025 19:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TK7ya2jV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E95293469;
	Wed, 23 Apr 2025 19:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436851; cv=none; b=Af+l09mo5m62gQ6dLt77scl09qOppgoCfQe6Z25nP679L9wX6BeGPiDJ8QSjglCbmsCjDQh2IKqspQfZ0a7Y0CJvnFTfG6RhZ+9/pbETe3hYvKYnhwYgj2y9TzajCoTmco+3kpj+KIJ6SHOJqXL+BrFzCtWlHVCyUiuPzsmOYIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436851; c=relaxed/simple;
	bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LwiqTu2M4gEk91TIdIYkOg1/KpGYlqKeQKAD+k4VsWY/CC9LTcTMe5hm3REGQ5n236LTJTnrP92okBDD4vx9H25ctvtxfNZrFsADTVk9OE3INDjTPtWXE+HseYY3Ry7YvP/VTOgdLdiqbLEkyJUKjL7RnKWf74bQKhWFfmYIRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TK7ya2jV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAmZGR016562;
	Wed, 23 Apr 2025 19:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSy+SgCL5lGpQjeRIMvTtjJ3CYYax4gjcpMJGDuJbbw=; b=TK7ya2jVcDbxKhl1
	cKOJv2tZU6XMbHAEJhJkJNEGK7oqwr+d5RgWCVzgObCR+xiSRGSd59hfU6SZ7e7v
	ZabpExtq6q2earPEOdr17bNRXoACJhnoooF572Lf4adCveuLO9DLsAs/fYHYsVEQ
	uwkdMPWl/lyYw84jz4B5LC3aV6UFx/7BfqlIvQK++2vsx8KmSMzoAOOzJbg7iJVu
	eUvSvPLpbf7XfFIcoJktZRem4WgkbypEpK5JwtB3bpRGdbwZ+iYlcoEiDHT360ok
	HoFMrFUHnKIIUI8AsDNj6PVXRyqGbkx7ZRmu6ttX9B92SqwDG/YnoJYSbh8csHZt
	dyuXpA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0b8g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:34:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NJY6Xk001030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:34:06 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 12:34:02 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 24 Apr 2025 01:03:35 +0530
Subject: [PATCH v4 5/5] arm64: dts: qcom: qcs8300-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs8300_iris-v4-5-6e66ed4f6b71@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745436821; l=696;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=U0w1x+8Qh4hnZgZPeV+lNb1LUY4ehW5wushCpVQ3K+I=;
 b=2E1cDKRqZW6EhhxZ2CoCJn2hG+IfC1c1eZ+6HARPC73ySjTLNlWv+iIwVs6efkzmxmXVfXXXn
 HhHzqivPcGQBxbxPGTgMaQVUXwDzgyBi9fL+lsAhX+LfXRioRVA+eNo
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: haNilK3kinl7RyQopQylMEgxSH1dntJO
X-Proofpoint-ORIG-GUID: haNilK3kinl7RyQopQylMEgxSH1dntJO
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680940af cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=HJafQcN7i5IhSkUYFLQA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEzNSBTYWx0ZWRfX1oqVuUtAQIA0 BZGUaTEZZP6Nmf61nLmeSvXBaIdjtm65RtNQjUYk8W34W5SdoLpHee51KXe1wZExi+c5VcC9duY MHg+ss9lb6BeowxpTvaeDhQT2wKae/HIKCvc7AZLtBPiNqcSPRyt0e0iBdkls1/+PCxFSPLYpBv
 ftFGAcRQnyregw7QB0W05axODQ7sGnU1wMbh2ytCE1aDIytyIIXnnlrXkXmWKGypQ8+H0aD9Po3 5E6Sd9qRoLvkgc0Y1qEkLUp3ASc/L0V784YgJMnRnE8KRyJwmFfK2BrKE71S8KwNBZeYG9AfMxj vHJhJyBNSbnl0YweYcn4n10XN0wC6wTZvG6edy/utFdlS2uF8S2363C9ALrZWjwRvALDAwH4kay
 dYWBaoaqGLBPI0OTzhZ8w4E3A7JT2CUTmAmgkcTALDsin1bu4c+M3rgf5iSBA+Vk67gFgAuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=845 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230135

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


