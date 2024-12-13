Return-Path: <linux-media+bounces-23369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B989F08F0
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C634A282BE9
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD881BB6BA;
	Fri, 13 Dec 2024 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L4AwSnpJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8051DF724;
	Fri, 13 Dec 2024 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083867; cv=none; b=F28eBgtc2+TgJ2Rxr79ARo2sMgcyGiXc9txXBxC3jUjknZEo6ZJVZ42scfS1Jd1BnTyq8olx+HoLs7Rr5enbCNMw4oDl46I/nva9JqS8DsW97T9acy9hy6uiJVlzPHgzPQQsUhvf5OeY2V6GCs9f73iTKk6HIWFNZ7LL5O8Y6zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083867; c=relaxed/simple;
	bh=KwWEWFCB5ShOc5u4wAgQHgytmXEGoQcKusA3At0d9GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aVH8RxcQcLBBqFxa3lRBvJ67VRztZSPv2C+QYnOxgifOctfcX6vnIgAfICTNfWojprhQ8EPflHixT0NV4TmRZGykdCjW8FhGGUTaqtBwEiri3o4VTF8HDWq6Bu6UX42wb2EfwhJejqgdAgblilZWFc8k6qFI9j3qGgwcGXTjqdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L4AwSnpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD1Vq8J001463;
	Fri, 13 Dec 2024 09:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SElXYnGf35AatXlxXldZcr44qubrPnAWZUpZmhsISg=; b=L4AwSnpJV3FowTuk
	sF5JSjzO1lLHQtbLllzL3FsRv5Dbj5YJDOOO/najpE3eaYkx2eFLqFgFqVs3OVtv
	BB6l/3blW3EMaoRSAr6+7eqXbxcxzXR52g7SVyoiYhGVx/JAvIvk2xBNz+PKYgzS
	cgsernB0oyx51LcV8afFkV5JO4r4I+1eF+lKj8AhLv5B+8ItsDxyJEQgF7NJQ7GB
	BAC9OJWP00PA0l+w595f7ycXAgISCleU3Q8I7LgSfZWLo/x5jtpXZ9kAX1v/yHu6
	iuDr54j1JXzyxskqZg5wPz6vzvxuUNgyrKYT9RDAFlHAPUsilqXTBphw7BsXWQyc
	63vm5Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes4cky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:57:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9vdSt016969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:57:39 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 01:57:35 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Fri, 13 Dec 2024 15:26:49 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: qcs615-ride: enable venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-add-venus-for-qcs615-v4-4-7e2c9a72d309@quicinc.com>
References: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
In-Reply-To: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734083839; l=680;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=KwWEWFCB5ShOc5u4wAgQHgytmXEGoQcKusA3At0d9GU=;
 b=ZiQaIIEmjgrVpjfXtPxAIoMt44O5pgBIH/00mAzebjp1Hb2KryCBYJ3hr5gDNsSm+WSa7uj96
 r/Pm+XANo0kDXOli5HHneGi5DbXwXs6Aj9ipN4YQwYyVaxmcqnP3/CP
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HHa_j0bMl6_KD_p64ulH_iovaJ3LtY22
X-Proofpoint-ORIG-GUID: HHa_j0bMl6_KD_p64ulH_iovaJ3LtY22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=559 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130067

Enable the venus node so that the video codec will start working.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index a25928933e2b66241258e418c6e5bc36c306101e..de954ede27f0942397d982f9aa725e59a8de9657 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -237,6 +237,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&venus {
+	status = "okay";
+};
+
 &watchdog {
 	clocks = <&sleep_clk>;
 };

-- 
2.34.1


