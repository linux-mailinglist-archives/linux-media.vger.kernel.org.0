Return-Path: <linux-media+bounces-28514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45EA69E82
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 03:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40F9816A05B
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 02:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8BA1EB1BA;
	Thu, 20 Mar 2025 02:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LUK6Z/7T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C711F4CB8;
	Thu, 20 Mar 2025 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742439303; cv=none; b=ROpV9Ex+3mcOPVmynYUcGzSOD6ZrPSHQMshG1mVWRpLAxXP+jdSM2cH+7lC67/nxijYIFbu4s3HKrw5B9XEPwnr6DDHP6Hv1ytlkAxz8yoy+pma5ocZS5ZL6dqzmrEcOSjCyZP2yqeOZhSlr1YXpvpHqvn1Su7JOKnDQdKR3GEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742439303; c=relaxed/simple;
	bh=A1brQis16nZ9o3vsMAfs3JsL4AlhNDMfC862dfVxYSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Vey95JiyuXqHoOeV4ghblokT0fyDIHsjSMHnCbwTzPqvH5E32tfYG2DGUOixwE9uJktx74sfd7LGLUOLLYwE2aC492dqQWIIz8aobRH9UcUHEbECRakuTt5JXDikaKPwn1l+HPkBJW+tadhPREkwt19J2D7ZXgpUes0ki54MRUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LUK6Z/7T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDcgoD004533;
	Thu, 20 Mar 2025 02:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvRpw5/p1wRhxRb/Wq9bJ+aXHiltMV8TycThADNNo/8=; b=LUK6Z/7THNUqOm4R
	t6CnxFd6ywyKmYYclZNxnkmCMloQY1qfGm8kFECa6FZpfFjzAwKIbMKck6P5eHS+
	GDR7HW8PU/7BOQgQC+RHk8vAQ4fDUHdyTkLR3IOJf0grfP3v0bh+cF2cc9L91+vK
	y7OUbR+4W0rMUbfuXG9vflUstC8aUNhcodLOhsb2SHqPDyGtFXHc7A7peeLJtCQu
	qBOgiOfUTY6CIdDsEQxgFdH8yAFQzc4FErDLPucD8v0WnemvZiDRW9V8XT8Mg25V
	9CaoEssNyPkPpYaY4d0yzbyEav9yp8Ihev9HhgYrilmbEuEsVLfspGA/nRNImHPq
	u1XlOA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx7ayc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:54:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K2swgC012909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:54:58 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Mar 2025 19:54:54 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 20 Mar 2025 08:24:31 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: sa8775p-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-dtbinding-v2-3-8d8eaa4e76cc@quicinc.com>
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
In-Reply-To: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742439281; l=742;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=A1brQis16nZ9o3vsMAfs3JsL4AlhNDMfC862dfVxYSc=;
 b=WNv5UW3owAJcIRTcnbx6IXBBFV+wfwpnX+H2Y7pgcBqAchqB3q7ybPuyn0ZRey1+c+ItjIBHI
 kAuTO0Jjt+QCcacqj3H14s0UdQwRhBQBoZYEyLrsxgMYmTeWaP+ZMOd
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8VdaDKxHN2QTLx661CiaeX2zO9YdOqbj
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67db8383 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=bnThFhelgDCT6RDeMd8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8VdaDKxHN2QTLx661CiaeX2zO9YdOqbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=791 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200018

Enable video nodes on the sa8775p-ride board and point to the
appropriate firmware files.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3b2ded15fc3265ac8c26b14473b618f6..2b3d0876dc7f270dbd24081b698ce80e2c27a174 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -1038,3 +1038,8 @@ &usb_2_hsphy {
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
+
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
+	status = "okay";
+};

-- 
2.34.1


