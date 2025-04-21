Return-Path: <linux-media+bounces-30627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE3A952FE
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5483B3174
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57B21DE3BE;
	Mon, 21 Apr 2025 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EC2xXz9b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941901DB92C;
	Mon, 21 Apr 2025 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246856; cv=none; b=Pn9776XAFJfZmzjFpsXD8qk99j6EWoSc2jaUdQWDvG+pKTDbBmh2ppPBPI0XgA385D3UIGfB7Dal0zZ99dsguwv26rBAI/g0QMwUMWzXXissfaikQjWi1zqI1GeoFvROIX4zXY5VjVvlXSz98Q188mV+RCF+UDCva9ilA1kGAAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246856; c=relaxed/simple;
	bh=QVHSXRSxgRAIyci3IMM5gY262f2WC5b5oC/fErjG73M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cDNObEMJeQaVCismD3+PssfEdZGlSRveOw4D2RMCoNWXX9Nv6dcW/wpACTjnUG4RAxzeyHft7vfm34rOQ7tZynXCYNyY6o9i2NIgMZQvr+4DCH9X2kCgtvb9pFCA5OUApwFBJo1En8b/JlPMXtOij5wxvA31HLE++4aT4D4GNKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EC2xXz9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LAOC7w002262;
	Mon, 21 Apr 2025 14:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbH4XjZwFxuODVOBvsGqeqOQCwo9CPYlufSn0drpqB8=; b=EC2xXz9b3xuq3aac
	G7B9Q+W7CTXs0I4dGlQO/b5UoQxxR9+N7YFXTufrL+rSPrxIRui6sYhaRYB5wnJi
	bG+tfF1VP/f+2r2vG00QP6W7Ebn3b7BmSgrbzKH7zxv3bjeeZBqKe9SdbFpO/fre
	gOGGllwrCg9x1Ih9Zww7n63G3jjD7YqkvLRo+XG+5JfP+rvNXr1KkweyiB4TMJXA
	OnAayv6WHcHUBXe3XlHVMZjDn4sbnoHLAniW76h8iyE8HcYUncX38xGe6j//7S76
	6ENtT61NYdqWLxt8Aq9dotHDJ7gdRHYcm/QqqC4pvbh6g8VvsRDuXEjoN4IFzzt0
	1Vr0dA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9chme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 14:47:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53LElUj9010855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 14:47:30 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Apr 2025 07:47:26 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Mon, 21 Apr 2025 20:16:57 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: sa8775p-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250421-dtbinding-v5-3-363c1c05bc80@quicinc.com>
References: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
In-Reply-To: <20250421-dtbinding-v5-0-363c1c05bc80@quicinc.com>
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
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745246832; l=814;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=QVHSXRSxgRAIyci3IMM5gY262f2WC5b5oC/fErjG73M=;
 b=fUEucUNnszb48rtlhc2wGxuBEhrxAivZ6Dsg8WIS3vHam/+oHxzdllEaECrCqBXSf09j9PIA3
 WTRxWk3Z2rkB0S5vEQCUNTw0ONafNuBGNAS6iC89059PJsj+U8I49dd
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=68065a82 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bnThFhelgDCT6RDeMd8A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0TJt6GjqqXU2z1A5-I89pJatIi0MtcnN
X-Proofpoint-GUID: 0TJt6GjqqXU2z1A5-I89pJatIi0MtcnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_07,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=764 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210115

Enable video nodes on the sa8775p-ride board and point to the
appropriate firmware files.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3b2ded15fc3265ac8c26b14473b618f6..bad141cb15e2fe51bb80b10906d9c7ef84e6d52f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -522,6 +522,12 @@ &i2c18 {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
+
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.34.1


