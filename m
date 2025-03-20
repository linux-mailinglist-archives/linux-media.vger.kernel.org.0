Return-Path: <linux-media+bounces-28538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D7A6ACD5
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 19:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79766189D095
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 18:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D901B22837F;
	Thu, 20 Mar 2025 18:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k7xI2OcO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2360226173;
	Thu, 20 Mar 2025 18:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742494075; cv=none; b=LiLv73o4A3PbZS3Ex0N34N0Nn1+n3hqMREGccpo8JtzW7+EdcJGwfzhxJPA2pVMc/ZUATwtHOHSlOp4m/ZJYW/JsVCIfit7pUCrXUEsAmMfvl1UdPUVBRzLsp1M+DRHO5MZavN+nh0OegGCO7VCYoGaBxNxKsIAq0g6OJKDIL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742494075; c=relaxed/simple;
	bh=MyYwYiUKfjKvtKRG1e57M8Jd9KMobIEzWzuYGkh2LhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VTZBPGN88irN7lCj8Uqn+2vxLkguzyjIr7l/UQxVApsyYhbJcbSmIcP4KOaMjP/itg4R3waIGJhJnyGPG5q32KUgpDGaqAQZME2yMrk7800LA1ECApVTS5rHVpQyENdM+tGNuKYr/2LarKNSZb5pkwEvCnkFro71efSJSEy0MpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k7xI2OcO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KEGkhv009820;
	Thu, 20 Mar 2025 18:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXKR3eljLFjx6YaEbWF1v8H/hd7o2Ij8ZFwALZ21R5E=; b=k7xI2OcOTBRlbv63
	TwmBzmRaosfzbs+GZkONHK3B9IKxtwoxpKBZZh3qHGQ4F5ZqdI04SNXbg4YBvaRv
	iLQYRiTDoyWPPSO18PnktnYboJ+hwPZ56W4/loEKGmLnQbD9RZ5nNXPOPW7phoUf
	FQkipB1VW/t7yeFEMzyr+Nk/IB/rSVAQJ1xY1b8aTvE5x6d3bISakjto+wNdAn2X
	tKnlGRiFMGbh/TozDghKbZ5pkvAhbwMS8c2YBqlW0d6+WjqvdNIy2BsC1T85vq3N
	0//zBpNjaEYZY7zFVsqD9cTvXZdu7i7oFAdGzrgyBo6caOud8F8Sp2P7hL+3EQLG
	2eQkFg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx9v9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 18:07:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52KI7oMn006941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 18:07:50 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 11:07:46 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 20 Mar 2025 23:36:52 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: sa8775p-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-dtbinding-v3-3-2a16fced51d5@quicinc.com>
References: <20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com>
In-Reply-To: <20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sumit.garg@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742494052; l=813;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=MyYwYiUKfjKvtKRG1e57M8Jd9KMobIEzWzuYGkh2LhY=;
 b=UcaIKBt5oR71TCWHPM85/AvX4F/PwttDwDs6k+LSdAvUSaLSKZRkHsFJfIltKfpndKNqsletU
 Hy7tHdcQIRCAY8d18FQZpSJ5CfzZ63NxsLu383pVfUEtWgstKoP7H5M
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PETL29jIOWlXFblKR90nLz1-Epsi0s-8
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67dc5977 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bnThFhelgDCT6RDeMd8A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PETL29jIOWlXFblKR90nLz1-Epsi0s-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=761 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200117

Enable video nodes on the sa8775p-ride board and point to the
appropriate firmware files.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3b2ded15fc3265ac8c26b14473b618f6..ec3fa2739e1df2d5aebee7184c15e996a71b4550 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -1038,3 +1038,9 @@ &usb_2_hsphy {
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
+
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
+
+	status = "okay";
+};

-- 
2.34.1


