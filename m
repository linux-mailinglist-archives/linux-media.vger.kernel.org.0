Return-Path: <linux-media+bounces-21309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 411549C5840
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A83DB60FE2
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 11:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442DA1FB74B;
	Tue, 12 Nov 2024 11:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cTBLRwOn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EB11FA85E;
	Tue, 12 Nov 2024 11:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731412156; cv=none; b=TkACkfjoA2wJYKUIj1n+Qy2sdqTc9vxMfU2Gqwzlyo29dqGadTU6jp/mtBYxsVSEuMPzpITDQufKXavSIaM2VBDUyg6CBF3MAnObSD5iXz4GnB4MrkcZFyA5iFALPMS18ygijpN0gB/PLT/KgF4194ccbdAXkNtjwIOhmkJ4igk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731412156; c=relaxed/simple;
	bh=HYx2Ssi6G4xy4zmQ6EwnKL/0RzrjW6bmidoYIfWmtWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pp2JPtDs0pbva7zeWCDnptt8YU7EtOvg6ESkDdjh3VGF5v2+mz87G2fgBfv/YnzVO/3ChjMXXtJxmhY8Io5tuEI8cMaS05gBfvoe18WJgu95My0e7gLMH38Tmb9VYtzQMF70Y1m99RS82Oxbj6fqp1ZsfjbYjMEAU/ND1HQwvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cTBLRwOn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC1tIMp024633;
	Tue, 12 Nov 2024 11:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNH/IDTZxakgrflJYx1y1/z3YZ9A68RzinyXpAvjJxI=; b=cTBLRwOn1D1R7Eih
	e7DHas8mmp1lTn5021Z+CNf+Pd+ATAlv+134H3NEx6kV0jDtQfzA0YjRloY/2QlW
	iTmgI/m6NgK9hi9Q5niq3JAMTXebkhVHiZF2oPwUpBPs8PsMk+hGNxUgeROCq7Pr
	IRGFe35mM5FkA5V8xpOkFfUshtpTUZi65vN9yVfihrNQaDrvcmmVkU7mi3fVEq+4
	HxETeslSbDx+BT3sh889ZZ+/azVHCBRC8vvrXG83dq5vir7jje4dRd/BY8XFBpvO
	zilbb6U66ISv4ku1UeaY5y/fZ+3UGgUZ7iRBlZRt6+XJ4dNtG/5H7yJEcXUoAkvh
	L4cbxw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gky236-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:49:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACBnAm5024808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:49:10 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 03:49:07 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 12 Nov 2024 17:18:00 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: qcs615-ride: enable venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-add-venus-for-qcs615-v2-4-e67947f957af@quicinc.com>
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
In-Reply-To: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
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
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731412132; l=668;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=HYx2Ssi6G4xy4zmQ6EwnKL/0RzrjW6bmidoYIfWmtWc=;
 b=c/FhYjwNDQTeCuJ/cAt2gvtCcGia+/Eq4/120eATiqp9eVvEevWqUtcGllcmTnOVodW1JTpPX
 gmfMIqtu42LAxZ61gB2o4A61xozGXAgEr4cvKIWK4j2k+u6tU9qZHJD
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m_X0aD_BCEFkOtrVKt4_CMmNDOjSA4qI
X-Proofpoint-GUID: m_X0aD_BCEFkOtrVKt4_CMmNDOjSA4qI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=662 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120095

Enable the venus node so that the video codec will start working.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 4ef969a6af150933c72a7a83374a5a2657eebc1b..4a7bfffb7b86b21c412b16426019c9063368ca19 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -217,6 +217,10 @@ &uart0 {
 	status = "okay";
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


